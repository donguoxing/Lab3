#! /bin/bash

verbose=false
fixtests=

if [ "x$1" = "x-v" ]; then
    verbose=true
    out=/dev/stdout
    err=/dev/stderr
    shift 1
else
    out=/dev/null
    err=/dev/null
fi

for i in "$@"; do
    fixtests="$i
$fixtests"
done

if gmake --version >/dev/null 2>&1; then make=gmake; else make=make; fi

pts=5
timeout=30
preservefs=n
keystrokes=
qemu=`$make -s --no-print-directory which-qemu`

echo_n () {
	# suns can't echo -n, and Mac OS X can't echo "x\c"
	echo "$@" | tr -d '
'
}

psleep () {
	# solaris "sleep" doesn't take fractions
	perl -e "select(undef, undef, undef, $1);"
}

run () {
	cp /dev/null jos.in
	cp /dev/null jos.out

	ulimit -t $timeout
	(
		grep -q "^Welcome to the JOS kernel monitor" <(tail -f jos.out 2>/dev/null) >/dev/null
		while [ -n "$keystrokes" ]; do
			firstchar=`echo "$keystrokes" | sed -e 's/^\(.\).*/\1/'`
			keystrokes=`echo "$keystrokes" | sed -e 's/^.//'`
			if [ "$firstchar" = ';' ]; then
				echo "sendkey ret"
			elif [ "$firstchar" = ' ' ]; then
				echo "sendkey spc"
			else
				echo "sendkey $firstchar"
			fi
			psleep 0.05
		done
		echo "quit"
	) | (
		$qemu -nographic -hda obj/kernel.img -serial null -parallel file:jos.out -monitor stdio >$out 2>&1
		echo "Welcome to the JOS kernel monitor (NOT)" >>jos.out
	)
}


# Usage: runtest <tagname> <defs> <strings...>
runtest () {
	perl -e "print '$1: '"
	rm -f obj/kern/init.o obj/kernel obj/kernel.img 
	[ "$preservefs" = y ] || rm -f obj/fs.img
	if $verbose
	then
		echo "$make $2... "
	fi
	$make $2 >$out
	if [ $? -ne 0 ]
	then
		echo $make $2 failed 
		exit 1
	fi
	run
	if [ ! -s jos.out ]
	then
		echo 'no jos.out'
	else
		shift
		shift
		continuetest "$@"
	fi
}

quicktest () {
	perl -e "print '$1: '"
	shift
	continuetest "$@"
}

continuetest () {
	okay=yes

	not=false
	for i
	do
		if [ "x$i" = "x!" ]
		then
			not=true
		elif $not
		then
			if egrep "^$i\$" jos.out >/dev/null
			then
				echo "got unexpected line '$i'"
				if $verbose
				then
					exit 1
				fi
				okay=no
			fi
			not=false
		else
			egrep "^$i\$" jos.out >/dev/null
			if [ $? -ne 0 ]
			then
				echo "missing '$i'"
				if $verbose
				then
					exit 1
				fi
				okay=no
			fi
			not=false
		fi
	done
	if [ "$okay" = "yes" ]
	then
		score=`expr $pts + $score`
		echo OK
	else
		echo WRONG
	fi
}

# Usage: runtest1 [-tag <tagname>] <progname> [-Ddef...] STRINGS...
runtest1 () {
	if [ $1 = -tag ]
	then
		shift
		tag=$1
		prog=$2
		shift
		shift
	else
		tag=$1
		prog=$1
		shift
	fi
	runtest1_defs=
	while expr "x$1" : 'x-D.*' >/dev/null; do
		runtest1_defs="DEFS+='$1' $runtest1_defs"
		shift
	done
	if [ -n "$fixtests" ]; then
	    if echo "$fixtests" | grep "^$tag\$" >/dev/null 2>&1; then :; else
		return
	    fi
	fi
	runtest "$tag" "DEFS='-DTEST=_binary_obj_user_${prog}_start' DEFS+='-DTESTSIZE=_binary_obj_user_${prog}_size' $runtest1_defs" "$@"
}



score=0
timeout=10

runtest1 faultread \
	! 'I read ........ from location 0!' \
	'.00001000. user fault va 00000000 ip 008.....' \
	'TRAP frame at.*' \
	'  trap 0x0000000e Page Fault' \
	'  err  0x00000004' \
	'.00001000. free env 00001000'

runtest1 faultwrite \
	'.00001000. user fault va 00000000 ip 008.....' \
	'TRAP frame at.*' \
	'  trap 0x0000000e Page Fault' \
	'  err  0x00000006' \
	'.00001000. free env 00001000'

runtest1 faultdie \
	'i faulted at va deadbeef, err 6' \
	'.00001000. exiting gracefully' \
	'.00001000. free env 00001000' 

runtest1 faultalloc \
	'fault deadbeef' \
	'this string was faulted in at deadbeef' \
	'fault cafebffe' \
	'fault cafec000' \
	'this string was faulted in at cafebffe' \
	'.00001000. exiting gracefully' \
	'.00001000. free env 00001000'

runtest1 faultallocbad \
	'.00001000. user_mem_check va deadbeef' \
	'.00001000. free env 00001000' 

runtest1 faultnostack \
	'.00001000. user_mem_check va eeffff..' \
	'.00001000. free env 00001000'

runtest1 faultbadhandler \
	'.00001000. user_mem_check va eeffef..' \
	'.00001000. free env 00001000'

runtest1 faultevilhandler \
	'.00001000. user_mem_check va eeffef..' \
	'.00001000. free env 00001000'

runtest1 forktree \
	'....: I am .0.' \
	'....: I am .1.' \
	'....: I am .000.' \
	'....: I am .100.' \
	'....: I am .110.' \
	'....: I am .111.' \
	'....: I am .011.' \
	'....: I am .001.' \
	'.00002001. exiting gracefully' \
	'.0000100.. exiting gracefully' \
	'.0000100.. exiting gracefully' \
	'.0000300.. exiting gracefully' \
	'.0000200.. free env 0000200.'

[ -z "$fixtests" ] && echo PART 1 SCORE: $score/45

pts=10
runtest1 spin \
	'.00000000. new env 00001000' \
	'I am the parent.  Forking the child...' \
	'.00001000. new env 00001001' \
	'I am the parent.  Running the child...' \
	'I am the child.  Spinning...' \
	'I am the parent.  Killing the child...' \
	'.00001000. destroying 00001001' \
	'.00001000. free env 00001001' \
	'.00001000. exiting gracefully' \
	'.00001000. free env 00001000'

runtest1 pingpong \
	'.00000000. new env 00001000' \
	'.00001000. new env 00001001' \
	'send 0 from 1000 to 1001' \
	'1001 got 0 from 1000' \
	'1000 got 1 from 1001' \
	'1001 got 8 from 1000' \
	'1000 got 9 from 1001' \
	'1001 got 10 from 1000' \
	'.00001000. exiting gracefully' \
	'.00001000. free env 00001000' \
	'.00001001. exiting gracefully' \
	'.00001001. free env 00001001' \

runtest1 primes \
	'.00000000. new env 00001000' \
	'.00001000. new env 00001001' \
	'2 .00001001. new env 00001002' \
	'3 .00001002. new env 00001003' \
	'5 .00001003. new env 00001004' \
	'7 .00001004. new env 00001005' \
	'11 .00001005. new env 00001006' 

[ -z "$fixtests" ] && echo PART 1+2 SCORE: $score/75

pts=15
runtest1 spawnhello \
	'.00000000. new env 00001000' \
	'i am parent environment 00001000' \
	'.00001000. new env 00001001' \
	'hello, world' \
	'i am environment 00001001' \
	'.00001001. exiting gracefully'

runtest1 spawninit \
	'.00000000. new env 00001000' \
	'i am parent environment 00001000' \
	'.00001000. new env 00001001' \
	'init: running' \
	'init: data seems okay' \
	'init: bss seems okay' \
	'init: args: .init. .one. .two.' \
	'init: exiting' \
	'.00001001. exiting gracefully'

[ -z "$fixtests" ] && echo PART 1+2+3 SCORE: $score/105



exit 0
