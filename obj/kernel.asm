
obj/kernel:     file format elf32-i386


Disassembly of section .text:

f0100000 <_start-0xc>:
.long MULTIBOOT_HEADER_FLAGS
.long CHECKSUM

.globl		_start
_start:
	movw	$0x1234,0x472			# warm boot
f0100000:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
f0100006:	00 00                	add    %al,(%eax)
f0100008:	fb                   	sti    
f0100009:	4f                   	dec    %edi
f010000a:	52                   	push   %edx
f010000b:	e4 66                	in     $0x66,%al

f010000c <_start>:
f010000c:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
f0100013:	34 12 

	# Establish our own GDT in place of the boot loader's temporary GDT.
	lgdt	RELOC(mygdtdesc)		# load descriptor table
f0100015:	0f 01 15 18 90 10 00 	lgdtl  0x109018

	# Immediately reload all segment registers (including CS!)
	# with segment selectors from the new GDT.
	movl	$DATA_SEL, %eax			# Data segment selector
f010001c:	b8 10 00 00 00       	mov    $0x10,%eax
	movw	%ax,%ds				# -> DS: Data Segment
f0100021:	8e d8                	mov    %eax,%ds
	movw	%ax,%es				# -> ES: Extra Segment
f0100023:	8e c0                	mov    %eax,%es
	movw	%ax,%ss				# -> SS: Stack Segment
f0100025:	8e d0                	mov    %eax,%ss
	ljmp	$CODE_SEL,$relocated		# reload CS by jumping
f0100027:	ea 2e 00 10 f0 08 00 	ljmp   $0x8,$0xf010002e

f010002e <relocated>:
relocated:

	# Clear the frame pointer register (EBP)
	# so that once we get into debugging C code,
	# stack backtraces will be terminated properly.
	movl	$0x0,%ebp			# nuke frame pointer
f010002e:	bd 00 00 00 00       	mov    $0x0,%ebp

        # Set the stack pointer
	movl	$(bootstacktop),%esp
f0100033:	bc 00 90 10 f0       	mov    $0xf0109000,%esp

	# now to C code
	call	i386_init
f0100038:	e8 80 90 00 00       	call   f01090bd <i386_init>

f010003d <spin>:

	# Should never get here, but in case we do, just spin.
spin:	jmp	spin
f010003d:	eb fe                	jmp    f010003d <spin>
f010003f:	90                   	nop    
f0100040:	90                   	nop    
f0100041:	90                   	nop    
f0100042:	90                   	nop    
f0100043:	90                   	nop    
f0100044:	90                   	nop    
f0100045:	90                   	nop    
f0100046:	90                   	nop    
f0100047:	90                   	nop    
f0100048:	90                   	nop    
f0100049:	90                   	nop    
f010004a:	90                   	nop    
f010004b:	90                   	nop    
f010004c:	90                   	nop    
f010004d:	90                   	nop    
f010004e:	90                   	nop    
f010004f:	90                   	nop    
f0100050:	90                   	nop    
f0100051:	90                   	nop    
f0100052:	90                   	nop    
f0100053:	90                   	nop    
f0100054:	90                   	nop    
f0100055:	90                   	nop    
f0100056:	90                   	nop    
f0100057:	90                   	nop    
f0100058:	90                   	nop    
f0100059:	90                   	nop    
f010005a:	90                   	nop    
f010005b:	90                   	nop    
f010005c:	90                   	nop    
f010005d:	90                   	nop    
f010005e:	90                   	nop    
f010005f:	90                   	nop    
f0100060:	90                   	nop    
f0100061:	90                   	nop    
f0100062:	90                   	nop    
f0100063:	90                   	nop    
f0100064:	90                   	nop    
f0100065:	90                   	nop    
f0100066:	90                   	nop    
f0100067:	90                   	nop    
f0100068:	90                   	nop    
f0100069:	90                   	nop    
f010006a:	90                   	nop    
f010006b:	90                   	nop    
f010006c:	90                   	nop    
f010006d:	90                   	nop    
f010006e:	90                   	nop    
f010006f:	90                   	nop    
f0100070:	90                   	nop    
f0100071:	90                   	nop    
f0100072:	90                   	nop    
f0100073:	90                   	nop    
f0100074:	90                   	nop    
f0100075:	90                   	nop    
f0100076:	90                   	nop    
f0100077:	90                   	nop    
f0100078:	90                   	nop    
f0100079:	90                   	nop    
f010007a:	90                   	nop    
f010007b:	90                   	nop    
f010007c:	90                   	nop    
f010007d:	90                   	nop    
f010007e:	90                   	nop    
f010007f:	90                   	nop    
f0100080:	90                   	nop    
f0100081:	90                   	nop    
f0100082:	90                   	nop    
f0100083:	90                   	nop    
f0100084:	90                   	nop    
f0100085:	90                   	nop    
f0100086:	90                   	nop    
f0100087:	90                   	nop    
f0100088:	90                   	nop    
f0100089:	90                   	nop    
f010008a:	90                   	nop    
f010008b:	90                   	nop    
f010008c:	90                   	nop    
f010008d:	90                   	nop    
f010008e:	90                   	nop    
f010008f:	90                   	nop    
f0100090:	90                   	nop    
f0100091:	90                   	nop    
f0100092:	90                   	nop    
f0100093:	90                   	nop    
f0100094:	90                   	nop    
f0100095:	90                   	nop    
f0100096:	90                   	nop    
f0100097:	90                   	nop    
f0100098:	90                   	nop    
f0100099:	90                   	nop    
f010009a:	90                   	nop    
f010009b:	90                   	nop    
f010009c:	90                   	nop    
f010009d:	90                   	nop    
f010009e:	90                   	nop    
f010009f:	90                   	nop    
f01000a0:	90                   	nop    
f01000a1:	90                   	nop    
f01000a2:	90                   	nop    
f01000a3:	90                   	nop    
f01000a4:	90                   	nop    
f01000a5:	90                   	nop    
f01000a6:	90                   	nop    
f01000a7:	90                   	nop    
f01000a8:	90                   	nop    
f01000a9:	90                   	nop    
f01000aa:	90                   	nop    
f01000ab:	90                   	nop    
f01000ac:	90                   	nop    
f01000ad:	90                   	nop    
f01000ae:	90                   	nop    
f01000af:	90                   	nop    
f01000b0:	90                   	nop    
f01000b1:	90                   	nop    
f01000b2:	90                   	nop    
f01000b3:	90                   	nop    
f01000b4:	90                   	nop    
f01000b5:	90                   	nop    
f01000b6:	90                   	nop    
f01000b7:	90                   	nop    
f01000b8:	90                   	nop    
f01000b9:	90                   	nop    
f01000ba:	90                   	nop    
f01000bb:	90                   	nop    
f01000bc:	90                   	nop    
f01000bd:	90                   	nop    
f01000be:	90                   	nop    
f01000bf:	90                   	nop    
f01000c0:	90                   	nop    
f01000c1:	90                   	nop    
f01000c2:	90                   	nop    
f01000c3:	90                   	nop    
f01000c4:	90                   	nop    
f01000c5:	90                   	nop    
f01000c6:	90                   	nop    
f01000c7:	90                   	nop    
f01000c8:	90                   	nop    
f01000c9:	90                   	nop    
f01000ca:	90                   	nop    
f01000cb:	90                   	nop    
f01000cc:	90                   	nop    
f01000cd:	90                   	nop    
f01000ce:	90                   	nop    
f01000cf:	90                   	nop    
f01000d0:	90                   	nop    
f01000d1:	90                   	nop    
f01000d2:	90                   	nop    
f01000d3:	90                   	nop    
f01000d4:	90                   	nop    
f01000d5:	90                   	nop    
f01000d6:	90                   	nop    
f01000d7:	90                   	nop    
f01000d8:	90                   	nop    
f01000d9:	90                   	nop    
f01000da:	90                   	nop    
f01000db:	90                   	nop    
f01000dc:	90                   	nop    
f01000dd:	90                   	nop    
f01000de:	90                   	nop    
f01000df:	90                   	nop    
f01000e0:	90                   	nop    
f01000e1:	90                   	nop    
f01000e2:	90                   	nop    
f01000e3:	90                   	nop    
f01000e4:	90                   	nop    
f01000e5:	90                   	nop    
f01000e6:	90                   	nop    
f01000e7:	90                   	nop    
f01000e8:	90                   	nop    
f01000e9:	90                   	nop    
f01000ea:	90                   	nop    
f01000eb:	90                   	nop    
f01000ec:	90                   	nop    
f01000ed:	90                   	nop    
f01000ee:	90                   	nop    
f01000ef:	90                   	nop    
f01000f0:	90                   	nop    
f01000f1:	90                   	nop    
f01000f2:	90                   	nop    
f01000f3:	90                   	nop    
f01000f4:	90                   	nop    
f01000f5:	90                   	nop    
f01000f6:	90                   	nop    
f01000f7:	90                   	nop    
f01000f8:	90                   	nop    
f01000f9:	90                   	nop    
f01000fa:	90                   	nop    
f01000fb:	90                   	nop    
f01000fc:	90                   	nop    
f01000fd:	90                   	nop    
f01000fe:	90                   	nop    
f01000ff:	90                   	nop    
f0100100:	90                   	nop    
f0100101:	90                   	nop    
f0100102:	90                   	nop    
f0100103:	90                   	nop    
f0100104:	90                   	nop    
f0100105:	90                   	nop    
f0100106:	90                   	nop    
f0100107:	90                   	nop    
f0100108:	90                   	nop    
f0100109:	90                   	nop    
f010010a:	90                   	nop    
f010010b:	90                   	nop    
f010010c:	90                   	nop    
f010010d:	90                   	nop    
f010010e:	90                   	nop    
f010010f:	90                   	nop    
f0100110:	90                   	nop    
f0100111:	90                   	nop    
f0100112:	90                   	nop    
f0100113:	90                   	nop    
f0100114:	90                   	nop    
f0100115:	90                   	nop    
f0100116:	90                   	nop    
f0100117:	90                   	nop    
f0100118:	90                   	nop    
f0100119:	90                   	nop    
f010011a:	90                   	nop    
f010011b:	90                   	nop    
f010011c:	90                   	nop    
f010011d:	90                   	nop    
f010011e:	90                   	nop    
f010011f:	90                   	nop    
f0100120:	90                   	nop    
f0100121:	90                   	nop    
f0100122:	90                   	nop    
f0100123:	90                   	nop    
f0100124:	90                   	nop    
f0100125:	90                   	nop    
f0100126:	90                   	nop    
f0100127:	90                   	nop    
f0100128:	90                   	nop    
f0100129:	90                   	nop    
f010012a:	90                   	nop    
f010012b:	90                   	nop    
f010012c:	90                   	nop    
f010012d:	90                   	nop    
f010012e:	90                   	nop    
f010012f:	90                   	nop    
f0100130:	90                   	nop    
f0100131:	90                   	nop    
f0100132:	90                   	nop    
f0100133:	90                   	nop    
f0100134:	90                   	nop    
f0100135:	90                   	nop    
f0100136:	90                   	nop    
f0100137:	90                   	nop    
f0100138:	90                   	nop    
f0100139:	90                   	nop    
f010013a:	90                   	nop    
f010013b:	90                   	nop    
f010013c:	90                   	nop    
f010013d:	90                   	nop    
f010013e:	90                   	nop    
f010013f:	90                   	nop    
f0100140:	90                   	nop    
f0100141:	90                   	nop    
f0100142:	90                   	nop    
f0100143:	90                   	nop    
f0100144:	90                   	nop    
f0100145:	90                   	nop    
f0100146:	90                   	nop    
f0100147:	90                   	nop    
f0100148:	90                   	nop    
f0100149:	90                   	nop    
f010014a:	90                   	nop    
f010014b:	90                   	nop    
f010014c:	90                   	nop    
f010014d:	90                   	nop    
f010014e:	90                   	nop    
f010014f:	90                   	nop    
f0100150:	90                   	nop    
f0100151:	90                   	nop    
f0100152:	90                   	nop    
f0100153:	90                   	nop    
f0100154:	90                   	nop    
f0100155:	90                   	nop    
f0100156:	90                   	nop    
f0100157:	90                   	nop    
f0100158:	90                   	nop    
f0100159:	90                   	nop    
f010015a:	90                   	nop    
f010015b:	90                   	nop    
f010015c:	90                   	nop    
f010015d:	90                   	nop    
f010015e:	90                   	nop    
f010015f:	90                   	nop    
f0100160:	90                   	nop    
f0100161:	90                   	nop    
f0100162:	90                   	nop    
f0100163:	90                   	nop    
f0100164:	90                   	nop    
f0100165:	90                   	nop    
f0100166:	90                   	nop    
f0100167:	90                   	nop    
f0100168:	90                   	nop    
f0100169:	90                   	nop    
f010016a:	90                   	nop    
f010016b:	90                   	nop    
f010016c:	90                   	nop    
f010016d:	90                   	nop    
f010016e:	90                   	nop    
f010016f:	90                   	nop    
f0100170:	90                   	nop    
f0100171:	90                   	nop    
f0100172:	90                   	nop    
f0100173:	90                   	nop    
f0100174:	90                   	nop    
f0100175:	90                   	nop    
f0100176:	90                   	nop    
f0100177:	90                   	nop    
f0100178:	90                   	nop    
f0100179:	90                   	nop    
f010017a:	90                   	nop    
f010017b:	90                   	nop    
f010017c:	90                   	nop    
f010017d:	90                   	nop    
f010017e:	90                   	nop    
f010017f:	90                   	nop    
f0100180:	90                   	nop    
f0100181:	90                   	nop    
f0100182:	90                   	nop    
f0100183:	90                   	nop    
f0100184:	90                   	nop    
f0100185:	90                   	nop    
f0100186:	90                   	nop    
f0100187:	90                   	nop    
f0100188:	90                   	nop    
f0100189:	90                   	nop    
f010018a:	90                   	nop    
f010018b:	90                   	nop    
f010018c:	90                   	nop    
f010018d:	90                   	nop    
f010018e:	90                   	nop    
f010018f:	90                   	nop    
f0100190:	90                   	nop    
f0100191:	90                   	nop    
f0100192:	90                   	nop    
f0100193:	90                   	nop    
f0100194:	90                   	nop    
f0100195:	90                   	nop    
f0100196:	90                   	nop    
f0100197:	90                   	nop    
f0100198:	90                   	nop    
f0100199:	90                   	nop    
f010019a:	90                   	nop    
f010019b:	90                   	nop    
f010019c:	90                   	nop    
f010019d:	90                   	nop    
f010019e:	90                   	nop    
f010019f:	90                   	nop    
f01001a0:	90                   	nop    
f01001a1:	90                   	nop    
f01001a2:	90                   	nop    
f01001a3:	90                   	nop    
f01001a4:	90                   	nop    
f01001a5:	90                   	nop    
f01001a6:	90                   	nop    
f01001a7:	90                   	nop    
f01001a8:	90                   	nop    
f01001a9:	90                   	nop    
f01001aa:	90                   	nop    
f01001ab:	90                   	nop    
f01001ac:	90                   	nop    
f01001ad:	90                   	nop    
f01001ae:	90                   	nop    
f01001af:	90                   	nop    
f01001b0:	90                   	nop    
f01001b1:	90                   	nop    
f01001b2:	90                   	nop    
f01001b3:	90                   	nop    
f01001b4:	90                   	nop    
f01001b5:	90                   	nop    
f01001b6:	90                   	nop    
f01001b7:	90                   	nop    
f01001b8:	90                   	nop    
f01001b9:	90                   	nop    
f01001ba:	90                   	nop    
f01001bb:	90                   	nop    
f01001bc:	90                   	nop    
f01001bd:	90                   	nop    
f01001be:	90                   	nop    
f01001bf:	90                   	nop    
f01001c0:	90                   	nop    
f01001c1:	90                   	nop    
f01001c2:	90                   	nop    
f01001c3:	90                   	nop    
f01001c4:	90                   	nop    
f01001c5:	90                   	nop    
f01001c6:	90                   	nop    
f01001c7:	90                   	nop    
f01001c8:	90                   	nop    
f01001c9:	90                   	nop    
f01001ca:	90                   	nop    
f01001cb:	90                   	nop    
f01001cc:	90                   	nop    
f01001cd:	90                   	nop    
f01001ce:	90                   	nop    
f01001cf:	90                   	nop    
f01001d0:	90                   	nop    
f01001d1:	90                   	nop    
f01001d2:	90                   	nop    
f01001d3:	90                   	nop    
f01001d4:	90                   	nop    
f01001d5:	90                   	nop    
f01001d6:	90                   	nop    
f01001d7:	90                   	nop    
f01001d8:	90                   	nop    
f01001d9:	90                   	nop    
f01001da:	90                   	nop    
f01001db:	90                   	nop    
f01001dc:	90                   	nop    
f01001dd:	90                   	nop    
f01001de:	90                   	nop    
f01001df:	90                   	nop    
f01001e0:	90                   	nop    
f01001e1:	90                   	nop    
f01001e2:	90                   	nop    
f01001e3:	90                   	nop    
f01001e4:	90                   	nop    
f01001e5:	90                   	nop    
f01001e6:	90                   	nop    
f01001e7:	90                   	nop    
f01001e8:	90                   	nop    
f01001e9:	90                   	nop    
f01001ea:	90                   	nop    
f01001eb:	90                   	nop    
f01001ec:	90                   	nop    
f01001ed:	90                   	nop    
f01001ee:	90                   	nop    
f01001ef:	90                   	nop    
f01001f0:	90                   	nop    
f01001f1:	90                   	nop    
f01001f2:	90                   	nop    
f01001f3:	90                   	nop    
f01001f4:	90                   	nop    
f01001f5:	90                   	nop    
f01001f6:	90                   	nop    
f01001f7:	90                   	nop    
f01001f8:	90                   	nop    
f01001f9:	90                   	nop    
f01001fa:	90                   	nop    
f01001fb:	90                   	nop    
f01001fc:	90                   	nop    
f01001fd:	90                   	nop    
f01001fe:	90                   	nop    
f01001ff:	90                   	nop    
f0100200:	90                   	nop    
f0100201:	90                   	nop    
f0100202:	90                   	nop    
f0100203:	90                   	nop    
f0100204:	90                   	nop    
f0100205:	90                   	nop    
f0100206:	90                   	nop    
f0100207:	90                   	nop    
f0100208:	90                   	nop    
f0100209:	90                   	nop    
f010020a:	90                   	nop    
f010020b:	90                   	nop    
f010020c:	90                   	nop    
f010020d:	90                   	nop    
f010020e:	90                   	nop    
f010020f:	90                   	nop    
f0100210:	90                   	nop    
f0100211:	90                   	nop    
f0100212:	90                   	nop    
f0100213:	90                   	nop    
f0100214:	90                   	nop    
f0100215:	90                   	nop    
f0100216:	90                   	nop    
f0100217:	90                   	nop    
f0100218:	90                   	nop    
f0100219:	90                   	nop    
f010021a:	90                   	nop    
f010021b:	90                   	nop    
f010021c:	90                   	nop    
f010021d:	90                   	nop    
f010021e:	90                   	nop    
f010021f:	90                   	nop    
f0100220:	90                   	nop    
f0100221:	90                   	nop    
f0100222:	90                   	nop    
f0100223:	90                   	nop    
f0100224:	90                   	nop    
f0100225:	90                   	nop    
f0100226:	90                   	nop    
f0100227:	90                   	nop    
f0100228:	90                   	nop    
f0100229:	90                   	nop    
f010022a:	90                   	nop    
f010022b:	90                   	nop    
f010022c:	90                   	nop    
f010022d:	90                   	nop    
f010022e:	90                   	nop    
f010022f:	90                   	nop    
f0100230:	90                   	nop    
f0100231:	90                   	nop    
f0100232:	90                   	nop    
f0100233:	90                   	nop    
f0100234:	90                   	nop    
f0100235:	90                   	nop    
f0100236:	90                   	nop    
f0100237:	90                   	nop    
f0100238:	90                   	nop    
f0100239:	90                   	nop    
f010023a:	90                   	nop    
f010023b:	90                   	nop    
f010023c:	90                   	nop    
f010023d:	90                   	nop    
f010023e:	90                   	nop    
f010023f:	90                   	nop    
f0100240:	90                   	nop    
f0100241:	90                   	nop    
f0100242:	90                   	nop    
f0100243:	90                   	nop    
f0100244:	90                   	nop    
f0100245:	90                   	nop    
f0100246:	90                   	nop    
f0100247:	90                   	nop    
f0100248:	90                   	nop    
f0100249:	90                   	nop    
f010024a:	90                   	nop    
f010024b:	90                   	nop    
f010024c:	90                   	nop    
f010024d:	90                   	nop    
f010024e:	90                   	nop    
f010024f:	90                   	nop    
f0100250:	90                   	nop    
f0100251:	90                   	nop    
f0100252:	90                   	nop    
f0100253:	90                   	nop    
f0100254:	90                   	nop    
f0100255:	90                   	nop    
f0100256:	90                   	nop    
f0100257:	90                   	nop    
f0100258:	90                   	nop    
f0100259:	90                   	nop    
f010025a:	90                   	nop    
f010025b:	90                   	nop    
f010025c:	90                   	nop    
f010025d:	90                   	nop    
f010025e:	90                   	nop    
f010025f:	90                   	nop    
f0100260:	90                   	nop    
f0100261:	90                   	nop    
f0100262:	90                   	nop    
f0100263:	90                   	nop    
f0100264:	90                   	nop    
f0100265:	90                   	nop    
f0100266:	90                   	nop    
f0100267:	90                   	nop    
f0100268:	90                   	nop    
f0100269:	90                   	nop    
f010026a:	90                   	nop    
f010026b:	90                   	nop    
f010026c:	90                   	nop    
f010026d:	90                   	nop    
f010026e:	90                   	nop    
f010026f:	90                   	nop    
f0100270:	90                   	nop    
f0100271:	90                   	nop    
f0100272:	90                   	nop    
f0100273:	90                   	nop    
f0100274:	90                   	nop    
f0100275:	90                   	nop    
f0100276:	90                   	nop    
f0100277:	90                   	nop    
f0100278:	90                   	nop    
f0100279:	90                   	nop    
f010027a:	90                   	nop    
f010027b:	90                   	nop    
f010027c:	90                   	nop    
f010027d:	90                   	nop    
f010027e:	90                   	nop    
f010027f:	90                   	nop    
f0100280:	90                   	nop    
f0100281:	90                   	nop    
f0100282:	90                   	nop    
f0100283:	90                   	nop    
f0100284:	90                   	nop    
f0100285:	90                   	nop    
f0100286:	90                   	nop    
f0100287:	90                   	nop    
f0100288:	90                   	nop    
f0100289:	90                   	nop    
f010028a:	90                   	nop    
f010028b:	90                   	nop    
f010028c:	90                   	nop    
f010028d:	90                   	nop    
f010028e:	90                   	nop    
f010028f:	90                   	nop    
f0100290:	90                   	nop    
f0100291:	90                   	nop    
f0100292:	90                   	nop    
f0100293:	90                   	nop    
f0100294:	90                   	nop    
f0100295:	90                   	nop    
f0100296:	90                   	nop    
f0100297:	90                   	nop    
f0100298:	90                   	nop    
f0100299:	90                   	nop    
f010029a:	90                   	nop    
f010029b:	90                   	nop    
f010029c:	90                   	nop    
f010029d:	90                   	nop    
f010029e:	90                   	nop    
f010029f:	90                   	nop    
f01002a0:	90                   	nop    
f01002a1:	90                   	nop    
f01002a2:	90                   	nop    
f01002a3:	90                   	nop    
f01002a4:	90                   	nop    
f01002a5:	90                   	nop    
f01002a6:	90                   	nop    
f01002a7:	90                   	nop    
f01002a8:	90                   	nop    
f01002a9:	90                   	nop    
f01002aa:	90                   	nop    
f01002ab:	90                   	nop    
f01002ac:	90                   	nop    
f01002ad:	90                   	nop    
f01002ae:	90                   	nop    
f01002af:	90                   	nop    
f01002b0:	90                   	nop    
f01002b1:	90                   	nop    
f01002b2:	90                   	nop    
f01002b3:	90                   	nop    
f01002b4:	90                   	nop    
f01002b5:	90                   	nop    
f01002b6:	90                   	nop    
f01002b7:	90                   	nop    
f01002b8:	90                   	nop    
f01002b9:	90                   	nop    
f01002ba:	90                   	nop    
f01002bb:	90                   	nop    
f01002bc:	90                   	nop    
f01002bd:	90                   	nop    
f01002be:	90                   	nop    
f01002bf:	90                   	nop    
f01002c0:	90                   	nop    
f01002c1:	90                   	nop    
f01002c2:	90                   	nop    
f01002c3:	90                   	nop    
f01002c4:	90                   	nop    
f01002c5:	90                   	nop    
f01002c6:	90                   	nop    
f01002c7:	90                   	nop    
f01002c8:	90                   	nop    
f01002c9:	90                   	nop    
f01002ca:	90                   	nop    
f01002cb:	90                   	nop    
f01002cc:	90                   	nop    
f01002cd:	90                   	nop    
f01002ce:	90                   	nop    
f01002cf:	90                   	nop    
f01002d0:	90                   	nop    
f01002d1:	90                   	nop    
f01002d2:	90                   	nop    
f01002d3:	90                   	nop    
f01002d4:	90                   	nop    
f01002d5:	90                   	nop    
f01002d6:	90                   	nop    
f01002d7:	90                   	nop    
f01002d8:	90                   	nop    
f01002d9:	90                   	nop    
f01002da:	90                   	nop    
f01002db:	90                   	nop    
f01002dc:	90                   	nop    
f01002dd:	90                   	nop    
f01002de:	90                   	nop    
f01002df:	90                   	nop    
f01002e0:	90                   	nop    
f01002e1:	90                   	nop    
f01002e2:	90                   	nop    
f01002e3:	90                   	nop    
f01002e4:	90                   	nop    
f01002e5:	90                   	nop    
f01002e6:	90                   	nop    
f01002e7:	90                   	nop    
f01002e8:	90                   	nop    
f01002e9:	90                   	nop    
f01002ea:	90                   	nop    
f01002eb:	90                   	nop    
f01002ec:	90                   	nop    
f01002ed:	90                   	nop    
f01002ee:	90                   	nop    
f01002ef:	90                   	nop    
f01002f0:	90                   	nop    
f01002f1:	90                   	nop    
f01002f2:	90                   	nop    
f01002f3:	90                   	nop    
f01002f4:	90                   	nop    
f01002f5:	90                   	nop    
f01002f6:	90                   	nop    
f01002f7:	90                   	nop    
f01002f8:	90                   	nop    
f01002f9:	90                   	nop    
f01002fa:	90                   	nop    
f01002fb:	90                   	nop    
f01002fc:	90                   	nop    
f01002fd:	90                   	nop    
f01002fe:	90                   	nop    
f01002ff:	90                   	nop    
f0100300:	90                   	nop    
f0100301:	90                   	nop    
f0100302:	90                   	nop    
f0100303:	90                   	nop    
f0100304:	90                   	nop    
f0100305:	90                   	nop    
f0100306:	90                   	nop    
f0100307:	90                   	nop    
f0100308:	90                   	nop    
f0100309:	90                   	nop    
f010030a:	90                   	nop    
f010030b:	90                   	nop    
f010030c:	90                   	nop    
f010030d:	90                   	nop    
f010030e:	90                   	nop    
f010030f:	90                   	nop    
f0100310:	90                   	nop    
f0100311:	90                   	nop    
f0100312:	90                   	nop    
f0100313:	90                   	nop    
f0100314:	90                   	nop    
f0100315:	90                   	nop    
f0100316:	90                   	nop    
f0100317:	90                   	nop    
f0100318:	90                   	nop    
f0100319:	90                   	nop    
f010031a:	90                   	nop    
f010031b:	90                   	nop    
f010031c:	90                   	nop    
f010031d:	90                   	nop    
f010031e:	90                   	nop    
f010031f:	90                   	nop    
f0100320:	90                   	nop    
f0100321:	90                   	nop    
f0100322:	90                   	nop    
f0100323:	90                   	nop    
f0100324:	90                   	nop    
f0100325:	90                   	nop    
f0100326:	90                   	nop    
f0100327:	90                   	nop    
f0100328:	90                   	nop    
f0100329:	90                   	nop    
f010032a:	90                   	nop    
f010032b:	90                   	nop    
f010032c:	90                   	nop    
f010032d:	90                   	nop    
f010032e:	90                   	nop    
f010032f:	90                   	nop    
f0100330:	90                   	nop    
f0100331:	90                   	nop    
f0100332:	90                   	nop    
f0100333:	90                   	nop    
f0100334:	90                   	nop    
f0100335:	90                   	nop    
f0100336:	90                   	nop    
f0100337:	90                   	nop    
f0100338:	90                   	nop    
f0100339:	90                   	nop    
f010033a:	90                   	nop    
f010033b:	90                   	nop    
f010033c:	90                   	nop    
f010033d:	90                   	nop    
f010033e:	90                   	nop    
f010033f:	90                   	nop    
f0100340:	90                   	nop    
f0100341:	90                   	nop    
f0100342:	90                   	nop    
f0100343:	90                   	nop    
f0100344:	90                   	nop    
f0100345:	90                   	nop    
f0100346:	90                   	nop    
f0100347:	90                   	nop    
f0100348:	90                   	nop    
f0100349:	90                   	nop    
f010034a:	90                   	nop    
f010034b:	90                   	nop    
f010034c:	90                   	nop    
f010034d:	90                   	nop    
f010034e:	90                   	nop    
f010034f:	90                   	nop    
f0100350:	90                   	nop    
f0100351:	90                   	nop    
f0100352:	90                   	nop    
f0100353:	90                   	nop    
f0100354:	90                   	nop    
f0100355:	90                   	nop    
f0100356:	90                   	nop    
f0100357:	90                   	nop    
f0100358:	90                   	nop    
f0100359:	90                   	nop    
f010035a:	90                   	nop    
f010035b:	90                   	nop    
f010035c:	90                   	nop    
f010035d:	90                   	nop    
f010035e:	90                   	nop    
f010035f:	90                   	nop    
f0100360:	90                   	nop    
f0100361:	90                   	nop    
f0100362:	90                   	nop    
f0100363:	90                   	nop    
f0100364:	90                   	nop    
f0100365:	90                   	nop    
f0100366:	90                   	nop    
f0100367:	90                   	nop    
f0100368:	90                   	nop    
f0100369:	90                   	nop    
f010036a:	90                   	nop    
f010036b:	90                   	nop    
f010036c:	90                   	nop    
f010036d:	90                   	nop    
f010036e:	90                   	nop    
f010036f:	90                   	nop    
f0100370:	90                   	nop    
f0100371:	90                   	nop    
f0100372:	90                   	nop    
f0100373:	90                   	nop    
f0100374:	90                   	nop    
f0100375:	90                   	nop    
f0100376:	90                   	nop    
f0100377:	90                   	nop    
f0100378:	90                   	nop    
f0100379:	90                   	nop    
f010037a:	90                   	nop    
f010037b:	90                   	nop    
f010037c:	90                   	nop    
f010037d:	90                   	nop    
f010037e:	90                   	nop    
f010037f:	90                   	nop    
f0100380:	90                   	nop    
f0100381:	90                   	nop    
f0100382:	90                   	nop    
f0100383:	90                   	nop    
f0100384:	90                   	nop    
f0100385:	90                   	nop    
f0100386:	90                   	nop    
f0100387:	90                   	nop    
f0100388:	90                   	nop    
f0100389:	90                   	nop    
f010038a:	90                   	nop    
f010038b:	90                   	nop    
f010038c:	90                   	nop    
f010038d:	90                   	nop    
f010038e:	90                   	nop    
f010038f:	90                   	nop    
f0100390:	90                   	nop    
f0100391:	90                   	nop    
f0100392:	90                   	nop    
f0100393:	90                   	nop    
f0100394:	90                   	nop    
f0100395:	90                   	nop    
f0100396:	90                   	nop    
f0100397:	90                   	nop    
f0100398:	90                   	nop    
f0100399:	90                   	nop    
f010039a:	90                   	nop    
f010039b:	90                   	nop    
f010039c:	90                   	nop    
f010039d:	90                   	nop    
f010039e:	90                   	nop    
f010039f:	90                   	nop    
f01003a0:	90                   	nop    
f01003a1:	90                   	nop    
f01003a2:	90                   	nop    
f01003a3:	90                   	nop    
f01003a4:	90                   	nop    
f01003a5:	90                   	nop    
f01003a6:	90                   	nop    
f01003a7:	90                   	nop    
f01003a8:	90                   	nop    
f01003a9:	90                   	nop    
f01003aa:	90                   	nop    
f01003ab:	90                   	nop    
f01003ac:	90                   	nop    
f01003ad:	90                   	nop    
f01003ae:	90                   	nop    
f01003af:	90                   	nop    
f01003b0:	90                   	nop    
f01003b1:	90                   	nop    
f01003b2:	90                   	nop    
f01003b3:	90                   	nop    
f01003b4:	90                   	nop    
f01003b5:	90                   	nop    
f01003b6:	90                   	nop    
f01003b7:	90                   	nop    
f01003b8:	90                   	nop    
f01003b9:	90                   	nop    
f01003ba:	90                   	nop    
f01003bb:	90                   	nop    
f01003bc:	90                   	nop    
f01003bd:	90                   	nop    
f01003be:	90                   	nop    
f01003bf:	90                   	nop    
f01003c0:	90                   	nop    
f01003c1:	90                   	nop    
f01003c2:	90                   	nop    
f01003c3:	90                   	nop    
f01003c4:	90                   	nop    
f01003c5:	90                   	nop    
f01003c6:	90                   	nop    
f01003c7:	90                   	nop    
f01003c8:	90                   	nop    
f01003c9:	90                   	nop    
f01003ca:	90                   	nop    
f01003cb:	90                   	nop    
f01003cc:	90                   	nop    
f01003cd:	90                   	nop    
f01003ce:	90                   	nop    
f01003cf:	90                   	nop    
f01003d0:	90                   	nop    
f01003d1:	90                   	nop    
f01003d2:	90                   	nop    
f01003d3:	90                   	nop    
f01003d4:	90                   	nop    
f01003d5:	90                   	nop    
f01003d6:	90                   	nop    
f01003d7:	90                   	nop    
f01003d8:	90                   	nop    
f01003d9:	90                   	nop    
f01003da:	90                   	nop    
f01003db:	90                   	nop    
f01003dc:	90                   	nop    
f01003dd:	90                   	nop    
f01003de:	90                   	nop    
f01003df:	90                   	nop    
f01003e0:	90                   	nop    
f01003e1:	90                   	nop    
f01003e2:	90                   	nop    
f01003e3:	90                   	nop    
f01003e4:	90                   	nop    
f01003e5:	90                   	nop    
f01003e6:	90                   	nop    
f01003e7:	90                   	nop    
f01003e8:	90                   	nop    
f01003e9:	90                   	nop    
f01003ea:	90                   	nop    
f01003eb:	90                   	nop    
f01003ec:	90                   	nop    
f01003ed:	90                   	nop    
f01003ee:	90                   	nop    
f01003ef:	90                   	nop    
f01003f0:	90                   	nop    
f01003f1:	90                   	nop    
f01003f2:	90                   	nop    
f01003f3:	90                   	nop    
f01003f4:	90                   	nop    
f01003f5:	90                   	nop    
f01003f6:	90                   	nop    
f01003f7:	90                   	nop    
f01003f8:	90                   	nop    
f01003f9:	90                   	nop    
f01003fa:	90                   	nop    
f01003fb:	90                   	nop    
f01003fc:	90                   	nop    
f01003fd:	90                   	nop    
f01003fe:	90                   	nop    
f01003ff:	90                   	nop    
f0100400:	90                   	nop    
f0100401:	90                   	nop    
f0100402:	90                   	nop    
f0100403:	90                   	nop    
f0100404:	90                   	nop    
f0100405:	90                   	nop    
f0100406:	90                   	nop    
f0100407:	90                   	nop    
f0100408:	90                   	nop    
f0100409:	90                   	nop    
f010040a:	90                   	nop    
f010040b:	90                   	nop    
f010040c:	90                   	nop    
f010040d:	90                   	nop    
f010040e:	90                   	nop    
f010040f:	90                   	nop    
f0100410:	90                   	nop    
f0100411:	90                   	nop    
f0100412:	90                   	nop    
f0100413:	90                   	nop    
f0100414:	90                   	nop    
f0100415:	90                   	nop    
f0100416:	90                   	nop    
f0100417:	90                   	nop    
f0100418:	90                   	nop    
f0100419:	90                   	nop    
f010041a:	90                   	nop    
f010041b:	90                   	nop    
f010041c:	90                   	nop    
f010041d:	90                   	nop    
f010041e:	90                   	nop    
f010041f:	90                   	nop    
f0100420:	90                   	nop    
f0100421:	90                   	nop    
f0100422:	90                   	nop    
f0100423:	90                   	nop    
f0100424:	90                   	nop    
f0100425:	90                   	nop    
f0100426:	90                   	nop    
f0100427:	90                   	nop    
f0100428:	90                   	nop    
f0100429:	90                   	nop    
f010042a:	90                   	nop    
f010042b:	90                   	nop    
f010042c:	90                   	nop    
f010042d:	90                   	nop    
f010042e:	90                   	nop    
f010042f:	90                   	nop    
f0100430:	90                   	nop    
f0100431:	90                   	nop    
f0100432:	90                   	nop    
f0100433:	90                   	nop    
f0100434:	90                   	nop    
f0100435:	90                   	nop    
f0100436:	90                   	nop    
f0100437:	90                   	nop    
f0100438:	90                   	nop    
f0100439:	90                   	nop    
f010043a:	90                   	nop    
f010043b:	90                   	nop    
f010043c:	90                   	nop    
f010043d:	90                   	nop    
f010043e:	90                   	nop    
f010043f:	90                   	nop    
f0100440:	90                   	nop    
f0100441:	90                   	nop    
f0100442:	90                   	nop    
f0100443:	90                   	nop    
f0100444:	90                   	nop    
f0100445:	90                   	nop    
f0100446:	90                   	nop    
f0100447:	90                   	nop    
f0100448:	90                   	nop    
f0100449:	90                   	nop    
f010044a:	90                   	nop    
f010044b:	90                   	nop    
f010044c:	90                   	nop    
f010044d:	90                   	nop    
f010044e:	90                   	nop    
f010044f:	90                   	nop    
f0100450:	90                   	nop    
f0100451:	90                   	nop    
f0100452:	90                   	nop    
f0100453:	90                   	nop    
f0100454:	90                   	nop    
f0100455:	90                   	nop    
f0100456:	90                   	nop    
f0100457:	90                   	nop    
f0100458:	90                   	nop    
f0100459:	90                   	nop    
f010045a:	90                   	nop    
f010045b:	90                   	nop    
f010045c:	90                   	nop    
f010045d:	90                   	nop    
f010045e:	90                   	nop    
f010045f:	90                   	nop    
f0100460:	90                   	nop    
f0100461:	90                   	nop    
f0100462:	90                   	nop    
f0100463:	90                   	nop    
f0100464:	90                   	nop    
f0100465:	90                   	nop    
f0100466:	90                   	nop    
f0100467:	90                   	nop    
f0100468:	90                   	nop    
f0100469:	90                   	nop    
f010046a:	90                   	nop    
f010046b:	90                   	nop    
f010046c:	90                   	nop    
f010046d:	90                   	nop    
f010046e:	90                   	nop    
f010046f:	90                   	nop    
f0100470:	90                   	nop    
f0100471:	90                   	nop    
f0100472:	90                   	nop    
f0100473:	90                   	nop    
f0100474:	90                   	nop    
f0100475:	90                   	nop    
f0100476:	90                   	nop    
f0100477:	90                   	nop    
f0100478:	90                   	nop    
f0100479:	90                   	nop    
f010047a:	90                   	nop    
f010047b:	90                   	nop    
f010047c:	90                   	nop    
f010047d:	90                   	nop    
f010047e:	90                   	nop    
f010047f:	90                   	nop    
f0100480:	90                   	nop    
f0100481:	90                   	nop    
f0100482:	90                   	nop    
f0100483:	90                   	nop    
f0100484:	90                   	nop    
f0100485:	90                   	nop    
f0100486:	90                   	nop    
f0100487:	90                   	nop    
f0100488:	90                   	nop    
f0100489:	90                   	nop    
f010048a:	90                   	nop    
f010048b:	90                   	nop    
f010048c:	90                   	nop    
f010048d:	90                   	nop    
f010048e:	90                   	nop    
f010048f:	90                   	nop    
f0100490:	90                   	nop    
f0100491:	90                   	nop    
f0100492:	90                   	nop    
f0100493:	90                   	nop    
f0100494:	90                   	nop    
f0100495:	90                   	nop    
f0100496:	90                   	nop    
f0100497:	90                   	nop    
f0100498:	90                   	nop    
f0100499:	90                   	nop    
f010049a:	90                   	nop    
f010049b:	90                   	nop    
f010049c:	90                   	nop    
f010049d:	90                   	nop    
f010049e:	90                   	nop    
f010049f:	90                   	nop    
f01004a0:	90                   	nop    
f01004a1:	90                   	nop    
f01004a2:	90                   	nop    
f01004a3:	90                   	nop    
f01004a4:	90                   	nop    
f01004a5:	90                   	nop    
f01004a6:	90                   	nop    
f01004a7:	90                   	nop    
f01004a8:	90                   	nop    
f01004a9:	90                   	nop    
f01004aa:	90                   	nop    
f01004ab:	90                   	nop    
f01004ac:	90                   	nop    
f01004ad:	90                   	nop    
f01004ae:	90                   	nop    
f01004af:	90                   	nop    
f01004b0:	90                   	nop    
f01004b1:	90                   	nop    
f01004b2:	90                   	nop    
f01004b3:	90                   	nop    
f01004b4:	90                   	nop    
f01004b5:	90                   	nop    
f01004b6:	90                   	nop    
f01004b7:	90                   	nop    
f01004b8:	90                   	nop    
f01004b9:	90                   	nop    
f01004ba:	90                   	nop    
f01004bb:	90                   	nop    
f01004bc:	90                   	nop    
f01004bd:	90                   	nop    
f01004be:	90                   	nop    
f01004bf:	90                   	nop    
f01004c0:	90                   	nop    
f01004c1:	90                   	nop    
f01004c2:	90                   	nop    
f01004c3:	90                   	nop    
f01004c4:	90                   	nop    
f01004c5:	90                   	nop    
f01004c6:	90                   	nop    
f01004c7:	90                   	nop    
f01004c8:	90                   	nop    
f01004c9:	90                   	nop    
f01004ca:	90                   	nop    
f01004cb:	90                   	nop    
f01004cc:	90                   	nop    
f01004cd:	90                   	nop    
f01004ce:	90                   	nop    
f01004cf:	90                   	nop    
f01004d0:	90                   	nop    
f01004d1:	90                   	nop    
f01004d2:	90                   	nop    
f01004d3:	90                   	nop    
f01004d4:	90                   	nop    
f01004d5:	90                   	nop    
f01004d6:	90                   	nop    
f01004d7:	90                   	nop    
f01004d8:	90                   	nop    
f01004d9:	90                   	nop    
f01004da:	90                   	nop    
f01004db:	90                   	nop    
f01004dc:	90                   	nop    
f01004dd:	90                   	nop    
f01004de:	90                   	nop    
f01004df:	90                   	nop    
f01004e0:	90                   	nop    
f01004e1:	90                   	nop    
f01004e2:	90                   	nop    
f01004e3:	90                   	nop    
f01004e4:	90                   	nop    
f01004e5:	90                   	nop    
f01004e6:	90                   	nop    
f01004e7:	90                   	nop    
f01004e8:	90                   	nop    
f01004e9:	90                   	nop    
f01004ea:	90                   	nop    
f01004eb:	90                   	nop    
f01004ec:	90                   	nop    
f01004ed:	90                   	nop    
f01004ee:	90                   	nop    
f01004ef:	90                   	nop    
f01004f0:	90                   	nop    
f01004f1:	90                   	nop    
f01004f2:	90                   	nop    
f01004f3:	90                   	nop    
f01004f4:	90                   	nop    
f01004f5:	90                   	nop    
f01004f6:	90                   	nop    
f01004f7:	90                   	nop    
f01004f8:	90                   	nop    
f01004f9:	90                   	nop    
f01004fa:	90                   	nop    
f01004fb:	90                   	nop    
f01004fc:	90                   	nop    
f01004fd:	90                   	nop    
f01004fe:	90                   	nop    
f01004ff:	90                   	nop    
f0100500:	90                   	nop    
f0100501:	90                   	nop    
f0100502:	90                   	nop    
f0100503:	90                   	nop    
f0100504:	90                   	nop    
f0100505:	90                   	nop    
f0100506:	90                   	nop    
f0100507:	90                   	nop    
f0100508:	90                   	nop    
f0100509:	90                   	nop    
f010050a:	90                   	nop    
f010050b:	90                   	nop    
f010050c:	90                   	nop    
f010050d:	90                   	nop    
f010050e:	90                   	nop    
f010050f:	90                   	nop    
f0100510:	90                   	nop    
f0100511:	90                   	nop    
f0100512:	90                   	nop    
f0100513:	90                   	nop    
f0100514:	90                   	nop    
f0100515:	90                   	nop    
f0100516:	90                   	nop    
f0100517:	90                   	nop    
f0100518:	90                   	nop    
f0100519:	90                   	nop    
f010051a:	90                   	nop    
f010051b:	90                   	nop    
f010051c:	90                   	nop    
f010051d:	90                   	nop    
f010051e:	90                   	nop    
f010051f:	90                   	nop    
f0100520:	90                   	nop    
f0100521:	90                   	nop    
f0100522:	90                   	nop    
f0100523:	90                   	nop    
f0100524:	90                   	nop    
f0100525:	90                   	nop    
f0100526:	90                   	nop    
f0100527:	90                   	nop    
f0100528:	90                   	nop    
f0100529:	90                   	nop    
f010052a:	90                   	nop    
f010052b:	90                   	nop    
f010052c:	90                   	nop    
f010052d:	90                   	nop    
f010052e:	90                   	nop    
f010052f:	90                   	nop    
f0100530:	90                   	nop    
f0100531:	90                   	nop    
f0100532:	90                   	nop    
f0100533:	90                   	nop    
f0100534:	90                   	nop    
f0100535:	90                   	nop    
f0100536:	90                   	nop    
f0100537:	90                   	nop    
f0100538:	90                   	nop    
f0100539:	90                   	nop    
f010053a:	90                   	nop    
f010053b:	90                   	nop    
f010053c:	90                   	nop    
f010053d:	90                   	nop    
f010053e:	90                   	nop    
f010053f:	90                   	nop    
f0100540:	90                   	nop    
f0100541:	90                   	nop    
f0100542:	90                   	nop    
f0100543:	90                   	nop    
f0100544:	90                   	nop    
f0100545:	90                   	nop    
f0100546:	90                   	nop    
f0100547:	90                   	nop    
f0100548:	90                   	nop    
f0100549:	90                   	nop    
f010054a:	90                   	nop    
f010054b:	90                   	nop    
f010054c:	90                   	nop    
f010054d:	90                   	nop    
f010054e:	90                   	nop    
f010054f:	90                   	nop    
f0100550:	90                   	nop    
f0100551:	90                   	nop    
f0100552:	90                   	nop    
f0100553:	90                   	nop    
f0100554:	90                   	nop    
f0100555:	90                   	nop    
f0100556:	90                   	nop    
f0100557:	90                   	nop    
f0100558:	90                   	nop    
f0100559:	90                   	nop    
f010055a:	90                   	nop    
f010055b:	90                   	nop    
f010055c:	90                   	nop    
f010055d:	90                   	nop    
f010055e:	90                   	nop    
f010055f:	90                   	nop    
f0100560:	90                   	nop    
f0100561:	90                   	nop    
f0100562:	90                   	nop    
f0100563:	90                   	nop    
f0100564:	90                   	nop    
f0100565:	90                   	nop    
f0100566:	90                   	nop    
f0100567:	90                   	nop    
f0100568:	90                   	nop    
f0100569:	90                   	nop    
f010056a:	90                   	nop    
f010056b:	90                   	nop    
f010056c:	90                   	nop    
f010056d:	90                   	nop    
f010056e:	90                   	nop    
f010056f:	90                   	nop    
f0100570:	90                   	nop    
f0100571:	90                   	nop    
f0100572:	90                   	nop    
f0100573:	90                   	nop    
f0100574:	90                   	nop    
f0100575:	90                   	nop    
f0100576:	90                   	nop    
f0100577:	90                   	nop    
f0100578:	90                   	nop    
f0100579:	90                   	nop    
f010057a:	90                   	nop    
f010057b:	90                   	nop    
f010057c:	90                   	nop    
f010057d:	90                   	nop    
f010057e:	90                   	nop    
f010057f:	90                   	nop    
f0100580:	90                   	nop    
f0100581:	90                   	nop    
f0100582:	90                   	nop    
f0100583:	90                   	nop    
f0100584:	90                   	nop    
f0100585:	90                   	nop    
f0100586:	90                   	nop    
f0100587:	90                   	nop    
f0100588:	90                   	nop    
f0100589:	90                   	nop    
f010058a:	90                   	nop    
f010058b:	90                   	nop    
f010058c:	90                   	nop    
f010058d:	90                   	nop    
f010058e:	90                   	nop    
f010058f:	90                   	nop    
f0100590:	90                   	nop    
f0100591:	90                   	nop    
f0100592:	90                   	nop    
f0100593:	90                   	nop    
f0100594:	90                   	nop    
f0100595:	90                   	nop    
f0100596:	90                   	nop    
f0100597:	90                   	nop    
f0100598:	90                   	nop    
f0100599:	90                   	nop    
f010059a:	90                   	nop    
f010059b:	90                   	nop    
f010059c:	90                   	nop    
f010059d:	90                   	nop    
f010059e:	90                   	nop    
f010059f:	90                   	nop    
f01005a0:	90                   	nop    
f01005a1:	90                   	nop    
f01005a2:	90                   	nop    
f01005a3:	90                   	nop    
f01005a4:	90                   	nop    
f01005a5:	90                   	nop    
f01005a6:	90                   	nop    
f01005a7:	90                   	nop    
f01005a8:	90                   	nop    
f01005a9:	90                   	nop    
f01005aa:	90                   	nop    
f01005ab:	90                   	nop    
f01005ac:	90                   	nop    
f01005ad:	90                   	nop    
f01005ae:	90                   	nop    
f01005af:	90                   	nop    
f01005b0:	90                   	nop    
f01005b1:	90                   	nop    
f01005b2:	90                   	nop    
f01005b3:	90                   	nop    
f01005b4:	90                   	nop    
f01005b5:	90                   	nop    
f01005b6:	90                   	nop    
f01005b7:	90                   	nop    
f01005b8:	90                   	nop    
f01005b9:	90                   	nop    
f01005ba:	90                   	nop    
f01005bb:	90                   	nop    
f01005bc:	90                   	nop    
f01005bd:	90                   	nop    
f01005be:	90                   	nop    
f01005bf:	90                   	nop    
f01005c0:	90                   	nop    
f01005c1:	90                   	nop    
f01005c2:	90                   	nop    
f01005c3:	90                   	nop    
f01005c4:	90                   	nop    
f01005c5:	90                   	nop    
f01005c6:	90                   	nop    
f01005c7:	90                   	nop    
f01005c8:	90                   	nop    
f01005c9:	90                   	nop    
f01005ca:	90                   	nop    
f01005cb:	90                   	nop    
f01005cc:	90                   	nop    
f01005cd:	90                   	nop    
f01005ce:	90                   	nop    
f01005cf:	90                   	nop    
f01005d0:	90                   	nop    
f01005d1:	90                   	nop    
f01005d2:	90                   	nop    
f01005d3:	90                   	nop    
f01005d4:	90                   	nop    
f01005d5:	90                   	nop    
f01005d6:	90                   	nop    
f01005d7:	90                   	nop    
f01005d8:	90                   	nop    
f01005d9:	90                   	nop    
f01005da:	90                   	nop    
f01005db:	90                   	nop    
f01005dc:	90                   	nop    
f01005dd:	90                   	nop    
f01005de:	90                   	nop    
f01005df:	90                   	nop    
f01005e0:	90                   	nop    
f01005e1:	90                   	nop    
f01005e2:	90                   	nop    
f01005e3:	90                   	nop    
f01005e4:	90                   	nop    
f01005e5:	90                   	nop    
f01005e6:	90                   	nop    
f01005e7:	90                   	nop    
f01005e8:	90                   	nop    
f01005e9:	90                   	nop    
f01005ea:	90                   	nop    
f01005eb:	90                   	nop    
f01005ec:	90                   	nop    
f01005ed:	90                   	nop    
f01005ee:	90                   	nop    
f01005ef:	90                   	nop    
f01005f0:	90                   	nop    
f01005f1:	90                   	nop    
f01005f2:	90                   	nop    
f01005f3:	90                   	nop    
f01005f4:	90                   	nop    
f01005f5:	90                   	nop    
f01005f6:	90                   	nop    
f01005f7:	90                   	nop    
f01005f8:	90                   	nop    
f01005f9:	90                   	nop    
f01005fa:	90                   	nop    
f01005fb:	90                   	nop    
f01005fc:	90                   	nop    
f01005fd:	90                   	nop    
f01005fe:	90                   	nop    
f01005ff:	90                   	nop    
f0100600:	90                   	nop    
f0100601:	90                   	nop    
f0100602:	90                   	nop    
f0100603:	90                   	nop    
f0100604:	90                   	nop    
f0100605:	90                   	nop    
f0100606:	90                   	nop    
f0100607:	90                   	nop    
f0100608:	90                   	nop    
f0100609:	90                   	nop    
f010060a:	90                   	nop    
f010060b:	90                   	nop    
f010060c:	90                   	nop    
f010060d:	90                   	nop    
f010060e:	90                   	nop    
f010060f:	90                   	nop    
f0100610:	90                   	nop    
f0100611:	90                   	nop    
f0100612:	90                   	nop    
f0100613:	90                   	nop    
f0100614:	90                   	nop    
f0100615:	90                   	nop    
f0100616:	90                   	nop    
f0100617:	90                   	nop    
f0100618:	90                   	nop    
f0100619:	90                   	nop    
f010061a:	90                   	nop    
f010061b:	90                   	nop    
f010061c:	90                   	nop    
f010061d:	90                   	nop    
f010061e:	90                   	nop    
f010061f:	90                   	nop    
f0100620:	90                   	nop    
f0100621:	90                   	nop    
f0100622:	90                   	nop    
f0100623:	90                   	nop    
f0100624:	90                   	nop    
f0100625:	90                   	nop    
f0100626:	90                   	nop    
f0100627:	90                   	nop    
f0100628:	90                   	nop    
f0100629:	90                   	nop    
f010062a:	90                   	nop    
f010062b:	90                   	nop    
f010062c:	90                   	nop    
f010062d:	90                   	nop    
f010062e:	90                   	nop    
f010062f:	90                   	nop    
f0100630:	90                   	nop    
f0100631:	90                   	nop    
f0100632:	90                   	nop    
f0100633:	90                   	nop    
f0100634:	90                   	nop    
f0100635:	90                   	nop    
f0100636:	90                   	nop    
f0100637:	90                   	nop    
f0100638:	90                   	nop    
f0100639:	90                   	nop    
f010063a:	90                   	nop    
f010063b:	90                   	nop    
f010063c:	90                   	nop    
f010063d:	90                   	nop    
f010063e:	90                   	nop    
f010063f:	90                   	nop    
f0100640:	90                   	nop    
f0100641:	90                   	nop    
f0100642:	90                   	nop    
f0100643:	90                   	nop    
f0100644:	90                   	nop    
f0100645:	90                   	nop    
f0100646:	90                   	nop    
f0100647:	90                   	nop    
f0100648:	90                   	nop    
f0100649:	90                   	nop    
f010064a:	90                   	nop    
f010064b:	90                   	nop    
f010064c:	90                   	nop    
f010064d:	90                   	nop    
f010064e:	90                   	nop    
f010064f:	90                   	nop    
f0100650:	90                   	nop    
f0100651:	90                   	nop    
f0100652:	90                   	nop    
f0100653:	90                   	nop    
f0100654:	90                   	nop    
f0100655:	90                   	nop    
f0100656:	90                   	nop    
f0100657:	90                   	nop    
f0100658:	90                   	nop    
f0100659:	90                   	nop    
f010065a:	90                   	nop    
f010065b:	90                   	nop    
f010065c:	90                   	nop    
f010065d:	90                   	nop    
f010065e:	90                   	nop    
f010065f:	90                   	nop    
f0100660:	90                   	nop    
f0100661:	90                   	nop    
f0100662:	90                   	nop    
f0100663:	90                   	nop    
f0100664:	90                   	nop    
f0100665:	90                   	nop    
f0100666:	90                   	nop    
f0100667:	90                   	nop    
f0100668:	90                   	nop    
f0100669:	90                   	nop    
f010066a:	90                   	nop    
f010066b:	90                   	nop    
f010066c:	90                   	nop    
f010066d:	90                   	nop    
f010066e:	90                   	nop    
f010066f:	90                   	nop    
f0100670:	90                   	nop    
f0100671:	90                   	nop    
f0100672:	90                   	nop    
f0100673:	90                   	nop    
f0100674:	90                   	nop    
f0100675:	90                   	nop    
f0100676:	90                   	nop    
f0100677:	90                   	nop    
f0100678:	90                   	nop    
f0100679:	90                   	nop    
f010067a:	90                   	nop    
f010067b:	90                   	nop    
f010067c:	90                   	nop    
f010067d:	90                   	nop    
f010067e:	90                   	nop    
f010067f:	90                   	nop    
f0100680:	90                   	nop    
f0100681:	90                   	nop    
f0100682:	90                   	nop    
f0100683:	90                   	nop    
f0100684:	90                   	nop    
f0100685:	90                   	nop    
f0100686:	90                   	nop    
f0100687:	90                   	nop    
f0100688:	90                   	nop    
f0100689:	90                   	nop    
f010068a:	90                   	nop    
f010068b:	90                   	nop    
f010068c:	90                   	nop    
f010068d:	90                   	nop    
f010068e:	90                   	nop    
f010068f:	90                   	nop    
f0100690:	90                   	nop    
f0100691:	90                   	nop    
f0100692:	90                   	nop    
f0100693:	90                   	nop    
f0100694:	90                   	nop    
f0100695:	90                   	nop    
f0100696:	90                   	nop    
f0100697:	90                   	nop    
f0100698:	90                   	nop    
f0100699:	90                   	nop    
f010069a:	90                   	nop    
f010069b:	90                   	nop    
f010069c:	90                   	nop    
f010069d:	90                   	nop    
f010069e:	90                   	nop    
f010069f:	90                   	nop    
f01006a0:	90                   	nop    
f01006a1:	90                   	nop    
f01006a2:	90                   	nop    
f01006a3:	90                   	nop    
f01006a4:	90                   	nop    
f01006a5:	90                   	nop    
f01006a6:	90                   	nop    
f01006a7:	90                   	nop    
f01006a8:	90                   	nop    
f01006a9:	90                   	nop    
f01006aa:	90                   	nop    
f01006ab:	90                   	nop    
f01006ac:	90                   	nop    
f01006ad:	90                   	nop    
f01006ae:	90                   	nop    
f01006af:	90                   	nop    
f01006b0:	90                   	nop    
f01006b1:	90                   	nop    
f01006b2:	90                   	nop    
f01006b3:	90                   	nop    
f01006b4:	90                   	nop    
f01006b5:	90                   	nop    
f01006b6:	90                   	nop    
f01006b7:	90                   	nop    
f01006b8:	90                   	nop    
f01006b9:	90                   	nop    
f01006ba:	90                   	nop    
f01006bb:	90                   	nop    
f01006bc:	90                   	nop    
f01006bd:	90                   	nop    
f01006be:	90                   	nop    
f01006bf:	90                   	nop    
f01006c0:	90                   	nop    
f01006c1:	90                   	nop    
f01006c2:	90                   	nop    
f01006c3:	90                   	nop    
f01006c4:	90                   	nop    
f01006c5:	90                   	nop    
f01006c6:	90                   	nop    
f01006c7:	90                   	nop    
f01006c8:	90                   	nop    
f01006c9:	90                   	nop    
f01006ca:	90                   	nop    
f01006cb:	90                   	nop    
f01006cc:	90                   	nop    
f01006cd:	90                   	nop    
f01006ce:	90                   	nop    
f01006cf:	90                   	nop    
f01006d0:	90                   	nop    
f01006d1:	90                   	nop    
f01006d2:	90                   	nop    
f01006d3:	90                   	nop    
f01006d4:	90                   	nop    
f01006d5:	90                   	nop    
f01006d6:	90                   	nop    
f01006d7:	90                   	nop    
f01006d8:	90                   	nop    
f01006d9:	90                   	nop    
f01006da:	90                   	nop    
f01006db:	90                   	nop    
f01006dc:	90                   	nop    
f01006dd:	90                   	nop    
f01006de:	90                   	nop    
f01006df:	90                   	nop    
f01006e0:	90                   	nop    
f01006e1:	90                   	nop    
f01006e2:	90                   	nop    
f01006e3:	90                   	nop    
f01006e4:	90                   	nop    
f01006e5:	90                   	nop    
f01006e6:	90                   	nop    
f01006e7:	90                   	nop    
f01006e8:	90                   	nop    
f01006e9:	90                   	nop    
f01006ea:	90                   	nop    
f01006eb:	90                   	nop    
f01006ec:	90                   	nop    
f01006ed:	90                   	nop    
f01006ee:	90                   	nop    
f01006ef:	90                   	nop    
f01006f0:	90                   	nop    
f01006f1:	90                   	nop    
f01006f2:	90                   	nop    
f01006f3:	90                   	nop    
f01006f4:	90                   	nop    
f01006f5:	90                   	nop    
f01006f6:	90                   	nop    
f01006f7:	90                   	nop    
f01006f8:	90                   	nop    
f01006f9:	90                   	nop    
f01006fa:	90                   	nop    
f01006fb:	90                   	nop    
f01006fc:	90                   	nop    
f01006fd:	90                   	nop    
f01006fe:	90                   	nop    
f01006ff:	90                   	nop    
f0100700:	90                   	nop    
f0100701:	90                   	nop    
f0100702:	90                   	nop    
f0100703:	90                   	nop    
f0100704:	90                   	nop    
f0100705:	90                   	nop    
f0100706:	90                   	nop    
f0100707:	90                   	nop    
f0100708:	90                   	nop    
f0100709:	90                   	nop    
f010070a:	90                   	nop    
f010070b:	90                   	nop    
f010070c:	90                   	nop    
f010070d:	90                   	nop    
f010070e:	90                   	nop    
f010070f:	90                   	nop    
f0100710:	90                   	nop    
f0100711:	90                   	nop    
f0100712:	90                   	nop    
f0100713:	90                   	nop    
f0100714:	90                   	nop    
f0100715:	90                   	nop    
f0100716:	90                   	nop    
f0100717:	90                   	nop    
f0100718:	90                   	nop    
f0100719:	90                   	nop    
f010071a:	90                   	nop    
f010071b:	90                   	nop    
f010071c:	90                   	nop    
f010071d:	90                   	nop    
f010071e:	90                   	nop    
f010071f:	90                   	nop    
f0100720:	90                   	nop    
f0100721:	90                   	nop    
f0100722:	90                   	nop    
f0100723:	90                   	nop    
f0100724:	90                   	nop    
f0100725:	90                   	nop    
f0100726:	90                   	nop    
f0100727:	90                   	nop    
f0100728:	90                   	nop    
f0100729:	90                   	nop    
f010072a:	90                   	nop    
f010072b:	90                   	nop    
f010072c:	90                   	nop    
f010072d:	90                   	nop    
f010072e:	90                   	nop    
f010072f:	90                   	nop    
f0100730:	90                   	nop    
f0100731:	90                   	nop    
f0100732:	90                   	nop    
f0100733:	90                   	nop    
f0100734:	90                   	nop    
f0100735:	90                   	nop    
f0100736:	90                   	nop    
f0100737:	90                   	nop    
f0100738:	90                   	nop    
f0100739:	90                   	nop    
f010073a:	90                   	nop    
f010073b:	90                   	nop    
f010073c:	90                   	nop    
f010073d:	90                   	nop    
f010073e:	90                   	nop    
f010073f:	90                   	nop    
f0100740:	90                   	nop    
f0100741:	90                   	nop    
f0100742:	90                   	nop    
f0100743:	90                   	nop    
f0100744:	90                   	nop    
f0100745:	90                   	nop    
f0100746:	90                   	nop    
f0100747:	90                   	nop    
f0100748:	90                   	nop    
f0100749:	90                   	nop    
f010074a:	90                   	nop    
f010074b:	90                   	nop    
f010074c:	90                   	nop    
f010074d:	90                   	nop    
f010074e:	90                   	nop    
f010074f:	90                   	nop    
f0100750:	90                   	nop    
f0100751:	90                   	nop    
f0100752:	90                   	nop    
f0100753:	90                   	nop    
f0100754:	90                   	nop    
f0100755:	90                   	nop    
f0100756:	90                   	nop    
f0100757:	90                   	nop    
f0100758:	90                   	nop    
f0100759:	90                   	nop    
f010075a:	90                   	nop    
f010075b:	90                   	nop    
f010075c:	90                   	nop    
f010075d:	90                   	nop    
f010075e:	90                   	nop    
f010075f:	90                   	nop    
f0100760:	90                   	nop    
f0100761:	90                   	nop    
f0100762:	90                   	nop    
f0100763:	90                   	nop    
f0100764:	90                   	nop    
f0100765:	90                   	nop    
f0100766:	90                   	nop    
f0100767:	90                   	nop    
f0100768:	90                   	nop    
f0100769:	90                   	nop    
f010076a:	90                   	nop    
f010076b:	90                   	nop    
f010076c:	90                   	nop    
f010076d:	90                   	nop    
f010076e:	90                   	nop    
f010076f:	90                   	nop    
f0100770:	90                   	nop    
f0100771:	90                   	nop    
f0100772:	90                   	nop    
f0100773:	90                   	nop    
f0100774:	90                   	nop    
f0100775:	90                   	nop    
f0100776:	90                   	nop    
f0100777:	90                   	nop    
f0100778:	90                   	nop    
f0100779:	90                   	nop    
f010077a:	90                   	nop    
f010077b:	90                   	nop    
f010077c:	90                   	nop    
f010077d:	90                   	nop    
f010077e:	90                   	nop    
f010077f:	90                   	nop    
f0100780:	90                   	nop    
f0100781:	90                   	nop    
f0100782:	90                   	nop    
f0100783:	90                   	nop    
f0100784:	90                   	nop    
f0100785:	90                   	nop    
f0100786:	90                   	nop    
f0100787:	90                   	nop    
f0100788:	90                   	nop    
f0100789:	90                   	nop    
f010078a:	90                   	nop    
f010078b:	90                   	nop    
f010078c:	90                   	nop    
f010078d:	90                   	nop    
f010078e:	90                   	nop    
f010078f:	90                   	nop    
f0100790:	90                   	nop    
f0100791:	90                   	nop    
f0100792:	90                   	nop    
f0100793:	90                   	nop    
f0100794:	90                   	nop    
f0100795:	90                   	nop    
f0100796:	90                   	nop    
f0100797:	90                   	nop    
f0100798:	90                   	nop    
f0100799:	90                   	nop    
f010079a:	90                   	nop    
f010079b:	90                   	nop    
f010079c:	90                   	nop    
f010079d:	90                   	nop    
f010079e:	90                   	nop    
f010079f:	90                   	nop    
f01007a0:	90                   	nop    
f01007a1:	90                   	nop    
f01007a2:	90                   	nop    
f01007a3:	90                   	nop    
f01007a4:	90                   	nop    
f01007a5:	90                   	nop    
f01007a6:	90                   	nop    
f01007a7:	90                   	nop    
f01007a8:	90                   	nop    
f01007a9:	90                   	nop    
f01007aa:	90                   	nop    
f01007ab:	90                   	nop    
f01007ac:	90                   	nop    
f01007ad:	90                   	nop    
f01007ae:	90                   	nop    
f01007af:	90                   	nop    
f01007b0:	90                   	nop    
f01007b1:	90                   	nop    
f01007b2:	90                   	nop    
f01007b3:	90                   	nop    
f01007b4:	90                   	nop    
f01007b5:	90                   	nop    
f01007b6:	90                   	nop    
f01007b7:	90                   	nop    
f01007b8:	90                   	nop    
f01007b9:	90                   	nop    
f01007ba:	90                   	nop    
f01007bb:	90                   	nop    
f01007bc:	90                   	nop    
f01007bd:	90                   	nop    
f01007be:	90                   	nop    
f01007bf:	90                   	nop    
f01007c0:	90                   	nop    
f01007c1:	90                   	nop    
f01007c2:	90                   	nop    
f01007c3:	90                   	nop    
f01007c4:	90                   	nop    
f01007c5:	90                   	nop    
f01007c6:	90                   	nop    
f01007c7:	90                   	nop    
f01007c8:	90                   	nop    
f01007c9:	90                   	nop    
f01007ca:	90                   	nop    
f01007cb:	90                   	nop    
f01007cc:	90                   	nop    
f01007cd:	90                   	nop    
f01007ce:	90                   	nop    
f01007cf:	90                   	nop    
f01007d0:	90                   	nop    
f01007d1:	90                   	nop    
f01007d2:	90                   	nop    
f01007d3:	90                   	nop    
f01007d4:	90                   	nop    
f01007d5:	90                   	nop    
f01007d6:	90                   	nop    
f01007d7:	90                   	nop    
f01007d8:	90                   	nop    
f01007d9:	90                   	nop    
f01007da:	90                   	nop    
f01007db:	90                   	nop    
f01007dc:	90                   	nop    
f01007dd:	90                   	nop    
f01007de:	90                   	nop    
f01007df:	90                   	nop    
f01007e0:	90                   	nop    
f01007e1:	90                   	nop    
f01007e2:	90                   	nop    
f01007e3:	90                   	nop    
f01007e4:	90                   	nop    
f01007e5:	90                   	nop    
f01007e6:	90                   	nop    
f01007e7:	90                   	nop    
f01007e8:	90                   	nop    
f01007e9:	90                   	nop    
f01007ea:	90                   	nop    
f01007eb:	90                   	nop    
f01007ec:	90                   	nop    
f01007ed:	90                   	nop    
f01007ee:	90                   	nop    
f01007ef:	90                   	nop    
f01007f0:	90                   	nop    
f01007f1:	90                   	nop    
f01007f2:	90                   	nop    
f01007f3:	90                   	nop    
f01007f4:	90                   	nop    
f01007f5:	90                   	nop    
f01007f6:	90                   	nop    
f01007f7:	90                   	nop    
f01007f8:	90                   	nop    
f01007f9:	90                   	nop    
f01007fa:	90                   	nop    
f01007fb:	90                   	nop    
f01007fc:	90                   	nop    
f01007fd:	90                   	nop    
f01007fe:	90                   	nop    
f01007ff:	90                   	nop    
f0100800:	90                   	nop    
f0100801:	90                   	nop    
f0100802:	90                   	nop    
f0100803:	90                   	nop    
f0100804:	90                   	nop    
f0100805:	90                   	nop    
f0100806:	90                   	nop    
f0100807:	90                   	nop    
f0100808:	90                   	nop    
f0100809:	90                   	nop    
f010080a:	90                   	nop    
f010080b:	90                   	nop    
f010080c:	90                   	nop    
f010080d:	90                   	nop    
f010080e:	90                   	nop    
f010080f:	90                   	nop    
f0100810:	90                   	nop    
f0100811:	90                   	nop    
f0100812:	90                   	nop    
f0100813:	90                   	nop    
f0100814:	90                   	nop    
f0100815:	90                   	nop    
f0100816:	90                   	nop    
f0100817:	90                   	nop    
f0100818:	90                   	nop    
f0100819:	90                   	nop    
f010081a:	90                   	nop    
f010081b:	90                   	nop    
f010081c:	90                   	nop    
f010081d:	90                   	nop    
f010081e:	90                   	nop    
f010081f:	90                   	nop    
f0100820:	90                   	nop    
f0100821:	90                   	nop    
f0100822:	90                   	nop    
f0100823:	90                   	nop    
f0100824:	90                   	nop    
f0100825:	90                   	nop    
f0100826:	90                   	nop    
f0100827:	90                   	nop    
f0100828:	90                   	nop    
f0100829:	90                   	nop    
f010082a:	90                   	nop    
f010082b:	90                   	nop    
f010082c:	90                   	nop    
f010082d:	90                   	nop    
f010082e:	90                   	nop    
f010082f:	90                   	nop    
f0100830:	90                   	nop    
f0100831:	90                   	nop    
f0100832:	90                   	nop    
f0100833:	90                   	nop    
f0100834:	90                   	nop    
f0100835:	90                   	nop    
f0100836:	90                   	nop    
f0100837:	90                   	nop    
f0100838:	90                   	nop    
f0100839:	90                   	nop    
f010083a:	90                   	nop    
f010083b:	90                   	nop    
f010083c:	90                   	nop    
f010083d:	90                   	nop    
f010083e:	90                   	nop    
f010083f:	90                   	nop    
f0100840:	90                   	nop    
f0100841:	90                   	nop    
f0100842:	90                   	nop    
f0100843:	90                   	nop    
f0100844:	90                   	nop    
f0100845:	90                   	nop    
f0100846:	90                   	nop    
f0100847:	90                   	nop    
f0100848:	90                   	nop    
f0100849:	90                   	nop    
f010084a:	90                   	nop    
f010084b:	90                   	nop    
f010084c:	90                   	nop    
f010084d:	90                   	nop    
f010084e:	90                   	nop    
f010084f:	90                   	nop    
f0100850:	90                   	nop    
f0100851:	90                   	nop    
f0100852:	90                   	nop    
f0100853:	90                   	nop    
f0100854:	90                   	nop    
f0100855:	90                   	nop    
f0100856:	90                   	nop    
f0100857:	90                   	nop    
f0100858:	90                   	nop    
f0100859:	90                   	nop    
f010085a:	90                   	nop    
f010085b:	90                   	nop    
f010085c:	90                   	nop    
f010085d:	90                   	nop    
f010085e:	90                   	nop    
f010085f:	90                   	nop    
f0100860:	90                   	nop    
f0100861:	90                   	nop    
f0100862:	90                   	nop    
f0100863:	90                   	nop    
f0100864:	90                   	nop    
f0100865:	90                   	nop    
f0100866:	90                   	nop    
f0100867:	90                   	nop    
f0100868:	90                   	nop    
f0100869:	90                   	nop    
f010086a:	90                   	nop    
f010086b:	90                   	nop    
f010086c:	90                   	nop    
f010086d:	90                   	nop    
f010086e:	90                   	nop    
f010086f:	90                   	nop    
f0100870:	90                   	nop    
f0100871:	90                   	nop    
f0100872:	90                   	nop    
f0100873:	90                   	nop    
f0100874:	90                   	nop    
f0100875:	90                   	nop    
f0100876:	90                   	nop    
f0100877:	90                   	nop    
f0100878:	90                   	nop    
f0100879:	90                   	nop    
f010087a:	90                   	nop    
f010087b:	90                   	nop    
f010087c:	90                   	nop    
f010087d:	90                   	nop    
f010087e:	90                   	nop    
f010087f:	90                   	nop    
f0100880:	90                   	nop    
f0100881:	90                   	nop    
f0100882:	90                   	nop    
f0100883:	90                   	nop    
f0100884:	90                   	nop    
f0100885:	90                   	nop    
f0100886:	90                   	nop    
f0100887:	90                   	nop    
f0100888:	90                   	nop    
f0100889:	90                   	nop    
f010088a:	90                   	nop    
f010088b:	90                   	nop    
f010088c:	90                   	nop    
f010088d:	90                   	nop    
f010088e:	90                   	nop    
f010088f:	90                   	nop    
f0100890:	90                   	nop    
f0100891:	90                   	nop    
f0100892:	90                   	nop    
f0100893:	90                   	nop    
f0100894:	90                   	nop    
f0100895:	90                   	nop    
f0100896:	90                   	nop    
f0100897:	90                   	nop    
f0100898:	90                   	nop    
f0100899:	90                   	nop    
f010089a:	90                   	nop    
f010089b:	90                   	nop    
f010089c:	90                   	nop    
f010089d:	90                   	nop    
f010089e:	90                   	nop    
f010089f:	90                   	nop    
f01008a0:	90                   	nop    
f01008a1:	90                   	nop    
f01008a2:	90                   	nop    
f01008a3:	90                   	nop    
f01008a4:	90                   	nop    
f01008a5:	90                   	nop    
f01008a6:	90                   	nop    
f01008a7:	90                   	nop    
f01008a8:	90                   	nop    
f01008a9:	90                   	nop    
f01008aa:	90                   	nop    
f01008ab:	90                   	nop    
f01008ac:	90                   	nop    
f01008ad:	90                   	nop    
f01008ae:	90                   	nop    
f01008af:	90                   	nop    
f01008b0:	90                   	nop    
f01008b1:	90                   	nop    
f01008b2:	90                   	nop    
f01008b3:	90                   	nop    
f01008b4:	90                   	nop    
f01008b5:	90                   	nop    
f01008b6:	90                   	nop    
f01008b7:	90                   	nop    
f01008b8:	90                   	nop    
f01008b9:	90                   	nop    
f01008ba:	90                   	nop    
f01008bb:	90                   	nop    
f01008bc:	90                   	nop    
f01008bd:	90                   	nop    
f01008be:	90                   	nop    
f01008bf:	90                   	nop    
f01008c0:	90                   	nop    
f01008c1:	90                   	nop    
f01008c2:	90                   	nop    
f01008c3:	90                   	nop    
f01008c4:	90                   	nop    
f01008c5:	90                   	nop    
f01008c6:	90                   	nop    
f01008c7:	90                   	nop    
f01008c8:	90                   	nop    
f01008c9:	90                   	nop    
f01008ca:	90                   	nop    
f01008cb:	90                   	nop    
f01008cc:	90                   	nop    
f01008cd:	90                   	nop    
f01008ce:	90                   	nop    
f01008cf:	90                   	nop    
f01008d0:	90                   	nop    
f01008d1:	90                   	nop    
f01008d2:	90                   	nop    
f01008d3:	90                   	nop    
f01008d4:	90                   	nop    
f01008d5:	90                   	nop    
f01008d6:	90                   	nop    
f01008d7:	90                   	nop    
f01008d8:	90                   	nop    
f01008d9:	90                   	nop    
f01008da:	90                   	nop    
f01008db:	90                   	nop    
f01008dc:	90                   	nop    
f01008dd:	90                   	nop    
f01008de:	90                   	nop    
f01008df:	90                   	nop    
f01008e0:	90                   	nop    
f01008e1:	90                   	nop    
f01008e2:	90                   	nop    
f01008e3:	90                   	nop    
f01008e4:	90                   	nop    
f01008e5:	90                   	nop    
f01008e6:	90                   	nop    
f01008e7:	90                   	nop    
f01008e8:	90                   	nop    
f01008e9:	90                   	nop    
f01008ea:	90                   	nop    
f01008eb:	90                   	nop    
f01008ec:	90                   	nop    
f01008ed:	90                   	nop    
f01008ee:	90                   	nop    
f01008ef:	90                   	nop    
f01008f0:	90                   	nop    
f01008f1:	90                   	nop    
f01008f2:	90                   	nop    
f01008f3:	90                   	nop    
f01008f4:	90                   	nop    
f01008f5:	90                   	nop    
f01008f6:	90                   	nop    
f01008f7:	90                   	nop    
f01008f8:	90                   	nop    
f01008f9:	90                   	nop    
f01008fa:	90                   	nop    
f01008fb:	90                   	nop    
f01008fc:	90                   	nop    
f01008fd:	90                   	nop    
f01008fe:	90                   	nop    
f01008ff:	90                   	nop    
f0100900:	90                   	nop    
f0100901:	90                   	nop    
f0100902:	90                   	nop    
f0100903:	90                   	nop    
f0100904:	90                   	nop    
f0100905:	90                   	nop    
f0100906:	90                   	nop    
f0100907:	90                   	nop    
f0100908:	90                   	nop    
f0100909:	90                   	nop    
f010090a:	90                   	nop    
f010090b:	90                   	nop    
f010090c:	90                   	nop    
f010090d:	90                   	nop    
f010090e:	90                   	nop    
f010090f:	90                   	nop    
f0100910:	90                   	nop    
f0100911:	90                   	nop    
f0100912:	90                   	nop    
f0100913:	90                   	nop    
f0100914:	90                   	nop    
f0100915:	90                   	nop    
f0100916:	90                   	nop    
f0100917:	90                   	nop    
f0100918:	90                   	nop    
f0100919:	90                   	nop    
f010091a:	90                   	nop    
f010091b:	90                   	nop    
f010091c:	90                   	nop    
f010091d:	90                   	nop    
f010091e:	90                   	nop    
f010091f:	90                   	nop    
f0100920:	90                   	nop    
f0100921:	90                   	nop    
f0100922:	90                   	nop    
f0100923:	90                   	nop    
f0100924:	90                   	nop    
f0100925:	90                   	nop    
f0100926:	90                   	nop    
f0100927:	90                   	nop    
f0100928:	90                   	nop    
f0100929:	90                   	nop    
f010092a:	90                   	nop    
f010092b:	90                   	nop    
f010092c:	90                   	nop    
f010092d:	90                   	nop    
f010092e:	90                   	nop    
f010092f:	90                   	nop    
f0100930:	90                   	nop    
f0100931:	90                   	nop    
f0100932:	90                   	nop    
f0100933:	90                   	nop    
f0100934:	90                   	nop    
f0100935:	90                   	nop    
f0100936:	90                   	nop    
f0100937:	90                   	nop    
f0100938:	90                   	nop    
f0100939:	90                   	nop    
f010093a:	90                   	nop    
f010093b:	90                   	nop    
f010093c:	90                   	nop    
f010093d:	90                   	nop    
f010093e:	90                   	nop    
f010093f:	90                   	nop    
f0100940:	90                   	nop    
f0100941:	90                   	nop    
f0100942:	90                   	nop    
f0100943:	90                   	nop    
f0100944:	90                   	nop    
f0100945:	90                   	nop    
f0100946:	90                   	nop    
f0100947:	90                   	nop    
f0100948:	90                   	nop    
f0100949:	90                   	nop    
f010094a:	90                   	nop    
f010094b:	90                   	nop    
f010094c:	90                   	nop    
f010094d:	90                   	nop    
f010094e:	90                   	nop    
f010094f:	90                   	nop    
f0100950:	90                   	nop    
f0100951:	90                   	nop    
f0100952:	90                   	nop    
f0100953:	90                   	nop    
f0100954:	90                   	nop    
f0100955:	90                   	nop    
f0100956:	90                   	nop    
f0100957:	90                   	nop    
f0100958:	90                   	nop    
f0100959:	90                   	nop    
f010095a:	90                   	nop    
f010095b:	90                   	nop    
f010095c:	90                   	nop    
f010095d:	90                   	nop    
f010095e:	90                   	nop    
f010095f:	90                   	nop    
f0100960:	90                   	nop    
f0100961:	90                   	nop    
f0100962:	90                   	nop    
f0100963:	90                   	nop    
f0100964:	90                   	nop    
f0100965:	90                   	nop    
f0100966:	90                   	nop    
f0100967:	90                   	nop    
f0100968:	90                   	nop    
f0100969:	90                   	nop    
f010096a:	90                   	nop    
f010096b:	90                   	nop    
f010096c:	90                   	nop    
f010096d:	90                   	nop    
f010096e:	90                   	nop    
f010096f:	90                   	nop    
f0100970:	90                   	nop    
f0100971:	90                   	nop    
f0100972:	90                   	nop    
f0100973:	90                   	nop    
f0100974:	90                   	nop    
f0100975:	90                   	nop    
f0100976:	90                   	nop    
f0100977:	90                   	nop    
f0100978:	90                   	nop    
f0100979:	90                   	nop    
f010097a:	90                   	nop    
f010097b:	90                   	nop    
f010097c:	90                   	nop    
f010097d:	90                   	nop    
f010097e:	90                   	nop    
f010097f:	90                   	nop    
f0100980:	90                   	nop    
f0100981:	90                   	nop    
f0100982:	90                   	nop    
f0100983:	90                   	nop    
f0100984:	90                   	nop    
f0100985:	90                   	nop    
f0100986:	90                   	nop    
f0100987:	90                   	nop    
f0100988:	90                   	nop    
f0100989:	90                   	nop    
f010098a:	90                   	nop    
f010098b:	90                   	nop    
f010098c:	90                   	nop    
f010098d:	90                   	nop    
f010098e:	90                   	nop    
f010098f:	90                   	nop    
f0100990:	90                   	nop    
f0100991:	90                   	nop    
f0100992:	90                   	nop    
f0100993:	90                   	nop    
f0100994:	90                   	nop    
f0100995:	90                   	nop    
f0100996:	90                   	nop    
f0100997:	90                   	nop    
f0100998:	90                   	nop    
f0100999:	90                   	nop    
f010099a:	90                   	nop    
f010099b:	90                   	nop    
f010099c:	90                   	nop    
f010099d:	90                   	nop    
f010099e:	90                   	nop    
f010099f:	90                   	nop    
f01009a0:	90                   	nop    
f01009a1:	90                   	nop    
f01009a2:	90                   	nop    
f01009a3:	90                   	nop    
f01009a4:	90                   	nop    
f01009a5:	90                   	nop    
f01009a6:	90                   	nop    
f01009a7:	90                   	nop    
f01009a8:	90                   	nop    
f01009a9:	90                   	nop    
f01009aa:	90                   	nop    
f01009ab:	90                   	nop    
f01009ac:	90                   	nop    
f01009ad:	90                   	nop    
f01009ae:	90                   	nop    
f01009af:	90                   	nop    
f01009b0:	90                   	nop    
f01009b1:	90                   	nop    
f01009b2:	90                   	nop    
f01009b3:	90                   	nop    
f01009b4:	90                   	nop    
f01009b5:	90                   	nop    
f01009b6:	90                   	nop    
f01009b7:	90                   	nop    
f01009b8:	90                   	nop    
f01009b9:	90                   	nop    
f01009ba:	90                   	nop    
f01009bb:	90                   	nop    
f01009bc:	90                   	nop    
f01009bd:	90                   	nop    
f01009be:	90                   	nop    
f01009bf:	90                   	nop    
f01009c0:	90                   	nop    
f01009c1:	90                   	nop    
f01009c2:	90                   	nop    
f01009c3:	90                   	nop    
f01009c4:	90                   	nop    
f01009c5:	90                   	nop    
f01009c6:	90                   	nop    
f01009c7:	90                   	nop    
f01009c8:	90                   	nop    
f01009c9:	90                   	nop    
f01009ca:	90                   	nop    
f01009cb:	90                   	nop    
f01009cc:	90                   	nop    
f01009cd:	90                   	nop    
f01009ce:	90                   	nop    
f01009cf:	90                   	nop    
f01009d0:	90                   	nop    
f01009d1:	90                   	nop    
f01009d2:	90                   	nop    
f01009d3:	90                   	nop    
f01009d4:	90                   	nop    
f01009d5:	90                   	nop    
f01009d6:	90                   	nop    
f01009d7:	90                   	nop    
f01009d8:	90                   	nop    
f01009d9:	90                   	nop    
f01009da:	90                   	nop    
f01009db:	90                   	nop    
f01009dc:	90                   	nop    
f01009dd:	90                   	nop    
f01009de:	90                   	nop    
f01009df:	90                   	nop    
f01009e0:	90                   	nop    
f01009e1:	90                   	nop    
f01009e2:	90                   	nop    
f01009e3:	90                   	nop    
f01009e4:	90                   	nop    
f01009e5:	90                   	nop    
f01009e6:	90                   	nop    
f01009e7:	90                   	nop    
f01009e8:	90                   	nop    
f01009e9:	90                   	nop    
f01009ea:	90                   	nop    
f01009eb:	90                   	nop    
f01009ec:	90                   	nop    
f01009ed:	90                   	nop    
f01009ee:	90                   	nop    
f01009ef:	90                   	nop    
f01009f0:	90                   	nop    
f01009f1:	90                   	nop    
f01009f2:	90                   	nop    
f01009f3:	90                   	nop    
f01009f4:	90                   	nop    
f01009f5:	90                   	nop    
f01009f6:	90                   	nop    
f01009f7:	90                   	nop    
f01009f8:	90                   	nop    
f01009f9:	90                   	nop    
f01009fa:	90                   	nop    
f01009fb:	90                   	nop    
f01009fc:	90                   	nop    
f01009fd:	90                   	nop    
f01009fe:	90                   	nop    
f01009ff:	90                   	nop    
f0100a00:	90                   	nop    
f0100a01:	90                   	nop    
f0100a02:	90                   	nop    
f0100a03:	90                   	nop    
f0100a04:	90                   	nop    
f0100a05:	90                   	nop    
f0100a06:	90                   	nop    
f0100a07:	90                   	nop    
f0100a08:	90                   	nop    
f0100a09:	90                   	nop    
f0100a0a:	90                   	nop    
f0100a0b:	90                   	nop    
f0100a0c:	90                   	nop    
f0100a0d:	90                   	nop    
f0100a0e:	90                   	nop    
f0100a0f:	90                   	nop    
f0100a10:	90                   	nop    
f0100a11:	90                   	nop    
f0100a12:	90                   	nop    
f0100a13:	90                   	nop    
f0100a14:	90                   	nop    
f0100a15:	90                   	nop    
f0100a16:	90                   	nop    
f0100a17:	90                   	nop    
f0100a18:	90                   	nop    
f0100a19:	90                   	nop    
f0100a1a:	90                   	nop    
f0100a1b:	90                   	nop    
f0100a1c:	90                   	nop    
f0100a1d:	90                   	nop    
f0100a1e:	90                   	nop    
f0100a1f:	90                   	nop    
f0100a20:	90                   	nop    
f0100a21:	90                   	nop    
f0100a22:	90                   	nop    
f0100a23:	90                   	nop    
f0100a24:	90                   	nop    
f0100a25:	90                   	nop    
f0100a26:	90                   	nop    
f0100a27:	90                   	nop    
f0100a28:	90                   	nop    
f0100a29:	90                   	nop    
f0100a2a:	90                   	nop    
f0100a2b:	90                   	nop    
f0100a2c:	90                   	nop    
f0100a2d:	90                   	nop    
f0100a2e:	90                   	nop    
f0100a2f:	90                   	nop    
f0100a30:	90                   	nop    
f0100a31:	90                   	nop    
f0100a32:	90                   	nop    
f0100a33:	90                   	nop    
f0100a34:	90                   	nop    
f0100a35:	90                   	nop    
f0100a36:	90                   	nop    
f0100a37:	90                   	nop    
f0100a38:	90                   	nop    
f0100a39:	90                   	nop    
f0100a3a:	90                   	nop    
f0100a3b:	90                   	nop    
f0100a3c:	90                   	nop    
f0100a3d:	90                   	nop    
f0100a3e:	90                   	nop    
f0100a3f:	90                   	nop    
f0100a40:	90                   	nop    
f0100a41:	90                   	nop    
f0100a42:	90                   	nop    
f0100a43:	90                   	nop    
f0100a44:	90                   	nop    
f0100a45:	90                   	nop    
f0100a46:	90                   	nop    
f0100a47:	90                   	nop    
f0100a48:	90                   	nop    
f0100a49:	90                   	nop    
f0100a4a:	90                   	nop    
f0100a4b:	90                   	nop    
f0100a4c:	90                   	nop    
f0100a4d:	90                   	nop    
f0100a4e:	90                   	nop    
f0100a4f:	90                   	nop    
f0100a50:	90                   	nop    
f0100a51:	90                   	nop    
f0100a52:	90                   	nop    
f0100a53:	90                   	nop    
f0100a54:	90                   	nop    
f0100a55:	90                   	nop    
f0100a56:	90                   	nop    
f0100a57:	90                   	nop    
f0100a58:	90                   	nop    
f0100a59:	90                   	nop    
f0100a5a:	90                   	nop    
f0100a5b:	90                   	nop    
f0100a5c:	90                   	nop    
f0100a5d:	90                   	nop    
f0100a5e:	90                   	nop    
f0100a5f:	90                   	nop    
f0100a60:	90                   	nop    
f0100a61:	90                   	nop    
f0100a62:	90                   	nop    
f0100a63:	90                   	nop    
f0100a64:	90                   	nop    
f0100a65:	90                   	nop    
f0100a66:	90                   	nop    
f0100a67:	90                   	nop    
f0100a68:	90                   	nop    
f0100a69:	90                   	nop    
f0100a6a:	90                   	nop    
f0100a6b:	90                   	nop    
f0100a6c:	90                   	nop    
f0100a6d:	90                   	nop    
f0100a6e:	90                   	nop    
f0100a6f:	90                   	nop    
f0100a70:	90                   	nop    
f0100a71:	90                   	nop    
f0100a72:	90                   	nop    
f0100a73:	90                   	nop    
f0100a74:	90                   	nop    
f0100a75:	90                   	nop    
f0100a76:	90                   	nop    
f0100a77:	90                   	nop    
f0100a78:	90                   	nop    
f0100a79:	90                   	nop    
f0100a7a:	90                   	nop    
f0100a7b:	90                   	nop    
f0100a7c:	90                   	nop    
f0100a7d:	90                   	nop    
f0100a7e:	90                   	nop    
f0100a7f:	90                   	nop    
f0100a80:	90                   	nop    
f0100a81:	90                   	nop    
f0100a82:	90                   	nop    
f0100a83:	90                   	nop    
f0100a84:	90                   	nop    
f0100a85:	90                   	nop    
f0100a86:	90                   	nop    
f0100a87:	90                   	nop    
f0100a88:	90                   	nop    
f0100a89:	90                   	nop    
f0100a8a:	90                   	nop    
f0100a8b:	90                   	nop    
f0100a8c:	90                   	nop    
f0100a8d:	90                   	nop    
f0100a8e:	90                   	nop    
f0100a8f:	90                   	nop    
f0100a90:	90                   	nop    
f0100a91:	90                   	nop    
f0100a92:	90                   	nop    
f0100a93:	90                   	nop    
f0100a94:	90                   	nop    
f0100a95:	90                   	nop    
f0100a96:	90                   	nop    
f0100a97:	90                   	nop    
f0100a98:	90                   	nop    
f0100a99:	90                   	nop    
f0100a9a:	90                   	nop    
f0100a9b:	90                   	nop    
f0100a9c:	90                   	nop    
f0100a9d:	90                   	nop    
f0100a9e:	90                   	nop    
f0100a9f:	90                   	nop    
f0100aa0:	90                   	nop    
f0100aa1:	90                   	nop    
f0100aa2:	90                   	nop    
f0100aa3:	90                   	nop    
f0100aa4:	90                   	nop    
f0100aa5:	90                   	nop    
f0100aa6:	90                   	nop    
f0100aa7:	90                   	nop    
f0100aa8:	90                   	nop    
f0100aa9:	90                   	nop    
f0100aaa:	90                   	nop    
f0100aab:	90                   	nop    
f0100aac:	90                   	nop    
f0100aad:	90                   	nop    
f0100aae:	90                   	nop    
f0100aaf:	90                   	nop    
f0100ab0:	90                   	nop    
f0100ab1:	90                   	nop    
f0100ab2:	90                   	nop    
f0100ab3:	90                   	nop    
f0100ab4:	90                   	nop    
f0100ab5:	90                   	nop    
f0100ab6:	90                   	nop    
f0100ab7:	90                   	nop    
f0100ab8:	90                   	nop    
f0100ab9:	90                   	nop    
f0100aba:	90                   	nop    
f0100abb:	90                   	nop    
f0100abc:	90                   	nop    
f0100abd:	90                   	nop    
f0100abe:	90                   	nop    
f0100abf:	90                   	nop    
f0100ac0:	90                   	nop    
f0100ac1:	90                   	nop    
f0100ac2:	90                   	nop    
f0100ac3:	90                   	nop    
f0100ac4:	90                   	nop    
f0100ac5:	90                   	nop    
f0100ac6:	90                   	nop    
f0100ac7:	90                   	nop    
f0100ac8:	90                   	nop    
f0100ac9:	90                   	nop    
f0100aca:	90                   	nop    
f0100acb:	90                   	nop    
f0100acc:	90                   	nop    
f0100acd:	90                   	nop    
f0100ace:	90                   	nop    
f0100acf:	90                   	nop    
f0100ad0:	90                   	nop    
f0100ad1:	90                   	nop    
f0100ad2:	90                   	nop    
f0100ad3:	90                   	nop    
f0100ad4:	90                   	nop    
f0100ad5:	90                   	nop    
f0100ad6:	90                   	nop    
f0100ad7:	90                   	nop    
f0100ad8:	90                   	nop    
f0100ad9:	90                   	nop    
f0100ada:	90                   	nop    
f0100adb:	90                   	nop    
f0100adc:	90                   	nop    
f0100add:	90                   	nop    
f0100ade:	90                   	nop    
f0100adf:	90                   	nop    
f0100ae0:	90                   	nop    
f0100ae1:	90                   	nop    
f0100ae2:	90                   	nop    
f0100ae3:	90                   	nop    
f0100ae4:	90                   	nop    
f0100ae5:	90                   	nop    
f0100ae6:	90                   	nop    
f0100ae7:	90                   	nop    
f0100ae8:	90                   	nop    
f0100ae9:	90                   	nop    
f0100aea:	90                   	nop    
f0100aeb:	90                   	nop    
f0100aec:	90                   	nop    
f0100aed:	90                   	nop    
f0100aee:	90                   	nop    
f0100aef:	90                   	nop    
f0100af0:	90                   	nop    
f0100af1:	90                   	nop    
f0100af2:	90                   	nop    
f0100af3:	90                   	nop    
f0100af4:	90                   	nop    
f0100af5:	90                   	nop    
f0100af6:	90                   	nop    
f0100af7:	90                   	nop    
f0100af8:	90                   	nop    
f0100af9:	90                   	nop    
f0100afa:	90                   	nop    
f0100afb:	90                   	nop    
f0100afc:	90                   	nop    
f0100afd:	90                   	nop    
f0100afe:	90                   	nop    
f0100aff:	90                   	nop    
f0100b00:	90                   	nop    
f0100b01:	90                   	nop    
f0100b02:	90                   	nop    
f0100b03:	90                   	nop    
f0100b04:	90                   	nop    
f0100b05:	90                   	nop    
f0100b06:	90                   	nop    
f0100b07:	90                   	nop    
f0100b08:	90                   	nop    
f0100b09:	90                   	nop    
f0100b0a:	90                   	nop    
f0100b0b:	90                   	nop    
f0100b0c:	90                   	nop    
f0100b0d:	90                   	nop    
f0100b0e:	90                   	nop    
f0100b0f:	90                   	nop    
f0100b10:	90                   	nop    
f0100b11:	90                   	nop    
f0100b12:	90                   	nop    
f0100b13:	90                   	nop    
f0100b14:	90                   	nop    
f0100b15:	90                   	nop    
f0100b16:	90                   	nop    
f0100b17:	90                   	nop    
f0100b18:	90                   	nop    
f0100b19:	90                   	nop    
f0100b1a:	90                   	nop    
f0100b1b:	90                   	nop    
f0100b1c:	90                   	nop    
f0100b1d:	90                   	nop    
f0100b1e:	90                   	nop    
f0100b1f:	90                   	nop    
f0100b20:	90                   	nop    
f0100b21:	90                   	nop    
f0100b22:	90                   	nop    
f0100b23:	90                   	nop    
f0100b24:	90                   	nop    
f0100b25:	90                   	nop    
f0100b26:	90                   	nop    
f0100b27:	90                   	nop    
f0100b28:	90                   	nop    
f0100b29:	90                   	nop    
f0100b2a:	90                   	nop    
f0100b2b:	90                   	nop    
f0100b2c:	90                   	nop    
f0100b2d:	90                   	nop    
f0100b2e:	90                   	nop    
f0100b2f:	90                   	nop    
f0100b30:	90                   	nop    
f0100b31:	90                   	nop    
f0100b32:	90                   	nop    
f0100b33:	90                   	nop    
f0100b34:	90                   	nop    
f0100b35:	90                   	nop    
f0100b36:	90                   	nop    
f0100b37:	90                   	nop    
f0100b38:	90                   	nop    
f0100b39:	90                   	nop    
f0100b3a:	90                   	nop    
f0100b3b:	90                   	nop    
f0100b3c:	90                   	nop    
f0100b3d:	90                   	nop    
f0100b3e:	90                   	nop    
f0100b3f:	90                   	nop    
f0100b40:	90                   	nop    
f0100b41:	90                   	nop    
f0100b42:	90                   	nop    
f0100b43:	90                   	nop    
f0100b44:	90                   	nop    
f0100b45:	90                   	nop    
f0100b46:	90                   	nop    
f0100b47:	90                   	nop    
f0100b48:	90                   	nop    
f0100b49:	90                   	nop    
f0100b4a:	90                   	nop    
f0100b4b:	90                   	nop    
f0100b4c:	90                   	nop    
f0100b4d:	90                   	nop    
f0100b4e:	90                   	nop    
f0100b4f:	90                   	nop    
f0100b50:	90                   	nop    
f0100b51:	90                   	nop    
f0100b52:	90                   	nop    
f0100b53:	90                   	nop    
f0100b54:	90                   	nop    
f0100b55:	90                   	nop    
f0100b56:	90                   	nop    
f0100b57:	90                   	nop    
f0100b58:	90                   	nop    
f0100b59:	90                   	nop    
f0100b5a:	90                   	nop    
f0100b5b:	90                   	nop    
f0100b5c:	90                   	nop    
f0100b5d:	90                   	nop    
f0100b5e:	90                   	nop    
f0100b5f:	90                   	nop    
f0100b60:	90                   	nop    
f0100b61:	90                   	nop    
f0100b62:	90                   	nop    
f0100b63:	90                   	nop    
f0100b64:	90                   	nop    
f0100b65:	90                   	nop    
f0100b66:	90                   	nop    
f0100b67:	90                   	nop    
f0100b68:	90                   	nop    
f0100b69:	90                   	nop    
f0100b6a:	90                   	nop    
f0100b6b:	90                   	nop    
f0100b6c:	90                   	nop    
f0100b6d:	90                   	nop    
f0100b6e:	90                   	nop    
f0100b6f:	90                   	nop    
f0100b70:	90                   	nop    
f0100b71:	90                   	nop    
f0100b72:	90                   	nop    
f0100b73:	90                   	nop    
f0100b74:	90                   	nop    
f0100b75:	90                   	nop    
f0100b76:	90                   	nop    
f0100b77:	90                   	nop    
f0100b78:	90                   	nop    
f0100b79:	90                   	nop    
f0100b7a:	90                   	nop    
f0100b7b:	90                   	nop    
f0100b7c:	90                   	nop    
f0100b7d:	90                   	nop    
f0100b7e:	90                   	nop    
f0100b7f:	90                   	nop    
f0100b80:	90                   	nop    
f0100b81:	90                   	nop    
f0100b82:	90                   	nop    
f0100b83:	90                   	nop    
f0100b84:	90                   	nop    
f0100b85:	90                   	nop    
f0100b86:	90                   	nop    
f0100b87:	90                   	nop    
f0100b88:	90                   	nop    
f0100b89:	90                   	nop    
f0100b8a:	90                   	nop    
f0100b8b:	90                   	nop    
f0100b8c:	90                   	nop    
f0100b8d:	90                   	nop    
f0100b8e:	90                   	nop    
f0100b8f:	90                   	nop    
f0100b90:	90                   	nop    
f0100b91:	90                   	nop    
f0100b92:	90                   	nop    
f0100b93:	90                   	nop    
f0100b94:	90                   	nop    
f0100b95:	90                   	nop    
f0100b96:	90                   	nop    
f0100b97:	90                   	nop    
f0100b98:	90                   	nop    
f0100b99:	90                   	nop    
f0100b9a:	90                   	nop    
f0100b9b:	90                   	nop    
f0100b9c:	90                   	nop    
f0100b9d:	90                   	nop    
f0100b9e:	90                   	nop    
f0100b9f:	90                   	nop    
f0100ba0:	90                   	nop    
f0100ba1:	90                   	nop    
f0100ba2:	90                   	nop    
f0100ba3:	90                   	nop    
f0100ba4:	90                   	nop    
f0100ba5:	90                   	nop    
f0100ba6:	90                   	nop    
f0100ba7:	90                   	nop    
f0100ba8:	90                   	nop    
f0100ba9:	90                   	nop    
f0100baa:	90                   	nop    
f0100bab:	90                   	nop    
f0100bac:	90                   	nop    
f0100bad:	90                   	nop    
f0100bae:	90                   	nop    
f0100baf:	90                   	nop    
f0100bb0:	90                   	nop    
f0100bb1:	90                   	nop    
f0100bb2:	90                   	nop    
f0100bb3:	90                   	nop    
f0100bb4:	90                   	nop    
f0100bb5:	90                   	nop    
f0100bb6:	90                   	nop    
f0100bb7:	90                   	nop    
f0100bb8:	90                   	nop    
f0100bb9:	90                   	nop    
f0100bba:	90                   	nop    
f0100bbb:	90                   	nop    
f0100bbc:	90                   	nop    
f0100bbd:	90                   	nop    
f0100bbe:	90                   	nop    
f0100bbf:	90                   	nop    
f0100bc0:	90                   	nop    
f0100bc1:	90                   	nop    
f0100bc2:	90                   	nop    
f0100bc3:	90                   	nop    
f0100bc4:	90                   	nop    
f0100bc5:	90                   	nop    
f0100bc6:	90                   	nop    
f0100bc7:	90                   	nop    
f0100bc8:	90                   	nop    
f0100bc9:	90                   	nop    
f0100bca:	90                   	nop    
f0100bcb:	90                   	nop    
f0100bcc:	90                   	nop    
f0100bcd:	90                   	nop    
f0100bce:	90                   	nop    
f0100bcf:	90                   	nop    
f0100bd0:	90                   	nop    
f0100bd1:	90                   	nop    
f0100bd2:	90                   	nop    
f0100bd3:	90                   	nop    
f0100bd4:	90                   	nop    
f0100bd5:	90                   	nop    
f0100bd6:	90                   	nop    
f0100bd7:	90                   	nop    
f0100bd8:	90                   	nop    
f0100bd9:	90                   	nop    
f0100bda:	90                   	nop    
f0100bdb:	90                   	nop    
f0100bdc:	90                   	nop    
f0100bdd:	90                   	nop    
f0100bde:	90                   	nop    
f0100bdf:	90                   	nop    
f0100be0:	90                   	nop    
f0100be1:	90                   	nop    
f0100be2:	90                   	nop    
f0100be3:	90                   	nop    
f0100be4:	90                   	nop    
f0100be5:	90                   	nop    
f0100be6:	90                   	nop    
f0100be7:	90                   	nop    
f0100be8:	90                   	nop    
f0100be9:	90                   	nop    
f0100bea:	90                   	nop    
f0100beb:	90                   	nop    
f0100bec:	90                   	nop    
f0100bed:	90                   	nop    
f0100bee:	90                   	nop    
f0100bef:	90                   	nop    
f0100bf0:	90                   	nop    
f0100bf1:	90                   	nop    
f0100bf2:	90                   	nop    
f0100bf3:	90                   	nop    
f0100bf4:	90                   	nop    
f0100bf5:	90                   	nop    
f0100bf6:	90                   	nop    
f0100bf7:	90                   	nop    
f0100bf8:	90                   	nop    
f0100bf9:	90                   	nop    
f0100bfa:	90                   	nop    
f0100bfb:	90                   	nop    
f0100bfc:	90                   	nop    
f0100bfd:	90                   	nop    
f0100bfe:	90                   	nop    
f0100bff:	90                   	nop    
f0100c00:	90                   	nop    
f0100c01:	90                   	nop    
f0100c02:	90                   	nop    
f0100c03:	90                   	nop    
f0100c04:	90                   	nop    
f0100c05:	90                   	nop    
f0100c06:	90                   	nop    
f0100c07:	90                   	nop    
f0100c08:	90                   	nop    
f0100c09:	90                   	nop    
f0100c0a:	90                   	nop    
f0100c0b:	90                   	nop    
f0100c0c:	90                   	nop    
f0100c0d:	90                   	nop    
f0100c0e:	90                   	nop    
f0100c0f:	90                   	nop    
f0100c10:	90                   	nop    
f0100c11:	90                   	nop    
f0100c12:	90                   	nop    
f0100c13:	90                   	nop    
f0100c14:	90                   	nop    
f0100c15:	90                   	nop    
f0100c16:	90                   	nop    
f0100c17:	90                   	nop    
f0100c18:	90                   	nop    
f0100c19:	90                   	nop    
f0100c1a:	90                   	nop    
f0100c1b:	90                   	nop    
f0100c1c:	90                   	nop    
f0100c1d:	90                   	nop    
f0100c1e:	90                   	nop    
f0100c1f:	90                   	nop    
f0100c20:	90                   	nop    
f0100c21:	90                   	nop    
f0100c22:	90                   	nop    
f0100c23:	90                   	nop    
f0100c24:	90                   	nop    
f0100c25:	90                   	nop    
f0100c26:	90                   	nop    
f0100c27:	90                   	nop    
f0100c28:	90                   	nop    
f0100c29:	90                   	nop    
f0100c2a:	90                   	nop    
f0100c2b:	90                   	nop    
f0100c2c:	90                   	nop    
f0100c2d:	90                   	nop    
f0100c2e:	90                   	nop    
f0100c2f:	90                   	nop    
f0100c30:	90                   	nop    
f0100c31:	90                   	nop    
f0100c32:	90                   	nop    
f0100c33:	90                   	nop    
f0100c34:	90                   	nop    
f0100c35:	90                   	nop    
f0100c36:	90                   	nop    
f0100c37:	90                   	nop    
f0100c38:	90                   	nop    
f0100c39:	90                   	nop    
f0100c3a:	90                   	nop    
f0100c3b:	90                   	nop    
f0100c3c:	90                   	nop    
f0100c3d:	90                   	nop    
f0100c3e:	90                   	nop    
f0100c3f:	90                   	nop    
f0100c40:	90                   	nop    
f0100c41:	90                   	nop    
f0100c42:	90                   	nop    
f0100c43:	90                   	nop    
f0100c44:	90                   	nop    
f0100c45:	90                   	nop    
f0100c46:	90                   	nop    
f0100c47:	90                   	nop    
f0100c48:	90                   	nop    
f0100c49:	90                   	nop    
f0100c4a:	90                   	nop    
f0100c4b:	90                   	nop    
f0100c4c:	90                   	nop    
f0100c4d:	90                   	nop    
f0100c4e:	90                   	nop    
f0100c4f:	90                   	nop    
f0100c50:	90                   	nop    
f0100c51:	90                   	nop    
f0100c52:	90                   	nop    
f0100c53:	90                   	nop    
f0100c54:	90                   	nop    
f0100c55:	90                   	nop    
f0100c56:	90                   	nop    
f0100c57:	90                   	nop    
f0100c58:	90                   	nop    
f0100c59:	90                   	nop    
f0100c5a:	90                   	nop    
f0100c5b:	90                   	nop    
f0100c5c:	90                   	nop    
f0100c5d:	90                   	nop    
f0100c5e:	90                   	nop    
f0100c5f:	90                   	nop    
f0100c60:	90                   	nop    
f0100c61:	90                   	nop    
f0100c62:	90                   	nop    
f0100c63:	90                   	nop    
f0100c64:	90                   	nop    
f0100c65:	90                   	nop    
f0100c66:	90                   	nop    
f0100c67:	90                   	nop    
f0100c68:	90                   	nop    
f0100c69:	90                   	nop    
f0100c6a:	90                   	nop    
f0100c6b:	90                   	nop    
f0100c6c:	90                   	nop    
f0100c6d:	90                   	nop    
f0100c6e:	90                   	nop    
f0100c6f:	90                   	nop    
f0100c70:	90                   	nop    
f0100c71:	90                   	nop    
f0100c72:	90                   	nop    
f0100c73:	90                   	nop    
f0100c74:	90                   	nop    
f0100c75:	90                   	nop    
f0100c76:	90                   	nop    
f0100c77:	90                   	nop    
f0100c78:	90                   	nop    
f0100c79:	90                   	nop    
f0100c7a:	90                   	nop    
f0100c7b:	90                   	nop    
f0100c7c:	90                   	nop    
f0100c7d:	90                   	nop    
f0100c7e:	90                   	nop    
f0100c7f:	90                   	nop    
f0100c80:	90                   	nop    
f0100c81:	90                   	nop    
f0100c82:	90                   	nop    
f0100c83:	90                   	nop    
f0100c84:	90                   	nop    
f0100c85:	90                   	nop    
f0100c86:	90                   	nop    
f0100c87:	90                   	nop    
f0100c88:	90                   	nop    
f0100c89:	90                   	nop    
f0100c8a:	90                   	nop    
f0100c8b:	90                   	nop    
f0100c8c:	90                   	nop    
f0100c8d:	90                   	nop    
f0100c8e:	90                   	nop    
f0100c8f:	90                   	nop    
f0100c90:	90                   	nop    
f0100c91:	90                   	nop    
f0100c92:	90                   	nop    
f0100c93:	90                   	nop    
f0100c94:	90                   	nop    
f0100c95:	90                   	nop    
f0100c96:	90                   	nop    
f0100c97:	90                   	nop    
f0100c98:	90                   	nop    
f0100c99:	90                   	nop    
f0100c9a:	90                   	nop    
f0100c9b:	90                   	nop    
f0100c9c:	90                   	nop    
f0100c9d:	90                   	nop    
f0100c9e:	90                   	nop    
f0100c9f:	90                   	nop    
f0100ca0:	90                   	nop    
f0100ca1:	90                   	nop    
f0100ca2:	90                   	nop    
f0100ca3:	90                   	nop    
f0100ca4:	90                   	nop    
f0100ca5:	90                   	nop    
f0100ca6:	90                   	nop    
f0100ca7:	90                   	nop    
f0100ca8:	90                   	nop    
f0100ca9:	90                   	nop    
f0100caa:	90                   	nop    
f0100cab:	90                   	nop    
f0100cac:	90                   	nop    
f0100cad:	90                   	nop    
f0100cae:	90                   	nop    
f0100caf:	90                   	nop    
f0100cb0:	90                   	nop    
f0100cb1:	90                   	nop    
f0100cb2:	90                   	nop    
f0100cb3:	90                   	nop    
f0100cb4:	90                   	nop    
f0100cb5:	90                   	nop    
f0100cb6:	90                   	nop    
f0100cb7:	90                   	nop    
f0100cb8:	90                   	nop    
f0100cb9:	90                   	nop    
f0100cba:	90                   	nop    
f0100cbb:	90                   	nop    
f0100cbc:	90                   	nop    
f0100cbd:	90                   	nop    
f0100cbe:	90                   	nop    
f0100cbf:	90                   	nop    
f0100cc0:	90                   	nop    
f0100cc1:	90                   	nop    
f0100cc2:	90                   	nop    
f0100cc3:	90                   	nop    
f0100cc4:	90                   	nop    
f0100cc5:	90                   	nop    
f0100cc6:	90                   	nop    
f0100cc7:	90                   	nop    
f0100cc8:	90                   	nop    
f0100cc9:	90                   	nop    
f0100cca:	90                   	nop    
f0100ccb:	90                   	nop    
f0100ccc:	90                   	nop    
f0100ccd:	90                   	nop    
f0100cce:	90                   	nop    
f0100ccf:	90                   	nop    
f0100cd0:	90                   	nop    
f0100cd1:	90                   	nop    
f0100cd2:	90                   	nop    
f0100cd3:	90                   	nop    
f0100cd4:	90                   	nop    
f0100cd5:	90                   	nop    
f0100cd6:	90                   	nop    
f0100cd7:	90                   	nop    
f0100cd8:	90                   	nop    
f0100cd9:	90                   	nop    
f0100cda:	90                   	nop    
f0100cdb:	90                   	nop    
f0100cdc:	90                   	nop    
f0100cdd:	90                   	nop    
f0100cde:	90                   	nop    
f0100cdf:	90                   	nop    
f0100ce0:	90                   	nop    
f0100ce1:	90                   	nop    
f0100ce2:	90                   	nop    
f0100ce3:	90                   	nop    
f0100ce4:	90                   	nop    
f0100ce5:	90                   	nop    
f0100ce6:	90                   	nop    
f0100ce7:	90                   	nop    
f0100ce8:	90                   	nop    
f0100ce9:	90                   	nop    
f0100cea:	90                   	nop    
f0100ceb:	90                   	nop    
f0100cec:	90                   	nop    
f0100ced:	90                   	nop    
f0100cee:	90                   	nop    
f0100cef:	90                   	nop    
f0100cf0:	90                   	nop    
f0100cf1:	90                   	nop    
f0100cf2:	90                   	nop    
f0100cf3:	90                   	nop    
f0100cf4:	90                   	nop    
f0100cf5:	90                   	nop    
f0100cf6:	90                   	nop    
f0100cf7:	90                   	nop    
f0100cf8:	90                   	nop    
f0100cf9:	90                   	nop    
f0100cfa:	90                   	nop    
f0100cfb:	90                   	nop    
f0100cfc:	90                   	nop    
f0100cfd:	90                   	nop    
f0100cfe:	90                   	nop    
f0100cff:	90                   	nop    
f0100d00:	90                   	nop    
f0100d01:	90                   	nop    
f0100d02:	90                   	nop    
f0100d03:	90                   	nop    
f0100d04:	90                   	nop    
f0100d05:	90                   	nop    
f0100d06:	90                   	nop    
f0100d07:	90                   	nop    
f0100d08:	90                   	nop    
f0100d09:	90                   	nop    
f0100d0a:	90                   	nop    
f0100d0b:	90                   	nop    
f0100d0c:	90                   	nop    
f0100d0d:	90                   	nop    
f0100d0e:	90                   	nop    
f0100d0f:	90                   	nop    
f0100d10:	90                   	nop    
f0100d11:	90                   	nop    
f0100d12:	90                   	nop    
f0100d13:	90                   	nop    
f0100d14:	90                   	nop    
f0100d15:	90                   	nop    
f0100d16:	90                   	nop    
f0100d17:	90                   	nop    
f0100d18:	90                   	nop    
f0100d19:	90                   	nop    
f0100d1a:	90                   	nop    
f0100d1b:	90                   	nop    
f0100d1c:	90                   	nop    
f0100d1d:	90                   	nop    
f0100d1e:	90                   	nop    
f0100d1f:	90                   	nop    
f0100d20:	90                   	nop    
f0100d21:	90                   	nop    
f0100d22:	90                   	nop    
f0100d23:	90                   	nop    
f0100d24:	90                   	nop    
f0100d25:	90                   	nop    
f0100d26:	90                   	nop    
f0100d27:	90                   	nop    
f0100d28:	90                   	nop    
f0100d29:	90                   	nop    
f0100d2a:	90                   	nop    
f0100d2b:	90                   	nop    
f0100d2c:	90                   	nop    
f0100d2d:	90                   	nop    
f0100d2e:	90                   	nop    
f0100d2f:	90                   	nop    
f0100d30:	90                   	nop    
f0100d31:	90                   	nop    
f0100d32:	90                   	nop    
f0100d33:	90                   	nop    
f0100d34:	90                   	nop    
f0100d35:	90                   	nop    
f0100d36:	90                   	nop    
f0100d37:	90                   	nop    
f0100d38:	90                   	nop    
f0100d39:	90                   	nop    
f0100d3a:	90                   	nop    
f0100d3b:	90                   	nop    
f0100d3c:	90                   	nop    
f0100d3d:	90                   	nop    
f0100d3e:	90                   	nop    
f0100d3f:	90                   	nop    
f0100d40:	90                   	nop    
f0100d41:	90                   	nop    
f0100d42:	90                   	nop    
f0100d43:	90                   	nop    
f0100d44:	90                   	nop    
f0100d45:	90                   	nop    
f0100d46:	90                   	nop    
f0100d47:	90                   	nop    
f0100d48:	90                   	nop    
f0100d49:	90                   	nop    
f0100d4a:	90                   	nop    
f0100d4b:	90                   	nop    
f0100d4c:	90                   	nop    
f0100d4d:	90                   	nop    
f0100d4e:	90                   	nop    
f0100d4f:	90                   	nop    
f0100d50:	90                   	nop    
f0100d51:	90                   	nop    
f0100d52:	90                   	nop    
f0100d53:	90                   	nop    
f0100d54:	90                   	nop    
f0100d55:	90                   	nop    
f0100d56:	90                   	nop    
f0100d57:	90                   	nop    
f0100d58:	90                   	nop    
f0100d59:	90                   	nop    
f0100d5a:	90                   	nop    
f0100d5b:	90                   	nop    
f0100d5c:	90                   	nop    
f0100d5d:	90                   	nop    
f0100d5e:	90                   	nop    
f0100d5f:	90                   	nop    
f0100d60:	90                   	nop    
f0100d61:	90                   	nop    
f0100d62:	90                   	nop    
f0100d63:	90                   	nop    
f0100d64:	90                   	nop    
f0100d65:	90                   	nop    
f0100d66:	90                   	nop    
f0100d67:	90                   	nop    
f0100d68:	90                   	nop    
f0100d69:	90                   	nop    
f0100d6a:	90                   	nop    
f0100d6b:	90                   	nop    
f0100d6c:	90                   	nop    
f0100d6d:	90                   	nop    
f0100d6e:	90                   	nop    
f0100d6f:	90                   	nop    
f0100d70:	90                   	nop    
f0100d71:	90                   	nop    
f0100d72:	90                   	nop    
f0100d73:	90                   	nop    
f0100d74:	90                   	nop    
f0100d75:	90                   	nop    
f0100d76:	90                   	nop    
f0100d77:	90                   	nop    
f0100d78:	90                   	nop    
f0100d79:	90                   	nop    
f0100d7a:	90                   	nop    
f0100d7b:	90                   	nop    
f0100d7c:	90                   	nop    
f0100d7d:	90                   	nop    
f0100d7e:	90                   	nop    
f0100d7f:	90                   	nop    
f0100d80:	90                   	nop    
f0100d81:	90                   	nop    
f0100d82:	90                   	nop    
f0100d83:	90                   	nop    
f0100d84:	90                   	nop    
f0100d85:	90                   	nop    
f0100d86:	90                   	nop    
f0100d87:	90                   	nop    
f0100d88:	90                   	nop    
f0100d89:	90                   	nop    
f0100d8a:	90                   	nop    
f0100d8b:	90                   	nop    
f0100d8c:	90                   	nop    
f0100d8d:	90                   	nop    
f0100d8e:	90                   	nop    
f0100d8f:	90                   	nop    
f0100d90:	90                   	nop    
f0100d91:	90                   	nop    
f0100d92:	90                   	nop    
f0100d93:	90                   	nop    
f0100d94:	90                   	nop    
f0100d95:	90                   	nop    
f0100d96:	90                   	nop    
f0100d97:	90                   	nop    
f0100d98:	90                   	nop    
f0100d99:	90                   	nop    
f0100d9a:	90                   	nop    
f0100d9b:	90                   	nop    
f0100d9c:	90                   	nop    
f0100d9d:	90                   	nop    
f0100d9e:	90                   	nop    
f0100d9f:	90                   	nop    
f0100da0:	90                   	nop    
f0100da1:	90                   	nop    
f0100da2:	90                   	nop    
f0100da3:	90                   	nop    
f0100da4:	90                   	nop    
f0100da5:	90                   	nop    
f0100da6:	90                   	nop    
f0100da7:	90                   	nop    
f0100da8:	90                   	nop    
f0100da9:	90                   	nop    
f0100daa:	90                   	nop    
f0100dab:	90                   	nop    
f0100dac:	90                   	nop    
f0100dad:	90                   	nop    
f0100dae:	90                   	nop    
f0100daf:	90                   	nop    
f0100db0:	90                   	nop    
f0100db1:	90                   	nop    
f0100db2:	90                   	nop    
f0100db3:	90                   	nop    
f0100db4:	90                   	nop    
f0100db5:	90                   	nop    
f0100db6:	90                   	nop    
f0100db7:	90                   	nop    
f0100db8:	90                   	nop    
f0100db9:	90                   	nop    
f0100dba:	90                   	nop    
f0100dbb:	90                   	nop    
f0100dbc:	90                   	nop    
f0100dbd:	90                   	nop    
f0100dbe:	90                   	nop    
f0100dbf:	90                   	nop    
f0100dc0:	90                   	nop    
f0100dc1:	90                   	nop    
f0100dc2:	90                   	nop    
f0100dc3:	90                   	nop    
f0100dc4:	90                   	nop    
f0100dc5:	90                   	nop    
f0100dc6:	90                   	nop    
f0100dc7:	90                   	nop    
f0100dc8:	90                   	nop    
f0100dc9:	90                   	nop    
f0100dca:	90                   	nop    
f0100dcb:	90                   	nop    
f0100dcc:	90                   	nop    
f0100dcd:	90                   	nop    
f0100dce:	90                   	nop    
f0100dcf:	90                   	nop    
f0100dd0:	90                   	nop    
f0100dd1:	90                   	nop    
f0100dd2:	90                   	nop    
f0100dd3:	90                   	nop    
f0100dd4:	90                   	nop    
f0100dd5:	90                   	nop    
f0100dd6:	90                   	nop    
f0100dd7:	90                   	nop    
f0100dd8:	90                   	nop    
f0100dd9:	90                   	nop    
f0100dda:	90                   	nop    
f0100ddb:	90                   	nop    
f0100ddc:	90                   	nop    
f0100ddd:	90                   	nop    
f0100dde:	90                   	nop    
f0100ddf:	90                   	nop    
f0100de0:	90                   	nop    
f0100de1:	90                   	nop    
f0100de2:	90                   	nop    
f0100de3:	90                   	nop    
f0100de4:	90                   	nop    
f0100de5:	90                   	nop    
f0100de6:	90                   	nop    
f0100de7:	90                   	nop    
f0100de8:	90                   	nop    
f0100de9:	90                   	nop    
f0100dea:	90                   	nop    
f0100deb:	90                   	nop    
f0100dec:	90                   	nop    
f0100ded:	90                   	nop    
f0100dee:	90                   	nop    
f0100def:	90                   	nop    
f0100df0:	90                   	nop    
f0100df1:	90                   	nop    
f0100df2:	90                   	nop    
f0100df3:	90                   	nop    
f0100df4:	90                   	nop    
f0100df5:	90                   	nop    
f0100df6:	90                   	nop    
f0100df7:	90                   	nop    
f0100df8:	90                   	nop    
f0100df9:	90                   	nop    
f0100dfa:	90                   	nop    
f0100dfb:	90                   	nop    
f0100dfc:	90                   	nop    
f0100dfd:	90                   	nop    
f0100dfe:	90                   	nop    
f0100dff:	90                   	nop    
f0100e00:	90                   	nop    
f0100e01:	90                   	nop    
f0100e02:	90                   	nop    
f0100e03:	90                   	nop    
f0100e04:	90                   	nop    
f0100e05:	90                   	nop    
f0100e06:	90                   	nop    
f0100e07:	90                   	nop    
f0100e08:	90                   	nop    
f0100e09:	90                   	nop    
f0100e0a:	90                   	nop    
f0100e0b:	90                   	nop    
f0100e0c:	90                   	nop    
f0100e0d:	90                   	nop    
f0100e0e:	90                   	nop    
f0100e0f:	90                   	nop    
f0100e10:	90                   	nop    
f0100e11:	90                   	nop    
f0100e12:	90                   	nop    
f0100e13:	90                   	nop    
f0100e14:	90                   	nop    
f0100e15:	90                   	nop    
f0100e16:	90                   	nop    
f0100e17:	90                   	nop    
f0100e18:	90                   	nop    
f0100e19:	90                   	nop    
f0100e1a:	90                   	nop    
f0100e1b:	90                   	nop    
f0100e1c:	90                   	nop    
f0100e1d:	90                   	nop    
f0100e1e:	90                   	nop    
f0100e1f:	90                   	nop    
f0100e20:	90                   	nop    
f0100e21:	90                   	nop    
f0100e22:	90                   	nop    
f0100e23:	90                   	nop    
f0100e24:	90                   	nop    
f0100e25:	90                   	nop    
f0100e26:	90                   	nop    
f0100e27:	90                   	nop    
f0100e28:	90                   	nop    
f0100e29:	90                   	nop    
f0100e2a:	90                   	nop    
f0100e2b:	90                   	nop    
f0100e2c:	90                   	nop    
f0100e2d:	90                   	nop    
f0100e2e:	90                   	nop    
f0100e2f:	90                   	nop    
f0100e30:	90                   	nop    
f0100e31:	90                   	nop    
f0100e32:	90                   	nop    
f0100e33:	90                   	nop    
f0100e34:	90                   	nop    
f0100e35:	90                   	nop    
f0100e36:	90                   	nop    
f0100e37:	90                   	nop    
f0100e38:	90                   	nop    
f0100e39:	90                   	nop    
f0100e3a:	90                   	nop    
f0100e3b:	90                   	nop    
f0100e3c:	90                   	nop    
f0100e3d:	90                   	nop    
f0100e3e:	90                   	nop    
f0100e3f:	90                   	nop    
f0100e40:	90                   	nop    
f0100e41:	90                   	nop    
f0100e42:	90                   	nop    
f0100e43:	90                   	nop    
f0100e44:	90                   	nop    
f0100e45:	90                   	nop    
f0100e46:	90                   	nop    
f0100e47:	90                   	nop    
f0100e48:	90                   	nop    
f0100e49:	90                   	nop    
f0100e4a:	90                   	nop    
f0100e4b:	90                   	nop    
f0100e4c:	90                   	nop    
f0100e4d:	90                   	nop    
f0100e4e:	90                   	nop    
f0100e4f:	90                   	nop    
f0100e50:	90                   	nop    
f0100e51:	90                   	nop    
f0100e52:	90                   	nop    
f0100e53:	90                   	nop    
f0100e54:	90                   	nop    
f0100e55:	90                   	nop    
f0100e56:	90                   	nop    
f0100e57:	90                   	nop    
f0100e58:	90                   	nop    
f0100e59:	90                   	nop    
f0100e5a:	90                   	nop    
f0100e5b:	90                   	nop    
f0100e5c:	90                   	nop    
f0100e5d:	90                   	nop    
f0100e5e:	90                   	nop    
f0100e5f:	90                   	nop    
f0100e60:	90                   	nop    
f0100e61:	90                   	nop    
f0100e62:	90                   	nop    
f0100e63:	90                   	nop    
f0100e64:	90                   	nop    
f0100e65:	90                   	nop    
f0100e66:	90                   	nop    
f0100e67:	90                   	nop    
f0100e68:	90                   	nop    
f0100e69:	90                   	nop    
f0100e6a:	90                   	nop    
f0100e6b:	90                   	nop    
f0100e6c:	90                   	nop    
f0100e6d:	90                   	nop    
f0100e6e:	90                   	nop    
f0100e6f:	90                   	nop    
f0100e70:	90                   	nop    
f0100e71:	90                   	nop    
f0100e72:	90                   	nop    
f0100e73:	90                   	nop    
f0100e74:	90                   	nop    
f0100e75:	90                   	nop    
f0100e76:	90                   	nop    
f0100e77:	90                   	nop    
f0100e78:	90                   	nop    
f0100e79:	90                   	nop    
f0100e7a:	90                   	nop    
f0100e7b:	90                   	nop    
f0100e7c:	90                   	nop    
f0100e7d:	90                   	nop    
f0100e7e:	90                   	nop    
f0100e7f:	90                   	nop    
f0100e80:	90                   	nop    
f0100e81:	90                   	nop    
f0100e82:	90                   	nop    
f0100e83:	90                   	nop    
f0100e84:	90                   	nop    
f0100e85:	90                   	nop    
f0100e86:	90                   	nop    
f0100e87:	90                   	nop    
f0100e88:	90                   	nop    
f0100e89:	90                   	nop    
f0100e8a:	90                   	nop    
f0100e8b:	90                   	nop    
f0100e8c:	90                   	nop    
f0100e8d:	90                   	nop    
f0100e8e:	90                   	nop    
f0100e8f:	90                   	nop    
f0100e90:	90                   	nop    
f0100e91:	90                   	nop    
f0100e92:	90                   	nop    
f0100e93:	90                   	nop    
f0100e94:	90                   	nop    
f0100e95:	90                   	nop    
f0100e96:	90                   	nop    
f0100e97:	90                   	nop    
f0100e98:	90                   	nop    
f0100e99:	90                   	nop    
f0100e9a:	90                   	nop    
f0100e9b:	90                   	nop    
f0100e9c:	90                   	nop    
f0100e9d:	90                   	nop    
f0100e9e:	90                   	nop    
f0100e9f:	90                   	nop    
f0100ea0:	90                   	nop    
f0100ea1:	90                   	nop    
f0100ea2:	90                   	nop    
f0100ea3:	90                   	nop    
f0100ea4:	90                   	nop    
f0100ea5:	90                   	nop    
f0100ea6:	90                   	nop    
f0100ea7:	90                   	nop    
f0100ea8:	90                   	nop    
f0100ea9:	90                   	nop    
f0100eaa:	90                   	nop    
f0100eab:	90                   	nop    
f0100eac:	90                   	nop    
f0100ead:	90                   	nop    
f0100eae:	90                   	nop    
f0100eaf:	90                   	nop    
f0100eb0:	90                   	nop    
f0100eb1:	90                   	nop    
f0100eb2:	90                   	nop    
f0100eb3:	90                   	nop    
f0100eb4:	90                   	nop    
f0100eb5:	90                   	nop    
f0100eb6:	90                   	nop    
f0100eb7:	90                   	nop    
f0100eb8:	90                   	nop    
f0100eb9:	90                   	nop    
f0100eba:	90                   	nop    
f0100ebb:	90                   	nop    
f0100ebc:	90                   	nop    
f0100ebd:	90                   	nop    
f0100ebe:	90                   	nop    
f0100ebf:	90                   	nop    
f0100ec0:	90                   	nop    
f0100ec1:	90                   	nop    
f0100ec2:	90                   	nop    
f0100ec3:	90                   	nop    
f0100ec4:	90                   	nop    
f0100ec5:	90                   	nop    
f0100ec6:	90                   	nop    
f0100ec7:	90                   	nop    
f0100ec8:	90                   	nop    
f0100ec9:	90                   	nop    
f0100eca:	90                   	nop    
f0100ecb:	90                   	nop    
f0100ecc:	90                   	nop    
f0100ecd:	90                   	nop    
f0100ece:	90                   	nop    
f0100ecf:	90                   	nop    
f0100ed0:	90                   	nop    
f0100ed1:	90                   	nop    
f0100ed2:	90                   	nop    
f0100ed3:	90                   	nop    
f0100ed4:	90                   	nop    
f0100ed5:	90                   	nop    
f0100ed6:	90                   	nop    
f0100ed7:	90                   	nop    
f0100ed8:	90                   	nop    
f0100ed9:	90                   	nop    
f0100eda:	90                   	nop    
f0100edb:	90                   	nop    
f0100edc:	90                   	nop    
f0100edd:	90                   	nop    
f0100ede:	90                   	nop    
f0100edf:	90                   	nop    
f0100ee0:	90                   	nop    
f0100ee1:	90                   	nop    
f0100ee2:	90                   	nop    
f0100ee3:	90                   	nop    
f0100ee4:	90                   	nop    
f0100ee5:	90                   	nop    
f0100ee6:	90                   	nop    
f0100ee7:	90                   	nop    
f0100ee8:	90                   	nop    
f0100ee9:	90                   	nop    
f0100eea:	90                   	nop    
f0100eeb:	90                   	nop    
f0100eec:	90                   	nop    
f0100eed:	90                   	nop    
f0100eee:	90                   	nop    
f0100eef:	90                   	nop    
f0100ef0:	90                   	nop    
f0100ef1:	90                   	nop    
f0100ef2:	90                   	nop    
f0100ef3:	90                   	nop    
f0100ef4:	90                   	nop    
f0100ef5:	90                   	nop    
f0100ef6:	90                   	nop    
f0100ef7:	90                   	nop    
f0100ef8:	90                   	nop    
f0100ef9:	90                   	nop    
f0100efa:	90                   	nop    
f0100efb:	90                   	nop    
f0100efc:	90                   	nop    
f0100efd:	90                   	nop    
f0100efe:	90                   	nop    
f0100eff:	90                   	nop    
f0100f00:	90                   	nop    
f0100f01:	90                   	nop    
f0100f02:	90                   	nop    
f0100f03:	90                   	nop    
f0100f04:	90                   	nop    
f0100f05:	90                   	nop    
f0100f06:	90                   	nop    
f0100f07:	90                   	nop    
f0100f08:	90                   	nop    
f0100f09:	90                   	nop    
f0100f0a:	90                   	nop    
f0100f0b:	90                   	nop    
f0100f0c:	90                   	nop    
f0100f0d:	90                   	nop    
f0100f0e:	90                   	nop    
f0100f0f:	90                   	nop    
f0100f10:	90                   	nop    
f0100f11:	90                   	nop    
f0100f12:	90                   	nop    
f0100f13:	90                   	nop    
f0100f14:	90                   	nop    
f0100f15:	90                   	nop    
f0100f16:	90                   	nop    
f0100f17:	90                   	nop    
f0100f18:	90                   	nop    
f0100f19:	90                   	nop    
f0100f1a:	90                   	nop    
f0100f1b:	90                   	nop    
f0100f1c:	90                   	nop    
f0100f1d:	90                   	nop    
f0100f1e:	90                   	nop    
f0100f1f:	90                   	nop    
f0100f20:	90                   	nop    
f0100f21:	90                   	nop    
f0100f22:	90                   	nop    
f0100f23:	90                   	nop    
f0100f24:	90                   	nop    
f0100f25:	90                   	nop    
f0100f26:	90                   	nop    
f0100f27:	90                   	nop    
f0100f28:	90                   	nop    
f0100f29:	90                   	nop    
f0100f2a:	90                   	nop    
f0100f2b:	90                   	nop    
f0100f2c:	90                   	nop    
f0100f2d:	90                   	nop    
f0100f2e:	90                   	nop    
f0100f2f:	90                   	nop    
f0100f30:	90                   	nop    
f0100f31:	90                   	nop    
f0100f32:	90                   	nop    
f0100f33:	90                   	nop    
f0100f34:	90                   	nop    
f0100f35:	90                   	nop    
f0100f36:	90                   	nop    
f0100f37:	90                   	nop    
f0100f38:	90                   	nop    
f0100f39:	90                   	nop    
f0100f3a:	90                   	nop    
f0100f3b:	90                   	nop    
f0100f3c:	90                   	nop    
f0100f3d:	90                   	nop    
f0100f3e:	90                   	nop    
f0100f3f:	90                   	nop    
f0100f40:	90                   	nop    
f0100f41:	90                   	nop    
f0100f42:	90                   	nop    
f0100f43:	90                   	nop    
f0100f44:	90                   	nop    
f0100f45:	90                   	nop    
f0100f46:	90                   	nop    
f0100f47:	90                   	nop    
f0100f48:	90                   	nop    
f0100f49:	90                   	nop    
f0100f4a:	90                   	nop    
f0100f4b:	90                   	nop    
f0100f4c:	90                   	nop    
f0100f4d:	90                   	nop    
f0100f4e:	90                   	nop    
f0100f4f:	90                   	nop    
f0100f50:	90                   	nop    
f0100f51:	90                   	nop    
f0100f52:	90                   	nop    
f0100f53:	90                   	nop    
f0100f54:	90                   	nop    
f0100f55:	90                   	nop    
f0100f56:	90                   	nop    
f0100f57:	90                   	nop    
f0100f58:	90                   	nop    
f0100f59:	90                   	nop    
f0100f5a:	90                   	nop    
f0100f5b:	90                   	nop    
f0100f5c:	90                   	nop    
f0100f5d:	90                   	nop    
f0100f5e:	90                   	nop    
f0100f5f:	90                   	nop    
f0100f60:	90                   	nop    
f0100f61:	90                   	nop    
f0100f62:	90                   	nop    
f0100f63:	90                   	nop    
f0100f64:	90                   	nop    
f0100f65:	90                   	nop    
f0100f66:	90                   	nop    
f0100f67:	90                   	nop    
f0100f68:	90                   	nop    
f0100f69:	90                   	nop    
f0100f6a:	90                   	nop    
f0100f6b:	90                   	nop    
f0100f6c:	90                   	nop    
f0100f6d:	90                   	nop    
f0100f6e:	90                   	nop    
f0100f6f:	90                   	nop    
f0100f70:	90                   	nop    
f0100f71:	90                   	nop    
f0100f72:	90                   	nop    
f0100f73:	90                   	nop    
f0100f74:	90                   	nop    
f0100f75:	90                   	nop    
f0100f76:	90                   	nop    
f0100f77:	90                   	nop    
f0100f78:	90                   	nop    
f0100f79:	90                   	nop    
f0100f7a:	90                   	nop    
f0100f7b:	90                   	nop    
f0100f7c:	90                   	nop    
f0100f7d:	90                   	nop    
f0100f7e:	90                   	nop    
f0100f7f:	90                   	nop    
f0100f80:	90                   	nop    
f0100f81:	90                   	nop    
f0100f82:	90                   	nop    
f0100f83:	90                   	nop    
f0100f84:	90                   	nop    
f0100f85:	90                   	nop    
f0100f86:	90                   	nop    
f0100f87:	90                   	nop    
f0100f88:	90                   	nop    
f0100f89:	90                   	nop    
f0100f8a:	90                   	nop    
f0100f8b:	90                   	nop    
f0100f8c:	90                   	nop    
f0100f8d:	90                   	nop    
f0100f8e:	90                   	nop    
f0100f8f:	90                   	nop    
f0100f90:	90                   	nop    
f0100f91:	90                   	nop    
f0100f92:	90                   	nop    
f0100f93:	90                   	nop    
f0100f94:	90                   	nop    
f0100f95:	90                   	nop    
f0100f96:	90                   	nop    
f0100f97:	90                   	nop    
f0100f98:	90                   	nop    
f0100f99:	90                   	nop    
f0100f9a:	90                   	nop    
f0100f9b:	90                   	nop    
f0100f9c:	90                   	nop    
f0100f9d:	90                   	nop    
f0100f9e:	90                   	nop    
f0100f9f:	90                   	nop    
f0100fa0:	90                   	nop    
f0100fa1:	90                   	nop    
f0100fa2:	90                   	nop    
f0100fa3:	90                   	nop    
f0100fa4:	90                   	nop    
f0100fa5:	90                   	nop    
f0100fa6:	90                   	nop    
f0100fa7:	90                   	nop    
f0100fa8:	90                   	nop    
f0100fa9:	90                   	nop    
f0100faa:	90                   	nop    
f0100fab:	90                   	nop    
f0100fac:	90                   	nop    
f0100fad:	90                   	nop    
f0100fae:	90                   	nop    
f0100faf:	90                   	nop    
f0100fb0:	90                   	nop    
f0100fb1:	90                   	nop    
f0100fb2:	90                   	nop    
f0100fb3:	90                   	nop    
f0100fb4:	90                   	nop    
f0100fb5:	90                   	nop    
f0100fb6:	90                   	nop    
f0100fb7:	90                   	nop    
f0100fb8:	90                   	nop    
f0100fb9:	90                   	nop    
f0100fba:	90                   	nop    
f0100fbb:	90                   	nop    
f0100fbc:	90                   	nop    
f0100fbd:	90                   	nop    
f0100fbe:	90                   	nop    
f0100fbf:	90                   	nop    
f0100fc0:	90                   	nop    
f0100fc1:	90                   	nop    
f0100fc2:	90                   	nop    
f0100fc3:	90                   	nop    
f0100fc4:	90                   	nop    
f0100fc5:	90                   	nop    
f0100fc6:	90                   	nop    
f0100fc7:	90                   	nop    
f0100fc8:	90                   	nop    
f0100fc9:	90                   	nop    
f0100fca:	90                   	nop    
f0100fcb:	90                   	nop    
f0100fcc:	90                   	nop    
f0100fcd:	90                   	nop    
f0100fce:	90                   	nop    
f0100fcf:	90                   	nop    
f0100fd0:	90                   	nop    
f0100fd1:	90                   	nop    
f0100fd2:	90                   	nop    
f0100fd3:	90                   	nop    
f0100fd4:	90                   	nop    
f0100fd5:	90                   	nop    
f0100fd6:	90                   	nop    
f0100fd7:	90                   	nop    
f0100fd8:	90                   	nop    
f0100fd9:	90                   	nop    
f0100fda:	90                   	nop    
f0100fdb:	90                   	nop    
f0100fdc:	90                   	nop    
f0100fdd:	90                   	nop    
f0100fde:	90                   	nop    
f0100fdf:	90                   	nop    
f0100fe0:	90                   	nop    
f0100fe1:	90                   	nop    
f0100fe2:	90                   	nop    
f0100fe3:	90                   	nop    
f0100fe4:	90                   	nop    
f0100fe5:	90                   	nop    
f0100fe6:	90                   	nop    
f0100fe7:	90                   	nop    
f0100fe8:	90                   	nop    
f0100fe9:	90                   	nop    
f0100fea:	90                   	nop    
f0100feb:	90                   	nop    
f0100fec:	90                   	nop    
f0100fed:	90                   	nop    
f0100fee:	90                   	nop    
f0100fef:	90                   	nop    
f0100ff0:	90                   	nop    
f0100ff1:	90                   	nop    
f0100ff2:	90                   	nop    
f0100ff3:	90                   	nop    
f0100ff4:	90                   	nop    
f0100ff5:	90                   	nop    
f0100ff6:	90                   	nop    
f0100ff7:	90                   	nop    
f0100ff8:	90                   	nop    
f0100ff9:	90                   	nop    
f0100ffa:	90                   	nop    
f0100ffb:	90                   	nop    
f0100ffc:	90                   	nop    
f0100ffd:	90                   	nop    
f0100ffe:	90                   	nop    
f0100fff:	90                   	nop    

f0101000 <bootstack>:
	...

f0109000 <bootstacktop>:
	...
f0109008:	ff                   	(bad)  
f0109009:	ff 00                	incl   (%eax)
f010900b:	00 00                	add    %al,(%eax)
f010900d:	9a cf 10 ff ff 00 00 	lcall  $0x0,$0xffff10cf
f0109014:	00 92 cf 10 17 00    	add    %dl,0x1710cf(%edx)

f0109018 <mygdtdesc>:
f0109018:	17                   	pop    %ss
f0109019:	00 00                	add    %al,(%eax)
f010901b:	90                   	nop    
f010901c:	10 00                	adc    %al,(%eax)
	...

f0109020 <_Z5_warnPKciS0_z>:
		monitor(NULL);
}

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt, ...)
f0109020:	55                   	push   %ebp
f0109021:	89 e5                	mov    %esp,%ebp
f0109023:	83 ec 18             	sub    $0x18,%esp
{
	va_list ap;

	va_start(ap, fmt);
	cprintf("kernel warning at %s:%d: ", file, line);
f0109026:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109029:	89 44 24 08          	mov    %eax,0x8(%esp)
f010902d:	8b 45 08             	mov    0x8(%ebp),%eax
f0109030:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109034:	c7 04 24 40 cf 10 f0 	movl   $0xf010cf40,(%esp)
f010903b:	e8 af 2a 00 00       	call   f010baef <_Z7cprintfPKcz>
	vcprintf(fmt, ap);
f0109040:	8d 45 14             	lea    0x14(%ebp),%eax
f0109043:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109047:	8b 45 10             	mov    0x10(%ebp),%eax
f010904a:	89 04 24             	mov    %eax,(%esp)
f010904d:	e8 6a 2a 00 00       	call   f010babc <_Z8vcprintfPKcPc>
	cprintf("\n");
f0109052:	c7 04 24 15 de 10 f0 	movl   $0xf010de15,(%esp)
f0109059:	e8 91 2a 00 00       	call   f010baef <_Z7cprintfPKcz>
	va_end(ap);
}
f010905e:	c9                   	leave  
f010905f:	c3                   	ret    

f0109060 <_Z6_panicPKciS0_z>:
/*
 * Panic is called on unresolvable fatal errors.
 * It prints "panic: mesg", and then enters the kernel monitor.
 */
void
_panic(const char *file, int line, const char *fmt, ...)
f0109060:	55                   	push   %ebp
f0109061:	89 e5                	mov    %esp,%ebp
f0109063:	83 ec 18             	sub    $0x18,%esp
{
	va_list ap;

	if (panicstr)
f0109066:	83 3d e0 70 11 f0 00 	cmpl   $0x0,0xf01170e0
f010906d:	75 40                	jne    f01090af <_Z6_panicPKciS0_z+0x4f>
		goto dead;
	panicstr = fmt;
f010906f:	8b 45 10             	mov    0x10(%ebp),%eax
f0109072:	a3 e0 70 11 f0       	mov    %eax,0xf01170e0

	va_start(ap, fmt);
	cprintf("kernel panic at %s:%d: ", file, line);
f0109077:	8b 45 0c             	mov    0xc(%ebp),%eax
f010907a:	89 44 24 08          	mov    %eax,0x8(%esp)
f010907e:	8b 45 08             	mov    0x8(%ebp),%eax
f0109081:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109085:	c7 04 24 5a cf 10 f0 	movl   $0xf010cf5a,(%esp)
f010908c:	e8 5e 2a 00 00       	call   f010baef <_Z7cprintfPKcz>
	vcprintf(fmt, ap);
f0109091:	8d 45 14             	lea    0x14(%ebp),%eax
f0109094:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109098:	8b 45 10             	mov    0x10(%ebp),%eax
f010909b:	89 04 24             	mov    %eax,(%esp)
f010909e:	e8 19 2a 00 00       	call   f010babc <_Z8vcprintfPKcPc>
	cprintf("\n");
f01090a3:	c7 04 24 15 de 10 f0 	movl   $0xf010de15,(%esp)
f01090aa:	e8 40 2a 00 00       	call   f010baef <_Z7cprintfPKcz>
	va_end(ap);

dead:
	/* break into the kernel monitor */
	while (1)
		monitor(NULL);
f01090af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f01090b6:	e8 d7 08 00 00       	call   f0109992 <_Z7monitorP9Trapframe>
f01090bb:	eb f2                	jmp    f01090af <_Z6_panicPKciS0_z+0x4f>

f01090bd <i386_init>:
#include <kern/trap.h>


extern "C" {
void
i386_init(void)
f01090bd:	55                   	push   %ebp
f01090be:	89 e5                	mov    %esp,%ebp
f01090c0:	53                   	push   %ebx
f01090c1:	83 ec 14             	sub    $0x14,%esp
	extern const uint32_t sctors[], ectors[];
	const uint32_t *ctorva;

	// Initialize the console.
	// Can't call cprintf until after we do this!
	cons_init();
f01090c4:	e8 af 01 00 00       	call   f0109278 <_Z9cons_initv>

	// Then call any global constructors.
	// This relies on linker script magic to define the 'sctors' and
	// 'ectors' symbols; see kern/kernel.ld.
	// Call after cons_init() so we can cprintf() if necessary.
	for (ctorva = ectors; ctorva > sctors; )
f01090c9:	b8 04 70 11 f0       	mov    $0xf0117004,%eax
f01090ce:	3d 00 70 11 f0       	cmp    $0xf0117000,%eax
f01090d3:	76 0f                	jbe    f01090e4 <i386_init+0x27>
f01090d5:	89 c3                	mov    %eax,%ebx
		((void(*)()) *--ctorva)();
f01090d7:	83 eb 04             	sub    $0x4,%ebx
f01090da:	ff 13                	call   *(%ebx)

	// Then call any global constructors.
	// This relies on linker script magic to define the 'sctors' and
	// 'ectors' symbols; see kern/kernel.ld.
	// Call after cons_init() so we can cprintf() if necessary.
	for (ctorva = ectors; ctorva > sctors; )
f01090dc:	81 fb 00 70 11 f0    	cmp    $0xf0117000,%ebx
f01090e2:	77 f3                	ja     f01090d7 <i386_init+0x1a>
		((void(*)()) *--ctorva)();

	cprintf("6828 decimal is %o octal!\n", 6828);
f01090e4:	c7 44 24 04 ac 1a 00 	movl   $0x1aac,0x4(%esp)
f01090eb:	00 
f01090ec:	c7 04 24 72 cf 10 f0 	movl   $0xf010cf72,(%esp)
f01090f3:	e8 f7 29 00 00       	call   f010baef <_Z7cprintfPKcz>

	// Lab 2 memory management initialization functions
	mem_init();
f01090f8:	e8 f0 13 00 00       	call   f010a4ed <_Z8mem_initv>

	// Lab 2 interrupt and gate descriptor initialization functions
	idt_init();
f01090fd:	e8 4b 2a 00 00       	call   f010bb4d <_Z8idt_initv>

	// Test IDT (lab 2 only)
	__asm__ __volatile__("int3");
f0109102:	cc                   	int3   
	cprintf("Breakpoint succeeded!\n");
f0109103:	c7 04 24 8d cf 10 f0 	movl   $0xf010cf8d,(%esp)
f010910a:	e8 e0 29 00 00       	call   f010baef <_Z7cprintfPKcz>

	// Drop into the kernel monitor.
	while (1)
		monitor(NULL);
f010910f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f0109116:	e8 77 08 00 00       	call   f0109992 <_Z7monitorP9Trapframe>
f010911b:	eb f2                	jmp    f010910f <i386_init+0x52>
f010911d:	00 00                	add    %al,(%eax)
	...

f0109120 <_Z16serial_proc_datav>:
#define   COM_LSR_DATA	0x01	//   Data available

static bool serial_exists;

int
serial_proc_data(void)
f0109120:	55                   	push   %ebp
f0109121:	89 e5                	mov    %esp,%ebp

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f0109123:	ba fd 03 00 00       	mov    $0x3fd,%edx
f0109128:	ec                   	in     (%dx),%al
{
	if (!(inb(COM1+COM_LSR) & COM_LSR_DATA))
f0109129:	ba ff ff ff ff       	mov    $0xffffffff,%edx
f010912e:	a8 01                	test   $0x1,%al
f0109130:	74 09                	je     f010913b <_Z16serial_proc_datav+0x1b>
f0109132:	ba f8 03 00 00       	mov    $0x3f8,%edx
f0109137:	ec                   	in     (%dx),%al
		return -1;
	return inb(COM1+COM_RX);
f0109138:	0f b6 d0             	movzbl %al,%edx
}
f010913b:	89 d0                	mov    %edx,%eax
f010913d:	5d                   	pop    %ebp
f010913e:	c3                   	ret    

f010913f <_Z11serial_initv>:
	if (serial_exists)
		cons_intr(serial_proc_data);
}

void
serial_init(void)
f010913f:	55                   	push   %ebp
f0109140:	89 e5                	mov    %esp,%ebp
f0109142:	53                   	push   %ebx
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f0109143:	bb fa 03 00 00       	mov    $0x3fa,%ebx
f0109148:	b8 00 00 00 00       	mov    $0x0,%eax
f010914d:	89 da                	mov    %ebx,%edx
f010914f:	ee                   	out    %al,(%dx)
f0109150:	b2 fb                	mov    $0xfb,%dl
f0109152:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
f0109157:	ee                   	out    %al,(%dx)
f0109158:	b9 f8 03 00 00       	mov    $0x3f8,%ecx
f010915d:	b8 0c 00 00 00       	mov    $0xc,%eax
f0109162:	89 ca                	mov    %ecx,%edx
f0109164:	ee                   	out    %al,(%dx)
f0109165:	b2 f9                	mov    $0xf9,%dl
f0109167:	b8 00 00 00 00       	mov    $0x0,%eax
f010916c:	ee                   	out    %al,(%dx)
f010916d:	b2 fb                	mov    $0xfb,%dl
f010916f:	b8 03 00 00 00       	mov    $0x3,%eax
f0109174:	ee                   	out    %al,(%dx)
f0109175:	b2 fc                	mov    $0xfc,%dl
f0109177:	b8 00 00 00 00       	mov    $0x0,%eax
f010917c:	ee                   	out    %al,(%dx)
f010917d:	b2 f9                	mov    $0xf9,%dl
f010917f:	b8 01 00 00 00       	mov    $0x1,%eax
f0109184:	ee                   	out    %al,(%dx)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f0109185:	b2 fd                	mov    $0xfd,%dl
f0109187:	ec                   	in     (%dx),%al
	// Enable rcv interrupts
	outb(COM1+COM_IER, COM_IER_RDI);

	// Clear any preexisting overrun indications and interrupts
	// Serial port doesn't exist if COM_LSR returns 0xFF
	serial_exists = (inb(COM1+COM_LSR) != 0xFF);
f0109188:	3c ff                	cmp    $0xff,%al
f010918a:	0f 95 05 00 71 11 f0 	setne  0xf0117100
f0109191:	89 da                	mov    %ebx,%edx
f0109193:	ec                   	in     (%dx),%al
f0109194:	89 ca                	mov    %ecx,%edx
f0109196:	ec                   	in     (%dx),%al
	(void) inb(COM1+COM_IIR);
	(void) inb(COM1+COM_RX);

}
f0109197:	5b                   	pop    %ebx
f0109198:	5d                   	pop    %ebp
f0109199:	c3                   	ret    

f010919a <_Z8kbd_initv>:
{
	cons_intr(kbd_proc_data);
}

void
kbd_init(void)
f010919a:	55                   	push   %ebp
f010919b:	89 e5                	mov    %esp,%ebp
{
}
f010919d:	5d                   	pop    %ebp
f010919e:	c3                   	ret    

f010919f <_Z9cons_intrPFivE>:
} cons;

// called by device interrupt routines to feed input characters
// into the circular console input buffer.
void
cons_intr(int (*proc)(void))
f010919f:	55                   	push   %ebp
f01091a0:	89 e5                	mov    %esp,%ebp
f01091a2:	57                   	push   %edi
f01091a3:	56                   	push   %esi
f01091a4:	53                   	push   %ebx
f01091a5:	83 ec 0c             	sub    $0xc,%esp
f01091a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
	int c;

	while ((c = (*proc)()) != -1) {
		if (c == 0)
			continue;
		cons.buf[cons.wpos++] = c;
f01091ab:	be 24 c3 11 f0       	mov    $0xf011c324,%esi
f01091b0:	bf 20 c1 11 f0       	mov    $0xf011c120,%edi
f01091b5:	eb 1f                	jmp    f01091d6 <_Z9cons_intrPFivE+0x37>
cons_intr(int (*proc)(void))
{
	int c;

	while ((c = (*proc)()) != -1) {
		if (c == 0)
f01091b7:	85 c0                	test   %eax,%eax
f01091b9:	74 1b                	je     f01091d6 <_Z9cons_intrPFivE+0x37>
			continue;
		cons.buf[cons.wpos++] = c;
f01091bb:	8b 16                	mov    (%esi),%edx
f01091bd:	88 04 17             	mov    %al,(%edi,%edx,1)
f01091c0:	83 c2 01             	add    $0x1,%edx
		if (cons.wpos == CONSBUFSIZE)
f01091c3:	81 fa 00 02 00 00    	cmp    $0x200,%edx
			cons.wpos = 0;
f01091c9:	0f 94 c0             	sete   %al
f01091cc:	0f b6 c0             	movzbl %al,%eax
f01091cf:	83 e8 01             	sub    $0x1,%eax
f01091d2:	21 c2                	and    %eax,%edx
f01091d4:	89 16                	mov    %edx,(%esi)
void
cons_intr(int (*proc)(void))
{
	int c;

	while ((c = (*proc)()) != -1) {
f01091d6:	ff d3                	call   *%ebx
f01091d8:	83 f8 ff             	cmp    $0xffffffff,%eax
f01091db:	75 da                	jne    f01091b7 <_Z9cons_intrPFivE+0x18>
			continue;
		cons.buf[cons.wpos++] = c;
		if (cons.wpos == CONSBUFSIZE)
			cons.wpos = 0;
	}
}
f01091dd:	83 c4 0c             	add    $0xc,%esp
f01091e0:	5b                   	pop    %ebx
f01091e1:	5e                   	pop    %esi
f01091e2:	5f                   	pop    %edi
f01091e3:	5d                   	pop    %ebp
f01091e4:	c3                   	ret    

f01091e5 <_Z8kbd_intrv>:

	return c;
}

void
kbd_intr(void)
f01091e5:	55                   	push   %ebp
f01091e6:	89 e5                	mov    %esp,%ebp
f01091e8:	83 ec 08             	sub    $0x8,%esp
{
	cons_intr(kbd_proc_data);
f01091eb:	c7 04 24 11 94 10 f0 	movl   $0xf0109411,(%esp)
f01091f2:	e8 a8 ff ff ff       	call   f010919f <_Z9cons_intrPFivE>
}
f01091f7:	c9                   	leave  
f01091f8:	c3                   	ret    

f01091f9 <_Z11serial_intrv>:
		return -1;
	return inb(COM1+COM_RX);
}

void
serial_intr(void)
f01091f9:	55                   	push   %ebp
f01091fa:	89 e5                	mov    %esp,%ebp
f01091fc:	83 ec 08             	sub    $0x8,%esp
{
	if (serial_exists)
f01091ff:	80 3d 00 71 11 f0 00 	cmpb   $0x0,0xf0117100
f0109206:	74 0c                	je     f0109214 <_Z11serial_intrv+0x1b>
		cons_intr(serial_proc_data);
f0109208:	c7 04 24 20 91 10 f0 	movl   $0xf0109120,(%esp)
f010920f:	e8 8b ff ff ff       	call   f010919f <_Z9cons_intrPFivE>
}
f0109214:	c9                   	leave  
f0109215:	c3                   	ret    

f0109216 <_Z9cons_getcv>:
	}
}

// return the next input character from the console, or 0 if none waiting
int
cons_getc(void)
f0109216:	55                   	push   %ebp
f0109217:	89 e5                	mov    %esp,%ebp
f0109219:	83 ec 08             	sub    $0x8,%esp
	int c;

	// poll for any pending input characters,
	// so that this function works even when interrupts are disabled
	// (e.g., when called from the kernel monitor).
	serial_intr();
f010921c:	e8 d8 ff ff ff       	call   f01091f9 <_Z11serial_intrv>
	kbd_intr();
f0109221:	e8 bf ff ff ff       	call   f01091e5 <_Z8kbd_intrv>

	// grab the next character from the input buffer.
	if (cons.rpos != cons.wpos) {
f0109226:	a1 20 c3 11 f0       	mov    0xf011c320,%eax
f010922b:	b9 00 00 00 00       	mov    $0x0,%ecx
f0109230:	3b 05 24 c3 11 f0    	cmp    0xf011c324,%eax
f0109236:	74 21                	je     f0109259 <_Z9cons_getcv+0x43>
		c = cons.buf[cons.rpos++];
f0109238:	0f b6 88 20 c1 11 f0 	movzbl -0xfee3ee0(%eax),%ecx
f010923f:	8d 50 01             	lea    0x1(%eax),%edx
		if (cons.rpos == CONSBUFSIZE)
f0109242:	81 fa 00 02 00 00    	cmp    $0x200,%edx
			cons.rpos = 0;
f0109248:	0f 94 c0             	sete   %al
f010924b:	0f b6 c0             	movzbl %al,%eax
f010924e:	83 e8 01             	sub    $0x1,%eax
f0109251:	21 c2                	and    %eax,%edx
f0109253:	89 15 20 c3 11 f0    	mov    %edx,0xf011c320
		return c;
	}
	return 0;
}
f0109259:	89 c8                	mov    %ecx,%eax
f010925b:	c9                   	leave  
f010925c:	c3                   	ret    

f010925d <_Z7getcharv>:
{
	cons_putc(c);
}

int
getchar(void)
f010925d:	55                   	push   %ebp
f010925e:	89 e5                	mov    %esp,%ebp
f0109260:	83 ec 08             	sub    $0x8,%esp
{
	int c;

	while ((c = cons_getc()) == 0)
f0109263:	e8 ae ff ff ff       	call   f0109216 <_Z9cons_getcv>
f0109268:	85 c0                	test   %eax,%eax
f010926a:	74 f7                	je     f0109263 <_Z7getcharv+0x6>
		/* do nothing */;
	return c;
}
f010926c:	c9                   	leave  
f010926d:	c3                   	ret    

f010926e <_Z6isconsi>:

int
iscons(int fdnum)
f010926e:	55                   	push   %ebp
f010926f:	89 e5                	mov    %esp,%ebp
{
	// used by readline
	return 1;
}
f0109271:	b8 01 00 00 00       	mov    $0x1,%eax
f0109276:	5d                   	pop    %ebp
f0109277:	c3                   	ret    

f0109278 <_Z9cons_initv>:
	cga_putc(c);
}

// initialize the console devices
void
cons_init(void)
f0109278:	55                   	push   %ebp
f0109279:	89 e5                	mov    %esp,%ebp
f010927b:	83 ec 18             	sub    $0x18,%esp
f010927e:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f0109281:	89 75 f8             	mov    %esi,-0x8(%ebp)
f0109284:	89 7d fc             	mov    %edi,-0x4(%ebp)

static void
cga_init(void)
{
	volatile uint16_t *cp = (uint16_t*) (KERNBASE + CGA_BUF);
	uint16_t was = *cp;
f0109287:	b8 00 80 0b f0       	mov    $0xf00b8000,%eax
f010928c:	0f b7 10             	movzwl (%eax),%edx
	*cp = (uint16_t) 0xA55A;
f010928f:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
	if (*cp != 0xA55A) {
f0109294:	0f b7 00             	movzwl (%eax),%eax
f0109297:	66 3d 5a a5          	cmp    $0xa55a,%ax
f010929b:	74 11                	je     f01092ae <_Z9cons_initv+0x36>
		cp = (uint16_t*) (KERNBASE + MONO_BUF);
		addr_6845 = MONO_BASE;
f010929d:	c7 05 04 71 11 f0 b4 	movl   $0x3b4,0xf0117104
f01092a4:	03 00 00 
f01092a7:	be 00 00 0b f0       	mov    $0xf00b0000,%esi
f01092ac:	eb 16                	jmp    f01092c4 <_Z9cons_initv+0x4c>
	} else {
		*cp = was;
f01092ae:	66 89 15 00 80 0b f0 	mov    %dx,0xf00b8000
		addr_6845 = CGA_BASE;
f01092b5:	c7 05 04 71 11 f0 d4 	movl   $0x3d4,0xf0117104
f01092bc:	03 00 00 
f01092bf:	be 00 80 0b f0       	mov    $0xf00b8000,%esi
	}
	
	/* Extract cursor location */
	outb(addr_6845, 14);
f01092c4:	8b 1d 04 71 11 f0    	mov    0xf0117104,%ebx
f01092ca:	89 d9                	mov    %ebx,%ecx
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f01092cc:	b8 0e 00 00 00       	mov    $0xe,%eax
f01092d1:	89 da                	mov    %ebx,%edx
f01092d3:	ee                   	out    %al,(%dx)
	unsigned pos = inb(addr_6845 + 1) << 8;
f01092d4:	83 c3 01             	add    $0x1,%ebx

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f01092d7:	89 da                	mov    %ebx,%edx
f01092d9:	ec                   	in     (%dx),%al
f01092da:	0f b6 c0             	movzbl %al,%eax
f01092dd:	89 c7                	mov    %eax,%edi
f01092df:	c1 e7 08             	shl    $0x8,%edi
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f01092e2:	b8 0f 00 00 00       	mov    $0xf,%eax
f01092e7:	89 ca                	mov    %ecx,%edx
f01092e9:	ee                   	out    %al,(%dx)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f01092ea:	89 da                	mov    %ebx,%edx
f01092ec:	ec                   	in     (%dx),%al
	outb(addr_6845, 15);
	pos |= inb(addr_6845 + 1);

	crt_buf = (uint16_t*) cp;
f01092ed:	89 35 08 71 11 f0    	mov    %esi,0xf0117108
	crt_pos = pos;
f01092f3:	0f b6 d0             	movzbl %al,%edx
f01092f6:	89 f8                	mov    %edi,%eax
f01092f8:	09 d0                	or     %edx,%eax
f01092fa:	66 a3 0c 71 11 f0    	mov    %ax,0xf011710c
void
cons_init(void)
{
	cga_init();
	kbd_init();
	serial_init();
f0109300:	e8 3a fe ff ff       	call   f010913f <_Z11serial_initv>

	if (!serial_exists)
f0109305:	80 3d 00 71 11 f0 00 	cmpb   $0x0,0xf0117100
f010930c:	75 0c                	jne    f010931a <_Z9cons_initv+0xa2>
		cprintf("Serial port does not exist!\n");
f010930e:	c7 04 24 a4 cf 10 f0 	movl   $0xf010cfa4,(%esp)
f0109315:	e8 d5 27 00 00       	call   f010baef <_Z7cprintfPKcz>
}
f010931a:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f010931d:	8b 75 f8             	mov    -0x8(%ebp),%esi
f0109320:	8b 7d fc             	mov    -0x4(%ebp),%edi
f0109323:	89 ec                	mov    %ebp,%esp
f0109325:	5d                   	pop    %ebp
f0109326:	c3                   	ret    

f0109327 <_ZL16cga_savebuf_copyib>:

#if CRT_SAVEROWS > 0
// Copy one screen's worth of data to or from the save buffer,
// starting at line 'first_line'.
static void
cga_savebuf_copy(int first_line, bool to_screen)
f0109327:	55                   	push   %ebp
f0109328:	89 e5                	mov    %esp,%ebp
f010932a:	83 ec 28             	sub    $0x28,%esp
f010932d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f0109330:	89 75 f8             	mov    %esi,-0x8(%ebp)
f0109333:	89 7d fc             	mov    %edi,-0x4(%ebp)
f0109336:	88 55 f3             	mov    %dl,-0xd(%ebp)
{
	// Calculate the beginning & end of the save buffer area.
	uint16_t *pos = crtsave_buf + (first_line % CRT_SAVEROWS) * CRT_COLS;
f0109339:	89 c2                	mov    %eax,%edx
f010933b:	c1 fa 1f             	sar    $0x1f,%edx
f010933e:	c1 ea 19             	shr    $0x19,%edx
f0109341:	01 d0                	add    %edx,%eax
f0109343:	83 e0 7f             	and    $0x7f,%eax
f0109346:	29 d0                	sub    %edx,%eax
f0109348:	8d 04 80             	lea    (%eax,%eax,4),%eax
f010934b:	c1 e0 05             	shl    $0x5,%eax
f010934e:	8d b0 20 71 11 f0    	lea    -0xfee8ee0(%eax),%esi
	uint16_t *end = pos + CRT_ROWS * CRT_COLS;
f0109354:	8d be a0 0f 00 00    	lea    0xfa0(%esi),%edi
	// Check for wraparound.
	uint16_t *trueend = min(end, crtsave_buf + CRT_SAVEROWS * CRT_COLS);
f010935a:	c7 44 24 04 20 c1 11 	movl   $0xf011c120,0x4(%esp)
f0109361:	f0 
f0109362:	89 3c 24             	mov    %edi,(%esp)
f0109365:	e8 03 05 00 00       	call   f010986d <_Z3minIPtET_S1_S1_>
f010936a:	89 c3                	mov    %eax,%ebx

	// Copy the initial portion.
	if (to_screen)
f010936c:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
f0109370:	74 1c                	je     f010938e <_ZL16cga_savebuf_copyib+0x67>
		memcpy(crt_buf, pos, (trueend - pos) * sizeof(uint16_t));
f0109372:	29 f0                	sub    %esi,%eax
f0109374:	83 e0 fe             	and    $0xfffffffe,%eax
f0109377:	89 44 24 08          	mov    %eax,0x8(%esp)
f010937b:	89 74 24 04          	mov    %esi,0x4(%esp)
f010937f:	a1 08 71 11 f0       	mov    0xf0117108,%eax
f0109384:	89 04 24             	mov    %eax,(%esp)
f0109387:	e8 0c 37 00 00       	call   f010ca98 <_Z6memcpyPvPKvj>
f010938c:	eb 1a                	jmp    f01093a8 <_ZL16cga_savebuf_copyib+0x81>
	else
		memcpy(pos, crt_buf, (trueend - pos) * sizeof(uint16_t));
f010938e:	29 f0                	sub    %esi,%eax
f0109390:	83 e0 fe             	and    $0xfffffffe,%eax
f0109393:	89 44 24 08          	mov    %eax,0x8(%esp)
f0109397:	a1 08 71 11 f0       	mov    0xf0117108,%eax
f010939c:	89 44 24 04          	mov    %eax,0x4(%esp)
f01093a0:	89 34 24             	mov    %esi,(%esp)
f01093a3:	e8 f0 36 00 00       	call   f010ca98 <_Z6memcpyPvPKvj>

	// If there was wraparound, copy the second part of the screen.
	if (end == trueend)
f01093a8:	39 df                	cmp    %ebx,%edi
f01093aa:	74 58                	je     f0109404 <_ZL16cga_savebuf_copyib+0xdd>
		/* do nothing */;
	else if (to_screen)
f01093ac:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
f01093b0:	74 2a                	je     f01093dc <_ZL16cga_savebuf_copyib+0xb5>
		memcpy(crt_buf + (trueend - pos), crtsave_buf, (end - trueend) * sizeof(uint16_t));
f01093b2:	89 f8                	mov    %edi,%eax
f01093b4:	29 d8                	sub    %ebx,%eax
f01093b6:	83 e0 fe             	and    $0xfffffffe,%eax
f01093b9:	89 44 24 08          	mov    %eax,0x8(%esp)
f01093bd:	c7 44 24 04 20 71 11 	movl   $0xf0117120,0x4(%esp)
f01093c4:	f0 
f01093c5:	89 d8                	mov    %ebx,%eax
f01093c7:	29 f0                	sub    %esi,%eax
f01093c9:	83 e0 fe             	and    $0xfffffffe,%eax
f01093cc:	03 05 08 71 11 f0    	add    0xf0117108,%eax
f01093d2:	89 04 24             	mov    %eax,(%esp)
f01093d5:	e8 be 36 00 00       	call   f010ca98 <_Z6memcpyPvPKvj>
f01093da:	eb 28                	jmp    f0109404 <_ZL16cga_savebuf_copyib+0xdd>
	else
		memcpy(crtsave_buf, crt_buf + (trueend - pos), (end - trueend) * sizeof(uint16_t));
f01093dc:	89 f8                	mov    %edi,%eax
f01093de:	29 d8                	sub    %ebx,%eax
f01093e0:	83 e0 fe             	and    $0xfffffffe,%eax
f01093e3:	89 44 24 08          	mov    %eax,0x8(%esp)
f01093e7:	89 d8                	mov    %ebx,%eax
f01093e9:	29 f0                	sub    %esi,%eax
f01093eb:	83 e0 fe             	and    $0xfffffffe,%eax
f01093ee:	03 05 08 71 11 f0    	add    0xf0117108,%eax
f01093f4:	89 44 24 04          	mov    %eax,0x4(%esp)
f01093f8:	c7 04 24 20 71 11 f0 	movl   $0xf0117120,(%esp)
f01093ff:	e8 94 36 00 00       	call   f010ca98 <_Z6memcpyPvPKvj>
}
f0109404:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f0109407:	8b 75 f8             	mov    -0x8(%ebp),%esi
f010940a:	8b 7d fc             	mov    -0x4(%ebp),%edi
f010940d:	89 ec                	mov    %ebp,%esp
f010940f:	5d                   	pop    %ebp
f0109410:	c3                   	ret    

f0109411 <_ZL13kbd_proc_datav>:
/*
 * Get data from the keyboard.  If we finish a character, return it.  Else 0.
 * Return -1 if no data.
 */
static int
kbd_proc_data(void)
f0109411:	55                   	push   %ebp
f0109412:	89 e5                	mov    %esp,%ebp
f0109414:	83 ec 28             	sub    $0x28,%esp
f0109417:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f010941a:	89 75 f8             	mov    %esi,-0x8(%ebp)
f010941d:	89 7d fc             	mov    %edi,-0x4(%ebp)
f0109420:	ba 64 00 00 00       	mov    $0x64,%edx
f0109425:	ec                   	in     (%dx),%al
{
	int c;
	uint8_t data;
	static uint32_t shift;

	if ((inb(KBSTATP) & KBS_DIB) == 0)
f0109426:	be ff ff ff ff       	mov    $0xffffffff,%esi
f010942b:	a8 01                	test   $0x1,%al
f010942d:	0f 84 93 01 00 00    	je     f01095c6 <_ZL13kbd_proc_datav+0x1b5>
f0109433:	ba 60 00 00 00       	mov    $0x60,%edx
f0109438:	ec                   	in     (%dx),%al
f0109439:	89 c2                	mov    %eax,%edx
		return -1;

	data = inb(KBDATAP);

	if (data == 0xE0) {
f010943b:	3c e0                	cmp    $0xe0,%al
f010943d:	75 11                	jne    f0109450 <_ZL13kbd_proc_datav+0x3f>
		// E0 escape character
		shift |= E0ESC;
f010943f:	83 0d 28 c3 11 f0 40 	orl    $0x40,0xf011c328
f0109446:	be 00 00 00 00       	mov    $0x0,%esi
f010944b:	e9 76 01 00 00       	jmp    f01095c6 <_ZL13kbd_proc_datav+0x1b5>
		return 0;
	} else if (data & 0x80) {
f0109450:	84 c0                	test   %al,%al
f0109452:	79 31                	jns    f0109485 <_ZL13kbd_proc_datav+0x74>
		// Key released
		data = (shift & E0ESC ? data : data & 0x7F);
f0109454:	8b 0d 28 c3 11 f0    	mov    0xf011c328,%ecx
f010945a:	f6 c1 40             	test   $0x40,%cl
f010945d:	75 03                	jne    f0109462 <_ZL13kbd_proc_datav+0x51>
f010945f:	83 e2 7f             	and    $0x7f,%edx
		shift &= ~(shiftcode[data] | E0ESC);
f0109462:	0f b6 c2             	movzbl %dl,%eax
f0109465:	0f b6 80 e0 cf 10 f0 	movzbl -0xfef3020(%eax),%eax
f010946c:	83 c8 40             	or     $0x40,%eax
f010946f:	0f b6 c0             	movzbl %al,%eax
f0109472:	f7 d0                	not    %eax
f0109474:	21 c8                	and    %ecx,%eax
f0109476:	a3 28 c3 11 f0       	mov    %eax,0xf011c328
f010947b:	be 00 00 00 00       	mov    $0x0,%esi
f0109480:	e9 41 01 00 00       	jmp    f01095c6 <_ZL13kbd_proc_datav+0x1b5>
		return 0;
	} else if (shift & E0ESC) {
f0109485:	a1 28 c3 11 f0       	mov    0xf011c328,%eax
f010948a:	a8 40                	test   $0x40,%al
f010948c:	74 0b                	je     f0109499 <_ZL13kbd_proc_datav+0x88>
		// Last character was an E0 escape; or with 0x80
		data |= 0x80;
f010948e:	83 ca 80             	or     $0xffffff80,%edx
		shift &= ~E0ESC;
f0109491:	83 e0 bf             	and    $0xffffffbf,%eax
f0109494:	a3 28 c3 11 f0       	mov    %eax,0xf011c328
	}

	shift |= shiftcode[data];
f0109499:	0f b6 ca             	movzbl %dl,%ecx
	shift ^= togglecode[data];
f010949c:	0f b6 81 e0 cf 10 f0 	movzbl -0xfef3020(%ecx),%eax
f01094a3:	0b 05 28 c3 11 f0    	or     0xf011c328,%eax
f01094a9:	0f b6 91 e0 d0 10 f0 	movzbl -0xfef2f20(%ecx),%edx
f01094b0:	31 c2                	xor    %eax,%edx
f01094b2:	89 15 28 c3 11 f0    	mov    %edx,0xf011c328

	c = charcode[shift & (CTL | SHIFT)][data];
f01094b8:	89 d3                	mov    %edx,%ebx
f01094ba:	83 e3 03             	and    $0x3,%ebx
f01094bd:	8b 04 9d e0 d1 10 f0 	mov    -0xfef2e20(,%ebx,4),%eax
f01094c4:	0f b6 34 08          	movzbl (%eax,%ecx,1),%esi
	if (shift & CAPSLOCK) {
f01094c8:	f6 c2 08             	test   $0x8,%dl
f01094cb:	74 18                	je     f01094e5 <_ZL13kbd_proc_datav+0xd4>
		if ('a' <= c && c <= 'z')
f01094cd:	8d 46 9f             	lea    -0x61(%esi),%eax
f01094d0:	83 f8 19             	cmp    $0x19,%eax
f01094d3:	77 05                	ja     f01094da <_ZL13kbd_proc_datav+0xc9>
			c += 'A' - 'a';
f01094d5:	83 ee 20             	sub    $0x20,%esi
f01094d8:	eb 0b                	jmp    f01094e5 <_ZL13kbd_proc_datav+0xd4>
		else if ('A' <= c && c <= 'Z')
f01094da:	8d 46 bf             	lea    -0x41(%esi),%eax
f01094dd:	83 f8 19             	cmp    $0x19,%eax
f01094e0:	77 03                	ja     f01094e5 <_ZL13kbd_proc_datav+0xd4>
			c += 'a' - 'A';
f01094e2:	83 c6 20             	add    $0x20,%esi
	}

	// Process special keys
#if CRT_SAVEROWS > 0
	// Shift-PageUp and Shift-PageDown: scroll console
	if ((shift & (CTL | SHIFT)) && (c == KEY_PGUP || c == KEY_PGDN)) {
f01094e5:	85 db                	test   %ebx,%ebx
f01094e7:	0f 84 b2 00 00 00    	je     f010959f <_ZL13kbd_proc_datav+0x18e>
f01094ed:	8d 86 1a ff ff ff    	lea    -0xe6(%esi),%eax
f01094f3:	83 f8 01             	cmp    $0x1,%eax
f01094f6:	0f 87 a3 00 00 00    	ja     f010959f <_ZL13kbd_proc_datav+0x18e>
		cga_scroll(c == KEY_PGUP ? -CRT_ROWS : CRT_ROWS);
f01094fc:	81 fe e6 00 00 00    	cmp    $0xe6,%esi
f0109502:	0f 95 c0             	setne  %al
f0109505:	0f b6 c0             	movzbl %al,%eax
f0109508:	83 e8 01             	sub    $0x1,%eax
f010950b:	83 e0 ce             	and    $0xffffffce,%eax
f010950e:	83 c0 19             	add    $0x19,%eax

#if CRT_SAVEROWS > 0
static void
cga_scroll(int delta)
{
	int new_backscroll = max(min(crtsave_backscroll - delta, (int) crtsave_size), 0);
f0109511:	0f bf 15 12 71 11 f0 	movswl 0xf0117112,%edx
f0109518:	89 55 f0             	mov    %edx,-0x10(%ebp)
f010951b:	0f b7 15 0e 71 11 f0 	movzwl 0xf011710e,%edx
f0109522:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
f0109526:	0f bf da             	movswl %dx,%ebx
f0109529:	8b 55 f0             	mov    -0x10(%ebp),%edx
f010952c:	89 54 24 04          	mov    %edx,0x4(%esp)
f0109530:	89 da                	mov    %ebx,%edx
f0109532:	29 c2                	sub    %eax,%edx
f0109534:	89 14 24             	mov    %edx,(%esp)
f0109537:	e8 42 03 00 00       	call   f010987e <_Z3minIiET_S0_S0_>
f010953c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f0109543:	00 
f0109544:	89 04 24             	mov    %eax,(%esp)
f0109547:	e8 43 03 00 00       	call   f010988f <_Z3maxIiET_S0_S0_>
f010954c:	89 c7                	mov    %eax,%edi

	if (new_backscroll == crtsave_backscroll)
f010954e:	be 00 00 00 00       	mov    $0x0,%esi
f0109553:	39 c3                	cmp    %eax,%ebx
f0109555:	74 6f                	je     f01095c6 <_ZL13kbd_proc_datav+0x1b5>
		return;
	if (crtsave_backscroll == 0)
f0109557:	66 83 7d ee 00       	cmpw   $0x0,-0x12(%ebp)
f010955c:	75 14                	jne    f0109572 <_ZL13kbd_proc_datav+0x161>
		// save current screen
		cga_savebuf_copy(crtsave_pos + crtsave_size, 0);
f010955e:	0f b7 05 10 71 11 f0 	movzwl 0xf0117110,%eax
f0109565:	03 45 f0             	add    -0x10(%ebp),%eax
f0109568:	ba 00 00 00 00       	mov    $0x0,%edx
f010956d:	e8 b5 fd ff ff       	call   f0109327 <_ZL16cga_savebuf_copyib>
	
	crtsave_backscroll = new_backscroll;
f0109572:	66 89 3d 0e 71 11 f0 	mov    %di,0xf011710e
	cga_savebuf_copy(crtsave_pos + crtsave_size - crtsave_backscroll, 1);
f0109579:	0f bf 05 12 71 11 f0 	movswl 0xf0117112,%eax
f0109580:	0f b7 15 10 71 11 f0 	movzwl 0xf0117110,%edx
f0109587:	01 d0                	add    %edx,%eax
f0109589:	0f bf d7             	movswl %di,%edx
f010958c:	29 d0                	sub    %edx,%eax
f010958e:	ba 01 00 00 00       	mov    $0x1,%edx
f0109593:	e8 8f fd ff ff       	call   f0109327 <_ZL16cga_savebuf_copyib>
f0109598:	be 00 00 00 00       	mov    $0x0,%esi
f010959d:	eb 27                	jmp    f01095c6 <_ZL13kbd_proc_datav+0x1b5>
		cga_scroll(c == KEY_PGUP ? -CRT_ROWS : CRT_ROWS);
		return 0;
	}
#endif
	// Ctrl-Alt-Del: reboot
	if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
f010959f:	89 d0                	mov    %edx,%eax
f01095a1:	f7 d0                	not    %eax
f01095a3:	a8 06                	test   $0x6,%al
f01095a5:	75 1f                	jne    f01095c6 <_ZL13kbd_proc_datav+0x1b5>
f01095a7:	81 fe e9 00 00 00    	cmp    $0xe9,%esi
f01095ad:	75 17                	jne    f01095c6 <_ZL13kbd_proc_datav+0x1b5>
		cprintf("Rebooting!\n");
f01095af:	c7 04 24 c1 cf 10 f0 	movl   $0xf010cfc1,(%esp)
f01095b6:	e8 34 25 00 00       	call   f010baef <_Z7cprintfPKcz>
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f01095bb:	ba 92 00 00 00       	mov    $0x92,%edx
f01095c0:	b8 03 00 00 00       	mov    $0x3,%eax
f01095c5:	ee                   	out    %al,(%dx)
		outb(0x92, 0x3); // courtesy of Chris Frost
	}

	return c;
}
f01095c6:	89 f0                	mov    %esi,%eax
f01095c8:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f01095cb:	8b 75 f8             	mov    -0x8(%ebp),%esi
f01095ce:	8b 7d fc             	mov    -0x4(%ebp),%edi
f01095d1:	89 ec                	mov    %ebp,%esp
f01095d3:	5d                   	pop    %ebp
f01095d4:	c3                   	ret    

f01095d5 <_ZL8cga_putci>:
}

#endif

static void
cga_putc(int c)
f01095d5:	55                   	push   %ebp
f01095d6:	89 e5                	mov    %esp,%ebp
f01095d8:	56                   	push   %esi
f01095d9:	53                   	push   %ebx
f01095da:	83 ec 10             	sub    $0x10,%esp
f01095dd:	89 c3                	mov    %eax,%ebx
{
#if CRT_SAVEROWS > 0
	// unscroll if necessary
	if (crtsave_backscroll > 0) {
f01095df:	66 83 3d 0e 71 11 f0 	cmpw   $0x0,0xf011710e
f01095e6:	00 
f01095e7:	7e 23                	jle    f010960c <_ZL8cga_putci+0x37>
		cga_savebuf_copy(crtsave_pos + crtsave_size, 1);
f01095e9:	0f bf 05 12 71 11 f0 	movswl 0xf0117112,%eax
f01095f0:	0f b7 15 10 71 11 f0 	movzwl 0xf0117110,%edx
f01095f7:	01 d0                	add    %edx,%eax
f01095f9:	ba 01 00 00 00       	mov    $0x1,%edx
f01095fe:	e8 24 fd ff ff       	call   f0109327 <_ZL16cga_savebuf_copyib>
		crtsave_backscroll = 0;
f0109603:	66 c7 05 0e 71 11 f0 	movw   $0x0,0xf011710e
f010960a:	00 00 
	}
	
#endif
	// if no attribute given, then use light gray on black
	if (!(c & ~0xFF))
f010960c:	f7 c3 00 ff ff ff    	test   $0xffffff00,%ebx
f0109612:	75 03                	jne    f0109617 <_ZL8cga_putci+0x42>
		c |= 0x0700;
f0109614:	80 cf 07             	or     $0x7,%bh

	switch (c & 0xff) {
f0109617:	0f b6 c3             	movzbl %bl,%eax
f010961a:	83 f8 09             	cmp    $0x9,%eax
f010961d:	0f 84 8c 00 00 00    	je     f01096af <_ZL8cga_putci+0xda>
f0109623:	83 f8 09             	cmp    $0x9,%eax
f0109626:	7f 12                	jg     f010963a <_ZL8cga_putci+0x65>
f0109628:	83 f8 08             	cmp    $0x8,%eax
f010962b:	0f 85 b2 00 00 00    	jne    f01096e3 <_ZL8cga_putci+0x10e>
f0109631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f0109638:	eb 18                	jmp    f0109652 <_ZL8cga_putci+0x7d>
f010963a:	83 f8 0a             	cmp    $0xa,%eax
f010963d:	8d 76 00             	lea    0x0(%esi),%esi
f0109640:	74 43                	je     f0109685 <_ZL8cga_putci+0xb0>
f0109642:	83 f8 0d             	cmp    $0xd,%eax
f0109645:	8d 76 00             	lea    0x0(%esi),%esi
f0109648:	0f 85 95 00 00 00    	jne    f01096e3 <_ZL8cga_putci+0x10e>
f010964e:	66 90                	xchg   %ax,%ax
f0109650:	eb 3b                	jmp    f010968d <_ZL8cga_putci+0xb8>
	case '\b':
		if (crt_pos > 0) {
f0109652:	0f b7 05 0c 71 11 f0 	movzwl 0xf011710c,%eax
f0109659:	66 85 c0             	test   %ax,%ax
f010965c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f0109660:	0f 84 5c 01 00 00    	je     f01097c2 <_ZL8cga_putci+0x1ed>
			crt_pos--;
f0109666:	83 e8 01             	sub    $0x1,%eax
f0109669:	66 a3 0c 71 11 f0    	mov    %ax,0xf011710c
			crt_buf[crt_pos] = (c & ~0xff) | ' ';
f010966f:	0f b7 c0             	movzwl %ax,%eax
f0109672:	89 da                	mov    %ebx,%edx
f0109674:	b2 00                	mov    $0x0,%dl
f0109676:	83 ca 20             	or     $0x20,%edx
f0109679:	8b 0d 08 71 11 f0    	mov    0xf0117108,%ecx
f010967f:	66 89 14 41          	mov    %dx,(%ecx,%eax,2)
f0109683:	eb 7b                	jmp    f0109700 <_ZL8cga_putci+0x12b>
		}
		break;
	case '\n':
		crt_pos += CRT_COLS;
f0109685:	66 83 05 0c 71 11 f0 	addw   $0x50,0xf011710c
f010968c:	50 
		/* fallthru */
	case '\r':
		crt_pos -= (crt_pos % CRT_COLS);
f010968d:	0f b7 05 0c 71 11 f0 	movzwl 0xf011710c,%eax
f0109694:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
f010969a:	c1 e8 10             	shr    $0x10,%eax
f010969d:	66 c1 e8 06          	shr    $0x6,%ax
f01096a1:	8d 04 80             	lea    (%eax,%eax,4),%eax
f01096a4:	c1 e0 04             	shl    $0x4,%eax
f01096a7:	66 a3 0c 71 11 f0    	mov    %ax,0xf011710c
f01096ad:	eb 51                	jmp    f0109700 <_ZL8cga_putci+0x12b>
		break;
	case '\t':
		cga_putc(' ');
f01096af:	b8 20 00 00 00       	mov    $0x20,%eax
f01096b4:	e8 1c ff ff ff       	call   f01095d5 <_ZL8cga_putci>
		cga_putc(' ');
f01096b9:	b8 20 00 00 00       	mov    $0x20,%eax
f01096be:	e8 12 ff ff ff       	call   f01095d5 <_ZL8cga_putci>
		cga_putc(' ');
f01096c3:	b8 20 00 00 00       	mov    $0x20,%eax
f01096c8:	e8 08 ff ff ff       	call   f01095d5 <_ZL8cga_putci>
		cga_putc(' ');
f01096cd:	b8 20 00 00 00       	mov    $0x20,%eax
f01096d2:	e8 fe fe ff ff       	call   f01095d5 <_ZL8cga_putci>
		cga_putc(' ');
f01096d7:	b8 20 00 00 00       	mov    $0x20,%eax
f01096dc:	e8 f4 fe ff ff       	call   f01095d5 <_ZL8cga_putci>
f01096e1:	eb 1d                	jmp    f0109700 <_ZL8cga_putci+0x12b>
		break;
	default:
		crt_buf[crt_pos++] = c;		/* write the character */
f01096e3:	0f b7 05 0c 71 11 f0 	movzwl 0xf011710c,%eax
f01096ea:	0f b7 c8             	movzwl %ax,%ecx
f01096ed:	8b 15 08 71 11 f0    	mov    0xf0117108,%edx
f01096f3:	66 89 1c 4a          	mov    %bx,(%edx,%ecx,2)
f01096f7:	83 c0 01             	add    $0x1,%eax
f01096fa:	66 a3 0c 71 11 f0    	mov    %ax,0xf011710c
		break;
	}

	// What is the purpose of this?
	if (crt_pos >= CRT_SIZE) {
f0109700:	66 81 3d 0c 71 11 f0 	cmpw   $0x7cf,0xf011710c
f0109707:	cf 07 
f0109709:	0f 86 b3 00 00 00    	jbe    f01097c2 <_ZL8cga_putci+0x1ed>
		int i;
		
#if CRT_SAVEROWS > 0
		// Save the scrolled-back row
		if (crtsave_size == CRT_SAVEROWS - CRT_ROWS)
f010970f:	0f b7 05 12 71 11 f0 	movzwl 0xf0117112,%eax
f0109716:	66 83 f8 67          	cmp    $0x67,%ax
f010971a:	75 15                	jne    f0109731 <_ZL8cga_putci+0x15c>
			crtsave_pos = (crtsave_pos + 1) % CRT_SAVEROWS;
f010971c:	0f b7 05 10 71 11 f0 	movzwl 0xf0117110,%eax
f0109723:	83 c0 01             	add    $0x1,%eax
f0109726:	83 e0 7f             	and    $0x7f,%eax
f0109729:	66 a3 10 71 11 f0    	mov    %ax,0xf0117110
f010972f:	eb 09                	jmp    f010973a <_ZL8cga_putci+0x165>
		else
			crtsave_size++;
f0109731:	83 c0 01             	add    $0x1,%eax
f0109734:	66 a3 12 71 11 f0    	mov    %ax,0xf0117112
		memcpy(crtsave_buf + ((crtsave_pos + crtsave_size - 1) % CRT_SAVEROWS) * CRT_COLS, crt_buf, CRT_COLS * sizeof(uint16_t));
f010973a:	c7 44 24 08 a0 00 00 	movl   $0xa0,0x8(%esp)
f0109741:	00 
f0109742:	a1 08 71 11 f0       	mov    0xf0117108,%eax
f0109747:	89 44 24 04          	mov    %eax,0x4(%esp)
f010974b:	0f b7 05 10 71 11 f0 	movzwl 0xf0117110,%eax
f0109752:	0f bf 15 12 71 11 f0 	movswl 0xf0117112,%edx
f0109759:	8d 44 10 ff          	lea    -0x1(%eax,%edx,1),%eax
f010975d:	89 c2                	mov    %eax,%edx
f010975f:	c1 fa 1f             	sar    $0x1f,%edx
f0109762:	c1 ea 19             	shr    $0x19,%edx
f0109765:	01 d0                	add    %edx,%eax
f0109767:	83 e0 7f             	and    $0x7f,%eax
f010976a:	29 d0                	sub    %edx,%eax
f010976c:	8d 04 80             	lea    (%eax,%eax,4),%eax
f010976f:	c1 e0 05             	shl    $0x5,%eax
f0109772:	05 20 71 11 f0       	add    $0xf0117120,%eax
f0109777:	89 04 24             	mov    %eax,(%esp)
f010977a:	e8 19 33 00 00       	call   f010ca98 <_Z6memcpyPvPKvj>
		
#endif
		memcpy(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
f010977f:	8b 15 08 71 11 f0    	mov    0xf0117108,%edx
f0109785:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
f010978c:	00 
f010978d:	8d 82 a0 00 00 00    	lea    0xa0(%edx),%eax
f0109793:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109797:	89 14 24             	mov    %edx,(%esp)
f010979a:	e8 f9 32 00 00       	call   f010ca98 <_Z6memcpyPvPKvj>
		for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
			crt_buf[i] = 0x0700 | ' ';
f010979f:	8b 15 08 71 11 f0    	mov    0xf0117108,%edx
f01097a5:	b8 80 07 00 00       	mov    $0x780,%eax
f01097aa:	66 c7 04 42 20 07    	movw   $0x720,(%edx,%eax,2)
			crtsave_size++;
		memcpy(crtsave_buf + ((crtsave_pos + crtsave_size - 1) % CRT_SAVEROWS) * CRT_COLS, crt_buf, CRT_COLS * sizeof(uint16_t));
		
#endif
		memcpy(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
		for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
f01097b0:	83 c0 01             	add    $0x1,%eax
f01097b3:	3d d0 07 00 00       	cmp    $0x7d0,%eax
f01097b8:	75 f0                	jne    f01097aa <_ZL8cga_putci+0x1d5>
			crt_buf[i] = 0x0700 | ' ';
		crt_pos -= CRT_COLS;
f01097ba:	66 83 2d 0c 71 11 f0 	subw   $0x50,0xf011710c
f01097c1:	50 
	}

	/* move that little blinky thing */
	outb(addr_6845, 14);
f01097c2:	8b 35 04 71 11 f0    	mov    0xf0117104,%esi
f01097c8:	89 f3                	mov    %esi,%ebx
f01097ca:	b8 0e 00 00 00       	mov    $0xe,%eax
f01097cf:	89 f2                	mov    %esi,%edx
f01097d1:	ee                   	out    %al,(%dx)
	outb(addr_6845 + 1, crt_pos >> 8);
f01097d2:	0f b7 0d 0c 71 11 f0 	movzwl 0xf011710c,%ecx
f01097d9:	83 c6 01             	add    $0x1,%esi
f01097dc:	0f b6 c5             	movzbl %ch,%eax
f01097df:	89 f2                	mov    %esi,%edx
f01097e1:	ee                   	out    %al,(%dx)
f01097e2:	b8 0f 00 00 00       	mov    $0xf,%eax
f01097e7:	89 da                	mov    %ebx,%edx
f01097e9:	ee                   	out    %al,(%dx)
f01097ea:	89 c8                	mov    %ecx,%eax
f01097ec:	89 f2                	mov    %esi,%edx
f01097ee:	ee                   	out    %al,(%dx)
	outb(addr_6845, 15);
	outb(addr_6845 + 1, crt_pos);
}
f01097ef:	83 c4 10             	add    $0x10,%esp
f01097f2:	5b                   	pop    %ebx
f01097f3:	5e                   	pop    %esi
f01097f4:	5d                   	pop    %ebp
f01097f5:	c3                   	ret    

f01097f6 <_Z9cons_putci>:
	return 0;
}

// output a character to the console
void
cons_putc(int c)
f01097f6:	55                   	push   %ebp
f01097f7:	89 e5                	mov    %esp,%ebp
f01097f9:	57                   	push   %edi
f01097fa:	56                   	push   %esi
f01097fb:	53                   	push   %ebx
f01097fc:	83 ec 0c             	sub    $0xc,%esp
f01097ff:	8b 5d 08             	mov    0x8(%ebp),%ebx

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f0109802:	ba 79 03 00 00       	mov    $0x379,%edx
f0109807:	ec                   	in     (%dx),%al
static void
lpt_putc(int c)
{
	int i;

	for (i = 0; !(inb(0x378+1) & 0x80) && i < 12800; i++)
f0109808:	84 c0                	test   %al,%al
f010980a:	78 29                	js     f0109835 <_Z9cons_putci+0x3f>
f010980c:	bf 00 00 00 00       	mov    $0x0,%edi
f0109811:	b9 84 00 00 00       	mov    $0x84,%ecx
f0109816:	be 79 03 00 00       	mov    $0x379,%esi
f010981b:	eb 0b                	jmp    f0109828 <_Z9cons_putci+0x32>
f010981d:	83 c7 01             	add    $0x1,%edi
f0109820:	81 ff 00 32 00 00    	cmp    $0x3200,%edi
f0109826:	74 0d                	je     f0109835 <_Z9cons_putci+0x3f>
f0109828:	89 ca                	mov    %ecx,%edx
f010982a:	ec                   	in     (%dx),%al
f010982b:	ec                   	in     (%dx),%al
f010982c:	ec                   	in     (%dx),%al
f010982d:	ec                   	in     (%dx),%al
f010982e:	89 f2                	mov    %esi,%edx
f0109830:	ec                   	in     (%dx),%al
f0109831:	84 c0                	test   %al,%al
f0109833:	79 e8                	jns    f010981d <_Z9cons_putci+0x27>
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f0109835:	ba 78 03 00 00       	mov    $0x378,%edx
f010983a:	89 d8                	mov    %ebx,%eax
f010983c:	ee                   	out    %al,(%dx)
f010983d:	b2 7a                	mov    $0x7a,%dl
f010983f:	b8 0d 00 00 00       	mov    $0xd,%eax
f0109844:	ee                   	out    %al,(%dx)
f0109845:	b8 08 00 00 00       	mov    $0x8,%eax
f010984a:	ee                   	out    %al,(%dx)
// output a character to the console
void
cons_putc(int c)
{
	lpt_putc(c);
	cga_putc(c);
f010984b:	89 d8                	mov    %ebx,%eax
f010984d:	e8 83 fd ff ff       	call   f01095d5 <_ZL8cga_putci>
}
f0109852:	83 c4 0c             	add    $0xc,%esp
f0109855:	5b                   	pop    %ebx
f0109856:	5e                   	pop    %esi
f0109857:	5f                   	pop    %edi
f0109858:	5d                   	pop    %ebp
f0109859:	c3                   	ret    

f010985a <_Z8cputchari>:
f010985a:	55                   	push   %ebp
f010985b:	89 e5                	mov    %esp,%ebp
f010985d:	83 ec 08             	sub    $0x8,%esp
f0109860:	8b 45 08             	mov    0x8(%ebp),%eax
f0109863:	89 04 24             	mov    %eax,(%esp)
f0109866:	e8 8b ff ff ff       	call   f01097f6 <_Z9cons_putci>
f010986b:	c9                   	leave  
f010986c:	c3                   	ret    

f010986d <_Z3minIPtET_S1_S1_>:
typedef int32_t off_t;


// min and max operations
template <typename T>
T min(T a, T b) {
f010986d:	55                   	push   %ebp
f010986e:	89 e5                	mov    %esp,%ebp
f0109870:	8b 55 08             	mov    0x8(%ebp),%edx
f0109873:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109876:	39 c2                	cmp    %eax,%edx
f0109878:	73 02                	jae    f010987c <_Z3minIPtET_S1_S1_+0xf>
f010987a:	89 d0                	mov    %edx,%eax
	return a <= b ? a : b;
}
f010987c:	5d                   	pop    %ebp
f010987d:	c3                   	ret    

f010987e <_Z3minIiET_S0_S0_>:
typedef int32_t off_t;


// min and max operations
template <typename T>
T min(T a, T b) {
f010987e:	55                   	push   %ebp
f010987f:	89 e5                	mov    %esp,%ebp
f0109881:	8b 55 08             	mov    0x8(%ebp),%edx
f0109884:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109887:	39 d0                	cmp    %edx,%eax
f0109889:	7e 02                	jle    f010988d <_Z3minIiET_S0_S0_+0xf>
f010988b:	89 d0                	mov    %edx,%eax
	return a <= b ? a : b;
}
f010988d:	5d                   	pop    %ebp
f010988e:	c3                   	ret    

f010988f <_Z3maxIiET_S0_S0_>:

template <typename T>
T max(T a, T b) {
f010988f:	55                   	push   %ebp
f0109890:	89 e5                	mov    %esp,%ebp
f0109892:	8b 55 08             	mov    0x8(%ebp),%edx
f0109895:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109898:	39 d0                	cmp    %edx,%eax
f010989a:	7d 02                	jge    f010989e <_Z3maxIiET_S0_S0_+0xf>
f010989c:	89 d0                	mov    %edx,%eax
	return a >= b ? a : b;
}
f010989e:	5d                   	pop    %ebp
f010989f:	c3                   	ret    

f01098a0 <_Z12mon_kerninfoiPPcP9Trapframe>:
		cprintf("%s - %s\n", commands[i].name, commands[i].desc);
	return 0;
}

int
mon_kerninfo(int argc, char **argv, struct Trapframe *tf)
f01098a0:	55                   	push   %ebp
f01098a1:	89 e5                	mov    %esp,%ebp
f01098a3:	83 ec 18             	sub    $0x18,%esp
{
	extern char _start[], etext[], edata[], end[];

	cprintf("Special kernel symbols:\n");
f01098a6:	c7 04 24 00 d5 10 f0 	movl   $0xf010d500,(%esp)
f01098ad:	e8 3d 22 00 00       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  _start %08x (virt)  %08x (phys)\n", _start, _start - KERNBASE);
f01098b2:	c7 44 24 08 0c 00 10 	movl   $0x10000c,0x8(%esp)
f01098b9:	00 
f01098ba:	c7 44 24 04 0c 00 10 	movl   $0xf010000c,0x4(%esp)
f01098c1:	f0 
f01098c2:	c7 04 24 48 d6 10 f0 	movl   $0xf010d648,(%esp)
f01098c9:	e8 21 22 00 00       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  etext  %08x (virt)  %08x (phys)\n", etext, etext - KERNBASE);
f01098ce:	c7 44 24 08 35 cf 10 	movl   $0x10cf35,0x8(%esp)
f01098d5:	00 
f01098d6:	c7 44 24 04 35 cf 10 	movl   $0xf010cf35,0x4(%esp)
f01098dd:	f0 
f01098de:	c7 04 24 6c d6 10 f0 	movl   $0xf010d66c,(%esp)
f01098e5:	e8 05 22 00 00       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  edata  %08x (virt)  %08x (phys)\n", edata, edata - KERNBASE);
f01098ea:	c7 44 24 08 c4 70 11 	movl   $0x1170c4,0x8(%esp)
f01098f1:	00 
f01098f2:	c7 44 24 04 c4 70 11 	movl   $0xf01170c4,0x4(%esp)
f01098f9:	f0 
f01098fa:	c7 04 24 90 d6 10 f0 	movl   $0xf010d690,(%esp)
f0109901:	e8 e9 21 00 00       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  end    %08x (virt)  %08x (phys)\n", end, end - KERNBASE);
f0109906:	c7 44 24 08 20 d0 11 	movl   $0x11d020,0x8(%esp)
f010990d:	00 
f010990e:	c7 44 24 04 20 d0 11 	movl   $0xf011d020,0x4(%esp)
f0109915:	f0 
f0109916:	c7 04 24 b4 d6 10 f0 	movl   $0xf010d6b4,(%esp)
f010991d:	e8 cd 21 00 00       	call   f010baef <_Z7cprintfPKcz>
	cprintf("Kernel executable memory footprint: %dKB\n",
		(end-_start+1023)/1024);
f0109922:	ba ff 03 00 00       	mov    $0x3ff,%edx
f0109927:	81 ea 0c 00 10 f0    	sub    $0xf010000c,%edx
f010992d:	81 c2 20 d0 11 f0    	add    $0xf011d020,%edx
f0109933:	89 d0                	mov    %edx,%eax
f0109935:	c1 f8 1f             	sar    $0x1f,%eax
f0109938:	c1 e8 16             	shr    $0x16,%eax
f010993b:	01 d0                	add    %edx,%eax
f010993d:	c1 f8 0a             	sar    $0xa,%eax
f0109940:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109944:	c7 04 24 d8 d6 10 f0 	movl   $0xf010d6d8,(%esp)
f010994b:	e8 9f 21 00 00       	call   f010baef <_Z7cprintfPKcz>
	return 0;
}
f0109950:	b8 00 00 00 00       	mov    $0x0,%eax
f0109955:	c9                   	leave  
f0109956:	c3                   	ret    

f0109957 <_Z8mon_helpiPPcP9Trapframe>:


/***** Implementations of basic kernel monitor commands *****/

int
mon_help(int argc, char **argv, struct Trapframe *tf)
f0109957:	55                   	push   %ebp
f0109958:	89 e5                	mov    %esp,%ebp
f010995a:	53                   	push   %ebx
f010995b:	83 ec 14             	sub    $0x14,%esp
f010995e:	bb c4 d7 10 f0       	mov    $0xf010d7c4,%ebx
{
	int i;

	for (i = 0; i < NCOMMANDS; i++)
		cprintf("%s - %s\n", commands[i].name, commands[i].desc);
f0109963:	8b 03                	mov    (%ebx),%eax
f0109965:	89 44 24 08          	mov    %eax,0x8(%esp)
f0109969:	8b 43 fc             	mov    -0x4(%ebx),%eax
f010996c:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109970:	c7 04 24 19 d5 10 f0 	movl   $0xf010d519,(%esp)
f0109977:	e8 73 21 00 00       	call   f010baef <_Z7cprintfPKcz>
f010997c:	83 c3 0c             	add    $0xc,%ebx
int
mon_help(int argc, char **argv, struct Trapframe *tf)
{
	int i;

	for (i = 0; i < NCOMMANDS; i++)
f010997f:	81 fb f4 d7 10 f0    	cmp    $0xf010d7f4,%ebx
f0109985:	75 dc                	jne    f0109963 <_Z8mon_helpiPPcP9Trapframe+0xc>
		cprintf("%s - %s\n", commands[i].name, commands[i].desc);
	return 0;
}
f0109987:	b8 00 00 00 00       	mov    $0x0,%eax
f010998c:	83 c4 14             	add    $0x14,%esp
f010998f:	5b                   	pop    %ebx
f0109990:	5d                   	pop    %ebp
f0109991:	c3                   	ret    

f0109992 <_Z7monitorP9Trapframe>:
	cprintf("Unknown command '%s'\n", argv[0]);
	return 0;
}

void
monitor(struct Trapframe *tf)
f0109992:	55                   	push   %ebp
f0109993:	89 e5                	mov    %esp,%ebp
f0109995:	57                   	push   %edi
f0109996:	56                   	push   %esi
f0109997:	53                   	push   %ebx
f0109998:	83 ec 4c             	sub    $0x4c,%esp
{
	char *buf;

	// The 'make grade' script depends on the following printout, so don't
	// remove it.
	cprintf("Welcome to the JOS kernel monitor!\n");
f010999b:	c7 04 24 04 d7 10 f0 	movl   $0xf010d704,(%esp)
f01099a2:	e8 48 21 00 00       	call   f010baef <_Z7cprintfPKcz>
	cprintf("Type 'help' for a list of commands.\n");
f01099a7:	c7 04 24 28 d7 10 f0 	movl   $0xf010d728,(%esp)
f01099ae:	e8 3c 21 00 00       	call   f010baef <_Z7cprintfPKcz>

	if (tf != NULL)
f01099b3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
f01099b7:	74 0b                	je     f01099c4 <_Z7monitorP9Trapframe+0x32>
		print_trapframe(tf);
f01099b9:	8b 45 08             	mov    0x8(%ebp),%eax
f01099bc:	89 04 24             	mov    %eax,(%esp)
f01099bf:	e8 b7 22 00 00       	call   f010bc7b <_Z15print_trapframeP9Trapframe>

	while (1) {
		buf = readline("K> ");
f01099c4:	c7 04 24 22 d5 10 f0 	movl   $0xf010d522,(%esp)
f01099cb:	e8 e0 2d 00 00       	call   f010c7b0 <_Z8readlinePKc>
f01099d0:	89 c6                	mov    %eax,%esi
		if (buf != NULL)
f01099d2:	85 c0                	test   %eax,%eax
f01099d4:	74 ee                	je     f01099c4 <_Z7monitorP9Trapframe+0x32>
	char *argv[MAXARGS];
	int i;

	// Parse the command buffer into whitespace-separated arguments
	argc = 0;
	argv[argc] = 0;
f01099d6:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
f01099dd:	bb 00 00 00 00       	mov    $0x0,%ebx
	while (1) {
		// gobble whitespace
		while (*buf && strchr(WHITESPACE, *buf))
f01099e2:	0f b6 06             	movzbl (%esi),%eax
f01099e5:	84 c0                	test   %al,%al
f01099e7:	74 79                	je     f0109a62 <_Z7monitorP9Trapframe+0xd0>
f01099e9:	0f be c0             	movsbl %al,%eax
f01099ec:	89 44 24 04          	mov    %eax,0x4(%esp)
f01099f0:	c7 04 24 26 d5 10 f0 	movl   $0xf010d526,(%esp)
f01099f7:	e8 0b 30 00 00       	call   f010ca07 <_Z6strchrPKcc>
f01099fc:	85 c0                	test   %eax,%eax
f01099fe:	0f 84 d6 00 00 00    	je     f0109ada <_Z7monitorP9Trapframe+0x148>
			*buf++ = 0;
f0109a04:	c6 06 00             	movb   $0x0,(%esi)
f0109a07:	83 c6 01             	add    $0x1,%esi
f0109a0a:	eb d6                	jmp    f01099e2 <_Z7monitorP9Trapframe+0x50>
		if (*buf == 0)
			break;

		// save and scan past next arg
		if (argc == MAXARGS-1) {
f0109a0c:	83 fb 0f             	cmp    $0xf,%ebx
f0109a0f:	90                   	nop    
f0109a10:	75 16                	jne    f0109a28 <_Z7monitorP9Trapframe+0x96>
			cprintf("Too many arguments (max %d)\n", MAXARGS);
f0109a12:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
f0109a19:	00 
f0109a1a:	c7 04 24 2b d5 10 f0 	movl   $0xf010d52b,(%esp)
f0109a21:	e8 c9 20 00 00       	call   f010baef <_Z7cprintfPKcz>
f0109a26:	eb 9c                	jmp    f01099c4 <_Z7monitorP9Trapframe+0x32>
			return 0;
		}
		argv[argc++] = buf;
f0109a28:	89 74 9d b4          	mov    %esi,-0x4c(%ebp,%ebx,4)
		while (*buf && !strchr(WHITESPACE, *buf))
f0109a2c:	0f b6 06             	movzbl (%esi),%eax
f0109a2f:	84 c0                	test   %al,%al
f0109a31:	0f 84 b6 00 00 00    	je     f0109aed <_Z7monitorP9Trapframe+0x15b>
f0109a37:	0f be c0             	movsbl %al,%eax
f0109a3a:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109a3e:	c7 04 24 26 d5 10 f0 	movl   $0xf010d526,(%esp)
f0109a45:	e8 bd 2f 00 00       	call   f010ca07 <_Z6strchrPKcc>
f0109a4a:	85 c0                	test   %eax,%eax
f0109a4c:	0f 85 9b 00 00 00    	jne    f0109aed <_Z7monitorP9Trapframe+0x15b>
			buf++;
f0109a52:	83 c6 01             	add    $0x1,%esi
		if (argc == MAXARGS-1) {
			cprintf("Too many arguments (max %d)\n", MAXARGS);
			return 0;
		}
		argv[argc++] = buf;
		while (*buf && !strchr(WHITESPACE, *buf))
f0109a55:	0f b6 06             	movzbl (%esi),%eax
f0109a58:	84 c0                	test   %al,%al
f0109a5a:	0f 84 8d 00 00 00    	je     f0109aed <_Z7monitorP9Trapframe+0x15b>
f0109a60:	eb d5                	jmp    f0109a37 <_Z7monitorP9Trapframe+0xa5>
			buf++;
	}
	argv[argc] = 0;
f0109a62:	c7 44 9d b4 00 00 00 	movl   $0x0,-0x4c(%ebp,%ebx,4)
f0109a69:	00 

	// Lookup and invoke the command
	if (argc == 0)
f0109a6a:	85 db                	test   %ebx,%ebx
f0109a6c:	0f 84 52 ff ff ff    	je     f01099c4 <_Z7monitorP9Trapframe+0x32>
f0109a72:	bf c0 d7 10 f0       	mov    $0xf010d7c0,%edi
f0109a77:	be 00 00 00 00       	mov    $0x0,%esi
		return 0;
	for (i = 0; i < NCOMMANDS; i++) {
		if (strcmp(argv[0], commands[i].name) == 0)
f0109a7c:	8b 07                	mov    (%edi),%eax
f0109a7e:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109a82:	8b 45 b4             	mov    -0x4c(%ebp),%eax
f0109a85:	89 04 24             	mov    %eax,(%esp)
f0109a88:	e8 03 2f 00 00       	call   f010c990 <_Z6strcmpPKcS0_>
f0109a8d:	85 c0                	test   %eax,%eax
f0109a8f:	75 24                	jne    f0109ab5 <_Z7monitorP9Trapframe+0x123>
			return commands[i].func(argc, argv, tf);
f0109a91:	8d 04 76             	lea    (%esi,%esi,2),%eax
f0109a94:	8b 55 08             	mov    0x8(%ebp),%edx
f0109a97:	89 54 24 08          	mov    %edx,0x8(%esp)
f0109a9b:	8d 55 b4             	lea    -0x4c(%ebp),%edx
f0109a9e:	89 54 24 04          	mov    %edx,0x4(%esp)
f0109aa2:	89 1c 24             	mov    %ebx,(%esp)
f0109aa5:	ff 14 85 c8 d7 10 f0 	call   *-0xfef2838(,%eax,4)
		print_trapframe(tf);

	while (1) {
		buf = readline("K> ");
		if (buf != NULL)
			if (runcmd(buf, tf) < 0)
f0109aac:	85 c0                	test   %eax,%eax
f0109aae:	78 45                	js     f0109af5 <_Z7monitorP9Trapframe+0x163>
f0109ab0:	e9 0f ff ff ff       	jmp    f01099c4 <_Z7monitorP9Trapframe+0x32>
	argv[argc] = 0;

	// Lookup and invoke the command
	if (argc == 0)
		return 0;
	for (i = 0; i < NCOMMANDS; i++) {
f0109ab5:	83 c6 01             	add    $0x1,%esi
f0109ab8:	83 c7 0c             	add    $0xc,%edi
f0109abb:	83 fe 04             	cmp    $0x4,%esi
f0109abe:	66 90                	xchg   %ax,%ax
f0109ac0:	75 ba                	jne    f0109a7c <_Z7monitorP9Trapframe+0xea>
		if (strcmp(argv[0], commands[i].name) == 0)
			return commands[i].func(argc, argv, tf);
	}
	cprintf("Unknown command '%s'\n", argv[0]);
f0109ac2:	8b 45 b4             	mov    -0x4c(%ebp),%eax
f0109ac5:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109ac9:	c7 04 24 48 d5 10 f0 	movl   $0xf010d548,(%esp)
f0109ad0:	e8 1a 20 00 00       	call   f010baef <_Z7cprintfPKcz>
f0109ad5:	e9 ea fe ff ff       	jmp    f01099c4 <_Z7monitorP9Trapframe+0x32>
	argv[argc] = 0;
	while (1) {
		// gobble whitespace
		while (*buf && strchr(WHITESPACE, *buf))
			*buf++ = 0;
		if (*buf == 0)
f0109ada:	80 3e 00             	cmpb   $0x0,(%esi)
f0109add:	0f 85 29 ff ff ff    	jne    f0109a0c <_Z7monitorP9Trapframe+0x7a>
f0109ae3:	90                   	nop    
f0109ae4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f0109ae8:	e9 75 ff ff ff       	jmp    f0109a62 <_Z7monitorP9Trapframe+0xd0>
		// save and scan past next arg
		if (argc == MAXARGS-1) {
			cprintf("Too many arguments (max %d)\n", MAXARGS);
			return 0;
		}
		argv[argc++] = buf;
f0109aed:	83 c3 01             	add    $0x1,%ebx
f0109af0:	e9 ed fe ff ff       	jmp    f01099e2 <_Z7monitorP9Trapframe+0x50>
		buf = readline("K> ");
		if (buf != NULL)
			if (runcmd(buf, tf) < 0)
				break;
	}
}
f0109af5:	83 c4 4c             	add    $0x4c,%esp
f0109af8:	5b                   	pop    %ebx
f0109af9:	5e                   	pop    %esi
f0109afa:	5f                   	pop    %edi
f0109afb:	5d                   	pop    %ebp
f0109afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f0109b00:	c3                   	ret    

f0109b01 <_Z8mon_exitiPPcP9Trapframe>:
	//ebp++;
	//}
	return 0;
}
int
mon_exit(int argc, char **argv, struct Trapframe *tf)
f0109b01:	55                   	push   %ebp
f0109b02:	89 e5                	mov    %esp,%ebp
f0109b04:	83 ec 18             	sub    $0x18,%esp
f0109b07:	8b 4d 10             	mov    0x10(%ebp),%ecx

static __inline uint32_t
read_eflags(void)
{
        uint32_t eflags;
        __asm __volatile("pushfl; popl %0" : "=r" (eflags));
f0109b0a:	9c                   	pushf  
f0109b0b:	58                   	pop    %eax
{
	 int ef;
	 ef = read_eflags();
	 if (tf->tf_eflags & 0x100)
f0109b0c:	8b 51 38             	mov    0x38(%ecx),%edx
f0109b0f:	f6 c6 01             	test   $0x1,%dh
f0109b12:	74 0a                	je     f0109b1e <_Z8mon_exitiPPcP9Trapframe+0x1d>
	 tf->tf_eflags &= ~(ef | 1 << 8); /* Clear TF to disable single-step mode */
f0109b14:	80 cc 01             	or     $0x1,%ah
f0109b17:	f7 d0                	not    %eax
f0109b19:	21 d0                	and    %edx,%eax
f0109b1b:	89 41 38             	mov    %eax,0x38(%ecx)
	     		"\tpopal\n"
	         	"\tpopl %%es\n"
		     	"\tpopl %%ds\n"
		        "\taddl $0x8,%%esp\n" /* skip tf_trapno and tf_errcode */
			"\tiret"
			: : "g" (tf) : "memory");
f0109b1e:	89 cc                	mov    %ecx,%esp
f0109b20:	61                   	popa   
f0109b21:	07                   	pop    %es
f0109b22:	1f                   	pop    %ds
f0109b23:	83 c4 08             	add    $0x8,%esp
f0109b26:	cf                   	iret   
	panic("iret failed"); /* mostly to placate the compiler */
f0109b27:	c7 44 24 08 5e d5 10 	movl   $0xf010d55e,0x8(%esp)
f0109b2e:	f0 
f0109b2f:	c7 44 24 04 6f 00 00 	movl   $0x6f,0x4(%esp)
f0109b36:	00 
f0109b37:	c7 04 24 6a d5 10 f0 	movl   $0xf010d56a,(%esp)
f0109b3e:	e8 1d f5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>

f0109b43 <_Z13mon_backtraceiPPcP9Trapframe>:
		(end-_start+1023)/1024);
	return 0;
}

int
mon_backtrace(int argc, char **argv, struct Trapframe *tf)
f0109b43:	55                   	push   %ebp
f0109b44:	89 e5                	mov    %esp,%ebp
f0109b46:	57                   	push   %edi
f0109b47:	56                   	push   %esi
f0109b48:	53                   	push   %ebx
f0109b49:	83 ec 4c             	sub    $0x4c,%esp
	// Your code here.
        uint32_t *ebp;
	extern char bootstacktop[];
	int i = 0;
	Eipdebuginfo info;
	cprintf("Stack backtrace:\n");
f0109b4c:	c7 04 24 79 d5 10 f0 	movl   $0xf010d579,(%esp)
f0109b53:	e8 97 1f 00 00       	call   f010baef <_Z7cprintfPKcz>
	ebp = (uint32_t *)read_ebp();
f0109b58:	89 ee                	mov    %ebp,%esi
	cprintf("bootstacktop: %08x\n", (uint32_t *)bootstacktop);
f0109b5a:	c7 44 24 04 00 90 10 	movl   $0xf0109000,0x4(%esp)
f0109b61:	f0 
f0109b62:	c7 04 24 8b d5 10 f0 	movl   $0xf010d58b,(%esp)
f0109b69:	e8 81 1f 00 00       	call   f010baef <_Z7cprintfPKcz>
	while(ebp < (uint32_t *)bootstacktop )
f0109b6e:	81 fe 00 90 10 f0    	cmp    $0xf0109000,%esi
f0109b74:	0f 83 a1 00 00 00    	jae    f0109c1b <_Z13mon_backtraceiPPcP9Trapframe+0xd8>
f0109b7a:	bf 00 00 00 00       	mov    $0x0,%edi
	{
        cprintf("%d: ebp %08x eip %08x args %08x %08x %08x %08x\n", i, ebp, *(ebp+1), *(ebp+2), *(ebp+2+1),*(ebp+2+2), *(ebp+2+3));
f0109b7f:	8d 5e 04             	lea    0x4(%esi),%ebx
f0109b82:	8b 46 14             	mov    0x14(%esi),%eax
f0109b85:	89 44 24 1c          	mov    %eax,0x1c(%esp)
f0109b89:	8b 46 10             	mov    0x10(%esi),%eax
f0109b8c:	89 44 24 18          	mov    %eax,0x18(%esp)
f0109b90:	8b 46 0c             	mov    0xc(%esi),%eax
f0109b93:	89 44 24 14          	mov    %eax,0x14(%esp)
f0109b97:	8b 46 08             	mov    0x8(%esi),%eax
f0109b9a:	89 44 24 10          	mov    %eax,0x10(%esp)
f0109b9e:	8b 03                	mov    (%ebx),%eax
f0109ba0:	89 44 24 0c          	mov    %eax,0xc(%esp)
f0109ba4:	89 74 24 08          	mov    %esi,0x8(%esp)
f0109ba8:	89 7c 24 04          	mov    %edi,0x4(%esp)
f0109bac:	c7 04 24 50 d7 10 f0 	movl   $0xf010d750,(%esp)
f0109bb3:	e8 37 1f 00 00       	call   f010baef <_Z7cprintfPKcz>
	debuginfo_eip(*(ebp+1), &info);
f0109bb8:	8d 45 dc             	lea    -0x24(%ebp),%eax
f0109bbb:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109bbf:	8b 03                	mov    (%ebx),%eax
f0109bc1:	89 04 24             	mov    %eax,(%esp)
f0109bc4:	e8 36 23 00 00       	call   f010beff <_Z13debuginfo_eipjP12Eipdebuginfo>
	cprintf("   %s:%d: %s (%d arg)\n", info.eip_file, info.eip_line, info.eip_fn_name, info.eip_fn_narg);
f0109bc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
f0109bcc:	89 44 24 10          	mov    %eax,0x10(%esp)
f0109bd0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0109bd3:	89 44 24 0c          	mov    %eax,0xc(%esp)
f0109bd7:	8b 45 e0             	mov    -0x20(%ebp),%eax
f0109bda:	89 44 24 08          	mov    %eax,0x8(%esp)
f0109bde:	8b 45 dc             	mov    -0x24(%ebp),%eax
f0109be1:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109be5:	c7 04 24 9f d5 10 f0 	movl   $0xf010d59f,(%esp)
f0109bec:	e8 fe 1e 00 00       	call   f010baef <_Z7cprintfPKcz>
	i++;
f0109bf1:	83 c7 01             	add    $0x1,%edi
	if(*ebp == 0 )
f0109bf4:	8b 06                	mov    (%esi),%eax
f0109bf6:	85 c0                	test   %eax,%eax
f0109bf8:	75 12                	jne    f0109c0c <_Z13mon_backtraceiPPcP9Trapframe+0xc9>
	{
		cprintf("the final value of ebp: %08x\n", ebp);
f0109bfa:	89 74 24 04          	mov    %esi,0x4(%esp)
f0109bfe:	c7 04 24 b6 d5 10 f0 	movl   $0xf010d5b6,(%esp)
f0109c05:	e8 e5 1e 00 00       	call   f010baef <_Z7cprintfPKcz>
f0109c0a:	eb 0f                	jmp    f0109c1b <_Z13mon_backtraceiPPcP9Trapframe+0xd8>
		break;
	}
	ebp = (uint32_t *)*ebp;
f0109c0c:	89 c6                	mov    %eax,%esi
	int i = 0;
	Eipdebuginfo info;
	cprintf("Stack backtrace:\n");
	ebp = (uint32_t *)read_ebp();
	cprintf("bootstacktop: %08x\n", (uint32_t *)bootstacktop);
	while(ebp < (uint32_t *)bootstacktop )
f0109c0e:	b8 00 90 10 f0       	mov    $0xf0109000,%eax
f0109c13:	39 f0                	cmp    %esi,%eax
f0109c15:	0f 87 64 ff ff ff    	ja     f0109b7f <_Z13mon_backtraceiPPcP9Trapframe+0x3c>
		cprintf("the final value of ebp: %08x\n", ebp);
		break;
	}
	ebp = (uint32_t *)*ebp;
	}
	if(tf != NULL)
f0109c1b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
f0109c1f:	74 11                	je     f0109c32 <_Z13mon_backtraceiPPcP9Trapframe+0xef>
	print_trapframe(tf);
f0109c21:	8b 45 10             	mov    0x10(%ebp),%eax
f0109c24:	89 04 24             	mov    %eax,(%esp)
f0109c27:	e8 4f 20 00 00       	call   f010bc7b <_Z15print_trapframeP9Trapframe>
f0109c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f0109c30:	eb 0c                	jmp    f0109c3e <_Z13mon_backtraceiPPcP9Trapframe+0xfb>
	else
	cprintf("no breakpoint\n");
f0109c32:	c7 04 24 d4 d5 10 f0 	movl   $0xf010d5d4,(%esp)
f0109c39:	e8 b1 1e 00 00       	call   f010baef <_Z7cprintfPKcz>
	//{
	//cprintf("0x%08x ", ebp);
	//ebp++;
	//}
	return 0;
}
f0109c3e:	b8 00 00 00 00       	mov    $0x0,%eax
f0109c43:	83 c4 4c             	add    $0x4c,%esp
f0109c46:	5b                   	pop    %ebx
f0109c47:	5e                   	pop    %esi
f0109c48:	5f                   	pop    %edi
f0109c49:	5d                   	pop    %ebp
f0109c4a:	c3                   	ret    
f0109c4b:	00 00                	add    %al,(%eax)
f0109c4d:	00 00                	add    %al,(%eax)
	...

f0109c50 <_Z14tlb_invalidatePjj>:
}

// Invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
void
tlb_invalidate(pde_t *pgdir, uintptr_t va)
f0109c50:	55                   	push   %ebp
f0109c51:	89 e5                	mov    %esp,%ebp
}

static __inline void 
invlpg(uintptr_t addr)
{ 
	__asm __volatile("invlpg (%0)" : : "r" (addr) : "memory");
f0109c53:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109c56:	0f 01 38             	invlpg (%eax)
{
	// Flush the entry only if we're modifying the current address space.
	// For now, there is only one address space, so always invalidate.
	invlpg(va);
}
f0109c59:	5d                   	pop    %ebp
f0109c5a:	c3                   	ret    

f0109c5b <_GLOBAL__I_npages>:
	page_free(pp0);
	page_free(pp1);
	page_free(pp2);
	
	cprintf("page_check() succeeded!\n");
}
f0109c5b:	55                   	push   %ebp
f0109c5c:	89 e5                	mov    %esp,%ebp
	SEG(STA_W, 0x0, 0xffffffff, 0),		// 0x10 - kernel data segment
	SEG(STA_X | STA_R, 0x0, 0xffffffff, 3),	// 0x18 - user code segment
	SEG(STA_W, 0x0, 0xffffffff, 3),		// 0x20 - user data segment
	SEG_NULL				// 0x28 - tss, initialized in
						// idt_init()
};
f0109c5e:	c7 05 60 c3 11 f0 00 	movl   $0x0,0xf011c360
f0109c65:	00 00 00 
f0109c68:	c7 05 64 c3 11 f0 00 	movl   $0x0,0xf011c364
f0109c6f:	00 00 00 
f0109c72:	66 c7 05 68 c3 11 f0 	movw   $0xffff,0xf011c368
f0109c79:	ff ff 
f0109c7b:	66 c7 05 6a c3 11 f0 	movw   $0x0,0xf011c36a
f0109c82:	00 00 
f0109c84:	c6 05 6c c3 11 f0 00 	movb   $0x0,0xf011c36c
f0109c8b:	c6 05 6d c3 11 f0 9a 	movb   $0x9a,0xf011c36d
f0109c92:	c6 05 6e c3 11 f0 cf 	movb   $0xcf,0xf011c36e
f0109c99:	c6 05 6f c3 11 f0 00 	movb   $0x0,0xf011c36f
f0109ca0:	66 c7 05 70 c3 11 f0 	movw   $0xffff,0xf011c370
f0109ca7:	ff ff 
f0109ca9:	66 c7 05 72 c3 11 f0 	movw   $0x0,0xf011c372
f0109cb0:	00 00 
f0109cb2:	c6 05 74 c3 11 f0 00 	movb   $0x0,0xf011c374
f0109cb9:	c6 05 75 c3 11 f0 92 	movb   $0x92,0xf011c375
f0109cc0:	c6 05 76 c3 11 f0 cf 	movb   $0xcf,0xf011c376
f0109cc7:	c6 05 77 c3 11 f0 00 	movb   $0x0,0xf011c377
f0109cce:	66 c7 05 78 c3 11 f0 	movw   $0xffff,0xf011c378
f0109cd5:	ff ff 
f0109cd7:	66 c7 05 7a c3 11 f0 	movw   $0x0,0xf011c37a
f0109cde:	00 00 
f0109ce0:	c6 05 7c c3 11 f0 00 	movb   $0x0,0xf011c37c
f0109ce7:	c6 05 7d c3 11 f0 fa 	movb   $0xfa,0xf011c37d
f0109cee:	c6 05 7e c3 11 f0 cf 	movb   $0xcf,0xf011c37e
f0109cf5:	c6 05 7f c3 11 f0 00 	movb   $0x0,0xf011c37f
f0109cfc:	66 c7 05 80 c3 11 f0 	movw   $0xffff,0xf011c380
f0109d03:	ff ff 
f0109d05:	66 c7 05 82 c3 11 f0 	movw   $0x0,0xf011c382
f0109d0c:	00 00 
f0109d0e:	c6 05 84 c3 11 f0 00 	movb   $0x0,0xf011c384
f0109d15:	c6 05 85 c3 11 f0 f2 	movb   $0xf2,0xf011c385
f0109d1c:	c6 05 86 c3 11 f0 cf 	movb   $0xcf,0xf011c386
f0109d23:	c6 05 87 c3 11 f0 00 	movb   $0x0,0xf011c387
f0109d2a:	c7 05 88 c3 11 f0 00 	movl   $0x0,0xf011c388
f0109d31:	00 00 00 
f0109d34:	c7 05 8c c3 11 f0 00 	movl   $0x0,0xf011c38c
f0109d3b:	00 00 00 
	page_free(pp0);
	page_free(pp1);
	page_free(pp2);
	
	cprintf("page_check() succeeded!\n");
}
f0109d3e:	5d                   	pop    %ebp
f0109d3f:	c3                   	ret    

f0109d40 <_ZL10boot_allocj>:
//
// If we're out of memory, boot_alloc should panic.
// This function may ONLY be used during initialization,
// before the free_pages list has been set up.
static void *
boot_alloc(uint32_t n)
f0109d40:	55                   	push   %ebp
f0109d41:	89 e5                	mov    %esp,%ebp
f0109d43:	83 ec 18             	sub    $0x18,%esp
	// Initialize nextfree if this is the first time.
	// 'end' is a magic symbol automatically generated by the linker,
	// which points to the end of the kernel's bss segment:
	// the first virtual address that the linker did *not* assign
	// to any kernel code or global variables.
	if (nextfree == 0)
f0109d46:	83 3d 98 c3 11 f0 00 	cmpl   $0x0,0xf011c398
f0109d4d:	75 19                	jne    f0109d68 <_ZL10boot_allocj+0x28>
		nextfree = round_up((char *) end, PGSIZE);
f0109d4f:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f0109d56:	00 
f0109d57:	c7 04 24 20 d0 11 f0 	movl   $0xf011d020,(%esp)
f0109d5e:	e8 c5 1c 00 00       	call   f010ba28 <_Z8round_upIPcET_S1_j>
f0109d63:	a3 98 c3 11 f0       	mov    %eax,0xf011c398
	//
	// LAB 2: Your code here.
	// Hole 'n' bytes memory
	nextfree += n;
	// Align nextfree
	nextfree = round_up (nextfree, PGSIZE);
f0109d68:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f0109d6f:	00 
f0109d70:	8b 45 08             	mov    0x8(%ebp),%eax
f0109d73:	03 05 98 c3 11 f0    	add    0xf011c398,%eax
f0109d79:	89 04 24             	mov    %eax,(%esp)
f0109d7c:	e8 a7 1c 00 00       	call   f010ba28 <_Z8round_upIPcET_S1_j>
f0109d81:	a3 98 c3 11 f0       	mov    %eax,0xf011c398
	// Panic when out of memory
	if((unsigned int) nextfree < (unsigned int) end)
f0109d86:	3d 20 d0 11 f0       	cmp    $0xf011d020,%eax
f0109d8b:	73 1c                	jae    f0109da9 <_ZL10boot_allocj+0x69>
	panic("boot_alloc: out of memory.\n");
f0109d8d:	c7 44 24 08 13 dc 10 	movl   $0xf010dc13,0x8(%esp)
f0109d94:	f0 
f0109d95:	c7 44 24 04 05 01 00 	movl   $0x105,0x4(%esp)
f0109d9c:	00 
f0109d9d:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f0109da4:	e8 b7 f2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	// Return updated pointer points after 'n' bytes
	v = (void *) nextfree;
	return v;
}
f0109da9:	c9                   	leave  
f0109daa:	c3                   	ret    

f0109dab <_ZL11check_va2paPjj>:
// This function returns the physical address of the page containing 'va',
// defined by the page directory 'pgdir'.  The hardware normally performs
// this functionality for us!  We define our own version to help
// the boot_mem_check() function; it shouldn't be used elsewhere.
static physaddr_t
check_va2pa(pde_t *pgdir, uintptr_t va)
f0109dab:	55                   	push   %ebp
f0109dac:	89 e5                	mov    %esp,%ebp
f0109dae:	83 ec 18             	sub    $0x18,%esp
f0109db1:	89 d1                	mov    %edx,%ecx
{
	pte_t *p;

	pgdir = &pgdir[PDX(va)];
	if (!(*pgdir & PTE_P))
f0109db3:	c1 ea 16             	shr    $0x16,%edx
f0109db6:	8b 04 90             	mov    (%eax,%edx,4),%eax
f0109db9:	a8 01                	test   $0x1,%al
f0109dbb:	74 51                	je     f0109e0e <_ZL11check_va2paPjj+0x63>
		return ~0;
	p = (pte_t*) KADDR(PTE_ADDR(*pgdir));
f0109dbd:	89 c2                	mov    %eax,%edx
f0109dbf:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
f0109dc5:	89 d0                	mov    %edx,%eax
f0109dc7:	c1 e8 0c             	shr    $0xc,%eax
f0109dca:	3b 05 40 c3 11 f0    	cmp    0xf011c340,%eax
f0109dd0:	72 20                	jb     f0109df2 <_ZL11check_va2paPjj+0x47>
f0109dd2:	89 54 24 0c          	mov    %edx,0xc(%esp)
f0109dd6:	c7 44 24 08 18 d8 10 	movl   $0xf010d818,0x8(%esp)
f0109ddd:	f0 
f0109dde:	c7 44 24 04 18 01 00 	movl   $0x118,0x4(%esp)
f0109de5:	00 
f0109de6:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f0109ded:	e8 6e f2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	if (!(p[PTX(va)] & PTE_P))
f0109df2:	89 c8                	mov    %ecx,%eax
f0109df4:	c1 e8 0c             	shr    $0xc,%eax
f0109df7:	25 ff 03 00 00       	and    $0x3ff,%eax
f0109dfc:	8b 84 82 00 00 00 f0 	mov    -0x10000000(%edx,%eax,4),%eax
f0109e03:	a8 01                	test   $0x1,%al
f0109e05:	74 07                	je     f0109e0e <_ZL11check_va2paPjj+0x63>
		return ~0;
	return PTE_ADDR(p[PTX(va)]);
f0109e07:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f0109e0c:	eb 05                	jmp    f0109e13 <_ZL11check_va2paPjj+0x68>
f0109e0e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
f0109e13:	c9                   	leave  
f0109e14:	c3                   	ret    

f0109e15 <_ZL14boot_mem_checkv>:
//
// This function doesn't test every corner case,
// and doesn't test the permission bits at all,
// but it is a pretty good sanity check.
static void
boot_mem_check(void)
f0109e15:	55                   	push   %ebp
f0109e16:	89 e5                	mov    %esp,%ebp
f0109e18:	56                   	push   %esi
f0109e19:	53                   	push   %ebx
f0109e1a:	83 ec 10             	sub    $0x10,%esp
f0109e1d:	bb 00 00 00 00       	mov    $0x0,%ebx
{
	uint32_t i, n;

	// check phys mem
	for (i = 0; KERNBASE + i != 0; i += PGSIZE)
		assert(check_va2pa(kern_pgdir, KERNBASE + i) == i);
f0109e22:	8d 93 00 00 00 f0    	lea    -0x10000000(%ebx),%edx
f0109e28:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f0109e2d:	e8 79 ff ff ff       	call   f0109dab <_ZL11check_va2paPjj>
f0109e32:	39 d8                	cmp    %ebx,%eax
f0109e34:	74 24                	je     f0109e5a <_ZL14boot_mem_checkv+0x45>
f0109e36:	c7 44 24 0c 3c d8 10 	movl   $0xf010d83c,0xc(%esp)
f0109e3d:	f0 
f0109e3e:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f0109e45:	f0 
f0109e46:	c7 44 24 04 8f 02 00 	movl   $0x28f,0x4(%esp)
f0109e4d:	00 
f0109e4e:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f0109e55:	e8 06 f2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
boot_mem_check(void)
{
	uint32_t i, n;

	// check phys mem
	for (i = 0; KERNBASE + i != 0; i += PGSIZE)
f0109e5a:	8d 98 00 10 00 00    	lea    0x1000(%eax),%ebx
f0109e60:	81 fb 00 00 00 10    	cmp    $0x10000000,%ebx
f0109e66:	75 ba                	jne    f0109e22 <_ZL14boot_mem_checkv+0xd>
f0109e68:	bb 00 80 ff ef       	mov    $0xefff8000,%ebx
		assert(check_va2pa(kern_pgdir, KERNBASE + i) == i);

	// check kernel stack
	for (i = 0; i < KSTKSIZE; i += PGSIZE)
		assert(check_va2pa(kern_pgdir, KSTACKTOP - KSTKSIZE + i) == PADDR(bootstack) + i);
f0109e6d:	be 00 10 10 f0       	mov    $0xf0101000,%esi
f0109e72:	89 da                	mov    %ebx,%edx
f0109e74:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f0109e79:	e8 2d ff ff ff       	call   f0109dab <_ZL11check_va2paPjj>
f0109e7e:	89 c2                	mov    %eax,%edx
f0109e80:	81 fe ff ff ff ef    	cmp    $0xefffffff,%esi
f0109e86:	77 20                	ja     f0109ea8 <_ZL14boot_mem_checkv+0x93>
f0109e88:	89 74 24 0c          	mov    %esi,0xc(%esp)
f0109e8c:	c7 44 24 08 68 d8 10 	movl   $0xf010d868,0x8(%esp)
f0109e93:	f0 
f0109e94:	c7 44 24 04 93 02 00 	movl   $0x293,0x4(%esp)
f0109e9b:	00 
f0109e9c:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f0109ea3:	e8 b8 f1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f0109ea8:	8d 83 00 90 10 10    	lea    0x10109000(%ebx),%eax
f0109eae:	39 c2                	cmp    %eax,%edx
f0109eb0:	74 24                	je     f0109ed6 <_ZL14boot_mem_checkv+0xc1>
f0109eb2:	c7 44 24 0c 8c d8 10 	movl   $0xf010d88c,0xc(%esp)
f0109eb9:	f0 
f0109eba:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f0109ec1:	f0 
f0109ec2:	c7 44 24 04 93 02 00 	movl   $0x293,0x4(%esp)
f0109ec9:	00 
f0109eca:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f0109ed1:	e8 8a f1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f0109ed6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
	// check phys mem
	for (i = 0; KERNBASE + i != 0; i += PGSIZE)
		assert(check_va2pa(kern_pgdir, KERNBASE + i) == i);

	// check kernel stack
	for (i = 0; i < KSTKSIZE; i += PGSIZE)
f0109edc:	81 fb 00 00 00 f0    	cmp    $0xf0000000,%ebx
f0109ee2:	75 8e                	jne    f0109e72 <_ZL14boot_mem_checkv+0x5d>
		case PDX(KSTACKTOP-1):
			assert(kern_pgdir[i]);
			break;
		default:
			if (i >= PDX(KERNBASE))
				assert(kern_pgdir[i]);
f0109ee4:	8b 0d 44 c3 11 f0    	mov    0xf011c344,%ecx

	// check for zero/non-zero in PDEs
	for (i = 0; i < NPDENTRIES; i++) {
		switch (i) {
		case PDX(KSTACKTOP-1):
			assert(kern_pgdir[i]);
f0109eea:	8d 99 fc 0e 00 00    	lea    0xefc(%ecx),%ebx
f0109ef0:	ba 01 00 00 00       	mov    $0x1,%edx
f0109ef5:	eb 03                	jmp    f0109efa <_ZL14boot_mem_checkv+0xe5>
f0109ef7:	83 c2 01             	add    $0x1,%edx
f0109efa:	8d 42 ff             	lea    -0x1(%edx),%eax
	for (i = 0; i < KSTKSIZE; i += PGSIZE)
		assert(check_va2pa(kern_pgdir, KSTACKTOP - KSTKSIZE + i) == PADDR(bootstack) + i);

	// check for zero/non-zero in PDEs
	for (i = 0; i < NPDENTRIES; i++) {
		switch (i) {
f0109efd:	3d bf 03 00 00       	cmp    $0x3bf,%eax
f0109f02:	75 29                	jne    f0109f2d <_ZL14boot_mem_checkv+0x118>
		case PDX(KSTACKTOP-1):
			assert(kern_pgdir[i]);
f0109f04:	83 3b 00             	cmpl   $0x0,(%ebx)
f0109f07:	75 ee                	jne    f0109ef7 <_ZL14boot_mem_checkv+0xe2>
f0109f09:	c7 44 24 0c 3b dc 10 	movl   $0xf010dc3b,0xc(%esp)
f0109f10:	f0 
f0109f11:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f0109f18:	f0 
f0109f19:	c7 44 24 04 99 02 00 	movl   $0x299,0x4(%esp)
f0109f20:	00 
f0109f21:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f0109f28:	e8 33 f1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
			break;
		default:
			if (i >= PDX(KERNBASE))
f0109f2d:	3d bf 03 00 00       	cmp    $0x3bf,%eax
f0109f32:	76 2b                	jbe    f0109f5f <_ZL14boot_mem_checkv+0x14a>
				assert(kern_pgdir[i]);
f0109f34:	83 7c 91 fc 00       	cmpl   $0x0,-0x4(%ecx,%edx,4)
f0109f39:	75 4f                	jne    f0109f8a <_ZL14boot_mem_checkv+0x175>
f0109f3b:	c7 44 24 0c 3b dc 10 	movl   $0xf010dc3b,0xc(%esp)
f0109f42:	f0 
f0109f43:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f0109f4a:	f0 
f0109f4b:	c7 44 24 04 9d 02 00 	movl   $0x29d,0x4(%esp)
f0109f52:	00 
f0109f53:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f0109f5a:	e8 01 f1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
			else
				assert(kern_pgdir[i] == 0);
f0109f5f:	83 7c 91 fc 00       	cmpl   $0x0,-0x4(%ecx,%edx,4)
f0109f64:	74 24                	je     f0109f8a <_ZL14boot_mem_checkv+0x175>
f0109f66:	c7 44 24 0c 49 dc 10 	movl   $0xf010dc49,0xc(%esp)
f0109f6d:	f0 
f0109f6e:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f0109f75:	f0 
f0109f76:	c7 44 24 04 9f 02 00 	movl   $0x29f,0x4(%esp)
f0109f7d:	00 
f0109f7e:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f0109f85:	e8 d6 f0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	// check kernel stack
	for (i = 0; i < KSTKSIZE; i += PGSIZE)
		assert(check_va2pa(kern_pgdir, KSTACKTOP - KSTKSIZE + i) == PADDR(bootstack) + i);

	// check for zero/non-zero in PDEs
	for (i = 0; i < NPDENTRIES; i++) {
f0109f8a:	81 fa ff 03 00 00    	cmp    $0x3ff,%edx
f0109f90:	0f 86 61 ff ff ff    	jbe    f0109ef7 <_ZL14boot_mem_checkv+0xe2>
				assert(kern_pgdir[i] == 0);
			break;
		}
	}
	
	cprintf("boot_mem_check() succeeded!\n");
f0109f96:	c7 04 24 5c dc 10 f0 	movl   $0xf010dc5c,(%esp)
f0109f9d:	e8 4d 1b 00 00       	call   f010baef <_Z7cprintfPKcz>
}
f0109fa2:	83 c4 10             	add    $0x10,%esp
f0109fa5:	5b                   	pop    %ebx
f0109fa6:	5e                   	pop    %esi
f0109fa7:	5d                   	pop    %ebp
f0109fa8:	c3                   	ret    

f0109fa9 <_ZL10nvram_readi>:
struct Pseudodesc gdt_pd = {
	sizeof(gdt) - 1, (unsigned long) gdt
};

static int
nvram_read(int r)
f0109fa9:	55                   	push   %ebp
f0109faa:	89 e5                	mov    %esp,%ebp
f0109fac:	83 ec 18             	sub    $0x18,%esp
f0109faf:	89 5d f8             	mov    %ebx,-0x8(%ebp)
f0109fb2:	89 75 fc             	mov    %esi,-0x4(%ebp)
f0109fb5:	89 c6                	mov    %eax,%esi
{
	return mc146818_read(r) | (mc146818_read(r + 1) << 8);
f0109fb7:	89 04 24             	mov    %eax,(%esp)
f0109fba:	e8 d5 1a 00 00       	call   f010ba94 <_Z13mc146818_readj>
f0109fbf:	89 c3                	mov    %eax,%ebx
f0109fc1:	8d 46 01             	lea    0x1(%esi),%eax
f0109fc4:	89 04 24             	mov    %eax,(%esp)
f0109fc7:	e8 c8 1a 00 00       	call   f010ba94 <_Z13mc146818_readj>
f0109fcc:	c1 e0 08             	shl    $0x8,%eax
f0109fcf:	09 d8                	or     %ebx,%eax
}
f0109fd1:	8b 5d f8             	mov    -0x8(%ebp),%ebx
f0109fd4:	8b 75 fc             	mov    -0x4(%ebp),%esi
f0109fd7:	89 ec                	mov    %ebp,%esp
f0109fd9:	5d                   	pop    %ebp
f0109fda:	c3                   	ret    

f0109fdb <_Z9page_freeP4Page>:
//
// Software Engineering Hint: It can be extremely useful for later debugging
//   if you erase each page's memory as soon as it is freed.  See the Software
//   Engineering Hint above for reasons why.
void
page_free(struct Page *pp)
f0109fdb:	55                   	push   %ebp
f0109fdc:	89 e5                	mov    %esp,%ebp
f0109fde:	83 ec 18             	sub    $0x18,%esp
f0109fe1:	8b 4d 08             	mov    0x8(%ebp),%ecx
{
	// Fill this function in
	//Only be called when pp_ref reaches 0
	assert(pp->pp_ref == 0);
f0109fe4:	66 83 79 04 00       	cmpw   $0x0,0x4(%ecx)
f0109fe9:	74 24                	je     f010a00f <_Z9page_freeP4Page+0x34>
f0109feb:	c7 44 24 0c 79 dc 10 	movl   $0xf010dc79,0xc(%esp)
f0109ff2:	f0 
f0109ff3:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f0109ffa:	f0 
f0109ffb:	c7 44 24 04 85 01 00 	movl   $0x185,0x4(%esp)
f010a002:	00 
f010a003:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a00a:	e8 51 f0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	//Add free page to link free_pages
	pp->pp_next = free_pages;
f010a00f:	a1 90 c3 11 f0       	mov    0xf011c390,%eax
f010a014:	89 01                	mov    %eax,(%ecx)
	free_pages = pp;
f010a016:	89 0d 90 c3 11 f0    	mov    %ecx,0xf011c390
	uint16_t pp_ref;

#if JOS_KERNEL
	// Returns the physical page number for this page.
	size_t page_number() const {
		assert(this >= pages && this < pages + npages);
f010a01c:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010a022:	39 d1                	cmp    %edx,%ecx
f010a024:	72 0c                	jb     f010a032 <_Z9page_freeP4Page+0x57>
f010a026:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010a02b:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010a02e:	39 c1                	cmp    %eax,%ecx
f010a030:	72 24                	jb     f010a056 <_Z9page_freeP4Page+0x7b>
f010a032:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010a039:	f0 
f010a03a:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a041:	f0 
f010a042:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a049:	00 
f010a04a:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010a051:	e8 0a f0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	//erase page memory
	memset(pp->data(), 0xCD, sizeof(*pp));
f010a056:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
f010a05d:	00 
f010a05e:	c7 44 24 04 cd 00 00 	movl   $0xcd,0x4(%esp)
f010a065:	00 
f010a066:	89 c8                	mov    %ecx,%eax
f010a068:	29 d0                	sub    %edx,%eax
f010a06a:	c1 f8 03             	sar    $0x3,%eax
f010a06d:	05 00 00 0f 00       	add    $0xf0000,%eax
f010a072:	c1 e0 0c             	shl    $0xc,%eax
f010a075:	89 04 24             	mov    %eax,(%esp)
f010a078:	e8 f4 29 00 00       	call   f010ca71 <_Z6memsetPvij>
}
f010a07d:	c9                   	leave  
f010a07e:	c3                   	ret    

f010a07f <_Z11page_decrefP4Page>:

// Decrement the reference count on a page.
// Free it if there are no more refs afterwards.
void
page_decref(struct Page *pp)
f010a07f:	55                   	push   %ebp
f010a080:	89 e5                	mov    %esp,%ebp
f010a082:	83 ec 08             	sub    $0x8,%esp
f010a085:	8b 55 08             	mov    0x8(%ebp),%edx
{
	if (--pp->pp_ref == 0)
f010a088:	0f b7 42 04          	movzwl 0x4(%edx),%eax
f010a08c:	83 e8 01             	sub    $0x1,%eax
f010a08f:	66 89 42 04          	mov    %ax,0x4(%edx)
f010a093:	66 85 c0             	test   %ax,%ax
f010a096:	75 08                	jne    f010a0a0 <_Z11page_decrefP4Page+0x21>
		page_free(pp);
f010a098:	89 14 24             	mov    %edx,(%esp)
f010a09b:	e8 3b ff ff ff       	call   f0109fdb <_Z9page_freeP4Page>
}
f010a0a0:	c9                   	leave  
f010a0a1:	c3                   	ret    

f010a0a2 <_Z10page_allocv>:
//   much preferable to a SLOW crash, where *maybe* a long time after your
//   kernel boots, a data structure gets corrupted because its containing page
//   was used twice!  Note that erasing the page with a non-zero value is
//   usually better than erasing it with 0.  (Why might this be?)
struct Page *
page_alloc()
f010a0a2:	55                   	push   %ebp
f010a0a3:	89 e5                	mov    %esp,%ebp
f010a0a5:	53                   	push   %ebx
f010a0a6:	83 ec 14             	sub    $0x14,%esp
{
	// Fill this function in
	struct Page * alloc_page;
	if (free_pages == NULL)
f010a0a9:	8b 1d 90 c3 11 f0    	mov    0xf011c390,%ebx
f010a0af:	85 db                	test   %ebx,%ebx
f010a0b1:	74 6e                	je     f010a121 <_Z10page_allocv+0x7f>
	return NULL;
	// Get a free page from link free_pages, but no initial
	alloc_page = free_pages;
	// Delete allocted page from link free_pages
	free_pages = free_pages->pp_next;
f010a0b3:	8b 03                	mov    (%ebx),%eax
f010a0b5:	a3 90 c3 11 f0       	mov    %eax,0xf011c390
	alloc_page->pp_next = NULL;
f010a0ba:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
f010a0c0:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010a0c6:	39 d3                	cmp    %edx,%ebx
f010a0c8:	72 0c                	jb     f010a0d6 <_Z10page_allocv+0x34>
f010a0ca:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010a0cf:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010a0d2:	39 c3                	cmp    %eax,%ebx
f010a0d4:	72 24                	jb     f010a0fa <_Z10page_allocv+0x58>
f010a0d6:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010a0dd:	f0 
f010a0de:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a0e5:	f0 
f010a0e6:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a0ed:	00 
f010a0ee:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010a0f5:	e8 66 ef ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	// Erase allocted memory
	memset(alloc_page->data(), 0xCC, sizeof(*alloc_page));
f010a0fa:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
f010a101:	00 
f010a102:	c7 44 24 04 cc 00 00 	movl   $0xcc,0x4(%esp)
f010a109:	00 
f010a10a:	89 d8                	mov    %ebx,%eax
f010a10c:	29 d0                	sub    %edx,%eax
f010a10e:	c1 f8 03             	sar    $0x3,%eax
f010a111:	05 00 00 0f 00       	add    $0xf0000,%eax
f010a116:	c1 e0 0c             	shl    $0xc,%eax
f010a119:	89 04 24             	mov    %eax,(%esp)
f010a11c:	e8 50 29 00 00       	call   f010ca71 <_Z6memsetPvij>
	return alloc_page;
}
f010a121:	89 d8                	mov    %ebx,%eax
f010a123:	83 c4 14             	add    $0x14,%esp
f010a126:	5b                   	pop    %ebx
f010a127:	5d                   	pop    %ebp
f010a128:	c3                   	ret    

f010a129 <_Z10pgdir_walkPjji>:
//    - Otherwise, pgdir_walk returns a pointer into the new page table.
//
// Hint: you can turn a Page * into the physical address of the
// page it refers to with Page::physaddr() from inc/memlayout.h.
pte_t *
pgdir_walk(pde_t *pgdir, uintptr_t va, int create)
f010a129:	55                   	push   %ebp
f010a12a:	89 e5                	mov    %esp,%ebp
f010a12c:	83 ec 28             	sub    $0x28,%esp
f010a12f:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f010a132:	89 75 f8             	mov    %esi,-0x8(%ebp)
f010a135:	89 7d fc             	mov    %edi,-0x4(%ebp)
f010a138:	8b 75 0c             	mov    0xc(%ebp),%esi
{
	// Fill this function in
	struct Page *newpage;
	// If find, return the pointer to the page table entry(PTE)
	if((pgdir[PDX(va)] & PTE_P) != 0)
f010a13b:	89 f0                	mov    %esi,%eax
f010a13d:	c1 e8 16             	shr    $0x16,%eax
f010a140:	c1 e0 02             	shl    $0x2,%eax
f010a143:	8b 5d 08             	mov    0x8(%ebp),%ebx
f010a146:	01 c3                	add    %eax,%ebx
f010a148:	8b 03                	mov    (%ebx),%eax
f010a14a:	a8 01                	test   $0x1,%al
f010a14c:	74 4b                	je     f010a199 <_Z10pgdir_walkPjji+0x70>
	return &(((pte_t *)KADDR(PTE_ADDR(pgdir[PDX(va)])))[PTX(va)]); 
f010a14e:	89 c2                	mov    %eax,%edx
f010a150:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
f010a156:	89 d0                	mov    %edx,%eax
f010a158:	c1 e8 0c             	shr    $0xc,%eax
f010a15b:	3b 05 40 c3 11 f0    	cmp    0xf011c340,%eax
f010a161:	72 20                	jb     f010a183 <_Z10pgdir_walkPjji+0x5a>
f010a163:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010a167:	c7 44 24 08 18 d8 10 	movl   $0xf010d818,0x8(%esp)
f010a16e:	f0 
f010a16f:	c7 44 24 04 a9 01 00 	movl   $0x1a9,0x4(%esp)
f010a176:	00 
f010a177:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a17e:	e8 dd ee ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a183:	89 f0                	mov    %esi,%eax
f010a185:	c1 e8 0a             	shr    $0xa,%eax
f010a188:	25 fc 0f 00 00       	and    $0xffc,%eax
f010a18d:	8d 84 02 00 00 00 f0 	lea    -0x10000000(%edx,%eax,1),%eax
f010a194:	e9 a7 00 00 00       	jmp    f010a240 <_Z10pgdir_walkPjji+0x117>
	// If create == 0, pgdir_walk returns NULL
	else if(create == 0)
f010a199:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
f010a19d:	0f 84 98 00 00 00    	je     f010a23b <_Z10pgdir_walkPjji+0x112>
		return NULL;
	     else
		{
	// Allocate a new page table
		newpage = page_alloc();
f010a1a3:	e8 fa fe ff ff       	call   f010a0a2 <_Z10page_allocv>
f010a1a8:	89 c7                	mov    %eax,%edi
		if(!newpage)
f010a1aa:	85 c0                	test   %eax,%eax
f010a1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010a1b0:	0f 84 85 00 00 00    	je     f010a23b <_Z10pgdir_walkPjji+0x112>
			return NULL;
		newpage->pp_ref++;
f010a1b6:	66 83 40 04 01       	addw   $0x1,0x4(%eax)
		return this - pages;
	}
	
	// Returns a kernel virtual pointer to the corresponding page.
	void *data() const {
		return (void *) (KERNBASE + page_number() * PGSIZE);
f010a1bb:	89 04 24             	mov    %eax,(%esp)
f010a1be:	e8 83 18 00 00       	call   f010ba46 <_ZNK4Page11page_numberEv>
		memset(newpage->data(), 0, PGSIZE);
f010a1c3:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010a1ca:	00 
f010a1cb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010a1d2:	00 
f010a1d3:	05 00 00 0f 00       	add    $0xf0000,%eax
f010a1d8:	c1 e0 0c             	shl    $0xc,%eax
f010a1db:	89 04 24             	mov    %eax,(%esp)
f010a1de:	e8 8e 28 00 00       	call   f010ca71 <_Z6memsetPvij>
	}

	// Returns the physical address for this page.
	physaddr_t physaddr() const {
		return page_number() * PGSIZE;
f010a1e3:	89 3c 24             	mov    %edi,(%esp)
f010a1e6:	e8 5b 18 00 00       	call   f010ba46 <_ZNK4Page11page_numberEv>
		pgdir[PDX(va)] = newpage->physaddr() | PTE_P | PTE_U | PTE_W;
f010a1eb:	c1 e0 0c             	shl    $0xc,%eax
f010a1ee:	83 c8 07             	or     $0x7,%eax
f010a1f1:	89 03                	mov    %eax,(%ebx)
	// Return the new page entry pointer
		return &(((pte_t *)KADDR(PTE_ADDR(pgdir[PDX(va)])))[PTX(va)]);
f010a1f3:	89 c2                	mov    %eax,%edx
f010a1f5:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
f010a1fb:	89 d0                	mov    %edx,%eax
f010a1fd:	c1 e8 0c             	shr    $0xc,%eax
f010a200:	3b 05 40 c3 11 f0    	cmp    0xf011c340,%eax
f010a206:	72 20                	jb     f010a228 <_Z10pgdir_walkPjji+0xff>
f010a208:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010a20c:	c7 44 24 08 18 d8 10 	movl   $0xf010d818,0x8(%esp)
f010a213:	f0 
f010a214:	c7 44 24 04 b7 01 00 	movl   $0x1b7,0x4(%esp)
f010a21b:	00 
f010a21c:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a223:	e8 38 ee ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a228:	89 f0                	mov    %esi,%eax
f010a22a:	c1 e8 0a             	shr    $0xa,%eax
f010a22d:	25 fc 0f 00 00       	and    $0xffc,%eax
f010a232:	8d 84 02 00 00 00 f0 	lea    -0x10000000(%edx,%eax,1),%eax
f010a239:	eb 05                	jmp    f010a240 <_Z10pgdir_walkPjji+0x117>
f010a23b:	b8 00 00 00 00       	mov    $0x0,%eax
		}	
	return NULL;
}
f010a240:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f010a243:	8b 75 f8             	mov    -0x8(%ebp),%esi
f010a246:	8b 7d fc             	mov    -0x4(%ebp),%edi
f010a249:	89 ec                	mov    %ebp,%esp
f010a24b:	5d                   	pop    %ebp
f010a24c:	c3                   	ret    

f010a24d <_Z11page_lookupPjjPS_>:
//
// Returns 0 if there is no page mapped at va.
//
// Hint: the TA solution uses pgdir_walk.
struct Page *
page_lookup(pde_t *pgdir, uintptr_t va, pte_t **pte_store)
f010a24d:	55                   	push   %ebp
f010a24e:	89 e5                	mov    %esp,%ebp
f010a250:	83 ec 18             	sub    $0x18,%esp
{
	// Fill this function in
	// Lookup virtual address 'va' in page direction
	pte_t *ppte = pgdir_walk(pgdir, va, 0);
f010a253:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010a25a:	00 
f010a25b:	8b 45 0c             	mov    0xc(%ebp),%eax
f010a25e:	89 44 24 04          	mov    %eax,0x4(%esp)
f010a262:	8b 45 08             	mov    0x8(%ebp),%eax
f010a265:	89 04 24             	mov    %eax,(%esp)
f010a268:	e8 bc fe ff ff       	call   f010a129 <_Z10pgdir_walkPjji>
	if(ppte == NULL)
f010a26d:	85 c0                	test   %eax,%eax
f010a26f:	74 1f                	je     f010a290 <_Z11page_lookupPjjPS_+0x43>
		return NULL;
	// Set '*pte_store' to the address of the pte
	if(pte_store != NULL)
f010a271:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
f010a275:	74 05                	je     f010a27c <_Z11page_lookupPjjPS_+0x2f>
		(*pte_store) = ppte;
f010a277:	8b 55 10             	mov    0x10(%ebp),%edx
f010a27a:	89 02                	mov    %eax,(%edx)
	// Return the mapped page address
	if(*ppte & PTE_P)
f010a27c:	8b 00                	mov    (%eax),%eax
f010a27e:	a8 01                	test   $0x1,%al
f010a280:	74 0e                	je     f010a290 <_Z11page_lookupPjjPS_+0x43>
		return &pages[PGNUM(*ppte)];
f010a282:	c1 e8 0c             	shr    $0xc,%eax
f010a285:	c1 e0 03             	shl    $0x3,%eax
f010a288:	03 05 48 c3 11 f0    	add    0xf011c348,%eax
f010a28e:	eb 05                	jmp    f010a295 <_Z11page_lookupPjjPS_+0x48>
f010a290:	b8 00 00 00 00       	mov    $0x0,%eax
	return NULL;
}
f010a295:	c9                   	leave  
f010a296:	c3                   	ret    

f010a297 <_Z11page_removePjj>:
//     the pg dir/pg table.
//
// Hint: The TA solution is implemented using page_lookup,
// 	tlb_invalidate, and page_decref.
void
page_remove(pde_t *pgdir, uintptr_t va)
f010a297:	55                   	push   %ebp
f010a298:	89 e5                	mov    %esp,%ebp
f010a29a:	83 ec 28             	sub    $0x28,%esp
f010a29d:	89 5d f8             	mov    %ebx,-0x8(%ebp)
f010a2a0:	89 75 fc             	mov    %esi,-0x4(%ebp)
f010a2a3:	8b 75 08             	mov    0x8(%ebp),%esi
f010a2a6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
	// Fill this function in
	pte_t *ppte;
	// Lookup 'va' to identify if any physical page at that address
	struct Page *page = page_lookup(pgdir, va, &ppte);
f010a2a9:	8d 45 f4             	lea    -0xc(%ebp),%eax
f010a2ac:	89 44 24 08          	mov    %eax,0x8(%esp)
f010a2b0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010a2b4:	89 34 24             	mov    %esi,(%esp)
f010a2b7:	e8 91 ff ff ff       	call   f010a24d <_Z11page_lookupPjjPS_>
	// If no physical page mapped just return
	if(page == NULL)
f010a2bc:	85 c0                	test   %eax,%eax
f010a2be:	74 1d                	je     f010a2dd <_Z11page_removePjj+0x46>
		return;
	// Else decrement the ref count
	page_decref(page);
f010a2c0:	89 04 24             	mov    %eax,(%esp)
f010a2c3:	e8 b7 fd ff ff       	call   f010a07f <_Z11page_decrefP4Page>
	// Set corresponding page table entry (PTE) to 0
	*ppte = 0;
f010a2c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
f010a2cb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	// Invalidated the TLB
	tlb_invalidate(pgdir, va);
f010a2d1:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010a2d5:	89 34 24             	mov    %esi,(%esp)
f010a2d8:	e8 73 f9 ff ff       	call   f0109c50 <_Z14tlb_invalidatePjj>
	return;
}
f010a2dd:	8b 5d f8             	mov    -0x8(%ebp),%ebx
f010a2e0:	8b 75 fc             	mov    -0x4(%ebp),%esi
f010a2e3:	89 ec                	mov    %ebp,%esp
f010a2e5:	5d                   	pop    %ebp
f010a2e6:	c3                   	ret    

f010a2e7 <_ZL16page_map_segmentPjjjji>:
// This function resembles page_insert(), but is meant for use at boot time on
// reserved portions of physical memory.
// There's no need here to manage page reference counts or invalidate the TLB.
static void
page_map_segment(pte_t *pgdir, uintptr_t la, size_t size, physaddr_t pa,
		 int perm)
f010a2e7:	55                   	push   %ebp
f010a2e8:	89 e5                	mov    %esp,%ebp
f010a2ea:	57                   	push   %edi
f010a2eb:	56                   	push   %esi
f010a2ec:	53                   	push   %ebx
f010a2ed:	83 ec 1c             	sub    $0x1c,%esp
f010a2f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
f010a2f3:	89 55 ec             	mov    %edx,-0x14(%ebp)
{
	// LAB 2: Your code here.
	size_t index;
	pte_t *ppte;
	assert((la & (PGSIZE - 1)) == 0 );
f010a2f6:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
f010a2fc:	74 24                	je     f010a322 <_ZL16page_map_segmentPjjjji+0x3b>
f010a2fe:	c7 44 24 0c 89 dc 10 	movl   $0xf010dc89,0xc(%esp)
f010a305:	f0 
f010a306:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a30d:	f0 
f010a30e:	c7 44 24 04 38 02 00 	movl   $0x238,0x4(%esp)
f010a315:	00 
f010a316:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a31d:	e8 3e ed ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	assert((pa & (PGSIZE - 1)) == 0 );
f010a322:	f7 45 08 ff 0f 00 00 	testl  $0xfff,0x8(%ebp)
f010a329:	74 24                	je     f010a34f <_ZL16page_map_segmentPjjjji+0x68>
f010a32b:	c7 44 24 0c a2 dc 10 	movl   $0xf010dca2,0xc(%esp)
f010a332:	f0 
f010a333:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a33a:	f0 
f010a33b:	c7 44 24 04 39 02 00 	movl   $0x239,0x4(%esp)
f010a342:	00 
f010a343:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a34a:	e8 11 ed ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	// Ensure size is a multiple of PGSIZE
	size = round_up(size, PGSIZE);
f010a34f:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010a356:	00 
f010a357:	89 0c 24             	mov    %ecx,(%esp)
f010a35a:	e8 80 16 00 00       	call   f010b9df <_Z8round_upIjET_S0_j>
f010a35f:	89 c7                	mov    %eax,%edi
	// Map linear address to physical
	for(index = 0; index < size; index += PGSIZE)
f010a361:	85 c0                	test   %eax,%eax
f010a363:	74 66                	je     f010a3cb <_ZL16page_map_segmentPjjjji+0xe4>
f010a365:	bb 00 00 00 00       	mov    $0x0,%ebx
	{
		ppte = pgdir_walk(pgdir, (la + index), 1);
		assert(ppte != NULL);
		// Set permission of PTE
		(*ppte) = (pa + index) | perm | PTE_P;
f010a36a:	8b 75 0c             	mov    0xc(%ebp),%esi
f010a36d:	83 ce 01             	or     $0x1,%esi
	// Ensure size is a multiple of PGSIZE
	size = round_up(size, PGSIZE);
	// Map linear address to physical
	for(index = 0; index < size; index += PGSIZE)
	{
		ppte = pgdir_walk(pgdir, (la + index), 1);
f010a370:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
f010a377:	00 
f010a378:	8b 55 ec             	mov    -0x14(%ebp),%edx
f010a37b:	8d 04 13             	lea    (%ebx,%edx,1),%eax
f010a37e:	89 44 24 04          	mov    %eax,0x4(%esp)
f010a382:	8b 4d f0             	mov    -0x10(%ebp),%ecx
f010a385:	89 0c 24             	mov    %ecx,(%esp)
f010a388:	e8 9c fd ff ff       	call   f010a129 <_Z10pgdir_walkPjji>
f010a38d:	89 c2                	mov    %eax,%edx
		assert(ppte != NULL);
f010a38f:	85 c0                	test   %eax,%eax
f010a391:	75 24                	jne    f010a3b7 <_ZL16page_map_segmentPjjjji+0xd0>
f010a393:	c7 44 24 0c bb dc 10 	movl   $0xf010dcbb,0xc(%esp)
f010a39a:	f0 
f010a39b:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a3a2:	f0 
f010a3a3:	c7 44 24 04 40 02 00 	movl   $0x240,0x4(%esp)
f010a3aa:	00 
f010a3ab:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a3b2:	e8 a9 ec ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
		// Set permission of PTE
		(*ppte) = (pa + index) | perm | PTE_P;
f010a3b7:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010a3ba:	8d 04 0b             	lea    (%ebx,%ecx,1),%eax
f010a3bd:	09 f0                	or     %esi,%eax
f010a3bf:	89 02                	mov    %eax,(%edx)
	assert((la & (PGSIZE - 1)) == 0 );
	assert((pa & (PGSIZE - 1)) == 0 );
	// Ensure size is a multiple of PGSIZE
	size = round_up(size, PGSIZE);
	// Map linear address to physical
	for(index = 0; index < size; index += PGSIZE)
f010a3c1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f010a3c7:	39 df                	cmp    %ebx,%edi
f010a3c9:	77 a5                	ja     f010a370 <_ZL16page_map_segmentPjjjji+0x89>
		assert(ppte != NULL);
		// Set permission of PTE
		(*ppte) = (pa + index) | perm | PTE_P;
	}
	return;
}
f010a3cb:	83 c4 1c             	add    $0x1c,%esp
f010a3ce:	5b                   	pop    %ebx
f010a3cf:	5e                   	pop    %esi
f010a3d0:	5f                   	pop    %edi
f010a3d1:	5d                   	pop    %ebp
f010a3d2:	c3                   	ret    

f010a3d3 <_Z11page_insertPjP4Pageji>:
//   -E_NO_MEM, if page table couldn't be allocated
//
// Hint: The TA solution is implemented using pgdir_walk, page_remove,
// and Page::physaddr.
int
page_insert(pde_t *pgdir, struct Page *pp, uintptr_t va, int perm) 
f010a3d3:	55                   	push   %ebp
f010a3d4:	89 e5                	mov    %esp,%ebp
f010a3d6:	83 ec 28             	sub    $0x28,%esp
f010a3d9:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f010a3dc:	89 75 f8             	mov    %esi,-0x8(%ebp)
f010a3df:	89 7d fc             	mov    %edi,-0x4(%ebp)
f010a3e2:	8b 75 0c             	mov    0xc(%ebp),%esi
f010a3e5:	8b 7d 10             	mov    0x10(%ebp),%edi
{
	// Fill this function in
	pte_t *ppte = pgdir_walk(pgdir, va, 1);
f010a3e8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
f010a3ef:	00 
f010a3f0:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010a3f4:	8b 45 08             	mov    0x8(%ebp),%eax
f010a3f7:	89 04 24             	mov    %eax,(%esp)
f010a3fa:	e8 2a fd ff ff       	call   f010a129 <_Z10pgdir_walkPjji>
f010a3ff:	89 c3                	mov    %eax,%ebx
	// Allocate page failed
	if(ppte == NULL)
f010a401:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
f010a406:	85 db                	test   %ebx,%ebx
f010a408:	0f 84 d2 00 00 00    	je     f010a4e0 <_Z11page_insertPjP4Pageji+0x10d>
		return -E_NO_MEM;
	if(((*ppte) & PTE_P) != 0)
f010a40e:	8b 13                	mov    (%ebx),%edx
f010a410:	f6 c2 01             	test   $0x1,%dl
f010a413:	74 64                	je     f010a479 <_Z11page_insertPjP4Pageji+0xa6>
	uint16_t pp_ref;

#if JOS_KERNEL
	// Returns the physical page number for this page.
	size_t page_number() const {
		assert(this >= pages && this < pages + npages);
f010a415:	8b 0d 48 c3 11 f0    	mov    0xf011c348,%ecx
f010a41b:	39 ce                	cmp    %ecx,%esi
f010a41d:	72 0c                	jb     f010a42b <_Z11page_insertPjP4Pageji+0x58>
f010a41f:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010a424:	8d 04 c1             	lea    (%ecx,%eax,8),%eax
f010a427:	39 c6                	cmp    %eax,%esi
f010a429:	72 24                	jb     f010a44f <_Z11page_insertPjP4Pageji+0x7c>
f010a42b:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010a432:	f0 
f010a433:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a43a:	f0 
f010a43b:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a442:	00 
f010a443:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010a44a:	e8 11 ec ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	{
		// Already page mapped, need be removed
		if(PTE_ADDR(*ppte) != pp->physaddr())
f010a44f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
f010a455:	89 f0                	mov    %esi,%eax
f010a457:	29 c8                	sub    %ecx,%eax
f010a459:	c1 f8 03             	sar    $0x3,%eax
f010a45c:	c1 e0 0c             	shl    $0xc,%eax
f010a45f:	39 c2                	cmp    %eax,%edx
f010a461:	74 11                	je     f010a474 <_Z11page_insertPjP4Pageji+0xa1>
		page_remove(pgdir, va);
f010a463:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010a467:	8b 45 08             	mov    0x8(%ebp),%eax
f010a46a:	89 04 24             	mov    %eax,(%esp)
f010a46d:	e8 25 fe ff ff       	call   f010a297 <_Z11page_removePjj>
f010a472:	eb 05                	jmp    f010a479 <_Z11page_insertPjP4Pageji+0xa6>
		else
		pp->pp_ref--;
f010a474:	66 83 6e 04 01       	subw   $0x1,0x4(%esi)
f010a479:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010a47f:	39 d6                	cmp    %edx,%esi
f010a481:	72 0c                	jb     f010a48f <_Z11page_insertPjP4Pageji+0xbc>
f010a483:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010a488:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010a48b:	39 c6                	cmp    %eax,%esi
f010a48d:	72 24                	jb     f010a4b3 <_Z11page_insertPjP4Pageji+0xe0>
f010a48f:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010a496:	f0 
f010a497:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a49e:	f0 
f010a49f:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a4a6:	00 
f010a4a7:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010a4ae:	e8 ad eb ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	}
	// Set permissions
	*ppte = pp->physaddr() | perm | PTE_P;
f010a4b3:	8b 4d 14             	mov    0x14(%ebp),%ecx
f010a4b6:	83 c9 01             	or     $0x1,%ecx
f010a4b9:	89 f0                	mov    %esi,%eax
f010a4bb:	29 d0                	sub    %edx,%eax
f010a4bd:	c1 f8 03             	sar    $0x3,%eax
f010a4c0:	c1 e0 0c             	shl    $0xc,%eax
f010a4c3:	09 c8                	or     %ecx,%eax
f010a4c5:	89 03                	mov    %eax,(%ebx)
	pp->pp_ref++;
f010a4c7:	66 83 46 04 01       	addw   $0x1,0x4(%esi)
	// invalidate TLB of former page at 'va'
	tlb_invalidate(pgdir, va);
f010a4cc:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010a4d0:	8b 45 08             	mov    0x8(%ebp),%eax
f010a4d3:	89 04 24             	mov    %eax,(%esp)
f010a4d6:	e8 75 f7 ff ff       	call   f0109c50 <_Z14tlb_invalidatePjj>
f010a4db:	b8 00 00 00 00       	mov    $0x0,%eax
	return 0;
}
f010a4e0:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f010a4e3:	8b 75 f8             	mov    -0x8(%ebp),%esi
f010a4e6:	8b 7d fc             	mov    -0x4(%ebp),%edi
f010a4e9:	89 ec                	mov    %ebp,%esp
f010a4eb:	5d                   	pop    %ebp
f010a4ec:	c3                   	ret    

f010a4ed <_Z8mem_initv>:
f010a4ed:	55                   	push   %ebp
f010a4ee:	89 e5                	mov    %esp,%ebp
f010a4f0:	57                   	push   %edi
f010a4f1:	56                   	push   %esi
f010a4f2:	53                   	push   %ebx
f010a4f3:	83 ec 3c             	sub    $0x3c,%esp
f010a4f6:	b8 15 00 00 00       	mov    $0x15,%eax
f010a4fb:	e8 a9 fa ff ff       	call   f0109fa9 <_ZL10nvram_readi>
f010a500:	c1 e0 0a             	shl    $0xa,%eax
f010a503:	89 c2                	mov    %eax,%edx
f010a505:	c1 fa 1f             	sar    $0x1f,%edx
f010a508:	c1 ea 14             	shr    $0x14,%edx
f010a50b:	01 c2                	add    %eax,%edx
f010a50d:	c1 fa 0c             	sar    $0xc,%edx
f010a510:	89 15 94 c3 11 f0    	mov    %edx,0xf011c394
f010a516:	b8 17 00 00 00       	mov    $0x17,%eax
f010a51b:	e8 89 fa ff ff       	call   f0109fa9 <_ZL10nvram_readi>
f010a520:	c1 e0 0a             	shl    $0xa,%eax
f010a523:	89 c2                	mov    %eax,%edx
f010a525:	c1 fa 1f             	sar    $0x1f,%edx
f010a528:	c1 ea 14             	shr    $0x14,%edx
f010a52b:	01 c2                	add    %eax,%edx
f010a52d:	89 d3                	mov    %edx,%ebx
f010a52f:	c1 fb 0c             	sar    $0xc,%ebx
f010a532:	85 db                	test   %ebx,%ebx
f010a534:	74 0d                	je     f010a543 <_Z8mem_initv+0x56>
f010a536:	8d 83 00 01 00 00    	lea    0x100(%ebx),%eax
f010a53c:	a3 40 c3 11 f0       	mov    %eax,0xf011c340
f010a541:	eb 0a                	jmp    f010a54d <_Z8mem_initv+0x60>
f010a543:	a1 94 c3 11 f0       	mov    0xf011c394,%eax
f010a548:	a3 40 c3 11 f0       	mov    %eax,0xf011c340
f010a54d:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010a552:	c1 e0 0c             	shl    $0xc,%eax
f010a555:	c1 e8 0a             	shr    $0xa,%eax
f010a558:	89 44 24 04          	mov    %eax,0x4(%esp)
f010a55c:	c7 04 24 d8 d8 10 f0 	movl   $0xf010d8d8,(%esp)
f010a563:	e8 87 15 00 00       	call   f010baef <_Z7cprintfPKcz>
f010a568:	89 d8                	mov    %ebx,%eax
f010a56a:	c1 e0 0c             	shl    $0xc,%eax
f010a56d:	c1 e8 0a             	shr    $0xa,%eax
f010a570:	89 44 24 08          	mov    %eax,0x8(%esp)
f010a574:	a1 94 c3 11 f0       	mov    0xf011c394,%eax
f010a579:	c1 e0 0c             	shl    $0xc,%eax
f010a57c:	c1 e8 0a             	shr    $0xa,%eax
f010a57f:	89 44 24 04          	mov    %eax,0x4(%esp)
f010a583:	c7 04 24 c8 dc 10 f0 	movl   $0xf010dcc8,(%esp)
f010a58a:	e8 60 15 00 00       	call   f010baef <_Z7cprintfPKcz>
f010a58f:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010a594:	c1 e0 03             	shl    $0x3,%eax
f010a597:	89 04 24             	mov    %eax,(%esp)
f010a59a:	e8 a1 f7 ff ff       	call   f0109d40 <_ZL10boot_allocj>
f010a59f:	a3 48 c3 11 f0       	mov    %eax,0xf011c348
f010a5a4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f010a5ab:	e8 90 f7 ff ff       	call   f0109d40 <_ZL10boot_allocj>
f010a5b0:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010a5b5:	77 20                	ja     f010a5d7 <_Z8mem_initv+0xea>
f010a5b7:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010a5bb:	c7 44 24 08 68 d8 10 	movl   $0xf010d868,0x8(%esp)
f010a5c2:	f0 
f010a5c3:	c7 44 24 04 42 01 00 	movl   $0x142,0x4(%esp)
f010a5ca:	00 
f010a5cb:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a5d2:	e8 89 ea ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a5d7:	05 00 00 00 10       	add    $0x10000000,%eax
f010a5dc:	c1 e8 0c             	shr    $0xc,%eax
f010a5df:	8d 70 01             	lea    0x1(%eax),%esi
f010a5e2:	83 3d 40 c3 11 f0 00 	cmpl   $0x0,0xf011c340
f010a5e9:	74 6a                	je     f010a655 <_Z8mem_initv+0x168>
f010a5eb:	b9 00 00 00 00       	mov    $0x0,%ecx
f010a5f0:	bb 00 00 00 00       	mov    $0x0,%ebx
f010a5f5:	85 c9                	test   %ecx,%ecx
f010a5f7:	75 0d                	jne    f010a606 <_Z8mem_initv+0x119>
f010a5f9:	a1 48 c3 11 f0       	mov    0xf011c348,%eax
f010a5fe:	66 c7 40 04 01 00    	movw   $0x1,0x4(%eax)
f010a604:	eb 41                	jmp    f010a647 <_Z8mem_initv+0x15a>
f010a606:	81 f9 9f 00 00 00    	cmp    $0x9f,%ecx
f010a60c:	76 12                	jbe    f010a620 <_Z8mem_initv+0x133>
f010a60e:	39 ce                	cmp    %ecx,%esi
f010a610:	76 0e                	jbe    f010a620 <_Z8mem_initv+0x133>
f010a612:	a1 48 c3 11 f0       	mov    0xf011c348,%eax
f010a617:	66 c7 44 18 04 01 00 	movw   $0x1,0x4(%eax,%ebx,1)
f010a61e:	eb 27                	jmp    f010a647 <_Z8mem_initv+0x15a>
f010a620:	a1 48 c3 11 f0       	mov    0xf011c348,%eax
f010a625:	66 c7 44 18 04 00 00 	movw   $0x0,0x4(%eax,%ebx,1)
f010a62c:	8b 15 90 c3 11 f0    	mov    0xf011c390,%edx
f010a632:	a1 48 c3 11 f0       	mov    0xf011c348,%eax
f010a637:	89 14 18             	mov    %edx,(%eax,%ebx,1)
f010a63a:	89 d8                	mov    %ebx,%eax
f010a63c:	03 05 48 c3 11 f0    	add    0xf011c348,%eax
f010a642:	a3 90 c3 11 f0       	mov    %eax,0xf011c390
f010a647:	83 c1 01             	add    $0x1,%ecx
f010a64a:	83 c3 08             	add    $0x8,%ebx
f010a64d:	3b 0d 40 c3 11 f0    	cmp    0xf011c340,%ecx
f010a653:	72 a0                	jb     f010a5f5 <_Z8mem_initv+0x108>
f010a655:	8b 1d 90 c3 11 f0    	mov    0xf011c390,%ebx
f010a65b:	85 db                	test   %ebx,%ebx
f010a65d:	74 7f                	je     f010a6de <_Z8mem_initv+0x1f1>
f010a65f:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010a665:	39 d3                	cmp    %edx,%ebx
f010a667:	72 24                	jb     f010a68d <_Z8mem_initv+0x1a0>
f010a669:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010a66e:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010a671:	39 c3                	cmp    %eax,%ebx
f010a673:	73 18                	jae    f010a68d <_Z8mem_initv+0x1a0>
f010a675:	eb 3a                	jmp    f010a6b1 <_Z8mem_initv+0x1c4>
f010a677:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010a67d:	39 d3                	cmp    %edx,%ebx
f010a67f:	72 0c                	jb     f010a68d <_Z8mem_initv+0x1a0>
f010a681:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010a686:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010a689:	39 c3                	cmp    %eax,%ebx
f010a68b:	72 24                	jb     f010a6b1 <_Z8mem_initv+0x1c4>
f010a68d:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010a694:	f0 
f010a695:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a69c:	f0 
f010a69d:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a6a4:	00 
f010a6a5:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010a6ac:	e8 af e9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a6b1:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
f010a6b8:	00 
f010a6b9:	c7 44 24 04 97 00 00 	movl   $0x97,0x4(%esp)
f010a6c0:	00 
f010a6c1:	89 d8                	mov    %ebx,%eax
f010a6c3:	29 d0                	sub    %edx,%eax
f010a6c5:	c1 f8 03             	sar    $0x3,%eax
f010a6c8:	05 00 00 0f 00       	add    $0xf0000,%eax
f010a6cd:	c1 e0 0c             	shl    $0xc,%eax
f010a6d0:	89 04 24             	mov    %eax,(%esp)
f010a6d3:	e8 99 23 00 00       	call   f010ca71 <_Z6memsetPvij>
f010a6d8:	8b 1b                	mov    (%ebx),%ebx
f010a6da:	85 db                	test   %ebx,%ebx
f010a6dc:	75 99                	jne    f010a677 <_Z8mem_initv+0x18a>
f010a6de:	e8 bf f9 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010a6e3:	89 c3                	mov    %eax,%ebx
f010a6e5:	e8 b8 f9 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010a6ea:	89 c6                	mov    %eax,%esi
f010a6ec:	e8 b1 f9 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010a6f1:	89 c7                	mov    %eax,%edi
f010a6f3:	85 db                	test   %ebx,%ebx
f010a6f5:	75 24                	jne    f010a71b <_Z8mem_initv+0x22e>
f010a6f7:	c7 44 24 0c f2 dc 10 	movl   $0xf010dcf2,0xc(%esp)
f010a6fe:	f0 
f010a6ff:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a706:	f0 
f010a707:	c7 44 24 04 5b 02 00 	movl   $0x25b,0x4(%esp)
f010a70e:	00 
f010a70f:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a716:	e8 45 e9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a71b:	85 f6                	test   %esi,%esi
f010a71d:	74 04                	je     f010a723 <_Z8mem_initv+0x236>
f010a71f:	39 f3                	cmp    %esi,%ebx
f010a721:	75 24                	jne    f010a747 <_Z8mem_initv+0x25a>
f010a723:	c7 44 24 0c e4 dc 10 	movl   $0xf010dce4,0xc(%esp)
f010a72a:	f0 
f010a72b:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a732:	f0 
f010a733:	c7 44 24 04 5c 02 00 	movl   $0x25c,0x4(%esp)
f010a73a:	00 
f010a73b:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a742:	e8 19 e9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a747:	85 c0                	test   %eax,%eax
f010a749:	74 0f                	je     f010a75a <_Z8mem_initv+0x26d>
f010a74b:	39 c6                	cmp    %eax,%esi
f010a74d:	74 0b                	je     f010a75a <_Z8mem_initv+0x26d>
f010a74f:	39 c3                	cmp    %eax,%ebx
f010a751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f010a758:	75 24                	jne    f010a77e <_Z8mem_initv+0x291>
f010a75a:	c7 44 24 0c fc d8 10 	movl   $0xf010d8fc,0xc(%esp)
f010a761:	f0 
f010a762:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a769:	f0 
f010a76a:	c7 44 24 04 5d 02 00 	movl   $0x25d,0x4(%esp)
f010a771:	00 
f010a772:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a779:	e8 e2 e8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a77e:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010a784:	39 d3                	cmp    %edx,%ebx
f010a786:	72 0f                	jb     f010a797 <_Z8mem_initv+0x2aa>
f010a788:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010a78d:	89 45 cc             	mov    %eax,-0x34(%ebp)
f010a790:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
f010a793:	39 cb                	cmp    %ecx,%ebx
f010a795:	72 24                	jb     f010a7bb <_Z8mem_initv+0x2ce>
f010a797:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010a79e:	f0 
f010a79f:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a7a6:	f0 
f010a7a7:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a7ae:	00 
f010a7af:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010a7b6:	e8 a5 e8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a7bb:	89 55 d0             	mov    %edx,-0x30(%ebp)
f010a7be:	89 d8                	mov    %ebx,%eax
f010a7c0:	29 d0                	sub    %edx,%eax
f010a7c2:	c1 f8 03             	sar    $0x3,%eax
f010a7c5:	39 45 cc             	cmp    %eax,-0x34(%ebp)
f010a7c8:	77 24                	ja     f010a7ee <_Z8mem_initv+0x301>
f010a7ca:	c7 44 24 0c f6 dc 10 	movl   $0xf010dcf6,0xc(%esp)
f010a7d1:	f0 
f010a7d2:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a7d9:	f0 
f010a7da:	c7 44 24 04 5e 02 00 	movl   $0x25e,0x4(%esp)
f010a7e1:	00 
f010a7e2:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a7e9:	e8 72 e8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a7ee:	39 d6                	cmp    %edx,%esi
f010a7f0:	72 04                	jb     f010a7f6 <_Z8mem_initv+0x309>
f010a7f2:	39 ce                	cmp    %ecx,%esi
f010a7f4:	72 24                	jb     f010a81a <_Z8mem_initv+0x32d>
f010a7f6:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010a7fd:	f0 
f010a7fe:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a805:	f0 
f010a806:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a80d:	00 
f010a80e:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010a815:	e8 46 e8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a81a:	89 f0                	mov    %esi,%eax
f010a81c:	2b 45 d0             	sub    -0x30(%ebp),%eax
f010a81f:	c1 f8 03             	sar    $0x3,%eax
f010a822:	39 45 cc             	cmp    %eax,-0x34(%ebp)
f010a825:	77 24                	ja     f010a84b <_Z8mem_initv+0x35e>
f010a827:	c7 44 24 0c 12 dd 10 	movl   $0xf010dd12,0xc(%esp)
f010a82e:	f0 
f010a82f:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a836:	f0 
f010a837:	c7 44 24 04 5f 02 00 	movl   $0x25f,0x4(%esp)
f010a83e:	00 
f010a83f:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a846:	e8 15 e8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a84b:	39 d7                	cmp    %edx,%edi
f010a84d:	72 04                	jb     f010a853 <_Z8mem_initv+0x366>
f010a84f:	39 cf                	cmp    %ecx,%edi
f010a851:	72 24                	jb     f010a877 <_Z8mem_initv+0x38a>
f010a853:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010a85a:	f0 
f010a85b:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a862:	f0 
f010a863:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a86a:	00 
f010a86b:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010a872:	e8 e9 e7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a877:	89 f8                	mov    %edi,%eax
f010a879:	2b 45 d0             	sub    -0x30(%ebp),%eax
f010a87c:	c1 f8 03             	sar    $0x3,%eax
f010a87f:	39 45 cc             	cmp    %eax,-0x34(%ebp)
f010a882:	77 24                	ja     f010a8a8 <_Z8mem_initv+0x3bb>
f010a884:	c7 44 24 0c 2e dd 10 	movl   $0xf010dd2e,0xc(%esp)
f010a88b:	f0 
f010a88c:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a893:	f0 
f010a894:	c7 44 24 04 60 02 00 	movl   $0x260,0x4(%esp)
f010a89b:	00 
f010a89c:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a8a3:	e8 b8 e7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a8a8:	a1 90 c3 11 f0       	mov    0xf011c390,%eax
f010a8ad:	89 45 c8             	mov    %eax,-0x38(%ebp)
f010a8b0:	c7 05 90 c3 11 f0 00 	movl   $0x0,0xf011c390
f010a8b7:	00 00 00 
f010a8ba:	e8 e3 f7 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010a8bf:	85 c0                	test   %eax,%eax
f010a8c1:	74 24                	je     f010a8e7 <_Z8mem_initv+0x3fa>
f010a8c3:	c7 44 24 0c 4a dd 10 	movl   $0xf010dd4a,0xc(%esp)
f010a8ca:	f0 
f010a8cb:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a8d2:	f0 
f010a8d3:	c7 44 24 04 68 02 00 	movl   $0x268,0x4(%esp)
f010a8da:	00 
f010a8db:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a8e2:	e8 79 e7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a8e7:	89 1c 24             	mov    %ebx,(%esp)
f010a8ea:	e8 ec f6 ff ff       	call   f0109fdb <_Z9page_freeP4Page>
f010a8ef:	89 34 24             	mov    %esi,(%esp)
f010a8f2:	e8 e4 f6 ff ff       	call   f0109fdb <_Z9page_freeP4Page>
f010a8f7:	89 3c 24             	mov    %edi,(%esp)
f010a8fa:	e8 dc f6 ff ff       	call   f0109fdb <_Z9page_freeP4Page>
f010a8ff:	e8 9e f7 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010a904:	89 c7                	mov    %eax,%edi
f010a906:	e8 97 f7 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010a90b:	89 c6                	mov    %eax,%esi
f010a90d:	e8 90 f7 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010a912:	89 c3                	mov    %eax,%ebx
f010a914:	85 ff                	test   %edi,%edi
f010a916:	75 24                	jne    f010a93c <_Z8mem_initv+0x44f>
f010a918:	c7 44 24 0c f2 dc 10 	movl   $0xf010dcf2,0xc(%esp)
f010a91f:	f0 
f010a920:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a927:	f0 
f010a928:	c7 44 24 04 71 02 00 	movl   $0x271,0x4(%esp)
f010a92f:	00 
f010a930:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a937:	e8 24 e7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a93c:	85 f6                	test   %esi,%esi
f010a93e:	74 04                	je     f010a944 <_Z8mem_initv+0x457>
f010a940:	39 f7                	cmp    %esi,%edi
f010a942:	75 24                	jne    f010a968 <_Z8mem_initv+0x47b>
f010a944:	c7 44 24 0c e4 dc 10 	movl   $0xf010dce4,0xc(%esp)
f010a94b:	f0 
f010a94c:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a953:	f0 
f010a954:	c7 44 24 04 72 02 00 	movl   $0x272,0x4(%esp)
f010a95b:	00 
f010a95c:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a963:	e8 f8 e6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a968:	85 c0                	test   %eax,%eax
f010a96a:	74 0e                	je     f010a97a <_Z8mem_initv+0x48d>
f010a96c:	39 c6                	cmp    %eax,%esi
f010a96e:	74 0a                	je     f010a97a <_Z8mem_initv+0x48d>
f010a970:	39 c7                	cmp    %eax,%edi
f010a972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010a978:	75 24                	jne    f010a99e <_Z8mem_initv+0x4b1>
f010a97a:	c7 44 24 0c fc d8 10 	movl   $0xf010d8fc,0xc(%esp)
f010a981:	f0 
f010a982:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a989:	f0 
f010a98a:	c7 44 24 04 73 02 00 	movl   $0x273,0x4(%esp)
f010a991:	00 
f010a992:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a999:	e8 c2 e6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a99e:	e8 ff f6 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010a9a3:	85 c0                	test   %eax,%eax
f010a9a5:	74 24                	je     f010a9cb <_Z8mem_initv+0x4de>
f010a9a7:	c7 44 24 0c 4a dd 10 	movl   $0xf010dd4a,0xc(%esp)
f010a9ae:	f0 
f010a9af:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010a9b6:	f0 
f010a9b7:	c7 44 24 04 75 02 00 	movl   $0x275,0x4(%esp)
f010a9be:	00 
f010a9bf:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010a9c6:	e8 95 e6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a9cb:	8b 45 c8             	mov    -0x38(%ebp),%eax
f010a9ce:	a3 90 c3 11 f0       	mov    %eax,0xf011c390
f010a9d3:	89 3c 24             	mov    %edi,(%esp)
f010a9d6:	e8 00 f6 ff ff       	call   f0109fdb <_Z9page_freeP4Page>
f010a9db:	89 34 24             	mov    %esi,(%esp)
f010a9de:	e8 f8 f5 ff ff       	call   f0109fdb <_Z9page_freeP4Page>
f010a9e3:	89 1c 24             	mov    %ebx,(%esp)
f010a9e6:	e8 f0 f5 ff ff       	call   f0109fdb <_Z9page_freeP4Page>
f010a9eb:	c7 04 24 1c d9 10 f0 	movl   $0xf010d91c,(%esp)
f010a9f2:	e8 f8 10 00 00       	call   f010baef <_Z7cprintfPKcz>
f010a9f7:	e8 a6 f6 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010a9fc:	89 c2                	mov    %eax,%edx
f010a9fe:	66 83 40 04 01       	addw   $0x1,0x4(%eax)
f010aa03:	8b 0d 48 c3 11 f0    	mov    0xf011c348,%ecx
f010aa09:	39 c8                	cmp    %ecx,%eax
f010aa0b:	72 0c                	jb     f010aa19 <_Z8mem_initv+0x52c>
f010aa0d:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010aa12:	8d 04 c1             	lea    (%ecx,%eax,8),%eax
f010aa15:	39 c2                	cmp    %eax,%edx
f010aa17:	72 24                	jb     f010aa3d <_Z8mem_initv+0x550>
f010aa19:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010aa20:	f0 
f010aa21:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010aa28:	f0 
f010aa29:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010aa30:	00 
f010aa31:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010aa38:	e8 23 e6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aa3d:	89 d0                	mov    %edx,%eax
f010aa3f:	29 c8                	sub    %ecx,%eax
f010aa41:	c1 f8 03             	sar    $0x3,%eax
f010aa44:	05 00 00 0f 00       	add    $0xf0000,%eax
f010aa49:	c1 e0 0c             	shl    $0xc,%eax
f010aa4c:	a3 44 c3 11 f0       	mov    %eax,0xf011c344
f010aa51:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010aa58:	00 
f010aa59:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010aa60:	00 
f010aa61:	89 04 24             	mov    %eax,(%esp)
f010aa64:	e8 08 20 00 00       	call   f010ca71 <_Z6memsetPvij>
f010aa69:	e8 34 f6 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010aa6e:	89 c6                	mov    %eax,%esi
f010aa70:	e8 2d f6 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010aa75:	89 c7                	mov    %eax,%edi
f010aa77:	e8 26 f6 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010aa7c:	89 45 d8             	mov    %eax,-0x28(%ebp)
f010aa7f:	85 f6                	test   %esi,%esi
f010aa81:	75 24                	jne    f010aaa7 <_Z8mem_initv+0x5ba>
f010aa83:	c7 44 24 0c f2 dc 10 	movl   $0xf010dcf2,0xc(%esp)
f010aa8a:	f0 
f010aa8b:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010aa92:	f0 
f010aa93:	c7 44 24 04 b2 02 00 	movl   $0x2b2,0x4(%esp)
f010aa9a:	00 
f010aa9b:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010aaa2:	e8 b9 e5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aaa7:	85 ff                	test   %edi,%edi
f010aaa9:	74 04                	je     f010aaaf <_Z8mem_initv+0x5c2>
f010aaab:	39 fe                	cmp    %edi,%esi
f010aaad:	75 24                	jne    f010aad3 <_Z8mem_initv+0x5e6>
f010aaaf:	c7 44 24 0c e4 dc 10 	movl   $0xf010dce4,0xc(%esp)
f010aab6:	f0 
f010aab7:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010aabe:	f0 
f010aabf:	c7 44 24 04 b3 02 00 	movl   $0x2b3,0x4(%esp)
f010aac6:	00 
f010aac7:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010aace:	e8 8d e5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aad3:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
f010aad7:	74 11                	je     f010aaea <_Z8mem_initv+0x5fd>
f010aad9:	3b 7d d8             	cmp    -0x28(%ebp),%edi
f010aadc:	74 0c                	je     f010aaea <_Z8mem_initv+0x5fd>
f010aade:	3b 75 d8             	cmp    -0x28(%ebp),%esi
f010aae1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f010aae8:	75 24                	jne    f010ab0e <_Z8mem_initv+0x621>
f010aaea:	c7 44 24 0c fc d8 10 	movl   $0xf010d8fc,0xc(%esp)
f010aaf1:	f0 
f010aaf2:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010aaf9:	f0 
f010aafa:	c7 44 24 04 b4 02 00 	movl   $0x2b4,0x4(%esp)
f010ab01:	00 
f010ab02:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010ab09:	e8 52 e5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ab0e:	a1 90 c3 11 f0       	mov    0xf011c390,%eax
f010ab13:	89 45 d4             	mov    %eax,-0x2c(%ebp)
f010ab16:	c7 05 90 c3 11 f0 00 	movl   $0x0,0xf011c390
f010ab1d:	00 00 00 
f010ab20:	e8 7d f5 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010ab25:	85 c0                	test   %eax,%eax
f010ab27:	74 24                	je     f010ab4d <_Z8mem_initv+0x660>
f010ab29:	c7 44 24 0c 4a dd 10 	movl   $0xf010dd4a,0xc(%esp)
f010ab30:	f0 
f010ab31:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010ab38:	f0 
f010ab39:	c7 44 24 04 bc 02 00 	movl   $0x2bc,0x4(%esp)
f010ab40:	00 
f010ab41:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010ab48:	e8 13 e5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ab4d:	8d 45 f0             	lea    -0x10(%ebp),%eax
f010ab50:	89 44 24 08          	mov    %eax,0x8(%esp)
f010ab54:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010ab5b:	00 
f010ab5c:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010ab61:	89 04 24             	mov    %eax,(%esp)
f010ab64:	e8 e4 f6 ff ff       	call   f010a24d <_Z11page_lookupPjjPS_>
f010ab69:	85 c0                	test   %eax,%eax
f010ab6b:	74 24                	je     f010ab91 <_Z8mem_initv+0x6a4>
f010ab6d:	c7 44 24 0c 3c d9 10 	movl   $0xf010d93c,0xc(%esp)
f010ab74:	f0 
f010ab75:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010ab7c:	f0 
f010ab7d:	c7 44 24 04 bf 02 00 	movl   $0x2bf,0x4(%esp)
f010ab84:	00 
f010ab85:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010ab8c:	e8 cf e4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ab91:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010ab98:	00 
f010ab99:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010aba0:	00 
f010aba1:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010aba5:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010abaa:	89 04 24             	mov    %eax,(%esp)
f010abad:	e8 21 f8 ff ff       	call   f010a3d3 <_Z11page_insertPjP4Pageji>
f010abb2:	85 c0                	test   %eax,%eax
f010abb4:	78 24                	js     f010abda <_Z8mem_initv+0x6ed>
f010abb6:	c7 44 24 0c 68 d9 10 	movl   $0xf010d968,0xc(%esp)
f010abbd:	f0 
f010abbe:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010abc5:	f0 
f010abc6:	c7 44 24 04 c2 02 00 	movl   $0x2c2,0x4(%esp)
f010abcd:	00 
f010abce:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010abd5:	e8 86 e4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010abda:	89 34 24             	mov    %esi,(%esp)
f010abdd:	e8 f9 f3 ff ff       	call   f0109fdb <_Z9page_freeP4Page>
f010abe2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010abe9:	00 
f010abea:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010abf1:	00 
f010abf2:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010abf6:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010abfb:	89 04 24             	mov    %eax,(%esp)
f010abfe:	e8 d0 f7 ff ff       	call   f010a3d3 <_Z11page_insertPjP4Pageji>
f010ac03:	85 c0                	test   %eax,%eax
f010ac05:	74 24                	je     f010ac2b <_Z8mem_initv+0x73e>
f010ac07:	c7 44 24 0c 90 d9 10 	movl   $0xf010d990,0xc(%esp)
f010ac0e:	f0 
f010ac0f:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010ac16:	f0 
f010ac17:	c7 44 24 04 c6 02 00 	movl   $0x2c6,0x4(%esp)
f010ac1e:	00 
f010ac1f:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010ac26:	e8 35 e4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ac2b:	8b 1d 44 c3 11 f0    	mov    0xf011c344,%ebx
f010ac31:	8b 13                	mov    (%ebx),%edx
f010ac33:	8b 0d 48 c3 11 f0    	mov    0xf011c348,%ecx
f010ac39:	39 ce                	cmp    %ecx,%esi
f010ac3b:	72 0c                	jb     f010ac49 <_Z8mem_initv+0x75c>
f010ac3d:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010ac42:	8d 04 c1             	lea    (%ecx,%eax,8),%eax
f010ac45:	39 c6                	cmp    %eax,%esi
f010ac47:	72 24                	jb     f010ac6d <_Z8mem_initv+0x780>
f010ac49:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010ac50:	f0 
f010ac51:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010ac58:	f0 
f010ac59:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010ac60:	00 
f010ac61:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010ac68:	e8 f3 e3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ac6d:	89 75 dc             	mov    %esi,-0x24(%ebp)
f010ac70:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
f010ac76:	89 f0                	mov    %esi,%eax
f010ac78:	29 c8                	sub    %ecx,%eax
f010ac7a:	c1 f8 03             	sar    $0x3,%eax
f010ac7d:	c1 e0 0c             	shl    $0xc,%eax
f010ac80:	39 c2                	cmp    %eax,%edx
f010ac82:	74 24                	je     f010aca8 <_Z8mem_initv+0x7bb>
f010ac84:	c7 44 24 0c b8 d9 10 	movl   $0xf010d9b8,0xc(%esp)
f010ac8b:	f0 
f010ac8c:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010ac93:	f0 
f010ac94:	c7 44 24 04 c7 02 00 	movl   $0x2c7,0x4(%esp)
f010ac9b:	00 
f010ac9c:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010aca3:	e8 b8 e3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aca8:	ba 00 00 00 00       	mov    $0x0,%edx
f010acad:	89 d8                	mov    %ebx,%eax
f010acaf:	e8 f7 f0 ff ff       	call   f0109dab <_ZL11check_va2paPjj>
f010acb4:	89 c1                	mov    %eax,%ecx
f010acb6:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010acbc:	39 d7                	cmp    %edx,%edi
f010acbe:	72 0c                	jb     f010accc <_Z8mem_initv+0x7df>
f010acc0:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010acc5:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010acc8:	39 c7                	cmp    %eax,%edi
f010acca:	72 24                	jb     f010acf0 <_Z8mem_initv+0x803>
f010accc:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010acd3:	f0 
f010acd4:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010acdb:	f0 
f010acdc:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010ace3:	00 
f010ace4:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010aceb:	e8 70 e3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010acf0:	89 7d e0             	mov    %edi,-0x20(%ebp)
f010acf3:	89 f8                	mov    %edi,%eax
f010acf5:	29 d0                	sub    %edx,%eax
f010acf7:	c1 f8 03             	sar    $0x3,%eax
f010acfa:	c1 e0 0c             	shl    $0xc,%eax
f010acfd:	39 c1                	cmp    %eax,%ecx
f010acff:	74 24                	je     f010ad25 <_Z8mem_initv+0x838>
f010ad01:	c7 44 24 0c e4 d9 10 	movl   $0xf010d9e4,0xc(%esp)
f010ad08:	f0 
f010ad09:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010ad10:	f0 
f010ad11:	c7 44 24 04 c8 02 00 	movl   $0x2c8,0x4(%esp)
f010ad18:	00 
f010ad19:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010ad20:	e8 3b e3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ad25:	66 83 7f 04 01       	cmpw   $0x1,0x4(%edi)
f010ad2a:	74 24                	je     f010ad50 <_Z8mem_initv+0x863>
f010ad2c:	c7 44 24 0c 55 dd 10 	movl   $0xf010dd55,0xc(%esp)
f010ad33:	f0 
f010ad34:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010ad3b:	f0 
f010ad3c:	c7 44 24 04 c9 02 00 	movl   $0x2c9,0x4(%esp)
f010ad43:	00 
f010ad44:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010ad4b:	e8 10 e3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ad50:	66 83 7e 04 01       	cmpw   $0x1,0x4(%esi)
f010ad55:	74 24                	je     f010ad7b <_Z8mem_initv+0x88e>
f010ad57:	c7 44 24 0c 66 dd 10 	movl   $0xf010dd66,0xc(%esp)
f010ad5e:	f0 
f010ad5f:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010ad66:	f0 
f010ad67:	c7 44 24 04 ca 02 00 	movl   $0x2ca,0x4(%esp)
f010ad6e:	00 
f010ad6f:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010ad76:	e8 e5 e2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ad7b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010ad82:	00 
f010ad83:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010ad8a:	00 
f010ad8b:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010ad8e:	89 44 24 04          	mov    %eax,0x4(%esp)
f010ad92:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010ad97:	89 04 24             	mov    %eax,(%esp)
f010ad9a:	e8 34 f6 ff ff       	call   f010a3d3 <_Z11page_insertPjP4Pageji>
f010ad9f:	85 c0                	test   %eax,%eax
f010ada1:	74 24                	je     f010adc7 <_Z8mem_initv+0x8da>
f010ada3:	c7 44 24 0c 14 da 10 	movl   $0xf010da14,0xc(%esp)
f010adaa:	f0 
f010adab:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010adb2:	f0 
f010adb3:	c7 44 24 04 ce 02 00 	movl   $0x2ce,0x4(%esp)
f010adba:	00 
f010adbb:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010adc2:	e8 99 e2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010adc7:	ba 00 10 00 00       	mov    $0x1000,%edx
f010adcc:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010add1:	e8 d5 ef ff ff       	call   f0109dab <_ZL11check_va2paPjj>
f010add6:	89 c1                	mov    %eax,%ecx
f010add8:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010adde:	39 55 d8             	cmp    %edx,-0x28(%ebp)
f010ade1:	72 0d                	jb     f010adf0 <_Z8mem_initv+0x903>
f010ade3:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010ade8:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010adeb:	39 45 d8             	cmp    %eax,-0x28(%ebp)
f010adee:	72 24                	jb     f010ae14 <_Z8mem_initv+0x927>
f010adf0:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010adf7:	f0 
f010adf8:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010adff:	f0 
f010ae00:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010ae07:	00 
f010ae08:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010ae0f:	e8 4c e2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ae14:	8b 5d d8             	mov    -0x28(%ebp),%ebx
f010ae17:	89 d8                	mov    %ebx,%eax
f010ae19:	29 d0                	sub    %edx,%eax
f010ae1b:	c1 f8 03             	sar    $0x3,%eax
f010ae1e:	c1 e0 0c             	shl    $0xc,%eax
f010ae21:	39 c1                	cmp    %eax,%ecx
f010ae23:	74 24                	je     f010ae49 <_Z8mem_initv+0x95c>
f010ae25:	c7 44 24 0c 44 da 10 	movl   $0xf010da44,0xc(%esp)
f010ae2c:	f0 
f010ae2d:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010ae34:	f0 
f010ae35:	c7 44 24 04 cf 02 00 	movl   $0x2cf,0x4(%esp)
f010ae3c:	00 
f010ae3d:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010ae44:	e8 17 e2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ae49:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010ae4c:	66 83 78 04 01       	cmpw   $0x1,0x4(%eax)
f010ae51:	74 24                	je     f010ae77 <_Z8mem_initv+0x98a>
f010ae53:	c7 44 24 0c 77 dd 10 	movl   $0xf010dd77,0xc(%esp)
f010ae5a:	f0 
f010ae5b:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010ae62:	f0 
f010ae63:	c7 44 24 04 d0 02 00 	movl   $0x2d0,0x4(%esp)
f010ae6a:	00 
f010ae6b:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010ae72:	e8 e9 e1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ae77:	e8 26 f2 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010ae7c:	85 c0                	test   %eax,%eax
f010ae7e:	74 24                	je     f010aea4 <_Z8mem_initv+0x9b7>
f010ae80:	c7 44 24 0c 4a dd 10 	movl   $0xf010dd4a,0xc(%esp)
f010ae87:	f0 
f010ae88:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010ae8f:	f0 
f010ae90:	c7 44 24 04 d4 02 00 	movl   $0x2d4,0x4(%esp)
f010ae97:	00 
f010ae98:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010ae9f:	e8 bc e1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aea4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010aeab:	00 
f010aeac:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010aeb3:	00 
f010aeb4:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010aeb7:	89 44 24 04          	mov    %eax,0x4(%esp)
f010aebb:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010aec0:	89 04 24             	mov    %eax,(%esp)
f010aec3:	e8 0b f5 ff ff       	call   f010a3d3 <_Z11page_insertPjP4Pageji>
f010aec8:	85 c0                	test   %eax,%eax
f010aeca:	74 24                	je     f010aef0 <_Z8mem_initv+0xa03>
f010aecc:	c7 44 24 0c 14 da 10 	movl   $0xf010da14,0xc(%esp)
f010aed3:	f0 
f010aed4:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010aedb:	f0 
f010aedc:	c7 44 24 04 d7 02 00 	movl   $0x2d7,0x4(%esp)
f010aee3:	00 
f010aee4:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010aeeb:	e8 70 e1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aef0:	ba 00 10 00 00       	mov    $0x1000,%edx
f010aef5:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010aefa:	e8 ac ee ff ff       	call   f0109dab <_ZL11check_va2paPjj>
f010aeff:	89 c1                	mov    %eax,%ecx
f010af01:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010af07:	39 55 d8             	cmp    %edx,-0x28(%ebp)
f010af0a:	72 0d                	jb     f010af19 <_Z8mem_initv+0xa2c>
f010af0c:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010af11:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010af14:	39 45 d8             	cmp    %eax,-0x28(%ebp)
f010af17:	72 24                	jb     f010af3d <_Z8mem_initv+0xa50>
f010af19:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010af20:	f0 
f010af21:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010af28:	f0 
f010af29:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010af30:	00 
f010af31:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010af38:	e8 23 e1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010af3d:	89 d8                	mov    %ebx,%eax
f010af3f:	29 d0                	sub    %edx,%eax
f010af41:	c1 f8 03             	sar    $0x3,%eax
f010af44:	c1 e0 0c             	shl    $0xc,%eax
f010af47:	39 c1                	cmp    %eax,%ecx
f010af49:	74 24                	je     f010af6f <_Z8mem_initv+0xa82>
f010af4b:	c7 44 24 0c 44 da 10 	movl   $0xf010da44,0xc(%esp)
f010af52:	f0 
f010af53:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010af5a:	f0 
f010af5b:	c7 44 24 04 d8 02 00 	movl   $0x2d8,0x4(%esp)
f010af62:	00 
f010af63:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010af6a:	e8 f1 e0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010af6f:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010af72:	66 83 78 04 01       	cmpw   $0x1,0x4(%eax)
f010af77:	74 24                	je     f010af9d <_Z8mem_initv+0xab0>
f010af79:	c7 44 24 0c 77 dd 10 	movl   $0xf010dd77,0xc(%esp)
f010af80:	f0 
f010af81:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010af88:	f0 
f010af89:	c7 44 24 04 d9 02 00 	movl   $0x2d9,0x4(%esp)
f010af90:	00 
f010af91:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010af98:	e8 c3 e0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010af9d:	e8 00 f1 ff ff       	call   f010a0a2 <_Z10page_allocv>
f010afa2:	85 c0                	test   %eax,%eax
f010afa4:	74 24                	je     f010afca <_Z8mem_initv+0xadd>
f010afa6:	c7 44 24 0c 4a dd 10 	movl   $0xf010dd4a,0xc(%esp)
f010afad:	f0 
f010afae:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010afb5:	f0 
f010afb6:	c7 44 24 04 de 02 00 	movl   $0x2de,0x4(%esp)
f010afbd:	00 
f010afbe:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010afc5:	e8 96 e0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010afca:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010afcf:	8b 00                	mov    (%eax),%eax
f010afd1:	89 c2                	mov    %eax,%edx
f010afd3:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
f010afd9:	89 d0                	mov    %edx,%eax
f010afdb:	c1 e8 0c             	shr    $0xc,%eax
f010afde:	3b 05 40 c3 11 f0    	cmp    0xf011c340,%eax
f010afe4:	72 20                	jb     f010b006 <_Z8mem_initv+0xb19>
f010afe6:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010afea:	c7 44 24 08 18 d8 10 	movl   $0xf010d818,0x8(%esp)
f010aff1:	f0 
f010aff2:	c7 44 24 04 e1 02 00 	movl   $0x2e1,0x4(%esp)
f010aff9:	00 
f010affa:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b001:	e8 5a e0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b006:	8d 82 00 00 00 f0    	lea    -0x10000000(%edx),%eax
f010b00c:	89 45 f0             	mov    %eax,-0x10(%ebp)
f010b00f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010b016:	00 
f010b017:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010b01e:	00 
f010b01f:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b024:	89 04 24             	mov    %eax,(%esp)
f010b027:	e8 fd f0 ff ff       	call   f010a129 <_Z10pgdir_walkPjji>
f010b02c:	8b 55 f0             	mov    -0x10(%ebp),%edx
f010b02f:	83 c2 04             	add    $0x4,%edx
f010b032:	39 d0                	cmp    %edx,%eax
f010b034:	74 24                	je     f010b05a <_Z8mem_initv+0xb6d>
f010b036:	c7 44 24 0c 78 da 10 	movl   $0xf010da78,0xc(%esp)
f010b03d:	f0 
f010b03e:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b045:	f0 
f010b046:	c7 44 24 04 e2 02 00 	movl   $0x2e2,0x4(%esp)
f010b04d:	00 
f010b04e:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b055:	e8 06 e0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b05a:	c7 44 24 0c 04 00 00 	movl   $0x4,0xc(%esp)
f010b061:	00 
f010b062:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010b069:	00 
f010b06a:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010b06d:	89 44 24 04          	mov    %eax,0x4(%esp)
f010b071:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b076:	89 04 24             	mov    %eax,(%esp)
f010b079:	e8 55 f3 ff ff       	call   f010a3d3 <_Z11page_insertPjP4Pageji>
f010b07e:	85 c0                	test   %eax,%eax
f010b080:	74 24                	je     f010b0a6 <_Z8mem_initv+0xbb9>
f010b082:	c7 44 24 0c b0 da 10 	movl   $0xf010dab0,0xc(%esp)
f010b089:	f0 
f010b08a:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b091:	f0 
f010b092:	c7 44 24 04 e5 02 00 	movl   $0x2e5,0x4(%esp)
f010b099:	00 
f010b09a:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b0a1:	e8 ba df ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b0a6:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b0ab:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b0b0:	e8 f6 ec ff ff       	call   f0109dab <_ZL11check_va2paPjj>
f010b0b5:	89 c1                	mov    %eax,%ecx
f010b0b7:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010b0bd:	39 55 d8             	cmp    %edx,-0x28(%ebp)
f010b0c0:	72 0d                	jb     f010b0cf <_Z8mem_initv+0xbe2>
f010b0c2:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010b0c7:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010b0ca:	39 45 d8             	cmp    %eax,-0x28(%ebp)
f010b0cd:	72 24                	jb     f010b0f3 <_Z8mem_initv+0xc06>
f010b0cf:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010b0d6:	f0 
f010b0d7:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b0de:	f0 
f010b0df:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b0e6:	00 
f010b0e7:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010b0ee:	e8 6d df ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b0f3:	89 d8                	mov    %ebx,%eax
f010b0f5:	29 d0                	sub    %edx,%eax
f010b0f7:	c1 f8 03             	sar    $0x3,%eax
f010b0fa:	c1 e0 0c             	shl    $0xc,%eax
f010b0fd:	39 c1                	cmp    %eax,%ecx
f010b0ff:	74 24                	je     f010b125 <_Z8mem_initv+0xc38>
f010b101:	c7 44 24 0c 44 da 10 	movl   $0xf010da44,0xc(%esp)
f010b108:	f0 
f010b109:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b110:	f0 
f010b111:	c7 44 24 04 e6 02 00 	movl   $0x2e6,0x4(%esp)
f010b118:	00 
f010b119:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b120:	e8 3b df ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b125:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010b128:	66 83 78 04 01       	cmpw   $0x1,0x4(%eax)
f010b12d:	74 24                	je     f010b153 <_Z8mem_initv+0xc66>
f010b12f:	c7 44 24 0c 77 dd 10 	movl   $0xf010dd77,0xc(%esp)
f010b136:	f0 
f010b137:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b13e:	f0 
f010b13f:	c7 44 24 04 e7 02 00 	movl   $0x2e7,0x4(%esp)
f010b146:	00 
f010b147:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b14e:	e8 0d df ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b153:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010b15a:	00 
f010b15b:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010b162:	00 
f010b163:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b168:	89 04 24             	mov    %eax,(%esp)
f010b16b:	e8 b9 ef ff ff       	call   f010a129 <_Z10pgdir_walkPjji>
f010b170:	f6 00 04             	testb  $0x4,(%eax)
f010b173:	75 24                	jne    f010b199 <_Z8mem_initv+0xcac>
f010b175:	c7 44 24 0c e4 da 10 	movl   $0xf010dae4,0xc(%esp)
f010b17c:	f0 
f010b17d:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b184:	f0 
f010b185:	c7 44 24 04 e8 02 00 	movl   $0x2e8,0x4(%esp)
f010b18c:	00 
f010b18d:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b194:	e8 c7 de ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b199:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010b1a0:	00 
f010b1a1:	c7 44 24 08 00 00 40 	movl   $0x400000,0x8(%esp)
f010b1a8:	00 
f010b1a9:	89 74 24 04          	mov    %esi,0x4(%esp)
f010b1ad:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b1b2:	89 04 24             	mov    %eax,(%esp)
f010b1b5:	e8 19 f2 ff ff       	call   f010a3d3 <_Z11page_insertPjP4Pageji>
f010b1ba:	85 c0                	test   %eax,%eax
f010b1bc:	78 24                	js     f010b1e2 <_Z8mem_initv+0xcf5>
f010b1be:	c7 44 24 0c 10 db 10 	movl   $0xf010db10,0xc(%esp)
f010b1c5:	f0 
f010b1c6:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b1cd:	f0 
f010b1ce:	c7 44 24 04 ec 02 00 	movl   $0x2ec,0x4(%esp)
f010b1d5:	00 
f010b1d6:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b1dd:	e8 7e de ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b1e2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010b1e9:	00 
f010b1ea:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010b1f1:	00 
f010b1f2:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010b1f6:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b1fb:	89 04 24             	mov    %eax,(%esp)
f010b1fe:	e8 d0 f1 ff ff       	call   f010a3d3 <_Z11page_insertPjP4Pageji>
f010b203:	85 c0                	test   %eax,%eax
f010b205:	74 24                	je     f010b22b <_Z8mem_initv+0xd3e>
f010b207:	c7 44 24 0c 3c db 10 	movl   $0xf010db3c,0xc(%esp)
f010b20e:	f0 
f010b20f:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b216:	f0 
f010b217:	c7 44 24 04 ef 02 00 	movl   $0x2ef,0x4(%esp)
f010b21e:	00 
f010b21f:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b226:	e8 35 de ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b22b:	ba 00 00 00 00       	mov    $0x0,%edx
f010b230:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b235:	e8 71 eb ff ff       	call   f0109dab <_ZL11check_va2paPjj>
f010b23a:	89 c1                	mov    %eax,%ecx
f010b23c:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010b242:	39 d7                	cmp    %edx,%edi
f010b244:	72 0c                	jb     f010b252 <_Z8mem_initv+0xd65>
f010b246:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010b24b:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010b24e:	39 c7                	cmp    %eax,%edi
f010b250:	72 24                	jb     f010b276 <_Z8mem_initv+0xd89>
f010b252:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010b259:	f0 
f010b25a:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b261:	f0 
f010b262:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b269:	00 
f010b26a:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010b271:	e8 ea dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b276:	8b 45 e0             	mov    -0x20(%ebp),%eax
f010b279:	29 d0                	sub    %edx,%eax
f010b27b:	c1 f8 03             	sar    $0x3,%eax
f010b27e:	c1 e0 0c             	shl    $0xc,%eax
f010b281:	39 c1                	cmp    %eax,%ecx
f010b283:	74 24                	je     f010b2a9 <_Z8mem_initv+0xdbc>
f010b285:	c7 44 24 0c e4 d9 10 	movl   $0xf010d9e4,0xc(%esp)
f010b28c:	f0 
f010b28d:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b294:	f0 
f010b295:	c7 44 24 04 f2 02 00 	movl   $0x2f2,0x4(%esp)
f010b29c:	00 
f010b29d:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b2a4:	e8 b7 dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b2a9:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b2ae:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b2b3:	e8 f3 ea ff ff       	call   f0109dab <_ZL11check_va2paPjj>
f010b2b8:	89 c1                	mov    %eax,%ecx
f010b2ba:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010b2c0:	39 d7                	cmp    %edx,%edi
f010b2c2:	72 0c                	jb     f010b2d0 <_Z8mem_initv+0xde3>
f010b2c4:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010b2c9:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010b2cc:	39 c7                	cmp    %eax,%edi
f010b2ce:	72 24                	jb     f010b2f4 <_Z8mem_initv+0xe07>
f010b2d0:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010b2d7:	f0 
f010b2d8:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b2df:	f0 
f010b2e0:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b2e7:	00 
f010b2e8:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010b2ef:	e8 6c dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b2f4:	8b 45 e0             	mov    -0x20(%ebp),%eax
f010b2f7:	29 d0                	sub    %edx,%eax
f010b2f9:	c1 f8 03             	sar    $0x3,%eax
f010b2fc:	c1 e0 0c             	shl    $0xc,%eax
f010b2ff:	39 c1                	cmp    %eax,%ecx
f010b301:	74 24                	je     f010b327 <_Z8mem_initv+0xe3a>
f010b303:	c7 44 24 0c 6c db 10 	movl   $0xf010db6c,0xc(%esp)
f010b30a:	f0 
f010b30b:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b312:	f0 
f010b313:	c7 44 24 04 f3 02 00 	movl   $0x2f3,0x4(%esp)
f010b31a:	00 
f010b31b:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b322:	e8 39 dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b327:	66 83 7f 04 02       	cmpw   $0x2,0x4(%edi)
f010b32c:	74 24                	je     f010b352 <_Z8mem_initv+0xe65>
f010b32e:	c7 44 24 0c 88 dd 10 	movl   $0xf010dd88,0xc(%esp)
f010b335:	f0 
f010b336:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b33d:	f0 
f010b33e:	c7 44 24 04 f5 02 00 	movl   $0x2f5,0x4(%esp)
f010b345:	00 
f010b346:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b34d:	e8 0e dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b352:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010b355:	66 83 78 04 00       	cmpw   $0x0,0x4(%eax)
f010b35a:	74 24                	je     f010b380 <_Z8mem_initv+0xe93>
f010b35c:	c7 44 24 0c 99 dd 10 	movl   $0xf010dd99,0xc(%esp)
f010b363:	f0 
f010b364:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b36b:	f0 
f010b36c:	c7 44 24 04 f6 02 00 	movl   $0x2f6,0x4(%esp)
f010b373:	00 
f010b374:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b37b:	e8 e0 dc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b380:	e8 1d ed ff ff       	call   f010a0a2 <_Z10page_allocv>
f010b385:	39 45 d8             	cmp    %eax,-0x28(%ebp)
f010b388:	74 24                	je     f010b3ae <_Z8mem_initv+0xec1>
f010b38a:	c7 44 24 0c aa dd 10 	movl   $0xf010ddaa,0xc(%esp)
f010b391:	f0 
f010b392:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b399:	f0 
f010b39a:	c7 44 24 04 fa 02 00 	movl   $0x2fa,0x4(%esp)
f010b3a1:	00 
f010b3a2:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b3a9:	e8 b2 dc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b3ae:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010b3b5:	00 
f010b3b6:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b3bb:	89 04 24             	mov    %eax,(%esp)
f010b3be:	e8 d4 ee ff ff       	call   f010a297 <_Z11page_removePjj>
f010b3c3:	ba 00 00 00 00       	mov    $0x0,%edx
f010b3c8:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b3cd:	e8 d9 e9 ff ff       	call   f0109dab <_ZL11check_va2paPjj>
f010b3d2:	83 f8 ff             	cmp    $0xffffffff,%eax
f010b3d5:	74 24                	je     f010b3fb <_Z8mem_initv+0xf0e>
f010b3d7:	c7 44 24 0c a0 db 10 	movl   $0xf010dba0,0xc(%esp)
f010b3de:	f0 
f010b3df:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b3e6:	f0 
f010b3e7:	c7 44 24 04 fe 02 00 	movl   $0x2fe,0x4(%esp)
f010b3ee:	00 
f010b3ef:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b3f6:	e8 65 dc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b3fb:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b400:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b405:	e8 a1 e9 ff ff       	call   f0109dab <_ZL11check_va2paPjj>
f010b40a:	89 c1                	mov    %eax,%ecx
f010b40c:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010b412:	39 d7                	cmp    %edx,%edi
f010b414:	72 0c                	jb     f010b422 <_Z8mem_initv+0xf35>
f010b416:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010b41b:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010b41e:	39 c7                	cmp    %eax,%edi
f010b420:	72 24                	jb     f010b446 <_Z8mem_initv+0xf59>
f010b422:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010b429:	f0 
f010b42a:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b431:	f0 
f010b432:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b439:	00 
f010b43a:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010b441:	e8 1a dc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b446:	8b 45 e0             	mov    -0x20(%ebp),%eax
f010b449:	29 d0                	sub    %edx,%eax
f010b44b:	c1 f8 03             	sar    $0x3,%eax
f010b44e:	c1 e0 0c             	shl    $0xc,%eax
f010b451:	39 c1                	cmp    %eax,%ecx
f010b453:	74 24                	je     f010b479 <_Z8mem_initv+0xf8c>
f010b455:	c7 44 24 0c 6c db 10 	movl   $0xf010db6c,0xc(%esp)
f010b45c:	f0 
f010b45d:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b464:	f0 
f010b465:	c7 44 24 04 ff 02 00 	movl   $0x2ff,0x4(%esp)
f010b46c:	00 
f010b46d:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b474:	e8 e7 db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b479:	66 83 7f 04 01       	cmpw   $0x1,0x4(%edi)
f010b47e:	74 24                	je     f010b4a4 <_Z8mem_initv+0xfb7>
f010b480:	c7 44 24 0c 55 dd 10 	movl   $0xf010dd55,0xc(%esp)
f010b487:	f0 
f010b488:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b48f:	f0 
f010b490:	c7 44 24 04 00 03 00 	movl   $0x300,0x4(%esp)
f010b497:	00 
f010b498:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b49f:	e8 bc db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b4a4:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010b4a7:	66 83 78 04 00       	cmpw   $0x0,0x4(%eax)
f010b4ac:	74 24                	je     f010b4d2 <_Z8mem_initv+0xfe5>
f010b4ae:	c7 44 24 0c 99 dd 10 	movl   $0xf010dd99,0xc(%esp)
f010b4b5:	f0 
f010b4b6:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b4bd:	f0 
f010b4be:	c7 44 24 04 01 03 00 	movl   $0x301,0x4(%esp)
f010b4c5:	00 
f010b4c6:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b4cd:	e8 8e db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b4d2:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010b4d9:	00 
f010b4da:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b4df:	89 04 24             	mov    %eax,(%esp)
f010b4e2:	e8 b0 ed ff ff       	call   f010a297 <_Z11page_removePjj>
f010b4e7:	ba 00 00 00 00       	mov    $0x0,%edx
f010b4ec:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b4f1:	e8 b5 e8 ff ff       	call   f0109dab <_ZL11check_va2paPjj>
f010b4f6:	83 f8 ff             	cmp    $0xffffffff,%eax
f010b4f9:	74 24                	je     f010b51f <_Z8mem_initv+0x1032>
f010b4fb:	c7 44 24 0c a0 db 10 	movl   $0xf010dba0,0xc(%esp)
f010b502:	f0 
f010b503:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b50a:	f0 
f010b50b:	c7 44 24 04 05 03 00 	movl   $0x305,0x4(%esp)
f010b512:	00 
f010b513:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b51a:	e8 41 db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b51f:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b524:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b529:	e8 7d e8 ff ff       	call   f0109dab <_ZL11check_va2paPjj>
f010b52e:	83 f8 ff             	cmp    $0xffffffff,%eax
f010b531:	74 24                	je     f010b557 <_Z8mem_initv+0x106a>
f010b533:	c7 44 24 0c c4 db 10 	movl   $0xf010dbc4,0xc(%esp)
f010b53a:	f0 
f010b53b:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b542:	f0 
f010b543:	c7 44 24 04 06 03 00 	movl   $0x306,0x4(%esp)
f010b54a:	00 
f010b54b:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b552:	e8 09 db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b557:	66 83 7f 04 00       	cmpw   $0x0,0x4(%edi)
f010b55c:	74 24                	je     f010b582 <_Z8mem_initv+0x1095>
f010b55e:	c7 44 24 0c b4 dd 10 	movl   $0xf010ddb4,0xc(%esp)
f010b565:	f0 
f010b566:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b56d:	f0 
f010b56e:	c7 44 24 04 07 03 00 	movl   $0x307,0x4(%esp)
f010b575:	00 
f010b576:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b57d:	e8 de da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b582:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010b585:	66 83 78 04 00       	cmpw   $0x0,0x4(%eax)
f010b58a:	74 24                	je     f010b5b0 <_Z8mem_initv+0x10c3>
f010b58c:	c7 44 24 0c 99 dd 10 	movl   $0xf010dd99,0xc(%esp)
f010b593:	f0 
f010b594:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b59b:	f0 
f010b59c:	c7 44 24 04 08 03 00 	movl   $0x308,0x4(%esp)
f010b5a3:	00 
f010b5a4:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b5ab:	e8 b0 da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b5b0:	e8 ed ea ff ff       	call   f010a0a2 <_Z10page_allocv>
f010b5b5:	39 c7                	cmp    %eax,%edi
f010b5b7:	74 24                	je     f010b5dd <_Z8mem_initv+0x10f0>
f010b5b9:	c7 44 24 0c c5 dd 10 	movl   $0xf010ddc5,0xc(%esp)
f010b5c0:	f0 
f010b5c1:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b5c8:	f0 
f010b5c9:	c7 44 24 04 0c 03 00 	movl   $0x30c,0x4(%esp)
f010b5d0:	00 
f010b5d1:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b5d8:	e8 83 da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b5dd:	e8 c0 ea ff ff       	call   f010a0a2 <_Z10page_allocv>
f010b5e2:	85 c0                	test   %eax,%eax
f010b5e4:	74 24                	je     f010b60a <_Z8mem_initv+0x111d>
f010b5e6:	c7 44 24 0c 4a dd 10 	movl   $0xf010dd4a,0xc(%esp)
f010b5ed:	f0 
f010b5ee:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b5f5:	f0 
f010b5f6:	c7 44 24 04 10 03 00 	movl   $0x310,0x4(%esp)
f010b5fd:	00 
f010b5fe:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b605:	e8 56 da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b60a:	8b 1d 44 c3 11 f0    	mov    0xf011c344,%ebx
f010b610:	8b 13                	mov    (%ebx),%edx
f010b612:	8b 0d 48 c3 11 f0    	mov    0xf011c348,%ecx
f010b618:	39 ce                	cmp    %ecx,%esi
f010b61a:	72 0c                	jb     f010b628 <_Z8mem_initv+0x113b>
f010b61c:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010b621:	8d 04 c1             	lea    (%ecx,%eax,8),%eax
f010b624:	39 c6                	cmp    %eax,%esi
f010b626:	72 24                	jb     f010b64c <_Z8mem_initv+0x115f>
f010b628:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010b62f:	f0 
f010b630:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b637:	f0 
f010b638:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b63f:	00 
f010b640:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010b647:	e8 14 da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b64c:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
f010b652:	8b 45 dc             	mov    -0x24(%ebp),%eax
f010b655:	29 c8                	sub    %ecx,%eax
f010b657:	c1 f8 03             	sar    $0x3,%eax
f010b65a:	c1 e0 0c             	shl    $0xc,%eax
f010b65d:	39 c2                	cmp    %eax,%edx
f010b65f:	74 24                	je     f010b685 <_Z8mem_initv+0x1198>
f010b661:	c7 44 24 0c b8 d9 10 	movl   $0xf010d9b8,0xc(%esp)
f010b668:	f0 
f010b669:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b670:	f0 
f010b671:	c7 44 24 04 1d 03 00 	movl   $0x31d,0x4(%esp)
f010b678:	00 
f010b679:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b680:	e8 db d9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b685:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
f010b68b:	66 83 7e 04 01       	cmpw   $0x1,0x4(%esi)
f010b690:	74 24                	je     f010b6b6 <_Z8mem_initv+0x11c9>
f010b692:	c7 44 24 0c 66 dd 10 	movl   $0xf010dd66,0xc(%esp)
f010b699:	f0 
f010b69a:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b6a1:	f0 
f010b6a2:	c7 44 24 04 1f 03 00 	movl   $0x31f,0x4(%esp)
f010b6a9:	00 
f010b6aa:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b6b1:	e8 aa d9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b6b6:	66 c7 46 04 00 00    	movw   $0x0,0x4(%esi)
f010b6bc:	89 34 24             	mov    %esi,(%esp)
f010b6bf:	e8 17 e9 ff ff       	call   f0109fdb <_Z9page_freeP4Page>
f010b6c4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
f010b6cb:	00 
f010b6cc:	c7 44 24 04 00 10 40 	movl   $0x401000,0x4(%esp)
f010b6d3:	00 
f010b6d4:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b6d9:	89 04 24             	mov    %eax,(%esp)
f010b6dc:	e8 48 ea ff ff       	call   f010a129 <_Z10pgdir_walkPjji>
f010b6e1:	89 c3                	mov    %eax,%ebx
f010b6e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
f010b6e6:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b6eb:	8d 48 04             	lea    0x4(%eax),%ecx
f010b6ee:	8b 01                	mov    (%ecx),%eax
f010b6f0:	89 c2                	mov    %eax,%edx
f010b6f2:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
f010b6f8:	89 d0                	mov    %edx,%eax
f010b6fa:	c1 e8 0c             	shr    $0xc,%eax
f010b6fd:	3b 05 40 c3 11 f0    	cmp    0xf011c340,%eax
f010b703:	72 20                	jb     f010b725 <_Z8mem_initv+0x1238>
f010b705:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010b709:	c7 44 24 08 18 d8 10 	movl   $0xf010d818,0x8(%esp)
f010b710:	f0 
f010b711:	c7 44 24 04 26 03 00 	movl   $0x326,0x4(%esp)
f010b718:	00 
f010b719:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b720:	e8 3b d9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b725:	8d 82 04 00 00 f0    	lea    -0xffffffc(%edx),%eax
f010b72b:	39 c3                	cmp    %eax,%ebx
f010b72d:	74 24                	je     f010b753 <_Z8mem_initv+0x1266>
f010b72f:	c7 44 24 0c cf dd 10 	movl   $0xf010ddcf,0xc(%esp)
f010b736:	f0 
f010b737:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b73e:	f0 
f010b73f:	c7 44 24 04 27 03 00 	movl   $0x327,0x4(%esp)
f010b746:	00 
f010b747:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b74e:	e8 0d d9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b753:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
f010b759:	66 c7 46 04 00 00    	movw   $0x0,0x4(%esi)
f010b75f:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010b765:	39 d6                	cmp    %edx,%esi
f010b767:	72 0c                	jb     f010b775 <_Z8mem_initv+0x1288>
f010b769:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010b76e:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010b771:	39 c6                	cmp    %eax,%esi
f010b773:	72 24                	jb     f010b799 <_Z8mem_initv+0x12ac>
f010b775:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010b77c:	f0 
f010b77d:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b784:	f0 
f010b785:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b78c:	00 
f010b78d:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010b794:	e8 c7 d8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b799:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010b7a0:	00 
f010b7a1:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
f010b7a8:	00 
f010b7a9:	8b 45 dc             	mov    -0x24(%ebp),%eax
f010b7ac:	29 d0                	sub    %edx,%eax
f010b7ae:	c1 f8 03             	sar    $0x3,%eax
f010b7b1:	05 00 00 0f 00       	add    $0xf0000,%eax
f010b7b6:	c1 e0 0c             	shl    $0xc,%eax
f010b7b9:	89 04 24             	mov    %eax,(%esp)
f010b7bc:	e8 b0 12 00 00       	call   f010ca71 <_Z6memsetPvij>
f010b7c1:	89 34 24             	mov    %esi,(%esp)
f010b7c4:	e8 12 e8 ff ff       	call   f0109fdb <_Z9page_freeP4Page>
f010b7c9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
f010b7d0:	00 
f010b7d1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010b7d8:	00 
f010b7d9:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b7de:	89 04 24             	mov    %eax,(%esp)
f010b7e1:	e8 43 e9 ff ff       	call   f010a129 <_Z10pgdir_walkPjji>
f010b7e6:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010b7ec:	39 d6                	cmp    %edx,%esi
f010b7ee:	72 0c                	jb     f010b7fc <_Z8mem_initv+0x130f>
f010b7f0:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010b7f5:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010b7f8:	39 c6                	cmp    %eax,%esi
f010b7fa:	72 24                	jb     f010b820 <_Z8mem_initv+0x1333>
f010b7fc:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010b803:	f0 
f010b804:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b80b:	f0 
f010b80c:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b813:	00 
f010b814:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010b81b:	e8 40 d8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b820:	8b 45 dc             	mov    -0x24(%ebp),%eax
f010b823:	29 d0                	sub    %edx,%eax
f010b825:	c1 f8 03             	sar    $0x3,%eax
f010b828:	05 00 00 0f 00       	add    $0xf0000,%eax
f010b82d:	c1 e0 0c             	shl    $0xc,%eax
f010b830:	89 45 f0             	mov    %eax,-0x10(%ebp)
f010b833:	ba 00 00 00 00       	mov    $0x0,%edx
f010b838:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
f010b83c:	74 24                	je     f010b862 <_Z8mem_initv+0x1375>
f010b83e:	c7 44 24 0c e7 dd 10 	movl   $0xf010dde7,0xc(%esp)
f010b845:	f0 
f010b846:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010b84d:	f0 
f010b84e:	c7 44 24 04 31 03 00 	movl   $0x331,0x4(%esp)
f010b855:	00 
f010b856:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b85d:	e8 fe d7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b862:	83 c2 01             	add    $0x1,%edx
f010b865:	81 fa 00 04 00 00    	cmp    $0x400,%edx
f010b86b:	75 cb                	jne    f010b838 <_Z8mem_initv+0x134b>
f010b86d:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b872:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
f010b878:	66 c7 46 04 00 00    	movw   $0x0,0x4(%esi)
f010b87e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f010b881:	a3 90 c3 11 f0       	mov    %eax,0xf011c390
f010b886:	89 34 24             	mov    %esi,(%esp)
f010b889:	e8 4d e7 ff ff       	call   f0109fdb <_Z9page_freeP4Page>
f010b88e:	89 3c 24             	mov    %edi,(%esp)
f010b891:	e8 45 e7 ff ff       	call   f0109fdb <_Z9page_freeP4Page>
f010b896:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010b899:	89 04 24             	mov    %eax,(%esp)
f010b89c:	e8 3a e7 ff ff       	call   f0109fdb <_Z9page_freeP4Page>
f010b8a1:	c7 04 24 fe dd 10 f0 	movl   $0xf010ddfe,(%esp)
f010b8a8:	e8 42 02 00 00       	call   f010baef <_Z7cprintfPKcz>
f010b8ad:	b8 00 10 10 f0       	mov    $0xf0101000,%eax
f010b8b2:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010b8b7:	77 20                	ja     f010b8d9 <_Z8mem_initv+0x13ec>
f010b8b9:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010b8bd:	c7 44 24 08 68 d8 10 	movl   $0xf010d868,0x8(%esp)
f010b8c4:	f0 
f010b8c5:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
f010b8cc:	00 
f010b8cd:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b8d4:	e8 87 d7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b8d9:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
f010b8e0:	00 
f010b8e1:	05 00 00 00 10       	add    $0x10000000,%eax
f010b8e6:	89 04 24             	mov    %eax,(%esp)
f010b8e9:	b9 00 80 00 00       	mov    $0x8000,%ecx
f010b8ee:	ba 00 80 ff ef       	mov    $0xefff8000,%edx
f010b8f3:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b8f8:	e8 ea e9 ff ff       	call   f010a2e7 <_ZL16page_map_segmentPjjjji>
f010b8fd:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
f010b904:	00 
f010b905:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f010b90c:	b9 00 00 00 10       	mov    $0x10000000,%ecx
f010b911:	ba 00 00 00 f0       	mov    $0xf0000000,%edx
f010b916:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b91b:	e8 c7 e9 ff ff       	call   f010a2e7 <_ZL16page_map_segmentPjjjji>
f010b920:	e8 f0 e4 ff ff       	call   f0109e15 <_ZL14boot_mem_checkv>
f010b925:	8b 15 44 c3 11 f0    	mov    0xf011c344,%edx
f010b92b:	8b 82 00 0f 00 00    	mov    0xf00(%edx),%eax
f010b931:	89 02                	mov    %eax,(%edx)
f010b933:	8b 15 44 c3 11 f0    	mov    0xf011c344,%edx
f010b939:	89 d0                	mov    %edx,%eax
f010b93b:	81 fa ff ff ff ef    	cmp    $0xefffffff,%edx
f010b941:	77 20                	ja     f010b963 <_Z8mem_initv+0x1476>
f010b943:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010b947:	c7 44 24 08 68 d8 10 	movl   $0xf010d868,0x8(%esp)
f010b94e:	f0 
f010b94f:	c7 44 24 04 bf 00 00 	movl   $0xbf,0x4(%esp)
f010b956:	00 
f010b957:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b95e:	e8 fd d6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b963:	05 00 00 00 10       	add    $0x10000000,%eax
f010b968:	0f 22 d8             	mov    %eax,%cr3
f010b96b:	0f 20 c0             	mov    %cr0,%eax
f010b96e:	0d 2f 00 05 80       	or     $0x8005002f,%eax
f010b973:	83 e0 f3             	and    $0xfffffff3,%eax
f010b976:	0f 22 c0             	mov    %eax,%cr0
f010b979:	0f 01 15 04 70 11 f0 	lgdtl  0xf0117004
f010b980:	b8 23 00 00 00       	mov    $0x23,%eax
f010b985:	8e e8                	mov    %eax,%gs
f010b987:	8e e0                	mov    %eax,%fs
f010b989:	b0 10                	mov    $0x10,%al
f010b98b:	8e c0                	mov    %eax,%es
f010b98d:	8e d8                	mov    %eax,%ds
f010b98f:	8e d0                	mov    %eax,%ss
f010b991:	ea 98 b9 10 f0 08 00 	ljmp   $0x8,$0xf010b998
f010b998:	b0 00                	mov    $0x0,%al
f010b99a:	0f 00 d0             	lldt   %ax
f010b99d:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
f010b9a3:	a1 44 c3 11 f0       	mov    0xf011c344,%eax
f010b9a8:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010b9ad:	77 20                	ja     f010b9cf <_Z8mem_initv+0x14e2>
f010b9af:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010b9b3:	c7 44 24 08 68 d8 10 	movl   $0xf010d868,0x8(%esp)
f010b9ba:	f0 
f010b9bb:	c7 44 24 04 db 00 00 	movl   $0xdb,0x4(%esp)
f010b9c2:	00 
f010b9c3:	c7 04 24 2f dc 10 f0 	movl   $0xf010dc2f,(%esp)
f010b9ca:	e8 91 d6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b9cf:	05 00 00 00 10       	add    $0x10000000,%eax
f010b9d4:	0f 22 d8             	mov    %eax,%cr3
f010b9d7:	83 c4 3c             	add    $0x3c,%esp
f010b9da:	5b                   	pop    %ebx
f010b9db:	5e                   	pop    %esi
f010b9dc:	5f                   	pop    %edi
f010b9dd:	5d                   	pop    %ebp
f010b9de:	c3                   	ret    

f010b9df <_Z8round_upIjET_S0_j>:
T *round_down(T *a, uint32_t n) {
	return (T *) round_down((uintptr_t) a, n);
}

template <typename T>
T round_up(T a, uint32_t n) {
f010b9df:	55                   	push   %ebp
f010b9e0:	89 e5                	mov    %esp,%ebp
f010b9e2:	83 ec 08             	sub    $0x8,%esp
f010b9e5:	89 1c 24             	mov    %ebx,(%esp)
f010b9e8:	89 74 24 04          	mov    %esi,0x4(%esp)
f010b9ec:	8b 55 0c             	mov    0xc(%ebp),%edx
	return round_down(a + n - 1, n);
f010b9ef:	8b 45 08             	mov    0x8(%ebp),%eax
f010b9f2:	8d 74 10 ff          	lea    -0x1(%eax,%edx,1),%esi
f010b9f6:	89 f0                	mov    %esi,%eax
f010b9f8:	89 d3                	mov    %edx,%ebx
f010b9fa:	ba 00 00 00 00       	mov    $0x0,%edx
f010b9ff:	f7 f3                	div    %ebx
f010ba01:	89 f0                	mov    %esi,%eax
f010ba03:	29 d0                	sub    %edx,%eax
}
f010ba05:	8b 1c 24             	mov    (%esp),%ebx
f010ba08:	8b 74 24 04          	mov    0x4(%esp),%esi
f010ba0c:	89 ec                	mov    %ebp,%esp
f010ba0e:	5d                   	pop    %ebp
f010ba0f:	c3                   	ret    

f010ba10 <_Z10round_downIcEPT_S1_j>:
inline uint32_t round_down(uint32_t a, uint32_t n) {
	return a - a % n;
}

template <typename T>
T *round_down(T *a, uint32_t n) {
f010ba10:	55                   	push   %ebp
f010ba11:	89 e5                	mov    %esp,%ebp
f010ba13:	53                   	push   %ebx
f010ba14:	8b 5d 08             	mov    0x8(%ebp),%ebx
	return (T *) round_down((uintptr_t) a, n);
f010ba17:	89 d8                	mov    %ebx,%eax
f010ba19:	ba 00 00 00 00       	mov    $0x0,%edx
f010ba1e:	f7 75 0c             	divl   0xc(%ebp)
f010ba21:	89 d8                	mov    %ebx,%eax
f010ba23:	29 d0                	sub    %edx,%eax
}
f010ba25:	5b                   	pop    %ebx
f010ba26:	5d                   	pop    %ebp
f010ba27:	c3                   	ret    

f010ba28 <_Z8round_upIPcET_S1_j>:

template <typename T>
T round_up(T a, uint32_t n) {
f010ba28:	55                   	push   %ebp
f010ba29:	89 e5                	mov    %esp,%ebp
f010ba2b:	83 ec 08             	sub    $0x8,%esp
f010ba2e:	8b 45 0c             	mov    0xc(%ebp),%eax
	return round_down(a + n - 1, n);
f010ba31:	89 44 24 04          	mov    %eax,0x4(%esp)
f010ba35:	8b 55 08             	mov    0x8(%ebp),%edx
f010ba38:	8d 54 02 ff          	lea    -0x1(%edx,%eax,1),%edx
f010ba3c:	89 14 24             	mov    %edx,(%esp)
f010ba3f:	e8 cc ff ff ff       	call   f010ba10 <_Z10round_downIcEPT_S1_j>
}
f010ba44:	c9                   	leave  
f010ba45:	c3                   	ret    

f010ba46 <_ZNK4Page11page_numberEv>:
	// to this page.  Reserved pages may not have valid reference counts.
	uint16_t pp_ref;

#if JOS_KERNEL
	// Returns the physical page number for this page.
	size_t page_number() const {
f010ba46:	55                   	push   %ebp
f010ba47:	89 e5                	mov    %esp,%ebp
f010ba49:	83 ec 18             	sub    $0x18,%esp
f010ba4c:	8b 4d 08             	mov    0x8(%ebp),%ecx
		assert(this >= pages && this < pages + npages);
f010ba4f:	8b 15 48 c3 11 f0    	mov    0xf011c348,%edx
f010ba55:	39 ca                	cmp    %ecx,%edx
f010ba57:	77 0c                	ja     f010ba65 <_ZNK4Page11page_numberEv+0x1f>
f010ba59:	a1 40 c3 11 f0       	mov    0xf011c340,%eax
f010ba5e:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f010ba61:	39 c1                	cmp    %eax,%ecx
f010ba63:	72 24                	jb     f010ba89 <_ZNK4Page11page_numberEv+0x43>
f010ba65:	c7 44 24 0c f0 d7 10 	movl   $0xf010d7f0,0xc(%esp)
f010ba6c:	f0 
f010ba6d:	c7 44 24 08 ec db 10 	movl   $0xf010dbec,0x8(%esp)
f010ba74:	f0 
f010ba75:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010ba7c:	00 
f010ba7d:	c7 04 24 01 dc 10 f0 	movl   $0xf010dc01,(%esp)
f010ba84:	e8 d7 d5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ba89:	89 c8                	mov    %ecx,%eax
f010ba8b:	29 d0                	sub    %edx,%eax
f010ba8d:	c1 f8 03             	sar    $0x3,%eax
		return this - pages;
	}
f010ba90:	c9                   	leave  
f010ba91:	c3                   	ret    
	...

f010ba94 <_Z13mc146818_readj>:

#include <kern/kclock.h>


unsigned
mc146818_read(unsigned reg)
f010ba94:	55                   	push   %ebp
f010ba95:	89 e5                	mov    %esp,%ebp
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f010ba97:	ba 70 00 00 00       	mov    $0x70,%edx
f010ba9c:	8b 45 08             	mov    0x8(%ebp),%eax
f010ba9f:	ee                   	out    %al,(%dx)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f010baa0:	b2 71                	mov    $0x71,%dl
f010baa2:	ec                   	in     (%dx),%al
f010baa3:	0f b6 c0             	movzbl %al,%eax
{
	outb(IO_RTC, reg);
	return inb(IO_RTC+1);
}
f010baa6:	5d                   	pop    %ebp
f010baa7:	c3                   	ret    

f010baa8 <_Z14mc146818_writejj>:

void
mc146818_write(unsigned reg, unsigned datum)
f010baa8:	55                   	push   %ebp
f010baa9:	89 e5                	mov    %esp,%ebp
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f010baab:	ba 70 00 00 00       	mov    $0x70,%edx
f010bab0:	8b 45 08             	mov    0x8(%ebp),%eax
f010bab3:	ee                   	out    %al,(%dx)
f010bab4:	b2 71                	mov    $0x71,%dl
f010bab6:	8b 45 0c             	mov    0xc(%ebp),%eax
f010bab9:	ee                   	out    %al,(%dx)
{
	outb(IO_RTC, reg);
	outb(IO_RTC+1, datum);
}
f010baba:	5d                   	pop    %ebp
f010babb:	c3                   	ret    

f010babc <_Z8vcprintfPKcPc>:
	int *cntptr = (int *) thunk;
	(*cntptr)++;
}

int
vcprintf(const char *fmt, va_list ap)
f010babc:	55                   	push   %ebp
f010babd:	89 e5                	mov    %esp,%ebp
f010babf:	83 ec 28             	sub    $0x28,%esp
{
	int cnt = 0;
f010bac2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)

	vprintfmt(putch, &cnt, fmt, ap);
f010bac9:	8b 45 0c             	mov    0xc(%ebp),%eax
f010bacc:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010bad0:	8b 45 08             	mov    0x8(%ebp),%eax
f010bad3:	89 44 24 08          	mov    %eax,0x8(%esp)
f010bad7:	8d 45 fc             	lea    -0x4(%ebp),%eax
f010bada:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bade:	c7 04 24 09 bb 10 f0 	movl   $0xf010bb09,(%esp)
f010bae5:	e8 d6 07 00 00       	call   f010c2c0 <_Z9vprintfmtPFviPvES_PKcPc>
f010baea:	8b 45 fc             	mov    -0x4(%ebp),%eax
	return cnt;
}
f010baed:	c9                   	leave  
f010baee:	c3                   	ret    

f010baef <_Z7cprintfPKcz>:

int
cprintf(const char *fmt, ...)
f010baef:	55                   	push   %ebp
f010baf0:	89 e5                	mov    %esp,%ebp
f010baf2:	83 ec 08             	sub    $0x8,%esp
{
	va_list ap;
	int cnt;

	va_start(ap, fmt);
	cnt = vcprintf(fmt, ap);
f010baf5:	8d 45 0c             	lea    0xc(%ebp),%eax
f010baf8:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bafc:	8b 45 08             	mov    0x8(%ebp),%eax
f010baff:	89 04 24             	mov    %eax,(%esp)
f010bb02:	e8 b5 ff ff ff       	call   f010babc <_Z8vcprintfPKcPc>
	va_end(ap);

	return cnt;
}
f010bb07:	c9                   	leave  
f010bb08:	c3                   	ret    

f010bb09 <_ZL5putchiPv>:
#include <inc/stdio.h>
#include <inc/stdarg.h>


static void
putch(int ch, void *thunk)
f010bb09:	55                   	push   %ebp
f010bb0a:	89 e5                	mov    %esp,%ebp
f010bb0c:	53                   	push   %ebx
f010bb0d:	83 ec 04             	sub    $0x4,%esp
f010bb10:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
	cputchar(ch);
f010bb13:	8b 45 08             	mov    0x8(%ebp),%eax
f010bb16:	89 04 24             	mov    %eax,(%esp)
f010bb19:	e8 3c dd ff ff       	call   f010985a <_Z8cputchari>
	int *cntptr = (int *) thunk;
	(*cntptr)++;
f010bb1e:	83 03 01             	addl   $0x1,(%ebx)
}
f010bb21:	83 c4 04             	add    $0x4,%esp
f010bb24:	5b                   	pop    %ebx
f010bb25:	5d                   	pop    %ebp
f010bb26:	c3                   	ret    
	...

f010bb28 <_ZL8trapnamei>:
struct Pseudodesc idt_pd = {
	sizeof(idt) - 1, (uint32_t) idt
};


static const char *trapname(int trapno)
f010bb28:	55                   	push   %ebp
f010bb29:	89 e5                	mov    %esp,%ebp
f010bb2b:	8b 55 08             	mov    0x8(%ebp),%edx
		"Alignment Check",
		"Machine-Check",
		"SIMD Floating-Point Exception"
	};

	if ((size_t) trapno < sizeof(excnames) / sizeof(excnames[0]))
f010bb2e:	83 fa 13             	cmp    $0x13,%edx
f010bb31:	77 09                	ja     f010bb3c <_ZL8trapnamei+0x14>
		return excnames[trapno];
f010bb33:	8b 04 95 e0 e0 10 f0 	mov    -0xfef1f20(,%edx,4),%eax
f010bb3a:	eb 0f                	jmp    f010bb4b <_ZL8trapnamei+0x23>
	if (trapno == T_SYSCALL)
f010bb3c:	b8 26 de 10 f0       	mov    $0xf010de26,%eax
f010bb41:	83 fa 30             	cmp    $0x30,%edx
f010bb44:	74 05                	je     f010bb4b <_ZL8trapnamei+0x23>
f010bb46:	b8 17 de 10 f0       	mov    $0xf010de17,%eax
		return "System call";

	return "(unknown trap)";
}
f010bb4b:	5d                   	pop    %ebp
f010bb4c:	c3                   	ret    

f010bb4d <_Z8idt_initv>:


void
idt_init(void)
f010bb4d:	55                   	push   %ebp
f010bb4e:	89 e5                	mov    %esp,%ebp
{
	extern struct Segdesc gdt[];
	// LAB 2: Your code here.
	//extern char* t_brkpt_lbl;
	extern char t_brkpt_lbl[];
	SETGATE(idt[3], 0, GD_KT, t_brkpt_lbl, 3);	
f010bb50:	b8 32 70 11 f0       	mov    $0xf0117032,%eax
f010bb55:	66 a3 b8 c3 11 f0    	mov    %ax,0xf011c3b8
f010bb5b:	66 c7 05 ba c3 11 f0 	movw   $0x8,0xf011c3ba
f010bb62:	08 00 
f010bb64:	c6 05 bc c3 11 f0 00 	movb   $0x0,0xf011c3bc
f010bb6b:	c6 05 bd c3 11 f0 ee 	movb   $0xee,0xf011c3bd
f010bb72:	c1 e8 10             	shr    $0x10,%eax
f010bb75:	66 a3 be c3 11 f0    	mov    %ax,0xf011c3be
	// Hint: Must this gate be accessible from userlevel?
	// LAB 3: Your code here.
	
	// Setup a TSS so that we get the right stack
	// when we trap to the kernel.
	ts.ts_esp0 = KSTACKTOP;
f010bb7b:	c7 05 a4 cb 11 f0 00 	movl   $0xf0000000,0xf011cba4
f010bb82:	00 00 f0 
	ts.ts_ss0 = GD_KD;
f010bb85:	66 c7 05 a8 cb 11 f0 	movw   $0x10,0xf011cba8
f010bb8c:	10 00 

	// Initialize the TSS field of the gdt.
	gdt[GD_TSS >> 3] = SEG16(STS_T32A, (uint32_t) (&ts),
					sizeof(struct Taskstate), 0);
f010bb8e:	66 c7 05 88 c3 11 f0 	movw   $0x68,0xf011c388
f010bb95:	68 00 
f010bb97:	b8 a0 cb 11 f0       	mov    $0xf011cba0,%eax
f010bb9c:	66 a3 8a c3 11 f0    	mov    %ax,0xf011c38a
f010bba2:	89 c2                	mov    %eax,%edx
f010bba4:	c1 ea 10             	shr    $0x10,%edx
f010bba7:	88 15 8c c3 11 f0    	mov    %dl,0xf011c38c
f010bbad:	c6 05 8e c3 11 f0 40 	movb   $0x40,0xf011c38e
f010bbb4:	c1 e8 18             	shr    $0x18,%eax
f010bbb7:	a2 8f c3 11 f0       	mov    %al,0xf011c38f
	gdt[GD_TSS >> 3].sd_s = 0;
f010bbbc:	c6 05 8d c3 11 f0 89 	movb   $0x89,0xf011c38d
}

static __inline void
ltr(uint16_t sel)
{
	__asm __volatile("ltr %0" : : "r" (sel));
f010bbc3:	b8 28 00 00 00       	mov    $0x28,%eax
f010bbc8:	0f 00 d8             	ltr    %ax

	// Load the TSS
	ltr(GD_TSS);

	// Load the IDT
	asm volatile("lidt idt_pd");
f010bbcb:	0f 01 1d 0c 70 11 f0 	lidtl  0xf011700c
}
f010bbd2:	5d                   	pop    %ebp
f010bbd3:	c3                   	ret    

f010bbd4 <_Z10print_regsP9Registers>:
	cprintf("  esp  0x%08x\n", tf->tf_esp);
	cprintf("  ss   0x----%04x\n", tf->tf_ss);
}

void
print_regs(struct Registers *regs)
f010bbd4:	55                   	push   %ebp
f010bbd5:	89 e5                	mov    %esp,%ebp
f010bbd7:	53                   	push   %ebx
f010bbd8:	83 ec 14             	sub    $0x14,%esp
f010bbdb:	8b 5d 08             	mov    0x8(%ebp),%ebx
{
	cprintf("  edi  0x%08x\n", regs->reg_edi);
f010bbde:	8b 03                	mov    (%ebx),%eax
f010bbe0:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bbe4:	c7 04 24 32 de 10 f0 	movl   $0xf010de32,(%esp)
f010bbeb:	e8 ff fe ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  esi  0x%08x\n", regs->reg_esi);
f010bbf0:	8b 43 04             	mov    0x4(%ebx),%eax
f010bbf3:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bbf7:	c7 04 24 41 de 10 f0 	movl   $0xf010de41,(%esp)
f010bbfe:	e8 ec fe ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  ebp  0x%08x\n", regs->reg_ebp);
f010bc03:	8b 43 08             	mov    0x8(%ebx),%eax
f010bc06:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bc0a:	c7 04 24 50 de 10 f0 	movl   $0xf010de50,(%esp)
f010bc11:	e8 d9 fe ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  oesp 0x%08x\n", regs->reg_oesp);
f010bc16:	8b 43 0c             	mov    0xc(%ebx),%eax
f010bc19:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bc1d:	c7 04 24 5f de 10 f0 	movl   $0xf010de5f,(%esp)
f010bc24:	e8 c6 fe ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  ebx  0x%08x\n", regs->reg_ebx);
f010bc29:	8b 43 10             	mov    0x10(%ebx),%eax
f010bc2c:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bc30:	c7 04 24 6e de 10 f0 	movl   $0xf010de6e,(%esp)
f010bc37:	e8 b3 fe ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  edx  0x%08x\n", regs->reg_edx);
f010bc3c:	8b 43 14             	mov    0x14(%ebx),%eax
f010bc3f:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bc43:	c7 04 24 7d de 10 f0 	movl   $0xf010de7d,(%esp)
f010bc4a:	e8 a0 fe ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  ecx  0x%08x\n", regs->reg_ecx);
f010bc4f:	8b 43 18             	mov    0x18(%ebx),%eax
f010bc52:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bc56:	c7 04 24 8c de 10 f0 	movl   $0xf010de8c,(%esp)
f010bc5d:	e8 8d fe ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  eax  0x%08x\n", regs->reg_eax);
f010bc62:	8b 43 1c             	mov    0x1c(%ebx),%eax
f010bc65:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bc69:	c7 04 24 9b de 10 f0 	movl   $0xf010de9b,(%esp)
f010bc70:	e8 7a fe ff ff       	call   f010baef <_Z7cprintfPKcz>
}
f010bc75:	83 c4 14             	add    $0x14,%esp
f010bc78:	5b                   	pop    %ebx
f010bc79:	5d                   	pop    %ebp
f010bc7a:	c3                   	ret    

f010bc7b <_Z15print_trapframeP9Trapframe>:
	asm volatile("lidt idt_pd");
}


void
print_trapframe(struct Trapframe *tf)
f010bc7b:	55                   	push   %ebp
f010bc7c:	89 e5                	mov    %esp,%ebp
f010bc7e:	56                   	push   %esi
f010bc7f:	53                   	push   %ebx
f010bc80:	83 ec 10             	sub    $0x10,%esp
f010bc83:	8b 5d 08             	mov    0x8(%ebp),%ebx
{
	cprintf("TRAP frame at %p\n", tf);
f010bc86:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010bc8a:	c7 04 24 aa de 10 f0 	movl   $0xf010deaa,(%esp)
f010bc91:	e8 59 fe ff ff       	call   f010baef <_Z7cprintfPKcz>
	print_regs(&tf->tf_regs);
f010bc96:	89 1c 24             	mov    %ebx,(%esp)
f010bc99:	e8 36 ff ff ff       	call   f010bbd4 <_Z10print_regsP9Registers>
	cprintf("  es   0x----%04x\n", tf->tf_es);
f010bc9e:	0f b7 43 20          	movzwl 0x20(%ebx),%eax
f010bca2:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bca6:	c7 04 24 bc de 10 f0 	movl   $0xf010debc,(%esp)
f010bcad:	e8 3d fe ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  ds   0x----%04x\n", tf->tf_ds);
f010bcb2:	0f b7 43 24          	movzwl 0x24(%ebx),%eax
f010bcb6:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bcba:	c7 04 24 cf de 10 f0 	movl   $0xf010decf,(%esp)
f010bcc1:	e8 29 fe ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
f010bcc6:	8b 73 28             	mov    0x28(%ebx),%esi
f010bcc9:	89 34 24             	mov    %esi,(%esp)
f010bccc:	e8 57 fe ff ff       	call   f010bb28 <_ZL8trapnamei>
f010bcd1:	89 44 24 08          	mov    %eax,0x8(%esp)
f010bcd5:	89 74 24 04          	mov    %esi,0x4(%esp)
f010bcd9:	c7 04 24 e2 de 10 f0 	movl   $0xf010dee2,(%esp)
f010bce0:	e8 0a fe ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  err  0x%08x\n", tf->tf_err);
f010bce5:	8b 43 2c             	mov    0x2c(%ebx),%eax
f010bce8:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bcec:	c7 04 24 f4 de 10 f0 	movl   $0xf010def4,(%esp)
f010bcf3:	e8 f7 fd ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  eip  0x%08x\n", tf->tf_eip);
f010bcf8:	8b 43 30             	mov    0x30(%ebx),%eax
f010bcfb:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bcff:	c7 04 24 03 df 10 f0 	movl   $0xf010df03,(%esp)
f010bd06:	e8 e4 fd ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  cs   0x----%04x\n", tf->tf_cs);
f010bd0b:	0f b7 43 34          	movzwl 0x34(%ebx),%eax
f010bd0f:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bd13:	c7 04 24 12 df 10 f0 	movl   $0xf010df12,(%esp)
f010bd1a:	e8 d0 fd ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  flag 0x%08x\n", tf->tf_eflags);
f010bd1f:	8b 43 38             	mov    0x38(%ebx),%eax
f010bd22:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bd26:	c7 04 24 25 df 10 f0 	movl   $0xf010df25,(%esp)
f010bd2d:	e8 bd fd ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  esp  0x%08x\n", tf->tf_esp);
f010bd32:	8b 43 3c             	mov    0x3c(%ebx),%eax
f010bd35:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bd39:	c7 04 24 34 df 10 f0 	movl   $0xf010df34,(%esp)
f010bd40:	e8 aa fd ff ff       	call   f010baef <_Z7cprintfPKcz>
	cprintf("  ss   0x----%04x\n", tf->tf_ss);
f010bd45:	0f b7 43 40          	movzwl 0x40(%ebx),%eax
f010bd49:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bd4d:	c7 04 24 43 df 10 f0 	movl   $0xf010df43,(%esp)
f010bd54:	e8 96 fd ff ff       	call   f010baef <_Z7cprintfPKcz>
}
f010bd59:	83 c4 10             	add    $0x10,%esp
f010bd5c:	5b                   	pop    %ebx
f010bd5d:	5e                   	pop    %esi
f010bd5e:	5d                   	pop    %ebp
f010bd5f:	c3                   	ret    

f010bd60 <trap>:
	cprintf("  eax  0x%08x\n", regs->reg_eax);
}

extern "C" {
void
trap(struct Trapframe *tf)
f010bd60:	55                   	push   %ebp
f010bd61:	89 e5                	mov    %esp,%ebp
f010bd63:	53                   	push   %ebx
f010bd64:	83 ec 14             	sub    $0x14,%esp
f010bd67:	8b 5d 08             	mov    0x8(%ebp),%ebx
{
	// Dispatch based on what type of trap occurred
	switch (tf->tf_trapno) {
f010bd6a:	83 7b 28 03          	cmpl   $0x3,0x28(%ebx)
f010bd6e:	75 0e                	jne    f010bd7e <trap+0x1e>

	// LAB 2: Your code here.
	case T_BRKPT:
		monitor(tf);
f010bd70:	89 1c 24             	mov    %ebx,(%esp)
f010bd73:	e8 1a dc ff ff       	call   f0109992 <_Z7monitorP9Trapframe>
		if (tf->tf_cs == GD_KT)
			panic("unhandled trap in kernel");
		else
			panic("unhandled trap in user mode");
	}
}
f010bd78:	83 c4 14             	add    $0x14,%esp
f010bd7b:	5b                   	pop    %ebx
f010bd7c:	5d                   	pop    %ebp
f010bd7d:	c3                   	ret    
	case T_BRKPT:
		monitor(tf);
		return;
	default:
		// Unexpected trap: The user process or the kernel has a bug.
		print_trapframe(tf);
f010bd7e:	89 1c 24             	mov    %ebx,(%esp)
f010bd81:	e8 f5 fe ff ff       	call   f010bc7b <_Z15print_trapframeP9Trapframe>
		if (tf->tf_cs == GD_KT)
f010bd86:	66 83 7b 34 08       	cmpw   $0x8,0x34(%ebx)
f010bd8b:	75 1c                	jne    f010bda9 <trap+0x49>
			panic("unhandled trap in kernel");
f010bd8d:	c7 44 24 08 56 df 10 	movl   $0xf010df56,0x8(%esp)
f010bd94:	f0 
f010bd95:	c7 44 24 04 81 00 00 	movl   $0x81,0x4(%esp)
f010bd9c:	00 
f010bd9d:	c7 04 24 6f df 10 f0 	movl   $0xf010df6f,(%esp)
f010bda4:	e8 b7 d2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
		else
			panic("unhandled trap in user mode");
f010bda9:	c7 44 24 08 7b df 10 	movl   $0xf010df7b,0x8(%esp)
f010bdb0:	f0 
f010bdb1:	c7 44 24 04 83 00 00 	movl   $0x83,0x4(%esp)
f010bdb8:	00 
f010bdb9:	c7 04 24 6f df 10 f0 	movl   $0xf010df6f,(%esp)
f010bdc0:	e8 9b d2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010bdc5:	00 00                	add    %al,(%eax)
	...

f010bdc8 <_alltraps>:
	jmp _alltraps

.data
.globl idttbl
idttbl: 
       TRAPHANDLER_NOEC(t_divide_lbl,T_DIVIDE)
f010bdc8:	1e                   	push   %ds
f010bdc9:	06                   	push   %es
f010bdca:	60                   	pusha  
f010bdcb:	66 b8 10 00          	mov    $0x10,%ax
f010bdcf:	8e d8                	mov    %eax,%ds
f010bdd1:	8e c0                	mov    %eax,%es
f010bdd3:	54                   	push   %esp
f010bdd4:	e8 87 ff ff ff       	call   f010bd60 <trap>
f010bdd9:	5c                   	pop    %esp
f010bdda:	61                   	popa   
f010bddb:	07                   	pop    %es
f010bddc:	1f                   	pop    %ds
f010bddd:	cf                   	iret   
	...

f010bde0 <_ZL14stab_binsearchPK4StabPiS2_ij>:
//		stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
//	will exit setting left = 118, right = 554.
//
static void
stab_binsearch(const struct Stab *stabs, int *region_left, int *region_right,
	       int type, uintptr_t addr)
f010bde0:	55                   	push   %ebp
f010bde1:	89 e5                	mov    %esp,%ebp
f010bde3:	57                   	push   %edi
f010bde4:	56                   	push   %esi
f010bde5:	53                   	push   %ebx
f010bde6:	83 ec 14             	sub    $0x14,%esp
f010bde9:	89 45 e8             	mov    %eax,-0x18(%ebp)
f010bdec:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f010bdef:	89 4d e0             	mov    %ecx,-0x20(%ebp)
f010bdf2:	8b 7d 08             	mov    0x8(%ebp),%edi
{
	int l = *region_left, r = *region_right, any_matches = 0;
f010bdf5:	8b 1a                	mov    (%edx),%ebx
f010bdf7:	8b 01                	mov    (%ecx),%eax
f010bdf9:	89 45 ec             	mov    %eax,-0x14(%ebp)
	
	while (l <= r) {
f010bdfc:	39 c3                	cmp    %eax,%ebx
f010bdfe:	0f 8f aa 00 00 00    	jg     f010beae <_ZL14stab_binsearchPK4StabPiS2_ij+0xce>
f010be04:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		int true_m = (l + r) / 2, m = true_m;
f010be0b:	8b 55 ec             	mov    -0x14(%ebp),%edx
f010be0e:	01 da                	add    %ebx,%edx
f010be10:	89 d0                	mov    %edx,%eax
f010be12:	c1 e8 1f             	shr    $0x1f,%eax
f010be15:	01 d0                	add    %edx,%eax
f010be17:	89 c6                	mov    %eax,%esi
f010be19:	d1 fe                	sar    %esi
		
		// search for earliest stab with right type
		while (m >= l && stabs[m].n_type != type)
f010be1b:	39 de                	cmp    %ebx,%esi
f010be1d:	7c 2b                	jl     f010be4a <_ZL14stab_binsearchPK4StabPiS2_ij+0x6a>
f010be1f:	8d 04 76             	lea    (%esi,%esi,2),%eax
f010be22:	8b 55 e8             	mov    -0x18(%ebp),%edx
f010be25:	0f b6 44 82 04       	movzbl 0x4(%edx,%eax,4),%eax
f010be2a:	39 f8                	cmp    %edi,%eax
f010be2c:	74 24                	je     f010be52 <_ZL14stab_binsearchPK4StabPiS2_ij+0x72>
f010be2e:	8d 04 76             	lea    (%esi,%esi,2),%eax
f010be31:	8d 54 82 f8          	lea    -0x8(%edx,%eax,4),%edx
f010be35:	89 f1                	mov    %esi,%ecx
			m--;
f010be37:	83 e9 01             	sub    $0x1,%ecx
	
	while (l <= r) {
		int true_m = (l + r) / 2, m = true_m;
		
		// search for earliest stab with right type
		while (m >= l && stabs[m].n_type != type)
f010be3a:	39 d9                	cmp    %ebx,%ecx
f010be3c:	7c 0c                	jl     f010be4a <_ZL14stab_binsearchPK4StabPiS2_ij+0x6a>
f010be3e:	0f b6 02             	movzbl (%edx),%eax
f010be41:	83 ea 0c             	sub    $0xc,%edx
f010be44:	39 f8                	cmp    %edi,%eax
f010be46:	75 ef                	jne    f010be37 <_ZL14stab_binsearchPK4StabPiS2_ij+0x57>
f010be48:	eb 0a                	jmp    f010be54 <_ZL14stab_binsearchPK4StabPiS2_ij+0x74>
			m--;
		if (m < l) {	// no match in [l, m]
			l = true_m + 1;
f010be4a:	8d 5e 01             	lea    0x1(%esi),%ebx
f010be4d:	8d 76 00             	lea    0x0(%esi),%esi
f010be50:	eb 4d                	jmp    f010be9f <_ZL14stab_binsearchPK4StabPiS2_ij+0xbf>
			continue;
f010be52:	89 f1                	mov    %esi,%ecx
		}

		// actual binary search
		any_matches = 1;
		if (stabs[m].n_value < addr) {
f010be54:	8d 04 49             	lea    (%ecx,%ecx,2),%eax
f010be57:	8b 55 e8             	mov    -0x18(%ebp),%edx
f010be5a:	8b 44 82 08          	mov    0x8(%edx,%eax,4),%eax
f010be5e:	3b 45 0c             	cmp    0xc(%ebp),%eax
f010be61:	73 11                	jae    f010be74 <_ZL14stab_binsearchPK4StabPiS2_ij+0x94>
			*region_left = m;
f010be63:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f010be66:	89 08                	mov    %ecx,(%eax)
			l = true_m + 1;
f010be68:	8d 5e 01             	lea    0x1(%esi),%ebx
f010be6b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
f010be72:	eb 2b                	jmp    f010be9f <_ZL14stab_binsearchPK4StabPiS2_ij+0xbf>
		} else if (stabs[m].n_value > addr) {
f010be74:	3b 45 0c             	cmp    0xc(%ebp),%eax
f010be77:	76 14                	jbe    f010be8d <_ZL14stab_binsearchPK4StabPiS2_ij+0xad>
			*region_right = m - 1;
f010be79:	83 e9 01             	sub    $0x1,%ecx
f010be7c:	89 4d ec             	mov    %ecx,-0x14(%ebp)
f010be7f:	8b 55 e0             	mov    -0x20(%ebp),%edx
f010be82:	89 0a                	mov    %ecx,(%edx)
f010be84:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
f010be8b:	eb 12                	jmp    f010be9f <_ZL14stab_binsearchPK4StabPiS2_ij+0xbf>
			r = m - 1;
		} else {
			// exact match for 'addr', but continue loop to find
			// *region_right
			*region_left = m;
f010be8d:	8b 75 e4             	mov    -0x1c(%ebp),%esi
f010be90:	89 0e                	mov    %ecx,(%esi)
			l = m;
			addr++;
f010be92:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
f010be96:	89 cb                	mov    %ecx,%ebx
f010be98:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
stab_binsearch(const struct Stab *stabs, int *region_left, int *region_right,
	       int type, uintptr_t addr)
{
	int l = *region_left, r = *region_right, any_matches = 0;
	
	while (l <= r) {
f010be9f:	39 5d ec             	cmp    %ebx,-0x14(%ebp)
f010bea2:	0f 8d 63 ff ff ff    	jge    f010be0b <_ZL14stab_binsearchPK4StabPiS2_ij+0x2b>
			l = m;
			addr++;
		}
	}

	if (!any_matches)
f010bea8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
f010beac:	75 0f                	jne    f010bebd <_ZL14stab_binsearchPK4StabPiS2_ij+0xdd>
		*region_right = *region_left - 1;
f010beae:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010beb1:	8b 02                	mov    (%edx),%eax
f010beb3:	83 e8 01             	sub    $0x1,%eax
f010beb6:	8b 4d e0             	mov    -0x20(%ebp),%ecx
f010beb9:	89 01                	mov    %eax,(%ecx)
f010bebb:	eb 3a                	jmp    f010bef7 <_ZL14stab_binsearchPK4StabPiS2_ij+0x117>
	else {
		// find rightmost region containing 'addr'
		for (l = *region_right;
f010bebd:	8b 75 e0             	mov    -0x20(%ebp),%esi
f010bec0:	8b 0e                	mov    (%esi),%ecx
f010bec2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f010bec5:	8b 18                	mov    (%eax),%ebx
f010bec7:	39 d9                	cmp    %ebx,%ecx
f010bec9:	7e 27                	jle    f010bef2 <_ZL14stab_binsearchPK4StabPiS2_ij+0x112>
f010becb:	8d 04 49             	lea    (%ecx,%ecx,2),%eax
f010bece:	8b 55 e8             	mov    -0x18(%ebp),%edx
f010bed1:	0f b6 44 82 04       	movzbl 0x4(%edx,%eax,4),%eax
f010bed6:	39 f8                	cmp    %edi,%eax
f010bed8:	74 18                	je     f010bef2 <_ZL14stab_binsearchPK4StabPiS2_ij+0x112>
f010beda:	8d 04 49             	lea    (%ecx,%ecx,2),%eax
f010bedd:	8d 54 82 f8          	lea    -0x8(%edx,%eax,4),%edx
f010bee1:	83 e9 01             	sub    $0x1,%ecx
f010bee4:	39 d9                	cmp    %ebx,%ecx
f010bee6:	7e 0a                	jle    f010bef2 <_ZL14stab_binsearchPK4StabPiS2_ij+0x112>
f010bee8:	0f b6 02             	movzbl (%edx),%eax
f010beeb:	83 ea 0c             	sub    $0xc,%edx
f010beee:	39 f8                	cmp    %edi,%eax
f010bef0:	75 ef                	jne    f010bee1 <_ZL14stab_binsearchPK4StabPiS2_ij+0x101>
		     l > *region_left && stabs[l].n_type != type;
		     l--)
			/* do nothing */;
		*region_left = l;
f010bef2:	8b 75 e4             	mov    -0x1c(%ebp),%esi
f010bef5:	89 0e                	mov    %ecx,(%esi)
	}
}
f010bef7:	83 c4 14             	add    $0x14,%esp
f010befa:	5b                   	pop    %ebx
f010befb:	5e                   	pop    %esi
f010befc:	5f                   	pop    %edi
f010befd:	5d                   	pop    %ebp
f010befe:	c3                   	ret    

f010beff <_Z13debuginfo_eipjP12Eipdebuginfo>:
//	instruction address, 'addr'.  Returns 0 if information was found, and
//	negative if not.  But even if it returns negative it has stored some
//	information into '*info'.
//
int
debuginfo_eip(uintptr_t addr, struct Eipdebuginfo *info)
f010beff:	55                   	push   %ebp
f010bf00:	89 e5                	mov    %esp,%ebp
f010bf02:	83 ec 38             	sub    $0x38,%esp
f010bf05:	89 5d f8             	mov    %ebx,-0x8(%ebp)
f010bf08:	89 75 fc             	mov    %esi,-0x4(%ebp)
f010bf0b:	8b 5d 08             	mov    0x8(%ebp),%ebx
f010bf0e:	8b 75 0c             	mov    0xc(%ebp),%esi
	const struct Stab *stabs, *stab_end;
	const char *stabstr, *stabstr_end;
	int lfile, rfile, lfun, rfun, lline, rline;

	// Initialize *info
	info->eip_file = "<unknown>";
f010bf11:	c7 06 30 e1 10 f0    	movl   $0xf010e130,(%esi)
	info->eip_line = 0;
f010bf17:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
	info->eip_fn_name = "<unknown>";
f010bf1e:	c7 46 08 30 e1 10 f0 	movl   $0xf010e130,0x8(%esi)
	info->eip_fn_namelen = 9;
f010bf25:	c7 46 0c 09 00 00 00 	movl   $0x9,0xc(%esi)
	info->eip_fn_addr = addr;
f010bf2c:	89 5e 10             	mov    %ebx,0x10(%esi)
	info->eip_fn_narg = 0;
f010bf2f:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)

	// Find the relevant set of stabs
	if (addr >= ULIM) {
f010bf36:	81 fb ff ff bf ef    	cmp    $0xefbfffff,%ebx
f010bf3c:	76 12                	jbe    f010bf50 <_Z13debuginfo_eipjP12Eipdebuginfo+0x51>
		// Can't search for user-level addresses yet!
  	        panic("User address");
	}

	// String table validity checks
	if (stabstr_end <= stabstr || stabstr_end[-1] != 0)
f010bf3e:	b8 df 69 11 f0       	mov    $0xf01169df,%eax
f010bf43:	3d 3d 3e 11 f0       	cmp    $0xf0113e3d,%eax
f010bf48:	0f 86 df 01 00 00    	jbe    f010c12d <_Z13debuginfo_eipjP12Eipdebuginfo+0x22e>
f010bf4e:	eb 1c                	jmp    f010bf6c <_Z13debuginfo_eipjP12Eipdebuginfo+0x6d>
		stab_end = __STAB_END__;
		stabstr = __STABSTR_BEGIN__;
		stabstr_end = __STABSTR_END__;
	} else {
		// Can't search for user-level addresses yet!
  	        panic("User address");
f010bf50:	c7 44 24 08 3a e1 10 	movl   $0xf010e13a,0x8(%esp)
f010bf57:	f0 
f010bf58:	c7 44 24 04 7f 00 00 	movl   $0x7f,0x4(%esp)
f010bf5f:	00 
f010bf60:	c7 04 24 47 e1 10 f0 	movl   $0xf010e147,(%esp)
f010bf67:	e8 f4 d0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	}

	// String table validity checks
	if (stabstr_end <= stabstr || stabstr_end[-1] != 0)
f010bf6c:	80 3d de 69 11 f0 00 	cmpb   $0x0,0xf01169de
f010bf73:	0f 85 b4 01 00 00    	jne    f010c12d <_Z13debuginfo_eipjP12Eipdebuginfo+0x22e>
	// 'eip'.  First, we find the basic source file containing 'eip'.
	// Then, we look in that source file for the function.  Then we look
	// for the line number.
	
	// Search the entire set of stabs for the source file (type N_SO).
	lfile = 0;
f010bf79:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	rfile = (stab_end - stabs) - 1;
f010bf80:	b8 3c 3e 11 f0       	mov    $0xf0113e3c,%eax
f010bf85:	2d 64 e3 10 f0       	sub    $0xf010e364,%eax
f010bf8a:	c1 f8 02             	sar    $0x2,%eax
f010bf8d:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
f010bf93:	83 e8 01             	sub    $0x1,%eax
f010bf96:	89 45 f0             	mov    %eax,-0x10(%ebp)
	stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
f010bf99:	8d 4d f0             	lea    -0x10(%ebp),%ecx
f010bf9c:	8d 55 f4             	lea    -0xc(%ebp),%edx
f010bf9f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010bfa3:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
f010bfaa:	b8 64 e3 10 f0       	mov    $0xf010e364,%eax
f010bfaf:	e8 2c fe ff ff       	call   f010bde0 <_ZL14stab_binsearchPK4StabPiS2_ij>
	if (lfile == 0)
f010bfb4:	8b 55 f4             	mov    -0xc(%ebp),%edx
f010bfb7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f010bfbc:	85 d2                	test   %edx,%edx
f010bfbe:	0f 84 7b 01 00 00    	je     f010c13f <_Z13debuginfo_eipjP12Eipdebuginfo+0x240>
		return -1;

	// Search within that file's stabs for the function definition
	// (N_FUN).
	lfun = lfile;
f010bfc4:	89 55 ec             	mov    %edx,-0x14(%ebp)
	rfun = rfile;
f010bfc7:	8b 45 f0             	mov    -0x10(%ebp),%eax
f010bfca:	89 45 e8             	mov    %eax,-0x18(%ebp)
	stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
f010bfcd:	8d 4d e8             	lea    -0x18(%ebp),%ecx
f010bfd0:	8d 55 ec             	lea    -0x14(%ebp),%edx
f010bfd3:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010bfd7:	c7 04 24 24 00 00 00 	movl   $0x24,(%esp)
f010bfde:	b8 64 e3 10 f0       	mov    $0xf010e364,%eax
f010bfe3:	e8 f8 fd ff ff       	call   f010bde0 <_ZL14stab_binsearchPK4StabPiS2_ij>

	if (lfun <= rfun) {
f010bfe8:	8b 45 ec             	mov    -0x14(%ebp),%eax
f010bfeb:	3b 45 e8             	cmp    -0x18(%ebp),%eax
f010bfee:	7f 3e                	jg     f010c02e <_Z13debuginfo_eipjP12Eipdebuginfo+0x12f>
		// stabs[lfun] points to the function name
		// in the string table, but check bounds just in case.
		if (stabs[lfun].n_strx < (uint32_t) (stabstr_end - stabstr))
f010bff0:	8d 04 40             	lea    (%eax,%eax,2),%eax
f010bff3:	8b 14 85 64 e3 10 f0 	mov    -0xfef1c9c(,%eax,4),%edx
f010bffa:	b8 df 69 11 f0       	mov    $0xf01169df,%eax
f010bfff:	2d 3d 3e 11 f0       	sub    $0xf0113e3d,%eax
f010c004:	39 c2                	cmp    %eax,%edx
f010c006:	73 09                	jae    f010c011 <_Z13debuginfo_eipjP12Eipdebuginfo+0x112>
			info->eip_fn_name = stabstr + stabs[lfun].n_strx;
f010c008:	8d 82 3d 3e 11 f0    	lea    -0xfeec1c3(%edx),%eax
f010c00e:	89 46 08             	mov    %eax,0x8(%esi)
		info->eip_fn_addr = stabs[lfun].n_value;
f010c011:	8b 55 ec             	mov    -0x14(%ebp),%edx
f010c014:	8d 04 52             	lea    (%edx,%edx,2),%eax
f010c017:	8b 04 85 6c e3 10 f0 	mov    -0xfef1c94(,%eax,4),%eax
f010c01e:	89 46 10             	mov    %eax,0x10(%esi)
		addr -= info->eip_fn_addr;
f010c021:	29 c3                	sub    %eax,%ebx
		// Search within the function definition for the line number.
		lline = lfun;
f010c023:	89 55 e4             	mov    %edx,-0x1c(%ebp)
		rline = rfun;
f010c026:	8b 45 e8             	mov    -0x18(%ebp),%eax
f010c029:	89 45 e0             	mov    %eax,-0x20(%ebp)
f010c02c:	eb 0f                	jmp    f010c03d <_Z13debuginfo_eipjP12Eipdebuginfo+0x13e>
	} else {
		// Couldn't find function stab!  Maybe we're in an assembly
		// file.  Search the whole file for the line number.
		info->eip_fn_addr = addr;
f010c02e:	89 5e 10             	mov    %ebx,0x10(%esi)
		lline = lfile;
f010c031:	8b 45 f4             	mov    -0xc(%ebp),%eax
f010c034:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		rline = rfile;
f010c037:	8b 45 f0             	mov    -0x10(%ebp),%eax
f010c03a:	89 45 e0             	mov    %eax,-0x20(%ebp)
	}
	// Ignore stuff after the colon.
	info->eip_fn_namelen =
		strfind(info->eip_fn_name, ':') - info->eip_fn_name;
f010c03d:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
f010c044:	00 
f010c045:	8b 46 08             	mov    0x8(%esi),%eax
f010c048:	89 04 24             	mov    %eax,(%esp)
f010c04b:	e8 e9 09 00 00       	call   f010ca39 <_Z7strfindPKcc>
f010c050:	2b 46 08             	sub    0x8(%esi),%eax
f010c053:	89 46 0c             	mov    %eax,0xc(%esi)
	// Hint:
	//	There's a particular stabs type used for line numbers.
	//	Look at the STABS documentation and <inc/stab.h> to find
	//	which one.
	// Your code here.
	stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
f010c056:	8d 4d e0             	lea    -0x20(%ebp),%ecx
f010c059:	8d 55 e4             	lea    -0x1c(%ebp),%edx
f010c05c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010c060:	c7 04 24 44 00 00 00 	movl   $0x44,(%esp)
f010c067:	b8 64 e3 10 f0       	mov    $0xf010e364,%eax
f010c06c:	e8 6f fd ff ff       	call   f010bde0 <_ZL14stab_binsearchPK4StabPiS2_ij>
     	if(lline <= rline)
f010c071:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010c074:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f010c079:	3b 55 e0             	cmp    -0x20(%ebp),%edx
f010c07c:	0f 8f bd 00 00 00    	jg     f010c13f <_Z13debuginfo_eipjP12Eipdebuginfo+0x240>
              info->eip_line = stabs[lline].n_desc;
f010c082:	8d 04 52             	lea    (%edx,%edx,2),%eax
f010c085:	0f b7 04 85 6a e3 10 	movzwl -0xfef1c96(,%eax,4),%eax
f010c08c:	f0 
f010c08d:	89 46 04             	mov    %eax,0x4(%esi)
	// Search backwards from the line number for the relevant filename
	// stab.
	// We can't just use the "lfile" stab because inlined functions
	// can interpolate code from a different file!
	// Such included source files use the N_SOL stab type.
	while (lline >= lfile
f010c090:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010c093:	39 55 f4             	cmp    %edx,-0xc(%ebp)
f010c096:	7f 52                	jg     f010c0ea <_Z13debuginfo_eipjP12Eipdebuginfo+0x1eb>
f010c098:	8d 04 52             	lea    (%edx,%edx,2),%eax
f010c09b:	8d 1c 85 64 e3 10 f0 	lea    -0xfef1c9c(,%eax,4),%ebx
f010c0a2:	0f b6 4b 04          	movzbl 0x4(%ebx),%ecx
f010c0a6:	8d 04 85 58 e3 10 f0 	lea    -0xfef1ca8(,%eax,4),%eax
f010c0ad:	80 f9 84             	cmp    $0x84,%cl
f010c0b0:	75 1e                	jne    f010c0d0 <_Z13debuginfo_eipjP12Eipdebuginfo+0x1d1>
f010c0b2:	e9 92 00 00 00       	jmp    f010c149 <_Z13debuginfo_eipjP12Eipdebuginfo+0x24a>
	       && stabs[lline].n_type != N_SOL
	       && (stabs[lline].n_type != N_SO || !stabs[lline].n_value))
		lline--;
f010c0b7:	83 ea 01             	sub    $0x1,%edx
f010c0ba:	89 55 e4             	mov    %edx,-0x1c(%ebp)
	// Search backwards from the line number for the relevant filename
	// stab.
	// We can't just use the "lfile" stab because inlined functions
	// can interpolate code from a different file!
	// Such included source files use the N_SOL stab type.
	while (lline >= lfile
f010c0bd:	39 55 f4             	cmp    %edx,-0xc(%ebp)
f010c0c0:	7f 28                	jg     f010c0ea <_Z13debuginfo_eipjP12Eipdebuginfo+0x1eb>
f010c0c2:	89 c3                	mov    %eax,%ebx
f010c0c4:	0f b6 48 04          	movzbl 0x4(%eax),%ecx
f010c0c8:	83 e8 0c             	sub    $0xc,%eax
f010c0cb:	80 f9 84             	cmp    $0x84,%cl
f010c0ce:	74 79                	je     f010c149 <_Z13debuginfo_eipjP12Eipdebuginfo+0x24a>
f010c0d0:	80 f9 64             	cmp    $0x64,%cl
f010c0d3:	75 e2                	jne    f010c0b7 <_Z13debuginfo_eipjP12Eipdebuginfo+0x1b8>
f010c0d5:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
f010c0d9:	74 dc                	je     f010c0b7 <_Z13debuginfo_eipjP12Eipdebuginfo+0x1b8>
f010c0db:	90                   	nop    
f010c0dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010c0e0:	eb 67                	jmp    f010c149 <_Z13debuginfo_eipjP12Eipdebuginfo+0x24a>
	       && stabs[lline].n_type != N_SOL
	       && (stabs[lline].n_type != N_SO || !stabs[lline].n_value))
		lline--;
	if (lline >= lfile
	    && stabs[lline].n_strx < (uint32_t) (stabstr_end - stabstr))
		info->eip_file = stabstr + stabs[lline].n_strx;
f010c0e2:	8d 82 3d 3e 11 f0    	lea    -0xfeec1c3(%edx),%eax
f010c0e8:	89 06                	mov    %eax,(%esi)


	// Set eip_fn_narg to the number of arguments taken by the function,
	// or 0 if there was no containing function.
	// Your code here.
 	if (lfun < rfun)
f010c0ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
f010c0ed:	3b 45 e8             	cmp    -0x18(%ebp),%eax
f010c0f0:	7d 48                	jge    f010c13a <_Z13debuginfo_eipjP12Eipdebuginfo+0x23b>
   	for (lline = lfun + 1; lline < rfun && stabs[lline].n_type == N_PSYM; lline++)
f010c0f2:	83 c0 01             	add    $0x1,%eax
f010c0f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010c0f8:	39 45 e8             	cmp    %eax,-0x18(%ebp)
f010c0fb:	7e 3d                	jle    f010c13a <_Z13debuginfo_eipjP12Eipdebuginfo+0x23b>
f010c0fd:	8d 04 40             	lea    (%eax,%eax,2),%eax
f010c100:	80 3c 85 68 e3 10 f0 	cmpb   $0xa0,-0xfef1c98(,%eax,4)
f010c107:	a0 
f010c108:	75 30                	jne    f010c13a <_Z13debuginfo_eipjP12Eipdebuginfo+0x23b>
f010c10a:	ba 64 e3 10 f0       	mov    $0xf010e364,%edx
	    info->eip_fn_narg++;
f010c10f:	83 46 14 01          	addl   $0x1,0x14(%esi)

	// Set eip_fn_narg to the number of arguments taken by the function,
	// or 0 if there was no containing function.
	// Your code here.
 	if (lfun < rfun)
   	for (lline = lfun + 1; lline < rfun && stabs[lline].n_type == N_PSYM; lline++)
f010c113:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f010c116:	83 c0 01             	add    $0x1,%eax
f010c119:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010c11c:	39 45 e8             	cmp    %eax,-0x18(%ebp)
f010c11f:	7e 19                	jle    f010c13a <_Z13debuginfo_eipjP12Eipdebuginfo+0x23b>
f010c121:	8d 04 40             	lea    (%eax,%eax,2),%eax
f010c124:	80 7c 82 04 a0       	cmpb   $0xa0,0x4(%edx,%eax,4)
f010c129:	74 e4                	je     f010c10f <_Z13debuginfo_eipjP12Eipdebuginfo+0x210>
f010c12b:	eb 0d                	jmp    f010c13a <_Z13debuginfo_eipjP12Eipdebuginfo+0x23b>
f010c12d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f010c132:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010c138:	eb 05                	jmp    f010c13f <_Z13debuginfo_eipjP12Eipdebuginfo+0x240>
f010c13a:	b8 00 00 00 00       	mov    $0x0,%eax
	    info->eip_fn_narg++;
	return 0;
}
f010c13f:	8b 5d f8             	mov    -0x8(%ebp),%ebx
f010c142:	8b 75 fc             	mov    -0x4(%ebp),%esi
f010c145:	89 ec                	mov    %ebp,%esp
f010c147:	5d                   	pop    %ebp
f010c148:	c3                   	ret    
	// Such included source files use the N_SOL stab type.
	while (lline >= lfile
	       && stabs[lline].n_type != N_SOL
	       && (stabs[lline].n_type != N_SO || !stabs[lline].n_value))
		lline--;
	if (lline >= lfile
f010c149:	8d 04 52             	lea    (%edx,%edx,2),%eax
f010c14c:	8b 14 85 64 e3 10 f0 	mov    -0xfef1c9c(,%eax,4),%edx
f010c153:	b8 df 69 11 f0       	mov    $0xf01169df,%eax
f010c158:	2d 3d 3e 11 f0       	sub    $0xf0113e3d,%eax
f010c15d:	39 c2                	cmp    %eax,%edx
f010c15f:	72 81                	jb     f010c0e2 <_Z13debuginfo_eipjP12Eipdebuginfo+0x1e3>
f010c161:	eb 87                	jmp    f010c0ea <_Z13debuginfo_eipjP12Eipdebuginfo+0x1eb>
	...

f010c170 <_ZL8printnumPFviPvES_yjii>:
 * Print a number (base <= 16) in reverse order,
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
f010c170:	55                   	push   %ebp
f010c171:	89 e5                	mov    %esp,%ebp
f010c173:	57                   	push   %edi
f010c174:	56                   	push   %esi
f010c175:	53                   	push   %ebx
f010c176:	83 ec 3c             	sub    $0x3c,%esp
f010c179:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010c17c:	89 d7                	mov    %edx,%edi
f010c17e:	8b 45 08             	mov    0x8(%ebp),%eax
f010c181:	8b 55 0c             	mov    0xc(%ebp),%edx
f010c184:	89 45 d8             	mov    %eax,-0x28(%ebp)
f010c187:	89 55 dc             	mov    %edx,-0x24(%ebp)
f010c18a:	8b 55 10             	mov    0x10(%ebp),%edx
f010c18d:	8b 75 18             	mov    0x18(%ebp),%esi
{
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
f010c190:	89 55 e8             	mov    %edx,-0x18(%ebp)
f010c193:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
f010c19a:	8b 45 dc             	mov    -0x24(%ebp),%eax
f010c19d:	39 45 ec             	cmp    %eax,-0x14(%ebp)
f010c1a0:	72 16                	jb     f010c1b8 <_ZL8printnumPFviPvES_yjii+0x48>
f010c1a2:	77 08                	ja     f010c1ac <_ZL8printnumPFviPvES_yjii+0x3c>
f010c1a4:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010c1a7:	39 45 e8             	cmp    %eax,-0x18(%ebp)
f010c1aa:	76 0c                	jbe    f010c1b8 <_ZL8printnumPFviPvES_yjii+0x48>
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
f010c1ac:	8b 5d 14             	mov    0x14(%ebp),%ebx
f010c1af:	83 eb 01             	sub    $0x1,%ebx
f010c1b2:	85 db                	test   %ebx,%ebx
f010c1b4:	7f 57                	jg     f010c20d <_ZL8printnumPFviPvES_yjii+0x9d>
f010c1b6:	eb 6a                	jmp    f010c222 <_ZL8printnumPFviPvES_yjii+0xb2>
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
f010c1b8:	89 74 24 10          	mov    %esi,0x10(%esp)
f010c1bc:	8b 45 14             	mov    0x14(%ebp),%eax
f010c1bf:	83 e8 01             	sub    $0x1,%eax
f010c1c2:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c1c6:	89 54 24 08          	mov    %edx,0x8(%esp)
f010c1ca:	8b 5c 24 08          	mov    0x8(%esp),%ebx
f010c1ce:	8b 74 24 0c          	mov    0xc(%esp),%esi
f010c1d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
f010c1d5:	8b 55 ec             	mov    -0x14(%ebp),%edx
f010c1d8:	89 44 24 08          	mov    %eax,0x8(%esp)
f010c1dc:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010c1e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010c1e3:	8b 55 dc             	mov    -0x24(%ebp),%edx
f010c1e6:	89 04 24             	mov    %eax,(%esp)
f010c1e9:	89 54 24 04          	mov    %edx,0x4(%esp)
f010c1ed:	e8 ce 0a 00 00       	call   f010ccc0 <__udivdi3>
f010c1f2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
f010c1f6:	89 74 24 0c          	mov    %esi,0xc(%esp)
f010c1fa:	89 04 24             	mov    %eax,(%esp)
f010c1fd:	89 54 24 04          	mov    %edx,0x4(%esp)
f010c201:	89 fa                	mov    %edi,%edx
f010c203:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f010c206:	e8 65 ff ff ff       	call   f010c170 <_ZL8printnumPFviPvES_yjii>
f010c20b:	eb 15                	jmp    f010c222 <_ZL8printnumPFviPvES_yjii+0xb2>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
f010c20d:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010c211:	89 34 24             	mov    %esi,(%esp)
f010c214:	ff 55 e4             	call   *-0x1c(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
f010c217:	83 eb 01             	sub    $0x1,%ebx
f010c21a:	85 db                	test   %ebx,%ebx
f010c21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010c220:	7f eb                	jg     f010c20d <_ZL8printnumPFviPvES_yjii+0x9d>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
f010c222:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010c226:	8b 74 24 04          	mov    0x4(%esp),%esi
f010c22a:	8b 45 e8             	mov    -0x18(%ebp),%eax
f010c22d:	8b 55 ec             	mov    -0x14(%ebp),%edx
f010c230:	89 44 24 08          	mov    %eax,0x8(%esp)
f010c234:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010c238:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010c23b:	8b 55 dc             	mov    -0x24(%ebp),%edx
f010c23e:	89 04 24             	mov    %eax,(%esp)
f010c241:	89 54 24 04          	mov    %edx,0x4(%esp)
f010c245:	e8 a6 0b 00 00       	call   f010cdf0 <__umoddi3>
f010c24a:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c24e:	0f be 80 55 e1 10 f0 	movsbl -0xfef1eab(%eax),%eax
f010c255:	89 04 24             	mov    %eax,(%esp)
f010c258:	ff 55 e4             	call   *-0x1c(%ebp)
}
f010c25b:	83 c4 3c             	add    $0x3c,%esp
f010c25e:	5b                   	pop    %ebx
f010c25f:	5e                   	pop    %esi
f010c260:	5f                   	pop    %edi
f010c261:	5d                   	pop    %ebp
f010c262:	c3                   	ret    

f010c263 <_ZL7getuintPPci>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
f010c263:	55                   	push   %ebp
f010c264:	89 e5                	mov    %esp,%ebp
f010c266:	89 c1                	mov    %eax,%ecx
{
	if (lflag >= 2)
f010c268:	83 fa 01             	cmp    $0x1,%edx
f010c26b:	7e 0f                	jle    f010c27c <_ZL7getuintPPci+0x19>
		return va_arg(*ap, unsigned long long);
f010c26d:	8b 00                	mov    (%eax),%eax
f010c26f:	83 c0 08             	add    $0x8,%eax
f010c272:	89 01                	mov    %eax,(%ecx)
f010c274:	8b 50 fc             	mov    -0x4(%eax),%edx
f010c277:	8b 40 f8             	mov    -0x8(%eax),%eax
f010c27a:	eb 24                	jmp    f010c2a0 <_ZL7getuintPPci+0x3d>
	else if (lflag)
f010c27c:	85 d2                	test   %edx,%edx
f010c27e:	74 11                	je     f010c291 <_ZL7getuintPPci+0x2e>
		return va_arg(*ap, unsigned long);
f010c280:	8b 00                	mov    (%eax),%eax
f010c282:	83 c0 04             	add    $0x4,%eax
f010c285:	89 01                	mov    %eax,(%ecx)
f010c287:	8b 40 fc             	mov    -0x4(%eax),%eax
f010c28a:	ba 00 00 00 00       	mov    $0x0,%edx
f010c28f:	eb 0f                	jmp    f010c2a0 <_ZL7getuintPPci+0x3d>
	else
		return va_arg(*ap, unsigned int);
f010c291:	8b 00                	mov    (%eax),%eax
f010c293:	83 c0 04             	add    $0x4,%eax
f010c296:	89 01                	mov    %eax,(%ecx)
f010c298:	8b 40 fc             	mov    -0x4(%eax),%eax
f010c29b:	ba 00 00 00 00       	mov    $0x0,%edx
}
f010c2a0:	5d                   	pop    %ebp
f010c2a1:	c3                   	ret    

f010c2a2 <_ZL11sprintputchiPv>:
	char *ebuf;
	int cnt;
};

static void
sprintputch(int ch, void *thunk)
f010c2a2:	55                   	push   %ebp
f010c2a3:	89 e5                	mov    %esp,%ebp
{
	struct sprintbuf *b = (struct sprintbuf *) thunk;
f010c2a5:	8b 55 0c             	mov    0xc(%ebp),%edx
	b->cnt++;
f010c2a8:	83 42 08 01          	addl   $0x1,0x8(%edx)
	if (b->buf < b->ebuf)
f010c2ac:	8b 02                	mov    (%edx),%eax
f010c2ae:	3b 42 04             	cmp    0x4(%edx),%eax
f010c2b1:	73 0b                	jae    f010c2be <_ZL11sprintputchiPv+0x1c>
		*b->buf++ = ch;
f010c2b3:	0f b6 4d 08          	movzbl 0x8(%ebp),%ecx
f010c2b7:	88 08                	mov    %cl,(%eax)
f010c2b9:	83 c0 01             	add    $0x1,%eax
f010c2bc:	89 02                	mov    %eax,(%edx)
}
f010c2be:	5d                   	pop    %ebp
f010c2bf:	c3                   	ret    

f010c2c0 <_Z9vprintfmtPFviPvES_PKcPc>:

// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
f010c2c0:	55                   	push   %ebp
f010c2c1:	89 e5                	mov    %esp,%ebp
f010c2c3:	57                   	push   %edi
f010c2c4:	56                   	push   %esi
f010c2c5:	53                   	push   %ebx
f010c2c6:	83 ec 4c             	sub    $0x4c,%esp
f010c2c9:	8b 75 0c             	mov    0xc(%ebp),%esi
f010c2cc:	8b 5d 10             	mov    0x10(%ebp),%ebx
f010c2cf:	eb 03                	jmp    f010c2d4 <_Z9vprintfmtPFviPvES_PKcPc+0x14>
f010c2d1:	8b 5d e8             	mov    -0x18(%ebp),%ebx
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
f010c2d4:	0f b6 03             	movzbl (%ebx),%eax
f010c2d7:	83 c3 01             	add    $0x1,%ebx
f010c2da:	83 f8 25             	cmp    $0x25,%eax
f010c2dd:	74 2f                	je     f010c30e <_Z9vprintfmtPFviPvES_PKcPc+0x4e>
			if (ch == '\0')
f010c2df:	85 c0                	test   %eax,%eax
f010c2e1:	75 13                	jne    f010c2f6 <_Z9vprintfmtPFviPvES_PKcPc+0x36>
f010c2e3:	e9 0e 04 00 00       	jmp    f010c6f6 <_Z9vprintfmtPFviPvES_PKcPc+0x436>
f010c2e8:	85 c0                	test   %eax,%eax
f010c2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010c2f0:	0f 84 00 04 00 00    	je     f010c6f6 <_Z9vprintfmtPFviPvES_PKcPc+0x436>
				return;
			putch(ch, putdat);
f010c2f6:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c2fa:	89 04 24             	mov    %eax,(%esp)
f010c2fd:	8d 76 00             	lea    0x0(%esi),%esi
f010c300:	ff 55 08             	call   *0x8(%ebp)
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
f010c303:	0f b6 03             	movzbl (%ebx),%eax
f010c306:	83 c3 01             	add    $0x1,%ebx
f010c309:	83 f8 25             	cmp    $0x25,%eax
f010c30c:	75 da                	jne    f010c2e8 <_Z9vprintfmtPFviPvES_PKcPc+0x28>
f010c30e:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
f010c315:	bf ff ff ff ff       	mov    $0xffffffff,%edi
f010c31a:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
f010c321:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
f010c328:	c6 45 df 20          	movb   $0x20,-0x21(%ebp)
f010c32c:	eb 07                	jmp    f010c335 <_Z9vprintfmtPFviPvES_PKcPc+0x75>
f010c32e:	c6 45 df 2d          	movb   $0x2d,-0x21(%ebp)
f010c332:	8b 5d e8             	mov    -0x18(%ebp),%ebx
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
f010c335:	0f b6 03             	movzbl (%ebx),%eax
f010c338:	0f b6 c8             	movzbl %al,%ecx
f010c33b:	8d 53 01             	lea    0x1(%ebx),%edx
f010c33e:	89 55 e8             	mov    %edx,-0x18(%ebp)
f010c341:	83 e8 23             	sub    $0x23,%eax
f010c344:	3c 55                	cmp    $0x55,%al
f010c346:	0f 87 69 03 00 00    	ja     f010c6b5 <_Z9vprintfmtPFviPvES_PKcPc+0x3f5>
f010c34c:	0f b6 c0             	movzbl %al,%eax
f010c34f:	ff 24 85 e0 e1 10 f0 	jmp    *-0xfef1e20(,%eax,4)
f010c356:	c6 45 df 30          	movb   $0x30,-0x21(%ebp)
f010c35a:	eb d6                	jmp    f010c332 <_Z9vprintfmtPFviPvES_PKcPc+0x72>
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
				precision = precision * 10 + ch - '0';
f010c35c:	83 e9 30             	sub    $0x30,%ecx
f010c35f:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
				ch = *fmt;
f010c362:	8b 45 e8             	mov    -0x18(%ebp),%eax
f010c365:	0f be 08             	movsbl (%eax),%ecx
				if (ch < '0' || ch > '9')
f010c368:	8d 41 d0             	lea    -0x30(%ecx),%eax
f010c36b:	83 f8 09             	cmp    $0x9,%eax
f010c36e:	77 49                	ja     f010c3b9 <_Z9vprintfmtPFviPvES_PKcPc+0xf9>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
f010c370:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
				precision = precision * 10 + ch - '0';
f010c374:	8b 55 d4             	mov    -0x2c(%ebp),%edx
f010c377:	8d 04 92             	lea    (%edx,%edx,4),%eax
f010c37a:	8d 44 41 d0          	lea    -0x30(%ecx,%eax,2),%eax
f010c37e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
				ch = *fmt;
f010c381:	8b 45 e8             	mov    -0x18(%ebp),%eax
f010c384:	0f be 08             	movsbl (%eax),%ecx
				if (ch < '0' || ch > '9')
f010c387:	8d 41 d0             	lea    -0x30(%ecx),%eax
f010c38a:	83 f8 09             	cmp    $0x9,%eax
f010c38d:	76 e1                	jbe    f010c370 <_Z9vprintfmtPFviPvES_PKcPc+0xb0>
f010c38f:	eb 28                	jmp    f010c3b9 <_Z9vprintfmtPFviPvES_PKcPc+0xf9>
					break;
			}
			goto process_precision;

		case '*':
			precision = va_arg(ap, int);
f010c391:	8b 45 14             	mov    0x14(%ebp),%eax
f010c394:	83 c0 04             	add    $0x4,%eax
f010c397:	89 45 14             	mov    %eax,0x14(%ebp)
f010c39a:	8b 40 fc             	mov    -0x4(%eax),%eax
f010c39d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
f010c3a0:	eb 17                	jmp    f010c3b9 <_Z9vprintfmtPFviPvES_PKcPc+0xf9>
			goto process_precision;

		case '.':
			if (width < 0)
f010c3a2:	89 f8                	mov    %edi,%eax
f010c3a4:	c1 f8 1f             	sar    $0x1f,%eax
f010c3a7:	f7 d0                	not    %eax
f010c3a9:	21 c7                	and    %eax,%edi
f010c3ab:	eb 85                	jmp    f010c332 <_Z9vprintfmtPFviPvES_PKcPc+0x72>
f010c3ad:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
f010c3b4:	e9 79 ff ff ff       	jmp    f010c332 <_Z9vprintfmtPFviPvES_PKcPc+0x72>
		case '#':
			altflag = 1;
			goto reswitch;

		process_precision:
			if (width < 0)
f010c3b9:	85 ff                	test   %edi,%edi
f010c3bb:	0f 89 71 ff ff ff    	jns    f010c332 <_Z9vprintfmtPFviPvES_PKcPc+0x72>
f010c3c1:	8b 7d d4             	mov    -0x2c(%ebp),%edi
f010c3c4:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
f010c3cb:	90                   	nop    
f010c3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010c3d0:	e9 5d ff ff ff       	jmp    f010c332 <_Z9vprintfmtPFviPvES_PKcPc+0x72>
				width = precision, precision = -1;
			goto reswitch;

		// long flag (doubled for long long)
		case 'l':
			lflag++;
f010c3d5:	83 45 c4 01          	addl   $0x1,-0x3c(%ebp)
f010c3d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f010c3e0:	e9 4d ff ff ff       	jmp    f010c332 <_Z9vprintfmtPFviPvES_PKcPc+0x72>
			goto reswitch;

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
f010c3e5:	8b 45 14             	mov    0x14(%ebp),%eax
f010c3e8:	83 c0 04             	add    $0x4,%eax
f010c3eb:	89 45 14             	mov    %eax,0x14(%ebp)
f010c3ee:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c3f2:	8b 40 fc             	mov    -0x4(%eax),%eax
f010c3f5:	89 04 24             	mov    %eax,(%esp)
f010c3f8:	ff 55 08             	call   *0x8(%ebp)
f010c3fb:	8b 5d e8             	mov    -0x18(%ebp),%ebx
f010c3fe:	e9 d1 fe ff ff       	jmp    f010c2d4 <_Z9vprintfmtPFviPvES_PKcPc+0x14>
			break;

		// error message
		case 'e':
			err = va_arg(ap, int);
f010c403:	8b 45 14             	mov    0x14(%ebp),%eax
f010c406:	83 c0 04             	add    $0x4,%eax
f010c409:	89 45 14             	mov    %eax,0x14(%ebp)
f010c40c:	8b 40 fc             	mov    -0x4(%eax),%eax
f010c40f:	89 c2                	mov    %eax,%edx
f010c411:	c1 fa 1f             	sar    $0x1f,%edx
f010c414:	31 d0                	xor    %edx,%eax
f010c416:	29 d0                	sub    %edx,%eax
			if (err < 0)
				err = -err;
			if (err > MAXERROR || (p = error_string[err]) == NULL)
f010c418:	83 f8 06             	cmp    $0x6,%eax
f010c41b:	7f 0f                	jg     f010c42c <_Z9vprintfmtPFviPvES_PKcPc+0x16c>
f010c41d:	8b 14 85 38 e3 10 f0 	mov    -0xfef1cc8(,%eax,4),%edx
f010c424:	85 d2                	test   %edx,%edx
f010c426:	0f 85 a7 02 00 00    	jne    f010c6d3 <_Z9vprintfmtPFviPvES_PKcPc+0x413>
				printfmt(putch, putdat, "error %d", err);
f010c42c:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c430:	c7 44 24 08 66 e1 10 	movl   $0xf010e166,0x8(%esp)
f010c437:	f0 
f010c438:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c43c:	8b 55 08             	mov    0x8(%ebp),%edx
f010c43f:	89 14 24             	mov    %edx,(%esp)
f010c442:	e8 37 03 00 00       	call   f010c77e <_Z8printfmtPFviPvES_PKcz>
f010c447:	8b 5d e8             	mov    -0x18(%ebp),%ebx
f010c44a:	e9 85 fe ff ff       	jmp    f010c2d4 <_Z9vprintfmtPFviPvES_PKcPc+0x14>
f010c44f:	89 7d d0             	mov    %edi,-0x30(%ebp)
f010c452:	8b 55 d4             	mov    -0x2c(%ebp),%edx
f010c455:	8b 5d e8             	mov    -0x18(%ebp),%ebx
				printfmt(putch, putdat, "%s", p);
			break;

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
f010c458:	8b 45 14             	mov    0x14(%ebp),%eax
f010c45b:	83 c0 04             	add    $0x4,%eax
f010c45e:	89 45 14             	mov    %eax,0x14(%ebp)
f010c461:	8b 40 fc             	mov    -0x4(%eax),%eax
f010c464:	89 45 cc             	mov    %eax,-0x34(%ebp)
f010c467:	85 c0                	test   %eax,%eax
f010c469:	75 07                	jne    f010c472 <_Z9vprintfmtPFviPvES_PKcPc+0x1b2>
f010c46b:	c7 45 cc 6f e1 10 f0 	movl   $0xf010e16f,-0x34(%ebp)
				p = "(null)";
			if (width > 0 && padc != '-')
f010c472:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
f010c476:	7e 06                	jle    f010c47e <_Z9vprintfmtPFviPvES_PKcPc+0x1be>
f010c478:	80 7d df 2d          	cmpb   $0x2d,-0x21(%ebp)
f010c47c:	75 16                	jne    f010c494 <_Z9vprintfmtPFviPvES_PKcPc+0x1d4>
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
f010c47e:	8b 4d cc             	mov    -0x34(%ebp),%ecx
f010c481:	0f be 11             	movsbl (%ecx),%edx
f010c484:	85 d2                	test   %edx,%edx
f010c486:	0f 84 87 00 00 00    	je     f010c513 <_Z9vprintfmtPFviPvES_PKcPc+0x253>
f010c48c:	83 c1 01             	add    $0x1,%ecx
f010c48f:	89 4d ec             	mov    %ecx,-0x14(%ebp)
f010c492:	eb 73                	jmp    f010c507 <_Z9vprintfmtPFviPvES_PKcPc+0x247>
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
f010c494:	89 54 24 04          	mov    %edx,0x4(%esp)
f010c498:	8b 45 cc             	mov    -0x34(%ebp),%eax
f010c49b:	89 04 24             	mov    %eax,(%esp)
f010c49e:	e8 18 04 00 00       	call   f010c8bb <_Z7strnlenPKcj>
f010c4a3:	8b 7d d0             	mov    -0x30(%ebp),%edi
f010c4a6:	29 c7                	sub    %eax,%edi
f010c4a8:	85 ff                	test   %edi,%edi
f010c4aa:	7e d2                	jle    f010c47e <_Z9vprintfmtPFviPvES_PKcPc+0x1be>
					putch(padc, putdat);
f010c4ac:	0f be 55 df          	movsbl -0x21(%ebp),%edx
f010c4b0:	89 55 c8             	mov    %edx,-0x38(%ebp)
f010c4b3:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c4b7:	8b 4d c8             	mov    -0x38(%ebp),%ecx
f010c4ba:	89 0c 24             	mov    %ecx,(%esp)
f010c4bd:	ff 55 08             	call   *0x8(%ebp)
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
f010c4c0:	83 ef 01             	sub    $0x1,%edi
f010c4c3:	85 ff                	test   %edi,%edi
f010c4c5:	7f ec                	jg     f010c4b3 <_Z9vprintfmtPFviPvES_PKcPc+0x1f3>
f010c4c7:	bf 00 00 00 00       	mov    $0x0,%edi
f010c4cc:	eb b0                	jmp    f010c47e <_Z9vprintfmtPFviPvES_PKcPc+0x1be>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
f010c4ce:	8d 42 e0             	lea    -0x20(%edx),%eax
f010c4d1:	83 f8 5e             	cmp    $0x5e,%eax
f010c4d4:	76 14                	jbe    f010c4ea <_Z9vprintfmtPFviPvES_PKcPc+0x22a>
					putch('?', putdat);
f010c4d6:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c4da:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
f010c4e1:	ff 55 08             	call   *0x8(%ebp)
f010c4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010c4e8:	eb 0a                	jmp    f010c4f4 <_Z9vprintfmtPFviPvES_PKcPc+0x234>
				else
					putch(ch, putdat);
f010c4ea:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c4ee:	89 14 24             	mov    %edx,(%esp)
f010c4f1:	ff 55 08             	call   *0x8(%ebp)
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
f010c4f4:	83 ef 01             	sub    $0x1,%edi
f010c4f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
f010c4fa:	0f be 10             	movsbl (%eax),%edx
f010c4fd:	85 d2                	test   %edx,%edx
f010c4ff:	74 12                	je     f010c513 <_Z9vprintfmtPFviPvES_PKcPc+0x253>
f010c501:	83 c0 01             	add    $0x1,%eax
f010c504:	89 45 ec             	mov    %eax,-0x14(%ebp)
f010c507:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
f010c50b:	78 10                	js     f010c51d <_Z9vprintfmtPFviPvES_PKcPc+0x25d>
f010c50d:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
f010c511:	79 0a                	jns    f010c51d <_Z9vprintfmtPFviPvES_PKcPc+0x25d>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
f010c513:	85 ff                	test   %edi,%edi
f010c515:	7f 1b                	jg     f010c532 <_Z9vprintfmtPFviPvES_PKcPc+0x272>
f010c517:	90                   	nop    
f010c518:	e9 b4 fd ff ff       	jmp    f010c2d1 <_Z9vprintfmtPFviPvES_PKcPc+0x11>
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
f010c51d:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
f010c521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f010c528:	75 a4                	jne    f010c4ce <_Z9vprintfmtPFviPvES_PKcPc+0x20e>
f010c52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010c530:	eb b8                	jmp    f010c4ea <_Z9vprintfmtPFviPvES_PKcPc+0x22a>
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
				putch(' ', putdat);
f010c532:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c536:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
f010c53d:	8d 76 00             	lea    0x0(%esi),%esi
f010c540:	ff 55 08             	call   *0x8(%ebp)
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
f010c543:	83 ef 01             	sub    $0x1,%edi
f010c546:	85 ff                	test   %edi,%edi
f010c548:	7f e8                	jg     f010c532 <_Z9vprintfmtPFviPvES_PKcPc+0x272>
f010c54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010c550:	e9 7f fd ff ff       	jmp    f010c2d4 <_Z9vprintfmtPFviPvES_PKcPc+0x14>
// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
	if (lflag >= 2)
f010c555:	83 7d c4 01          	cmpl   $0x1,-0x3c(%ebp)
f010c559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f010c560:	7e 17                	jle    f010c579 <_Z9vprintfmtPFviPvES_PKcPc+0x2b9>
		return va_arg(*ap, long long);
f010c562:	8b 45 14             	mov    0x14(%ebp),%eax
f010c565:	83 c0 08             	add    $0x8,%eax
f010c568:	89 45 14             	mov    %eax,0x14(%ebp)
f010c56b:	8b 50 f8             	mov    -0x8(%eax),%edx
f010c56e:	8b 48 fc             	mov    -0x4(%eax),%ecx
f010c571:	89 55 e0             	mov    %edx,-0x20(%ebp)
f010c574:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
f010c577:	eb 36                	jmp    f010c5af <_Z9vprintfmtPFviPvES_PKcPc+0x2ef>
	else if (lflag)
f010c579:	83 7d c4 00          	cmpl   $0x0,-0x3c(%ebp)
f010c57d:	74 19                	je     f010c598 <_Z9vprintfmtPFviPvES_PKcPc+0x2d8>
		return va_arg(*ap, long);
f010c57f:	8b 45 14             	mov    0x14(%ebp),%eax
f010c582:	83 c0 04             	add    $0x4,%eax
f010c585:	89 45 14             	mov    %eax,0x14(%ebp)
f010c588:	8b 40 fc             	mov    -0x4(%eax),%eax
f010c58b:	89 45 e0             	mov    %eax,-0x20(%ebp)
f010c58e:	89 c1                	mov    %eax,%ecx
f010c590:	c1 f9 1f             	sar    $0x1f,%ecx
f010c593:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
f010c596:	eb 17                	jmp    f010c5af <_Z9vprintfmtPFviPvES_PKcPc+0x2ef>
	else
		return va_arg(*ap, int);
f010c598:	8b 45 14             	mov    0x14(%ebp),%eax
f010c59b:	83 c0 04             	add    $0x4,%eax
f010c59e:	89 45 14             	mov    %eax,0x14(%ebp)
f010c5a1:	8b 40 fc             	mov    -0x4(%eax),%eax
f010c5a4:	89 45 e0             	mov    %eax,-0x20(%ebp)
f010c5a7:	89 c2                	mov    %eax,%edx
f010c5a9:	c1 fa 1f             	sar    $0x1f,%edx
f010c5ac:	89 55 e4             	mov    %edx,-0x1c(%ebp)
				putch(' ', putdat);
			break;

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
f010c5af:	8b 55 e0             	mov    -0x20(%ebp),%edx
f010c5b2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f010c5b5:	bb 0a 00 00 00       	mov    $0xa,%ebx
			if ((long long) num < 0) {
f010c5ba:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
f010c5be:	0f 89 b5 00 00 00    	jns    f010c679 <_Z9vprintfmtPFviPvES_PKcPc+0x3b9>
				putch('-', putdat);
f010c5c4:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c5c8:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
f010c5cf:	ff 55 08             	call   *0x8(%ebp)
				num = -(long long) num;
f010c5d2:	8b 55 e0             	mov    -0x20(%ebp),%edx
f010c5d5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f010c5d8:	f7 da                	neg    %edx
f010c5da:	83 d1 00             	adc    $0x0,%ecx
f010c5dd:	f7 d9                	neg    %ecx
f010c5df:	bb 0a 00 00 00       	mov    $0xa,%ebx
f010c5e4:	e9 90 00 00 00       	jmp    f010c679 <_Z9vprintfmtPFviPvES_PKcPc+0x3b9>
			base = 10;
			goto number;

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
f010c5e9:	8d 45 14             	lea    0x14(%ebp),%eax
f010c5ec:	8b 55 c4             	mov    -0x3c(%ebp),%edx
f010c5ef:	e8 6f fc ff ff       	call   f010c263 <_ZL7getuintPPci>
f010c5f4:	89 d1                	mov    %edx,%ecx
f010c5f6:	89 c2                	mov    %eax,%edx
f010c5f8:	bb 0a 00 00 00       	mov    $0xa,%ebx
f010c5fd:	eb 7a                	jmp    f010c679 <_Z9vprintfmtPFviPvES_PKcPc+0x3b9>
			goto number;

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
f010c5ff:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c603:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
f010c60a:	ff 55 08             	call   *0x8(%ebp)
			putch('X', putdat);
f010c60d:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c611:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
f010c618:	ff 55 08             	call   *0x8(%ebp)
			putch('X', putdat);
f010c61b:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c61f:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
f010c626:	ff 55 08             	call   *0x8(%ebp)
f010c629:	8b 5d e8             	mov    -0x18(%ebp),%ebx
f010c62c:	e9 a3 fc ff ff       	jmp    f010c2d4 <_Z9vprintfmtPFviPvES_PKcPc+0x14>
			break;

		// pointer
		case 'p':
			putch('0', putdat);
f010c631:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c635:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
f010c63c:	ff 55 08             	call   *0x8(%ebp)
			putch('x', putdat);
f010c63f:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c643:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
f010c64a:	ff 55 08             	call   *0x8(%ebp)
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
f010c64d:	8b 45 14             	mov    0x14(%ebp),%eax
f010c650:	83 c0 04             	add    $0x4,%eax
f010c653:	89 45 14             	mov    %eax,0x14(%ebp)
f010c656:	8b 50 fc             	mov    -0x4(%eax),%edx
f010c659:	b9 00 00 00 00       	mov    $0x0,%ecx
f010c65e:	bb 10 00 00 00       	mov    $0x10,%ebx
f010c663:	eb 14                	jmp    f010c679 <_Z9vprintfmtPFviPvES_PKcPc+0x3b9>
			base = 16;
			goto number;

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
f010c665:	8d 45 14             	lea    0x14(%ebp),%eax
f010c668:	8b 55 c4             	mov    -0x3c(%ebp),%edx
f010c66b:	e8 f3 fb ff ff       	call   f010c263 <_ZL7getuintPPci>
f010c670:	89 d1                	mov    %edx,%ecx
f010c672:	89 c2                	mov    %eax,%edx
f010c674:	bb 10 00 00 00       	mov    $0x10,%ebx
			base = 16;
		number:
			printnum(putch, putdat, num, base, width, padc);
f010c679:	0f be 45 df          	movsbl -0x21(%ebp),%eax
f010c67d:	89 44 24 10          	mov    %eax,0x10(%esp)
f010c681:	89 7c 24 0c          	mov    %edi,0xc(%esp)
f010c685:	89 5c 24 08          	mov    %ebx,0x8(%esp)
f010c689:	89 14 24             	mov    %edx,(%esp)
f010c68c:	89 4c 24 04          	mov    %ecx,0x4(%esp)
f010c690:	89 f2                	mov    %esi,%edx
f010c692:	8b 45 08             	mov    0x8(%ebp),%eax
f010c695:	e8 d6 fa ff ff       	call   f010c170 <_ZL8printnumPFviPvES_yjii>
f010c69a:	8b 5d e8             	mov    -0x18(%ebp),%ebx
f010c69d:	e9 32 fc ff ff       	jmp    f010c2d4 <_Z9vprintfmtPFviPvES_PKcPc+0x14>
			break;

		// escaped '%' character
		case '%':
			putch(ch, putdat);
f010c6a2:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c6a6:	89 0c 24             	mov    %ecx,(%esp)
f010c6a9:	ff 55 08             	call   *0x8(%ebp)
f010c6ac:	8b 5d e8             	mov    -0x18(%ebp),%ebx
f010c6af:	90                   	nop    
f010c6b0:	e9 1f fc ff ff       	jmp    f010c2d4 <_Z9vprintfmtPFviPvES_PKcPc+0x14>
			break;
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
f010c6b5:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c6b9:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
f010c6c0:	ff 55 08             	call   *0x8(%ebp)
			for (fmt--; fmt[-1] != '%'; fmt--)
f010c6c3:	8d 43 ff             	lea    -0x1(%ebx),%eax
f010c6c6:	80 38 25             	cmpb   $0x25,(%eax)
f010c6c9:	0f 84 05 fc ff ff    	je     f010c2d4 <_Z9vprintfmtPFviPvES_PKcPc+0x14>
f010c6cf:	89 c3                	mov    %eax,%ebx
f010c6d1:	eb f0                	jmp    f010c6c3 <_Z9vprintfmtPFviPvES_PKcPc+0x403>
			if (err < 0)
				err = -err;
			if (err > MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
f010c6d3:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010c6d7:	c7 44 24 08 fe db 10 	movl   $0xf010dbfe,0x8(%esp)
f010c6de:	f0 
f010c6df:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c6e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010c6e6:	89 0c 24             	mov    %ecx,(%esp)
f010c6e9:	e8 90 00 00 00       	call   f010c77e <_Z8printfmtPFviPvES_PKcz>
f010c6ee:	8b 5d e8             	mov    -0x18(%ebp),%ebx
f010c6f1:	e9 de fb ff ff       	jmp    f010c2d4 <_Z9vprintfmtPFviPvES_PKcPc+0x14>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
f010c6f6:	83 c4 4c             	add    $0x4c,%esp
f010c6f9:	5b                   	pop    %ebx
f010c6fa:	5e                   	pop    %esi
f010c6fb:	5f                   	pop    %edi
f010c6fc:	5d                   	pop    %ebp
f010c6fd:	c3                   	ret    

f010c6fe <_Z9vsnprintfPciPKcS_>:
	if (b->buf < b->ebuf)
		*b->buf++ = ch;
}

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
f010c6fe:	55                   	push   %ebp
f010c6ff:	89 e5                	mov    %esp,%ebp
f010c701:	83 ec 28             	sub    $0x28,%esp
f010c704:	8b 45 08             	mov    0x8(%ebp),%eax
f010c707:	8b 55 0c             	mov    0xc(%ebp),%edx
{
	struct sprintbuf b = {buf, buf+n-1, 0};

	if (buf == NULL || n < 1)
f010c70a:	85 c0                	test   %eax,%eax
f010c70c:	74 04                	je     f010c712 <_Z9vsnprintfPciPKcS_+0x14>
f010c70e:	85 d2                	test   %edx,%edx
f010c710:	7f 07                	jg     f010c719 <_Z9vsnprintfPciPKcS_+0x1b>
f010c712:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f010c717:	eb 3b                	jmp    f010c754 <_Z9vsnprintfPciPKcS_+0x56>
}

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
	struct sprintbuf b = {buf, buf+n-1, 0};
f010c719:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
f010c720:	89 45 f4             	mov    %eax,-0xc(%ebp)
f010c723:	8d 44 10 ff          	lea    -0x1(%eax,%edx,1),%eax
f010c727:	89 45 f8             	mov    %eax,-0x8(%ebp)

	if (buf == NULL || n < 1)
		return -E_INVAL;

	// print the string to the buffer
	vprintfmt(sprintputch, &b, fmt, ap);
f010c72a:	8b 45 14             	mov    0x14(%ebp),%eax
f010c72d:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c731:	8b 45 10             	mov    0x10(%ebp),%eax
f010c734:	89 44 24 08          	mov    %eax,0x8(%esp)
f010c738:	8d 45 f4             	lea    -0xc(%ebp),%eax
f010c73b:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c73f:	c7 04 24 a2 c2 10 f0 	movl   $0xf010c2a2,(%esp)
f010c746:	e8 75 fb ff ff       	call   f010c2c0 <_Z9vprintfmtPFviPvES_PKcPc>

	// null terminate the buffer
	*b.buf = '\0';
f010c74b:	8b 45 f4             	mov    -0xc(%ebp),%eax
f010c74e:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
f010c751:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
f010c754:	c9                   	leave  
f010c755:	c3                   	ret    

f010c756 <_Z8snprintfPciPKcz>:

int
snprintf(char *buf, int n, const char *fmt, ...)
f010c756:	55                   	push   %ebp
f010c757:	89 e5                	mov    %esp,%ebp
f010c759:	83 ec 18             	sub    $0x18,%esp
{
	va_list ap;
	int rc;

	va_start(ap, fmt);
	rc = vsnprintf(buf, n, fmt, ap);
f010c75c:	8d 45 14             	lea    0x14(%ebp),%eax
f010c75f:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c763:	8b 45 10             	mov    0x10(%ebp),%eax
f010c766:	89 44 24 08          	mov    %eax,0x8(%esp)
f010c76a:	8b 45 0c             	mov    0xc(%ebp),%eax
f010c76d:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c771:	8b 45 08             	mov    0x8(%ebp),%eax
f010c774:	89 04 24             	mov    %eax,(%esp)
f010c777:	e8 82 ff ff ff       	call   f010c6fe <_Z9vsnprintfPciPKcS_>
	va_end(ap);

	return rc;
}
f010c77c:	c9                   	leave  
f010c77d:	c3                   	ret    

f010c77e <_Z8printfmtPFviPvES_PKcz>:
		}
	}
}

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
f010c77e:	55                   	push   %ebp
f010c77f:	89 e5                	mov    %esp,%ebp
f010c781:	83 ec 18             	sub    $0x18,%esp
{
	va_list ap;

	va_start(ap, fmt);
	vprintfmt(putch, putdat, fmt, ap);
f010c784:	8d 45 14             	lea    0x14(%ebp),%eax
f010c787:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c78b:	8b 45 10             	mov    0x10(%ebp),%eax
f010c78e:	89 44 24 08          	mov    %eax,0x8(%esp)
f010c792:	8b 45 0c             	mov    0xc(%ebp),%eax
f010c795:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c799:	8b 45 08             	mov    0x8(%ebp),%eax
f010c79c:	89 04 24             	mov    %eax,(%esp)
f010c79f:	e8 1c fb ff ff       	call   f010c2c0 <_Z9vprintfmtPFviPvES_PKcPc>
	va_end(ap);
}
f010c7a4:	c9                   	leave  
f010c7a5:	c3                   	ret    
	...

f010c7b0 <_Z8readlinePKc>:

#define BUFLEN 1024
static char buf[BUFLEN];

char *
readline(const char *prompt)
f010c7b0:	55                   	push   %ebp
f010c7b1:	89 e5                	mov    %esp,%ebp
f010c7b3:	57                   	push   %edi
f010c7b4:	56                   	push   %esi
f010c7b5:	53                   	push   %ebx
f010c7b6:	83 ec 0c             	sub    $0xc,%esp
f010c7b9:	8b 45 08             	mov    0x8(%ebp),%eax
{
	int i, c, echoing;

	if (prompt != NULL)
f010c7bc:	85 c0                	test   %eax,%eax
f010c7be:	74 10                	je     f010c7d0 <_Z8readlinePKc+0x20>
		cprintf("%s", prompt);
f010c7c0:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c7c4:	c7 04 24 fe db 10 f0 	movl   $0xf010dbfe,(%esp)
f010c7cb:	e8 1f f3 ff ff       	call   f010baef <_Z7cprintfPKcz>

	i = 0;
	echoing = (iscons(0) > 0);
f010c7d0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f010c7d7:	e8 92 ca ff ff       	call   f010926e <_Z6isconsi>
f010c7dc:	85 c0                	test   %eax,%eax
f010c7de:	0f 9f c0             	setg   %al
f010c7e1:	0f b6 f8             	movzbl %al,%edi
f010c7e4:	be 00 00 00 00       	mov    $0x0,%esi
	while (1) {
		c = getchar();
f010c7e9:	e8 6f ca ff ff       	call   f010925d <_Z7getcharv>
f010c7ee:	89 c3                	mov    %eax,%ebx
		if (c < 0) {
f010c7f0:	85 c0                	test   %eax,%eax
f010c7f2:	79 17                	jns    f010c80b <_Z8readlinePKc+0x5b>
			cprintf("read error: %e\n", c);
f010c7f4:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c7f8:	c7 04 24 54 e3 10 f0 	movl   $0xf010e354,(%esp)
f010c7ff:	e8 eb f2 ff ff       	call   f010baef <_Z7cprintfPKcz>
f010c804:	b8 00 00 00 00       	mov    $0x0,%eax
f010c809:	eb 7e                	jmp    f010c889 <_Z8readlinePKc+0xd9>
			return NULL;
		} else if (c >= ' ' && i < BUFLEN-1) {
f010c80b:	83 f8 1f             	cmp    $0x1f,%eax
f010c80e:	7e 28                	jle    f010c838 <_Z8readlinePKc+0x88>
f010c810:	81 fe fe 03 00 00    	cmp    $0x3fe,%esi
f010c816:	66 90                	xchg   %ax,%ax
f010c818:	7f 1e                	jg     f010c838 <_Z8readlinePKc+0x88>
			if (echoing)
f010c81a:	85 ff                	test   %edi,%edi
f010c81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010c820:	74 0b                	je     f010c82d <_Z8readlinePKc+0x7d>
				cputchar(c);
f010c822:	89 04 24             	mov    %eax,(%esp)
f010c825:	8d 76 00             	lea    0x0(%esi),%esi
f010c828:	e8 2d d0 ff ff       	call   f010985a <_Z8cputchari>
			buf[i++] = c;
f010c82d:	88 9e 20 cc 11 f0    	mov    %bl,-0xfee33e0(%esi)
f010c833:	83 c6 01             	add    $0x1,%esi
f010c836:	eb b1                	jmp    f010c7e9 <_Z8readlinePKc+0x39>
		} else if (c == '\b' && i > 0) {
f010c838:	83 fb 08             	cmp    $0x8,%ebx
f010c83b:	75 1d                	jne    f010c85a <_Z8readlinePKc+0xaa>
f010c83d:	85 f6                	test   %esi,%esi
f010c83f:	7e 19                	jle    f010c85a <_Z8readlinePKc+0xaa>
			if (echoing)
f010c841:	85 ff                	test   %edi,%edi
f010c843:	90                   	nop    
f010c844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010c848:	74 0b                	je     f010c855 <_Z8readlinePKc+0xa5>
				cputchar(c);
f010c84a:	89 1c 24             	mov    %ebx,(%esp)
f010c84d:	8d 76 00             	lea    0x0(%esi),%esi
f010c850:	e8 05 d0 ff ff       	call   f010985a <_Z8cputchari>
			i--;
f010c855:	83 ee 01             	sub    $0x1,%esi
f010c858:	eb 8f                	jmp    f010c7e9 <_Z8readlinePKc+0x39>
		} else if (c == '\n' || c == '\r') {
f010c85a:	83 fb 0a             	cmp    $0xa,%ebx
f010c85d:	8d 76 00             	lea    0x0(%esi),%esi
f010c860:	74 0c                	je     f010c86e <_Z8readlinePKc+0xbe>
f010c862:	83 fb 0d             	cmp    $0xd,%ebx
f010c865:	8d 76 00             	lea    0x0(%esi),%esi
f010c868:	0f 85 7b ff ff ff    	jne    f010c7e9 <_Z8readlinePKc+0x39>
			if (echoing)
f010c86e:	85 ff                	test   %edi,%edi
f010c870:	74 0b                	je     f010c87d <_Z8readlinePKc+0xcd>
				cputchar(c);
f010c872:	89 1c 24             	mov    %ebx,(%esp)
f010c875:	8d 76 00             	lea    0x0(%esi),%esi
f010c878:	e8 dd cf ff ff       	call   f010985a <_Z8cputchari>
			buf[i] = 0;
f010c87d:	c6 86 20 cc 11 f0 00 	movb   $0x0,-0xfee33e0(%esi)
f010c884:	b8 20 cc 11 f0       	mov    $0xf011cc20,%eax
			return buf;
		}
	}
}
f010c889:	83 c4 0c             	add    $0xc,%esp
f010c88c:	5b                   	pop    %ebx
f010c88d:	5e                   	pop    %esi
f010c88e:	5f                   	pop    %edi
f010c88f:	5d                   	pop    %ebp
f010c890:	c3                   	ret    
	...

f010c8a0 <_Z6strlenPKc>:
// Basic string routines.  Not hardware optimized, but not shabby.

#include <inc/string.h>

int
strlen(const char *s)
f010c8a0:	55                   	push   %ebp
f010c8a1:	89 e5                	mov    %esp,%ebp
f010c8a3:	8b 55 08             	mov    0x8(%ebp),%edx
{
	int n;

	for (n = 0; *s != '\0'; s++)
f010c8a6:	b8 00 00 00 00       	mov    $0x0,%eax
f010c8ab:	80 3a 00             	cmpb   $0x0,(%edx)
f010c8ae:	74 09                	je     f010c8b9 <_Z6strlenPKc+0x19>
		n++;
f010c8b0:	83 c0 01             	add    $0x1,%eax
int
strlen(const char *s)
{
	int n;

	for (n = 0; *s != '\0'; s++)
f010c8b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
f010c8b7:	75 f7                	jne    f010c8b0 <_Z6strlenPKc+0x10>
		n++;
	return n;
}
f010c8b9:	5d                   	pop    %ebp
f010c8ba:	c3                   	ret    

f010c8bb <_Z7strnlenPKcj>:

int
strnlen(const char *s, size_t size)
f010c8bb:	55                   	push   %ebp
f010c8bc:	89 e5                	mov    %esp,%ebp
f010c8be:	53                   	push   %ebx
f010c8bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
f010c8c2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
f010c8c5:	85 c9                	test   %ecx,%ecx
f010c8c7:	74 19                	je     f010c8e2 <_Z7strnlenPKcj+0x27>
f010c8c9:	80 3b 00             	cmpb   $0x0,(%ebx)
f010c8cc:	74 14                	je     f010c8e2 <_Z7strnlenPKcj+0x27>
f010c8ce:	b8 00 00 00 00       	mov    $0x0,%eax
		n++;
f010c8d3:	83 c0 01             	add    $0x1,%eax
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
f010c8d6:	39 c8                	cmp    %ecx,%eax
f010c8d8:	74 0d                	je     f010c8e7 <_Z7strnlenPKcj+0x2c>
f010c8da:	80 3c 03 00          	cmpb   $0x0,(%ebx,%eax,1)
f010c8de:	75 f3                	jne    f010c8d3 <_Z7strnlenPKcj+0x18>
f010c8e0:	eb 05                	jmp    f010c8e7 <_Z7strnlenPKcj+0x2c>
f010c8e2:	b8 00 00 00 00       	mov    $0x0,%eax
		n++;
	return n;
}
f010c8e7:	5b                   	pop    %ebx
f010c8e8:	5d                   	pop    %ebp
f010c8e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f010c8f0:	c3                   	ret    

f010c8f1 <_Z6strcpyPcPKc>:

char *
strcpy(char *dst, const char *src)
f010c8f1:	55                   	push   %ebp
f010c8f2:	89 e5                	mov    %esp,%ebp
f010c8f4:	53                   	push   %ebx
f010c8f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
f010c8f8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f010c8fb:	ba 00 00 00 00       	mov    $0x0,%edx
{
	char *ret = dst;

	while ((*dst++ = *src++) != '\0')
f010c900:	0f b6 04 11          	movzbl (%ecx,%edx,1),%eax
f010c904:	88 04 13             	mov    %al,(%ebx,%edx,1)
f010c907:	83 c2 01             	add    $0x1,%edx
f010c90a:	84 c0                	test   %al,%al
f010c90c:	75 f2                	jne    f010c900 <_Z6strcpyPcPKc+0xf>
		/* do nothing */;
	return ret;
}
f010c90e:	89 d8                	mov    %ebx,%eax
f010c910:	5b                   	pop    %ebx
f010c911:	5d                   	pop    %ebp
f010c912:	c3                   	ret    

f010c913 <_Z7strncpyPcPKcj>:

char *
strncpy(char *dst, const char *src, size_t size)
f010c913:	55                   	push   %ebp
f010c914:	89 e5                	mov    %esp,%ebp
f010c916:	56                   	push   %esi
f010c917:	53                   	push   %ebx
f010c918:	8b 75 08             	mov    0x8(%ebp),%esi
f010c91b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f010c91e:	8b 5d 10             	mov    0x10(%ebp),%ebx
{
	char *ret = dst;

	for (size_t i = 0; i < size; i++) {
f010c921:	85 db                	test   %ebx,%ebx
f010c923:	74 18                	je     f010c93d <_Z7strncpyPcPKcj+0x2a>
f010c925:	ba 00 00 00 00       	mov    $0x0,%edx
		*dst++ = *src;
f010c92a:	0f b6 01             	movzbl (%ecx),%eax
f010c92d:	88 04 16             	mov    %al,(%esi,%edx,1)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
f010c930:	80 39 01             	cmpb   $0x1,(%ecx)
f010c933:	83 d9 ff             	sbb    $0xffffffff,%ecx
char *
strncpy(char *dst, const char *src, size_t size)
{
	char *ret = dst;

	for (size_t i = 0; i < size; i++) {
f010c936:	83 c2 01             	add    $0x1,%edx
f010c939:	39 d3                	cmp    %edx,%ebx
f010c93b:	77 ed                	ja     f010c92a <_Z7strncpyPcPKcj+0x17>
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
}
f010c93d:	89 f0                	mov    %esi,%eax
f010c93f:	5b                   	pop    %ebx
f010c940:	5e                   	pop    %esi
f010c941:	5d                   	pop    %ebp
f010c942:	c3                   	ret    

f010c943 <_Z7strlcpyPcPKcj>:

size_t
strlcpy(char *dst, const char *src, size_t size)
f010c943:	55                   	push   %ebp
f010c944:	89 e5                	mov    %esp,%ebp
f010c946:	56                   	push   %esi
f010c947:	53                   	push   %ebx
f010c948:	8b 75 08             	mov    0x8(%ebp),%esi
f010c94b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010c94e:	8b 45 10             	mov    0x10(%ebp),%eax
{
	char *dst_in = dst;

	if (size > 0) {
		while (--size > 0 && *src != '\0')
f010c951:	89 f2                	mov    %esi,%edx
size_t
strlcpy(char *dst, const char *src, size_t size)
{
	char *dst_in = dst;

	if (size > 0) {
f010c953:	85 c0                	test   %eax,%eax
f010c955:	74 2a                	je     f010c981 <_Z7strlcpyPcPKcj+0x3e>
		while (--size > 0 && *src != '\0')
f010c957:	89 c1                	mov    %eax,%ecx
f010c959:	83 e9 01             	sub    $0x1,%ecx
f010c95c:	74 2b                	je     f010c989 <_Z7strlcpyPcPKcj+0x46>
f010c95e:	80 3b 00             	cmpb   $0x0,(%ebx)
f010c961:	75 0f                	jne    f010c972 <_Z7strlcpyPcPKcj+0x2f>
f010c963:	90                   	nop    
f010c964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010c968:	eb 1f                	jmp    f010c989 <_Z7strlcpyPcPKcj+0x46>
			*dst++ = *src++;
f010c96a:	83 c3 01             	add    $0x1,%ebx
strlcpy(char *dst, const char *src, size_t size)
{
	char *dst_in = dst;

	if (size > 0) {
		while (--size > 0 && *src != '\0')
f010c96d:	80 3b 00             	cmpb   $0x0,(%ebx)
f010c970:	74 19                	je     f010c98b <_Z7strlcpyPcPKcj+0x48>
			*dst++ = *src++;
f010c972:	0f b6 03             	movzbl (%ebx),%eax
f010c975:	88 02                	mov    %al,(%edx)
f010c977:	83 c2 01             	add    $0x1,%edx
strlcpy(char *dst, const char *src, size_t size)
{
	char *dst_in = dst;

	if (size > 0) {
		while (--size > 0 && *src != '\0')
f010c97a:	83 e9 01             	sub    $0x1,%ecx
f010c97d:	74 0c                	je     f010c98b <_Z7strlcpyPcPKcj+0x48>
f010c97f:	eb e9                	jmp    f010c96a <_Z7strlcpyPcPKcj+0x27>
f010c981:	89 d0                	mov    %edx,%eax
f010c983:	29 f0                	sub    %esi,%eax
			*dst++ = *src++;
		*dst = '\0';
	}
	return dst - dst_in;
}
f010c985:	5b                   	pop    %ebx
f010c986:	5e                   	pop    %esi
f010c987:	5d                   	pop    %ebp
f010c988:	c3                   	ret    
strlcpy(char *dst, const char *src, size_t size)
{
	char *dst_in = dst;

	if (size > 0) {
		while (--size > 0 && *src != '\0')
f010c989:	89 f2                	mov    %esi,%edx
			*dst++ = *src++;
		*dst = '\0';
f010c98b:	c6 02 00             	movb   $0x0,(%edx)
f010c98e:	eb f1                	jmp    f010c981 <_Z7strlcpyPcPKcj+0x3e>

f010c990 <_Z6strcmpPKcS0_>:
	}
	return dst - dst_in;
}

int
strcmp(const char *p, const char *q)
f010c990:	55                   	push   %ebp
f010c991:	89 e5                	mov    %esp,%ebp
f010c993:	8b 55 08             	mov    0x8(%ebp),%edx
f010c996:	8b 4d 0c             	mov    0xc(%ebp),%ecx
{
	while (*p && *p == *q)
f010c999:	0f b6 02             	movzbl (%edx),%eax
f010c99c:	84 c0                	test   %al,%al
f010c99e:	74 15                	je     f010c9b5 <_Z6strcmpPKcS0_+0x25>
f010c9a0:	3a 01                	cmp    (%ecx),%al
f010c9a2:	75 11                	jne    f010c9b5 <_Z6strcmpPKcS0_+0x25>
		p++, q++;
f010c9a4:	83 c2 01             	add    $0x1,%edx
f010c9a7:	83 c1 01             	add    $0x1,%ecx
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
f010c9aa:	0f b6 02             	movzbl (%edx),%eax
f010c9ad:	84 c0                	test   %al,%al
f010c9af:	74 04                	je     f010c9b5 <_Z6strcmpPKcS0_+0x25>
f010c9b1:	3a 01                	cmp    (%ecx),%al
f010c9b3:	74 ef                	je     f010c9a4 <_Z6strcmpPKcS0_+0x14>
f010c9b5:	0f b6 c0             	movzbl %al,%eax
f010c9b8:	0f b6 11             	movzbl (%ecx),%edx
f010c9bb:	29 d0                	sub    %edx,%eax
		p++, q++;
	return (unsigned char) *p - (unsigned char) *q;
}
f010c9bd:	5d                   	pop    %ebp
f010c9be:	c3                   	ret    

f010c9bf <_Z7strncmpPKcS0_j>:

int
strncmp(const char *p, const char *q, size_t n)
f010c9bf:	55                   	push   %ebp
f010c9c0:	89 e5                	mov    %esp,%ebp
f010c9c2:	53                   	push   %ebx
f010c9c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010c9c6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010c9c9:	8b 55 10             	mov    0x10(%ebp),%edx
{
	while (n > 0 && *p && *p == *q)
f010c9cc:	85 d2                	test   %edx,%edx
f010c9ce:	74 2f                	je     f010c9ff <_Z7strncmpPKcS0_j+0x40>
f010c9d0:	0f b6 01             	movzbl (%ecx),%eax
f010c9d3:	84 c0                	test   %al,%al
f010c9d5:	74 1c                	je     f010c9f3 <_Z7strncmpPKcS0_j+0x34>
f010c9d7:	3a 03                	cmp    (%ebx),%al
f010c9d9:	75 18                	jne    f010c9f3 <_Z7strncmpPKcS0_j+0x34>
f010c9db:	83 ea 01             	sub    $0x1,%edx
f010c9de:	66 90                	xchg   %ax,%ax
f010c9e0:	74 1d                	je     f010c9ff <_Z7strncmpPKcS0_j+0x40>
		n--, p++, q++;
f010c9e2:	83 c1 01             	add    $0x1,%ecx
f010c9e5:	83 c3 01             	add    $0x1,%ebx
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
f010c9e8:	0f b6 01             	movzbl (%ecx),%eax
f010c9eb:	84 c0                	test   %al,%al
f010c9ed:	74 04                	je     f010c9f3 <_Z7strncmpPKcS0_j+0x34>
f010c9ef:	3a 03                	cmp    (%ebx),%al
f010c9f1:	74 e8                	je     f010c9db <_Z7strncmpPKcS0_j+0x1c>
		n--, p++, q++;
	if (n == 0)
		return 0;
	else
		return (unsigned char) *p - (unsigned char) *q;
f010c9f3:	0f b6 11             	movzbl (%ecx),%edx
f010c9f6:	0f b6 03             	movzbl (%ebx),%eax
f010c9f9:	29 c2                	sub    %eax,%edx
f010c9fb:	89 d0                	mov    %edx,%eax
f010c9fd:	eb 05                	jmp    f010ca04 <_Z7strncmpPKcS0_j+0x45>
f010c9ff:	b8 00 00 00 00       	mov    $0x0,%eax
}
f010ca04:	5b                   	pop    %ebx
f010ca05:	5d                   	pop    %ebp
f010ca06:	c3                   	ret    

f010ca07 <_Z6strchrPKcc>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
f010ca07:	55                   	push   %ebp
f010ca08:	89 e5                	mov    %esp,%ebp
f010ca0a:	8b 45 08             	mov    0x8(%ebp),%eax
f010ca0d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
{
	for (; *s; s++)
f010ca11:	0f b6 10             	movzbl (%eax),%edx
f010ca14:	84 d2                	test   %dl,%dl
f010ca16:	74 1a                	je     f010ca32 <_Z6strchrPKcc+0x2b>
		if (*s == c)
f010ca18:	38 ca                	cmp    %cl,%dl
f010ca1a:	75 06                	jne    f010ca22 <_Z6strchrPKcc+0x1b>
f010ca1c:	eb 19                	jmp    f010ca37 <_Z6strchrPKcc+0x30>
f010ca1e:	38 ca                	cmp    %cl,%dl
f010ca20:	74 15                	je     f010ca37 <_Z6strchrPKcc+0x30>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
f010ca22:	83 c0 01             	add    $0x1,%eax
f010ca25:	0f b6 10             	movzbl (%eax),%edx
f010ca28:	84 d2                	test   %dl,%dl
f010ca2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010ca30:	75 ec                	jne    f010ca1e <_Z6strchrPKcc+0x17>
f010ca32:	b8 00 00 00 00       	mov    $0x0,%eax
		if (*s == c)
			return (char *) s;
	return 0;
}
f010ca37:	5d                   	pop    %ebp
f010ca38:	c3                   	ret    

f010ca39 <_Z7strfindPKcc>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
f010ca39:	55                   	push   %ebp
f010ca3a:	89 e5                	mov    %esp,%ebp
f010ca3c:	8b 45 08             	mov    0x8(%ebp),%eax
f010ca3f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
{
	for (; *s; s++)
f010ca43:	0f b6 10             	movzbl (%eax),%edx
f010ca46:	84 d2                	test   %dl,%dl
f010ca48:	74 20                	je     f010ca6a <_Z7strfindPKcc+0x31>
		if (*s == c)
f010ca4a:	38 ca                	cmp    %cl,%dl
f010ca4c:	75 0c                	jne    f010ca5a <_Z7strfindPKcc+0x21>
f010ca4e:	eb 1a                	jmp    f010ca6a <_Z7strfindPKcc+0x31>
f010ca50:	38 ca                	cmp    %cl,%dl
f010ca52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010ca58:	74 10                	je     f010ca6a <_Z7strfindPKcc+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
f010ca5a:	83 c0 01             	add    $0x1,%eax
f010ca5d:	0f b6 10             	movzbl (%eax),%edx
f010ca60:	84 d2                	test   %dl,%dl
f010ca62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010ca68:	75 e6                	jne    f010ca50 <_Z7strfindPKcc+0x17>
		if (*s == c)
			break;
	return (char *) s;
}
f010ca6a:	5d                   	pop    %ebp
f010ca6b:	90                   	nop    
f010ca6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010ca70:	c3                   	ret    

f010ca71 <_Z6memsetPvij>:


void *
memset(void *v, int c, size_t n)
f010ca71:	55                   	push   %ebp
f010ca72:	89 e5                	mov    %esp,%ebp
f010ca74:	53                   	push   %ebx
f010ca75:	8b 5d 08             	mov    0x8(%ebp),%ebx
f010ca78:	8b 45 0c             	mov    0xc(%ebp),%eax
f010ca7b:	8b 4d 10             	mov    0x10(%ebp),%ecx
{
	char *p = (char *) v;
	int m = n;

	while (--m >= 0)
f010ca7e:	89 ca                	mov    %ecx,%edx
f010ca80:	83 ea 01             	sub    $0x1,%edx
f010ca83:	78 0e                	js     f010ca93 <_Z6memsetPvij+0x22>


void *
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
f010ca85:	89 da                	mov    %ebx,%edx
	int m = n;

	while (--m >= 0)
f010ca87:	8d 0c 0b             	lea    (%ebx,%ecx,1),%ecx
		*p++ = c;
f010ca8a:	88 02                	mov    %al,(%edx)
f010ca8c:	83 c2 01             	add    $0x1,%edx
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
	int m = n;

	while (--m >= 0)
f010ca8f:	39 ca                	cmp    %ecx,%edx
f010ca91:	75 f7                	jne    f010ca8a <_Z6memsetPvij+0x19>
		*p++ = c;
	return v;
}
f010ca93:	89 d8                	mov    %ebx,%eax
f010ca95:	5b                   	pop    %ebx
f010ca96:	5d                   	pop    %ebp
f010ca97:	c3                   	ret    

f010ca98 <_Z6memcpyPvPKvj>:

void *
memcpy(void *dst, const void *src, size_t n)
f010ca98:	55                   	push   %ebp
f010ca99:	89 e5                	mov    %esp,%ebp
f010ca9b:	56                   	push   %esi
f010ca9c:	53                   	push   %ebx
f010ca9d:	8b 75 08             	mov    0x8(%ebp),%esi
f010caa0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010caa3:	8b 4d 10             	mov    0x10(%ebp),%ecx
{
	const char *s = (const char *) src;
	char *d = (char *) dst;

	while (n-- > 0)
f010caa6:	85 c9                	test   %ecx,%ecx
f010caa8:	74 13                	je     f010cabd <_Z6memcpyPvPKvj+0x25>
f010caaa:	ba 00 00 00 00       	mov    $0x0,%edx
		*d++ = *s++;
f010caaf:	0f b6 04 13          	movzbl (%ebx,%edx,1),%eax
f010cab3:	88 04 16             	mov    %al,(%esi,%edx,1)
f010cab6:	83 c2 01             	add    $0x1,%edx
memcpy(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;

	while (n-- > 0)
f010cab9:	39 ca                	cmp    %ecx,%edx
f010cabb:	75 f2                	jne    f010caaf <_Z6memcpyPvPKvj+0x17>
		*d++ = *s++;

	return dst;
}
f010cabd:	89 f0                	mov    %esi,%eax
f010cabf:	5b                   	pop    %ebx
f010cac0:	5e                   	pop    %esi
f010cac1:	5d                   	pop    %ebp
f010cac2:	c3                   	ret    

f010cac3 <_Z7memmovePvPKvj>:

void *
memmove(void *dst, const void *src, size_t n)
f010cac3:	55                   	push   %ebp
f010cac4:	89 e5                	mov    %esp,%ebp
f010cac6:	57                   	push   %edi
f010cac7:	56                   	push   %esi
f010cac8:	53                   	push   %ebx
f010cac9:	8b 75 08             	mov    0x8(%ebp),%esi
f010cacc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f010cacf:	8b 5d 10             	mov    0x10(%ebp),%ebx
{
	const char *s = (const char *) src;
	char *d = (char *) dst;

	if (s < d && s + n > d) {
f010cad2:	39 f1                	cmp    %esi,%ecx
f010cad4:	72 0b                	jb     f010cae1 <_Z7memmovePvPKvj+0x1e>
		s += n;
		d += n;
		while (n-- > 0)
f010cad6:	ba 00 00 00 00       	mov    $0x0,%edx
			*--d = *--s;
	} else
		while (n-- > 0)
f010cadb:	85 db                	test   %ebx,%ebx
f010cadd:	75 30                	jne    f010cb0f <_Z7memmovePvPKvj+0x4c>
f010cadf:	eb 3c                	jmp    f010cb1d <_Z7memmovePvPKvj+0x5a>
memmove(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;

	if (s < d && s + n > d) {
f010cae1:	8d 3c 19             	lea    (%ecx,%ebx,1),%edi
f010cae4:	39 fe                	cmp    %edi,%esi
f010cae6:	66 90                	xchg   %ax,%ax
f010cae8:	73 ec                	jae    f010cad6 <_Z7memmovePvPKvj+0x13>
		s += n;
		d += n;
		while (n-- > 0)
f010caea:	85 db                	test   %ebx,%ebx
f010caec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010caf0:	74 2b                	je     f010cb1d <_Z7memmovePvPKvj+0x5a>
	const char *s = (const char *) src;
	char *d = (char *) dst;

	if (s < d && s + n > d) {
		s += n;
		d += n;
f010caf2:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
f010caf5:	ba 00 00 00 00       	mov    $0x0,%edx
		while (n-- > 0)
			*--d = *--s;
f010cafa:	0f b6 44 17 ff       	movzbl -0x1(%edi,%edx,1),%eax
f010caff:	88 44 11 ff          	mov    %al,-0x1(%ecx,%edx,1)
f010cb03:	83 ea 01             	sub    $0x1,%edx
	char *d = (char *) dst;

	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
f010cb06:	8d 04 1a             	lea    (%edx,%ebx,1),%eax
f010cb09:	85 c0                	test   %eax,%eax
f010cb0b:	75 ed                	jne    f010cafa <_Z7memmovePvPKvj+0x37>
f010cb0d:	eb 0e                	jmp    f010cb1d <_Z7memmovePvPKvj+0x5a>
			*--d = *--s;
	} else
		while (n-- > 0)
			*d++ = *s++;
f010cb0f:	0f b6 04 11          	movzbl (%ecx,%edx,1),%eax
f010cb13:	88 04 16             	mov    %al,(%esi,%edx,1)
f010cb16:	83 c2 01             	add    $0x1,%edx
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
f010cb19:	39 d3                	cmp    %edx,%ebx
f010cb1b:	75 f2                	jne    f010cb0f <_Z7memmovePvPKvj+0x4c>
			*d++ = *s++;

	return dst;
}
f010cb1d:	89 f0                	mov    %esi,%eax
f010cb1f:	5b                   	pop    %ebx
f010cb20:	5e                   	pop    %esi
f010cb21:	5f                   	pop    %edi
f010cb22:	5d                   	pop    %ebp
f010cb23:	c3                   	ret    

f010cb24 <_Z6memcmpPKvS0_j>:

int
memcmp(const void *v1, const void *v2, size_t n)
f010cb24:	55                   	push   %ebp
f010cb25:	89 e5                	mov    %esp,%ebp
f010cb27:	57                   	push   %edi
f010cb28:	56                   	push   %esi
f010cb29:	53                   	push   %ebx
f010cb2a:	8b 7d 08             	mov    0x8(%ebp),%edi
f010cb2d:	8b 75 0c             	mov    0xc(%ebp),%esi
f010cb30:	8b 45 10             	mov    0x10(%ebp),%eax
{
	const unsigned char *s1 = (const unsigned char *) v1;
	const unsigned char *s2 = (const unsigned char *) v2;

	while (n-- > 0) {
f010cb33:	85 c0                	test   %eax,%eax
f010cb35:	74 38                	je     f010cb6f <_Z6memcmpPKvS0_j+0x4b>
		if (*s1 != *s2)
f010cb37:	0f b6 17             	movzbl (%edi),%edx
f010cb3a:	0f b6 1e             	movzbl (%esi),%ebx
f010cb3d:	38 da                	cmp    %bl,%dl
f010cb3f:	74 22                	je     f010cb63 <_Z6memcmpPKvS0_j+0x3f>
f010cb41:	eb 14                	jmp    f010cb57 <_Z6memcmpPKvS0_j+0x33>
f010cb43:	0f b6 54 0f 01       	movzbl 0x1(%edi,%ecx,1),%edx
f010cb48:	0f b6 5c 0e 01       	movzbl 0x1(%esi,%ecx,1),%ebx
f010cb4d:	83 c1 01             	add    $0x1,%ecx
f010cb50:	83 e8 01             	sub    $0x1,%eax
f010cb53:	38 da                	cmp    %bl,%dl
f010cb55:	74 14                	je     f010cb6b <_Z6memcmpPKvS0_j+0x47>
			return *s1 - *s2;
f010cb57:	0f b6 d2             	movzbl %dl,%edx
f010cb5a:	0f b6 c3             	movzbl %bl,%eax
f010cb5d:	29 c2                	sub    %eax,%edx
f010cb5f:	89 d0                	mov    %edx,%eax
f010cb61:	eb 11                	jmp    f010cb74 <_Z6memcmpPKvS0_j+0x50>
memcmp(const void *v1, const void *v2, size_t n)
{
	const unsigned char *s1 = (const unsigned char *) v1;
	const unsigned char *s2 = (const unsigned char *) v2;

	while (n-- > 0) {
f010cb63:	83 e8 01             	sub    $0x1,%eax
f010cb66:	b9 00 00 00 00       	mov    $0x0,%ecx
f010cb6b:	85 c0                	test   %eax,%eax
f010cb6d:	75 d4                	jne    f010cb43 <_Z6memcmpPKvS0_j+0x1f>
f010cb6f:	b8 00 00 00 00       	mov    $0x0,%eax
		if (*s1 != *s2)
			return *s1 - *s2;
		s1++, s2++;
	}
	return 0;
}
f010cb74:	5b                   	pop    %ebx
f010cb75:	5e                   	pop    %esi
f010cb76:	5f                   	pop    %edi
f010cb77:	5d                   	pop    %ebp
f010cb78:	c3                   	ret    

f010cb79 <_Z7memfindPKvij>:

void *
memfind(const void *v, int c, size_t n)
f010cb79:	55                   	push   %ebp
f010cb7a:	89 e5                	mov    %esp,%ebp
{
	const unsigned char *s = (const unsigned char *) v;
f010cb7c:	8b 45 08             	mov    0x8(%ebp),%eax
	
	const unsigned char *ends = s + n;
f010cb7f:	89 c1                	mov    %eax,%ecx
f010cb81:	03 4d 10             	add    0x10(%ebp),%ecx
	for (; s < ends; s++)
f010cb84:	39 c8                	cmp    %ecx,%eax
f010cb86:	73 1a                	jae    f010cba2 <_Z7memfindPKvij+0x29>
		if (*s == (unsigned char) c)
f010cb88:	0f b6 55 0c          	movzbl 0xc(%ebp),%edx
f010cb8c:	38 10                	cmp    %dl,(%eax)
f010cb8e:	75 0a                	jne    f010cb9a <_Z7memfindPKvij+0x21>
f010cb90:	eb 10                	jmp    f010cba2 <_Z7memfindPKvij+0x29>
f010cb92:	38 10                	cmp    %dl,(%eax)
f010cb94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cb98:	74 08                	je     f010cba2 <_Z7memfindPKvij+0x29>
memfind(const void *v, int c, size_t n)
{
	const unsigned char *s = (const unsigned char *) v;
	
	const unsigned char *ends = s + n;
	for (; s < ends; s++)
f010cb9a:	83 c0 01             	add    $0x1,%eax
f010cb9d:	39 c1                	cmp    %eax,%ecx
f010cb9f:	90                   	nop    
f010cba0:	77 f0                	ja     f010cb92 <_Z7memfindPKvij+0x19>
		if (*s == (unsigned char) c)
			break;
	return (void *) s;
}
f010cba2:	5d                   	pop    %ebp
f010cba3:	90                   	nop    
f010cba4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cba8:	c3                   	ret    

f010cba9 <_Z6strtolPKcPPci>:

long
strtol(const char *s, char **endptr, int base)
f010cba9:	55                   	push   %ebp
f010cbaa:	89 e5                	mov    %esp,%ebp
f010cbac:	57                   	push   %edi
f010cbad:	56                   	push   %esi
f010cbae:	53                   	push   %ebx
f010cbaf:	83 ec 04             	sub    $0x4,%esp
f010cbb2:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010cbb5:	8b 7d 10             	mov    0x10(%ebp),%edi
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
f010cbb8:	0f b6 01             	movzbl (%ecx),%eax
f010cbbb:	3c 20                	cmp    $0x20,%al
f010cbbd:	74 04                	je     f010cbc3 <_Z6strtolPKcPPci+0x1a>
f010cbbf:	3c 09                	cmp    $0x9,%al
f010cbc1:	75 0e                	jne    f010cbd1 <_Z6strtolPKcPPci+0x28>
		s++;
f010cbc3:	83 c1 01             	add    $0x1,%ecx
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
f010cbc6:	0f b6 01             	movzbl (%ecx),%eax
f010cbc9:	3c 20                	cmp    $0x20,%al
f010cbcb:	74 f6                	je     f010cbc3 <_Z6strtolPKcPPci+0x1a>
f010cbcd:	3c 09                	cmp    $0x9,%al
f010cbcf:	74 f2                	je     f010cbc3 <_Z6strtolPKcPPci+0x1a>
		s++;

	// plus/minus sign
	if (*s == '+')
f010cbd1:	3c 2b                	cmp    $0x2b,%al
f010cbd3:	75 0d                	jne    f010cbe2 <_Z6strtolPKcPPci+0x39>
		s++;
f010cbd5:	83 c1 01             	add    $0x1,%ecx
f010cbd8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
f010cbdf:	90                   	nop    
f010cbe0:	eb 15                	jmp    f010cbf7 <_Z6strtolPKcPPci+0x4e>
	else if (*s == '-')
f010cbe2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
f010cbe9:	3c 2d                	cmp    $0x2d,%al
f010cbeb:	75 0a                	jne    f010cbf7 <_Z6strtolPKcPPci+0x4e>
		s++, neg = 1;
f010cbed:	83 c1 01             	add    $0x1,%ecx
f010cbf0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
f010cbf7:	85 ff                	test   %edi,%edi
f010cbf9:	0f 94 c0             	sete   %al
f010cbfc:	74 05                	je     f010cc03 <_Z6strtolPKcPPci+0x5a>
f010cbfe:	83 ff 10             	cmp    $0x10,%edi
f010cc01:	75 1f                	jne    f010cc22 <_Z6strtolPKcPPci+0x79>
f010cc03:	80 39 30             	cmpb   $0x30,(%ecx)
f010cc06:	75 1a                	jne    f010cc22 <_Z6strtolPKcPPci+0x79>
f010cc08:	80 79 01 78          	cmpb   $0x78,0x1(%ecx)
f010cc0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cc10:	75 10                	jne    f010cc22 <_Z6strtolPKcPPci+0x79>
		s += 2, base = 16;
f010cc12:	83 c1 02             	add    $0x2,%ecx
f010cc15:	bf 10 00 00 00       	mov    $0x10,%edi
f010cc1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010cc20:	eb 2d                	jmp    f010cc4f <_Z6strtolPKcPPci+0xa6>
	else if (base == 0 && s[0] == '0')
f010cc22:	85 ff                	test   %edi,%edi
f010cc24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cc28:	75 18                	jne    f010cc42 <_Z6strtolPKcPPci+0x99>
f010cc2a:	80 39 30             	cmpb   $0x30,(%ecx)
f010cc2d:	8d 76 00             	lea    0x0(%esi),%esi
f010cc30:	75 18                	jne    f010cc4a <_Z6strtolPKcPPci+0xa1>
		s++, base = 8;
f010cc32:	83 c1 01             	add    $0x1,%ecx
f010cc35:	66 bf 08 00          	mov    $0x8,%di
f010cc39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f010cc40:	eb 0d                	jmp    f010cc4f <_Z6strtolPKcPPci+0xa6>
	else if (base == 0)
f010cc42:	84 c0                	test   %al,%al
f010cc44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cc48:	74 05                	je     f010cc4f <_Z6strtolPKcPPci+0xa6>
f010cc4a:	bf 0a 00 00 00       	mov    $0xa,%edi
f010cc4f:	be 00 00 00 00       	mov    $0x0,%esi

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
f010cc54:	0f b6 11             	movzbl (%ecx),%edx
f010cc57:	89 d3                	mov    %edx,%ebx
f010cc59:	8d 42 d0             	lea    -0x30(%edx),%eax
f010cc5c:	3c 09                	cmp    $0x9,%al
f010cc5e:	77 08                	ja     f010cc68 <_Z6strtolPKcPPci+0xbf>
			dig = *s - '0';
f010cc60:	0f be c2             	movsbl %dl,%eax
f010cc63:	8d 50 d0             	lea    -0x30(%eax),%edx
f010cc66:	eb 1c                	jmp    f010cc84 <_Z6strtolPKcPPci+0xdb>
		else if (*s >= 'a' && *s <= 'z')
f010cc68:	8d 43 9f             	lea    -0x61(%ebx),%eax
f010cc6b:	3c 19                	cmp    $0x19,%al
f010cc6d:	77 08                	ja     f010cc77 <_Z6strtolPKcPPci+0xce>
			dig = *s - 'a' + 10;
f010cc6f:	0f be c2             	movsbl %dl,%eax
f010cc72:	8d 50 a9             	lea    -0x57(%eax),%edx
f010cc75:	eb 0d                	jmp    f010cc84 <_Z6strtolPKcPPci+0xdb>
		else if (*s >= 'A' && *s <= 'Z')
f010cc77:	8d 43 bf             	lea    -0x41(%ebx),%eax
f010cc7a:	3c 19                	cmp    $0x19,%al
f010cc7c:	77 17                	ja     f010cc95 <_Z6strtolPKcPPci+0xec>
			dig = *s - 'A' + 10;
f010cc7e:	0f be c2             	movsbl %dl,%eax
f010cc81:	8d 50 c9             	lea    -0x37(%eax),%edx
		else
			break;
		if (dig >= base)
f010cc84:	39 fa                	cmp    %edi,%edx
f010cc86:	7d 0d                	jge    f010cc95 <_Z6strtolPKcPPci+0xec>
			break;
		s++, val = (val * base) + dig;
f010cc88:	83 c1 01             	add    $0x1,%ecx
f010cc8b:	89 f0                	mov    %esi,%eax
f010cc8d:	0f af c7             	imul   %edi,%eax
f010cc90:	8d 34 02             	lea    (%edx,%eax,1),%esi
f010cc93:	eb bf                	jmp    f010cc54 <_Z6strtolPKcPPci+0xab>
		s++, base = 8;
	else if (base == 0)
		base = 10;

	// digits
	while (1) {
f010cc95:	89 f0                	mov    %esi,%eax
			break;
		s++, val = (val * base) + dig;
		// we don't properly detect overflow!
	}

	if (endptr)
f010cc97:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
f010cc9b:	74 05                	je     f010cca2 <_Z6strtolPKcPPci+0xf9>
		*endptr = (char *) s;
f010cc9d:	8b 55 0c             	mov    0xc(%ebp),%edx
f010cca0:	89 0a                	mov    %ecx,(%edx)
	return (neg ? -val : val);
f010cca2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
f010cca6:	74 04                	je     f010ccac <_Z6strtolPKcPPci+0x103>
f010cca8:	89 c6                	mov    %eax,%esi
f010ccaa:	f7 de                	neg    %esi
}
f010ccac:	89 f0                	mov    %esi,%eax
f010ccae:	83 c4 04             	add    $0x4,%esp
f010ccb1:	5b                   	pop    %ebx
f010ccb2:	5e                   	pop    %esi
f010ccb3:	5f                   	pop    %edi
f010ccb4:	5d                   	pop    %ebp
f010ccb5:	c3                   	ret    
	...

f010ccc0 <__udivdi3>:
f010ccc0:	55                   	push   %ebp
f010ccc1:	89 e5                	mov    %esp,%ebp
f010ccc3:	57                   	push   %edi
f010ccc4:	56                   	push   %esi
f010ccc5:	83 ec 1c             	sub    $0x1c,%esp
f010ccc8:	8b 45 10             	mov    0x10(%ebp),%eax
f010cccb:	8b 55 08             	mov    0x8(%ebp),%edx
f010ccce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f010ccd1:	89 c6                	mov    %eax,%esi
f010ccd3:	8b 45 14             	mov    0x14(%ebp),%eax
f010ccd6:	89 55 ec             	mov    %edx,-0x14(%ebp)
f010ccd9:	89 4d dc             	mov    %ecx,-0x24(%ebp)
f010ccdc:	85 c0                	test   %eax,%eax
f010ccde:	75 38                	jne    f010cd18 <__udivdi3+0x58>
f010cce0:	39 ce                	cmp    %ecx,%esi
f010cce2:	77 4c                	ja     f010cd30 <__udivdi3+0x70>
f010cce4:	85 f6                	test   %esi,%esi
f010cce6:	75 0d                	jne    f010ccf5 <__udivdi3+0x35>
f010cce8:	b9 01 00 00 00       	mov    $0x1,%ecx
f010cced:	31 d2                	xor    %edx,%edx
f010ccef:	89 c8                	mov    %ecx,%eax
f010ccf1:	f7 f6                	div    %esi
f010ccf3:	89 c6                	mov    %eax,%esi
f010ccf5:	8b 7d dc             	mov    -0x24(%ebp),%edi
f010ccf8:	31 d2                	xor    %edx,%edx
f010ccfa:	8b 4d ec             	mov    -0x14(%ebp),%ecx
f010ccfd:	89 f8                	mov    %edi,%eax
f010ccff:	f7 f6                	div    %esi
f010cd01:	89 c7                	mov    %eax,%edi
f010cd03:	89 c8                	mov    %ecx,%eax
f010cd05:	f7 f6                	div    %esi
f010cd07:	89 fe                	mov    %edi,%esi
f010cd09:	89 c1                	mov    %eax,%ecx
f010cd0b:	89 c8                	mov    %ecx,%eax
f010cd0d:	89 f2                	mov    %esi,%edx
f010cd0f:	83 c4 1c             	add    $0x1c,%esp
f010cd12:	5e                   	pop    %esi
f010cd13:	5f                   	pop    %edi
f010cd14:	5d                   	pop    %ebp
f010cd15:	c3                   	ret    
f010cd16:	66 90                	xchg   %ax,%ax
f010cd18:	3b 45 dc             	cmp    -0x24(%ebp),%eax
f010cd1b:	76 2b                	jbe    f010cd48 <__udivdi3+0x88>
f010cd1d:	31 c9                	xor    %ecx,%ecx
f010cd1f:	31 f6                	xor    %esi,%esi
f010cd21:	89 c8                	mov    %ecx,%eax
f010cd23:	89 f2                	mov    %esi,%edx
f010cd25:	83 c4 1c             	add    $0x1c,%esp
f010cd28:	5e                   	pop    %esi
f010cd29:	5f                   	pop    %edi
f010cd2a:	5d                   	pop    %ebp
f010cd2b:	c3                   	ret    
f010cd2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cd30:	89 d1                	mov    %edx,%ecx
f010cd32:	8b 55 dc             	mov    -0x24(%ebp),%edx
f010cd35:	89 c8                	mov    %ecx,%eax
f010cd37:	f7 f6                	div    %esi
f010cd39:	31 f6                	xor    %esi,%esi
f010cd3b:	89 c1                	mov    %eax,%ecx
f010cd3d:	89 c8                	mov    %ecx,%eax
f010cd3f:	89 f2                	mov    %esi,%edx
f010cd41:	83 c4 1c             	add    $0x1c,%esp
f010cd44:	5e                   	pop    %esi
f010cd45:	5f                   	pop    %edi
f010cd46:	5d                   	pop    %ebp
f010cd47:	c3                   	ret    
f010cd48:	0f bd f8             	bsr    %eax,%edi
f010cd4b:	83 f7 1f             	xor    $0x1f,%edi
f010cd4e:	75 20                	jne    f010cd70 <__udivdi3+0xb0>
f010cd50:	3b 45 dc             	cmp    -0x24(%ebp),%eax
f010cd53:	72 05                	jb     f010cd5a <__udivdi3+0x9a>
f010cd55:	3b 75 ec             	cmp    -0x14(%ebp),%esi
f010cd58:	77 c3                	ja     f010cd1d <__udivdi3+0x5d>
f010cd5a:	b9 01 00 00 00       	mov    $0x1,%ecx
f010cd5f:	31 f6                	xor    %esi,%esi
f010cd61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f010cd68:	eb b7                	jmp    f010cd21 <__udivdi3+0x61>
f010cd6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010cd70:	89 f9                	mov    %edi,%ecx
f010cd72:	89 f2                	mov    %esi,%edx
f010cd74:	d3 e0                	shl    %cl,%eax
f010cd76:	b9 20 00 00 00       	mov    $0x20,%ecx
f010cd7b:	29 f9                	sub    %edi,%ecx
f010cd7d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
f010cd80:	d3 ea                	shr    %cl,%edx
f010cd82:	89 f9                	mov    %edi,%ecx
f010cd84:	d3 e6                	shl    %cl,%esi
f010cd86:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
f010cd8a:	09 d0                	or     %edx,%eax
f010cd8c:	89 75 f4             	mov    %esi,-0xc(%ebp)
f010cd8f:	8b 75 dc             	mov    -0x24(%ebp),%esi
f010cd92:	8b 55 dc             	mov    -0x24(%ebp),%edx
f010cd95:	89 45 f0             	mov    %eax,-0x10(%ebp)
f010cd98:	8b 45 ec             	mov    -0x14(%ebp),%eax
f010cd9b:	d3 ee                	shr    %cl,%esi
f010cd9d:	89 f9                	mov    %edi,%ecx
f010cd9f:	d3 e2                	shl    %cl,%edx
f010cda1:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
f010cda5:	d3 e8                	shr    %cl,%eax
f010cda7:	09 d0                	or     %edx,%eax
f010cda9:	89 f2                	mov    %esi,%edx
f010cdab:	f7 75 f0             	divl   -0x10(%ebp)
f010cdae:	89 d6                	mov    %edx,%esi
f010cdb0:	89 45 e0             	mov    %eax,-0x20(%ebp)
f010cdb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
f010cdb6:	f7 65 e0             	mull   -0x20(%ebp)
f010cdb9:	39 d6                	cmp    %edx,%esi
f010cdbb:	89 45 e8             	mov    %eax,-0x18(%ebp)
f010cdbe:	72 20                	jb     f010cde0 <__udivdi3+0x120>
f010cdc0:	74 0e                	je     f010cdd0 <__udivdi3+0x110>
f010cdc2:	8b 4d e0             	mov    -0x20(%ebp),%ecx
f010cdc5:	31 f6                	xor    %esi,%esi
f010cdc7:	e9 55 ff ff ff       	jmp    f010cd21 <__udivdi3+0x61>
f010cdcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cdd0:	8b 45 ec             	mov    -0x14(%ebp),%eax
f010cdd3:	89 f9                	mov    %edi,%ecx
f010cdd5:	d3 e0                	shl    %cl,%eax
f010cdd7:	3b 45 e8             	cmp    -0x18(%ebp),%eax
f010cdda:	73 e6                	jae    f010cdc2 <__udivdi3+0x102>
f010cddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cde0:	8b 4d e0             	mov    -0x20(%ebp),%ecx
f010cde3:	31 f6                	xor    %esi,%esi
f010cde5:	83 e9 01             	sub    $0x1,%ecx
f010cde8:	e9 34 ff ff ff       	jmp    f010cd21 <__udivdi3+0x61>
f010cded:	00 00                	add    %al,(%eax)
	...

f010cdf0 <__umoddi3>:
f010cdf0:	55                   	push   %ebp
f010cdf1:	89 e5                	mov    %esp,%ebp
f010cdf3:	57                   	push   %edi
f010cdf4:	56                   	push   %esi
f010cdf5:	83 ec 20             	sub    $0x20,%esp
f010cdf8:	8b 45 10             	mov    0x10(%ebp),%eax
f010cdfb:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010cdfe:	8b 75 0c             	mov    0xc(%ebp),%esi
f010ce01:	89 c7                	mov    %eax,%edi
f010ce03:	8b 45 14             	mov    0x14(%ebp),%eax
f010ce06:	89 4d e8             	mov    %ecx,-0x18(%ebp)
f010ce09:	89 4d ec             	mov    %ecx,-0x14(%ebp)
f010ce0c:	85 c0                	test   %eax,%eax
f010ce0e:	75 18                	jne    f010ce28 <__umoddi3+0x38>
f010ce10:	39 f7                	cmp    %esi,%edi
f010ce12:	76 24                	jbe    f010ce38 <__umoddi3+0x48>
f010ce14:	89 c8                	mov    %ecx,%eax
f010ce16:	89 f2                	mov    %esi,%edx
f010ce18:	f7 f7                	div    %edi
f010ce1a:	89 d0                	mov    %edx,%eax
f010ce1c:	31 d2                	xor    %edx,%edx
f010ce1e:	83 c4 20             	add    $0x20,%esp
f010ce21:	5e                   	pop    %esi
f010ce22:	5f                   	pop    %edi
f010ce23:	5d                   	pop    %ebp
f010ce24:	c3                   	ret    
f010ce25:	8d 76 00             	lea    0x0(%esi),%esi
f010ce28:	39 f0                	cmp    %esi,%eax
f010ce2a:	76 2c                	jbe    f010ce58 <__umoddi3+0x68>
f010ce2c:	89 c8                	mov    %ecx,%eax
f010ce2e:	89 f2                	mov    %esi,%edx
f010ce30:	83 c4 20             	add    $0x20,%esp
f010ce33:	5e                   	pop    %esi
f010ce34:	5f                   	pop    %edi
f010ce35:	5d                   	pop    %ebp
f010ce36:	c3                   	ret    
f010ce37:	90                   	nop    
f010ce38:	85 ff                	test   %edi,%edi
f010ce3a:	75 0b                	jne    f010ce47 <__umoddi3+0x57>
f010ce3c:	b8 01 00 00 00       	mov    $0x1,%eax
f010ce41:	31 d2                	xor    %edx,%edx
f010ce43:	f7 f7                	div    %edi
f010ce45:	89 c7                	mov    %eax,%edi
f010ce47:	89 f0                	mov    %esi,%eax
f010ce49:	31 d2                	xor    %edx,%edx
f010ce4b:	f7 f7                	div    %edi
f010ce4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
f010ce50:	f7 f7                	div    %edi
f010ce52:	eb c6                	jmp    f010ce1a <__umoddi3+0x2a>
f010ce54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010ce58:	0f bd d0             	bsr    %eax,%edx
f010ce5b:	83 f2 1f             	xor    $0x1f,%edx
f010ce5e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f010ce61:	75 1d                	jne    f010ce80 <__umoddi3+0x90>
f010ce63:	39 f0                	cmp    %esi,%eax
f010ce65:	0f 83 b5 00 00 00    	jae    f010cf20 <__umoddi3+0x130>
f010ce6b:	8b 4d ec             	mov    -0x14(%ebp),%ecx
f010ce6e:	29 f9                	sub    %edi,%ecx
f010ce70:	19 c6                	sbb    %eax,%esi
f010ce72:	89 4d ec             	mov    %ecx,-0x14(%ebp)
f010ce75:	8b 45 ec             	mov    -0x14(%ebp),%eax
f010ce78:	89 f2                	mov    %esi,%edx
f010ce7a:	eb b4                	jmp    f010ce30 <__umoddi3+0x40>
f010ce7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010ce80:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010ce84:	89 c2                	mov    %eax,%edx
f010ce86:	b8 20 00 00 00       	mov    $0x20,%eax
f010ce8b:	2b 45 e4             	sub    -0x1c(%ebp),%eax
f010ce8e:	d3 e2                	shl    %cl,%edx
f010ce90:	89 45 e0             	mov    %eax,-0x20(%ebp)
f010ce93:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
f010ce97:	89 f8                	mov    %edi,%eax
f010ce99:	d3 e8                	shr    %cl,%eax
f010ce9b:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010ce9f:	09 d0                	or     %edx,%eax
f010cea1:	89 f2                	mov    %esi,%edx
f010cea3:	89 45 f0             	mov    %eax,-0x10(%ebp)
f010cea6:	89 f0                	mov    %esi,%eax
f010cea8:	d3 e7                	shl    %cl,%edi
f010ceaa:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
f010ceae:	89 7d f4             	mov    %edi,-0xc(%ebp)
f010ceb1:	8b 7d e8             	mov    -0x18(%ebp),%edi
f010ceb4:	d3 e8                	shr    %cl,%eax
f010ceb6:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010ceba:	89 45 dc             	mov    %eax,-0x24(%ebp)
f010cebd:	8b 45 e8             	mov    -0x18(%ebp),%eax
f010cec0:	8b 75 dc             	mov    -0x24(%ebp),%esi
f010cec3:	d3 e2                	shl    %cl,%edx
f010cec5:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
f010cec9:	d3 e8                	shr    %cl,%eax
f010cecb:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010cecf:	09 d0                	or     %edx,%eax
f010ced1:	89 f2                	mov    %esi,%edx
f010ced3:	f7 75 f0             	divl   -0x10(%ebp)
f010ced6:	89 d6                	mov    %edx,%esi
f010ced8:	d3 e7                	shl    %cl,%edi
f010ceda:	f7 65 f4             	mull   -0xc(%ebp)
f010cedd:	39 d6                	cmp    %edx,%esi
f010cedf:	73 2f                	jae    f010cf10 <__umoddi3+0x120>
f010cee1:	2b 45 f4             	sub    -0xc(%ebp),%eax
f010cee4:	1b 55 f0             	sbb    -0x10(%ebp),%edx
f010cee7:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010ceeb:	29 c7                	sub    %eax,%edi
f010ceed:	19 d6                	sbb    %edx,%esi
f010ceef:	89 fa                	mov    %edi,%edx
f010cef1:	89 f0                	mov    %esi,%eax
f010cef3:	d3 ea                	shr    %cl,%edx
f010cef5:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
f010cef9:	d3 e0                	shl    %cl,%eax
f010cefb:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010ceff:	09 d0                	or     %edx,%eax
f010cf01:	89 f2                	mov    %esi,%edx
f010cf03:	d3 ea                	shr    %cl,%edx
f010cf05:	e9 26 ff ff ff       	jmp    f010ce30 <__umoddi3+0x40>
f010cf0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010cf10:	75 d5                	jne    f010cee7 <__umoddi3+0xf7>
f010cf12:	39 c7                	cmp    %eax,%edi
f010cf14:	73 d1                	jae    f010cee7 <__umoddi3+0xf7>
f010cf16:	66 90                	xchg   %ax,%ax
f010cf18:	eb c7                	jmp    f010cee1 <__umoddi3+0xf1>
f010cf1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010cf20:	3b 7d ec             	cmp    -0x14(%ebp),%edi
f010cf23:	90                   	nop    
f010cf24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cf28:	0f 87 47 ff ff ff    	ja     f010ce75 <__umoddi3+0x85>
f010cf2e:	66 90                	xchg   %ax,%ax
f010cf30:	e9 36 ff ff ff       	jmp    f010ce6b <__umoddi3+0x7b>
