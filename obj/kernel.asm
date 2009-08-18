
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
}

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt, ...)
{
f0109020:	55                   	push   %ebp
f0109021:	89 e5                	mov    %esp,%ebp
f0109023:	83 ec 18             	sub    $0x18,%esp
	va_list ap;

	va_start(ap, fmt);
	cprintf("kernel warning at %s:%d: ", file, line);
f0109026:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109029:	89 44 24 08          	mov    %eax,0x8(%esp)
f010902d:	8b 45 08             	mov    0x8(%ebp),%eax
f0109030:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109034:	c7 04 24 40 de 10 f0 	movl   $0xf010de40,(%esp)
f010903b:	e8 4f 35 00 00       	call   f010c58f <_Z7cprintfPKcz>
	vcprintf(fmt, ap);
f0109040:	8d 45 14             	lea    0x14(%ebp),%eax
f0109043:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109047:	8b 45 10             	mov    0x10(%ebp),%eax
f010904a:	89 04 24             	mov    %eax,(%esp)
f010904d:	e8 0a 35 00 00       	call   f010c55c <_Z8vcprintfPKcPc>
	cprintf("\n");
f0109052:	c7 04 24 b0 ed 10 f0 	movl   $0xf010edb0,(%esp)
f0109059:	e8 31 35 00 00       	call   f010c58f <_Z7cprintfPKcz>
	va_end(ap);
}
f010905e:	c9                   	leave  
f010905f:	c3                   	ret    

f0109060 <_Z6_panicPKciS0_z>:
 * Panic is called on unresolvable fatal errors.
 * It prints "panic: mesg", and then enters the kernel monitor.
 */
void
_panic(const char *file, int line, const char *fmt, ...)
{
f0109060:	55                   	push   %ebp
f0109061:	89 e5                	mov    %esp,%ebp
f0109063:	83 ec 18             	sub    $0x18,%esp
	va_list ap;

	if (panicstr)
f0109066:	83 3d c0 ed 18 f0 00 	cmpl   $0x0,0xf018edc0
f010906d:	75 40                	jne    f01090af <_Z6_panicPKciS0_z+0x4f>
		goto dead;
	panicstr = fmt;
f010906f:	8b 45 10             	mov    0x10(%ebp),%eax
f0109072:	a3 c0 ed 18 f0       	mov    %eax,0xf018edc0

	va_start(ap, fmt);
	cprintf("kernel panic at %s:%d: ", file, line);
f0109077:	8b 45 0c             	mov    0xc(%ebp),%eax
f010907a:	89 44 24 08          	mov    %eax,0x8(%esp)
f010907e:	8b 45 08             	mov    0x8(%ebp),%eax
f0109081:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109085:	c7 04 24 5a de 10 f0 	movl   $0xf010de5a,(%esp)
f010908c:	e8 fe 34 00 00       	call   f010c58f <_Z7cprintfPKcz>
	vcprintf(fmt, ap);
f0109091:	8d 45 14             	lea    0x14(%ebp),%eax
f0109094:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109098:	8b 45 10             	mov    0x10(%ebp),%eax
f010909b:	89 04 24             	mov    %eax,(%esp)
f010909e:	e8 b9 34 00 00       	call   f010c55c <_Z8vcprintfPKcPc>
	cprintf("\n");
f01090a3:	c7 04 24 b0 ed 10 f0 	movl   $0xf010edb0,(%esp)
f01090aa:	e8 e0 34 00 00       	call   f010c58f <_Z7cprintfPKcz>
	va_end(ap);

dead:
	/* break into the kernel monitor */
	while (1)
		monitor(NULL);
f01090af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f01090b6:	e8 dd 08 00 00       	call   f0109998 <_Z7monitorP9Trapframe>
f01090bb:	eb f2                	jmp    f01090af <_Z6_panicPKciS0_z+0x4f>

f01090bd <i386_init>:


extern "C" {
void
i386_init(void)
{
f01090bd:	55                   	push   %ebp
f01090be:	89 e5                	mov    %esp,%ebp
f01090c0:	53                   	push   %ebx
f01090c1:	83 ec 14             	sub    $0x14,%esp
	extern const uint32_t sctors[], ectors[];
	const uint32_t *ctorva;

	// Initialize the console.
	// Can't call cprintf until after we do this!
	cons_init();
f01090c4:	e8 be 01 00 00       	call   f0109287 <_Z9cons_initv>

	// Then call any global constructors.
	// This relies on linker script magic to define the 'sctors' and
	// 'ectors' symbols; see kern/kernel.ld.
	// Call after cons_init() so we can cprintf() if necessary.
	for (ctorva = ectors; ctorva > sctors; )
f01090c9:	b8 04 e0 11 f0       	mov    $0xf011e004,%eax
f01090ce:	3d 00 e0 11 f0       	cmp    $0xf011e000,%eax
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
f01090dc:	81 fb 00 e0 11 f0    	cmp    $0xf011e000,%ebx
f01090e2:	77 f3                	ja     f01090d7 <i386_init+0x1a>
		((void(*)()) *--ctorva)();

	cprintf("6828 decimal is %o octal!\n", 6828);
f01090e4:	c7 44 24 04 ac 1a 00 	movl   $0x1aac,0x4(%esp)
f01090eb:	00 
f01090ec:	c7 04 24 72 de 10 f0 	movl   $0xf010de72,(%esp)
f01090f3:	e8 97 34 00 00       	call   f010c58f <_Z7cprintfPKcz>

	// Lab 2 memory management initialization functions
	mem_init();
f01090f8:	e8 58 17 00 00       	call   f010a855 <_Z8mem_initv>

	// Lab 2 interrupt and gate descriptor initialization functions
	idt_init();
f01090fd:	e8 eb 34 00 00       	call   f010c5ed <_Z8idt_initv>

	// Lab 3 user environment initialization functions
	env_init();
f0109102:	e8 d0 2f 00 00       	call   f010c0d7 <_Z8env_initv>
#ifdef TEST
	// Don't touch -- used by grading script!
	ENV_CREATE2(TEST, TESTSIZE);
#else
	// Touch all you want.
	ENV_CREATE(user_hello);
f0109107:	c7 44 24 04 f0 9a 00 	movl   $0x9af0,0x4(%esp)
f010910e:	00 
f010910f:	c7 04 24 c4 e0 11 f0 	movl   $0xf011e0c4,(%esp)
f0109116:	e8 e7 31 00 00       	call   f010c302 <_Z10env_createPhj>
#endif // TEST*

	// We only have one user environment for now, so just run it.
	env_run(&envs[0]);
f010911b:	a1 80 40 19 f0       	mov    0xf0194080,%eax
f0109120:	89 04 24             	mov    %eax,(%esp)
f0109123:	e8 89 2d 00 00       	call   f010beb1 <_Z7env_runP3Env>
	...

f0109130 <_Z16serial_proc_datav>:

static bool serial_exists;

int
serial_proc_data(void)
{
f0109130:	55                   	push   %ebp
f0109131:	89 e5                	mov    %esp,%ebp

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f0109133:	ba fd 03 00 00       	mov    $0x3fd,%edx
f0109138:	ec                   	in     (%dx),%al
f0109139:	89 c2                	mov    %eax,%edx
	if (!(inb(COM1+COM_LSR) & COM_LSR_DATA))
f010913b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f0109140:	f6 c2 01             	test   $0x1,%dl
f0109143:	74 09                	je     f010914e <_Z16serial_proc_datav+0x1e>
f0109145:	ba f8 03 00 00       	mov    $0x3f8,%edx
f010914a:	ec                   	in     (%dx),%al
		return -1;
	return inb(COM1+COM_RX);
f010914b:	0f b6 c0             	movzbl %al,%eax
}
f010914e:	5d                   	pop    %ebp
f010914f:	c3                   	ret    

f0109150 <_Z11serial_initv>:
		cons_intr(serial_proc_data);
}

void
serial_init(void)
{
f0109150:	55                   	push   %ebp
f0109151:	89 e5                	mov    %esp,%ebp
f0109153:	53                   	push   %ebx
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f0109154:	bb fa 03 00 00       	mov    $0x3fa,%ebx
f0109159:	b8 00 00 00 00       	mov    $0x0,%eax
f010915e:	89 da                	mov    %ebx,%edx
f0109160:	ee                   	out    %al,(%dx)
f0109161:	b2 fb                	mov    $0xfb,%dl
f0109163:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
f0109168:	ee                   	out    %al,(%dx)
f0109169:	b9 f8 03 00 00       	mov    $0x3f8,%ecx
f010916e:	b8 0c 00 00 00       	mov    $0xc,%eax
f0109173:	89 ca                	mov    %ecx,%edx
f0109175:	ee                   	out    %al,(%dx)
f0109176:	b2 f9                	mov    $0xf9,%dl
f0109178:	b8 00 00 00 00       	mov    $0x0,%eax
f010917d:	ee                   	out    %al,(%dx)
f010917e:	b2 fb                	mov    $0xfb,%dl
f0109180:	b8 03 00 00 00       	mov    $0x3,%eax
f0109185:	ee                   	out    %al,(%dx)
f0109186:	b2 fc                	mov    $0xfc,%dl
f0109188:	b8 00 00 00 00       	mov    $0x0,%eax
f010918d:	ee                   	out    %al,(%dx)
f010918e:	b2 f9                	mov    $0xf9,%dl
f0109190:	b8 01 00 00 00       	mov    $0x1,%eax
f0109195:	ee                   	out    %al,(%dx)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f0109196:	b2 fd                	mov    $0xfd,%dl
f0109198:	ec                   	in     (%dx),%al
	// Enable rcv interrupts
	outb(COM1+COM_IER, COM_IER_RDI);

	// Clear any preexisting overrun indications and interrupts
	// Serial port doesn't exist if COM_LSR returns 0xFF
	serial_exists = (inb(COM1+COM_LSR) != 0xFF);
f0109199:	3c ff                	cmp    $0xff,%al
f010919b:	0f 95 05 e0 ed 18 f0 	setne  0xf018ede0
f01091a2:	89 da                	mov    %ebx,%edx
f01091a4:	ec                   	in     (%dx),%al
f01091a5:	89 ca                	mov    %ecx,%edx
f01091a7:	ec                   	in     (%dx),%al
	(void) inb(COM1+COM_IIR);
	(void) inb(COM1+COM_RX);

}
f01091a8:	5b                   	pop    %ebx
f01091a9:	5d                   	pop    %ebp
f01091aa:	c3                   	ret    

f01091ab <_Z8kbd_initv>:
	cons_intr(kbd_proc_data);
}

void
kbd_init(void)
{
f01091ab:	55                   	push   %ebp
f01091ac:	89 e5                	mov    %esp,%ebp
}
f01091ae:	5d                   	pop    %ebp
f01091af:	c3                   	ret    

f01091b0 <_Z9cons_intrPFivE>:

// called by device interrupt routines to feed input characters
// into the circular console input buffer.
void
cons_intr(int (*proc)(void))
{
f01091b0:	55                   	push   %ebp
f01091b1:	89 e5                	mov    %esp,%ebp
f01091b3:	57                   	push   %edi
f01091b4:	56                   	push   %esi
f01091b5:	53                   	push   %ebx
f01091b6:	83 ec 0c             	sub    $0xc,%esp
f01091b9:	8b 75 08             	mov    0x8(%ebp),%esi
	int c;

	while ((c = (*proc)()) != -1) {
		if (c == 0)
			continue;
		cons.buf[cons.wpos++] = c;
f01091bc:	bb 04 40 19 f0       	mov    $0xf0194004,%ebx
f01091c1:	bf 00 3e 19 f0       	mov    $0xf0193e00,%edi
void
cons_intr(int (*proc)(void))
{
	int c;

	while ((c = (*proc)()) != -1) {
f01091c6:	eb 1e                	jmp    f01091e6 <_Z9cons_intrPFivE+0x36>
		if (c == 0)
f01091c8:	85 c0                	test   %eax,%eax
f01091ca:	74 1a                	je     f01091e6 <_Z9cons_intrPFivE+0x36>
			continue;
		cons.buf[cons.wpos++] = c;
f01091cc:	8b 13                	mov    (%ebx),%edx
f01091ce:	88 04 17             	mov    %al,(%edi,%edx,1)
f01091d1:	8d 42 01             	lea    0x1(%edx),%eax
		if (cons.wpos == CONSBUFSIZE)
f01091d4:	3d 00 02 00 00       	cmp    $0x200,%eax
			cons.wpos = 0;
f01091d9:	0f 94 c2             	sete   %dl
f01091dc:	0f b6 d2             	movzbl %dl,%edx
f01091df:	83 ea 01             	sub    $0x1,%edx
f01091e2:	21 d0                	and    %edx,%eax
f01091e4:	89 03                	mov    %eax,(%ebx)
void
cons_intr(int (*proc)(void))
{
	int c;

	while ((c = (*proc)()) != -1) {
f01091e6:	ff d6                	call   *%esi
f01091e8:	83 f8 ff             	cmp    $0xffffffff,%eax
f01091eb:	75 db                	jne    f01091c8 <_Z9cons_intrPFivE+0x18>
			continue;
		cons.buf[cons.wpos++] = c;
		if (cons.wpos == CONSBUFSIZE)
			cons.wpos = 0;
	}
}
f01091ed:	83 c4 0c             	add    $0xc,%esp
f01091f0:	5b                   	pop    %ebx
f01091f1:	5e                   	pop    %esi
f01091f2:	5f                   	pop    %edi
f01091f3:	5d                   	pop    %ebp
f01091f4:	c3                   	ret    

f01091f5 <_Z8kbd_intrv>:
	return c;
}

void
kbd_intr(void)
{
f01091f5:	55                   	push   %ebp
f01091f6:	89 e5                	mov    %esp,%ebp
f01091f8:	83 ec 18             	sub    $0x18,%esp
	cons_intr(kbd_proc_data);
f01091fb:	c7 04 24 19 94 10 f0 	movl   $0xf0109419,(%esp)
f0109202:	e8 a9 ff ff ff       	call   f01091b0 <_Z9cons_intrPFivE>
}
f0109207:	c9                   	leave  
f0109208:	c3                   	ret    

f0109209 <_Z11serial_intrv>:
	return inb(COM1+COM_RX);
}

void
serial_intr(void)
{
f0109209:	55                   	push   %ebp
f010920a:	89 e5                	mov    %esp,%ebp
f010920c:	83 ec 18             	sub    $0x18,%esp
	if (serial_exists)
f010920f:	80 3d e0 ed 18 f0 00 	cmpb   $0x0,0xf018ede0
f0109216:	74 0c                	je     f0109224 <_Z11serial_intrv+0x1b>
		cons_intr(serial_proc_data);
f0109218:	c7 04 24 30 91 10 f0 	movl   $0xf0109130,(%esp)
f010921f:	e8 8c ff ff ff       	call   f01091b0 <_Z9cons_intrPFivE>
}
f0109224:	c9                   	leave  
f0109225:	c3                   	ret    

f0109226 <_Z9cons_getcv>:
}

// return the next input character from the console, or 0 if none waiting
int
cons_getc(void)
{
f0109226:	55                   	push   %ebp
f0109227:	89 e5                	mov    %esp,%ebp
f0109229:	83 ec 08             	sub    $0x8,%esp
	int c;

	// poll for any pending input characters,
	// so that this function works even when interrupts are disabled
	// (e.g., when called from the kernel monitor).
	serial_intr();
f010922c:	e8 d8 ff ff ff       	call   f0109209 <_Z11serial_intrv>
	kbd_intr();
f0109231:	e8 bf ff ff ff       	call   f01091f5 <_Z8kbd_intrv>

	// grab the next character from the input buffer.
	if (cons.rpos != cons.wpos) {
f0109236:	8b 15 00 40 19 f0    	mov    0xf0194000,%edx
f010923c:	b8 00 00 00 00       	mov    $0x0,%eax
f0109241:	3b 15 04 40 19 f0    	cmp    0xf0194004,%edx
f0109247:	74 21                	je     f010926a <_Z9cons_getcv+0x44>
		c = cons.buf[cons.rpos++];
f0109249:	0f b6 82 00 3e 19 f0 	movzbl -0xfe6c200(%edx),%eax
f0109250:	83 c2 01             	add    $0x1,%edx
		if (cons.rpos == CONSBUFSIZE)
f0109253:	81 fa 00 02 00 00    	cmp    $0x200,%edx
			cons.rpos = 0;
f0109259:	0f 94 c1             	sete   %cl
f010925c:	0f b6 c9             	movzbl %cl,%ecx
f010925f:	83 e9 01             	sub    $0x1,%ecx
f0109262:	21 ca                	and    %ecx,%edx
f0109264:	89 15 00 40 19 f0    	mov    %edx,0xf0194000
		return c;
	}
	return 0;
}
f010926a:	c9                   	leave  
f010926b:	c3                   	ret    

f010926c <_Z7getcharv>:
	cons_putc(c);
}

int
getchar(void)
{
f010926c:	55                   	push   %ebp
f010926d:	89 e5                	mov    %esp,%ebp
f010926f:	83 ec 08             	sub    $0x8,%esp
	int c;

	while ((c = cons_getc()) == 0)
f0109272:	e8 af ff ff ff       	call   f0109226 <_Z9cons_getcv>
f0109277:	85 c0                	test   %eax,%eax
f0109279:	74 f7                	je     f0109272 <_Z7getcharv+0x6>
		/* do nothing */;
	return c;
}
f010927b:	c9                   	leave  
f010927c:	c3                   	ret    

f010927d <_Z6isconsi>:

int
iscons(int fdnum)
{
f010927d:	55                   	push   %ebp
f010927e:	89 e5                	mov    %esp,%ebp
	// used by readline
	return 1;
}
f0109280:	b8 01 00 00 00       	mov    $0x1,%eax
f0109285:	5d                   	pop    %ebp
f0109286:	c3                   	ret    

f0109287 <_Z9cons_initv>:
}

// initialize the console devices
void
cons_init(void)
{
f0109287:	55                   	push   %ebp
f0109288:	89 e5                	mov    %esp,%ebp
f010928a:	83 ec 28             	sub    $0x28,%esp
f010928d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f0109290:	89 75 f8             	mov    %esi,-0x8(%ebp)
f0109293:	89 7d fc             	mov    %edi,-0x4(%ebp)

static void
cga_init(void)
{
	volatile uint16_t *cp = (uint16_t*) (KERNBASE + CGA_BUF);
	uint16_t was = *cp;
f0109296:	b8 00 80 0b f0       	mov    $0xf00b8000,%eax
f010929b:	0f b7 10             	movzwl (%eax),%edx
	*cp = (uint16_t) 0xA55A;
f010929e:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
	if (*cp != 0xA55A) {
f01092a3:	0f b7 00             	movzwl (%eax),%eax
f01092a6:	66 3d 5a a5          	cmp    $0xa55a,%ax
f01092aa:	74 11                	je     f01092bd <_Z9cons_initv+0x36>
		cp = (uint16_t*) (KERNBASE + MONO_BUF);
		addr_6845 = MONO_BASE;
f01092ac:	c7 05 e4 ed 18 f0 b4 	movl   $0x3b4,0xf018ede4
f01092b3:	03 00 00 
f01092b6:	be 00 00 0b f0       	mov    $0xf00b0000,%esi
f01092bb:	eb 16                	jmp    f01092d3 <_Z9cons_initv+0x4c>
	} else {
		*cp = was;
f01092bd:	66 89 15 00 80 0b f0 	mov    %dx,0xf00b8000
		addr_6845 = CGA_BASE;
f01092c4:	c7 05 e4 ed 18 f0 d4 	movl   $0x3d4,0xf018ede4
f01092cb:	03 00 00 
f01092ce:	be 00 80 0b f0       	mov    $0xf00b8000,%esi
	}
	
	/* Extract cursor location */
	outb(addr_6845, 14);
f01092d3:	8b 0d e4 ed 18 f0    	mov    0xf018ede4,%ecx
f01092d9:	89 cb                	mov    %ecx,%ebx
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f01092db:	b8 0e 00 00 00       	mov    $0xe,%eax
f01092e0:	89 ca                	mov    %ecx,%edx
f01092e2:	ee                   	out    %al,(%dx)
	unsigned pos = inb(addr_6845 + 1) << 8;
f01092e3:	83 c1 01             	add    $0x1,%ecx

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f01092e6:	89 ca                	mov    %ecx,%edx
f01092e8:	ec                   	in     (%dx),%al
f01092e9:	0f b6 f8             	movzbl %al,%edi
f01092ec:	c1 e7 08             	shl    $0x8,%edi
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f01092ef:	b8 0f 00 00 00       	mov    $0xf,%eax
f01092f4:	89 da                	mov    %ebx,%edx
f01092f6:	ee                   	out    %al,(%dx)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f01092f7:	89 ca                	mov    %ecx,%edx
f01092f9:	ec                   	in     (%dx),%al
	outb(addr_6845, 15);
	pos |= inb(addr_6845 + 1);

	crt_buf = (uint16_t*) cp;
f01092fa:	89 35 e8 ed 18 f0    	mov    %esi,0xf018ede8
	crt_pos = pos;
f0109300:	0f b6 c8             	movzbl %al,%ecx
f0109303:	09 cf                	or     %ecx,%edi
f0109305:	66 89 3d ec ed 18 f0 	mov    %di,0xf018edec
void
cons_init(void)
{
	cga_init();
	kbd_init();
	serial_init();
f010930c:	e8 3f fe ff ff       	call   f0109150 <_Z11serial_initv>

	if (!serial_exists)
f0109311:	80 3d e0 ed 18 f0 00 	cmpb   $0x0,0xf018ede0
f0109318:	75 0c                	jne    f0109326 <_Z9cons_initv+0x9f>
		cprintf("Serial port does not exist!\n");
f010931a:	c7 04 24 8d de 10 f0 	movl   $0xf010de8d,(%esp)
f0109321:	e8 69 32 00 00       	call   f010c58f <_Z7cprintfPKcz>
}
f0109326:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f0109329:	8b 75 f8             	mov    -0x8(%ebp),%esi
f010932c:	8b 7d fc             	mov    -0x4(%ebp),%edi
f010932f:	89 ec                	mov    %ebp,%esp
f0109331:	5d                   	pop    %ebp
f0109332:	c3                   	ret    

f0109333 <_ZL16cga_savebuf_copyib>:
#if CRT_SAVEROWS > 0
// Copy one screen's worth of data to or from the save buffer,
// starting at line 'first_line'.
static void
cga_savebuf_copy(int first_line, bool to_screen)
{
f0109333:	55                   	push   %ebp
f0109334:	89 e5                	mov    %esp,%ebp
f0109336:	83 ec 38             	sub    $0x38,%esp
f0109339:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f010933c:	89 75 f8             	mov    %esi,-0x8(%ebp)
f010933f:	89 7d fc             	mov    %edi,-0x4(%ebp)
f0109342:	88 55 e7             	mov    %dl,-0x19(%ebp)
	// Calculate the beginning & end of the save buffer area.
	uint16_t *pos = crtsave_buf + (first_line % CRT_SAVEROWS) * CRT_COLS;
f0109345:	89 c2                	mov    %eax,%edx
f0109347:	c1 fa 1f             	sar    $0x1f,%edx
f010934a:	c1 ea 19             	shr    $0x19,%edx
f010934d:	01 d0                	add    %edx,%eax
f010934f:	83 e0 7f             	and    $0x7f,%eax
f0109352:	29 d0                	sub    %edx,%eax
f0109354:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
f0109357:	c1 e3 05             	shl    $0x5,%ebx
f010935a:	81 c3 00 ee 18 f0    	add    $0xf018ee00,%ebx
	uint16_t *end = pos + CRT_ROWS * CRT_COLS;
f0109360:	8d bb a0 0f 00 00    	lea    0xfa0(%ebx),%edi
	// Check for wraparound.
	uint16_t *trueend = min(end, crtsave_buf + CRT_SAVEROWS * CRT_COLS);
f0109366:	c7 44 24 04 00 3e 19 	movl   $0xf0193e00,0x4(%esp)
f010936d:	f0 
f010936e:	89 3c 24             	mov    %edi,(%esp)
f0109371:	e8 f1 04 00 00       	call   f0109867 <_Z3minIPtET_S1_S1_>
f0109376:	89 c6                	mov    %eax,%esi

	// Copy the initial portion.
	if (to_screen)
f0109378:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
f010937c:	74 1c                	je     f010939a <_ZL16cga_savebuf_copyib+0x67>
		memcpy(crt_buf, pos, (trueend - pos) * sizeof(uint16_t));
f010937e:	29 d8                	sub    %ebx,%eax
f0109380:	83 e0 fe             	and    $0xfffffffe,%eax
f0109383:	89 44 24 08          	mov    %eax,0x8(%esp)
f0109387:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010938b:	a1 e8 ed 18 f0       	mov    0xf018ede8,%eax
f0109390:	89 04 24             	mov    %eax,(%esp)
f0109393:	e8 fb 45 00 00       	call   f010d993 <memcpy>
f0109398:	eb 1a                	jmp    f01093b4 <_ZL16cga_savebuf_copyib+0x81>
	else
		memcpy(pos, crt_buf, (trueend - pos) * sizeof(uint16_t));
f010939a:	29 d8                	sub    %ebx,%eax
f010939c:	83 e0 fe             	and    $0xfffffffe,%eax
f010939f:	89 44 24 08          	mov    %eax,0x8(%esp)
f01093a3:	a1 e8 ed 18 f0       	mov    0xf018ede8,%eax
f01093a8:	89 44 24 04          	mov    %eax,0x4(%esp)
f01093ac:	89 1c 24             	mov    %ebx,(%esp)
f01093af:	e8 df 45 00 00       	call   f010d993 <memcpy>

	// If there was wraparound, copy the second part of the screen.
	if (end == trueend)
f01093b4:	39 f7                	cmp    %esi,%edi
f01093b6:	74 54                	je     f010940c <_ZL16cga_savebuf_copyib+0xd9>
		/* do nothing */;
	else if (to_screen)
f01093b8:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
f01093bc:	74 28                	je     f01093e6 <_ZL16cga_savebuf_copyib+0xb3>
		memcpy(crt_buf + (trueend - pos), crtsave_buf, (end - trueend) * sizeof(uint16_t));
f01093be:	29 f7                	sub    %esi,%edi
f01093c0:	83 e7 fe             	and    $0xfffffffe,%edi
f01093c3:	89 7c 24 08          	mov    %edi,0x8(%esp)
f01093c7:	c7 44 24 04 00 ee 18 	movl   $0xf018ee00,0x4(%esp)
f01093ce:	f0 
f01093cf:	29 de                	sub    %ebx,%esi
f01093d1:	89 f3                	mov    %esi,%ebx
f01093d3:	83 e3 fe             	and    $0xfffffffe,%ebx
f01093d6:	03 1d e8 ed 18 f0    	add    0xf018ede8,%ebx
f01093dc:	89 1c 24             	mov    %ebx,(%esp)
f01093df:	e8 af 45 00 00       	call   f010d993 <memcpy>
f01093e4:	eb 26                	jmp    f010940c <_ZL16cga_savebuf_copyib+0xd9>
	else
		memcpy(crtsave_buf, crt_buf + (trueend - pos), (end - trueend) * sizeof(uint16_t));
f01093e6:	29 f7                	sub    %esi,%edi
f01093e8:	83 e7 fe             	and    $0xfffffffe,%edi
f01093eb:	89 7c 24 08          	mov    %edi,0x8(%esp)
f01093ef:	29 de                	sub    %ebx,%esi
f01093f1:	89 f3                	mov    %esi,%ebx
f01093f3:	83 e3 fe             	and    $0xfffffffe,%ebx
f01093f6:	03 1d e8 ed 18 f0    	add    0xf018ede8,%ebx
f01093fc:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f0109400:	c7 04 24 00 ee 18 f0 	movl   $0xf018ee00,(%esp)
f0109407:	e8 87 45 00 00       	call   f010d993 <memcpy>
}
f010940c:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f010940f:	8b 75 f8             	mov    -0x8(%ebp),%esi
f0109412:	8b 7d fc             	mov    -0x4(%ebp),%edi
f0109415:	89 ec                	mov    %ebp,%esp
f0109417:	5d                   	pop    %ebp
f0109418:	c3                   	ret    

f0109419 <_ZL13kbd_proc_datav>:
 * Get data from the keyboard.  If we finish a character, return it.  Else 0.
 * Return -1 if no data.
 */
static int
kbd_proc_data(void)
{
f0109419:	55                   	push   %ebp
f010941a:	89 e5                	mov    %esp,%ebp
f010941c:	83 ec 38             	sub    $0x38,%esp
f010941f:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f0109422:	89 75 f8             	mov    %esi,-0x8(%ebp)
f0109425:	89 7d fc             	mov    %edi,-0x4(%ebp)
f0109428:	ba 64 00 00 00       	mov    $0x64,%edx
f010942d:	ec                   	in     (%dx),%al
	int c;
	uint8_t data;
	static uint32_t shift;

	if ((inb(KBSTATP) & KBS_DIB) == 0)
f010942e:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
f0109433:	a8 01                	test   $0x1,%al
f0109435:	0f 84 93 01 00 00    	je     f01095ce <_ZL13kbd_proc_datav+0x1b5>
f010943b:	b2 60                	mov    $0x60,%dl
f010943d:	ec                   	in     (%dx),%al
		return -1;

	data = inb(KBDATAP);

	if (data == 0xE0) {
f010943e:	3c e0                	cmp    $0xe0,%al
f0109440:	75 11                	jne    f0109453 <_ZL13kbd_proc_datav+0x3a>
		// E0 escape character
		shift |= E0ESC;
f0109442:	83 0d 08 40 19 f0 40 	orl    $0x40,0xf0194008
f0109449:	bb 00 00 00 00       	mov    $0x0,%ebx
		return 0;
f010944e:	e9 7b 01 00 00       	jmp    f01095ce <_ZL13kbd_proc_datav+0x1b5>
	} else if (data & 0x80) {
f0109453:	84 c0                	test   %al,%al
f0109455:	79 32                	jns    f0109489 <_ZL13kbd_proc_datav+0x70>
		// Key released
		data = (shift & E0ESC ? data : data & 0x7F);
f0109457:	8b 15 08 40 19 f0    	mov    0xf0194008,%edx
f010945d:	f6 c2 40             	test   $0x40,%dl
f0109460:	75 03                	jne    f0109465 <_ZL13kbd_proc_datav+0x4c>
f0109462:	83 e0 7f             	and    $0x7f,%eax
		shift &= ~(shiftcode[data] | E0ESC);
f0109465:	0f b6 c0             	movzbl %al,%eax
f0109468:	0f b6 80 c0 de 10 f0 	movzbl -0xfef2140(%eax),%eax
f010946f:	83 c8 40             	or     $0x40,%eax
f0109472:	0f b6 c0             	movzbl %al,%eax
f0109475:	f7 d0                	not    %eax
f0109477:	21 c2                	and    %eax,%edx
f0109479:	89 15 08 40 19 f0    	mov    %edx,0xf0194008
f010947f:	bb 00 00 00 00       	mov    $0x0,%ebx
		return 0;
f0109484:	e9 45 01 00 00       	jmp    f01095ce <_ZL13kbd_proc_datav+0x1b5>
	} else if (shift & E0ESC) {
f0109489:	8b 15 08 40 19 f0    	mov    0xf0194008,%edx
f010948f:	f6 c2 40             	test   $0x40,%dl
f0109492:	74 0c                	je     f01094a0 <_ZL13kbd_proc_datav+0x87>
		// Last character was an E0 escape; or with 0x80
		data |= 0x80;
f0109494:	83 c8 80             	or     $0xffffff80,%eax
		shift &= ~E0ESC;
f0109497:	83 e2 bf             	and    $0xffffffbf,%edx
f010949a:	89 15 08 40 19 f0    	mov    %edx,0xf0194008
	}

	shift |= shiftcode[data];
f01094a0:	0f b6 c0             	movzbl %al,%eax
	shift ^= togglecode[data];
f01094a3:	0f b6 90 c0 de 10 f0 	movzbl -0xfef2140(%eax),%edx
f01094aa:	0b 15 08 40 19 f0    	or     0xf0194008,%edx
f01094b0:	0f b6 88 c0 df 10 f0 	movzbl -0xfef2040(%eax),%ecx
f01094b7:	31 ca                	xor    %ecx,%edx
f01094b9:	89 15 08 40 19 f0    	mov    %edx,0xf0194008

	c = charcode[shift & (CTL | SHIFT)][data];
f01094bf:	89 d1                	mov    %edx,%ecx
f01094c1:	83 e1 03             	and    $0x3,%ecx
f01094c4:	8b 1c 8d c0 e0 10 f0 	mov    -0xfef1f40(,%ecx,4),%ebx
f01094cb:	0f b6 1c 03          	movzbl (%ebx,%eax,1),%ebx
	if (shift & CAPSLOCK) {
f01094cf:	f6 c2 08             	test   $0x8,%dl
f01094d2:	74 1a                	je     f01094ee <_ZL13kbd_proc_datav+0xd5>
		if ('a' <= c && c <= 'z')
f01094d4:	89 de                	mov    %ebx,%esi
f01094d6:	8d 43 9f             	lea    -0x61(%ebx),%eax
f01094d9:	83 f8 19             	cmp    $0x19,%eax
f01094dc:	77 05                	ja     f01094e3 <_ZL13kbd_proc_datav+0xca>
			c += 'A' - 'a';
f01094de:	83 eb 20             	sub    $0x20,%ebx
f01094e1:	eb 0b                	jmp    f01094ee <_ZL13kbd_proc_datav+0xd5>
		else if ('A' <= c && c <= 'Z')
f01094e3:	83 ee 41             	sub    $0x41,%esi
f01094e6:	83 fe 19             	cmp    $0x19,%esi
f01094e9:	77 03                	ja     f01094ee <_ZL13kbd_proc_datav+0xd5>
			c += 'a' - 'A';
f01094eb:	83 c3 20             	add    $0x20,%ebx
	}

	// Process special keys
#if CRT_SAVEROWS > 0
	// Shift-PageUp and Shift-PageDown: scroll console
	if ((shift & (CTL | SHIFT)) && (c == KEY_PGUP || c == KEY_PGDN)) {
f01094ee:	85 c9                	test   %ecx,%ecx
f01094f0:	0f 84 b2 00 00 00    	je     f01095a8 <_ZL13kbd_proc_datav+0x18f>
f01094f6:	8d 83 1a ff ff ff    	lea    -0xe6(%ebx),%eax
f01094fc:	83 f8 01             	cmp    $0x1,%eax
f01094ff:	0f 87 a3 00 00 00    	ja     f01095a8 <_ZL13kbd_proc_datav+0x18f>
		cga_scroll(c == KEY_PGUP ? -CRT_ROWS : CRT_ROWS);
f0109505:	81 fb e6 00 00 00    	cmp    $0xe6,%ebx
f010950b:	0f 95 c0             	setne  %al
f010950e:	0f b6 c0             	movzbl %al,%eax
f0109511:	83 e8 01             	sub    $0x1,%eax
f0109514:	83 e0 ce             	and    $0xffffffce,%eax
f0109517:	83 c0 19             	add    $0x19,%eax

#if CRT_SAVEROWS > 0
static void
cga_scroll(int delta)
{
	int new_backscroll = max(min(crtsave_backscroll - delta, (int) crtsave_size), 0);
f010951a:	0f bf 15 f2 ed 18 f0 	movswl 0xf018edf2,%edx
f0109521:	89 55 e0             	mov    %edx,-0x20(%ebp)
f0109524:	0f b7 3d ee ed 18 f0 	movzwl 0xf018edee,%edi
f010952b:	0f bf d7             	movswl %di,%edx
f010952e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f0109531:	8b 55 e0             	mov    -0x20(%ebp),%edx
f0109534:	89 54 24 04          	mov    %edx,0x4(%esp)
f0109538:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010953b:	29 c2                	sub    %eax,%edx
f010953d:	89 14 24             	mov    %edx,(%esp)
f0109540:	e8 33 03 00 00       	call   f0109878 <_Z3minIiET_S0_S0_>
f0109545:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010954c:	00 
f010954d:	89 04 24             	mov    %eax,(%esp)
f0109550:	e8 34 03 00 00       	call   f0109889 <_Z3maxIiET_S0_S0_>
f0109555:	89 c6                	mov    %eax,%esi

	if (new_backscroll == crtsave_backscroll)
f0109557:	bb 00 00 00 00       	mov    $0x0,%ebx
f010955c:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
f010955f:	74 6d                	je     f01095ce <_ZL13kbd_proc_datav+0x1b5>
		return;
	if (crtsave_backscroll == 0)
f0109561:	66 85 ff             	test   %di,%di
f0109564:	75 14                	jne    f010957a <_ZL13kbd_proc_datav+0x161>
		// save current screen
		cga_savebuf_copy(crtsave_pos + crtsave_size, 0);
f0109566:	0f b7 05 f0 ed 18 f0 	movzwl 0xf018edf0,%eax
f010956d:	03 45 e0             	add    -0x20(%ebp),%eax
f0109570:	ba 00 00 00 00       	mov    $0x0,%edx
f0109575:	e8 b9 fd ff ff       	call   f0109333 <_ZL16cga_savebuf_copyib>
	
	crtsave_backscroll = new_backscroll;
f010957a:	66 89 35 ee ed 18 f0 	mov    %si,0xf018edee
	cga_savebuf_copy(crtsave_pos + crtsave_size - crtsave_backscroll, 1);
f0109581:	0f bf 15 f2 ed 18 f0 	movswl 0xf018edf2,%edx
f0109588:	0f b7 05 f0 ed 18 f0 	movzwl 0xf018edf0,%eax
f010958f:	8d 04 02             	lea    (%edx,%eax,1),%eax
f0109592:	0f bf f6             	movswl %si,%esi
f0109595:	29 f0                	sub    %esi,%eax
f0109597:	ba 01 00 00 00       	mov    $0x1,%edx
f010959c:	e8 92 fd ff ff       	call   f0109333 <_ZL16cga_savebuf_copyib>
f01095a1:	bb 00 00 00 00       	mov    $0x0,%ebx
f01095a6:	eb 26                	jmp    f01095ce <_ZL13kbd_proc_datav+0x1b5>
		cga_scroll(c == KEY_PGUP ? -CRT_ROWS : CRT_ROWS);
		return 0;
	}
#endif
	// Ctrl-Alt-Del: reboot
	if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
f01095a8:	f7 d2                	not    %edx
f01095aa:	f6 c2 06             	test   $0x6,%dl
f01095ad:	75 1f                	jne    f01095ce <_ZL13kbd_proc_datav+0x1b5>
f01095af:	81 fb e9 00 00 00    	cmp    $0xe9,%ebx
f01095b5:	75 17                	jne    f01095ce <_ZL13kbd_proc_datav+0x1b5>
		cprintf("Rebooting!\n");
f01095b7:	c7 04 24 aa de 10 f0 	movl   $0xf010deaa,(%esp)
f01095be:	e8 cc 2f 00 00       	call   f010c58f <_Z7cprintfPKcz>
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f01095c3:	ba 92 00 00 00       	mov    $0x92,%edx
f01095c8:	b8 03 00 00 00       	mov    $0x3,%eax
f01095cd:	ee                   	out    %al,(%dx)
		outb(0x92, 0x3); // courtesy of Chris Frost
	}

	return c;
}
f01095ce:	89 d8                	mov    %ebx,%eax
f01095d0:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f01095d3:	8b 75 f8             	mov    -0x8(%ebp),%esi
f01095d6:	8b 7d fc             	mov    -0x4(%ebp),%edi
f01095d9:	89 ec                	mov    %ebp,%esp
f01095db:	5d                   	pop    %ebp
f01095dc:	c3                   	ret    

f01095dd <_ZL8cga_putci>:

#endif

static void
cga_putc(int c)
{
f01095dd:	55                   	push   %ebp
f01095de:	89 e5                	mov    %esp,%ebp
f01095e0:	56                   	push   %esi
f01095e1:	53                   	push   %ebx
f01095e2:	83 ec 10             	sub    $0x10,%esp
f01095e5:	89 c3                	mov    %eax,%ebx
#if CRT_SAVEROWS > 0
	// unscroll if necessary
	if (crtsave_backscroll > 0) {
f01095e7:	66 83 3d ee ed 18 f0 	cmpw   $0x0,0xf018edee
f01095ee:	00 
f01095ef:	7e 24                	jle    f0109615 <_ZL8cga_putci+0x38>
		cga_savebuf_copy(crtsave_pos + crtsave_size, 1);
f01095f1:	0f bf 15 f2 ed 18 f0 	movswl 0xf018edf2,%edx
f01095f8:	0f b7 05 f0 ed 18 f0 	movzwl 0xf018edf0,%eax
f01095ff:	8d 04 02             	lea    (%edx,%eax,1),%eax
f0109602:	ba 01 00 00 00       	mov    $0x1,%edx
f0109607:	e8 27 fd ff ff       	call   f0109333 <_ZL16cga_savebuf_copyib>
		crtsave_backscroll = 0;
f010960c:	66 c7 05 ee ed 18 f0 	movw   $0x0,0xf018edee
f0109613:	00 00 
	}
	
#endif
	// if no attribute given, then use light gray on black
	if (!(c & ~0xFF))
f0109615:	f7 c3 00 ff ff ff    	test   $0xffffff00,%ebx
f010961b:	75 03                	jne    f0109620 <_ZL8cga_putci+0x43>
		c |= 0x0700;
f010961d:	80 cf 07             	or     $0x7,%bh

	switch (c & 0xff) {
f0109620:	0f b6 c3             	movzbl %bl,%eax
f0109623:	83 f8 09             	cmp    $0x9,%eax
f0109626:	0f 84 85 00 00 00    	je     f01096b1 <_ZL8cga_putci+0xd4>
f010962c:	83 f8 09             	cmp    $0x9,%eax
f010962f:	7f 11                	jg     f0109642 <_ZL8cga_putci+0x65>
f0109631:	83 f8 08             	cmp    $0x8,%eax
f0109634:	0f 85 ab 00 00 00    	jne    f01096e5 <_ZL8cga_putci+0x108>
f010963a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f0109640:	eb 18                	jmp    f010965a <_ZL8cga_putci+0x7d>
f0109642:	83 f8 0a             	cmp    $0xa,%eax
f0109645:	8d 76 00             	lea    0x0(%esi),%esi
f0109648:	74 3d                	je     f0109687 <_ZL8cga_putci+0xaa>
f010964a:	83 f8 0d             	cmp    $0xd,%eax
f010964d:	8d 76 00             	lea    0x0(%esi),%esi
f0109650:	0f 85 8f 00 00 00    	jne    f01096e5 <_ZL8cga_putci+0x108>
f0109656:	66 90                	xchg   %ax,%ax
f0109658:	eb 35                	jmp    f010968f <_ZL8cga_putci+0xb2>
	case '\b':
		if (crt_pos > 0) {
f010965a:	0f b7 05 ec ed 18 f0 	movzwl 0xf018edec,%eax
f0109661:	66 85 c0             	test   %ax,%ax
f0109664:	0f 84 5a 01 00 00    	je     f01097c4 <_ZL8cga_putci+0x1e7>
			crt_pos--;
f010966a:	83 e8 01             	sub    $0x1,%eax
f010966d:	66 a3 ec ed 18 f0    	mov    %ax,0xf018edec
			crt_buf[crt_pos] = (c & ~0xff) | ' ';
f0109673:	0f b7 c0             	movzwl %ax,%eax
f0109676:	b3 00                	mov    $0x0,%bl
f0109678:	83 cb 20             	or     $0x20,%ebx
f010967b:	8b 15 e8 ed 18 f0    	mov    0xf018ede8,%edx
f0109681:	66 89 1c 42          	mov    %bx,(%edx,%eax,2)
f0109685:	eb 7b                	jmp    f0109702 <_ZL8cga_putci+0x125>
		}
		break;
	case '\n':
		crt_pos += CRT_COLS;
f0109687:	66 83 05 ec ed 18 f0 	addw   $0x50,0xf018edec
f010968e:	50 
		/* fallthru */
	case '\r':
		crt_pos -= (crt_pos % CRT_COLS);
f010968f:	0f b7 05 ec ed 18 f0 	movzwl 0xf018edec,%eax
f0109696:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
f010969c:	c1 e8 10             	shr    $0x10,%eax
f010969f:	66 c1 e8 06          	shr    $0x6,%ax
f01096a3:	8d 04 80             	lea    (%eax,%eax,4),%eax
f01096a6:	c1 e0 04             	shl    $0x4,%eax
f01096a9:	66 a3 ec ed 18 f0    	mov    %ax,0xf018edec
		break;
f01096af:	eb 51                	jmp    f0109702 <_ZL8cga_putci+0x125>
	case '\t':
		cga_putc(' ');
f01096b1:	b8 20 00 00 00       	mov    $0x20,%eax
f01096b6:	e8 22 ff ff ff       	call   f01095dd <_ZL8cga_putci>
		cga_putc(' ');
f01096bb:	b8 20 00 00 00       	mov    $0x20,%eax
f01096c0:	e8 18 ff ff ff       	call   f01095dd <_ZL8cga_putci>
		cga_putc(' ');
f01096c5:	b8 20 00 00 00       	mov    $0x20,%eax
f01096ca:	e8 0e ff ff ff       	call   f01095dd <_ZL8cga_putci>
		cga_putc(' ');
f01096cf:	b8 20 00 00 00       	mov    $0x20,%eax
f01096d4:	e8 04 ff ff ff       	call   f01095dd <_ZL8cga_putci>
		cga_putc(' ');
f01096d9:	b8 20 00 00 00       	mov    $0x20,%eax
f01096de:	e8 fa fe ff ff       	call   f01095dd <_ZL8cga_putci>
		break;
f01096e3:	eb 1d                	jmp    f0109702 <_ZL8cga_putci+0x125>
	default:
		crt_buf[crt_pos++] = c;		/* write the character */
f01096e5:	0f b7 05 ec ed 18 f0 	movzwl 0xf018edec,%eax
f01096ec:	0f b7 c8             	movzwl %ax,%ecx
f01096ef:	8b 15 e8 ed 18 f0    	mov    0xf018ede8,%edx
f01096f5:	66 89 1c 4a          	mov    %bx,(%edx,%ecx,2)
f01096f9:	83 c0 01             	add    $0x1,%eax
f01096fc:	66 a3 ec ed 18 f0    	mov    %ax,0xf018edec
		break;
	}

	// What is the purpose of this?
	if (crt_pos >= CRT_SIZE) {
f0109702:	66 81 3d ec ed 18 f0 	cmpw   $0x7cf,0xf018edec
f0109709:	cf 07 
f010970b:	0f 86 b3 00 00 00    	jbe    f01097c4 <_ZL8cga_putci+0x1e7>
		int i;
		
#if CRT_SAVEROWS > 0
		// Save the scrolled-back row
		if (crtsave_size == CRT_SAVEROWS - CRT_ROWS)
f0109711:	0f b7 05 f2 ed 18 f0 	movzwl 0xf018edf2,%eax
f0109718:	66 83 f8 67          	cmp    $0x67,%ax
f010971c:	75 15                	jne    f0109733 <_ZL8cga_putci+0x156>
			crtsave_pos = (crtsave_pos + 1) % CRT_SAVEROWS;
f010971e:	0f b7 05 f0 ed 18 f0 	movzwl 0xf018edf0,%eax
f0109725:	83 c0 01             	add    $0x1,%eax
f0109728:	83 e0 7f             	and    $0x7f,%eax
f010972b:	66 a3 f0 ed 18 f0    	mov    %ax,0xf018edf0
f0109731:	eb 09                	jmp    f010973c <_ZL8cga_putci+0x15f>
		else
			crtsave_size++;
f0109733:	83 c0 01             	add    $0x1,%eax
f0109736:	66 a3 f2 ed 18 f0    	mov    %ax,0xf018edf2
		memcpy(crtsave_buf + ((crtsave_pos + crtsave_size - 1) % CRT_SAVEROWS) * CRT_COLS, crt_buf, CRT_COLS * sizeof(uint16_t));
f010973c:	c7 44 24 08 a0 00 00 	movl   $0xa0,0x8(%esp)
f0109743:	00 
f0109744:	a1 e8 ed 18 f0       	mov    0xf018ede8,%eax
f0109749:	89 44 24 04          	mov    %eax,0x4(%esp)
f010974d:	0f b7 15 f0 ed 18 f0 	movzwl 0xf018edf0,%edx
f0109754:	0f bf 05 f2 ed 18 f0 	movswl 0xf018edf2,%eax
f010975b:	8d 4c 02 ff          	lea    -0x1(%edx,%eax,1),%ecx
f010975f:	89 ca                	mov    %ecx,%edx
f0109761:	c1 fa 1f             	sar    $0x1f,%edx
f0109764:	c1 ea 19             	shr    $0x19,%edx
f0109767:	8d 04 11             	lea    (%ecx,%edx,1),%eax
f010976a:	83 e0 7f             	and    $0x7f,%eax
f010976d:	29 d0                	sub    %edx,%eax
f010976f:	8d 04 80             	lea    (%eax,%eax,4),%eax
f0109772:	c1 e0 05             	shl    $0x5,%eax
f0109775:	05 00 ee 18 f0       	add    $0xf018ee00,%eax
f010977a:	89 04 24             	mov    %eax,(%esp)
f010977d:	e8 11 42 00 00       	call   f010d993 <memcpy>
		
#endif
		memcpy(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
f0109782:	a1 e8 ed 18 f0       	mov    0xf018ede8,%eax
f0109787:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
f010978e:	00 
f010978f:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
f0109795:	89 54 24 04          	mov    %edx,0x4(%esp)
f0109799:	89 04 24             	mov    %eax,(%esp)
f010979c:	e8 f2 41 00 00       	call   f010d993 <memcpy>
		for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
			crt_buf[i] = 0x0700 | ' ';
f01097a1:	8b 15 e8 ed 18 f0    	mov    0xf018ede8,%edx
f01097a7:	b8 80 07 00 00       	mov    $0x780,%eax
f01097ac:	66 c7 04 42 20 07    	movw   $0x720,(%edx,%eax,2)
			crtsave_size++;
		memcpy(crtsave_buf + ((crtsave_pos + crtsave_size - 1) % CRT_SAVEROWS) * CRT_COLS, crt_buf, CRT_COLS * sizeof(uint16_t));
		
#endif
		memcpy(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
		for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
f01097b2:	83 c0 01             	add    $0x1,%eax
f01097b5:	3d d0 07 00 00       	cmp    $0x7d0,%eax
f01097ba:	75 f0                	jne    f01097ac <_ZL8cga_putci+0x1cf>
			crt_buf[i] = 0x0700 | ' ';
		crt_pos -= CRT_COLS;
f01097bc:	66 83 2d ec ed 18 f0 	subw   $0x50,0xf018edec
f01097c3:	50 
	}

	/* move that little blinky thing */
	outb(addr_6845, 14);
f01097c4:	8b 0d e4 ed 18 f0    	mov    0xf018ede4,%ecx
f01097ca:	89 cb                	mov    %ecx,%ebx
f01097cc:	b8 0e 00 00 00       	mov    $0xe,%eax
f01097d1:	89 ca                	mov    %ecx,%edx
f01097d3:	ee                   	out    %al,(%dx)
	outb(addr_6845 + 1, crt_pos >> 8);
f01097d4:	0f b7 35 ec ed 18 f0 	movzwl 0xf018edec,%esi
f01097db:	83 c1 01             	add    $0x1,%ecx
f01097de:	89 f2                	mov    %esi,%edx
f01097e0:	0f b6 c6             	movzbl %dh,%eax
f01097e3:	89 ca                	mov    %ecx,%edx
f01097e5:	ee                   	out    %al,(%dx)
f01097e6:	b8 0f 00 00 00       	mov    $0xf,%eax
f01097eb:	89 da                	mov    %ebx,%edx
f01097ed:	ee                   	out    %al,(%dx)
f01097ee:	89 f0                	mov    %esi,%eax
f01097f0:	89 ca                	mov    %ecx,%edx
f01097f2:	ee                   	out    %al,(%dx)
	outb(addr_6845, 15);
	outb(addr_6845 + 1, crt_pos);
}
f01097f3:	83 c4 10             	add    $0x10,%esp
f01097f6:	5b                   	pop    %ebx
f01097f7:	5e                   	pop    %esi
f01097f8:	5d                   	pop    %ebp
f01097f9:	c3                   	ret    

f01097fa <_Z9cons_putci>:
}

// output a character to the console
void
cons_putc(int c)
{
f01097fa:	55                   	push   %ebp
f01097fb:	89 e5                	mov    %esp,%ebp
f01097fd:	57                   	push   %edi
f01097fe:	56                   	push   %esi
f01097ff:	53                   	push   %ebx
f0109800:	83 ec 0c             	sub    $0xc,%esp
f0109803:	8b 5d 08             	mov    0x8(%ebp),%ebx
f0109806:	be 00 00 00 00       	mov    $0x0,%esi

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f010980b:	bf 79 03 00 00       	mov    $0x379,%edi
f0109810:	b9 84 00 00 00       	mov    $0x84,%ecx
f0109815:	89 fa                	mov    %edi,%edx
f0109817:	ec                   	in     (%dx),%al
static void
lpt_putc(int c)
{
	int i;

	for (i = 0; !(inb(0x378+1) & 0x80) && i < 12800; i++)
f0109818:	84 c0                	test   %al,%al
f010981a:	78 13                	js     f010982f <_Z9cons_putci+0x35>
f010981c:	81 fe 00 32 00 00    	cmp    $0x3200,%esi
f0109822:	74 0b                	je     f010982f <_Z9cons_putci+0x35>
f0109824:	89 ca                	mov    %ecx,%edx
f0109826:	ec                   	in     (%dx),%al
f0109827:	ec                   	in     (%dx),%al
f0109828:	ec                   	in     (%dx),%al
f0109829:	ec                   	in     (%dx),%al
f010982a:	83 c6 01             	add    $0x1,%esi
f010982d:	eb e6                	jmp    f0109815 <_Z9cons_putci+0x1b>
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f010982f:	ba 78 03 00 00       	mov    $0x378,%edx
f0109834:	89 d8                	mov    %ebx,%eax
f0109836:	ee                   	out    %al,(%dx)
f0109837:	b2 7a                	mov    $0x7a,%dl
f0109839:	b8 0d 00 00 00       	mov    $0xd,%eax
f010983e:	ee                   	out    %al,(%dx)
f010983f:	b8 08 00 00 00       	mov    $0x8,%eax
f0109844:	ee                   	out    %al,(%dx)
// output a character to the console
void
cons_putc(int c)
{
	lpt_putc(c);
	cga_putc(c);
f0109845:	89 d8                	mov    %ebx,%eax
f0109847:	e8 91 fd ff ff       	call   f01095dd <_ZL8cga_putci>
}
f010984c:	83 c4 0c             	add    $0xc,%esp
f010984f:	5b                   	pop    %ebx
f0109850:	5e                   	pop    %esi
f0109851:	5f                   	pop    %edi
f0109852:	5d                   	pop    %ebp
f0109853:	c3                   	ret    

f0109854 <_Z8cputchari>:
f0109854:	55                   	push   %ebp
f0109855:	89 e5                	mov    %esp,%ebp
f0109857:	83 ec 18             	sub    $0x18,%esp
f010985a:	8b 45 08             	mov    0x8(%ebp),%eax
f010985d:	89 04 24             	mov    %eax,(%esp)
f0109860:	e8 95 ff ff ff       	call   f01097fa <_Z9cons_putci>
f0109865:	c9                   	leave  
f0109866:	c3                   	ret    

f0109867 <_Z3minIPtET_S1_S1_>:
typedef int32_t off_t;


// min and max operations
template <typename T>
T min(T a, T b) {
f0109867:	55                   	push   %ebp
f0109868:	89 e5                	mov    %esp,%ebp
f010986a:	8b 55 08             	mov    0x8(%ebp),%edx
f010986d:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109870:	39 c2                	cmp    %eax,%edx
f0109872:	73 02                	jae    f0109876 <_Z3minIPtET_S1_S1_+0xf>
f0109874:	89 d0                	mov    %edx,%eax
	return a <= b ? a : b;
}
f0109876:	5d                   	pop    %ebp
f0109877:	c3                   	ret    

f0109878 <_Z3minIiET_S0_S0_>:
typedef int32_t off_t;


// min and max operations
template <typename T>
T min(T a, T b) {
f0109878:	55                   	push   %ebp
f0109879:	89 e5                	mov    %esp,%ebp
f010987b:	8b 55 08             	mov    0x8(%ebp),%edx
f010987e:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109881:	39 d0                	cmp    %edx,%eax
f0109883:	7e 02                	jle    f0109887 <_Z3minIiET_S0_S0_+0xf>
f0109885:	89 d0                	mov    %edx,%eax
	return a <= b ? a : b;
}
f0109887:	5d                   	pop    %ebp
f0109888:	c3                   	ret    

f0109889 <_Z3maxIiET_S0_S0_>:

template <typename T>
T max(T a, T b) {
f0109889:	55                   	push   %ebp
f010988a:	89 e5                	mov    %esp,%ebp
f010988c:	8b 55 08             	mov    0x8(%ebp),%edx
f010988f:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109892:	39 d0                	cmp    %edx,%eax
f0109894:	7d 02                	jge    f0109898 <_Z3maxIiET_S0_S0_+0xf>
f0109896:	89 d0                	mov    %edx,%eax
	return a >= b ? a : b;
}
f0109898:	5d                   	pop    %ebp
f0109899:	c3                   	ret    
f010989a:	00 00                	add    %al,(%eax)
f010989c:	00 00                	add    %al,(%eax)
	...

f01098a0 <_Z12mon_kerninfoiPPcP9Trapframe>:
	return 0;
}

int
mon_kerninfo(int argc, char **argv, struct Trapframe *tf)
{
f01098a0:	55                   	push   %ebp
f01098a1:	89 e5                	mov    %esp,%ebp
f01098a3:	83 ec 18             	sub    $0x18,%esp
	extern char _start[], etext[], edata[], end[];

	cprintf("Special kernel symbols:\n");
f01098a6:	c7 04 24 e0 e3 10 f0 	movl   $0xf010e3e0,(%esp)
f01098ad:	e8 dd 2c 00 00       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  _start %08x (virt)  %08x (phys)\n", _start, _start - KERNBASE);
f01098b2:	c7 44 24 08 0c 00 10 	movl   $0x10000c,0x8(%esp)
f01098b9:	00 
f01098ba:	c7 44 24 04 0c 00 10 	movl   $0xf010000c,0x4(%esp)
f01098c1:	f0 
f01098c2:	c7 04 24 28 e5 10 f0 	movl   $0xf010e528,(%esp)
f01098c9:	e8 c1 2c 00 00       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  etext  %08x (virt)  %08x (phys)\n", etext, etext - KERNBASE);
f01098ce:	c7 44 24 08 28 de 10 	movl   $0x10de28,0x8(%esp)
f01098d5:	00 
f01098d6:	c7 44 24 04 28 de 10 	movl   $0xf010de28,0x4(%esp)
f01098dd:	f0 
f01098de:	c7 04 24 4c e5 10 f0 	movl   $0xf010e54c,(%esp)
f01098e5:	e8 a5 2c 00 00       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  edata  %08x (virt)  %08x (phys)\n", edata, edata - KERNBASE);
f01098ea:	c7 44 24 08 bf ed 18 	movl   $0x18edbf,0x8(%esp)
f01098f1:	00 
f01098f2:	c7 44 24 04 bf ed 18 	movl   $0xf018edbf,0x4(%esp)
f01098f9:	f0 
f01098fa:	c7 04 24 70 e5 10 f0 	movl   $0xf010e570,(%esp)
f0109901:	e8 89 2c 00 00       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  end    %08x (virt)  %08x (phys)\n", end, end - KERNBASE);
f0109906:	c7 44 24 08 40 4d 19 	movl   $0x194d40,0x8(%esp)
f010990d:	00 
f010990e:	c7 44 24 04 40 4d 19 	movl   $0xf0194d40,0x4(%esp)
f0109915:	f0 
f0109916:	c7 04 24 94 e5 10 f0 	movl   $0xf010e594,(%esp)
f010991d:	e8 6d 2c 00 00       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("Kernel executable memory footprint: %dKB\n",
		(end-_start+1023)/1024);
f0109922:	b8 3f 51 19 f0       	mov    $0xf019513f,%eax
f0109927:	2d 0c 00 10 f0       	sub    $0xf010000c,%eax
f010992c:	89 c2                	mov    %eax,%edx
f010992e:	c1 fa 1f             	sar    $0x1f,%edx
f0109931:	c1 ea 16             	shr    $0x16,%edx
f0109934:	8d 04 02             	lea    (%edx,%eax,1),%eax
f0109937:	c1 f8 0a             	sar    $0xa,%eax
f010993a:	89 44 24 04          	mov    %eax,0x4(%esp)
f010993e:	c7 04 24 b8 e5 10 f0 	movl   $0xf010e5b8,(%esp)
f0109945:	e8 45 2c 00 00       	call   f010c58f <_Z7cprintfPKcz>
	return 0;
}
f010994a:	b8 00 00 00 00       	mov    $0x0,%eax
f010994f:	c9                   	leave  
f0109950:	c3                   	ret    

f0109951 <_Z8mon_helpiPPcP9Trapframe>:

/***** Implementations of basic kernel monitor commands *****/

int
mon_help(int argc, char **argv, struct Trapframe *tf)
{
f0109951:	55                   	push   %ebp
f0109952:	89 e5                	mov    %esp,%ebp
f0109954:	57                   	push   %edi
f0109955:	56                   	push   %esi
f0109956:	53                   	push   %ebx
f0109957:	83 ec 1c             	sub    $0x1c,%esp
f010995a:	bb 00 00 00 00       	mov    $0x0,%ebx
	int i;

	for (i = 0; i < NCOMMANDS; i++)
		cprintf("%s - %s\n", commands[i].name, commands[i].desc);
f010995f:	be a4 e6 10 f0       	mov    $0xf010e6a4,%esi
f0109964:	bf a0 e6 10 f0       	mov    $0xf010e6a0,%edi
f0109969:	8b 04 1e             	mov    (%esi,%ebx,1),%eax
f010996c:	89 44 24 08          	mov    %eax,0x8(%esp)
f0109970:	8b 04 1f             	mov    (%edi,%ebx,1),%eax
f0109973:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109977:	c7 04 24 f9 e3 10 f0 	movl   $0xf010e3f9,(%esp)
f010997e:	e8 0c 2c 00 00       	call   f010c58f <_Z7cprintfPKcz>
f0109983:	83 c3 0c             	add    $0xc,%ebx
int
mon_help(int argc, char **argv, struct Trapframe *tf)
{
	int i;

	for (i = 0; i < NCOMMANDS; i++)
f0109986:	83 fb 30             	cmp    $0x30,%ebx
f0109989:	75 de                	jne    f0109969 <_Z8mon_helpiPPcP9Trapframe+0x18>
		cprintf("%s - %s\n", commands[i].name, commands[i].desc);
	return 0;
}
f010998b:	b8 00 00 00 00       	mov    $0x0,%eax
f0109990:	83 c4 1c             	add    $0x1c,%esp
f0109993:	5b                   	pop    %ebx
f0109994:	5e                   	pop    %esi
f0109995:	5f                   	pop    %edi
f0109996:	5d                   	pop    %ebp
f0109997:	c3                   	ret    

f0109998 <_Z7monitorP9Trapframe>:
	return 0;
}

void
monitor(struct Trapframe *tf)
{
f0109998:	55                   	push   %ebp
f0109999:	89 e5                	mov    %esp,%ebp
f010999b:	57                   	push   %edi
f010999c:	56                   	push   %esi
f010999d:	53                   	push   %ebx
f010999e:	83 ec 5c             	sub    $0x5c,%esp
	char *buf;

	// The 'make grade' script depends on the following printout, so don't
	// remove it.
	cprintf("Welcome to the JOS kernel monitor!\n");
f01099a1:	c7 04 24 e4 e5 10 f0 	movl   $0xf010e5e4,(%esp)
f01099a8:	e8 e2 2b 00 00       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("Type 'help' for a list of commands.\n");
f01099ad:	c7 04 24 08 e6 10 f0 	movl   $0xf010e608,(%esp)
f01099b4:	e8 d6 2b 00 00       	call   f010c58f <_Z7cprintfPKcz>

	if (tf != NULL)
f01099b9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
f01099bd:	74 0b                	je     f01099ca <_Z7monitorP9Trapframe+0x32>
		print_trapframe(tf);
f01099bf:	8b 45 08             	mov    0x8(%ebp),%eax
f01099c2:	89 04 24             	mov    %eax,(%esp)
f01099c5:	e8 57 30 00 00       	call   f010ca21 <_Z15print_trapframeP9Trapframe>

	while (1) {
		buf = readline("K> ");
f01099ca:	c7 04 24 02 e4 10 f0 	movl   $0xf010e402,(%esp)
f01099d1:	e8 4a 3d 00 00       	call   f010d720 <_Z8readlinePKc>
f01099d6:	89 c6                	mov    %eax,%esi
		if (buf != NULL)
f01099d8:	85 c0                	test   %eax,%eax
f01099da:	74 ee                	je     f01099ca <_Z7monitorP9Trapframe+0x32>
	char *argv[MAXARGS];
	int i;

	// Parse the command buffer into whitespace-separated arguments
	argc = 0;
	argv[argc] = 0;
f01099dc:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
f01099e3:	bb 00 00 00 00       	mov    $0x0,%ebx
	while (1) {
		// gobble whitespace
		while (*buf && strchr(WHITESPACE, *buf))
f01099e8:	0f b6 06             	movzbl (%esi),%eax
f01099eb:	84 c0                	test   %al,%al
f01099ed:	74 6d                	je     f0109a5c <_Z7monitorP9Trapframe+0xc4>
f01099ef:	0f be c0             	movsbl %al,%eax
f01099f2:	89 44 24 04          	mov    %eax,0x4(%esp)
f01099f6:	c7 04 24 06 e4 10 f0 	movl   $0xf010e406,(%esp)
f01099fd:	e8 12 3f 00 00       	call   f010d914 <strchr>
f0109a02:	85 c0                	test   %eax,%eax
f0109a04:	0f 84 c7 00 00 00    	je     f0109ad1 <_Z7monitorP9Trapframe+0x139>
			*buf++ = 0;
f0109a0a:	c6 06 00             	movb   $0x0,(%esi)
f0109a0d:	83 c6 01             	add    $0x1,%esi
f0109a10:	eb d6                	jmp    f01099e8 <_Z7monitorP9Trapframe+0x50>
		if (*buf == 0)
			break;

		// save and scan past next arg
		if (argc == MAXARGS-1) {
f0109a12:	83 fb 0f             	cmp    $0xf,%ebx
f0109a15:	75 16                	jne    f0109a2d <_Z7monitorP9Trapframe+0x95>
			cprintf("Too many arguments (max %d)\n", MAXARGS);
f0109a17:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
f0109a1e:	00 
f0109a1f:	c7 04 24 0b e4 10 f0 	movl   $0xf010e40b,(%esp)
f0109a26:	e8 64 2b 00 00       	call   f010c58f <_Z7cprintfPKcz>
f0109a2b:	eb 9d                	jmp    f01099ca <_Z7monitorP9Trapframe+0x32>
			return 0;
		}
		argv[argc++] = buf;
f0109a2d:	89 74 9d a8          	mov    %esi,-0x58(%ebp,%ebx,4)
		while (*buf && !strchr(WHITESPACE, *buf))
f0109a31:	0f b6 06             	movzbl (%esi),%eax
f0109a34:	84 c0                	test   %al,%al
f0109a36:	0f 84 a9 00 00 00    	je     f0109ae5 <_Z7monitorP9Trapframe+0x14d>
f0109a3c:	0f be c0             	movsbl %al,%eax
f0109a3f:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109a43:	c7 04 24 06 e4 10 f0 	movl   $0xf010e406,(%esp)
f0109a4a:	e8 c5 3e 00 00       	call   f010d914 <strchr>
f0109a4f:	85 c0                	test   %eax,%eax
f0109a51:	0f 85 8e 00 00 00    	jne    f0109ae5 <_Z7monitorP9Trapframe+0x14d>
			buf++;
f0109a57:	83 c6 01             	add    $0x1,%esi
f0109a5a:	eb d5                	jmp    f0109a31 <_Z7monitorP9Trapframe+0x99>
	}
	argv[argc] = 0;
f0109a5c:	c7 44 9d a8 00 00 00 	movl   $0x0,-0x58(%ebp,%ebx,4)
f0109a63:	00 

	// Lookup and invoke the command
	if (argc == 0)
f0109a64:	85 db                	test   %ebx,%ebx
f0109a66:	0f 84 5e ff ff ff    	je     f01099ca <_Z7monitorP9Trapframe+0x32>
f0109a6c:	be a0 e6 10 f0       	mov    $0xf010e6a0,%esi
f0109a71:	bf 00 00 00 00       	mov    $0x0,%edi
		return 0;
	for (i = 0; i < NCOMMANDS; i++) {
		if (strcmp(argv[0], commands[i].name) == 0)
f0109a76:	8b 06                	mov    (%esi),%eax
f0109a78:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109a7c:	8b 45 a8             	mov    -0x58(%ebp),%eax
f0109a7f:	89 04 24             	mov    %eax,(%esp)
f0109a82:	e8 2e 3e 00 00       	call   f010d8b5 <strcmp>
f0109a87:	85 c0                	test   %eax,%eax
f0109a89:	75 23                	jne    f0109aae <_Z7monitorP9Trapframe+0x116>
			return commands[i].func(argc, argv, tf);
f0109a8b:	6b ff 0c             	imul   $0xc,%edi,%edi
f0109a8e:	8b 45 08             	mov    0x8(%ebp),%eax
f0109a91:	89 44 24 08          	mov    %eax,0x8(%esp)
f0109a95:	8d 45 a8             	lea    -0x58(%ebp),%eax
f0109a98:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109a9c:	89 1c 24             	mov    %ebx,(%esp)
f0109a9f:	ff 97 a8 e6 10 f0    	call   *-0xfef1958(%edi)
		print_trapframe(tf);

	while (1) {
		buf = readline("K> ");
		if (buf != NULL)
			if (runcmd(buf, tf) < 0)
f0109aa5:	85 c0                	test   %eax,%eax
f0109aa7:	78 44                	js     f0109aed <_Z7monitorP9Trapframe+0x155>
f0109aa9:	e9 1c ff ff ff       	jmp    f01099ca <_Z7monitorP9Trapframe+0x32>
	argv[argc] = 0;

	// Lookup and invoke the command
	if (argc == 0)
		return 0;
	for (i = 0; i < NCOMMANDS; i++) {
f0109aae:	83 c7 01             	add    $0x1,%edi
f0109ab1:	83 c6 0c             	add    $0xc,%esi
f0109ab4:	83 ff 04             	cmp    $0x4,%edi
f0109ab7:	75 bd                	jne    f0109a76 <_Z7monitorP9Trapframe+0xde>
		if (strcmp(argv[0], commands[i].name) == 0)
			return commands[i].func(argc, argv, tf);
	}
	cprintf("Unknown command '%s'\n", argv[0]);
f0109ab9:	8b 45 a8             	mov    -0x58(%ebp),%eax
f0109abc:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109ac0:	c7 04 24 28 e4 10 f0 	movl   $0xf010e428,(%esp)
f0109ac7:	e8 c3 2a 00 00       	call   f010c58f <_Z7cprintfPKcz>
f0109acc:	e9 f9 fe ff ff       	jmp    f01099ca <_Z7monitorP9Trapframe+0x32>
	argv[argc] = 0;
	while (1) {
		// gobble whitespace
		while (*buf && strchr(WHITESPACE, *buf))
			*buf++ = 0;
		if (*buf == 0)
f0109ad1:	80 3e 00             	cmpb   $0x0,(%esi)
f0109ad4:	0f 85 38 ff ff ff    	jne    f0109a12 <_Z7monitorP9Trapframe+0x7a>
f0109ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f0109ae0:	e9 77 ff ff ff       	jmp    f0109a5c <_Z7monitorP9Trapframe+0xc4>
		// save and scan past next arg
		if (argc == MAXARGS-1) {
			cprintf("Too many arguments (max %d)\n", MAXARGS);
			return 0;
		}
		argv[argc++] = buf;
f0109ae5:	83 c3 01             	add    $0x1,%ebx
f0109ae8:	e9 fb fe ff ff       	jmp    f01099e8 <_Z7monitorP9Trapframe+0x50>
		buf = readline("K> ");
		if (buf != NULL)
			if (runcmd(buf, tf) < 0)
				break;
	}
}
f0109aed:	83 c4 5c             	add    $0x5c,%esp
f0109af0:	5b                   	pop    %ebx
f0109af1:	5e                   	pop    %esi
f0109af2:	5f                   	pop    %edi
f0109af3:	5d                   	pop    %ebp
f0109af4:	c3                   	ret    

f0109af5 <_Z8mon_exitiPPcP9Trapframe>:
	return 0;
}

int
mon_exit(int argc, char **argv, struct Trapframe *tf)
{
f0109af5:	55                   	push   %ebp
f0109af6:	89 e5                	mov    %esp,%ebp
f0109af8:	83 ec 18             	sub    $0x18,%esp
f0109afb:	8b 45 10             	mov    0x10(%ebp),%eax

static __inline uint32_t
read_eflags(void)
{
        uint32_t eflags;
        __asm __volatile("pushfl; popl %0" : "=r" (eflags));
f0109afe:	9c                   	pushf  
f0109aff:	59                   	pop    %ecx
	 int ef;
	 ef = read_eflags();
	 if (tf->tf_eflags & 0x100)
f0109b00:	8b 50 38             	mov    0x38(%eax),%edx
f0109b03:	f6 c6 01             	test   $0x1,%dh
f0109b06:	74 0a                	je     f0109b12 <_Z8mon_exitiPPcP9Trapframe+0x1d>
	 tf->tf_eflags &= ~(ef | 1 << 8); /* Clear TF to disable single-step mode */
f0109b08:	80 cd 01             	or     $0x1,%ch
f0109b0b:	f7 d1                	not    %ecx
f0109b0d:	21 ca                	and    %ecx,%edx
f0109b0f:	89 50 38             	mov    %edx,0x38(%eax)
	     		"\tpopal\n"
	         	"\tpopl %%es\n"
		     	"\tpopl %%ds\n"
		        "\taddl $0x8,%%esp\n" /* skip tf_trapno and tf_errcode */
			"\tiret"
			: : "g" (tf) : "memory");
f0109b12:	89 c4                	mov    %eax,%esp
f0109b14:	61                   	popa   
f0109b15:	07                   	pop    %es
f0109b16:	1f                   	pop    %ds
f0109b17:	83 c4 08             	add    $0x8,%esp
f0109b1a:	cf                   	iret   
	panic("iret failed"); /* mostly to placate the compiler */
f0109b1b:	c7 44 24 08 3e e4 10 	movl   $0xf010e43e,0x8(%esp)
f0109b22:	f0 
f0109b23:	c7 44 24 04 73 00 00 	movl   $0x73,0x4(%esp)
f0109b2a:	00 
f0109b2b:	c7 04 24 4a e4 10 f0 	movl   $0xf010e44a,(%esp)
f0109b32:	e8 29 f5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>

f0109b37 <_Z13mon_backtraceiPPcP9Trapframe>:
	return 0;
}

int
mon_backtrace(int argc, char **argv, struct Trapframe *tf)
{
f0109b37:	55                   	push   %ebp
f0109b38:	89 e5                	mov    %esp,%ebp
f0109b3a:	57                   	push   %edi
f0109b3b:	56                   	push   %esi
f0109b3c:	53                   	push   %ebx
f0109b3d:	83 ec 4c             	sub    $0x4c,%esp
	// Your code here.
        uint32_t *ebp;
	extern char bootstacktop[];
	int i = 0;
	Eipdebuginfo info;
	cprintf("Stack backtrace:\n");
f0109b40:	c7 04 24 59 e4 10 f0 	movl   $0xf010e459,(%esp)
f0109b47:	e8 43 2a 00 00       	call   f010c58f <_Z7cprintfPKcz>
	ebp = (uint32_t *)read_ebp();
f0109b4c:	89 eb                	mov    %ebp,%ebx
	cprintf("bootstacktop: %08x\n", (uint32_t *)bootstacktop);
f0109b4e:	c7 44 24 04 00 90 10 	movl   $0xf0109000,0x4(%esp)
f0109b55:	f0 
f0109b56:	c7 04 24 6b e4 10 f0 	movl   $0xf010e46b,(%esp)
f0109b5d:	e8 2d 2a 00 00       	call   f010c58f <_Z7cprintfPKcz>
	while(ebp < (uint32_t *)bootstacktop )
f0109b62:	81 fb 00 90 10 f0    	cmp    $0xf0109000,%ebx
f0109b68:	0f 83 a1 00 00 00    	jae    f0109c0f <_Z13mon_backtraceiPPcP9Trapframe+0xd8>
f0109b6e:	bf 00 00 00 00       	mov    $0x0,%edi
	{
        cprintf("%d: ebp %08x eip %08x args %08x %08x %08x %08x\n", i, ebp, *(ebp+1), *(ebp+2), *(ebp+2+1),*(ebp+2+2), *(ebp+2+3));
f0109b73:	8d 73 04             	lea    0x4(%ebx),%esi
f0109b76:	8b 43 14             	mov    0x14(%ebx),%eax
f0109b79:	89 44 24 1c          	mov    %eax,0x1c(%esp)
f0109b7d:	8b 43 10             	mov    0x10(%ebx),%eax
f0109b80:	89 44 24 18          	mov    %eax,0x18(%esp)
f0109b84:	8b 43 0c             	mov    0xc(%ebx),%eax
f0109b87:	89 44 24 14          	mov    %eax,0x14(%esp)
f0109b8b:	8b 43 08             	mov    0x8(%ebx),%eax
f0109b8e:	89 44 24 10          	mov    %eax,0x10(%esp)
f0109b92:	8b 06                	mov    (%esi),%eax
f0109b94:	89 44 24 0c          	mov    %eax,0xc(%esp)
f0109b98:	89 5c 24 08          	mov    %ebx,0x8(%esp)
f0109b9c:	89 7c 24 04          	mov    %edi,0x4(%esp)
f0109ba0:	c7 04 24 30 e6 10 f0 	movl   $0xf010e630,(%esp)
f0109ba7:	e8 e3 29 00 00       	call   f010c58f <_Z7cprintfPKcz>
	debuginfo_eip(*(ebp+1), &info);
f0109bac:	8d 45 d0             	lea    -0x30(%ebp),%eax
f0109baf:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109bb3:	8b 06                	mov    (%esi),%eax
f0109bb5:	89 04 24             	mov    %eax,(%esp)
f0109bb8:	e8 bd 33 00 00       	call   f010cf7a <_Z13debuginfo_eipjP12Eipdebuginfo>
	cprintf("   %s:%d: %s (%d arg)\n", info.eip_file, info.eip_line, info.eip_fn_name, info.eip_fn_narg);
f0109bbd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0109bc0:	89 44 24 10          	mov    %eax,0x10(%esp)
f0109bc4:	8b 45 d8             	mov    -0x28(%ebp),%eax
f0109bc7:	89 44 24 0c          	mov    %eax,0xc(%esp)
f0109bcb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f0109bce:	89 44 24 08          	mov    %eax,0x8(%esp)
f0109bd2:	8b 45 d0             	mov    -0x30(%ebp),%eax
f0109bd5:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109bd9:	c7 04 24 7f e4 10 f0 	movl   $0xf010e47f,(%esp)
f0109be0:	e8 aa 29 00 00       	call   f010c58f <_Z7cprintfPKcz>
	i++;
f0109be5:	83 c7 01             	add    $0x1,%edi
	if(*ebp == 0 )
f0109be8:	8b 03                	mov    (%ebx),%eax
f0109bea:	85 c0                	test   %eax,%eax
f0109bec:	75 12                	jne    f0109c00 <_Z13mon_backtraceiPPcP9Trapframe+0xc9>
	{
		cprintf("the final value of ebp: %08x\n", ebp);
f0109bee:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f0109bf2:	c7 04 24 96 e4 10 f0 	movl   $0xf010e496,(%esp)
f0109bf9:	e8 91 29 00 00       	call   f010c58f <_Z7cprintfPKcz>
		break;
f0109bfe:	eb 0f                	jmp    f0109c0f <_Z13mon_backtraceiPPcP9Trapframe+0xd8>
	}
	ebp = (uint32_t *)*ebp;
f0109c00:	89 c3                	mov    %eax,%ebx
	int i = 0;
	Eipdebuginfo info;
	cprintf("Stack backtrace:\n");
	ebp = (uint32_t *)read_ebp();
	cprintf("bootstacktop: %08x\n", (uint32_t *)bootstacktop);
	while(ebp < (uint32_t *)bootstacktop )
f0109c02:	b8 00 90 10 f0       	mov    $0xf0109000,%eax
f0109c07:	39 d8                	cmp    %ebx,%eax
f0109c09:	0f 87 64 ff ff ff    	ja     f0109b73 <_Z13mon_backtraceiPPcP9Trapframe+0x3c>
		cprintf("the final value of ebp: %08x\n", ebp);
		break;
	}
	ebp = (uint32_t *)*ebp;
	}
	if(tf != NULL)
f0109c0f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
f0109c13:	74 0d                	je     f0109c22 <_Z13mon_backtraceiPPcP9Trapframe+0xeb>
	print_trapframe(tf);
f0109c15:	8b 45 10             	mov    0x10(%ebp),%eax
f0109c18:	89 04 24             	mov    %eax,(%esp)
f0109c1b:	e8 01 2e 00 00       	call   f010ca21 <_Z15print_trapframeP9Trapframe>
f0109c20:	eb 0c                	jmp    f0109c2e <_Z13mon_backtraceiPPcP9Trapframe+0xf7>
	else
	cprintf("no breakpoint\n");
f0109c22:	c7 04 24 b4 e4 10 f0 	movl   $0xf010e4b4,(%esp)
f0109c29:	e8 61 29 00 00       	call   f010c58f <_Z7cprintfPKcz>
	//{
	//cprintf("0x%08x ", ebp);
	//ebp++;
	//}
	return 0;
}
f0109c2e:	b8 00 00 00 00       	mov    $0x0,%eax
f0109c33:	83 c4 4c             	add    $0x4c,%esp
f0109c36:	5b                   	pop    %ebx
f0109c37:	5e                   	pop    %esi
f0109c38:	5f                   	pop    %edi
f0109c39:	5d                   	pop    %ebp
f0109c3a:	c3                   	ret    
f0109c3b:	00 00                	add    %al,(%eax)
f0109c3d:	00 00                	add    %al,(%eax)
	...

f0109c40 <_Z14tlb_invalidatePjj>:

// Invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
void
tlb_invalidate(pde_t *pgdir, uintptr_t va)
{
f0109c40:	55                   	push   %ebp
f0109c41:	89 e5                	mov    %esp,%ebp
}

static __inline void 
invlpg(uintptr_t addr)
{ 
	__asm __volatile("invlpg (%0)" : : "r" (addr) : "memory");
f0109c43:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109c46:	0f 01 38             	invlpg (%eax)
	// Flush the entry only if we're modifying the current address space.
	// For now, there is only one address space, so always invalidate.
	invlpg(va);
}
f0109c49:	5d                   	pop    %ebp
f0109c4a:	c3                   	ret    

f0109c4b <_GLOBAL__I_npages>:
		assert(pp);
		cprintf("Here!!!");
	}
	*/
	cprintf("page_check() succeeded!\n");
}
f0109c4b:	55                   	push   %ebp
f0109c4c:	89 e5                	mov    %esp,%ebp
	SEG(STA_W, 0x0, 0xffffffff, 0),		// 0x10 - kernel data segment
	SEG(STA_X | STA_R, 0x0, 0xffffffff, 3),	// 0x18 - user code segment
	SEG(STA_W, 0x0, 0xffffffff, 3),		// 0x20 - user data segment
	SEG_NULL				// 0x28 - tss, initialized in
						// idt_init()
};
f0109c4e:	a1 b4 ed 10 f0       	mov    0xf010edb4,%eax
f0109c53:	8b 15 b8 ed 10 f0    	mov    0xf010edb8,%edx
f0109c59:	a3 40 40 19 f0       	mov    %eax,0xf0194040
f0109c5e:	89 15 44 40 19 f0    	mov    %edx,0xf0194044
f0109c64:	a1 bc ed 10 f0       	mov    0xf010edbc,%eax
f0109c69:	8b 15 c0 ed 10 f0    	mov    0xf010edc0,%edx
f0109c6f:	a3 48 40 19 f0       	mov    %eax,0xf0194048
f0109c74:	89 15 4c 40 19 f0    	mov    %edx,0xf019404c
f0109c7a:	a1 c4 ed 10 f0       	mov    0xf010edc4,%eax
f0109c7f:	8b 15 c8 ed 10 f0    	mov    0xf010edc8,%edx
f0109c85:	a3 50 40 19 f0       	mov    %eax,0xf0194050
f0109c8a:	89 15 54 40 19 f0    	mov    %edx,0xf0194054
f0109c90:	a1 cc ed 10 f0       	mov    0xf010edcc,%eax
f0109c95:	8b 15 d0 ed 10 f0    	mov    0xf010edd0,%edx
f0109c9b:	a3 58 40 19 f0       	mov    %eax,0xf0194058
f0109ca0:	89 15 5c 40 19 f0    	mov    %edx,0xf019405c
f0109ca6:	a1 d4 ed 10 f0       	mov    0xf010edd4,%eax
f0109cab:	8b 15 d8 ed 10 f0    	mov    0xf010edd8,%edx
f0109cb1:	a3 60 40 19 f0       	mov    %eax,0xf0194060
f0109cb6:	89 15 64 40 19 f0    	mov    %edx,0xf0194064
f0109cbc:	a1 dc ed 10 f0       	mov    0xf010eddc,%eax
f0109cc1:	8b 15 e0 ed 10 f0    	mov    0xf010ede0,%edx
f0109cc7:	a3 68 40 19 f0       	mov    %eax,0xf0194068
f0109ccc:	89 15 6c 40 19 f0    	mov    %edx,0xf019406c
		assert(pp);
		cprintf("Here!!!");
	}
	*/
	cprintf("page_check() succeeded!\n");
}
f0109cd2:	5d                   	pop    %ebp
f0109cd3:	c3                   	ret    

f0109cd4 <_ZL10boot_allocj>:
// If we're out of memory, boot_alloc should panic.
// This function may ONLY be used during initialization,
// before the free_pages list has been set up.
static void *
boot_alloc(uint32_t n)
{
f0109cd4:	55                   	push   %ebp
f0109cd5:	89 e5                	mov    %esp,%ebp
f0109cd7:	53                   	push   %ebx
f0109cd8:	83 ec 14             	sub    $0x14,%esp
	// Initialize nextfree if this is the first time.
	// 'end' is a magic symbol automatically generated by the linker,
	// which points to the end of the kernel's bss segment:
	// the first virtual address that the linker did *not* assign
	// to any kernel code or global variables.
	if (nextfree == 0)
f0109cdb:	83 3d 7c 40 19 f0 00 	cmpl   $0x0,0xf019407c
f0109ce2:	75 19                	jne    f0109cfd <_ZL10boot_allocj+0x29>
		nextfree = round_up((char *) end, PGSIZE);
f0109ce4:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f0109ceb:	00 
f0109cec:	c7 04 24 40 4d 19 f0 	movl   $0xf0194d40,(%esp)
f0109cf3:	e8 a7 20 00 00       	call   f010bd9f <_Z8round_upIPcET_S1_j>
f0109cf8:	a3 7c 40 19 f0       	mov    %eax,0xf019407c
	// to a multiple of PGSIZE.
	//
	// LAB 2: Your code here.
	// Hole 'n' bytes memory
	// Return updated pointer points
	v = (void *) nextfree;
f0109cfd:	8b 1d 7c 40 19 f0    	mov    0xf019407c,%ebx
	nextfree += n;
	// Align nextfree
	nextfree = round_up (nextfree, PGSIZE);
f0109d03:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f0109d0a:	00 
f0109d0b:	89 d8                	mov    %ebx,%eax
f0109d0d:	03 45 08             	add    0x8(%ebp),%eax
f0109d10:	89 04 24             	mov    %eax,(%esp)
f0109d13:	e8 87 20 00 00       	call   f010bd9f <_Z8round_upIPcET_S1_j>
f0109d18:	a3 7c 40 19 f0       	mov    %eax,0xf019407c
	// Panic when out of memory
	if((unsigned int) nextfree < (unsigned int) end)
f0109d1d:	3d 40 4d 19 f0       	cmp    $0xf0194d40,%eax
f0109d22:	73 1c                	jae    f0109d40 <_ZL10boot_allocj+0x6c>
	panic("boot_alloc: out of memory.\n");
f0109d24:	c7 44 24 08 ae eb 10 	movl   $0xf010ebae,0x8(%esp)
f0109d2b:	f0 
f0109d2c:	c7 44 24 04 18 01 00 	movl   $0x118,0x4(%esp)
f0109d33:	00 
f0109d34:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f0109d3b:	e8 20 f3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	return v;
}
f0109d40:	89 d8                	mov    %ebx,%eax
f0109d42:	83 c4 14             	add    $0x14,%esp
f0109d45:	5b                   	pop    %ebx
f0109d46:	5d                   	pop    %ebp
f0109d47:	c3                   	ret    

f0109d48 <_ZL11check_va2paPjj>:
// defined by the page directory 'pgdir'.  The hardware normally performs
// this functionality for us!  We define our own version to help
// the boot_mem_check() function; it shouldn't be used elsewhere.
static physaddr_t
check_va2pa(pde_t *pgdir, uintptr_t va)
{
f0109d48:	55                   	push   %ebp
f0109d49:	89 e5                	mov    %esp,%ebp
f0109d4b:	83 ec 18             	sub    $0x18,%esp
	pte_t *p;

	pgdir = &pgdir[PDX(va)];
	if (!(*pgdir & PTE_P))
f0109d4e:	89 d1                	mov    %edx,%ecx
f0109d50:	c1 e9 16             	shr    $0x16,%ecx
f0109d53:	8b 04 88             	mov    (%eax,%ecx,4),%eax
f0109d56:	a8 01                	test   $0x1,%al
f0109d58:	74 4d                	je     f0109da7 <_ZL11check_va2paPjj+0x5f>
		return ~0;
	p = (pte_t*) KADDR(PTE_ADDR(*pgdir));
f0109d5a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f0109d5f:	89 c1                	mov    %eax,%ecx
f0109d61:	c1 e9 0c             	shr    $0xc,%ecx
f0109d64:	3b 0d 20 40 19 f0    	cmp    0xf0194020,%ecx
f0109d6a:	72 20                	jb     f0109d8c <_ZL11check_va2paPjj+0x44>
f0109d6c:	89 44 24 0c          	mov    %eax,0xc(%esp)
f0109d70:	c7 44 24 08 f8 e6 10 	movl   $0xf010e6f8,0x8(%esp)
f0109d77:	f0 
f0109d78:	c7 44 24 04 29 01 00 	movl   $0x129,0x4(%esp)
f0109d7f:	00 
f0109d80:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f0109d87:	e8 d4 f2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	if (!(p[PTX(va)] & PTE_P))
f0109d8c:	c1 ea 0c             	shr    $0xc,%edx
f0109d8f:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
f0109d95:	8b 84 90 00 00 00 f0 	mov    -0x10000000(%eax,%edx,4),%eax
f0109d9c:	a8 01                	test   $0x1,%al
f0109d9e:	74 07                	je     f0109da7 <_ZL11check_va2paPjj+0x5f>
		return ~0;
	return PTE_ADDR(p[PTX(va)]);
f0109da0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f0109da5:	eb 05                	jmp    f0109dac <_ZL11check_va2paPjj+0x64>
f0109da7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
f0109dac:	c9                   	leave  
f0109dad:	c3                   	ret    

f0109dae <_ZL10nvram_readi>:
	sizeof(gdt) - 1, (unsigned long) gdt
};

static int
nvram_read(int r)
{
f0109dae:	55                   	push   %ebp
f0109daf:	89 e5                	mov    %esp,%ebp
f0109db1:	83 ec 18             	sub    $0x18,%esp
f0109db4:	89 5d f8             	mov    %ebx,-0x8(%ebp)
f0109db7:	89 75 fc             	mov    %esi,-0x4(%ebp)
f0109dba:	89 c3                	mov    %eax,%ebx
	return mc146818_read(r) | (mc146818_read(r + 1) << 8);
f0109dbc:	89 04 24             	mov    %eax,(%esp)
f0109dbf:	e8 70 27 00 00       	call   f010c534 <_Z13mc146818_readj>
f0109dc4:	89 c6                	mov    %eax,%esi
f0109dc6:	83 c3 01             	add    $0x1,%ebx
f0109dc9:	89 1c 24             	mov    %ebx,(%esp)
f0109dcc:	e8 63 27 00 00       	call   f010c534 <_Z13mc146818_readj>
f0109dd1:	c1 e0 08             	shl    $0x8,%eax
f0109dd4:	09 f0                	or     %esi,%eax
}
f0109dd6:	8b 5d f8             	mov    -0x8(%ebp),%ebx
f0109dd9:	8b 75 fc             	mov    -0x4(%ebp),%esi
f0109ddc:	89 ec                	mov    %ebp,%esp
f0109dde:	5d                   	pop    %ebp
f0109ddf:	c3                   	ret    

f0109de0 <_ZL15i386_mem_detectv>:

static void
i386_mem_detect(void)
{
f0109de0:	55                   	push   %ebp
f0109de1:	89 e5                	mov    %esp,%ebp
f0109de3:	53                   	push   %ebx
f0109de4:	83 ec 14             	sub    $0x14,%esp
	uint32_t n_extended_pages;
	
	// Use CMOS calls to measure available base & extended memory.
	// (CMOS calls return results in kilobytes.)
	n_base_pages = nvram_read(NVRAM_BASELO) * 1024 / PGSIZE;
f0109de7:	b8 15 00 00 00       	mov    $0x15,%eax
f0109dec:	e8 bd ff ff ff       	call   f0109dae <_ZL10nvram_readi>
f0109df1:	c1 e0 0a             	shl    $0xa,%eax
f0109df4:	89 c2                	mov    %eax,%edx
f0109df6:	c1 fa 1f             	sar    $0x1f,%edx
f0109df9:	c1 ea 14             	shr    $0x14,%edx
f0109dfc:	8d 04 02             	lea    (%edx,%eax,1),%eax
f0109dff:	c1 f8 0c             	sar    $0xc,%eax
f0109e02:	a3 78 40 19 f0       	mov    %eax,0xf0194078
	n_extended_pages = nvram_read(NVRAM_EXTLO) * 1024 / PGSIZE;
f0109e07:	b8 17 00 00 00       	mov    $0x17,%eax
f0109e0c:	e8 9d ff ff ff       	call   f0109dae <_ZL10nvram_readi>
f0109e11:	c1 e0 0a             	shl    $0xa,%eax
f0109e14:	89 c3                	mov    %eax,%ebx
f0109e16:	c1 fb 1f             	sar    $0x1f,%ebx
f0109e19:	c1 eb 14             	shr    $0x14,%ebx
f0109e1c:	01 c3                	add    %eax,%ebx
f0109e1e:	c1 fb 0c             	sar    $0xc,%ebx

	// Calculate the maximum physical address based on whether
	// or not there is any extended memory.  See comment in <inc/mmu.h>.
	if (n_extended_pages)
f0109e21:	85 db                	test   %ebx,%ebx
f0109e23:	74 0d                	je     f0109e32 <_ZL15i386_mem_detectv+0x52>
		npages = (EXTPHYSMEM / PGSIZE) + n_extended_pages;
f0109e25:	8d 83 00 01 00 00    	lea    0x100(%ebx),%eax
f0109e2b:	a3 20 40 19 f0       	mov    %eax,0xf0194020
f0109e30:	eb 0a                	jmp    f0109e3c <_ZL15i386_mem_detectv+0x5c>
	else
		npages = n_base_pages;
f0109e32:	a1 78 40 19 f0       	mov    0xf0194078,%eax
f0109e37:	a3 20 40 19 f0       	mov    %eax,0xf0194020

	cprintf("Physical memory: %uK available, ", npages * PGSIZE / 1024);
f0109e3c:	a1 20 40 19 f0       	mov    0xf0194020,%eax
f0109e41:	c1 e0 0c             	shl    $0xc,%eax
f0109e44:	c1 e8 0a             	shr    $0xa,%eax
f0109e47:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109e4b:	c7 04 24 1c e7 10 f0 	movl   $0xf010e71c,(%esp)
f0109e52:	e8 38 27 00 00       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("base = %uK, extended = %uK\n", n_base_pages * PGSIZE / 1024,
		n_extended_pages * PGSIZE / 1024);
f0109e57:	c1 e3 0c             	shl    $0xc,%ebx
f0109e5a:	c1 eb 0a             	shr    $0xa,%ebx
f0109e5d:	89 5c 24 08          	mov    %ebx,0x8(%esp)
f0109e61:	a1 78 40 19 f0       	mov    0xf0194078,%eax
f0109e66:	c1 e0 0c             	shl    $0xc,%eax
f0109e69:	c1 e8 0a             	shr    $0xa,%eax
f0109e6c:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109e70:	c7 04 24 d6 eb 10 f0 	movl   $0xf010ebd6,(%esp)
f0109e77:	e8 13 27 00 00       	call   f010c58f <_Z7cprintfPKcz>
}
f0109e7c:	83 c4 14             	add    $0x14,%esp
f0109e7f:	5b                   	pop    %ebx
f0109e80:	5d                   	pop    %ebp
f0109e81:	c3                   	ret    

f0109e82 <_ZL14boot_mem_checkv>:
// This function doesn't test every corner case,
// and doesn't test the permission bits at all,
// but it is a pretty good sanity check.
static void
boot_mem_check(void)
{
f0109e82:	55                   	push   %ebp
f0109e83:	89 e5                	mov    %esp,%ebp
f0109e85:	57                   	push   %edi
f0109e86:	56                   	push   %esi
f0109e87:	53                   	push   %ebx
f0109e88:	83 ec 1c             	sub    $0x1c,%esp
f0109e8b:	bb 00 00 00 00       	mov    $0x0,%ebx
	uint32_t i, n, check_umappings = 1;

	// check phys mem
	for (i = 0; KERNBASE + i != 0; i += PGSIZE)
		assert(check_va2pa(kern_pgdir, KERNBASE + i) == i);
f0109e90:	8d 93 00 00 00 f0    	lea    -0x10000000(%ebx),%edx
f0109e96:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f0109e9b:	e8 a8 fe ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f0109ea0:	39 c3                	cmp    %eax,%ebx
f0109ea2:	74 24                	je     f0109ec8 <_ZL14boot_mem_checkv+0x46>
f0109ea4:	c7 44 24 0c 40 e7 10 	movl   $0xf010e740,0xc(%esp)
f0109eab:	f0 
f0109eac:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f0109eb3:	f0 
f0109eb4:	c7 44 24 04 0f 03 00 	movl   $0x30f,0x4(%esp)
f0109ebb:	00 
f0109ebc:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f0109ec3:	e8 98 f1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
boot_mem_check(void)
{
	uint32_t i, n, check_umappings = 1;

	// check phys mem
	for (i = 0; KERNBASE + i != 0; i += PGSIZE)
f0109ec8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f0109ece:	81 fb 00 00 00 10    	cmp    $0x10000000,%ebx
f0109ed4:	75 ba                	jne    f0109e90 <_ZL14boot_mem_checkv+0xe>
f0109ed6:	be 00 80 ff ef       	mov    $0xefff8000,%esi
		assert(check_va2pa(kern_pgdir, KERNBASE + i) == i);

	// check kernel stack
	for (i = 0; i < KSTKSIZE; i += PGSIZE)
		assert(check_va2pa(kern_pgdir, KSTACKTOP - KSTKSIZE + i) == PADDR(bootstack) + i);
f0109edb:	bb 00 10 10 f0       	mov    $0xf0101000,%ebx
f0109ee0:	8d bb 00 80 00 20    	lea    0x20008000(%ebx),%edi
f0109ee6:	89 f2                	mov    %esi,%edx
f0109ee8:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f0109eed:	e8 56 fe ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f0109ef2:	81 fb ff ff ff ef    	cmp    $0xefffffff,%ebx
f0109ef8:	77 20                	ja     f0109f1a <_ZL14boot_mem_checkv+0x98>
f0109efa:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
f0109efe:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f0109f05:	f0 
f0109f06:	c7 44 24 04 13 03 00 	movl   $0x313,0x4(%esp)
f0109f0d:	00 
f0109f0e:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f0109f15:	e8 46 f1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f0109f1a:	8d 14 37             	lea    (%edi,%esi,1),%edx
f0109f1d:	39 d0                	cmp    %edx,%eax
f0109f1f:	74 24                	je     f0109f45 <_ZL14boot_mem_checkv+0xc3>
f0109f21:	c7 44 24 0c 90 e7 10 	movl   $0xf010e790,0xc(%esp)
f0109f28:	f0 
f0109f29:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f0109f30:	f0 
f0109f31:	c7 44 24 04 13 03 00 	movl   $0x313,0x4(%esp)
f0109f38:	00 
f0109f39:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f0109f40:	e8 1b f1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f0109f45:	81 c6 00 10 00 00    	add    $0x1000,%esi
	// check phys mem
	for (i = 0; KERNBASE + i != 0; i += PGSIZE)
		assert(check_va2pa(kern_pgdir, KERNBASE + i) == i);

	// check kernel stack
	for (i = 0; i < KSTKSIZE; i += PGSIZE)
f0109f4b:	81 fe 00 00 00 f0    	cmp    $0xf0000000,%esi
f0109f51:	75 93                	jne    f0109ee6 <_ZL14boot_mem_checkv+0x64>
		assert(check_va2pa(kern_pgdir, KSTACKTOP - KSTKSIZE + i) == PADDR(bootstack) + i);

	// check user mappings for pages and envs array
	if (check_va2pa(kern_pgdir, UPAGES) == ~0U) {
f0109f53:	ba 00 00 40 ef       	mov    $0xef400000,%edx
f0109f58:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f0109f5d:	e8 e6 fd ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f0109f62:	83 f8 ff             	cmp    $0xffffffff,%eax
f0109f65:	75 26                	jne    f0109f8d <_ZL14boot_mem_checkv+0x10b>
		warn("user mappings for UPAGES/UENVS not ready");
f0109f67:	c7 44 24 08 dc e7 10 	movl   $0xf010e7dc,0x8(%esp)
f0109f6e:	f0 
f0109f6f:	c7 44 24 04 17 03 00 	movl   $0x317,0x4(%esp)
f0109f76:	00 
f0109f77:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f0109f7e:	e8 9d f0 ff ff       	call   f0109020 <_Z5_warnPKciS0_z>
f0109f83:	bb 00 00 00 00       	mov    $0x0,%ebx
f0109f88:	e9 35 01 00 00       	jmp    f010a0c2 <_ZL14boot_mem_checkv+0x240>
		check_umappings = 0;
	} else {
		n = round_up(npages * sizeof(Page), PGSIZE);
f0109f8d:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f0109f94:	00 
f0109f95:	a1 20 40 19 f0       	mov    0xf0194020,%eax
f0109f9a:	c1 e0 03             	shl    $0x3,%eax
f0109f9d:	89 04 24             	mov    %eax,(%esp)
f0109fa0:	e8 c4 1d 00 00       	call   f010bd69 <_Z8round_upIjET_S0_j>
f0109fa5:	89 c6                	mov    %eax,%esi
		for (i = 0; i < n; i += PGSIZE)
f0109fa7:	85 c0                	test   %eax,%eax
f0109fa9:	74 7c                	je     f010a027 <_ZL14boot_mem_checkv+0x1a5>
f0109fab:	bb 00 00 00 00       	mov    $0x0,%ebx
			assert(check_va2pa(kern_pgdir, UPAGES + i) == PADDR(pages) + i);
f0109fb0:	8d 93 00 00 40 ef    	lea    -0x10c00000(%ebx),%edx
f0109fb6:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f0109fbb:	e8 88 fd ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f0109fc0:	8b 15 28 40 19 f0    	mov    0xf0194028,%edx
f0109fc6:	81 fa ff ff ff ef    	cmp    $0xefffffff,%edx
f0109fcc:	77 20                	ja     f0109fee <_ZL14boot_mem_checkv+0x16c>
f0109fce:	89 54 24 0c          	mov    %edx,0xc(%esp)
f0109fd2:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f0109fd9:	f0 
f0109fda:	c7 44 24 04 1c 03 00 	movl   $0x31c,0x4(%esp)
f0109fe1:	00 
f0109fe2:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f0109fe9:	e8 72 f0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f0109fee:	8d 94 13 00 00 00 10 	lea    0x10000000(%ebx,%edx,1),%edx
f0109ff5:	39 d0                	cmp    %edx,%eax
f0109ff7:	74 24                	je     f010a01d <_ZL14boot_mem_checkv+0x19b>
f0109ff9:	c7 44 24 0c 08 e8 10 	movl   $0xf010e808,0xc(%esp)
f010a000:	f0 
f010a001:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a008:	f0 
f010a009:	c7 44 24 04 1c 03 00 	movl   $0x31c,0x4(%esp)
f010a010:	00 
f010a011:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a018:	e8 43 f0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	if (check_va2pa(kern_pgdir, UPAGES) == ~0U) {
		warn("user mappings for UPAGES/UENVS not ready");
		check_umappings = 0;
	} else {
		n = round_up(npages * sizeof(Page), PGSIZE);
		for (i = 0; i < n; i += PGSIZE)
f010a01d:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f010a023:	39 de                	cmp    %ebx,%esi
f010a025:	77 89                	ja     f0109fb0 <_ZL14boot_mem_checkv+0x12e>
			assert(check_va2pa(kern_pgdir, UPAGES + i) == PADDR(pages) + i);
	
		n = round_up(NENV * sizeof(Env), PGSIZE);
f010a027:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010a02e:	00 
f010a02f:	c7 04 24 00 70 01 00 	movl   $0x17000,(%esp)
f010a036:	e8 2e 1d 00 00       	call   f010bd69 <_Z8round_upIjET_S0_j>
f010a03b:	89 c6                	mov    %eax,%esi
		for (i = 0; i < n; i += PGSIZE)
f010a03d:	85 c0                	test   %eax,%eax
f010a03f:	74 7c                	je     f010a0bd <_ZL14boot_mem_checkv+0x23b>
f010a041:	bb 00 00 00 00       	mov    $0x0,%ebx
			assert(check_va2pa(kern_pgdir, UENVS + i) == PADDR(envs) + i);
f010a046:	8d 93 00 00 00 ef    	lea    -0x11000000(%ebx),%edx
f010a04c:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010a051:	e8 f2 fc ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f010a056:	8b 15 80 40 19 f0    	mov    0xf0194080,%edx
f010a05c:	81 fa ff ff ff ef    	cmp    $0xefffffff,%edx
f010a062:	77 20                	ja     f010a084 <_ZL14boot_mem_checkv+0x202>
f010a064:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010a068:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f010a06f:	f0 
f010a070:	c7 44 24 04 20 03 00 	movl   $0x320,0x4(%esp)
f010a077:	00 
f010a078:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a07f:	e8 dc ef ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a084:	8d 94 13 00 00 00 10 	lea    0x10000000(%ebx,%edx,1),%edx
f010a08b:	39 d0                	cmp    %edx,%eax
f010a08d:	74 24                	je     f010a0b3 <_ZL14boot_mem_checkv+0x231>
f010a08f:	c7 44 24 0c 40 e8 10 	movl   $0xf010e840,0xc(%esp)
f010a096:	f0 
f010a097:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a09e:	f0 
f010a09f:	c7 44 24 04 20 03 00 	movl   $0x320,0x4(%esp)
f010a0a6:	00 
f010a0a7:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a0ae:	e8 ad ef ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
		n = round_up(npages * sizeof(Page), PGSIZE);
		for (i = 0; i < n; i += PGSIZE)
			assert(check_va2pa(kern_pgdir, UPAGES + i) == PADDR(pages) + i);
	
		n = round_up(NENV * sizeof(Env), PGSIZE);
		for (i = 0; i < n; i += PGSIZE)
f010a0b3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f010a0b9:	39 de                	cmp    %ebx,%esi
f010a0bb:	77 89                	ja     f010a046 <_ZL14boot_mem_checkv+0x1c4>
f010a0bd:	bb 01 00 00 00       	mov    $0x1,%ebx
			break;
		case PDX(UVPT):
			break;
		default:
			if (i >= PDX(KERNBASE))
				assert(kern_pgdir[i]);
f010a0c2:	8b 0d 24 40 19 f0    	mov    0xf0194024,%ecx

	// check for zero/non-zero in PDEs
	for (i = 0; i < NPDENTRIES; i++) {
		switch (i) {
		case PDX(KSTACKTOP-1):
			assert(kern_pgdir[i]);
f010a0c8:	8d b1 fc 0e 00 00    	lea    0xefc(%ecx),%esi
f010a0ce:	ba 01 00 00 00       	mov    $0x1,%edx
f010a0d3:	b8 00 00 00 00       	mov    $0x0,%eax
f010a0d8:	eb 06                	jmp    f010a0e0 <_ZL14boot_mem_checkv+0x25e>
f010a0da:	83 c0 01             	add    $0x1,%eax
f010a0dd:	83 c2 01             	add    $0x1,%edx
			assert(check_va2pa(kern_pgdir, UENVS + i) == PADDR(envs) + i);
	}

	// check for zero/non-zero in PDEs
	for (i = 0; i < NPDENTRIES; i++) {
		switch (i) {
f010a0e0:	3d be 03 00 00       	cmp    $0x3be,%eax
f010a0e5:	0f 84 d8 00 00 00    	je     f010a1c3 <_ZL14boot_mem_checkv+0x341>
f010a0eb:	3d be 03 00 00       	cmp    $0x3be,%eax
f010a0f0:	77 10                	ja     f010a102 <_ZL14boot_mem_checkv+0x280>
f010a0f2:	3d bc 03 00 00       	cmp    $0x3bc,%eax
f010a0f7:	72 6f                	jb     f010a168 <_ZL14boot_mem_checkv+0x2e6>
f010a0f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f010a100:	eb 34                	jmp    f010a136 <_ZL14boot_mem_checkv+0x2b4>
f010a102:	3d bf 03 00 00       	cmp    $0x3bf,%eax
f010a107:	90                   	nop
f010a108:	75 5e                	jne    f010a168 <_ZL14boot_mem_checkv+0x2e6>
		case PDX(KSTACKTOP-1):
			assert(kern_pgdir[i]);
f010a10a:	83 3e 00             	cmpl   $0x0,(%esi)
f010a10d:	8d 76 00             	lea    0x0(%esi),%esi
f010a110:	75 c8                	jne    f010a0da <_ZL14boot_mem_checkv+0x258>
f010a112:	c7 44 24 0c f2 eb 10 	movl   $0xf010ebf2,0xc(%esp)
f010a119:	f0 
f010a11a:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a121:	f0 
f010a122:	c7 44 24 04 27 03 00 	movl   $0x327,0x4(%esp)
f010a129:	00 
f010a12a:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a131:	e8 2a ef ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
			break;
		case PDX(UPAGES):
		case PDX(UENVS):
			if (check_umappings)
f010a136:	85 db                	test   %ebx,%ebx
f010a138:	0f 84 85 00 00 00    	je     f010a1c3 <_ZL14boot_mem_checkv+0x341>
				assert(kern_pgdir[i]);
f010a13e:	83 3c 81 00          	cmpl   $0x0,(%ecx,%eax,4)
f010a142:	75 7f                	jne    f010a1c3 <_ZL14boot_mem_checkv+0x341>
f010a144:	c7 44 24 0c f2 eb 10 	movl   $0xf010ebf2,0xc(%esp)
f010a14b:	f0 
f010a14c:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a153:	f0 
f010a154:	c7 44 24 04 2c 03 00 	movl   $0x32c,0x4(%esp)
f010a15b:	00 
f010a15c:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a163:	e8 f8 ee ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
			break;
		case PDX(UVPT):
			break;
		default:
			if (i >= PDX(KERNBASE))
f010a168:	3d bf 03 00 00       	cmp    $0x3bf,%eax
f010a16d:	76 2a                	jbe    f010a199 <_ZL14boot_mem_checkv+0x317>
				assert(kern_pgdir[i]);
f010a16f:	83 3c 81 00          	cmpl   $0x0,(%ecx,%eax,4)
f010a173:	75 4e                	jne    f010a1c3 <_ZL14boot_mem_checkv+0x341>
f010a175:	c7 44 24 0c f2 eb 10 	movl   $0xf010ebf2,0xc(%esp)
f010a17c:	f0 
f010a17d:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a184:	f0 
f010a185:	c7 44 24 04 32 03 00 	movl   $0x332,0x4(%esp)
f010a18c:	00 
f010a18d:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a194:	e8 c7 ee ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
			else
				assert(kern_pgdir[i] == 0);
f010a199:	83 3c 81 00          	cmpl   $0x0,(%ecx,%eax,4)
f010a19d:	74 24                	je     f010a1c3 <_ZL14boot_mem_checkv+0x341>
f010a19f:	c7 44 24 0c 00 ec 10 	movl   $0xf010ec00,0xc(%esp)
f010a1a6:	f0 
f010a1a7:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a1ae:	f0 
f010a1af:	c7 44 24 04 34 03 00 	movl   $0x334,0x4(%esp)
f010a1b6:	00 
f010a1b7:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a1be:	e8 9d ee ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
		for (i = 0; i < n; i += PGSIZE)
			assert(check_va2pa(kern_pgdir, UENVS + i) == PADDR(envs) + i);
	}

	// check for zero/non-zero in PDEs
	for (i = 0; i < NPDENTRIES; i++) {
f010a1c3:	81 fa ff 03 00 00    	cmp    $0x3ff,%edx
f010a1c9:	0f 86 0b ff ff ff    	jbe    f010a0da <_ZL14boot_mem_checkv+0x258>
				assert(kern_pgdir[i] == 0);
			break;
		}
	}
	
	cprintf("boot_mem_check() succeeded!\n");
f010a1cf:	c7 04 24 13 ec 10 f0 	movl   $0xf010ec13,(%esp)
f010a1d6:	e8 b4 23 00 00       	call   f010c58f <_Z7cprintfPKcz>
}
f010a1db:	83 c4 1c             	add    $0x1c,%esp
f010a1de:	5b                   	pop    %ebx
f010a1df:	5e                   	pop    %esi
f010a1e0:	5f                   	pop    %edi
f010a1e1:	5d                   	pop    %ebp
f010a1e2:	c3                   	ret    

f010a1e3 <_Z9page_freeP4Page>:
// Software Engineering Hint: It can be extremely useful for later debugging
//   if you erase each page's memory as soon as it is freed.  See the Software
//   Engineering Hint above for reasons why.
void
page_free(struct Page *pp)
{
f010a1e3:	55                   	push   %ebp
f010a1e4:	89 e5                	mov    %esp,%ebp
f010a1e6:	83 ec 18             	sub    $0x18,%esp
f010a1e9:	8b 45 08             	mov    0x8(%ebp),%eax
	// Fill this function in
	//Only be called when pp_ref reaches 0
	assert(pp->pp_ref == 0);
f010a1ec:	66 83 78 04 00       	cmpw   $0x0,0x4(%eax)
f010a1f1:	74 24                	je     f010a217 <_Z9page_freeP4Page+0x34>
f010a1f3:	c7 44 24 0c 30 ec 10 	movl   $0xf010ec30,0xc(%esp)
f010a1fa:	f0 
f010a1fb:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a202:	f0 
f010a203:	c7 44 24 04 96 01 00 	movl   $0x196,0x4(%esp)
f010a20a:	00 
f010a20b:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a212:	e8 49 ee ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	//Add free page to link free_pages
	pp->pp_next = free_pages;
f010a217:	8b 15 74 40 19 f0    	mov    0xf0194074,%edx
f010a21d:	89 10                	mov    %edx,(%eax)
	free_pages = pp;
f010a21f:	a3 74 40 19 f0       	mov    %eax,0xf0194074
	uint16_t pp_ref;

#if JOS_KERNEL
	// Returns the physical page number for this page.
	size_t page_number() const {
		assert(this >= pages && this < pages + npages);
f010a224:	8b 15 28 40 19 f0    	mov    0xf0194028,%edx
f010a22a:	39 d0                	cmp    %edx,%eax
f010a22c:	72 0d                	jb     f010a23b <_Z9page_freeP4Page+0x58>
f010a22e:	8b 0d 20 40 19 f0    	mov    0xf0194020,%ecx
f010a234:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010a237:	39 c8                	cmp    %ecx,%eax
f010a239:	72 24                	jb     f010a25f <_Z9page_freeP4Page+0x7c>
f010a23b:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010a242:	f0 
f010a243:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a24a:	f0 
f010a24b:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a252:	00 
f010a253:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010a25a:	e8 01 ee ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	//erase page memory
	memset(pp->data(), 0xCD, sizeof(*pp));
f010a25f:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
f010a266:	00 
f010a267:	c7 44 24 04 cd 00 00 	movl   $0xcd,0x4(%esp)
f010a26e:	00 
f010a26f:	29 d0                	sub    %edx,%eax
f010a271:	c1 f8 03             	sar    $0x3,%eax
f010a274:	c1 e0 0c             	shl    $0xc,%eax
f010a277:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010a27c:	89 04 24             	mov    %eax,(%esp)
f010a27f:	e8 ea 36 00 00       	call   f010d96e <memset>

	//LIST_INSERT_HEAD(&free_page, pp, pp_link);
}
f010a284:	c9                   	leave  
f010a285:	c3                   	ret    

f010a286 <_Z11page_decrefP4Page>:

// Decrement the reference count on a page.
// Free it if there are no more refs afterwards.
void
page_decref(struct Page *pp)
{
f010a286:	55                   	push   %ebp
f010a287:	89 e5                	mov    %esp,%ebp
f010a289:	83 ec 18             	sub    $0x18,%esp
f010a28c:	8b 45 08             	mov    0x8(%ebp),%eax
	if (--pp->pp_ref == 0)
f010a28f:	0f b7 50 04          	movzwl 0x4(%eax),%edx
f010a293:	83 ea 01             	sub    $0x1,%edx
f010a296:	66 89 50 04          	mov    %dx,0x4(%eax)
f010a29a:	66 85 d2             	test   %dx,%dx
f010a29d:	75 08                	jne    f010a2a7 <_Z11page_decrefP4Page+0x21>
		page_free(pp);
f010a29f:	89 04 24             	mov    %eax,(%esp)
f010a2a2:	e8 3c ff ff ff       	call   f010a1e3 <_Z9page_freeP4Page>
}
f010a2a7:	c9                   	leave  
f010a2a8:	c3                   	ret    

f010a2a9 <_Z10page_allocv>:
//   kernel boots, a data structure gets corrupted because its containing page
//   was used twice!  Note that erasing the page with a non-zero value is
//   usually better than erasing it with 0.  (Why might this be?)
struct Page *
page_alloc()
{
f010a2a9:	55                   	push   %ebp
f010a2aa:	89 e5                	mov    %esp,%ebp
f010a2ac:	53                   	push   %ebx
f010a2ad:	83 ec 14             	sub    $0x14,%esp
	// Fill this function in
	struct Page * alloc_page;
	if (free_pages == NULL)
f010a2b0:	8b 1d 74 40 19 f0    	mov    0xf0194074,%ebx
f010a2b6:	85 db                	test   %ebx,%ebx
f010a2b8:	74 70                	je     f010a32a <_Z10page_allocv+0x81>
	return NULL;
	// Get a free page from link free_pages, but no initial
	alloc_page = free_pages;
	// Delete allocted page from link free_pages
	free_pages = free_pages->pp_next;
f010a2ba:	8b 03                	mov    (%ebx),%eax
f010a2bc:	a3 74 40 19 f0       	mov    %eax,0xf0194074
	alloc_page->pp_next = NULL;
f010a2c1:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
f010a2c7:	a1 28 40 19 f0       	mov    0xf0194028,%eax
f010a2cc:	39 c3                	cmp    %eax,%ebx
f010a2ce:	72 0d                	jb     f010a2dd <_Z10page_allocv+0x34>
f010a2d0:	8b 15 20 40 19 f0    	mov    0xf0194020,%edx
f010a2d6:	8d 14 d0             	lea    (%eax,%edx,8),%edx
f010a2d9:	39 d3                	cmp    %edx,%ebx
f010a2db:	72 24                	jb     f010a301 <_Z10page_allocv+0x58>
f010a2dd:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010a2e4:	f0 
f010a2e5:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a2ec:	f0 
f010a2ed:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a2f4:	00 
f010a2f5:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010a2fc:	e8 5f ed ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	// Erase allocted memory
	memset(alloc_page->data(), 0xCC, sizeof(*alloc_page));
f010a301:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
f010a308:	00 
f010a309:	c7 44 24 04 cc 00 00 	movl   $0xcc,0x4(%esp)
f010a310:	00 
f010a311:	89 da                	mov    %ebx,%edx
f010a313:	29 c2                	sub    %eax,%edx
f010a315:	89 d0                	mov    %edx,%eax
f010a317:	c1 f8 03             	sar    $0x3,%eax
f010a31a:	c1 e0 0c             	shl    $0xc,%eax
f010a31d:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010a322:	89 04 24             	mov    %eax,(%esp)
f010a325:	e8 44 36 00 00       	call   f010d96e <memset>
	return alloc_page;
}
f010a32a:	89 d8                	mov    %ebx,%eax
f010a32c:	83 c4 14             	add    $0x14,%esp
f010a32f:	5b                   	pop    %ebx
f010a330:	5d                   	pop    %ebp
f010a331:	c3                   	ret    

f010a332 <_Z10pgdir_walkPjji>:
//
// Hint: you can turn a Page * into the physical address of the
// page it refers to with Page::physaddr() from inc/memlayout.h.
pte_t *
pgdir_walk(pde_t *pgdir, uintptr_t va, int create)
{
f010a332:	55                   	push   %ebp
f010a333:	89 e5                	mov    %esp,%ebp
f010a335:	83 ec 28             	sub    $0x28,%esp
f010a338:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f010a33b:	89 75 f8             	mov    %esi,-0x8(%ebp)
f010a33e:	89 7d fc             	mov    %edi,-0x4(%ebp)
f010a341:	8b 75 0c             	mov    0xc(%ebp),%esi
	// Fill this function in
	struct Page *newpage;
	// If find, return the pointer to the page table entry(PTE)
	if((pgdir[PDX(va)] & PTE_P) != 0)
f010a344:	89 f3                	mov    %esi,%ebx
f010a346:	c1 eb 16             	shr    $0x16,%ebx
f010a349:	c1 e3 02             	shl    $0x2,%ebx
f010a34c:	03 5d 08             	add    0x8(%ebp),%ebx
f010a34f:	8b 03                	mov    (%ebx),%eax
f010a351:	a8 01                	test   $0x1,%al
f010a353:	74 47                	je     f010a39c <_Z10pgdir_walkPjji+0x6a>
	return &(((pte_t *)KADDR(PTE_ADDR(pgdir[PDX(va)])))[PTX(va)]); 
f010a355:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f010a35a:	89 c2                	mov    %eax,%edx
f010a35c:	c1 ea 0c             	shr    $0xc,%edx
f010a35f:	3b 15 20 40 19 f0    	cmp    0xf0194020,%edx
f010a365:	72 20                	jb     f010a387 <_Z10pgdir_walkPjji+0x55>
f010a367:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010a36b:	c7 44 24 08 f8 e6 10 	movl   $0xf010e6f8,0x8(%esp)
f010a372:	f0 
f010a373:	c7 44 24 04 bc 01 00 	movl   $0x1bc,0x4(%esp)
f010a37a:	00 
f010a37b:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a382:	e8 d9 ec ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a387:	c1 ee 0a             	shr    $0xa,%esi
f010a38a:	81 e6 fc 0f 00 00    	and    $0xffc,%esi
f010a390:	8d 84 30 00 00 00 f0 	lea    -0x10000000(%eax,%esi,1),%eax
f010a397:	e9 a2 00 00 00       	jmp    f010a43e <_Z10pgdir_walkPjji+0x10c>
	// If create == 0, pgdir_walk returns NULL
	else if(create == 0)
f010a39c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
f010a3a0:	0f 84 93 00 00 00    	je     f010a439 <_Z10pgdir_walkPjji+0x107>
		return NULL;
	     else
		{
	// Allocate a new page table
		newpage = page_alloc();
f010a3a6:	e8 fe fe ff ff       	call   f010a2a9 <_Z10page_allocv>
f010a3ab:	89 c7                	mov    %eax,%edi
		if(!newpage)
f010a3ad:	85 c0                	test   %eax,%eax
f010a3af:	90                   	nop
f010a3b0:	0f 84 83 00 00 00    	je     f010a439 <_Z10pgdir_walkPjji+0x107>
			return NULL;
		newpage->pp_ref++;
f010a3b6:	66 83 40 04 01       	addw   $0x1,0x4(%eax)
		return this - pages;
	}
	
	// Returns a kernel virtual pointer to the corresponding page.
	void *data() const {
		return (void *) (KERNBASE + page_number() * PGSIZE);
f010a3bb:	89 04 24             	mov    %eax,(%esp)
f010a3be:	e8 fb 19 00 00       	call   f010bdbe <_ZNK4Page11page_numberEv>
		memset(newpage->data(), 0, PGSIZE);
f010a3c3:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010a3ca:	00 
f010a3cb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010a3d2:	00 
f010a3d3:	c1 e0 0c             	shl    $0xc,%eax
f010a3d6:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010a3db:	89 04 24             	mov    %eax,(%esp)
f010a3de:	e8 8b 35 00 00       	call   f010d96e <memset>
	}

	// Returns the physical address for this page.
	physaddr_t physaddr() const {
		return page_number() * PGSIZE;
f010a3e3:	89 3c 24             	mov    %edi,(%esp)
f010a3e6:	e8 d3 19 00 00       	call   f010bdbe <_ZNK4Page11page_numberEv>
		pgdir[PDX(va)] = newpage->physaddr() | PTE_P | PTE_U | PTE_W;
f010a3eb:	c1 e0 0c             	shl    $0xc,%eax
f010a3ee:	83 c8 07             	or     $0x7,%eax
f010a3f1:	89 03                	mov    %eax,(%ebx)
	// Return the new page entry pointer
		return &(((pte_t *)KADDR(PTE_ADDR(pgdir[PDX(va)])))[PTX(va)]);
f010a3f3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f010a3f8:	89 c2                	mov    %eax,%edx
f010a3fa:	c1 ea 0c             	shr    $0xc,%edx
f010a3fd:	3b 15 20 40 19 f0    	cmp    0xf0194020,%edx
f010a403:	72 20                	jb     f010a425 <_Z10pgdir_walkPjji+0xf3>
f010a405:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010a409:	c7 44 24 08 f8 e6 10 	movl   $0xf010e6f8,0x8(%esp)
f010a410:	f0 
f010a411:	c7 44 24 04 ca 01 00 	movl   $0x1ca,0x4(%esp)
f010a418:	00 
f010a419:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a420:	e8 3b ec ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a425:	c1 ee 0a             	shr    $0xa,%esi
f010a428:	89 f2                	mov    %esi,%edx
f010a42a:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
f010a430:	8d 84 10 00 00 00 f0 	lea    -0x10000000(%eax,%edx,1),%eax
f010a437:	eb 05                	jmp    f010a43e <_Z10pgdir_walkPjji+0x10c>
f010a439:	b8 00 00 00 00       	mov    $0x0,%eax
		}	
	return NULL;
}
f010a43e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f010a441:	8b 75 f8             	mov    -0x8(%ebp),%esi
f010a444:	8b 7d fc             	mov    -0x4(%ebp),%edi
f010a447:	89 ec                	mov    %ebp,%esp
f010a449:	5d                   	pop    %ebp
f010a44a:	c3                   	ret    

f010a44b <_Z14user_mem_checkP3Envjji>:
	}	return 0;(void *)

}*/
int
user_mem_check(struct Env *env, uintptr_t va, size_t len, int perm)
{
f010a44b:	55                   	push   %ebp
f010a44c:	89 e5                	mov    %esp,%ebp
f010a44e:	57                   	push   %edi
f010a44f:	56                   	push   %esi
f010a450:	53                   	push   %ebx
f010a451:	83 ec 2c             	sub    $0x2c,%esp
f010a454:	8b 5d 08             	mov    0x8(%ebp),%ebx
f010a457:	8b 45 0c             	mov    0xc(%ebp),%eax
	size_t i;
	pte_t *pte;

	perm |= PTE_P;
f010a45a:	8b 55 14             	mov    0x14(%ebp),%edx
f010a45d:	83 ca 01             	or     $0x1,%edx
	user_mem_check_addr = (uintptr_t) va;
	for (i = 0; i < len; i += PGSIZE) {
f010a460:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
f010a464:	0f 84 ce 00 00 00    	je     f010a538 <_Z14user_mem_checkP3Envjji+0xed>
		user_mem_check_addr += i;
f010a46a:	a3 70 40 19 f0       	mov    %eax,0xf0194070

		if (user_mem_check_addr >= ULIM)
f010a46f:	3d ff ff bf ef       	cmp    $0xefbfffff,%eax
f010a474:	0f 87 cf 00 00 00    	ja     f010a549 <_Z14user_mem_checkP3Envjji+0xfe>
f010a47a:	be 00 00 00 00       	mov    $0x0,%esi
			return -E_FAULT;

		if ((perm & PTE_U) &&
f010a47f:	89 d7                	mov    %edx,%edi
f010a481:	83 e7 04             	and    $0x4,%edi
		    (!(env->env_pgdir[PDX(user_mem_check_addr)] & PTE_U)))
			return -E_FAULT;

		if ((perm & PTE_W) &&
f010a484:	83 e2 02             	and    $0x2,%edx
f010a487:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f010a48a:	eb 18                	jmp    f010a4a4 <_Z14user_mem_checkP3Envjji+0x59>
	pte_t *pte;

	perm |= PTE_P;
	user_mem_check_addr = (uintptr_t) va;
	for (i = 0; i < len; i += PGSIZE) {
		user_mem_check_addr += i;
f010a48c:	89 f0                	mov    %esi,%eax
f010a48e:	03 05 70 40 19 f0    	add    0xf0194070,%eax
f010a494:	a3 70 40 19 f0       	mov    %eax,0xf0194070

		if (user_mem_check_addr >= ULIM)
f010a499:	3d ff ff bf ef       	cmp    $0xefbfffff,%eax
f010a49e:	0f 87 a5 00 00 00    	ja     f010a549 <_Z14user_mem_checkP3Envjji+0xfe>
			return -E_FAULT;

		if ((perm & PTE_U) &&
f010a4a4:	85 ff                	test   %edi,%edi
f010a4a6:	74 18                	je     f010a4c0 <_Z14user_mem_checkP3Envjji+0x75>
		    (!(env->env_pgdir[PDX(user_mem_check_addr)] & PTE_U)))
f010a4a8:	89 c1                	mov    %eax,%ecx
f010a4aa:	c1 e9 16             	shr    $0x16,%ecx
f010a4ad:	8b 53 10             	mov    0x10(%ebx),%edx
f010a4b0:	f6 04 8a 04          	testb  $0x4,(%edx,%ecx,4)
f010a4b4:	75 0a                	jne    f010a4c0 <_Z14user_mem_checkP3Envjji+0x75>
f010a4b6:	b8 fa ff ff ff       	mov    $0xfffffffa,%eax
f010a4bb:	e9 8e 00 00 00       	jmp    f010a54e <_Z14user_mem_checkP3Envjji+0x103>
			return -E_FAULT;

		if ((perm & PTE_W) &&
f010a4c0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
f010a4c4:	74 15                	je     f010a4db <_Z14user_mem_checkP3Envjji+0x90>
		    (!(env->env_pgdir[PDX(user_mem_check_addr)] & PTE_W)))
f010a4c6:	89 c1                	mov    %eax,%ecx
f010a4c8:	c1 e9 16             	shr    $0x16,%ecx
f010a4cb:	8b 53 10             	mov    0x10(%ebx),%edx
f010a4ce:	f6 04 8a 02          	testb  $0x2,(%edx,%ecx,4)
f010a4d2:	75 07                	jne    f010a4db <_Z14user_mem_checkP3Envjji+0x90>
f010a4d4:	b8 fa ff ff ff       	mov    $0xfffffffa,%eax
f010a4d9:	eb 73                	jmp    f010a54e <_Z14user_mem_checkP3Envjji+0x103>
			return -E_FAULT;

		pte = pgdir_walk(env->env_pgdir,
				  user_mem_check_addr, 0);
f010a4db:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010a4e2:	00 
f010a4e3:	89 44 24 04          	mov    %eax,0x4(%esp)
f010a4e7:	8b 43 10             	mov    0x10(%ebx),%eax
f010a4ea:	89 04 24             	mov    %eax,(%esp)
f010a4ed:	e8 40 fe ff ff       	call   f010a332 <_Z10pgdir_walkPjji>
		if (!pte)
f010a4f2:	85 c0                	test   %eax,%eax
f010a4f4:	75 07                	jne    f010a4fd <_Z14user_mem_checkP3Envjji+0xb2>
f010a4f6:	b8 fa ff ff ff       	mov    $0xfffffffa,%eax
f010a4fb:	eb 51                	jmp    f010a54e <_Z14user_mem_checkP3Envjji+0x103>
			return -E_FAULT;

		if ((perm & PTE_U) && (!(*pte & PTE_U)))
f010a4fd:	85 ff                	test   %edi,%edi
f010a4ff:	90                   	nop
f010a500:	74 10                	je     f010a512 <_Z14user_mem_checkP3Envjji+0xc7>
f010a502:	f6 00 04             	testb  $0x4,(%eax)
f010a505:	75 0b                	jne    f010a512 <_Z14user_mem_checkP3Envjji+0xc7>
f010a507:	b8 fa ff ff ff       	mov    $0xfffffffa,%eax
f010a50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010a510:	eb 3c                	jmp    f010a54e <_Z14user_mem_checkP3Envjji+0x103>
			return -E_FAULT;

		if ((perm & PTE_W) && (!(*pte & PTE_W)))
f010a512:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
f010a516:	74 11                	je     f010a529 <_Z14user_mem_checkP3Envjji+0xde>
f010a518:	f6 00 02             	testb  $0x2,(%eax)
f010a51b:	90                   	nop
f010a51c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010a520:	75 07                	jne    f010a529 <_Z14user_mem_checkP3Envjji+0xde>
f010a522:	b8 fa ff ff ff       	mov    $0xfffffffa,%eax
f010a527:	eb 25                	jmp    f010a54e <_Z14user_mem_checkP3Envjji+0x103>
	size_t i;
	pte_t *pte;

	perm |= PTE_P;
	user_mem_check_addr = (uintptr_t) va;
	for (i = 0; i < len; i += PGSIZE) {
f010a529:	81 c6 00 10 00 00    	add    $0x1000,%esi
f010a52f:	39 75 10             	cmp    %esi,0x10(%ebp)
f010a532:	0f 87 54 ff ff ff    	ja     f010a48c <_Z14user_mem_checkP3Envjji+0x41>

		if ((perm & PTE_W) && (!(*pte & PTE_W)))
			return -E_FAULT;
	}

	user_mem_check_addr = 0;
f010a538:	c7 05 70 40 19 f0 00 	movl   $0x0,0xf0194070
f010a53f:	00 00 00 
f010a542:	b8 00 00 00 00       	mov    $0x0,%eax
	return 0;
f010a547:	eb 05                	jmp    f010a54e <_Z14user_mem_checkP3Envjji+0x103>
f010a549:	b8 fa ff ff ff       	mov    $0xfffffffa,%eax
}
f010a54e:	83 c4 2c             	add    $0x2c,%esp
f010a551:	5b                   	pop    %ebx
f010a552:	5e                   	pop    %esi
f010a553:	5f                   	pop    %edi
f010a554:	5d                   	pop    %ebp
f010a555:	c3                   	ret    

f010a556 <_Z15user_mem_assertP3Envjji>:
// of memory [va, va+len) with permissions 'perm | PTE_U | PTE_P'.
// If it can, then the function simply returns.
// If it cannot, 'env' is destroyed.
void
user_mem_assert(Env *env, uintptr_t va, size_t len, int perm)
{
f010a556:	55                   	push   %ebp
f010a557:	89 e5                	mov    %esp,%ebp
f010a559:	53                   	push   %ebx
f010a55a:	83 ec 14             	sub    $0x14,%esp
f010a55d:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if (user_mem_check(env, va, len, perm | PTE_U) < 0) {
f010a560:	8b 45 14             	mov    0x14(%ebp),%eax
f010a563:	83 c8 04             	or     $0x4,%eax
f010a566:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010a56a:	8b 45 10             	mov    0x10(%ebp),%eax
f010a56d:	89 44 24 08          	mov    %eax,0x8(%esp)
f010a571:	8b 45 0c             	mov    0xc(%ebp),%eax
f010a574:	89 44 24 04          	mov    %eax,0x4(%esp)
f010a578:	89 1c 24             	mov    %ebx,(%esp)
f010a57b:	e8 cb fe ff ff       	call   f010a44b <_Z14user_mem_checkP3Envjji>
f010a580:	85 c0                	test   %eax,%eax
f010a582:	79 29                	jns    f010a5ad <_Z15user_mem_assertP3Envjji+0x57>
		cprintf("[%08x] user_mem_check va %08x\n", curenv->env_id, user_mem_check_addr);
f010a584:	a1 70 40 19 f0       	mov    0xf0194070,%eax
f010a589:	89 44 24 08          	mov    %eax,0x8(%esp)
f010a58d:	a1 84 40 19 f0       	mov    0xf0194084,%eax
f010a592:	8b 40 04             	mov    0x4(%eax),%eax
f010a595:	89 44 24 04          	mov    %eax,0x4(%esp)
f010a599:	c7 04 24 78 e8 10 f0 	movl   $0xf010e878,(%esp)
f010a5a0:	e8 ea 1f 00 00       	call   f010c58f <_Z7cprintfPKcz>
		env_destroy(env);	// may not return
f010a5a5:	89 1c 24             	mov    %ebx,(%esp)
f010a5a8:	e8 fb 1a 00 00       	call   f010c0a8 <_Z11env_destroyP3Env>
	}
}
f010a5ad:	83 c4 14             	add    $0x14,%esp
f010a5b0:	5b                   	pop    %ebx
f010a5b1:	5d                   	pop    %ebp
f010a5b2:	c3                   	ret    

f010a5b3 <_Z11page_lookupPjjPS_>:
// Returns 0 if there is no page mapped at va.
//
// Hint: the TA solution uses pgdir_walk.
struct Page *
page_lookup(pde_t *pgdir, uintptr_t va, pte_t **pte_store)
{
f010a5b3:	55                   	push   %ebp
f010a5b4:	89 e5                	mov    %esp,%ebp
f010a5b6:	53                   	push   %ebx
f010a5b7:	83 ec 14             	sub    $0x14,%esp
f010a5ba:	8b 5d 10             	mov    0x10(%ebp),%ebx
	// Fill this function in
	// Lookup virtual address 'va' in page direction
	pte_t *ppte = pgdir_walk(pgdir, va, 0);
f010a5bd:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010a5c4:	00 
f010a5c5:	8b 45 0c             	mov    0xc(%ebp),%eax
f010a5c8:	89 44 24 04          	mov    %eax,0x4(%esp)
f010a5cc:	8b 45 08             	mov    0x8(%ebp),%eax
f010a5cf:	89 04 24             	mov    %eax,(%esp)
f010a5d2:	e8 5b fd ff ff       	call   f010a332 <_Z10pgdir_walkPjji>
	if(ppte == NULL)
f010a5d7:	85 c0                	test   %eax,%eax
f010a5d9:	74 1a                	je     f010a5f5 <_Z11page_lookupPjjPS_+0x42>
		return NULL;
	// Set '*pte_store' to the address of the pte
	if(pte_store != NULL)
f010a5db:	85 db                	test   %ebx,%ebx
f010a5dd:	74 02                	je     f010a5e1 <_Z11page_lookupPjjPS_+0x2e>
		(*pte_store) = ppte;
f010a5df:	89 03                	mov    %eax,(%ebx)
	// Return the mapped page address
	if(*ppte & PTE_P)
f010a5e1:	8b 00                	mov    (%eax),%eax
f010a5e3:	a8 01                	test   $0x1,%al
f010a5e5:	74 0e                	je     f010a5f5 <_Z11page_lookupPjjPS_+0x42>
		return &pages[PGNUM(*ppte)];
f010a5e7:	c1 e8 0c             	shr    $0xc,%eax
f010a5ea:	c1 e0 03             	shl    $0x3,%eax
f010a5ed:	03 05 28 40 19 f0    	add    0xf0194028,%eax
f010a5f3:	eb 05                	jmp    f010a5fa <_Z11page_lookupPjjPS_+0x47>
f010a5f5:	b8 00 00 00 00       	mov    $0x0,%eax
	return NULL;
}
f010a5fa:	83 c4 14             	add    $0x14,%esp
f010a5fd:	5b                   	pop    %ebx
f010a5fe:	5d                   	pop    %ebp
f010a5ff:	c3                   	ret    

f010a600 <_Z11page_removePjj>:
//
// Hint: The TA solution is implemented using page_lookup,
// 	tlb_invalidate, and page_decref.
void
page_remove(pde_t *pgdir, uintptr_t va)
{
f010a600:	55                   	push   %ebp
f010a601:	89 e5                	mov    %esp,%ebp
f010a603:	83 ec 28             	sub    $0x28,%esp
f010a606:	89 5d f8             	mov    %ebx,-0x8(%ebp)
f010a609:	89 75 fc             	mov    %esi,-0x4(%ebp)
f010a60c:	8b 75 08             	mov    0x8(%ebp),%esi
f010a60f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	// Fill this function in
	pte_t *ppte;
	// Lookup 'va' to identify if any physical page at that address
	struct Page *page = page_lookup(pgdir, va, &ppte);
f010a612:	8d 45 f4             	lea    -0xc(%ebp),%eax
f010a615:	89 44 24 08          	mov    %eax,0x8(%esp)
f010a619:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010a61d:	89 34 24             	mov    %esi,(%esp)
f010a620:	e8 8e ff ff ff       	call   f010a5b3 <_Z11page_lookupPjjPS_>
	// If no physical page mapped just return
	if(page == NULL)
f010a625:	85 c0                	test   %eax,%eax
f010a627:	74 1d                	je     f010a646 <_Z11page_removePjj+0x46>
		return;
	// Else decrement the ref count
	page_decref(page);
f010a629:	89 04 24             	mov    %eax,(%esp)
f010a62c:	e8 55 fc ff ff       	call   f010a286 <_Z11page_decrefP4Page>
	// Set corresponding page table entry (PTE) to 0
	*ppte = 0;
f010a631:	8b 45 f4             	mov    -0xc(%ebp),%eax
f010a634:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	// Invalidated the TLB
	tlb_invalidate(pgdir, va);
f010a63a:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010a63e:	89 34 24             	mov    %esi,(%esp)
f010a641:	e8 fa f5 ff ff       	call   f0109c40 <_Z14tlb_invalidatePjj>
	return;
}
f010a646:	8b 5d f8             	mov    -0x8(%ebp),%ebx
f010a649:	8b 75 fc             	mov    -0x4(%ebp),%esi
f010a64c:	89 ec                	mov    %ebp,%esp
f010a64e:	5d                   	pop    %ebp
f010a64f:	c3                   	ret    

f010a650 <_ZL16page_map_segmentPjjjji>:
// reserved portions of physical memory.
// There's no need here to manage page reference counts or invalidate the TLB.
static void
page_map_segment(pte_t *pgdir, uintptr_t la, size_t size, physaddr_t pa,
		 int perm)
{
f010a650:	55                   	push   %ebp
f010a651:	89 e5                	mov    %esp,%ebp
f010a653:	57                   	push   %edi
f010a654:	56                   	push   %esi
f010a655:	53                   	push   %ebx
f010a656:	83 ec 2c             	sub    $0x2c,%esp
f010a659:	89 c7                	mov    %eax,%edi
f010a65b:	89 d6                	mov    %edx,%esi
	// LAB 2: Your code here.
	size_t index;
	pte_t *ppte;
	assert((la & (PGSIZE - 1)) == 0 );
f010a65d:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
f010a663:	74 24                	je     f010a689 <_ZL16page_map_segmentPjjjji+0x39>
f010a665:	c7 44 24 0c 40 ec 10 	movl   $0xf010ec40,0xc(%esp)
f010a66c:	f0 
f010a66d:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a674:	f0 
f010a675:	c7 44 24 04 4b 02 00 	movl   $0x24b,0x4(%esp)
f010a67c:	00 
f010a67d:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a684:	e8 d7 e9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	assert((pa & (PGSIZE - 1)) == 0 );
f010a689:	f7 45 08 ff 0f 00 00 	testl  $0xfff,0x8(%ebp)
f010a690:	74 24                	je     f010a6b6 <_ZL16page_map_segmentPjjjji+0x66>
f010a692:	c7 44 24 0c 59 ec 10 	movl   $0xf010ec59,0xc(%esp)
f010a699:	f0 
f010a69a:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a6a1:	f0 
f010a6a2:	c7 44 24 04 4c 02 00 	movl   $0x24c,0x4(%esp)
f010a6a9:	00 
f010a6aa:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a6b1:	e8 aa e9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	// Ensure size is a multiple of PGSIZE
	size = round_up(size, PGSIZE);
f010a6b6:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010a6bd:	00 
f010a6be:	89 0c 24             	mov    %ecx,(%esp)
f010a6c1:	e8 a3 16 00 00       	call   f010bd69 <_Z8round_upIjET_S0_j>
f010a6c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	// Map linear address to physical
	for(index = 0; index < size; index += PGSIZE)
f010a6c9:	85 c0                	test   %eax,%eax
f010a6cb:	74 63                	je     f010a730 <_ZL16page_map_segmentPjjjji+0xe0>
f010a6cd:	bb 00 00 00 00       	mov    $0x0,%ebx
	{
		ppte = pgdir_walk(pgdir, (la + index), 1);
		assert(ppte != NULL);
		// Set permission of PTE
		(*ppte) = (pa + index) | perm | PTE_P;
f010a6d2:	8b 45 0c             	mov    0xc(%ebp),%eax
f010a6d5:	83 c8 01             	or     $0x1,%eax
f010a6d8:	89 45 e0             	mov    %eax,-0x20(%ebp)
	// Ensure size is a multiple of PGSIZE
	size = round_up(size, PGSIZE);
	// Map linear address to physical
	for(index = 0; index < size; index += PGSIZE)
	{
		ppte = pgdir_walk(pgdir, (la + index), 1);
f010a6db:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
f010a6e2:	00 
f010a6e3:	8d 04 33             	lea    (%ebx,%esi,1),%eax
f010a6e6:	89 44 24 04          	mov    %eax,0x4(%esp)
f010a6ea:	89 3c 24             	mov    %edi,(%esp)
f010a6ed:	e8 40 fc ff ff       	call   f010a332 <_Z10pgdir_walkPjji>
		assert(ppte != NULL);
f010a6f2:	85 c0                	test   %eax,%eax
f010a6f4:	75 24                	jne    f010a71a <_ZL16page_map_segmentPjjjji+0xca>
f010a6f6:	c7 44 24 0c 72 ec 10 	movl   $0xf010ec72,0xc(%esp)
f010a6fd:	f0 
f010a6fe:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a705:	f0 
f010a706:	c7 44 24 04 53 02 00 	movl   $0x253,0x4(%esp)
f010a70d:	00 
f010a70e:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a715:	e8 46 e9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
		// Set permission of PTE
		(*ppte) = (pa + index) | perm | PTE_P;
f010a71a:	8b 55 08             	mov    0x8(%ebp),%edx
f010a71d:	8d 14 13             	lea    (%ebx,%edx,1),%edx
f010a720:	0b 55 e0             	or     -0x20(%ebp),%edx
f010a723:	89 10                	mov    %edx,(%eax)
	assert((la & (PGSIZE - 1)) == 0 );
	assert((pa & (PGSIZE - 1)) == 0 );
	// Ensure size is a multiple of PGSIZE
	size = round_up(size, PGSIZE);
	// Map linear address to physical
	for(index = 0; index < size; index += PGSIZE)
f010a725:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f010a72b:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
f010a72e:	77 ab                	ja     f010a6db <_ZL16page_map_segmentPjjjji+0x8b>
		assert(ppte != NULL);
		// Set permission of PTE
		(*ppte) = (pa + index) | perm | PTE_P;
	}
	return;
}
f010a730:	83 c4 2c             	add    $0x2c,%esp
f010a733:	5b                   	pop    %ebx
f010a734:	5e                   	pop    %esi
f010a735:	5f                   	pop    %edi
f010a736:	5d                   	pop    %ebp
f010a737:	c3                   	ret    

f010a738 <_Z11page_insertPjP4Pageji>:
//
// Hint: The TA solution is implemented using pgdir_walk, page_remove,
// and Page::physaddr.
int
page_insert(pde_t *pgdir, struct Page *pp, uintptr_t va, int perm) 
{
f010a738:	55                   	push   %ebp
f010a739:	89 e5                	mov    %esp,%ebp
f010a73b:	83 ec 28             	sub    $0x28,%esp
f010a73e:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f010a741:	89 75 f8             	mov    %esi,-0x8(%ebp)
f010a744:	89 7d fc             	mov    %edi,-0x4(%ebp)
f010a747:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010a74a:	8b 7d 10             	mov    0x10(%ebp),%edi
	// Fill this function in
	pte_t *ppte = pgdir_walk(pgdir, va, 1);
f010a74d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
f010a754:	00 
f010a755:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010a759:	8b 45 08             	mov    0x8(%ebp),%eax
f010a75c:	89 04 24             	mov    %eax,(%esp)
f010a75f:	e8 ce fb ff ff       	call   f010a332 <_Z10pgdir_walkPjji>
f010a764:	89 c6                	mov    %eax,%esi
	// Allocate page failed
	if(ppte == NULL)
f010a766:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
f010a76b:	85 f6                	test   %esi,%esi
f010a76d:	0f 84 d5 00 00 00    	je     f010a848 <_Z11page_insertPjP4Pageji+0x110>
		return -E_NO_MEM;
	if(((*ppte) & PTE_P) != 0)
f010a773:	8b 06                	mov    (%esi),%eax
f010a775:	a8 01                	test   $0x1,%al
f010a777:	74 66                	je     f010a7df <_Z11page_insertPjP4Pageji+0xa7>
	uint16_t pp_ref;

#if JOS_KERNEL
	// Returns the physical page number for this page.
	size_t page_number() const {
		assert(this >= pages && this < pages + npages);
f010a779:	8b 0d 28 40 19 f0    	mov    0xf0194028,%ecx
f010a77f:	39 cb                	cmp    %ecx,%ebx
f010a781:	72 0d                	jb     f010a790 <_Z11page_insertPjP4Pageji+0x58>
f010a783:	8b 15 20 40 19 f0    	mov    0xf0194020,%edx
f010a789:	8d 14 d1             	lea    (%ecx,%edx,8),%edx
f010a78c:	39 d3                	cmp    %edx,%ebx
f010a78e:	72 24                	jb     f010a7b4 <_Z11page_insertPjP4Pageji+0x7c>
f010a790:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010a797:	f0 
f010a798:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a79f:	f0 
f010a7a0:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a7a7:	00 
f010a7a8:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010a7af:	e8 ac e8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	{
		// Already page mapped, need be removed
		if(PTE_ADDR(*ppte) != pp->physaddr())
f010a7b4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f010a7b9:	89 da                	mov    %ebx,%edx
f010a7bb:	29 ca                	sub    %ecx,%edx
f010a7bd:	89 d1                	mov    %edx,%ecx
f010a7bf:	c1 f9 03             	sar    $0x3,%ecx
f010a7c2:	c1 e1 0c             	shl    $0xc,%ecx
f010a7c5:	39 c8                	cmp    %ecx,%eax
f010a7c7:	74 11                	je     f010a7da <_Z11page_insertPjP4Pageji+0xa2>
		page_remove(pgdir, va);
f010a7c9:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010a7cd:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010a7d0:	89 0c 24             	mov    %ecx,(%esp)
f010a7d3:	e8 28 fe ff ff       	call   f010a600 <_Z11page_removePjj>
f010a7d8:	eb 05                	jmp    f010a7df <_Z11page_insertPjP4Pageji+0xa7>
		else
		pp->pp_ref--;
f010a7da:	66 83 6b 04 01       	subw   $0x1,0x4(%ebx)
f010a7df:	a1 28 40 19 f0       	mov    0xf0194028,%eax
f010a7e4:	39 c3                	cmp    %eax,%ebx
f010a7e6:	72 0d                	jb     f010a7f5 <_Z11page_insertPjP4Pageji+0xbd>
f010a7e8:	8b 15 20 40 19 f0    	mov    0xf0194020,%edx
f010a7ee:	8d 14 d0             	lea    (%eax,%edx,8),%edx
f010a7f1:	39 d3                	cmp    %edx,%ebx
f010a7f3:	72 24                	jb     f010a819 <_Z11page_insertPjP4Pageji+0xe1>
f010a7f5:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010a7fc:	f0 
f010a7fd:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a804:	f0 
f010a805:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a80c:	00 
f010a80d:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010a814:	e8 47 e8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	}
	// Set permissions
	*ppte = pp->physaddr() | perm | PTE_P;
f010a819:	8b 55 14             	mov    0x14(%ebp),%edx
f010a81c:	83 ca 01             	or     $0x1,%edx
f010a81f:	89 d9                	mov    %ebx,%ecx
f010a821:	29 c1                	sub    %eax,%ecx
f010a823:	89 c8                	mov    %ecx,%eax
f010a825:	c1 f8 03             	sar    $0x3,%eax
f010a828:	c1 e0 0c             	shl    $0xc,%eax
f010a82b:	09 d0                	or     %edx,%eax
f010a82d:	89 06                	mov    %eax,(%esi)
	pp->pp_ref++;
f010a82f:	66 83 43 04 01       	addw   $0x1,0x4(%ebx)
	// invalidate TLB of former page at 'va'
	tlb_invalidate(pgdir, va);
f010a834:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010a838:	8b 45 08             	mov    0x8(%ebp),%eax
f010a83b:	89 04 24             	mov    %eax,(%esp)
f010a83e:	e8 fd f3 ff ff       	call   f0109c40 <_Z14tlb_invalidatePjj>
f010a843:	b8 00 00 00 00       	mov    $0x0,%eax
	return 0;
}
f010a848:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f010a84b:	8b 75 f8             	mov    -0x8(%ebp),%esi
f010a84e:	8b 7d fc             	mov    -0x4(%ebp),%edi
f010a851:	89 ec                	mov    %ebp,%esp
f010a853:	5d                   	pop    %ebp
f010a854:	c3                   	ret    

f010a855 <_Z8mem_initv>:
f010a855:	55                   	push   %ebp
f010a856:	89 e5                	mov    %esp,%ebp
f010a858:	57                   	push   %edi
f010a859:	56                   	push   %esi
f010a85a:	53                   	push   %ebx
f010a85b:	83 ec 4c             	sub    $0x4c,%esp
f010a85e:	e8 7d f5 ff ff       	call   f0109de0 <_ZL15i386_mem_detectv>
f010a863:	a1 20 40 19 f0       	mov    0xf0194020,%eax
f010a868:	c1 e0 03             	shl    $0x3,%eax
f010a86b:	89 45 c8             	mov    %eax,-0x38(%ebp)
f010a86e:	89 04 24             	mov    %eax,(%esp)
f010a871:	e8 5e f4 ff ff       	call   f0109cd4 <_ZL10boot_allocj>
f010a876:	a3 28 40 19 f0       	mov    %eax,0xf0194028
f010a87b:	c7 04 24 00 70 01 00 	movl   $0x17000,(%esp)
f010a882:	e8 4d f4 ff ff       	call   f0109cd4 <_ZL10boot_allocj>
f010a887:	a3 80 40 19 f0       	mov    %eax,0xf0194080
f010a88c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f010a893:	e8 3c f4 ff ff       	call   f0109cd4 <_ZL10boot_allocj>
f010a898:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010a89d:	77 20                	ja     f010a8bf <_Z8mem_initv+0x6a>
f010a89f:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010a8a3:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f010a8aa:	f0 
f010a8ab:	c7 44 24 04 53 01 00 	movl   $0x153,0x4(%esp)
f010a8b2:	00 
f010a8b3:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010a8ba:	e8 a1 e7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a8bf:	05 00 00 00 10       	add    $0x10000000,%eax
f010a8c4:	c1 e8 0c             	shr    $0xc,%eax
f010a8c7:	8d 58 01             	lea    0x1(%eax),%ebx
f010a8ca:	83 3d 20 40 19 f0 00 	cmpl   $0x0,0xf0194020
f010a8d1:	74 6e                	je     f010a941 <_Z8mem_initv+0xec>
f010a8d3:	ba 00 00 00 00       	mov    $0x0,%edx
f010a8d8:	b8 00 00 00 00       	mov    $0x0,%eax
f010a8dd:	85 c0                	test   %eax,%eax
f010a8df:	75 0e                	jne    f010a8ef <_Z8mem_initv+0x9a>
f010a8e1:	8b 0d 28 40 19 f0    	mov    0xf0194028,%ecx
f010a8e7:	66 c7 41 04 01 00    	movw   $0x1,0x4(%ecx)
f010a8ed:	eb 44                	jmp    f010a933 <_Z8mem_initv+0xde>
f010a8ef:	3d 9f 00 00 00       	cmp    $0x9f,%eax
f010a8f4:	76 13                	jbe    f010a909 <_Z8mem_initv+0xb4>
f010a8f6:	39 c3                	cmp    %eax,%ebx
f010a8f8:	76 0f                	jbe    f010a909 <_Z8mem_initv+0xb4>
f010a8fa:	8b 0d 28 40 19 f0    	mov    0xf0194028,%ecx
f010a900:	66 c7 44 11 04 01 00 	movw   $0x1,0x4(%ecx,%edx,1)
f010a907:	eb 2a                	jmp    f010a933 <_Z8mem_initv+0xde>
f010a909:	8b 0d 28 40 19 f0    	mov    0xf0194028,%ecx
f010a90f:	66 c7 44 11 04 00 00 	movw   $0x0,0x4(%ecx,%edx,1)
f010a916:	8b 35 74 40 19 f0    	mov    0xf0194074,%esi
f010a91c:	8b 0d 28 40 19 f0    	mov    0xf0194028,%ecx
f010a922:	89 34 11             	mov    %esi,(%ecx,%edx,1)
f010a925:	89 d1                	mov    %edx,%ecx
f010a927:	03 0d 28 40 19 f0    	add    0xf0194028,%ecx
f010a92d:	89 0d 74 40 19 f0    	mov    %ecx,0xf0194074
f010a933:	83 c0 01             	add    $0x1,%eax
f010a936:	83 c2 08             	add    $0x8,%edx
f010a939:	3b 05 20 40 19 f0    	cmp    0xf0194020,%eax
f010a93f:	72 9c                	jb     f010a8dd <_Z8mem_initv+0x88>
f010a941:	8b 1d 74 40 19 f0    	mov    0xf0194074,%ebx
f010a947:	85 db                	test   %ebx,%ebx
f010a949:	0f 84 81 00 00 00    	je     f010a9d0 <_Z8mem_initv+0x17b>
f010a94f:	a1 28 40 19 f0       	mov    0xf0194028,%eax
f010a954:	39 c3                	cmp    %eax,%ebx
f010a956:	72 25                	jb     f010a97d <_Z8mem_initv+0x128>
f010a958:	8b 15 20 40 19 f0    	mov    0xf0194020,%edx
f010a95e:	8d 14 d0             	lea    (%eax,%edx,8),%edx
f010a961:	39 d3                	cmp    %edx,%ebx
f010a963:	72 3c                	jb     f010a9a1 <_Z8mem_initv+0x14c>
f010a965:	eb 16                	jmp    f010a97d <_Z8mem_initv+0x128>
f010a967:	a1 28 40 19 f0       	mov    0xf0194028,%eax
f010a96c:	39 c3                	cmp    %eax,%ebx
f010a96e:	72 0d                	jb     f010a97d <_Z8mem_initv+0x128>
f010a970:	8b 15 20 40 19 f0    	mov    0xf0194020,%edx
f010a976:	8d 14 d0             	lea    (%eax,%edx,8),%edx
f010a979:	39 d3                	cmp    %edx,%ebx
f010a97b:	72 24                	jb     f010a9a1 <_Z8mem_initv+0x14c>
f010a97d:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010a984:	f0 
f010a985:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a98c:	f0 
f010a98d:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a994:	00 
f010a995:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010a99c:	e8 bf e6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a9a1:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
f010a9a8:	00 
f010a9a9:	c7 44 24 04 97 00 00 	movl   $0x97,0x4(%esp)
f010a9b0:	00 
f010a9b1:	89 da                	mov    %ebx,%edx
f010a9b3:	29 c2                	sub    %eax,%edx
f010a9b5:	89 d0                	mov    %edx,%eax
f010a9b7:	c1 f8 03             	sar    $0x3,%eax
f010a9ba:	c1 e0 0c             	shl    $0xc,%eax
f010a9bd:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010a9c2:	89 04 24             	mov    %eax,(%esp)
f010a9c5:	e8 a4 2f 00 00       	call   f010d96e <memset>
f010a9ca:	8b 1b                	mov    (%ebx),%ebx
f010a9cc:	85 db                	test   %ebx,%ebx
f010a9ce:	75 97                	jne    f010a967 <_Z8mem_initv+0x112>
f010a9d0:	e8 d4 f8 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010a9d5:	89 c3                	mov    %eax,%ebx
f010a9d7:	e8 cd f8 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010a9dc:	89 c7                	mov    %eax,%edi
f010a9de:	e8 c6 f8 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010a9e3:	89 c6                	mov    %eax,%esi
f010a9e5:	85 db                	test   %ebx,%ebx
f010a9e7:	75 24                	jne    f010aa0d <_Z8mem_initv+0x1b8>
f010a9e9:	c7 44 24 0c 8d ec 10 	movl   $0xf010ec8d,0xc(%esp)
f010a9f0:	f0 
f010a9f1:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010a9f8:	f0 
f010a9f9:	c7 44 24 04 d0 02 00 	movl   $0x2d0,0x4(%esp)
f010aa00:	00 
f010aa01:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010aa08:	e8 53 e6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aa0d:	85 ff                	test   %edi,%edi
f010aa0f:	74 04                	je     f010aa15 <_Z8mem_initv+0x1c0>
f010aa11:	39 fb                	cmp    %edi,%ebx
f010aa13:	75 24                	jne    f010aa39 <_Z8mem_initv+0x1e4>
f010aa15:	c7 44 24 0c 7f ec 10 	movl   $0xf010ec7f,0xc(%esp)
f010aa1c:	f0 
f010aa1d:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010aa24:	f0 
f010aa25:	c7 44 24 04 d1 02 00 	movl   $0x2d1,0x4(%esp)
f010aa2c:	00 
f010aa2d:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010aa34:	e8 27 e6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aa39:	85 c0                	test   %eax,%eax
f010aa3b:	74 08                	je     f010aa45 <_Z8mem_initv+0x1f0>
f010aa3d:	39 c7                	cmp    %eax,%edi
f010aa3f:	74 04                	je     f010aa45 <_Z8mem_initv+0x1f0>
f010aa41:	39 c3                	cmp    %eax,%ebx
f010aa43:	75 24                	jne    f010aa69 <_Z8mem_initv+0x214>
f010aa45:	c7 44 24 0c 98 e8 10 	movl   $0xf010e898,0xc(%esp)
f010aa4c:	f0 
f010aa4d:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010aa54:	f0 
f010aa55:	c7 44 24 04 d2 02 00 	movl   $0x2d2,0x4(%esp)
f010aa5c:	00 
f010aa5d:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010aa64:	e8 f7 e5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aa69:	a1 28 40 19 f0       	mov    0xf0194028,%eax
f010aa6e:	39 c3                	cmp    %eax,%ebx
f010aa70:	72 10                	jb     f010aa82 <_Z8mem_initv+0x22d>
f010aa72:	8b 15 20 40 19 f0    	mov    0xf0194020,%edx
f010aa78:	8d 0c d0             	lea    (%eax,%edx,8),%ecx
f010aa7b:	89 4d cc             	mov    %ecx,-0x34(%ebp)
f010aa7e:	39 cb                	cmp    %ecx,%ebx
f010aa80:	72 24                	jb     f010aaa6 <_Z8mem_initv+0x251>
f010aa82:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010aa89:	f0 
f010aa8a:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010aa91:	f0 
f010aa92:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010aa99:	00 
f010aa9a:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010aaa1:	e8 ba e5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aaa6:	89 45 d0             	mov    %eax,-0x30(%ebp)
f010aaa9:	89 d9                	mov    %ebx,%ecx
f010aaab:	29 c1                	sub    %eax,%ecx
f010aaad:	c1 f9 03             	sar    $0x3,%ecx
f010aab0:	39 ca                	cmp    %ecx,%edx
f010aab2:	77 24                	ja     f010aad8 <_Z8mem_initv+0x283>
f010aab4:	c7 44 24 0c 91 ec 10 	movl   $0xf010ec91,0xc(%esp)
f010aabb:	f0 
f010aabc:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010aac3:	f0 
f010aac4:	c7 44 24 04 d3 02 00 	movl   $0x2d3,0x4(%esp)
f010aacb:	00 
f010aacc:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010aad3:	e8 88 e5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aad8:	39 c7                	cmp    %eax,%edi
f010aada:	72 05                	jb     f010aae1 <_Z8mem_initv+0x28c>
f010aadc:	3b 7d cc             	cmp    -0x34(%ebp),%edi
f010aadf:	72 24                	jb     f010ab05 <_Z8mem_initv+0x2b0>
f010aae1:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010aae8:	f0 
f010aae9:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010aaf0:	f0 
f010aaf1:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010aaf8:	00 
f010aaf9:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010ab00:	e8 5b e5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ab05:	89 f9                	mov    %edi,%ecx
f010ab07:	2b 4d d0             	sub    -0x30(%ebp),%ecx
f010ab0a:	c1 f9 03             	sar    $0x3,%ecx
f010ab0d:	39 ca                	cmp    %ecx,%edx
f010ab0f:	77 24                	ja     f010ab35 <_Z8mem_initv+0x2e0>
f010ab11:	c7 44 24 0c ad ec 10 	movl   $0xf010ecad,0xc(%esp)
f010ab18:	f0 
f010ab19:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ab20:	f0 
f010ab21:	c7 44 24 04 d4 02 00 	movl   $0x2d4,0x4(%esp)
f010ab28:	00 
f010ab29:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010ab30:	e8 2b e5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ab35:	39 c6                	cmp    %eax,%esi
f010ab37:	72 05                	jb     f010ab3e <_Z8mem_initv+0x2e9>
f010ab39:	3b 75 cc             	cmp    -0x34(%ebp),%esi
f010ab3c:	72 24                	jb     f010ab62 <_Z8mem_initv+0x30d>
f010ab3e:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010ab45:	f0 
f010ab46:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ab4d:	f0 
f010ab4e:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010ab55:	00 
f010ab56:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010ab5d:	e8 fe e4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ab62:	89 f0                	mov    %esi,%eax
f010ab64:	2b 45 d0             	sub    -0x30(%ebp),%eax
f010ab67:	c1 f8 03             	sar    $0x3,%eax
f010ab6a:	39 c2                	cmp    %eax,%edx
f010ab6c:	77 24                	ja     f010ab92 <_Z8mem_initv+0x33d>
f010ab6e:	c7 44 24 0c c9 ec 10 	movl   $0xf010ecc9,0xc(%esp)
f010ab75:	f0 
f010ab76:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ab7d:	f0 
f010ab7e:	c7 44 24 04 d5 02 00 	movl   $0x2d5,0x4(%esp)
f010ab85:	00 
f010ab86:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010ab8d:	e8 ce e4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ab92:	a1 74 40 19 f0       	mov    0xf0194074,%eax
f010ab97:	89 45 d4             	mov    %eax,-0x2c(%ebp)
f010ab9a:	c7 05 74 40 19 f0 00 	movl   $0x0,0xf0194074
f010aba1:	00 00 00 
f010aba4:	e8 00 f7 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010aba9:	85 c0                	test   %eax,%eax
f010abab:	74 24                	je     f010abd1 <_Z8mem_initv+0x37c>
f010abad:	c7 44 24 0c e5 ec 10 	movl   $0xf010ece5,0xc(%esp)
f010abb4:	f0 
f010abb5:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010abbc:	f0 
f010abbd:	c7 44 24 04 dd 02 00 	movl   $0x2dd,0x4(%esp)
f010abc4:	00 
f010abc5:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010abcc:	e8 8f e4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010abd1:	89 1c 24             	mov    %ebx,(%esp)
f010abd4:	e8 0a f6 ff ff       	call   f010a1e3 <_Z9page_freeP4Page>
f010abd9:	89 3c 24             	mov    %edi,(%esp)
f010abdc:	e8 02 f6 ff ff       	call   f010a1e3 <_Z9page_freeP4Page>
f010abe1:	89 34 24             	mov    %esi,(%esp)
f010abe4:	e8 fa f5 ff ff       	call   f010a1e3 <_Z9page_freeP4Page>
f010abe9:	e8 bb f6 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010abee:	89 c3                	mov    %eax,%ebx
f010abf0:	e8 b4 f6 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010abf5:	89 c7                	mov    %eax,%edi
f010abf7:	e8 ad f6 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010abfc:	89 c6                	mov    %eax,%esi
f010abfe:	85 db                	test   %ebx,%ebx
f010ac00:	75 24                	jne    f010ac26 <_Z8mem_initv+0x3d1>
f010ac02:	c7 44 24 0c 8d ec 10 	movl   $0xf010ec8d,0xc(%esp)
f010ac09:	f0 
f010ac0a:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ac11:	f0 
f010ac12:	c7 44 24 04 e9 02 00 	movl   $0x2e9,0x4(%esp)
f010ac19:	00 
f010ac1a:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010ac21:	e8 3a e4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ac26:	85 ff                	test   %edi,%edi
f010ac28:	74 04                	je     f010ac2e <_Z8mem_initv+0x3d9>
f010ac2a:	39 fb                	cmp    %edi,%ebx
f010ac2c:	75 24                	jne    f010ac52 <_Z8mem_initv+0x3fd>
f010ac2e:	c7 44 24 0c 7f ec 10 	movl   $0xf010ec7f,0xc(%esp)
f010ac35:	f0 
f010ac36:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ac3d:	f0 
f010ac3e:	c7 44 24 04 ea 02 00 	movl   $0x2ea,0x4(%esp)
f010ac45:	00 
f010ac46:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010ac4d:	e8 0e e4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ac52:	85 c0                	test   %eax,%eax
f010ac54:	74 0c                	je     f010ac62 <_Z8mem_initv+0x40d>
f010ac56:	39 c7                	cmp    %eax,%edi
f010ac58:	74 08                	je     f010ac62 <_Z8mem_initv+0x40d>
f010ac5a:	39 c3                	cmp    %eax,%ebx
f010ac5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010ac60:	75 24                	jne    f010ac86 <_Z8mem_initv+0x431>
f010ac62:	c7 44 24 0c 98 e8 10 	movl   $0xf010e898,0xc(%esp)
f010ac69:	f0 
f010ac6a:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ac71:	f0 
f010ac72:	c7 44 24 04 eb 02 00 	movl   $0x2eb,0x4(%esp)
f010ac79:	00 
f010ac7a:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010ac81:	e8 da e3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ac86:	e8 1e f6 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010ac8b:	85 c0                	test   %eax,%eax
f010ac8d:	74 24                	je     f010acb3 <_Z8mem_initv+0x45e>
f010ac8f:	c7 44 24 0c e5 ec 10 	movl   $0xf010ece5,0xc(%esp)
f010ac96:	f0 
f010ac97:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ac9e:	f0 
f010ac9f:	c7 44 24 04 ed 02 00 	movl   $0x2ed,0x4(%esp)
f010aca6:	00 
f010aca7:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010acae:	e8 ad e3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010acb3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
f010acb6:	89 15 74 40 19 f0    	mov    %edx,0xf0194074
f010acbc:	89 1c 24             	mov    %ebx,(%esp)
f010acbf:	e8 1f f5 ff ff       	call   f010a1e3 <_Z9page_freeP4Page>
f010acc4:	89 3c 24             	mov    %edi,(%esp)
f010acc7:	e8 17 f5 ff ff       	call   f010a1e3 <_Z9page_freeP4Page>
f010accc:	89 34 24             	mov    %esi,(%esp)
f010accf:	e8 0f f5 ff ff       	call   f010a1e3 <_Z9page_freeP4Page>
f010acd4:	c7 04 24 b8 e8 10 f0 	movl   $0xf010e8b8,(%esp)
f010acdb:	e8 af 18 00 00       	call   f010c58f <_Z7cprintfPKcz>
f010ace0:	e8 c4 f5 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010ace5:	66 83 40 04 01       	addw   $0x1,0x4(%eax)
f010acea:	8b 15 28 40 19 f0    	mov    0xf0194028,%edx
f010acf0:	39 d0                	cmp    %edx,%eax
f010acf2:	72 0d                	jb     f010ad01 <_Z8mem_initv+0x4ac>
f010acf4:	8b 0d 20 40 19 f0    	mov    0xf0194020,%ecx
f010acfa:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010acfd:	39 c8                	cmp    %ecx,%eax
f010acff:	72 24                	jb     f010ad25 <_Z8mem_initv+0x4d0>
f010ad01:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010ad08:	f0 
f010ad09:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ad10:	f0 
f010ad11:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010ad18:	00 
f010ad19:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010ad20:	e8 3b e3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ad25:	29 d0                	sub    %edx,%eax
f010ad27:	c1 f8 03             	sar    $0x3,%eax
f010ad2a:	c1 e0 0c             	shl    $0xc,%eax
f010ad2d:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010ad32:	a3 24 40 19 f0       	mov    %eax,0xf0194024
f010ad37:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010ad3e:	00 
f010ad3f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010ad46:	00 
f010ad47:	89 04 24             	mov    %eax,(%esp)
f010ad4a:	e8 1f 2c 00 00       	call   f010d96e <memset>
f010ad4f:	e8 55 f5 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010ad54:	89 c3                	mov    %eax,%ebx
f010ad56:	e8 4e f5 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010ad5b:	89 c7                	mov    %eax,%edi
f010ad5d:	e8 47 f5 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010ad62:	89 c6                	mov    %eax,%esi
f010ad64:	85 db                	test   %ebx,%ebx
f010ad66:	75 24                	jne    f010ad8c <_Z8mem_initv+0x537>
f010ad68:	c7 44 24 0c 8d ec 10 	movl   $0xf010ec8d,0xc(%esp)
f010ad6f:	f0 
f010ad70:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ad77:	f0 
f010ad78:	c7 44 24 04 47 03 00 	movl   $0x347,0x4(%esp)
f010ad7f:	00 
f010ad80:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010ad87:	e8 d4 e2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ad8c:	85 ff                	test   %edi,%edi
f010ad8e:	74 04                	je     f010ad94 <_Z8mem_initv+0x53f>
f010ad90:	39 fb                	cmp    %edi,%ebx
f010ad92:	75 24                	jne    f010adb8 <_Z8mem_initv+0x563>
f010ad94:	c7 44 24 0c 7f ec 10 	movl   $0xf010ec7f,0xc(%esp)
f010ad9b:	f0 
f010ad9c:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ada3:	f0 
f010ada4:	c7 44 24 04 48 03 00 	movl   $0x348,0x4(%esp)
f010adab:	00 
f010adac:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010adb3:	e8 a8 e2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010adb8:	85 c0                	test   %eax,%eax
f010adba:	74 08                	je     f010adc4 <_Z8mem_initv+0x56f>
f010adbc:	39 c7                	cmp    %eax,%edi
f010adbe:	74 04                	je     f010adc4 <_Z8mem_initv+0x56f>
f010adc0:	39 c3                	cmp    %eax,%ebx
f010adc2:	75 24                	jne    f010ade8 <_Z8mem_initv+0x593>
f010adc4:	c7 44 24 0c 98 e8 10 	movl   $0xf010e898,0xc(%esp)
f010adcb:	f0 
f010adcc:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010add3:	f0 
f010add4:	c7 44 24 04 49 03 00 	movl   $0x349,0x4(%esp)
f010addb:	00 
f010addc:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010ade3:	e8 78 e2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ade8:	8b 0d 74 40 19 f0    	mov    0xf0194074,%ecx
f010adee:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
f010adf1:	c7 05 74 40 19 f0 00 	movl   $0x0,0xf0194074
f010adf8:	00 00 00 
f010adfb:	e8 a9 f4 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010ae00:	85 c0                	test   %eax,%eax
f010ae02:	74 24                	je     f010ae28 <_Z8mem_initv+0x5d3>
f010ae04:	c7 44 24 0c e5 ec 10 	movl   $0xf010ece5,0xc(%esp)
f010ae0b:	f0 
f010ae0c:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ae13:	f0 
f010ae14:	c7 44 24 04 51 03 00 	movl   $0x351,0x4(%esp)
f010ae1b:	00 
f010ae1c:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010ae23:	e8 38 e2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ae28:	8d 45 e4             	lea    -0x1c(%ebp),%eax
f010ae2b:	89 44 24 08          	mov    %eax,0x8(%esp)
f010ae2f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010ae36:	00 
f010ae37:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010ae3c:	89 04 24             	mov    %eax,(%esp)
f010ae3f:	e8 6f f7 ff ff       	call   f010a5b3 <_Z11page_lookupPjjPS_>
f010ae44:	85 c0                	test   %eax,%eax
f010ae46:	74 24                	je     f010ae6c <_Z8mem_initv+0x617>
f010ae48:	c7 44 24 0c d8 e8 10 	movl   $0xf010e8d8,0xc(%esp)
f010ae4f:	f0 
f010ae50:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ae57:	f0 
f010ae58:	c7 44 24 04 54 03 00 	movl   $0x354,0x4(%esp)
f010ae5f:	00 
f010ae60:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010ae67:	e8 f4 e1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ae6c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010ae73:	00 
f010ae74:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010ae7b:	00 
f010ae7c:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010ae80:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010ae85:	89 04 24             	mov    %eax,(%esp)
f010ae88:	e8 ab f8 ff ff       	call   f010a738 <_Z11page_insertPjP4Pageji>
f010ae8d:	85 c0                	test   %eax,%eax
f010ae8f:	78 24                	js     f010aeb5 <_Z8mem_initv+0x660>
f010ae91:	c7 44 24 0c 04 e9 10 	movl   $0xf010e904,0xc(%esp)
f010ae98:	f0 
f010ae99:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010aea0:	f0 
f010aea1:	c7 44 24 04 57 03 00 	movl   $0x357,0x4(%esp)
f010aea8:	00 
f010aea9:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010aeb0:	e8 ab e1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aeb5:	89 1c 24             	mov    %ebx,(%esp)
f010aeb8:	e8 26 f3 ff ff       	call   f010a1e3 <_Z9page_freeP4Page>
f010aebd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010aec4:	00 
f010aec5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010aecc:	00 
f010aecd:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010aed1:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010aed6:	89 04 24             	mov    %eax,(%esp)
f010aed9:	e8 5a f8 ff ff       	call   f010a738 <_Z11page_insertPjP4Pageji>
f010aede:	85 c0                	test   %eax,%eax
f010aee0:	74 24                	je     f010af06 <_Z8mem_initv+0x6b1>
f010aee2:	c7 44 24 0c 2c e9 10 	movl   $0xf010e92c,0xc(%esp)
f010aee9:	f0 
f010aeea:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010aef1:	f0 
f010aef2:	c7 44 24 04 5b 03 00 	movl   $0x35b,0x4(%esp)
f010aef9:	00 
f010aefa:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010af01:	e8 5a e1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010af06:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010af0b:	8b 10                	mov    (%eax),%edx
f010af0d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
f010af10:	8b 0d 28 40 19 f0    	mov    0xf0194028,%ecx
f010af16:	89 4d cc             	mov    %ecx,-0x34(%ebp)
f010af19:	39 cb                	cmp    %ecx,%ebx
f010af1b:	72 10                	jb     f010af2d <_Z8mem_initv+0x6d8>
f010af1d:	8b 0d 20 40 19 f0    	mov    0xf0194020,%ecx
f010af23:	8b 55 cc             	mov    -0x34(%ebp),%edx
f010af26:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010af29:	39 cb                	cmp    %ecx,%ebx
f010af2b:	72 24                	jb     f010af51 <_Z8mem_initv+0x6fc>
f010af2d:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010af34:	f0 
f010af35:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010af3c:	f0 
f010af3d:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010af44:	00 
f010af45:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010af4c:	e8 0f e1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010af51:	89 5d d0             	mov    %ebx,-0x30(%ebp)
f010af54:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f010af57:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
f010af5d:	89 da                	mov    %ebx,%edx
f010af5f:	2b 55 cc             	sub    -0x34(%ebp),%edx
f010af62:	89 55 d4             	mov    %edx,-0x2c(%ebp)
f010af65:	c1 fa 03             	sar    $0x3,%edx
f010af68:	c1 e2 0c             	shl    $0xc,%edx
f010af6b:	39 d1                	cmp    %edx,%ecx
f010af6d:	74 24                	je     f010af93 <_Z8mem_initv+0x73e>
f010af6f:	c7 44 24 0c 54 e9 10 	movl   $0xf010e954,0xc(%esp)
f010af76:	f0 
f010af77:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010af7e:	f0 
f010af7f:	c7 44 24 04 5c 03 00 	movl   $0x35c,0x4(%esp)
f010af86:	00 
f010af87:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010af8e:	e8 cd e0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010af93:	ba 00 00 00 00       	mov    $0x0,%edx
f010af98:	e8 ab ed ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f010af9d:	8b 15 28 40 19 f0    	mov    0xf0194028,%edx
f010afa3:	39 d7                	cmp    %edx,%edi
f010afa5:	72 0d                	jb     f010afb4 <_Z8mem_initv+0x75f>
f010afa7:	8b 0d 20 40 19 f0    	mov    0xf0194020,%ecx
f010afad:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010afb0:	39 cf                	cmp    %ecx,%edi
f010afb2:	72 24                	jb     f010afd8 <_Z8mem_initv+0x783>
f010afb4:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010afbb:	f0 
f010afbc:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010afc3:	f0 
f010afc4:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010afcb:	00 
f010afcc:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010afd3:	e8 88 e0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010afd8:	89 7d d4             	mov    %edi,-0x2c(%ebp)
f010afdb:	89 f9                	mov    %edi,%ecx
f010afdd:	29 d1                	sub    %edx,%ecx
f010afdf:	89 ca                	mov    %ecx,%edx
f010afe1:	c1 fa 03             	sar    $0x3,%edx
f010afe4:	c1 e2 0c             	shl    $0xc,%edx
f010afe7:	39 d0                	cmp    %edx,%eax
f010afe9:	74 24                	je     f010b00f <_Z8mem_initv+0x7ba>
f010afeb:	c7 44 24 0c 80 e9 10 	movl   $0xf010e980,0xc(%esp)
f010aff2:	f0 
f010aff3:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010affa:	f0 
f010affb:	c7 44 24 04 5d 03 00 	movl   $0x35d,0x4(%esp)
f010b002:	00 
f010b003:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b00a:	e8 51 e0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b00f:	66 83 7f 04 01       	cmpw   $0x1,0x4(%edi)
f010b014:	74 24                	je     f010b03a <_Z8mem_initv+0x7e5>
f010b016:	c7 44 24 0c f0 ec 10 	movl   $0xf010ecf0,0xc(%esp)
f010b01d:	f0 
f010b01e:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b025:	f0 
f010b026:	c7 44 24 04 5e 03 00 	movl   $0x35e,0x4(%esp)
f010b02d:	00 
f010b02e:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b035:	e8 26 e0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b03a:	66 83 7b 04 01       	cmpw   $0x1,0x4(%ebx)
f010b03f:	74 24                	je     f010b065 <_Z8mem_initv+0x810>
f010b041:	c7 44 24 0c 01 ed 10 	movl   $0xf010ed01,0xc(%esp)
f010b048:	f0 
f010b049:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b050:	f0 
f010b051:	c7 44 24 04 5f 03 00 	movl   $0x35f,0x4(%esp)
f010b058:	00 
f010b059:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b060:	e8 fb df ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b065:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010b06c:	00 
f010b06d:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010b074:	00 
f010b075:	89 74 24 04          	mov    %esi,0x4(%esp)
f010b079:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b07e:	89 04 24             	mov    %eax,(%esp)
f010b081:	e8 b2 f6 ff ff       	call   f010a738 <_Z11page_insertPjP4Pageji>
f010b086:	85 c0                	test   %eax,%eax
f010b088:	74 24                	je     f010b0ae <_Z8mem_initv+0x859>
f010b08a:	c7 44 24 0c b0 e9 10 	movl   $0xf010e9b0,0xc(%esp)
f010b091:	f0 
f010b092:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b099:	f0 
f010b09a:	c7 44 24 04 63 03 00 	movl   $0x363,0x4(%esp)
f010b0a1:	00 
f010b0a2:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b0a9:	e8 b2 df ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b0ae:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b0b3:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b0b8:	e8 8b ec ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f010b0bd:	8b 15 28 40 19 f0    	mov    0xf0194028,%edx
f010b0c3:	39 d6                	cmp    %edx,%esi
f010b0c5:	72 0d                	jb     f010b0d4 <_Z8mem_initv+0x87f>
f010b0c7:	8b 0d 20 40 19 f0    	mov    0xf0194020,%ecx
f010b0cd:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010b0d0:	39 ce                	cmp    %ecx,%esi
f010b0d2:	72 24                	jb     f010b0f8 <_Z8mem_initv+0x8a3>
f010b0d4:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010b0db:	f0 
f010b0dc:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b0e3:	f0 
f010b0e4:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b0eb:	00 
f010b0ec:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010b0f3:	e8 68 df ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b0f8:	89 75 cc             	mov    %esi,-0x34(%ebp)
f010b0fb:	89 f1                	mov    %esi,%ecx
f010b0fd:	29 d1                	sub    %edx,%ecx
f010b0ff:	89 ca                	mov    %ecx,%edx
f010b101:	c1 fa 03             	sar    $0x3,%edx
f010b104:	c1 e2 0c             	shl    $0xc,%edx
f010b107:	39 d0                	cmp    %edx,%eax
f010b109:	74 24                	je     f010b12f <_Z8mem_initv+0x8da>
f010b10b:	c7 44 24 0c e0 e9 10 	movl   $0xf010e9e0,0xc(%esp)
f010b112:	f0 
f010b113:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b11a:	f0 
f010b11b:	c7 44 24 04 64 03 00 	movl   $0x364,0x4(%esp)
f010b122:	00 
f010b123:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b12a:	e8 31 df ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b12f:	66 83 7e 04 01       	cmpw   $0x1,0x4(%esi)
f010b134:	74 24                	je     f010b15a <_Z8mem_initv+0x905>
f010b136:	c7 44 24 0c 12 ed 10 	movl   $0xf010ed12,0xc(%esp)
f010b13d:	f0 
f010b13e:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b145:	f0 
f010b146:	c7 44 24 04 65 03 00 	movl   $0x365,0x4(%esp)
f010b14d:	00 
f010b14e:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b155:	e8 06 df ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b15a:	e8 4a f1 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010b15f:	85 c0                	test   %eax,%eax
f010b161:	74 24                	je     f010b187 <_Z8mem_initv+0x932>
f010b163:	c7 44 24 0c e5 ec 10 	movl   $0xf010ece5,0xc(%esp)
f010b16a:	f0 
f010b16b:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b172:	f0 
f010b173:	c7 44 24 04 69 03 00 	movl   $0x369,0x4(%esp)
f010b17a:	00 
f010b17b:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b182:	e8 d9 de ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b187:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010b18e:	00 
f010b18f:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010b196:	00 
f010b197:	89 74 24 04          	mov    %esi,0x4(%esp)
f010b19b:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b1a0:	89 04 24             	mov    %eax,(%esp)
f010b1a3:	e8 90 f5 ff ff       	call   f010a738 <_Z11page_insertPjP4Pageji>
f010b1a8:	85 c0                	test   %eax,%eax
f010b1aa:	74 24                	je     f010b1d0 <_Z8mem_initv+0x97b>
f010b1ac:	c7 44 24 0c b0 e9 10 	movl   $0xf010e9b0,0xc(%esp)
f010b1b3:	f0 
f010b1b4:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b1bb:	f0 
f010b1bc:	c7 44 24 04 6c 03 00 	movl   $0x36c,0x4(%esp)
f010b1c3:	00 
f010b1c4:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b1cb:	e8 90 de ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b1d0:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b1d5:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b1da:	e8 69 eb ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f010b1df:	8b 15 28 40 19 f0    	mov    0xf0194028,%edx
f010b1e5:	39 d6                	cmp    %edx,%esi
f010b1e7:	72 0d                	jb     f010b1f6 <_Z8mem_initv+0x9a1>
f010b1e9:	8b 0d 20 40 19 f0    	mov    0xf0194020,%ecx
f010b1ef:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010b1f2:	39 ce                	cmp    %ecx,%esi
f010b1f4:	72 24                	jb     f010b21a <_Z8mem_initv+0x9c5>
f010b1f6:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010b1fd:	f0 
f010b1fe:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b205:	f0 
f010b206:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b20d:	00 
f010b20e:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010b215:	e8 46 de ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b21a:	8b 4d cc             	mov    -0x34(%ebp),%ecx
f010b21d:	29 d1                	sub    %edx,%ecx
f010b21f:	89 ca                	mov    %ecx,%edx
f010b221:	c1 fa 03             	sar    $0x3,%edx
f010b224:	c1 e2 0c             	shl    $0xc,%edx
f010b227:	39 d0                	cmp    %edx,%eax
f010b229:	74 24                	je     f010b24f <_Z8mem_initv+0x9fa>
f010b22b:	c7 44 24 0c e0 e9 10 	movl   $0xf010e9e0,0xc(%esp)
f010b232:	f0 
f010b233:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b23a:	f0 
f010b23b:	c7 44 24 04 6d 03 00 	movl   $0x36d,0x4(%esp)
f010b242:	00 
f010b243:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b24a:	e8 11 de ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b24f:	66 83 7e 04 01       	cmpw   $0x1,0x4(%esi)
f010b254:	74 24                	je     f010b27a <_Z8mem_initv+0xa25>
f010b256:	c7 44 24 0c 12 ed 10 	movl   $0xf010ed12,0xc(%esp)
f010b25d:	f0 
f010b25e:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b265:	f0 
f010b266:	c7 44 24 04 6e 03 00 	movl   $0x36e,0x4(%esp)
f010b26d:	00 
f010b26e:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b275:	e8 e6 dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b27a:	e8 2a f0 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010b27f:	85 c0                	test   %eax,%eax
f010b281:	74 24                	je     f010b2a7 <_Z8mem_initv+0xa52>
f010b283:	c7 44 24 0c e5 ec 10 	movl   $0xf010ece5,0xc(%esp)
f010b28a:	f0 
f010b28b:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b292:	f0 
f010b293:	c7 44 24 04 73 03 00 	movl   $0x373,0x4(%esp)
f010b29a:	00 
f010b29b:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b2a2:	e8 b9 dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b2a7:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b2ac:	8b 00                	mov    (%eax),%eax
f010b2ae:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f010b2b3:	89 c2                	mov    %eax,%edx
f010b2b5:	c1 ea 0c             	shr    $0xc,%edx
f010b2b8:	3b 15 20 40 19 f0    	cmp    0xf0194020,%edx
f010b2be:	72 20                	jb     f010b2e0 <_Z8mem_initv+0xa8b>
f010b2c0:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010b2c4:	c7 44 24 08 f8 e6 10 	movl   $0xf010e6f8,0x8(%esp)
f010b2cb:	f0 
f010b2cc:	c7 44 24 04 76 03 00 	movl   $0x376,0x4(%esp)
f010b2d3:	00 
f010b2d4:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b2db:	e8 80 dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b2e0:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010b2e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010b2e8:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010b2ef:	00 
f010b2f0:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010b2f7:	00 
f010b2f8:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b2fd:	89 04 24             	mov    %eax,(%esp)
f010b300:	e8 2d f0 ff ff       	call   f010a332 <_Z10pgdir_walkPjji>
f010b305:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010b308:	83 c2 04             	add    $0x4,%edx
f010b30b:	39 d0                	cmp    %edx,%eax
f010b30d:	74 24                	je     f010b333 <_Z8mem_initv+0xade>
f010b30f:	c7 44 24 0c 14 ea 10 	movl   $0xf010ea14,0xc(%esp)
f010b316:	f0 
f010b317:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b31e:	f0 
f010b31f:	c7 44 24 04 77 03 00 	movl   $0x377,0x4(%esp)
f010b326:	00 
f010b327:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b32e:	e8 2d dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b333:	c7 44 24 0c 04 00 00 	movl   $0x4,0xc(%esp)
f010b33a:	00 
f010b33b:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010b342:	00 
f010b343:	89 74 24 04          	mov    %esi,0x4(%esp)
f010b347:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b34c:	89 04 24             	mov    %eax,(%esp)
f010b34f:	e8 e4 f3 ff ff       	call   f010a738 <_Z11page_insertPjP4Pageji>
f010b354:	85 c0                	test   %eax,%eax
f010b356:	74 24                	je     f010b37c <_Z8mem_initv+0xb27>
f010b358:	c7 44 24 0c 4c ea 10 	movl   $0xf010ea4c,0xc(%esp)
f010b35f:	f0 
f010b360:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b367:	f0 
f010b368:	c7 44 24 04 7a 03 00 	movl   $0x37a,0x4(%esp)
f010b36f:	00 
f010b370:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b377:	e8 e4 dc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b37c:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b381:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b386:	e8 bd e9 ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f010b38b:	8b 15 28 40 19 f0    	mov    0xf0194028,%edx
f010b391:	39 d6                	cmp    %edx,%esi
f010b393:	72 0d                	jb     f010b3a2 <_Z8mem_initv+0xb4d>
f010b395:	8b 0d 20 40 19 f0    	mov    0xf0194020,%ecx
f010b39b:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010b39e:	39 ce                	cmp    %ecx,%esi
f010b3a0:	72 24                	jb     f010b3c6 <_Z8mem_initv+0xb71>
f010b3a2:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010b3a9:	f0 
f010b3aa:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b3b1:	f0 
f010b3b2:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b3b9:	00 
f010b3ba:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010b3c1:	e8 9a dc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b3c6:	8b 4d cc             	mov    -0x34(%ebp),%ecx
f010b3c9:	29 d1                	sub    %edx,%ecx
f010b3cb:	89 ca                	mov    %ecx,%edx
f010b3cd:	c1 fa 03             	sar    $0x3,%edx
f010b3d0:	c1 e2 0c             	shl    $0xc,%edx
f010b3d3:	39 d0                	cmp    %edx,%eax
f010b3d5:	74 24                	je     f010b3fb <_Z8mem_initv+0xba6>
f010b3d7:	c7 44 24 0c e0 e9 10 	movl   $0xf010e9e0,0xc(%esp)
f010b3de:	f0 
f010b3df:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b3e6:	f0 
f010b3e7:	c7 44 24 04 7b 03 00 	movl   $0x37b,0x4(%esp)
f010b3ee:	00 
f010b3ef:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b3f6:	e8 65 dc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b3fb:	66 83 7e 04 01       	cmpw   $0x1,0x4(%esi)
f010b400:	74 24                	je     f010b426 <_Z8mem_initv+0xbd1>
f010b402:	c7 44 24 0c 12 ed 10 	movl   $0xf010ed12,0xc(%esp)
f010b409:	f0 
f010b40a:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b411:	f0 
f010b412:	c7 44 24 04 7c 03 00 	movl   $0x37c,0x4(%esp)
f010b419:	00 
f010b41a:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b421:	e8 3a dc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b426:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010b42d:	00 
f010b42e:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010b435:	00 
f010b436:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b43b:	89 04 24             	mov    %eax,(%esp)
f010b43e:	e8 ef ee ff ff       	call   f010a332 <_Z10pgdir_walkPjji>
f010b443:	f6 00 04             	testb  $0x4,(%eax)
f010b446:	75 24                	jne    f010b46c <_Z8mem_initv+0xc17>
f010b448:	c7 44 24 0c 80 ea 10 	movl   $0xf010ea80,0xc(%esp)
f010b44f:	f0 
f010b450:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b457:	f0 
f010b458:	c7 44 24 04 7d 03 00 	movl   $0x37d,0x4(%esp)
f010b45f:	00 
f010b460:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b467:	e8 f4 db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b46c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010b473:	00 
f010b474:	c7 44 24 08 00 00 40 	movl   $0x400000,0x8(%esp)
f010b47b:	00 
f010b47c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010b480:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b485:	89 04 24             	mov    %eax,(%esp)
f010b488:	e8 ab f2 ff ff       	call   f010a738 <_Z11page_insertPjP4Pageji>
f010b48d:	85 c0                	test   %eax,%eax
f010b48f:	78 24                	js     f010b4b5 <_Z8mem_initv+0xc60>
f010b491:	c7 44 24 0c ac ea 10 	movl   $0xf010eaac,0xc(%esp)
f010b498:	f0 
f010b499:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b4a0:	f0 
f010b4a1:	c7 44 24 04 81 03 00 	movl   $0x381,0x4(%esp)
f010b4a8:	00 
f010b4a9:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b4b0:	e8 ab db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b4b5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010b4bc:	00 
f010b4bd:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010b4c4:	00 
f010b4c5:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010b4c9:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b4ce:	89 04 24             	mov    %eax,(%esp)
f010b4d1:	e8 62 f2 ff ff       	call   f010a738 <_Z11page_insertPjP4Pageji>
f010b4d6:	85 c0                	test   %eax,%eax
f010b4d8:	74 24                	je     f010b4fe <_Z8mem_initv+0xca9>
f010b4da:	c7 44 24 0c d8 ea 10 	movl   $0xf010ead8,0xc(%esp)
f010b4e1:	f0 
f010b4e2:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b4e9:	f0 
f010b4ea:	c7 44 24 04 84 03 00 	movl   $0x384,0x4(%esp)
f010b4f1:	00 
f010b4f2:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b4f9:	e8 62 db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b4fe:	ba 00 00 00 00       	mov    $0x0,%edx
f010b503:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b508:	e8 3b e8 ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f010b50d:	8b 15 28 40 19 f0    	mov    0xf0194028,%edx
f010b513:	39 d7                	cmp    %edx,%edi
f010b515:	72 0d                	jb     f010b524 <_Z8mem_initv+0xccf>
f010b517:	8b 0d 20 40 19 f0    	mov    0xf0194020,%ecx
f010b51d:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010b520:	39 cf                	cmp    %ecx,%edi
f010b522:	72 24                	jb     f010b548 <_Z8mem_initv+0xcf3>
f010b524:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010b52b:	f0 
f010b52c:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b533:	f0 
f010b534:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b53b:	00 
f010b53c:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010b543:	e8 18 db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b548:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f010b54b:	29 d1                	sub    %edx,%ecx
f010b54d:	89 ca                	mov    %ecx,%edx
f010b54f:	c1 fa 03             	sar    $0x3,%edx
f010b552:	c1 e2 0c             	shl    $0xc,%edx
f010b555:	39 d0                	cmp    %edx,%eax
f010b557:	74 24                	je     f010b57d <_Z8mem_initv+0xd28>
f010b559:	c7 44 24 0c 80 e9 10 	movl   $0xf010e980,0xc(%esp)
f010b560:	f0 
f010b561:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b568:	f0 
f010b569:	c7 44 24 04 87 03 00 	movl   $0x387,0x4(%esp)
f010b570:	00 
f010b571:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b578:	e8 e3 da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b57d:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b582:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b587:	e8 bc e7 ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f010b58c:	8b 15 28 40 19 f0    	mov    0xf0194028,%edx
f010b592:	39 d7                	cmp    %edx,%edi
f010b594:	72 0d                	jb     f010b5a3 <_Z8mem_initv+0xd4e>
f010b596:	8b 0d 20 40 19 f0    	mov    0xf0194020,%ecx
f010b59c:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010b59f:	39 cf                	cmp    %ecx,%edi
f010b5a1:	72 24                	jb     f010b5c7 <_Z8mem_initv+0xd72>
f010b5a3:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010b5aa:	f0 
f010b5ab:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b5b2:	f0 
f010b5b3:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b5ba:	00 
f010b5bb:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010b5c2:	e8 99 da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b5c7:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f010b5ca:	29 d1                	sub    %edx,%ecx
f010b5cc:	89 ca                	mov    %ecx,%edx
f010b5ce:	c1 fa 03             	sar    $0x3,%edx
f010b5d1:	c1 e2 0c             	shl    $0xc,%edx
f010b5d4:	39 d0                	cmp    %edx,%eax
f010b5d6:	74 24                	je     f010b5fc <_Z8mem_initv+0xda7>
f010b5d8:	c7 44 24 0c 08 eb 10 	movl   $0xf010eb08,0xc(%esp)
f010b5df:	f0 
f010b5e0:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b5e7:	f0 
f010b5e8:	c7 44 24 04 88 03 00 	movl   $0x388,0x4(%esp)
f010b5ef:	00 
f010b5f0:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b5f7:	e8 64 da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b5fc:	66 83 7f 04 02       	cmpw   $0x2,0x4(%edi)
f010b601:	74 24                	je     f010b627 <_Z8mem_initv+0xdd2>
f010b603:	c7 44 24 0c 23 ed 10 	movl   $0xf010ed23,0xc(%esp)
f010b60a:	f0 
f010b60b:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b612:	f0 
f010b613:	c7 44 24 04 8a 03 00 	movl   $0x38a,0x4(%esp)
f010b61a:	00 
f010b61b:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b622:	e8 39 da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b627:	66 83 7e 04 00       	cmpw   $0x0,0x4(%esi)
f010b62c:	74 24                	je     f010b652 <_Z8mem_initv+0xdfd>
f010b62e:	c7 44 24 0c 34 ed 10 	movl   $0xf010ed34,0xc(%esp)
f010b635:	f0 
f010b636:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b63d:	f0 
f010b63e:	c7 44 24 04 8b 03 00 	movl   $0x38b,0x4(%esp)
f010b645:	00 
f010b646:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b64d:	e8 0e da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b652:	e8 52 ec ff ff       	call   f010a2a9 <_Z10page_allocv>
f010b657:	39 c6                	cmp    %eax,%esi
f010b659:	74 24                	je     f010b67f <_Z8mem_initv+0xe2a>
f010b65b:	c7 44 24 0c 45 ed 10 	movl   $0xf010ed45,0xc(%esp)
f010b662:	f0 
f010b663:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b66a:	f0 
f010b66b:	c7 44 24 04 8f 03 00 	movl   $0x38f,0x4(%esp)
f010b672:	00 
f010b673:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b67a:	e8 e1 d9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b67f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010b686:	00 
f010b687:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b68c:	89 04 24             	mov    %eax,(%esp)
f010b68f:	e8 6c ef ff ff       	call   f010a600 <_Z11page_removePjj>
f010b694:	ba 00 00 00 00       	mov    $0x0,%edx
f010b699:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b69e:	e8 a5 e6 ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f010b6a3:	83 f8 ff             	cmp    $0xffffffff,%eax
f010b6a6:	74 24                	je     f010b6cc <_Z8mem_initv+0xe77>
f010b6a8:	c7 44 24 0c 3c eb 10 	movl   $0xf010eb3c,0xc(%esp)
f010b6af:	f0 
f010b6b0:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b6b7:	f0 
f010b6b8:	c7 44 24 04 93 03 00 	movl   $0x393,0x4(%esp)
f010b6bf:	00 
f010b6c0:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b6c7:	e8 94 d9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b6cc:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b6d1:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b6d6:	e8 6d e6 ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f010b6db:	8b 15 28 40 19 f0    	mov    0xf0194028,%edx
f010b6e1:	39 d7                	cmp    %edx,%edi
f010b6e3:	72 0d                	jb     f010b6f2 <_Z8mem_initv+0xe9d>
f010b6e5:	8b 0d 20 40 19 f0    	mov    0xf0194020,%ecx
f010b6eb:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010b6ee:	39 cf                	cmp    %ecx,%edi
f010b6f0:	72 24                	jb     f010b716 <_Z8mem_initv+0xec1>
f010b6f2:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010b6f9:	f0 
f010b6fa:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b701:	f0 
f010b702:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b709:	00 
f010b70a:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010b711:	e8 4a d9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b716:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f010b719:	29 d1                	sub    %edx,%ecx
f010b71b:	89 ca                	mov    %ecx,%edx
f010b71d:	c1 fa 03             	sar    $0x3,%edx
f010b720:	c1 e2 0c             	shl    $0xc,%edx
f010b723:	39 d0                	cmp    %edx,%eax
f010b725:	74 24                	je     f010b74b <_Z8mem_initv+0xef6>
f010b727:	c7 44 24 0c 08 eb 10 	movl   $0xf010eb08,0xc(%esp)
f010b72e:	f0 
f010b72f:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b736:	f0 
f010b737:	c7 44 24 04 94 03 00 	movl   $0x394,0x4(%esp)
f010b73e:	00 
f010b73f:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b746:	e8 15 d9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b74b:	66 83 7f 04 01       	cmpw   $0x1,0x4(%edi)
f010b750:	74 24                	je     f010b776 <_Z8mem_initv+0xf21>
f010b752:	c7 44 24 0c f0 ec 10 	movl   $0xf010ecf0,0xc(%esp)
f010b759:	f0 
f010b75a:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b761:	f0 
f010b762:	c7 44 24 04 95 03 00 	movl   $0x395,0x4(%esp)
f010b769:	00 
f010b76a:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b771:	e8 ea d8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b776:	66 83 7e 04 00       	cmpw   $0x0,0x4(%esi)
f010b77b:	74 24                	je     f010b7a1 <_Z8mem_initv+0xf4c>
f010b77d:	c7 44 24 0c 34 ed 10 	movl   $0xf010ed34,0xc(%esp)
f010b784:	f0 
f010b785:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b78c:	f0 
f010b78d:	c7 44 24 04 96 03 00 	movl   $0x396,0x4(%esp)
f010b794:	00 
f010b795:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b79c:	e8 bf d8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b7a1:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010b7a8:	00 
f010b7a9:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b7ae:	89 04 24             	mov    %eax,(%esp)
f010b7b1:	e8 4a ee ff ff       	call   f010a600 <_Z11page_removePjj>
f010b7b6:	ba 00 00 00 00       	mov    $0x0,%edx
f010b7bb:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b7c0:	e8 83 e5 ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f010b7c5:	83 f8 ff             	cmp    $0xffffffff,%eax
f010b7c8:	74 24                	je     f010b7ee <_Z8mem_initv+0xf99>
f010b7ca:	c7 44 24 0c 3c eb 10 	movl   $0xf010eb3c,0xc(%esp)
f010b7d1:	f0 
f010b7d2:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b7d9:	f0 
f010b7da:	c7 44 24 04 9a 03 00 	movl   $0x39a,0x4(%esp)
f010b7e1:	00 
f010b7e2:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b7e9:	e8 72 d8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b7ee:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b7f3:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b7f8:	e8 4b e5 ff ff       	call   f0109d48 <_ZL11check_va2paPjj>
f010b7fd:	83 f8 ff             	cmp    $0xffffffff,%eax
f010b800:	74 24                	je     f010b826 <_Z8mem_initv+0xfd1>
f010b802:	c7 44 24 0c 60 eb 10 	movl   $0xf010eb60,0xc(%esp)
f010b809:	f0 
f010b80a:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b811:	f0 
f010b812:	c7 44 24 04 9b 03 00 	movl   $0x39b,0x4(%esp)
f010b819:	00 
f010b81a:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b821:	e8 3a d8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b826:	66 83 7f 04 00       	cmpw   $0x0,0x4(%edi)
f010b82b:	74 24                	je     f010b851 <_Z8mem_initv+0xffc>
f010b82d:	c7 44 24 0c 4f ed 10 	movl   $0xf010ed4f,0xc(%esp)
f010b834:	f0 
f010b835:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b83c:	f0 
f010b83d:	c7 44 24 04 9c 03 00 	movl   $0x39c,0x4(%esp)
f010b844:	00 
f010b845:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b84c:	e8 0f d8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b851:	66 83 7e 04 00       	cmpw   $0x0,0x4(%esi)
f010b856:	74 24                	je     f010b87c <_Z8mem_initv+0x1027>
f010b858:	c7 44 24 0c 34 ed 10 	movl   $0xf010ed34,0xc(%esp)
f010b85f:	f0 
f010b860:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b867:	f0 
f010b868:	c7 44 24 04 9d 03 00 	movl   $0x39d,0x4(%esp)
f010b86f:	00 
f010b870:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b877:	e8 e4 d7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b87c:	e8 28 ea ff ff       	call   f010a2a9 <_Z10page_allocv>
f010b881:	39 c7                	cmp    %eax,%edi
f010b883:	74 24                	je     f010b8a9 <_Z8mem_initv+0x1054>
f010b885:	c7 44 24 0c 60 ed 10 	movl   $0xf010ed60,0xc(%esp)
f010b88c:	f0 
f010b88d:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b894:	f0 
f010b895:	c7 44 24 04 a1 03 00 	movl   $0x3a1,0x4(%esp)
f010b89c:	00 
f010b89d:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b8a4:	e8 b7 d7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b8a9:	e8 fb e9 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010b8ae:	85 c0                	test   %eax,%eax
f010b8b0:	74 24                	je     f010b8d6 <_Z8mem_initv+0x1081>
f010b8b2:	c7 44 24 0c e5 ec 10 	movl   $0xf010ece5,0xc(%esp)
f010b8b9:	f0 
f010b8ba:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b8c1:	f0 
f010b8c2:	c7 44 24 04 a5 03 00 	movl   $0x3a5,0x4(%esp)
f010b8c9:	00 
f010b8ca:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b8d1:	e8 8a d7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b8d6:	8b 15 24 40 19 f0    	mov    0xf0194024,%edx
f010b8dc:	8b 02                	mov    (%edx),%eax
f010b8de:	89 45 d4             	mov    %eax,-0x2c(%ebp)
f010b8e1:	8b 0d 28 40 19 f0    	mov    0xf0194028,%ecx
f010b8e7:	89 4d cc             	mov    %ecx,-0x34(%ebp)
f010b8ea:	39 cb                	cmp    %ecx,%ebx
f010b8ec:	72 10                	jb     f010b8fe <_Z8mem_initv+0x10a9>
f010b8ee:	8b 0d 20 40 19 f0    	mov    0xf0194020,%ecx
f010b8f4:	8b 45 cc             	mov    -0x34(%ebp),%eax
f010b8f7:	8d 0c c8             	lea    (%eax,%ecx,8),%ecx
f010b8fa:	39 cb                	cmp    %ecx,%ebx
f010b8fc:	72 24                	jb     f010b922 <_Z8mem_initv+0x10cd>
f010b8fe:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010b905:	f0 
f010b906:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b90d:	f0 
f010b90e:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b915:	00 
f010b916:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010b91d:	e8 3e d7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b922:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f010b925:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
f010b92b:	8b 45 d0             	mov    -0x30(%ebp),%eax
f010b92e:	2b 45 cc             	sub    -0x34(%ebp),%eax
f010b931:	89 45 d4             	mov    %eax,-0x2c(%ebp)
f010b934:	c1 f8 03             	sar    $0x3,%eax
f010b937:	c1 e0 0c             	shl    $0xc,%eax
f010b93a:	39 c1                	cmp    %eax,%ecx
f010b93c:	74 24                	je     f010b962 <_Z8mem_initv+0x110d>
f010b93e:	c7 44 24 0c 54 e9 10 	movl   $0xf010e954,0xc(%esp)
f010b945:	f0 
f010b946:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b94d:	f0 
f010b94e:	c7 44 24 04 b2 03 00 	movl   $0x3b2,0x4(%esp)
f010b955:	00 
f010b956:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b95d:	e8 fe d6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b962:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
f010b968:	66 83 7b 04 01       	cmpw   $0x1,0x4(%ebx)
f010b96d:	74 24                	je     f010b993 <_Z8mem_initv+0x113e>
f010b96f:	c7 44 24 0c 01 ed 10 	movl   $0xf010ed01,0xc(%esp)
f010b976:	f0 
f010b977:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010b97e:	f0 
f010b97f:	c7 44 24 04 b4 03 00 	movl   $0x3b4,0x4(%esp)
f010b986:	00 
f010b987:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b98e:	e8 cd d6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b993:	66 c7 43 04 00 00    	movw   $0x0,0x4(%ebx)
f010b999:	89 1c 24             	mov    %ebx,(%esp)
f010b99c:	e8 42 e8 ff ff       	call   f010a1e3 <_Z9page_freeP4Page>
f010b9a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
f010b9a8:	00 
f010b9a9:	c7 44 24 04 00 10 40 	movl   $0x401000,0x4(%esp)
f010b9b0:	00 
f010b9b1:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010b9b6:	89 04 24             	mov    %eax,(%esp)
f010b9b9:	e8 74 e9 ff ff       	call   f010a332 <_Z10pgdir_walkPjji>
f010b9be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010b9c1:	8b 0d 24 40 19 f0    	mov    0xf0194024,%ecx
f010b9c7:	83 c1 04             	add    $0x4,%ecx
f010b9ca:	8b 11                	mov    (%ecx),%edx
f010b9cc:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
f010b9d2:	89 55 cc             	mov    %edx,-0x34(%ebp)
f010b9d5:	c1 ea 0c             	shr    $0xc,%edx
f010b9d8:	3b 15 20 40 19 f0    	cmp    0xf0194020,%edx
f010b9de:	72 23                	jb     f010ba03 <_Z8mem_initv+0x11ae>
f010b9e0:	8b 55 cc             	mov    -0x34(%ebp),%edx
f010b9e3:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010b9e7:	c7 44 24 08 f8 e6 10 	movl   $0xf010e6f8,0x8(%esp)
f010b9ee:	f0 
f010b9ef:	c7 44 24 04 bb 03 00 	movl   $0x3bb,0x4(%esp)
f010b9f6:	00 
f010b9f7:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010b9fe:	e8 5d d6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ba03:	8b 55 cc             	mov    -0x34(%ebp),%edx
f010ba06:	81 ea fc ff ff 0f    	sub    $0xffffffc,%edx
f010ba0c:	39 d0                	cmp    %edx,%eax
f010ba0e:	74 24                	je     f010ba34 <_Z8mem_initv+0x11df>
f010ba10:	c7 44 24 0c 6a ed 10 	movl   $0xf010ed6a,0xc(%esp)
f010ba17:	f0 
f010ba18:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ba1f:	f0 
f010ba20:	c7 44 24 04 bc 03 00 	movl   $0x3bc,0x4(%esp)
f010ba27:	00 
f010ba28:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010ba2f:	e8 2c d6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ba34:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
f010ba3a:	66 c7 43 04 00 00    	movw   $0x0,0x4(%ebx)
f010ba40:	a1 28 40 19 f0       	mov    0xf0194028,%eax
f010ba45:	39 c3                	cmp    %eax,%ebx
f010ba47:	72 0d                	jb     f010ba56 <_Z8mem_initv+0x1201>
f010ba49:	8b 15 20 40 19 f0    	mov    0xf0194020,%edx
f010ba4f:	8d 14 d0             	lea    (%eax,%edx,8),%edx
f010ba52:	39 d3                	cmp    %edx,%ebx
f010ba54:	72 24                	jb     f010ba7a <_Z8mem_initv+0x1225>
f010ba56:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010ba5d:	f0 
f010ba5e:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010ba65:	f0 
f010ba66:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010ba6d:	00 
f010ba6e:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010ba75:	e8 e6 d5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ba7a:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010ba81:	00 
f010ba82:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
f010ba89:	00 
f010ba8a:	8b 4d d0             	mov    -0x30(%ebp),%ecx
f010ba8d:	29 c1                	sub    %eax,%ecx
f010ba8f:	89 c8                	mov    %ecx,%eax
f010ba91:	c1 f8 03             	sar    $0x3,%eax
f010ba94:	c1 e0 0c             	shl    $0xc,%eax
f010ba97:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010ba9c:	89 04 24             	mov    %eax,(%esp)
f010ba9f:	e8 ca 1e 00 00       	call   f010d96e <memset>
f010baa4:	89 1c 24             	mov    %ebx,(%esp)
f010baa7:	e8 37 e7 ff ff       	call   f010a1e3 <_Z9page_freeP4Page>
f010baac:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
f010bab3:	00 
f010bab4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010babb:	00 
f010babc:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010bac1:	89 04 24             	mov    %eax,(%esp)
f010bac4:	e8 69 e8 ff ff       	call   f010a332 <_Z10pgdir_walkPjji>
f010bac9:	a1 28 40 19 f0       	mov    0xf0194028,%eax
f010bace:	39 c3                	cmp    %eax,%ebx
f010bad0:	72 0d                	jb     f010badf <_Z8mem_initv+0x128a>
f010bad2:	8b 15 20 40 19 f0    	mov    0xf0194020,%edx
f010bad8:	8d 14 d0             	lea    (%eax,%edx,8),%edx
f010badb:	39 d3                	cmp    %edx,%ebx
f010badd:	72 24                	jb     f010bb03 <_Z8mem_initv+0x12ae>
f010badf:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010bae6:	f0 
f010bae7:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010baee:	f0 
f010baef:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010baf6:	00 
f010baf7:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010bafe:	e8 5d d5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010bb03:	8b 55 d0             	mov    -0x30(%ebp),%edx
f010bb06:	29 c2                	sub    %eax,%edx
f010bb08:	89 d0                	mov    %edx,%eax
f010bb0a:	c1 f8 03             	sar    $0x3,%eax
f010bb0d:	89 c2                	mov    %eax,%edx
f010bb0f:	c1 e2 0c             	shl    $0xc,%edx
f010bb12:	8d 82 00 00 00 f0    	lea    -0x10000000(%edx),%eax
f010bb18:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010bb1b:	f6 00 01             	testb  $0x1,(%eax)
f010bb1e:	75 11                	jne    f010bb31 <_Z8mem_initv+0x12dc>
f010bb20:	8d 82 04 00 00 f0    	lea    -0xffffffc(%edx),%eax
f010bb26:	81 ea 00 f0 ff 0f    	sub    $0xffff000,%edx
f010bb2c:	f6 00 01             	testb  $0x1,(%eax)
f010bb2f:	74 24                	je     f010bb55 <_Z8mem_initv+0x1300>
f010bb31:	c7 44 24 0c 82 ed 10 	movl   $0xf010ed82,0xc(%esp)
f010bb38:	f0 
f010bb39:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010bb40:	f0 
f010bb41:	c7 44 24 04 c6 03 00 	movl   $0x3c6,0x4(%esp)
f010bb48:	00 
f010bb49:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010bb50:	e8 0b d5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010bb55:	83 c0 04             	add    $0x4,%eax
f010bb58:	39 d0                	cmp    %edx,%eax
f010bb5a:	75 d0                	jne    f010bb2c <_Z8mem_initv+0x12d7>
f010bb5c:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010bb61:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
f010bb67:	66 c7 43 04 00 00    	movw   $0x0,0x4(%ebx)
f010bb6d:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
f010bb70:	89 0d 74 40 19 f0    	mov    %ecx,0xf0194074
f010bb76:	89 1c 24             	mov    %ebx,(%esp)
f010bb79:	e8 65 e6 ff ff       	call   f010a1e3 <_Z9page_freeP4Page>
f010bb7e:	89 3c 24             	mov    %edi,(%esp)
f010bb81:	e8 5d e6 ff ff       	call   f010a1e3 <_Z9page_freeP4Page>
f010bb86:	89 34 24             	mov    %esi,(%esp)
f010bb89:	e8 55 e6 ff ff       	call   f010a1e3 <_Z9page_freeP4Page>
f010bb8e:	c7 04 24 99 ed 10 f0 	movl   $0xf010ed99,(%esp)
f010bb95:	e8 f5 09 00 00       	call   f010c58f <_Z7cprintfPKcz>
f010bb9a:	b8 00 10 10 f0       	mov    $0xf0101000,%eax
f010bb9f:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010bba4:	77 20                	ja     f010bbc6 <_Z8mem_initv+0x1371>
f010bba6:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010bbaa:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f010bbb1:	f0 
f010bbb2:	c7 44 24 04 a5 00 00 	movl   $0xa5,0x4(%esp)
f010bbb9:	00 
f010bbba:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010bbc1:	e8 9a d4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010bbc6:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
f010bbcd:	00 
f010bbce:	05 00 00 00 10       	add    $0x10000000,%eax
f010bbd3:	89 04 24             	mov    %eax,(%esp)
f010bbd6:	b9 00 80 00 00       	mov    $0x8000,%ecx
f010bbdb:	ba 00 80 ff ef       	mov    $0xefff8000,%edx
f010bbe0:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010bbe5:	e8 66 ea ff ff       	call   f010a650 <_ZL16page_map_segmentPjjjji>
f010bbea:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
f010bbf1:	00 
f010bbf2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f010bbf9:	b9 00 00 00 10       	mov    $0x10000000,%ecx
f010bbfe:	ba 00 00 00 f0       	mov    $0xf0000000,%edx
f010bc03:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010bc08:	e8 43 ea ff ff       	call   f010a650 <_ZL16page_map_segmentPjjjji>
f010bc0d:	a1 28 40 19 f0       	mov    0xf0194028,%eax
f010bc12:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010bc17:	77 20                	ja     f010bc39 <_Z8mem_initv+0x13e4>
f010bc19:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010bc1d:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f010bc24:	f0 
f010bc25:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010bc2c:	00 
f010bc2d:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010bc34:	e8 27 d4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010bc39:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
f010bc40:	00 
f010bc41:	05 00 00 00 10       	add    $0x10000000,%eax
f010bc46:	89 04 24             	mov    %eax,(%esp)
f010bc49:	8b 4d c8             	mov    -0x38(%ebp),%ecx
f010bc4c:	ba 00 00 40 ef       	mov    $0xef400000,%edx
f010bc51:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010bc56:	e8 f5 e9 ff ff       	call   f010a650 <_ZL16page_map_segmentPjjjji>
f010bc5b:	a1 80 40 19 f0       	mov    0xf0194080,%eax
f010bc60:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010bc65:	77 20                	ja     f010bc87 <_Z8mem_initv+0x1432>
f010bc67:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010bc6b:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f010bc72:	f0 
f010bc73:	c7 44 24 04 bb 00 00 	movl   $0xbb,0x4(%esp)
f010bc7a:	00 
f010bc7b:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010bc82:	e8 d9 d3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010bc87:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
f010bc8e:	00 
f010bc8f:	05 00 00 00 10       	add    $0x10000000,%eax
f010bc94:	89 04 24             	mov    %eax,(%esp)
f010bc97:	b9 00 70 01 00       	mov    $0x17000,%ecx
f010bc9c:	ba 00 00 00 ef       	mov    $0xef000000,%edx
f010bca1:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010bca6:	e8 a5 e9 ff ff       	call   f010a650 <_ZL16page_map_segmentPjjjji>
f010bcab:	e8 d2 e1 ff ff       	call   f0109e82 <_ZL14boot_mem_checkv>
f010bcb0:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010bcb5:	8b 90 00 0f 00 00    	mov    0xf00(%eax),%edx
f010bcbb:	89 10                	mov    %edx,(%eax)
f010bcbd:	8b 15 24 40 19 f0    	mov    0xf0194024,%edx
f010bcc3:	89 d0                	mov    %edx,%eax
f010bcc5:	81 fa ff ff ff ef    	cmp    $0xefffffff,%edx
f010bccb:	77 20                	ja     f010bced <_Z8mem_initv+0x1498>
f010bccd:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010bcd1:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f010bcd8:	f0 
f010bcd9:	c7 44 24 04 d1 00 00 	movl   $0xd1,0x4(%esp)
f010bce0:	00 
f010bce1:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010bce8:	e8 73 d3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010bced:	05 00 00 00 10       	add    $0x10000000,%eax
f010bcf2:	0f 22 d8             	mov    %eax,%cr3
f010bcf5:	0f 20 c0             	mov    %cr0,%eax
f010bcf8:	0d 2f 00 05 80       	or     $0x8005002f,%eax
f010bcfd:	83 e0 f3             	and    $0xfffffff3,%eax
f010bd00:	0f 22 c0             	mov    %eax,%cr0
f010bd03:	0f 01 15 04 e0 11 f0 	lgdtl  0xf011e004
f010bd0a:	b8 23 00 00 00       	mov    $0x23,%eax
f010bd0f:	8e e8                	mov    %eax,%gs
f010bd11:	8e e0                	mov    %eax,%fs
f010bd13:	b0 10                	mov    $0x10,%al
f010bd15:	8e c0                	mov    %eax,%es
f010bd17:	8e d8                	mov    %eax,%ds
f010bd19:	8e d0                	mov    %eax,%ss
f010bd1b:	ea 22 bd 10 f0 08 00 	ljmp   $0x8,$0xf010bd22
f010bd22:	b0 00                	mov    $0x0,%al
f010bd24:	0f 00 d0             	lldt   %ax
f010bd27:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
f010bd2d:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010bd32:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010bd37:	77 20                	ja     f010bd59 <_Z8mem_initv+0x1504>
f010bd39:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010bd3d:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f010bd44:	f0 
f010bd45:	c7 44 24 04 ed 00 00 	movl   $0xed,0x4(%esp)
f010bd4c:	00 
f010bd4d:	c7 04 24 ca eb 10 f0 	movl   $0xf010ebca,(%esp)
f010bd54:	e8 07 d3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010bd59:	05 00 00 00 10       	add    $0x10000000,%eax
f010bd5e:	0f 22 d8             	mov    %eax,%cr3
f010bd61:	83 c4 4c             	add    $0x4c,%esp
f010bd64:	5b                   	pop    %ebx
f010bd65:	5e                   	pop    %esi
f010bd66:	5f                   	pop    %edi
f010bd67:	5d                   	pop    %ebp
f010bd68:	c3                   	ret    

f010bd69 <_Z8round_upIjET_S0_j>:
f010bd69:	55                   	push   %ebp
f010bd6a:	89 e5                	mov    %esp,%ebp
f010bd6c:	53                   	push   %ebx
f010bd6d:	8b 55 0c             	mov    0xc(%ebp),%edx
f010bd70:	8b 45 08             	mov    0x8(%ebp),%eax
f010bd73:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
f010bd77:	89 c8                	mov    %ecx,%eax
f010bd79:	89 d3                	mov    %edx,%ebx
f010bd7b:	ba 00 00 00 00       	mov    $0x0,%edx
f010bd80:	f7 f3                	div    %ebx
f010bd82:	89 c8                	mov    %ecx,%eax
f010bd84:	29 d0                	sub    %edx,%eax
f010bd86:	5b                   	pop    %ebx
f010bd87:	5d                   	pop    %ebp
f010bd88:	c3                   	ret    

f010bd89 <_Z10round_downIcEPT_S1_j>:
inline uint32_t round_down(uint32_t a, uint32_t n) {
	return a - a % n;
}

template <typename T>
T *round_down(T *a, uint32_t n) {
f010bd89:	55                   	push   %ebp
f010bd8a:	89 e5                	mov    %esp,%ebp
f010bd8c:	8b 4d 08             	mov    0x8(%ebp),%ecx
	return (T *) round_down((uintptr_t) a, n);
f010bd8f:	89 c8                	mov    %ecx,%eax
f010bd91:	ba 00 00 00 00       	mov    $0x0,%edx
f010bd96:	f7 75 0c             	divl   0xc(%ebp)
f010bd99:	89 c8                	mov    %ecx,%eax
f010bd9b:	29 d0                	sub    %edx,%eax
}
f010bd9d:	5d                   	pop    %ebp
f010bd9e:	c3                   	ret    

f010bd9f <_Z8round_upIPcET_S1_j>:

template <typename T>
T round_up(T a, uint32_t n) {
f010bd9f:	55                   	push   %ebp
f010bda0:	89 e5                	mov    %esp,%ebp
f010bda2:	83 ec 18             	sub    $0x18,%esp
f010bda5:	8b 45 0c             	mov    0xc(%ebp),%eax
	return round_down(a + n - 1, n);
f010bda8:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bdac:	8b 55 08             	mov    0x8(%ebp),%edx
f010bdaf:	8d 44 02 ff          	lea    -0x1(%edx,%eax,1),%eax
f010bdb3:	89 04 24             	mov    %eax,(%esp)
f010bdb6:	e8 ce ff ff ff       	call   f010bd89 <_Z10round_downIcEPT_S1_j>
}
f010bdbb:	c9                   	leave  
f010bdbc:	c3                   	ret    
	...

f010bdbe <_ZNK4Page11page_numberEv>:
	// to this page.  Reserved pages may not have valid reference counts.
	uint16_t pp_ref;

#if JOS_KERNEL
	// Returns the physical page number for this page.
	size_t page_number() const {
f010bdbe:	55                   	push   %ebp
f010bdbf:	89 e5                	mov    %esp,%ebp
f010bdc1:	83 ec 18             	sub    $0x18,%esp
f010bdc4:	8b 55 08             	mov    0x8(%ebp),%edx
		assert(this >= pages && this < pages + npages);
f010bdc7:	a1 28 40 19 f0       	mov    0xf0194028,%eax
f010bdcc:	39 d0                	cmp    %edx,%eax
f010bdce:	77 0d                	ja     f010bddd <_ZNK4Page11page_numberEv+0x1f>
f010bdd0:	8b 0d 20 40 19 f0    	mov    0xf0194020,%ecx
f010bdd6:	8d 0c c8             	lea    (%eax,%ecx,8),%ecx
f010bdd9:	39 ca                	cmp    %ecx,%edx
f010bddb:	72 24                	jb     f010be01 <_ZNK4Page11page_numberEv+0x43>
f010bddd:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010bde4:	f0 
f010bde5:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010bdec:	f0 
f010bded:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010bdf4:	00 
f010bdf5:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010bdfc:	e8 5f d2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010be01:	29 c2                	sub    %eax,%edx
f010be03:	89 d0                	mov    %edx,%eax
f010be05:	c1 f8 03             	sar    $0x3,%eax
		return this - pages;
	}
f010be08:	c9                   	leave  
f010be09:	c3                   	ret    
f010be0a:	00 00                	add    %al,(%eax)
f010be0c:	00 00                	add    %al,(%eax)
	...

f010be10 <_Z9envid2enviPP3Envb>:
//   0 on success, -E_BAD_ENV on error.
//   On success, sets *penv to the environment.
//   On error, sets *penv to NULL.
int
envid2env(envid_t envid, Env **env_store, bool checkperm)
{
f010be10:	55                   	push   %ebp
f010be11:	89 e5                	mov    %esp,%ebp
f010be13:	53                   	push   %ebx
f010be14:	8b 45 08             	mov    0x8(%ebp),%eax
f010be17:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f010be1a:	0f b6 5d 10          	movzbl 0x10(%ebp),%ebx
	Env *e;

	// If envid is zero, return the current environment.
	if (envid == 0) {
f010be1e:	85 c0                	test   %eax,%eax
f010be20:	75 0e                	jne    f010be30 <_Z9envid2enviPP3Envb+0x20>
		*env_store = curenv;
f010be22:	a1 84 40 19 f0       	mov    0xf0194084,%eax
f010be27:	89 01                	mov    %eax,(%ecx)
f010be29:	b8 00 00 00 00       	mov    $0x0,%eax
		return 0;
f010be2e:	eb 52                	jmp    f010be82 <_Z9envid2enviPP3Envb+0x72>

	// Look up the Env structure via the index part of the envid,
	// then check that structure's env_id field to ensure that the envid
	// is current (i.e., it refers to the _current_ environment in this
	// envs[] slot).
	e = &envs[ENVX(envid)];
f010be30:	89 c2                	mov    %eax,%edx
f010be32:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
f010be38:	6b d2 5c             	imul   $0x5c,%edx,%edx
f010be3b:	03 15 80 40 19 f0    	add    0xf0194080,%edx
	if (e->env_status == ENV_FREE || e->env_id != envid) {
f010be41:	83 7a 0c 00          	cmpl   $0x0,0xc(%edx)
f010be45:	74 05                	je     f010be4c <_Z9envid2enviPP3Envb+0x3c>
f010be47:	39 42 04             	cmp    %eax,0x4(%edx)
f010be4a:	74 0d                	je     f010be59 <_Z9envid2enviPP3Envb+0x49>
		*env_store = 0;
f010be4c:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
f010be52:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
		return -E_BAD_ENV;
f010be57:	eb 29                	jmp    f010be82 <_Z9envid2enviPP3Envb+0x72>
	// Check that the calling environment has legitimate permission
	// to manipulate the specified environment.
	// If checkperm is set, the specified environment must be either the
	// current environment or an immediate child of the current
	// environment.
	if (checkperm && e != curenv && e->env_parent_id != curenv->env_id) {
f010be59:	84 db                	test   %bl,%bl
f010be5b:	74 1e                	je     f010be7b <_Z9envid2enviPP3Envb+0x6b>
f010be5d:	a1 84 40 19 f0       	mov    0xf0194084,%eax
f010be62:	39 c2                	cmp    %eax,%edx
f010be64:	74 15                	je     f010be7b <_Z9envid2enviPP3Envb+0x6b>
f010be66:	8b 5a 08             	mov    0x8(%edx),%ebx
f010be69:	3b 58 04             	cmp    0x4(%eax),%ebx
f010be6c:	74 0d                	je     f010be7b <_Z9envid2enviPP3Envb+0x6b>
		*env_store = 0;
f010be6e:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
f010be74:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
		return -E_BAD_ENV;
f010be79:	eb 07                	jmp    f010be82 <_Z9envid2enviPP3Envb+0x72>
	}

	*env_store = e;
f010be7b:	89 11                	mov    %edx,(%ecx)
f010be7d:	b8 00 00 00 00       	mov    $0x0,%eax
	return 0;
}
f010be82:	5b                   	pop    %ebx
f010be83:	5d                   	pop    %ebp
f010be84:	c3                   	ret    

f010be85 <_Z8env_iretP9Trapframe>:
// This exits the kernel and starts executing some environment's code.
// This function does not return.
void env_iret(struct Trapframe *tf) __attribute__((noreturn));
void
env_iret(struct Trapframe *tf)
{
f010be85:	55                   	push   %ebp
f010be86:	89 e5                	mov    %esp,%ebp
f010be88:	83 ec 18             	sub    $0x18,%esp
                "\tpopal\n"
		"\tpopl %%es\n"
		"\tpopl %%ds\n"
		"\taddl $0x8,%%esp\n" /* skip tf_trapno and tf_errcode */
		"\tiret"
		: : "g" (tf) : "memory");
f010be8b:	8b 65 08             	mov    0x8(%ebp),%esp
f010be8e:	61                   	popa   
f010be8f:	07                   	pop    %es
f010be90:	1f                   	pop    %ds
f010be91:	83 c4 08             	add    $0x8,%esp
f010be94:	cf                   	iret   
	panic("iret failed");  /* mostly to placate the compiler */
f010be95:	c7 44 24 08 3e e4 10 	movl   $0xf010e43e,0x8(%esp)
f010be9c:	f0 
f010be9d:	c7 44 24 04 9f 01 00 	movl   $0x19f,0x4(%esp)
f010bea4:	00 
f010bea5:	c7 04 24 e4 ed 10 f0 	movl   $0xf010ede4,(%esp)
f010beac:	e8 af d1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>

f010beb1 <_Z7env_runP3Env>:
// Context switch from curenv to env e.
// Note: if this is the first call to env_run, curenv is NULL.
// This function does not return.
void
env_run(Env *e)
{
f010beb1:	55                   	push   %ebp
f010beb2:	89 e5                	mov    %esp,%ebp
f010beb4:	83 ec 18             	sub    $0x18,%esp
f010beb7:	8b 45 08             	mov    0x8(%ebp),%eax
	//curenv = e;
	//curenv->env_runs++;
	//lcr3(PADDR(curenv->env_pgdir));
	//Step 2:
	//env_iret(&curenv->env_tf);
	if(curenv != e)
f010beba:	39 05 84 40 19 f0    	cmp    %eax,0xf0194084
f010bec0:	74 3d                	je     f010beff <_Z7env_runP3Env+0x4e>
	{
		curenv = e;
f010bec2:	a3 84 40 19 f0       	mov    %eax,0xf0194084
		e->env_runs++;
f010bec7:	83 40 58 01          	addl   $0x1,0x58(%eax)
		lcr3(PADDR(e->env_pgdir));
f010becb:	8b 50 10             	mov    0x10(%eax),%edx
f010bece:	81 fa ff ff ff ef    	cmp    $0xefffffff,%edx
f010bed4:	77 20                	ja     f010bef6 <_Z7env_runP3Env+0x45>
f010bed6:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010beda:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f010bee1:	f0 
f010bee2:	c7 44 24 04 c2 01 00 	movl   $0x1c2,0x4(%esp)
f010bee9:	00 
f010beea:	c7 04 24 e4 ed 10 f0 	movl   $0xf010ede4,(%esp)
f010bef1:	e8 6a d1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
f010bef6:	81 c2 00 00 00 10    	add    $0x10000000,%edx
f010befc:	0f 22 da             	mov    %edx,%cr3
	}
	env_iret(&e->env_tf);
f010beff:	83 c0 14             	add    $0x14,%eax
f010bf02:	89 04 24             	mov    %eax,(%esp)
f010bf05:	e8 7b ff ff ff       	call   f010be85 <_Z8env_iretP9Trapframe>

f010bf0a <_Z8env_freeP3Env>:


// Free env e and all memory it uses.
void
env_free(Env *e)
{
f010bf0a:	55                   	push   %ebp
f010bf0b:	89 e5                	mov    %esp,%ebp
f010bf0d:	57                   	push   %edi
f010bf0e:	56                   	push   %esi
f010bf0f:	53                   	push   %ebx
f010bf10:	83 ec 2c             	sub    $0x2c,%esp
f010bf13:	8b 7d 08             	mov    0x8(%ebp),%edi
	pte_t *pt;
	uint32_t pdeno, pteno;
	physaddr_t pa;

	// Note the environment's demise.
	cprintf("[%08x] free env %08x\n", curenv ? curenv->env_id : 0, e->env_id);
f010bf16:	8b 4f 04             	mov    0x4(%edi),%ecx
f010bf19:	8b 15 84 40 19 f0    	mov    0xf0194084,%edx
f010bf1f:	b8 00 00 00 00       	mov    $0x0,%eax
f010bf24:	85 d2                	test   %edx,%edx
f010bf26:	74 03                	je     f010bf2b <_Z8env_freeP3Env+0x21>
f010bf28:	8b 42 04             	mov    0x4(%edx),%eax
f010bf2b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
f010bf2f:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bf33:	c7 04 24 ef ed 10 f0 	movl   $0xf010edef,(%esp)
f010bf3a:	e8 50 06 00 00       	call   f010c58f <_Z7cprintfPKcz>
f010bf3f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
f010bf46:	8b 45 e0             	mov    -0x20(%ebp),%eax
f010bf49:	c1 e0 02             	shl    $0x2,%eax
f010bf4c:	89 45 dc             	mov    %eax,-0x24(%ebp)
	// Flush all mapped pages in the user portion of the address space
	static_assert(UTOP % PTSIZE == 0);
	for (pdeno = 0; pdeno < PDX(UTOP); pdeno++) {

		// only look at mapped page tables
		if (!(e->env_pgdir[pdeno] & PTE_P))
f010bf4f:	8b 47 10             	mov    0x10(%edi),%eax
f010bf52:	8b 55 dc             	mov    -0x24(%ebp),%edx
f010bf55:	8b 34 10             	mov    (%eax,%edx,1),%esi
f010bf58:	f7 c6 01 00 00 00    	test   $0x1,%esi
f010bf5e:	0f 84 91 00 00 00    	je     f010bff5 <_Z8env_freeP3Env+0xeb>
			continue;

		// find the pa and va of the page table
		pa = PTE_ADDR(e->env_pgdir[pdeno]);
f010bf64:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
		pt = (pte_t*) KADDR(pa);
f010bf6a:	89 f0                	mov    %esi,%eax
f010bf6c:	c1 e8 0c             	shr    $0xc,%eax
f010bf6f:	89 45 d8             	mov    %eax,-0x28(%ebp)
f010bf72:	3b 05 20 40 19 f0    	cmp    0xf0194020,%eax
f010bf78:	72 20                	jb     f010bf9a <_Z8env_freeP3Env+0x90>
f010bf7a:	89 74 24 0c          	mov    %esi,0xc(%esp)
f010bf7e:	c7 44 24 08 f8 e6 10 	movl   $0xf010e6f8,0x8(%esp)
f010bf85:	f0 
f010bf86:	c7 44 24 04 62 01 00 	movl   $0x162,0x4(%esp)
f010bf8d:	00 
f010bf8e:	c7 04 24 e4 ed 10 f0 	movl   $0xf010ede4,(%esp)
f010bf95:	e8 c6 d0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>

		// unmap all PTEs in this page table
		for (pteno = 0; pteno <= PTX(~0); pteno++) {
			if (pt[pteno] & PTE_P)
				page_remove(e->env_pgdir, PGADDR(pdeno, pteno, 0));
f010bf9a:	8b 55 e0             	mov    -0x20(%ebp),%edx
f010bf9d:	c1 e2 16             	shl    $0x16,%edx
f010bfa0:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f010bfa3:	bb 00 00 00 00       	mov    $0x0,%ebx
		pa = PTE_ADDR(e->env_pgdir[pdeno]);
		pt = (pte_t*) KADDR(pa);

		// unmap all PTEs in this page table
		for (pteno = 0; pteno <= PTX(~0); pteno++) {
			if (pt[pteno] & PTE_P)
f010bfa8:	f6 84 9e 00 00 00 f0 	testb  $0x1,-0x10000000(%esi,%ebx,4)
f010bfaf:	01 
f010bfb0:	74 17                	je     f010bfc9 <_Z8env_freeP3Env+0xbf>
				page_remove(e->env_pgdir, PGADDR(pdeno, pteno, 0));
f010bfb2:	89 d8                	mov    %ebx,%eax
f010bfb4:	c1 e0 0c             	shl    $0xc,%eax
f010bfb7:	0b 45 e4             	or     -0x1c(%ebp),%eax
f010bfba:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bfbe:	8b 47 10             	mov    0x10(%edi),%eax
f010bfc1:	89 04 24             	mov    %eax,(%esp)
f010bfc4:	e8 37 e6 ff ff       	call   f010a600 <_Z11page_removePjj>
		// find the pa and va of the page table
		pa = PTE_ADDR(e->env_pgdir[pdeno]);
		pt = (pte_t*) KADDR(pa);

		// unmap all PTEs in this page table
		for (pteno = 0; pteno <= PTX(~0); pteno++) {
f010bfc9:	83 c3 01             	add    $0x1,%ebx
f010bfcc:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
f010bfd2:	75 d4                	jne    f010bfa8 <_Z8env_freeP3Env+0x9e>
			if (pt[pteno] & PTE_P)
				page_remove(e->env_pgdir, PGADDR(pdeno, pteno, 0));
		}

		// free the page table itself
		e->env_pgdir[pdeno] = 0;
f010bfd4:	8b 47 10             	mov    0x10(%edi),%eax
f010bfd7:	8b 55 dc             	mov    -0x24(%ebp),%edx
f010bfda:	c7 04 10 00 00 00 00 	movl   $0x0,(%eax,%edx,1)
		page_decref(&pages[PGNUM(pa)]);
f010bfe1:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010bfe4:	c1 e0 03             	shl    $0x3,%eax
f010bfe7:	03 05 28 40 19 f0    	add    0xf0194028,%eax
f010bfed:	89 04 24             	mov    %eax,(%esp)
f010bff0:	e8 91 e2 ff ff       	call   f010a286 <_Z11page_decrefP4Page>
	// Note the environment's demise.
	cprintf("[%08x] free env %08x\n", curenv ? curenv->env_id : 0, e->env_id);

	// Flush all mapped pages in the user portion of the address space
	static_assert(UTOP % PTSIZE == 0);
	for (pdeno = 0; pdeno < PDX(UTOP); pdeno++) {
f010bff5:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
f010bff9:	81 7d e0 bc 03 00 00 	cmpl   $0x3bc,-0x20(%ebp)
f010c000:	0f 85 40 ff ff ff    	jne    f010bf46 <_Z8env_freeP3Env+0x3c>

	// Before freeing the page directory, we switch to kern_pgdir if 'e'
	// is the currently active environment -- just in case 'e->env_pgdir'
	// gets reused for some other purpose before we run another
	// environment.
	if (e == curenv)
f010c006:	3b 3d 84 40 19 f0    	cmp    0xf0194084,%edi
f010c00c:	75 34                	jne    f010c042 <_Z8env_freeP3Env+0x138>
		lcr3(PADDR(kern_pgdir));
f010c00e:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010c013:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010c018:	77 20                	ja     f010c03a <_Z8env_freeP3Env+0x130>
f010c01a:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c01e:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f010c025:	f0 
f010c026:	c7 44 24 04 74 01 00 	movl   $0x174,0x4(%esp)
f010c02d:	00 
f010c02e:	c7 04 24 e4 ed 10 f0 	movl   $0xf010ede4,(%esp)
f010c035:	e8 26 d0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010c03a:	05 00 00 00 10       	add    $0x10000000,%eax
f010c03f:	0f 22 d8             	mov    %eax,%cr3
	
	// free the page directory
	pa = PADDR(e->env_pgdir);
f010c042:	8b 47 10             	mov    0x10(%edi),%eax
f010c045:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010c04a:	77 20                	ja     f010c06c <_Z8env_freeP3Env+0x162>
f010c04c:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c050:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f010c057:	f0 
f010c058:	c7 44 24 04 77 01 00 	movl   $0x177,0x4(%esp)
f010c05f:	00 
f010c060:	c7 04 24 e4 ed 10 f0 	movl   $0xf010ede4,(%esp)
f010c067:	e8 f4 cf ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	e->env_pgdir = 0;
f010c06c:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
	page_decref(&pages[PGNUM(pa)]);
f010c073:	05 00 00 00 10       	add    $0x10000000,%eax
f010c078:	c1 e8 0c             	shr    $0xc,%eax
f010c07b:	c1 e0 03             	shl    $0x3,%eax
f010c07e:	03 05 28 40 19 f0    	add    0xf0194028,%eax
f010c084:	89 04 24             	mov    %eax,(%esp)
f010c087:	e8 fa e1 ff ff       	call   f010a286 <_Z11page_decrefP4Page>

	// return the environment to the free list
	e->env_status = ENV_FREE;
f010c08c:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
	e->env_next = free_envs;
f010c093:	a1 88 40 19 f0       	mov    0xf0194088,%eax
f010c098:	89 07                	mov    %eax,(%edi)
	free_envs = e;
f010c09a:	89 3d 88 40 19 f0    	mov    %edi,0xf0194088
}
f010c0a0:	83 c4 2c             	add    $0x2c,%esp
f010c0a3:	5b                   	pop    %ebx
f010c0a4:	5e                   	pop    %esi
f010c0a5:	5f                   	pop    %edi
f010c0a6:	5d                   	pop    %ebp
f010c0a7:	c3                   	ret    

f010c0a8 <_Z11env_destroyP3Env>:
// Free environment e.
// If e was the current env, then runs a new environment (and does not return
// to the caller).
void
env_destroy(Env *e) 
{
f010c0a8:	55                   	push   %ebp
f010c0a9:	89 e5                	mov    %esp,%ebp
f010c0ab:	53                   	push   %ebx
f010c0ac:	83 ec 14             	sub    $0x14,%esp
f010c0af:	8b 5d 08             	mov    0x8(%ebp),%ebx
	env_free(e);
f010c0b2:	89 1c 24             	mov    %ebx,(%esp)
f010c0b5:	e8 50 fe ff ff       	call   f010bf0a <_Z8env_freeP3Env>

	if (curenv == e) {
f010c0ba:	39 1d 84 40 19 f0    	cmp    %ebx,0xf0194084
f010c0c0:	75 0f                	jne    f010c0d1 <_Z11env_destroyP3Env+0x29>
		curenv = NULL;
f010c0c2:	c7 05 84 40 19 f0 00 	movl   $0x0,0xf0194084
f010c0c9:	00 00 00 
		sched_yield();
f010c0cc:	e8 ff 0b 00 00       	call   f010ccd0 <_Z11sched_yieldv>
	}
}
f010c0d1:	83 c4 14             	add    $0x14,%esp
f010c0d4:	5b                   	pop    %ebx
f010c0d5:	5d                   	pop    %ebp
f010c0d6:	c3                   	ret    

f010c0d7 <_Z8env_initv>:
// and insert them into the env_free_list.
// Insert in reverse order, so that the first call to env_alloc()
// returns envs[0].  (This is important for grading.)
void
env_init(void)
{
f010c0d7:	55                   	push   %ebp
f010c0d8:	89 e5                	mov    %esp,%ebp
f010c0da:	83 ec 18             	sub    $0x18,%esp
	// LAB 3: Your code here.
	memset(envs, 0, sizeof(struct Env) * NENV);
f010c0dd:	c7 44 24 08 00 70 01 	movl   $0x17000,0x8(%esp)
f010c0e4:	00 
f010c0e5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010c0ec:	00 
f010c0ed:	a1 80 40 19 f0       	mov    0xf0194080,%eax
f010c0f2:	89 04 24             	mov    %eax,(%esp)
f010c0f5:	e8 74 18 00 00       	call   f010d96e <memset>
f010c0fa:	8b 15 88 40 19 f0    	mov    0xf0194088,%edx
f010c100:	b8 a4 6f 01 00       	mov    $0x16fa4,%eax
	for(int i = NENV - 1; i >= 0; i--)
	{
		envs[i].env_status = ENV_FREE;	
f010c105:	8b 0d 80 40 19 f0    	mov    0xf0194080,%ecx
f010c10b:	c7 44 01 0c 00 00 00 	movl   $0x0,0xc(%ecx,%eax,1)
f010c112:	00 
		envs[i].env_id = 0;
f010c113:	8b 0d 80 40 19 f0    	mov    0xf0194080,%ecx
f010c119:	c7 44 01 04 00 00 00 	movl   $0x0,0x4(%ecx,%eax,1)
f010c120:	00 
		envs[i].env_next = free_envs;
f010c121:	8b 0d 80 40 19 f0    	mov    0xf0194080,%ecx
f010c127:	89 14 01             	mov    %edx,(%ecx,%eax,1)
		free_envs = &envs[i];	
f010c12a:	89 c2                	mov    %eax,%edx
f010c12c:	03 15 80 40 19 f0    	add    0xf0194080,%edx
f010c132:	83 e8 5c             	sub    $0x5c,%eax
void
env_init(void)
{
	// LAB 3: Your code here.
	memset(envs, 0, sizeof(struct Env) * NENV);
	for(int i = NENV - 1; i >= 0; i--)
f010c135:	83 f8 a4             	cmp    $0xffffffa4,%eax
f010c138:	75 cb                	jne    f010c105 <_Z8env_initv+0x2e>
f010c13a:	89 15 88 40 19 f0    	mov    %edx,0xf0194088
		envs[i].env_status = ENV_FREE;	
		envs[i].env_id = 0;
		envs[i].env_next = free_envs;
		free_envs = &envs[i];	
	}
}
f010c140:	c9                   	leave  
f010c141:	c3                   	ret    

f010c142 <_Z9env_allocPP3Envi>:
// Returns 0 on success, < 0 on failure.  Errors include:
//	-E_NO_FREE_ENV if all NENVS environments are allocated
//	-E_NO_MEM on memory exhaustion
int
env_alloc(Env **newenv_store, envid_t parent_id)
{
f010c142:	55                   	push   %ebp
f010c143:	89 e5                	mov    %esp,%ebp
f010c145:	53                   	push   %ebx
f010c146:	83 ec 14             	sub    $0x14,%esp
	int32_t generation;
	int r;
	Env *e;

	if (!(e = free_envs))
f010c149:	8b 1d 88 40 19 f0    	mov    0xf0194088,%ebx
f010c14f:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
f010c154:	85 db                	test   %ebx,%ebx
f010c156:	0f 84 a0 01 00 00    	je     f010c2fc <_Z9env_allocPP3Envi+0x1ba>
	unsigned i;
	int r;
	Page *p = NULL;

	// Allocate a page for the page directory
	if (!(p = page_alloc()))
f010c15c:	e8 48 e1 ff ff       	call   f010a2a9 <_Z10page_allocv>
f010c161:	85 c0                	test   %eax,%eax
f010c163:	75 1c                	jne    f010c181 <_Z9env_allocPP3Envi+0x3f>
		panic("env_mem_int: page_alloc failed");
f010c165:	c7 44 24 08 44 ee 10 	movl   $0xf010ee44,0x8(%esp)
f010c16c:	f0 
f010c16d:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
f010c174:	00 
f010c175:	c7 04 24 e4 ed 10 f0 	movl   $0xf010ede4,(%esp)
f010c17c:	e8 df ce ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	//    - Note: pp_ref is not maintained for most physical pages
	//	mapped above UTOP -- but you do need to increment
	//	env_pgdir's pp_ref!

	// LAB 3: Your code here.
	p->pp_ref++;
f010c181:	66 83 40 04 01       	addw   $0x1,0x4(%eax)
	uint16_t pp_ref;

#if JOS_KERNEL
	// Returns the physical page number for this page.
	size_t page_number() const {
		assert(this >= pages && this < pages + npages);
f010c186:	8b 15 28 40 19 f0    	mov    0xf0194028,%edx
f010c18c:	39 d0                	cmp    %edx,%eax
f010c18e:	72 0d                	jb     f010c19d <_Z9env_allocPP3Envi+0x5b>
f010c190:	8b 0d 20 40 19 f0    	mov    0xf0194020,%ecx
f010c196:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010c199:	39 c8                	cmp    %ecx,%eax
f010c19b:	72 24                	jb     f010c1c1 <_Z9env_allocPP3Envi+0x7f>
f010c19d:	c7 44 24 0c d0 e6 10 	movl   $0xf010e6d0,0xc(%esp)
f010c1a4:	f0 
f010c1a5:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010c1ac:	f0 
f010c1ad:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010c1b4:	00 
f010c1b5:	c7 04 24 9c eb 10 f0 	movl   $0xf010eb9c,(%esp)
f010c1bc:	e8 9f ce ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
 	e->env_pgdir = (pte_t *) p->data();
f010c1c1:	29 d0                	sub    %edx,%eax
f010c1c3:	c1 f8 03             	sar    $0x3,%eax
f010c1c6:	c1 e0 0c             	shl    $0xc,%eax
f010c1c9:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010c1ce:	89 43 10             	mov    %eax,0x10(%ebx)
	memset(e->env_pgdir, 0, PGSIZE);
f010c1d1:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010c1d8:	00 
f010c1d9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010c1e0:	00 
f010c1e1:	89 04 24             	mov    %eax,(%esp)
f010c1e4:	e8 85 17 00 00       	call   f010d96e <memset>
	size_t size = (NPDENTRIES - PDX(UTOP)) * sizeof(pde_t);
	memmove(&e->env_pgdir[PDX(UTOP)], &kern_pgdir[PDX(UTOP)], size);
f010c1e9:	c7 44 24 08 10 01 00 	movl   $0x110,0x8(%esp)
f010c1f0:	00 
f010c1f1:	a1 24 40 19 f0       	mov    0xf0194024,%eax
f010c1f6:	05 f0 0e 00 00       	add    $0xef0,%eax
f010c1fb:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c1ff:	8b 43 10             	mov    0x10(%ebx),%eax
f010c202:	05 f0 0e 00 00       	add    $0xef0,%eax
f010c207:	89 04 24             	mov    %eax,(%esp)
f010c20a:	e8 ad 17 00 00       	call   f010d9bc <memmove>
	// Recursively insert 'kern_pgdir' in itself as a page table, to form
	// a read-only virtual page table at virtual address UVPT.
	// (For now, you don't have understand the greater purpose of the
	// following two lines.)
	// UVPT permissions: kernel RO, user RO
	e->env_pgdir[PDX(UVPT)] = PADDR(e->env_pgdir) | PTE_P | PTE_U;
f010c20f:	8b 43 10             	mov    0x10(%ebx),%eax
f010c212:	89 c2                	mov    %eax,%edx
f010c214:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010c219:	77 20                	ja     f010c23b <_Z9env_allocPP3Envi+0xf9>
f010c21b:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c21f:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f010c226:	f0 
f010c227:	c7 44 24 04 80 00 00 	movl   $0x80,0x4(%esp)
f010c22e:	00 
f010c22f:	c7 04 24 e4 ed 10 f0 	movl   $0xf010ede4,(%esp)
f010c236:	e8 25 ce ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010c23b:	81 c2 00 00 00 10    	add    $0x10000000,%edx
f010c241:	83 ca 05             	or     $0x5,%edx
f010c244:	89 90 f8 0e 00 00    	mov    %edx,0xef8(%eax)
	// Allocate and set up the page directory for this environment.
	if ((r = env_mem_init(e)) < 0)
		return r;

	// Generate an env_id for this environment.
	generation = (e->env_id + (1 << ENVGENSHIFT)) & ~(NENV - 1);
f010c24a:	8b 43 04             	mov    0x4(%ebx),%eax
f010c24d:	05 00 10 00 00       	add    $0x1000,%eax
	if (generation <= 0)	// Don't create a negative env_id.
f010c252:	25 00 fc ff ff       	and    $0xfffffc00,%eax
f010c257:	7f 05                	jg     f010c25e <_Z9env_allocPP3Envi+0x11c>
f010c259:	b8 00 10 00 00       	mov    $0x1000,%eax
		generation = 1 << ENVGENSHIFT;
	e->env_id = generation | (e - envs);
f010c25e:	89 da                	mov    %ebx,%edx
f010c260:	2b 15 80 40 19 f0    	sub    0xf0194080,%edx
f010c266:	c1 fa 02             	sar    $0x2,%edx
f010c269:	69 d2 a7 37 bd e9    	imul   $0xe9bd37a7,%edx,%edx
f010c26f:	09 d0                	or     %edx,%eax
f010c271:	89 43 04             	mov    %eax,0x4(%ebx)
	
	// Set the basic status variables.
	e->env_parent_id = parent_id;
f010c274:	8b 45 0c             	mov    0xc(%ebp),%eax
f010c277:	89 43 08             	mov    %eax,0x8(%ebx)
	e->env_status = ENV_RUNNABLE;
f010c27a:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
	e->env_runs = 0;
f010c281:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)

	// 
	// to prevent the register values
	// of a prior environment inhabiting this Env structure
	// from "leaking" into our new environment.
	memset(&e->env_tf, 0, sizeof(e->env_tf));
f010c288:	c7 44 24 08 44 00 00 	movl   $0x44,0x8(%esp)
f010c28f:	00 
f010c290:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010c297:	00 
f010c298:	8d 43 14             	lea    0x14(%ebx),%eax
f010c29b:	89 04 24             	mov    %eax,(%esp)
f010c29e:	e8 cb 16 00 00       	call   f010d96e <memset>
	// Set up appropriate initial values for the segment registers.
	// GD_UD is the user data segment selector in the GDT, and 
	// GD_UT is the user text segment selector (see inc/memlayout.h).
	// The low 2 bits of each segment register contains the
	// Requestor Privilege Level (RPL); 3 means user mode.
	e->env_tf.tf_ds = GD_UD | 3;
f010c2a3:	66 c7 43 38 23 00    	movw   $0x23,0x38(%ebx)
	e->env_tf.tf_es = GD_UD | 3;
f010c2a9:	66 c7 43 34 23 00    	movw   $0x23,0x34(%ebx)
	e->env_tf.tf_ss = GD_UD | 3;
f010c2af:	66 c7 43 54 23 00    	movw   $0x23,0x54(%ebx)
	e->env_tf.tf_esp = USTACKTOP;
f010c2b5:	c7 43 50 00 e0 ff ee 	movl   $0xeeffe000,0x50(%ebx)
	e->env_tf.tf_cs = GD_UT | 3;
f010c2bc:	66 c7 43 48 1b 00    	movw   $0x1b,0x48(%ebx)
	// You will set e->env_tf.tf_eip later.

	// commit the allocation
	free_envs = e->env_next;
f010c2c2:	8b 03                	mov    (%ebx),%eax
f010c2c4:	a3 88 40 19 f0       	mov    %eax,0xf0194088
	*newenv_store = e;
f010c2c9:	8b 45 08             	mov    0x8(%ebp),%eax
f010c2cc:	89 18                	mov    %ebx,(%eax)

	cprintf("[%08x] new env %08x\n", curenv ? curenv->env_id : 0, e->env_id);
f010c2ce:	8b 4b 04             	mov    0x4(%ebx),%ecx
f010c2d1:	8b 15 84 40 19 f0    	mov    0xf0194084,%edx
f010c2d7:	b8 00 00 00 00       	mov    $0x0,%eax
f010c2dc:	85 d2                	test   %edx,%edx
f010c2de:	74 03                	je     f010c2e3 <_Z9env_allocPP3Envi+0x1a1>
f010c2e0:	8b 42 04             	mov    0x4(%edx),%eax
f010c2e3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
f010c2e7:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c2eb:	c7 04 24 05 ee 10 f0 	movl   $0xf010ee05,(%esp)
f010c2f2:	e8 98 02 00 00       	call   f010c58f <_Z7cprintfPKcz>
f010c2f7:	b8 00 00 00 00       	mov    $0x0,%eax
	return 0;
}
f010c2fc:	83 c4 14             	add    $0x14,%esp
f010c2ff:	5b                   	pop    %ebx
f010c300:	5d                   	pop    %ebp
f010c301:	c3                   	ret    

f010c302 <_Z10env_createPhj>:
// This function is ONLY called during kernel initialization,
// before running the first user-mode environment.
// The new env's parent ID is set to 0.
void
env_create(uint8_t *binary, size_t size)
{
f010c302:	55                   	push   %ebp
f010c303:	89 e5                	mov    %esp,%ebp
f010c305:	57                   	push   %edi
f010c306:	56                   	push   %esi
f010c307:	53                   	push   %ebx
f010c308:	83 ec 4c             	sub    $0x4c,%esp
	// LAB 3: Your code here.
	struct Env *env = NULL;
f010c30b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int r;
	r = env_alloc(&env, 0);
f010c312:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010c319:	00 
f010c31a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
f010c31d:	89 04 24             	mov    %eax,(%esp)
f010c320:	e8 1d fe ff ff       	call   f010c142 <_Z9env_allocPP3Envi>
	if(r < 0)
f010c325:	85 c0                	test   %eax,%eax
f010c327:	79 20                	jns    f010c349 <_Z10env_createPhj+0x47>
		panic("env_alloc: %e", r);
f010c329:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c32d:	c7 44 24 08 1a ee 10 	movl   $0xf010ee1a,0x8(%esp)
f010c334:	f0 
f010c335:	c7 44 24 04 48 01 00 	movl   $0x148,0x4(%esp)
f010c33c:	00 
f010c33d:	c7 04 24 e4 ed 10 f0 	movl   $0xf010ede4,(%esp)
f010c344:	e8 17 cd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	load_elf(env, binary, size);
f010c349:	8b 7d e4             	mov    -0x1c(%ebp),%edi

static __inline uint32_t
rcr3(void)
{
	uint32_t val;
	__asm __volatile("movl %%cr3,%0" : "=r" (val));
f010c34c:	0f 20 d8             	mov    %cr3,%eax
f010c34f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	// LAB 3: Your code here.
	struct Proghdr *ph, *eph;
	struct Elf *ELFHDR = (struct Elf *) binary;
	
	pde_t *cr3_bak = (pde_t *)rcr3();
	lcr3(PADDR(e->env_pgdir));
f010c352:	8b 47 10             	mov    0x10(%edi),%eax
f010c355:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010c35a:	77 20                	ja     f010c37c <_Z10env_createPhj+0x7a>
f010c35c:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c360:	c7 44 24 08 6c e7 10 	movl   $0xf010e76c,0x8(%esp)
f010c367:	f0 
f010c368:	c7 44 24 04 1a 01 00 	movl   $0x11a,0x4(%esp)
f010c36f:	00 
f010c370:	c7 04 24 e4 ed 10 f0 	movl   $0xf010ede4,(%esp)
f010c377:	e8 e4 cc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	//  to make sure that the environment starts executing there.
	//  What?  (See env_run() below.)

	// LAB 3: Your code here.
	struct Proghdr *ph, *eph;
	struct Elf *ELFHDR = (struct Elf *) binary;
f010c37c:	8b 55 08             	mov    0x8(%ebp),%edx
f010c37f:	89 55 c8             	mov    %edx,-0x38(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
f010c382:	05 00 00 00 10       	add    $0x10000000,%eax
f010c387:	0f 22 d8             	mov    %eax,%cr3
	
	pde_t *cr3_bak = (pde_t *)rcr3();
	lcr3(PADDR(e->env_pgdir));

	ph = (struct Proghdr *) (binary	+ ELFHDR->e_phoff);
f010c38a:	89 d1                	mov    %edx,%ecx
f010c38c:	03 4a 1c             	add    0x1c(%edx),%ecx
f010c38f:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
	eph = ph + ELFHDR->e_phnum;
f010c392:	0f b7 42 2c          	movzwl 0x2c(%edx),%eax
f010c396:	c1 e0 05             	shl    $0x5,%eax
f010c399:	01 c8                	add    %ecx,%eax
f010c39b:	89 45 cc             	mov    %eax,-0x34(%ebp)
	for(; ph < eph; ph++)
f010c39e:	39 c1                	cmp    %eax,%ecx
f010c3a0:	0f 83 29 01 00 00    	jae    f010c4cf <_Z10env_createPhj+0x1cd>
	{
		if(ph->p_type == ELF_PROG_LOAD)
f010c3a6:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f010c3a9:	83 39 01             	cmpl   $0x1,(%ecx)
f010c3ac:	0f 85 0d 01 00 00    	jne    f010c4bf <_Z10env_createPhj+0x1bd>
		{
			segment_alloc(e, ph->p_va, ph->p_memsz);
f010c3b2:	8b 41 08             	mov    0x8(%ecx),%eax
	//
	// Hint: It is easier to use segment_alloc if the caller can pass
	//   'va' and 'len' values that are not page-aligned.
	//   You should round va down, and round len up.
	// round va down to nearest page address
	uintptr_t va_start = va - PGOFF(va);
f010c3b5:	89 c3                	mov    %eax,%ebx
f010c3b7:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
	// round len up
	uintptr_t va_end = round_up(va + len, PGSIZE);
f010c3bd:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010c3c4:	00 
f010c3c5:	03 41 14             	add    0x14(%ecx),%eax
f010c3c8:	89 04 24             	mov    %eax,(%esp)
f010c3cb:	e8 99 f9 ff ff       	call   f010bd69 <_Z8round_upIjET_S0_j>
	//uintptr_t va_end = va + (PGOFF(len) == 0 ? len : len + PGSIZE - PGOFF(len + PGSIZE));

	assert(0 == (va_end - va_start) % PGSIZE);
f010c3d0:	29 d8                	sub    %ebx,%eax
f010c3d2:	a9 ff 0f 00 00       	test   $0xfff,%eax
f010c3d7:	74 24                	je     f010c3fd <_Z10env_createPhj+0xfb>
f010c3d9:	c7 44 24 0c 64 ee 10 	movl   $0xf010ee64,0xc(%esp)
f010c3e0:	f0 
f010c3e1:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010c3e8:	f0 
f010c3e9:	c7 44 24 04 d3 00 00 	movl   $0xd3,0x4(%esp)
f010c3f0:	00 
f010c3f1:	c7 04 24 e4 ed 10 f0 	movl   $0xf010ede4,(%esp)
f010c3f8:	e8 63 cc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	int num_pages = (va_end - va_start) / PGSIZE;
f010c3fd:	c1 e8 0c             	shr    $0xc,%eax
f010c400:	89 45 d0             	mov    %eax,-0x30(%ebp)
	struct Page *pp = NULL;
	int i;
	for(i = 0; i < num_pages; i++)
f010c403:	85 c0                	test   %eax,%eax
f010c405:	7e 73                	jle    f010c47a <_Z10env_createPhj+0x178>
f010c407:	be 00 00 00 00       	mov    $0x0,%esi
	{
		if (!(pp = page_alloc()))
f010c40c:	e8 98 de ff ff       	call   f010a2a9 <_Z10page_allocv>
f010c411:	85 c0                	test   %eax,%eax
f010c413:	75 1c                	jne    f010c431 <_Z10env_createPhj+0x12f>
			panic("segment_alloc: page_alloc failed");
f010c415:	c7 44 24 08 88 ee 10 	movl   $0xf010ee88,0x8(%esp)
f010c41c:	f0 
f010c41d:	c7 44 24 04 da 00 00 	movl   $0xda,0x4(%esp)
f010c424:	00 
f010c425:	c7 04 24 e4 ed 10 f0 	movl   $0xf010ede4,(%esp)
f010c42c:	e8 2f cc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
		uintptr_t va_addr = va_start + i * PGSIZE;
		if(page_insert(e->env_pgdir, pp, va_addr, PTE_U | PTE_W) < 0)
f010c431:	c7 44 24 0c 06 00 00 	movl   $0x6,0xc(%esp)
f010c438:	00 
f010c439:	89 5c 24 08          	mov    %ebx,0x8(%esp)
f010c43d:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c441:	8b 47 10             	mov    0x10(%edi),%eax
f010c444:	89 04 24             	mov    %eax,(%esp)
f010c447:	e8 ec e2 ff ff       	call   f010a738 <_Z11page_insertPjP4Pageji>
f010c44c:	85 c0                	test   %eax,%eax
f010c44e:	79 1c                	jns    f010c46c <_Z10env_createPhj+0x16a>
			panic("segment_alloc: page_insert failed");
f010c450:	c7 44 24 08 ac ee 10 	movl   $0xf010eeac,0x8(%esp)
f010c457:	f0 
f010c458:	c7 44 24 04 dd 00 00 	movl   $0xdd,0x4(%esp)
f010c45f:	00 
f010c460:	c7 04 24 e4 ed 10 f0 	movl   $0xf010ede4,(%esp)
f010c467:	e8 f4 cb ff ff       	call   f0109060 <_Z6_panicPKciS0_z>

	assert(0 == (va_end - va_start) % PGSIZE);
	int num_pages = (va_end - va_start) / PGSIZE;
	struct Page *pp = NULL;
	int i;
	for(i = 0; i < num_pages; i++)
f010c46c:	83 c6 01             	add    $0x1,%esi
f010c46f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f010c475:	39 75 d0             	cmp    %esi,-0x30(%ebp)
f010c478:	7f 92                	jg     f010c40c <_Z10env_createPhj+0x10a>
	for(; ph < eph; ph++)
	{
		if(ph->p_type == ELF_PROG_LOAD)
		{
			segment_alloc(e, ph->p_va, ph->p_memsz);
			memmove((void *)ph->p_va, (void *)(binary + ph->p_offset), ph->p_filesz);
f010c47a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
f010c47d:	8b 42 10             	mov    0x10(%edx),%eax
f010c480:	89 44 24 08          	mov    %eax,0x8(%esp)
f010c484:	8b 45 08             	mov    0x8(%ebp),%eax
f010c487:	03 42 04             	add    0x4(%edx),%eax
f010c48a:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c48e:	8b 42 08             	mov    0x8(%edx),%eax
f010c491:	89 04 24             	mov    %eax,(%esp)
f010c494:	e8 23 15 00 00       	call   f010d9bc <memmove>
			if(ph->p_memsz > ph->p_filesz)
f010c499:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f010c49c:	8b 51 14             	mov    0x14(%ecx),%edx
f010c49f:	8b 41 10             	mov    0x10(%ecx),%eax
f010c4a2:	39 c2                	cmp    %eax,%edx
f010c4a4:	76 19                	jbe    f010c4bf <_Z10env_createPhj+0x1bd>
				memset((void *)(ph->p_va + ph->p_filesz), 0, ph->p_memsz - ph->p_filesz);
f010c4a6:	29 c2                	sub    %eax,%edx
f010c4a8:	89 54 24 08          	mov    %edx,0x8(%esp)
f010c4ac:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010c4b3:	00 
f010c4b4:	03 41 08             	add    0x8(%ecx),%eax
f010c4b7:	89 04 24             	mov    %eax,(%esp)
f010c4ba:	e8 af 14 00 00       	call   f010d96e <memset>
	pde_t *cr3_bak = (pde_t *)rcr3();
	lcr3(PADDR(e->env_pgdir));

	ph = (struct Proghdr *) (binary	+ ELFHDR->e_phoff);
	eph = ph + ELFHDR->e_phnum;
	for(; ph < eph; ph++)
f010c4bf:	83 45 d4 20          	addl   $0x20,-0x2c(%ebp)
f010c4c3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f010c4c6:	39 45 cc             	cmp    %eax,-0x34(%ebp)
f010c4c9:	0f 87 d7 fe ff ff    	ja     f010c3a6 <_Z10env_createPhj+0xa4>
			memmove((void *)ph->p_va, (void *)(binary + ph->p_offset), ph->p_filesz);
			if(ph->p_memsz > ph->p_filesz)
				memset((void *)(ph->p_va + ph->p_filesz), 0, ph->p_memsz - ph->p_filesz);
		}
	}
	e->env_tf.tf_eip = ELFHDR->e_entry;
f010c4cf:	8b 55 c8             	mov    -0x38(%ebp),%edx
f010c4d2:	8b 42 18             	mov    0x18(%edx),%eax
f010c4d5:	89 47 44             	mov    %eax,0x44(%edi)
	// at virtual address USTACKTOP - PGSIZE.

	// LAB 3: Your code here.
	Page *p = NULL;
	// Allocate a page for the page directory
	if (!(p = page_alloc()))
f010c4d8:	e8 cc dd ff ff       	call   f010a2a9 <_Z10page_allocv>
f010c4dd:	85 c0                	test   %eax,%eax
f010c4df:	75 1c                	jne    f010c4fd <_Z10env_createPhj+0x1fb>
	{
		panic("load_elf: page_alloc failed");
f010c4e1:	c7 44 24 08 28 ee 10 	movl   $0xf010ee28,0x8(%esp)
f010c4e8:	f0 
f010c4e9:	c7 44 24 04 31 01 00 	movl   $0x131,0x4(%esp)
f010c4f0:	00 
f010c4f1:	c7 04 24 e4 ed 10 f0 	movl   $0xf010ede4,(%esp)
f010c4f8:	e8 63 cb ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	}
	page_insert(e->env_pgdir, p, USTACKTOP - PGSIZE, PTE_P | PTE_U | PTE_W ); 
f010c4fd:	c7 44 24 0c 07 00 00 	movl   $0x7,0xc(%esp)
f010c504:	00 
f010c505:	c7 44 24 08 00 d0 ff 	movl   $0xeeffd000,0x8(%esp)
f010c50c:	ee 
f010c50d:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c511:	8b 47 10             	mov    0x10(%edi),%eax
f010c514:	89 04 24             	mov    %eax,(%esp)
f010c517:	e8 1c e2 ff ff       	call   f010a738 <_Z11page_insertPjP4Pageji>
	e->env_tf.tf_esp = USTACKTOP;
f010c51c:	c7 47 50 00 e0 ff ee 	movl   $0xeeffe000,0x50(%edi)
f010c523:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
f010c526:	0f 22 d9             	mov    %ecx,%cr3
	int r;
	r = env_alloc(&env, 0);
	if(r < 0)
		panic("env_alloc: %e", r);
	load_elf(env, binary, size);
}
f010c529:	83 c4 4c             	add    $0x4c,%esp
f010c52c:	5b                   	pop    %ebx
f010c52d:	5e                   	pop    %esi
f010c52e:	5f                   	pop    %edi
f010c52f:	5d                   	pop    %ebp
f010c530:	c3                   	ret    
f010c531:	00 00                	add    %al,(%eax)
	...

f010c534 <_Z13mc146818_readj>:
#include <kern/kclock.h>


unsigned
mc146818_read(unsigned reg)
{
f010c534:	55                   	push   %ebp
f010c535:	89 e5                	mov    %esp,%ebp
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f010c537:	ba 70 00 00 00       	mov    $0x70,%edx
f010c53c:	8b 45 08             	mov    0x8(%ebp),%eax
f010c53f:	ee                   	out    %al,(%dx)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f010c540:	b2 71                	mov    $0x71,%dl
f010c542:	ec                   	in     (%dx),%al
f010c543:	0f b6 c0             	movzbl %al,%eax
	outb(IO_RTC, reg);
	return inb(IO_RTC+1);
}
f010c546:	5d                   	pop    %ebp
f010c547:	c3                   	ret    

f010c548 <_Z14mc146818_writejj>:

void
mc146818_write(unsigned reg, unsigned datum)
{
f010c548:	55                   	push   %ebp
f010c549:	89 e5                	mov    %esp,%ebp
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f010c54b:	ba 70 00 00 00       	mov    $0x70,%edx
f010c550:	8b 45 08             	mov    0x8(%ebp),%eax
f010c553:	ee                   	out    %al,(%dx)
f010c554:	b2 71                	mov    $0x71,%dl
f010c556:	8b 45 0c             	mov    0xc(%ebp),%eax
f010c559:	ee                   	out    %al,(%dx)
	outb(IO_RTC, reg);
	outb(IO_RTC+1, datum);
}
f010c55a:	5d                   	pop    %ebp
f010c55b:	c3                   	ret    

f010c55c <_Z8vcprintfPKcPc>:
	(*cntptr)++;
}

int
vcprintf(const char *fmt, va_list ap)
{
f010c55c:	55                   	push   %ebp
f010c55d:	89 e5                	mov    %esp,%ebp
f010c55f:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
f010c562:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	vprintfmt(putch, &cnt, fmt, ap);
f010c569:	8b 45 0c             	mov    0xc(%ebp),%eax
f010c56c:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c570:	8b 45 08             	mov    0x8(%ebp),%eax
f010c573:	89 44 24 08          	mov    %eax,0x8(%esp)
f010c577:	8d 45 f4             	lea    -0xc(%ebp),%eax
f010c57a:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c57e:	c7 04 24 a9 c5 10 f0 	movl   $0xf010c5a9,(%esp)
f010c585:	e8 e6 0c 00 00       	call   f010d270 <_Z9vprintfmtPFviPvES_PKcPc>
	return cnt;
}
f010c58a:	8b 45 f4             	mov    -0xc(%ebp),%eax
f010c58d:	c9                   	leave  
f010c58e:	c3                   	ret    

f010c58f <_Z7cprintfPKcz>:

int
cprintf(const char *fmt, ...)
{
f010c58f:	55                   	push   %ebp
f010c590:	89 e5                	mov    %esp,%ebp
f010c592:	83 ec 18             	sub    $0x18,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
	cnt = vcprintf(fmt, ap);
f010c595:	8d 45 0c             	lea    0xc(%ebp),%eax
f010c598:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c59c:	8b 45 08             	mov    0x8(%ebp),%eax
f010c59f:	89 04 24             	mov    %eax,(%esp)
f010c5a2:	e8 b5 ff ff ff       	call   f010c55c <_Z8vcprintfPKcPc>
	va_end(ap);

	return cnt;
}
f010c5a7:	c9                   	leave  
f010c5a8:	c3                   	ret    

f010c5a9 <_ZL5putchiPv>:
#include <inc/stdarg.h>


static void
putch(int ch, void *thunk)
{
f010c5a9:	55                   	push   %ebp
f010c5aa:	89 e5                	mov    %esp,%ebp
f010c5ac:	53                   	push   %ebx
f010c5ad:	83 ec 14             	sub    $0x14,%esp
f010c5b0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	cputchar(ch);
f010c5b3:	8b 45 08             	mov    0x8(%ebp),%eax
f010c5b6:	89 04 24             	mov    %eax,(%esp)
f010c5b9:	e8 96 d2 ff ff       	call   f0109854 <_Z8cputchari>
	int *cntptr = (int *) thunk;
	(*cntptr)++;
f010c5be:	83 03 01             	addl   $0x1,(%ebx)
}
f010c5c1:	83 c4 14             	add    $0x14,%esp
f010c5c4:	5b                   	pop    %ebx
f010c5c5:	5d                   	pop    %ebp
f010c5c6:	c3                   	ret    
	...

f010c5c8 <_ZL8trapnamei>:
	sizeof(idt) - 1, (uint32_t) idt
};


static const char *trapname(int trapno)
{
f010c5c8:	55                   	push   %ebp
f010c5c9:	89 e5                	mov    %esp,%ebp
f010c5cb:	8b 55 08             	mov    0x8(%ebp),%edx
		"Alignment Check",
		"Machine-Check",
		"SIMD Floating-Point Exception"
	};

	if ((size_t) trapno < sizeof(excnames) / sizeof(excnames[0]))
f010c5ce:	83 fa 13             	cmp    $0x13,%edx
f010c5d1:	77 09                	ja     f010c5dc <_ZL8trapnamei+0x14>
		return excnames[trapno];
f010c5d3:	8b 04 95 c0 f1 10 f0 	mov    -0xfef0e40(,%edx,4),%eax
f010c5da:	eb 0f                	jmp    f010c5eb <_ZL8trapnamei+0x23>
	if (trapno == T_SYSCALL)
f010c5dc:	b8 dd ee 10 f0       	mov    $0xf010eedd,%eax
f010c5e1:	83 fa 30             	cmp    $0x30,%edx
f010c5e4:	74 05                	je     f010c5eb <_ZL8trapnamei+0x23>
f010c5e6:	b8 ce ee 10 f0       	mov    $0xf010eece,%eax
		return "System call";

	return "(unknown trap)";
}
f010c5eb:	5d                   	pop    %ebp
f010c5ec:	c3                   	ret    

f010c5ed <_Z8idt_initv>:


void
idt_init(void)
{
f010c5ed:	55                   	push   %ebp
f010c5ee:	89 e5                	mov    %esp,%ebp
	extern char t_align_lbl[];// 17
	extern char t_mchk_lbl[];// 18
	extern char t_simderr_lbl[];// 19
	extern char t_syscall_lbl[];// 48 system call
	//extern char t_default_lbl[];// 500
	SETGATE(idt[0], 0, GD_KT, t_divide_lbl, 0);
f010c5f0:	b8 14 e0 11 f0       	mov    $0xf011e014,%eax
f010c5f5:	66 a3 a0 40 19 f0    	mov    %ax,0xf01940a0
f010c5fb:	66 c7 05 a2 40 19 f0 	movw   $0x8,0xf01940a2
f010c602:	08 00 
f010c604:	c6 05 a4 40 19 f0 00 	movb   $0x0,0xf01940a4
f010c60b:	c6 05 a5 40 19 f0 8e 	movb   $0x8e,0xf01940a5
f010c612:	c1 e8 10             	shr    $0x10,%eax
f010c615:	66 a3 a6 40 19 f0    	mov    %ax,0xf01940a6
	SETGATE(idt[1], 0, GD_KT, t_debug_lbl, 0);
f010c61b:	b8 1e e0 11 f0       	mov    $0xf011e01e,%eax
f010c620:	66 a3 a8 40 19 f0    	mov    %ax,0xf01940a8
f010c626:	66 c7 05 aa 40 19 f0 	movw   $0x8,0xf01940aa
f010c62d:	08 00 
f010c62f:	c6 05 ac 40 19 f0 00 	movb   $0x0,0xf01940ac
f010c636:	c6 05 ad 40 19 f0 8e 	movb   $0x8e,0xf01940ad
f010c63d:	c1 e8 10             	shr    $0x10,%eax
f010c640:	66 a3 ae 40 19 f0    	mov    %ax,0xf01940ae
	SETGATE(idt[2], 0, GD_KT, t_nmi_lbl, 0);
f010c646:	b8 28 e0 11 f0       	mov    $0xf011e028,%eax
f010c64b:	66 a3 b0 40 19 f0    	mov    %ax,0xf01940b0
f010c651:	66 c7 05 b2 40 19 f0 	movw   $0x8,0xf01940b2
f010c658:	08 00 
f010c65a:	c6 05 b4 40 19 f0 00 	movb   $0x0,0xf01940b4
f010c661:	c6 05 b5 40 19 f0 8e 	movb   $0x8e,0xf01940b5
f010c668:	c1 e8 10             	shr    $0x10,%eax
f010c66b:	66 a3 b6 40 19 f0    	mov    %ax,0xf01940b6
	SETGATE(idt[3], 0, GD_KT, t_brkpt_lbl, 3);	
f010c671:	b8 32 e0 11 f0       	mov    $0xf011e032,%eax
f010c676:	66 a3 b8 40 19 f0    	mov    %ax,0xf01940b8
f010c67c:	66 c7 05 ba 40 19 f0 	movw   $0x8,0xf01940ba
f010c683:	08 00 
f010c685:	c6 05 bc 40 19 f0 00 	movb   $0x0,0xf01940bc
f010c68c:	c6 05 bd 40 19 f0 ee 	movb   $0xee,0xf01940bd
f010c693:	c1 e8 10             	shr    $0x10,%eax
f010c696:	66 a3 be 40 19 f0    	mov    %ax,0xf01940be
	SETGATE(idt[4], 0, GD_KT, t_oflow_lbl, 3);
f010c69c:	b8 3c e0 11 f0       	mov    $0xf011e03c,%eax
f010c6a1:	66 a3 c0 40 19 f0    	mov    %ax,0xf01940c0
f010c6a7:	66 c7 05 c2 40 19 f0 	movw   $0x8,0xf01940c2
f010c6ae:	08 00 
f010c6b0:	c6 05 c4 40 19 f0 00 	movb   $0x0,0xf01940c4
f010c6b7:	c6 05 c5 40 19 f0 ee 	movb   $0xee,0xf01940c5
f010c6be:	c1 e8 10             	shr    $0x10,%eax
f010c6c1:	66 a3 c6 40 19 f0    	mov    %ax,0xf01940c6
	SETGATE(idt[5], 0, GD_KT, t_bound_lbl, 0);
f010c6c7:	b8 46 e0 11 f0       	mov    $0xf011e046,%eax
f010c6cc:	66 a3 c8 40 19 f0    	mov    %ax,0xf01940c8
f010c6d2:	66 c7 05 ca 40 19 f0 	movw   $0x8,0xf01940ca
f010c6d9:	08 00 
f010c6db:	c6 05 cc 40 19 f0 00 	movb   $0x0,0xf01940cc
f010c6e2:	c6 05 cd 40 19 f0 8e 	movb   $0x8e,0xf01940cd
f010c6e9:	c1 e8 10             	shr    $0x10,%eax
f010c6ec:	66 a3 ce 40 19 f0    	mov    %ax,0xf01940ce
	SETGATE(idt[6], 0, GD_KT, t_illop_lbl, 0);
f010c6f2:	b8 50 e0 11 f0       	mov    $0xf011e050,%eax
f010c6f7:	66 a3 d0 40 19 f0    	mov    %ax,0xf01940d0
f010c6fd:	66 c7 05 d2 40 19 f0 	movw   $0x8,0xf01940d2
f010c704:	08 00 
f010c706:	c6 05 d4 40 19 f0 00 	movb   $0x0,0xf01940d4
f010c70d:	c6 05 d5 40 19 f0 8e 	movb   $0x8e,0xf01940d5
f010c714:	c1 e8 10             	shr    $0x10,%eax
f010c717:	66 a3 d6 40 19 f0    	mov    %ax,0xf01940d6
	SETGATE(idt[7], 0, GD_KT, t_device_lbl, 0);
f010c71d:	b8 5a e0 11 f0       	mov    $0xf011e05a,%eax
f010c722:	66 a3 d8 40 19 f0    	mov    %ax,0xf01940d8
f010c728:	66 c7 05 da 40 19 f0 	movw   $0x8,0xf01940da
f010c72f:	08 00 
f010c731:	c6 05 dc 40 19 f0 00 	movb   $0x0,0xf01940dc
f010c738:	c6 05 dd 40 19 f0 8e 	movb   $0x8e,0xf01940dd
f010c73f:	c1 e8 10             	shr    $0x10,%eax
f010c742:	66 a3 de 40 19 f0    	mov    %ax,0xf01940de
	SETGATE(idt[8], 0, GD_KT, t_dblflt_lbl, 0);
f010c748:	b8 64 e0 11 f0       	mov    $0xf011e064,%eax
f010c74d:	66 a3 e0 40 19 f0    	mov    %ax,0xf01940e0
f010c753:	66 c7 05 e2 40 19 f0 	movw   $0x8,0xf01940e2
f010c75a:	08 00 
f010c75c:	c6 05 e4 40 19 f0 00 	movb   $0x0,0xf01940e4
f010c763:	c6 05 e5 40 19 f0 8e 	movb   $0x8e,0xf01940e5
f010c76a:	c1 e8 10             	shr    $0x10,%eax
f010c76d:	66 a3 e6 40 19 f0    	mov    %ax,0xf01940e6
	SETGATE(idt[10], 0, GD_KT, t_tss_lbl, 0);
f010c773:	b8 6c e0 11 f0       	mov    $0xf011e06c,%eax
f010c778:	66 a3 f0 40 19 f0    	mov    %ax,0xf01940f0
f010c77e:	66 c7 05 f2 40 19 f0 	movw   $0x8,0xf01940f2
f010c785:	08 00 
f010c787:	c6 05 f4 40 19 f0 00 	movb   $0x0,0xf01940f4
f010c78e:	c6 05 f5 40 19 f0 8e 	movb   $0x8e,0xf01940f5
f010c795:	c1 e8 10             	shr    $0x10,%eax
f010c798:	66 a3 f6 40 19 f0    	mov    %ax,0xf01940f6
	SETGATE(idt[11], 0, GD_KT, t_segnp_lbl, 0);
f010c79e:	b8 74 e0 11 f0       	mov    $0xf011e074,%eax
f010c7a3:	66 a3 f8 40 19 f0    	mov    %ax,0xf01940f8
f010c7a9:	66 c7 05 fa 40 19 f0 	movw   $0x8,0xf01940fa
f010c7b0:	08 00 
f010c7b2:	c6 05 fc 40 19 f0 00 	movb   $0x0,0xf01940fc
f010c7b9:	c6 05 fd 40 19 f0 8e 	movb   $0x8e,0xf01940fd
f010c7c0:	c1 e8 10             	shr    $0x10,%eax
f010c7c3:	66 a3 fe 40 19 f0    	mov    %ax,0xf01940fe
	SETGATE(idt[12], 0, GD_KT, t_stack_lbl, 0);
f010c7c9:	b8 7c e0 11 f0       	mov    $0xf011e07c,%eax
f010c7ce:	66 a3 00 41 19 f0    	mov    %ax,0xf0194100
f010c7d4:	66 c7 05 02 41 19 f0 	movw   $0x8,0xf0194102
f010c7db:	08 00 
f010c7dd:	c6 05 04 41 19 f0 00 	movb   $0x0,0xf0194104
f010c7e4:	c6 05 05 41 19 f0 8e 	movb   $0x8e,0xf0194105
f010c7eb:	c1 e8 10             	shr    $0x10,%eax
f010c7ee:	66 a3 06 41 19 f0    	mov    %ax,0xf0194106
	SETGATE(idt[13], 0, GD_KT, t_gpflt_lbl, 0);	
f010c7f4:	b8 84 e0 11 f0       	mov    $0xf011e084,%eax
f010c7f9:	66 a3 08 41 19 f0    	mov    %ax,0xf0194108
f010c7ff:	66 c7 05 0a 41 19 f0 	movw   $0x8,0xf019410a
f010c806:	08 00 
f010c808:	c6 05 0c 41 19 f0 00 	movb   $0x0,0xf019410c
f010c80f:	c6 05 0d 41 19 f0 8e 	movb   $0x8e,0xf019410d
f010c816:	c1 e8 10             	shr    $0x10,%eax
f010c819:	66 a3 0e 41 19 f0    	mov    %ax,0xf019410e
	SETGATE(idt[14], 0, GD_KT, t_pgflt_lbl, 0);	
f010c81f:	b8 8c e0 11 f0       	mov    $0xf011e08c,%eax
f010c824:	66 a3 10 41 19 f0    	mov    %ax,0xf0194110
f010c82a:	66 c7 05 12 41 19 f0 	movw   $0x8,0xf0194112
f010c831:	08 00 
f010c833:	c6 05 14 41 19 f0 00 	movb   $0x0,0xf0194114
f010c83a:	c6 05 15 41 19 f0 8e 	movb   $0x8e,0xf0194115
f010c841:	c1 e8 10             	shr    $0x10,%eax
f010c844:	66 a3 16 41 19 f0    	mov    %ax,0xf0194116
	SETGATE(idt[16], 0, GD_KT, t_fperr_lbl, 0);	
f010c84a:	b8 94 e0 11 f0       	mov    $0xf011e094,%eax
f010c84f:	66 a3 20 41 19 f0    	mov    %ax,0xf0194120
f010c855:	66 c7 05 22 41 19 f0 	movw   $0x8,0xf0194122
f010c85c:	08 00 
f010c85e:	c6 05 24 41 19 f0 00 	movb   $0x0,0xf0194124
f010c865:	c6 05 25 41 19 f0 8e 	movb   $0x8e,0xf0194125
f010c86c:	c1 e8 10             	shr    $0x10,%eax
f010c86f:	66 a3 26 41 19 f0    	mov    %ax,0xf0194126
	SETGATE(idt[17], 0, GD_KT, t_align_lbl, 0);	
f010c875:	b8 9e e0 11 f0       	mov    $0xf011e09e,%eax
f010c87a:	66 a3 28 41 19 f0    	mov    %ax,0xf0194128
f010c880:	66 c7 05 2a 41 19 f0 	movw   $0x8,0xf019412a
f010c887:	08 00 
f010c889:	c6 05 2c 41 19 f0 00 	movb   $0x0,0xf019412c
f010c890:	c6 05 2d 41 19 f0 8e 	movb   $0x8e,0xf019412d
f010c897:	c1 e8 10             	shr    $0x10,%eax
f010c89a:	66 a3 2e 41 19 f0    	mov    %ax,0xf019412e
	SETGATE(idt[18], 0, GD_KT, t_mchk_lbl, 0);	
f010c8a0:	b8 a6 e0 11 f0       	mov    $0xf011e0a6,%eax
f010c8a5:	66 a3 30 41 19 f0    	mov    %ax,0xf0194130
f010c8ab:	66 c7 05 32 41 19 f0 	movw   $0x8,0xf0194132
f010c8b2:	08 00 
f010c8b4:	c6 05 34 41 19 f0 00 	movb   $0x0,0xf0194134
f010c8bb:	c6 05 35 41 19 f0 8e 	movb   $0x8e,0xf0194135
f010c8c2:	c1 e8 10             	shr    $0x10,%eax
f010c8c5:	66 a3 36 41 19 f0    	mov    %ax,0xf0194136
	SETGATE(idt[19], 0, GD_KT, t_simderr_lbl, 0);	
f010c8cb:	b8 b0 e0 11 f0       	mov    $0xf011e0b0,%eax
f010c8d0:	66 a3 38 41 19 f0    	mov    %ax,0xf0194138
f010c8d6:	66 c7 05 3a 41 19 f0 	movw   $0x8,0xf019413a
f010c8dd:	08 00 
f010c8df:	c6 05 3c 41 19 f0 00 	movb   $0x0,0xf019413c
f010c8e6:	c6 05 3d 41 19 f0 8e 	movb   $0x8e,0xf019413d
f010c8ed:	c1 e8 10             	shr    $0x10,%eax
f010c8f0:	66 a3 3e 41 19 f0    	mov    %ax,0xf019413e

	// Set a gate for the system call interrupt.
	// Hint: Must this gate be accessible from userlevel?
	// LAB 3: Your code here.
	SETGATE(idt[48], 0, GD_KT, t_syscall_lbl, 3);	
f010c8f6:	b8 ba e0 11 f0       	mov    $0xf011e0ba,%eax
f010c8fb:	66 a3 20 42 19 f0    	mov    %ax,0xf0194220
f010c901:	66 c7 05 22 42 19 f0 	movw   $0x8,0xf0194222
f010c908:	08 00 
f010c90a:	c6 05 24 42 19 f0 00 	movb   $0x0,0xf0194224
f010c911:	c6 05 25 42 19 f0 ee 	movb   $0xee,0xf0194225
f010c918:	c1 e8 10             	shr    $0x10,%eax
f010c91b:	66 a3 26 42 19 f0    	mov    %ax,0xf0194226
	
	// Setup a TSS so that we get the right stack
	// when we trap to the kernel.
	ts.ts_esp0 = KSTACKTOP;
f010c921:	c7 05 c4 48 19 f0 00 	movl   $0xf0000000,0xf01948c4
f010c928:	00 00 f0 
	ts.ts_ss0 = GD_KD;
f010c92b:	66 c7 05 c8 48 19 f0 	movw   $0x10,0xf01948c8
f010c932:	10 00 

	// Initialize the TSS field of the gdt.
	gdt[GD_TSS >> 3] = SEG16(STS_T32A, (uint32_t) (&ts),
					sizeof(struct Taskstate), 0);
f010c934:	66 c7 05 68 40 19 f0 	movw   $0x68,0xf0194068
f010c93b:	68 00 
f010c93d:	b8 c0 48 19 f0       	mov    $0xf01948c0,%eax
f010c942:	66 a3 6a 40 19 f0    	mov    %ax,0xf019406a
f010c948:	89 c2                	mov    %eax,%edx
f010c94a:	c1 ea 10             	shr    $0x10,%edx
f010c94d:	88 15 6c 40 19 f0    	mov    %dl,0xf019406c
f010c953:	c6 05 6e 40 19 f0 40 	movb   $0x40,0xf019406e
f010c95a:	c1 e8 18             	shr    $0x18,%eax
f010c95d:	a2 6f 40 19 f0       	mov    %al,0xf019406f
	gdt[GD_TSS >> 3].sd_s = 0;
f010c962:	c6 05 6d 40 19 f0 89 	movb   $0x89,0xf019406d
}

static __inline void
ltr(uint16_t sel)
{
	__asm __volatile("ltr %0" : : "r" (sel));
f010c969:	b8 28 00 00 00       	mov    $0x28,%eax
f010c96e:	0f 00 d8             	ltr    %ax

	// Load the TSS
	ltr(GD_TSS);

	// Load the IDT
	asm volatile("lidt idt_pd");
f010c971:	0f 01 1d 0c e0 11 f0 	lidtl  0xf011e00c
}
f010c978:	5d                   	pop    %ebp
f010c979:	c3                   	ret    

f010c97a <_Z10print_regsP9Registers>:
	cprintf("  ss   0x----%04x\n", tf->tf_ss);
}

void
print_regs(struct Registers *regs)
{
f010c97a:	55                   	push   %ebp
f010c97b:	89 e5                	mov    %esp,%ebp
f010c97d:	53                   	push   %ebx
f010c97e:	83 ec 14             	sub    $0x14,%esp
f010c981:	8b 5d 08             	mov    0x8(%ebp),%ebx
	cprintf("  edi  0x%08x\n", regs->reg_edi);
f010c984:	8b 03                	mov    (%ebx),%eax
f010c986:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c98a:	c7 04 24 e9 ee 10 f0 	movl   $0xf010eee9,(%esp)
f010c991:	e8 f9 fb ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  esi  0x%08x\n", regs->reg_esi);
f010c996:	8b 43 04             	mov    0x4(%ebx),%eax
f010c999:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c99d:	c7 04 24 f8 ee 10 f0 	movl   $0xf010eef8,(%esp)
f010c9a4:	e8 e6 fb ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  ebp  0x%08x\n", regs->reg_ebp);
f010c9a9:	8b 43 08             	mov    0x8(%ebx),%eax
f010c9ac:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c9b0:	c7 04 24 07 ef 10 f0 	movl   $0xf010ef07,(%esp)
f010c9b7:	e8 d3 fb ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  oesp 0x%08x\n", regs->reg_oesp);
f010c9bc:	8b 43 0c             	mov    0xc(%ebx),%eax
f010c9bf:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c9c3:	c7 04 24 16 ef 10 f0 	movl   $0xf010ef16,(%esp)
f010c9ca:	e8 c0 fb ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  ebx  0x%08x\n", regs->reg_ebx);
f010c9cf:	8b 43 10             	mov    0x10(%ebx),%eax
f010c9d2:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c9d6:	c7 04 24 25 ef 10 f0 	movl   $0xf010ef25,(%esp)
f010c9dd:	e8 ad fb ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  edx  0x%08x\n", regs->reg_edx);
f010c9e2:	8b 43 14             	mov    0x14(%ebx),%eax
f010c9e5:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c9e9:	c7 04 24 34 ef 10 f0 	movl   $0xf010ef34,(%esp)
f010c9f0:	e8 9a fb ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  ecx  0x%08x\n", regs->reg_ecx);
f010c9f5:	8b 43 18             	mov    0x18(%ebx),%eax
f010c9f8:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c9fc:	c7 04 24 43 ef 10 f0 	movl   $0xf010ef43,(%esp)
f010ca03:	e8 87 fb ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  eax  0x%08x\n", regs->reg_eax);
f010ca08:	8b 43 1c             	mov    0x1c(%ebx),%eax
f010ca0b:	89 44 24 04          	mov    %eax,0x4(%esp)
f010ca0f:	c7 04 24 52 ef 10 f0 	movl   $0xf010ef52,(%esp)
f010ca16:	e8 74 fb ff ff       	call   f010c58f <_Z7cprintfPKcz>
}
f010ca1b:	83 c4 14             	add    $0x14,%esp
f010ca1e:	5b                   	pop    %ebx
f010ca1f:	5d                   	pop    %ebp
f010ca20:	c3                   	ret    

f010ca21 <_Z15print_trapframeP9Trapframe>:
// We use these variables to print "Incoming TRAP frame" lines.
static struct Trapframe *print_trapframe_incoming, *print_trapframe_copy;

void
print_trapframe(struct Trapframe *tf)
{
f010ca21:	55                   	push   %ebp
f010ca22:	89 e5                	mov    %esp,%ebp
f010ca24:	56                   	push   %esi
f010ca25:	53                   	push   %ebx
f010ca26:	83 ec 10             	sub    $0x10,%esp
f010ca29:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if (tf == print_trapframe_copy)
f010ca2c:	3b 1d a4 48 19 f0    	cmp    0xf01948a4,%ebx
f010ca32:	75 15                	jne    f010ca49 <_Z15print_trapframeP9Trapframe+0x28>
		cprintf("Incoming TRAP frame at %p\n", print_trapframe_incoming);
f010ca34:	a1 a0 48 19 f0       	mov    0xf01948a0,%eax
f010ca39:	89 44 24 04          	mov    %eax,0x4(%esp)
f010ca3d:	c7 04 24 61 ef 10 f0 	movl   $0xf010ef61,(%esp)
f010ca44:	e8 46 fb ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("TRAP frame at %p\n", tf);
f010ca49:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010ca4d:	c7 04 24 6a ef 10 f0 	movl   $0xf010ef6a,(%esp)
f010ca54:	e8 36 fb ff ff       	call   f010c58f <_Z7cprintfPKcz>
	print_regs(&tf->tf_regs);
f010ca59:	89 1c 24             	mov    %ebx,(%esp)
f010ca5c:	e8 19 ff ff ff       	call   f010c97a <_Z10print_regsP9Registers>
	cprintf("  es   0x----%04x\n", tf->tf_es);
f010ca61:	0f b7 43 20          	movzwl 0x20(%ebx),%eax
f010ca65:	89 44 24 04          	mov    %eax,0x4(%esp)
f010ca69:	c7 04 24 7c ef 10 f0 	movl   $0xf010ef7c,(%esp)
f010ca70:	e8 1a fb ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  ds   0x----%04x\n", tf->tf_ds);
f010ca75:	0f b7 43 24          	movzwl 0x24(%ebx),%eax
f010ca79:	89 44 24 04          	mov    %eax,0x4(%esp)
f010ca7d:	c7 04 24 8f ef 10 f0 	movl   $0xf010ef8f,(%esp)
f010ca84:	e8 06 fb ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
f010ca89:	8b 73 28             	mov    0x28(%ebx),%esi
f010ca8c:	89 34 24             	mov    %esi,(%esp)
f010ca8f:	e8 34 fb ff ff       	call   f010c5c8 <_ZL8trapnamei>
f010ca94:	89 44 24 08          	mov    %eax,0x8(%esp)
f010ca98:	89 74 24 04          	mov    %esi,0x4(%esp)
f010ca9c:	c7 04 24 a2 ef 10 f0 	movl   $0xf010efa2,(%esp)
f010caa3:	e8 e7 fa ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  err  0x%08x\n", tf->tf_err);
f010caa8:	8b 43 2c             	mov    0x2c(%ebx),%eax
f010caab:	89 44 24 04          	mov    %eax,0x4(%esp)
f010caaf:	c7 04 24 b4 ef 10 f0 	movl   $0xf010efb4,(%esp)
f010cab6:	e8 d4 fa ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  eip  0x%08x\n", tf->tf_eip);
f010cabb:	8b 43 30             	mov    0x30(%ebx),%eax
f010cabe:	89 44 24 04          	mov    %eax,0x4(%esp)
f010cac2:	c7 04 24 c3 ef 10 f0 	movl   $0xf010efc3,(%esp)
f010cac9:	e8 c1 fa ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  cs   0x----%04x\n", tf->tf_cs);
f010cace:	0f b7 43 34          	movzwl 0x34(%ebx),%eax
f010cad2:	89 44 24 04          	mov    %eax,0x4(%esp)
f010cad6:	c7 04 24 d2 ef 10 f0 	movl   $0xf010efd2,(%esp)
f010cadd:	e8 ad fa ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  flag 0x%08x\n", tf->tf_eflags);
f010cae2:	8b 43 38             	mov    0x38(%ebx),%eax
f010cae5:	89 44 24 04          	mov    %eax,0x4(%esp)
f010cae9:	c7 04 24 e5 ef 10 f0 	movl   $0xf010efe5,(%esp)
f010caf0:	e8 9a fa ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  esp  0x%08x\n", tf->tf_esp);
f010caf5:	8b 43 3c             	mov    0x3c(%ebx),%eax
f010caf8:	89 44 24 04          	mov    %eax,0x4(%esp)
f010cafc:	c7 04 24 f4 ef 10 f0 	movl   $0xf010eff4,(%esp)
f010cb03:	e8 87 fa ff ff       	call   f010c58f <_Z7cprintfPKcz>
	cprintf("  ss   0x----%04x\n", tf->tf_ss);
f010cb08:	0f b7 43 40          	movzwl 0x40(%ebx),%eax
f010cb0c:	89 44 24 04          	mov    %eax,0x4(%esp)
f010cb10:	c7 04 24 03 f0 10 f0 	movl   $0xf010f003,(%esp)
f010cb17:	e8 73 fa ff ff       	call   f010c58f <_Z7cprintfPKcz>
}
f010cb1c:	83 c4 10             	add    $0x10,%esp
f010cb1f:	5b                   	pop    %ebx
f010cb20:	5e                   	pop    %esi
f010cb21:	5d                   	pop    %ebp
f010cb22:	c3                   	ret    

f010cb23 <_Z18page_fault_handlerP9Trapframe>:
}
}

void
page_fault_handler(struct Trapframe *tf)
{
f010cb23:	55                   	push   %ebp
f010cb24:	89 e5                	mov    %esp,%ebp
f010cb26:	53                   	push   %ebx
f010cb27:	83 ec 14             	sub    $0x14,%esp
f010cb2a:	8b 5d 08             	mov    0x8(%ebp),%ebx

static __inline uint32_t
rcr2(void)
{
	uint32_t val;
	__asm __volatile("movl %%cr2,%0" : "=r" (val));
f010cb2d:	0f 20 d0             	mov    %cr2,%eax
	fault_va = rcr2();

	// Handle kernel-mode page faults.
	
	// LAB 3: Your code here.
	if((tf->tf_cs & 3) == 0){
f010cb30:	f6 43 34 03          	testb  $0x3,0x34(%ebx)
f010cb34:	75 1c                	jne    f010cb52 <_Z18page_fault_handlerP9Trapframe+0x2f>
		panic("Page fault in kernel!\n");
f010cb36:	c7 44 24 08 16 f0 10 	movl   $0xf010f016,0x8(%esp)
f010cb3d:	f0 
f010cb3e:	c7 44 24 04 eb 00 00 	movl   $0xeb,0x4(%esp)
f010cb45:	00 
f010cb46:	c7 04 24 2d f0 10 f0 	movl   $0xf010f02d,(%esp)
f010cb4d:	e8 0e c5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	// We've already handled kernel-mode exceptions, so if we get here,
	// the page fault happened in user mode.

	// Destroy the environment that caused the fault.
	cprintf("[%08x] user fault va %08x ip %08x\n",
		curenv->env_id, fault_va, tf->tf_eip);
f010cb52:	8b 53 30             	mov    0x30(%ebx),%edx
f010cb55:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010cb59:	89 44 24 08          	mov    %eax,0x8(%esp)
f010cb5d:	a1 84 40 19 f0       	mov    0xf0194084,%eax
f010cb62:	8b 40 04             	mov    0x4(%eax),%eax
f010cb65:	89 44 24 04          	mov    %eax,0x4(%esp)
f010cb69:	c7 04 24 9c f1 10 f0 	movl   $0xf010f19c,(%esp)
f010cb70:	e8 1a fa ff ff       	call   f010c58f <_Z7cprintfPKcz>
	print_trapframe(tf);
f010cb75:	89 1c 24             	mov    %ebx,(%esp)
f010cb78:	e8 a4 fe ff ff       	call   f010ca21 <_Z15print_trapframeP9Trapframe>
	env_destroy(curenv);
f010cb7d:	a1 84 40 19 f0       	mov    0xf0194084,%eax
f010cb82:	89 04 24             	mov    %eax,(%esp)
f010cb85:	e8 1e f5 ff ff       	call   f010c0a8 <_Z11env_destroyP3Env>
}
f010cb8a:	83 c4 14             	add    $0x14,%esp
f010cb8d:	5b                   	pop    %ebx
f010cb8e:	5d                   	pop    %ebp
f010cb8f:	c3                   	ret    

f010cb90 <trap>:
}

extern "C" {
void
trap(struct Trapframe *tf)
{
f010cb90:	55                   	push   %ebp
f010cb91:	89 e5                	mov    %esp,%ebp
f010cb93:	83 ec 38             	sub    $0x38,%esp
f010cb96:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f010cb99:	89 75 f8             	mov    %esi,-0x8(%ebp)
f010cb9c:	89 7d fc             	mov    %edi,-0x4(%ebp)
f010cb9f:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if ((tf->tf_cs & 3) == 3) {
f010cba2:	0f b7 43 34          	movzwl 0x34(%ebx),%eax
f010cba6:	83 e0 03             	and    $0x3,%eax
f010cba9:	83 f8 03             	cmp    $0x3,%eax
f010cbac:	75 4d                	jne    f010cbfb <trap+0x6b>
		// Trapped from user mode.
		// Copy trap frame (which is currently on the stack)
		// into 'curenv->env_tf', so that running the environment
		// will restart at the trap point.
		assert(curenv);
f010cbae:	8b 3d 84 40 19 f0    	mov    0xf0194084,%edi
f010cbb4:	85 ff                	test   %edi,%edi
f010cbb6:	75 24                	jne    f010cbdc <trap+0x4c>
f010cbb8:	c7 44 24 0c 39 f0 10 	movl   $0xf010f039,0xc(%esp)
f010cbbf:	f0 
f010cbc0:	c7 44 24 08 87 eb 10 	movl   $0xf010eb87,0x8(%esp)
f010cbc7:	f0 
f010cbc8:	c7 44 24 04 a9 00 00 	movl   $0xa9,0x4(%esp)
f010cbcf:	00 
f010cbd0:	c7 04 24 2d f0 10 f0 	movl   $0xf010f02d,(%esp)
f010cbd7:	e8 84 c4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
		curenv->env_tf = *tf;
f010cbdc:	83 c7 14             	add    $0x14,%edi
f010cbdf:	b9 11 00 00 00       	mov    $0x11,%ecx
f010cbe4:	89 de                	mov    %ebx,%esi
f010cbe6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		// Print incoming trapframe address as well as real address.
		print_trapframe_incoming = tf;
f010cbe8:	89 1d a0 48 19 f0    	mov    %ebx,0xf01948a0
		print_trapframe_copy = &curenv->env_tf;
f010cbee:	a1 84 40 19 f0       	mov    0xf0194084,%eax
f010cbf3:	83 c0 14             	add    $0x14,%eax
f010cbf6:	a3 a4 48 19 f0       	mov    %eax,0xf01948a4
		// The trapframe on the stack should be ignored from here on.
		//tf = &curenv->env_tf;
	}

	// Dispatch based on what type of trap occurred
	switch (tf->tf_trapno) {
f010cbfb:	8b 43 28             	mov    0x28(%ebx),%eax
f010cbfe:	83 f8 0e             	cmp    $0xe,%eax
f010cc01:	74 1f                	je     f010cc22 <trap+0x92>
f010cc03:	83 f8 30             	cmp    $0x30,%eax
f010cc06:	74 2c                	je     f010cc34 <trap+0xa4>
f010cc08:	83 f8 03             	cmp    $0x3,%eax
f010cc0b:	75 59                	jne    f010cc66 <trap+0xd6>

	// LAB 2: Your code here.
	case T_BRKPT:
		tf = &curenv->env_tf;
		monitor(tf);
f010cc0d:	a1 84 40 19 f0       	mov    0xf0194084,%eax
f010cc12:	83 c0 14             	add    $0x14,%eax
f010cc15:	89 04 24             	mov    %eax,(%esp)
f010cc18:	e8 7b cd ff ff       	call   f0109998 <_Z7monitorP9Trapframe>
		return;
f010cc1d:	e9 85 00 00 00       	jmp    f010cca7 <trap+0x117>
	// Handle page faults (T_PGFLT).
	// LAB 3: Your code here.
	case T_PGFLT:
		tf = &curenv->env_tf;
		page_fault_handler(tf);
f010cc22:	a1 84 40 19 f0       	mov    0xf0194084,%eax
f010cc27:	83 c0 14             	add    $0x14,%eax
f010cc2a:	89 04 24             	mov    %eax,(%esp)
f010cc2d:	e8 f1 fe ff ff       	call   f010cb23 <_Z18page_fault_handlerP9Trapframe>
		return;
f010cc32:	eb 73                	jmp    f010cca7 <trap+0x117>
			tf->tf_regs.reg_edx,
			tf->tf_regs.reg_ecx,
			tf->tf_regs.reg_ebx,
			tf->tf_regs.reg_edi,
			tf->tf_regs.reg_esi
			);
f010cc34:	8b 43 04             	mov    0x4(%ebx),%eax
f010cc37:	89 44 24 14          	mov    %eax,0x14(%esp)
f010cc3b:	8b 03                	mov    (%ebx),%eax
f010cc3d:	89 44 24 10          	mov    %eax,0x10(%esp)
f010cc41:	8b 43 10             	mov    0x10(%ebx),%eax
f010cc44:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010cc48:	8b 43 18             	mov    0x18(%ebx),%eax
f010cc4b:	89 44 24 08          	mov    %eax,0x8(%esp)
f010cc4f:	8b 43 14             	mov    0x14(%ebx),%eax
f010cc52:	89 44 24 04          	mov    %eax,0x4(%esp)
f010cc56:	8b 43 1c             	mov    0x1c(%ebx),%eax
f010cc59:	89 04 24             	mov    %eax,(%esp)
f010cc5c:	e8 8f 00 00 00       	call   f010ccf0 <_Z7syscalljjjjjj>
f010cc61:	89 43 1c             	mov    %eax,0x1c(%ebx)
		return;
f010cc64:	eb 41                	jmp    f010cca7 <trap+0x117>

	default:
		// Unexpected trap: The user process or the kernel has a bug.
		//cprintf("%d \n",tf->tf_trapno);
		tf = &curenv->env_tf;
f010cc66:	8b 1d 84 40 19 f0    	mov    0xf0194084,%ebx
		print_trapframe(tf);
f010cc6c:	8d 43 14             	lea    0x14(%ebx),%eax
f010cc6f:	89 04 24             	mov    %eax,(%esp)
f010cc72:	e8 aa fd ff ff       	call   f010ca21 <_Z15print_trapframeP9Trapframe>
		if (tf->tf_cs == GD_KT)
f010cc77:	66 83 7b 48 08       	cmpw   $0x8,0x48(%ebx)
f010cc7c:	75 1c                	jne    f010cc9a <trap+0x10a>
			panic("unhandled trap in kernel");
f010cc7e:	c7 44 24 08 40 f0 10 	movl   $0xf010f040,0x8(%esp)
f010cc85:	f0 
f010cc86:	c7 44 24 04 d3 00 00 	movl   $0xd3,0x4(%esp)
f010cc8d:	00 
f010cc8e:	c7 04 24 2d f0 10 f0 	movl   $0xf010f02d,(%esp)
f010cc95:	e8 c6 c3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
		else {
			env_destroy(curenv);
f010cc9a:	a1 84 40 19 f0       	mov    0xf0194084,%eax
f010cc9f:	89 04 24             	mov    %eax,(%esp)
f010cca2:	e8 01 f4 ff ff       	call   f010c0a8 <_Z11env_destroyP3Env>
		}
	}
        // Return to the current environment, which should be runnable.
        assert(curenv && curenv->env_status == ENV_RUNNABLE);
        env_run(curenv);
}
f010cca7:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f010ccaa:	8b 75 f8             	mov    -0x8(%ebp),%esi
f010ccad:	8b 7d fc             	mov    -0x4(%ebp),%edi
f010ccb0:	89 ec                	mov    %ebp,%esp
f010ccb2:	5d                   	pop    %ebp
f010ccb3:	c3                   	ret    

f010ccb4 <_alltraps>:
	jmp _alltraps

.data
.globl idttbl
idttbl: 
       TRAPHANDLER_NOEC(t_divide_lbl,T_DIVIDE)
f010ccb4:	1e                   	push   %ds
f010ccb5:	06                   	push   %es
f010ccb6:	60                   	pusha  
f010ccb7:	b8 10 00 00 00       	mov    $0x10,%eax
f010ccbc:	8e d8                	mov    %eax,%ds
f010ccbe:	8e c0                	mov    %eax,%es
f010ccc0:	54                   	push   %esp
f010ccc1:	e8 ca fe ff ff       	call   f010cb90 <trap>
f010ccc6:	83 c4 04             	add    $0x4,%esp
f010ccc9:	61                   	popa   
f010ccca:	07                   	pop    %es
f010cccb:	1f                   	pop    %ds
f010cccc:	83 c4 08             	add    $0x8,%esp
f010cccf:	cf                   	iret   

f010ccd0 <_Z11sched_yieldv>:


// Choose a user environment to run and run it.
void
sched_yield(void)
{
f010ccd0:	55                   	push   %ebp
f010ccd1:	89 e5                	mov    %esp,%ebp
f010ccd3:	83 ec 18             	sub    $0x18,%esp
	// unblocks, because for example data read from disk is ready, or
	// because a packet arrives -- some hardware interrupt.
	// JOS has no such sources of interrupts.
	// Thus, once we reach the idle loop, the OS will never run any other
	// process again.
	cprintf("Idle loop - nothing more to do!\n");
f010ccd6:	c7 04 24 10 f2 10 f0 	movl   $0xf010f210,(%esp)
f010ccdd:	e8 ad f8 ff ff       	call   f010c58f <_Z7cprintfPKcz>
	while (1)
		monitor(NULL);
f010cce2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f010cce9:	e8 aa cc ff ff       	call   f0109998 <_Z7monitorP9Trapframe>
f010ccee:	eb f2                	jmp    f010cce2 <_Z11sched_yieldv+0x12>

f010ccf0 <_Z7syscalljjjjjj>:


// Dispatches to the correct kernel function, passing the arguments.
int32_t
syscall(uint32_t syscallno, uint32_t a1, uint32_t a2, uint32_t a3, uint32_t a4, uint32_t a5)
{
f010ccf0:	55                   	push   %ebp
f010ccf1:	89 e5                	mov    %esp,%ebp
f010ccf3:	83 ec 28             	sub    $0x28,%esp
f010ccf6:	8b 55 08             	mov    0x8(%ebp),%edx
f010ccf9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
sys_page_unmap(envid_t envid, uintptr_t va)
{
	// Hint: This function is a wrapper around page_remove().
	
	// LAB 3: Your code here.
	panic("sys_page_unmap not implemented");
f010ccfc:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
	// Call the function corresponding to the 'syscallno' parameter.
	// Return any appropriate return value.
	// LAB 3: Your code here.

	//panic("syscall not implemented");
	switch(syscallno)
f010cd01:	83 fa 09             	cmp    $0x9,%edx
f010cd04:	0f 87 49 01 00 00    	ja     f010ce53 <_Z7syscalljjjjjj+0x163>
f010cd0a:	ff 24 95 18 f3 10 f0 	jmp    *-0xfef0ce8(,%edx,4)
	
	// LAB 3: Your code here. (Exercise 7)
	//user_mem_assert(curenv, s, len, PTE_U|PTE_P);

	// Print the string supplied by the user.
	cprintf("%.*s", len, s);
f010cd11:	89 4c 24 08          	mov    %ecx,0x8(%esp)
f010cd15:	8b 45 10             	mov    0x10(%ebp),%eax
f010cd18:	89 44 24 04          	mov    %eax,0x4(%esp)
f010cd1c:	c7 04 24 31 f2 10 f0 	movl   $0xf010f231,(%esp)
f010cd23:	e8 67 f8 ff ff       	call   f010c58f <_Z7cprintfPKcz>
f010cd28:	b8 00 00 00 00       	mov    $0x0,%eax
f010cd2d:	e9 21 01 00 00       	jmp    f010ce53 <_Z7syscalljjjjjj+0x163>
{
	int c;

	// The cons_getc() primitive doesn't wait for a character,
	// but the sys_cgetc() system call does.
	while ((c = cons_getc()) == 0)
f010cd32:	e8 ef c4 ff ff       	call   f0109226 <_Z9cons_getcv>
f010cd37:	85 c0                	test   %eax,%eax
f010cd39:	74 f7                	je     f010cd32 <_Z7syscalljjjjjj+0x42>
f010cd3b:	90                   	nop
f010cd3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cd40:	e9 0e 01 00 00       	jmp    f010ce53 <_Z7syscalljjjjjj+0x163>

// Returns the current environment's envid.
static envid_t
sys_getenvid(void)
{
	return curenv->env_id;
f010cd45:	a1 84 40 19 f0       	mov    0xf0194084,%eax
f010cd4a:	8b 40 04             	mov    0x4(%eax),%eax
			sys_cputs((const char *)a1, (size_t)a2);
			return 0;
		case SYS_cgetc:
			return sys_cgetc();
		case SYS_getenvid:
			return sys_getenvid();
f010cd4d:	e9 01 01 00 00       	jmp    f010ce53 <_Z7syscalljjjjjj+0x163>
sys_env_destroy(envid_t envid)
{
	int r;
	Env *e;

	if ((r = envid2env(envid, &e, 1)) < 0)
f010cd52:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
f010cd59:	00 
f010cd5a:	8d 45 f4             	lea    -0xc(%ebp),%eax
f010cd5d:	89 44 24 04          	mov    %eax,0x4(%esp)
f010cd61:	89 0c 24             	mov    %ecx,(%esp)
f010cd64:	e8 a7 f0 ff ff       	call   f010be10 <_Z9envid2enviPP3Envb>
f010cd69:	85 c0                	test   %eax,%eax
f010cd6b:	0f 88 e2 00 00 00    	js     f010ce53 <_Z7syscalljjjjjj+0x163>
		return r;
	if (e == curenv)
f010cd71:	8b 45 f4             	mov    -0xc(%ebp),%eax
f010cd74:	8b 15 84 40 19 f0    	mov    0xf0194084,%edx
f010cd7a:	39 d0                	cmp    %edx,%eax
f010cd7c:	75 15                	jne    f010cd93 <_Z7syscalljjjjjj+0xa3>
		cprintf("[%08x] exiting gracefully\n", curenv->env_id);
f010cd7e:	8b 40 04             	mov    0x4(%eax),%eax
f010cd81:	89 44 24 04          	mov    %eax,0x4(%esp)
f010cd85:	c7 04 24 36 f2 10 f0 	movl   $0xf010f236,(%esp)
f010cd8c:	e8 fe f7 ff ff       	call   f010c58f <_Z7cprintfPKcz>
f010cd91:	eb 1a                	jmp    f010cdad <_Z7syscalljjjjjj+0xbd>
	else
		cprintf("[%08x] destroying %08x\n", curenv->env_id, e->env_id);
f010cd93:	8b 40 04             	mov    0x4(%eax),%eax
f010cd96:	89 44 24 08          	mov    %eax,0x8(%esp)
f010cd9a:	8b 42 04             	mov    0x4(%edx),%eax
f010cd9d:	89 44 24 04          	mov    %eax,0x4(%esp)
f010cda1:	c7 04 24 51 f2 10 f0 	movl   $0xf010f251,(%esp)
f010cda8:	e8 e2 f7 ff ff       	call   f010c58f <_Z7cprintfPKcz>
	env_destroy(e);
f010cdad:	8b 45 f4             	mov    -0xc(%ebp),%eax
f010cdb0:	89 04 24             	mov    %eax,(%esp)
f010cdb3:	e8 f0 f2 ff ff       	call   f010c0a8 <_Z11env_destroyP3Env>
f010cdb8:	b8 00 00 00 00       	mov    $0x0,%eax
f010cdbd:	e9 91 00 00 00       	jmp    f010ce53 <_Z7syscalljjjjjj+0x163>
// Deschedule current environment and pick a different one to run.
// The system call will appear to return 0.
static uint32_t
sys_yield(void)
{
	sched_yield();
f010cdc2:	e8 09 ff ff ff       	call   f010ccd0 <_Z11sched_yieldv>
	//
	// Hint: Your code in env_run() shows how to copy a register set.
	
	// LAB 3: Your code here.

	panic("sys_exofork not implemented");
f010cdc7:	c7 44 24 08 69 f2 10 	movl   $0xf010f269,0x8(%esp)
f010cdce:	f0 
f010cdcf:	c7 44 24 04 73 00 00 	movl   $0x73,0x4(%esp)
f010cdd6:	00 
f010cdd7:	c7 04 24 85 f2 10 f0 	movl   $0xf010f285,(%esp)
f010cdde:	e8 7d c2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	// You should set envid2env's third argument to 1, which will
	// check whether the current environment has permission to set
	// envid's status.
	
	// LAB 3: Your code here.
	panic("sys_env_set_status not implemented");
f010cde3:	c7 44 24 08 b4 f2 10 	movl   $0xf010f2b4,0x8(%esp)
f010cdea:	f0 
f010cdeb:	c7 44 24 04 88 00 00 	movl   $0x88,0x4(%esp)
f010cdf2:	00 
f010cdf3:	c7 04 24 85 f2 10 f0 	movl   $0xf010f285,(%esp)
f010cdfa:	e8 61 c2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	//   parameters for correctness.
	//   If page_insert() fails, remember to free the page you
	//   allocated!

	// LAB 3: Your code here.
	panic("sys_page_alloc not implemented");
f010cdff:	c7 44 24 08 d8 f2 10 	movl   $0xf010f2d8,0x8(%esp)
f010ce06:	f0 
f010ce07:	c7 44 24 04 a7 00 00 	movl   $0xa7,0x4(%esp)
f010ce0e:	00 
f010ce0f:	c7 04 24 85 f2 10 f0 	movl   $0xf010f285,(%esp)
f010ce16:	e8 45 c2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	//   parameters for correctness.
	//   Use the third argument to page_lookup() to
	//   check the current permissions on the page.

	// LAB 3: Your code here.
	panic("sys_page_map not implemented");
f010ce1b:	c7 44 24 08 94 f2 10 	movl   $0xf010f294,0x8(%esp)
f010ce22:	f0 
f010ce23:	c7 44 24 04 c8 00 00 	movl   $0xc8,0x4(%esp)
f010ce2a:	00 
f010ce2b:	c7 04 24 85 f2 10 f0 	movl   $0xf010f285,(%esp)
f010ce32:	e8 29 c2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
sys_page_unmap(envid_t envid, uintptr_t va)
{
	// Hint: This function is a wrapper around page_remove().
	
	// LAB 3: Your code here.
	panic("sys_page_unmap not implemented");
f010ce37:	c7 44 24 08 f8 f2 10 	movl   $0xf010f2f8,0x8(%esp)
f010ce3e:	f0 
f010ce3f:	c7 44 24 04 d9 00 00 	movl   $0xd9,0x4(%esp)
f010ce46:	00 
f010ce47:	c7 04 24 85 f2 10 f0 	movl   $0xf010f285,(%esp)
f010ce4e:	e8 0d c2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
			return sys_page_unmap(a1, a2);
		default:
			return -E_INVAL;
	}
	return 0;
}
f010ce53:	c9                   	leave  
f010ce54:	c3                   	ret    
	...

f010ce60 <_ZL14stab_binsearchPK4StabPiS2_ij>:
//	will exit setting left = 118, right = 554.
//
static void
stab_binsearch(const struct Stab *stabs, int *region_left, int *region_right,
	       int type, uintptr_t addr)
{
f010ce60:	55                   	push   %ebp
f010ce61:	89 e5                	mov    %esp,%ebp
f010ce63:	57                   	push   %edi
f010ce64:	56                   	push   %esi
f010ce65:	53                   	push   %ebx
f010ce66:	83 ec 14             	sub    $0x14,%esp
f010ce69:	89 45 f0             	mov    %eax,-0x10(%ebp)
f010ce6c:	89 55 e8             	mov    %edx,-0x18(%ebp)
f010ce6f:	89 4d e0             	mov    %ecx,-0x20(%ebp)
f010ce72:	8b 7d 08             	mov    0x8(%ebp),%edi
	int l = *region_left, r = *region_right, any_matches = 0;
f010ce75:	8b 12                	mov    (%edx),%edx
f010ce77:	8b 09                	mov    (%ecx),%ecx
f010ce79:	89 4d ec             	mov    %ecx,-0x14(%ebp)
	
	while (l <= r) {
f010ce7c:	39 ca                	cmp    %ecx,%edx
f010ce7e:	0f 8f 8c 00 00 00    	jg     f010cf10 <_ZL14stab_binsearchPK4StabPiS2_ij+0xb0>
f010ce84:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
		int true_m = (l + r) / 2, m = true_m;
f010ce8b:	8b 45 ec             	mov    -0x14(%ebp),%eax
f010ce8e:	01 d0                	add    %edx,%eax
f010ce90:	89 c6                	mov    %eax,%esi
f010ce92:	c1 ee 1f             	shr    $0x1f,%esi
f010ce95:	01 c6                	add    %eax,%esi
f010ce97:	d1 fe                	sar    %esi
f010ce99:	8d 04 76             	lea    (%esi,%esi,2),%eax
f010ce9c:	8b 5d f0             	mov    -0x10(%ebp),%ebx
f010ce9f:	8d 4c 83 04          	lea    0x4(%ebx,%eax,4),%ecx
f010cea3:	89 f0                	mov    %esi,%eax
		
		// search for earliest stab with right type
		while (m >= l && stabs[m].n_type != type)
f010cea5:	39 d0                	cmp    %edx,%eax
f010cea7:	0f 8c bb 00 00 00    	jl     f010cf68 <_ZL14stab_binsearchPK4StabPiS2_ij+0x108>
f010cead:	0f b6 19             	movzbl (%ecx),%ebx
f010ceb0:	83 e9 0c             	sub    $0xc,%ecx
f010ceb3:	39 fb                	cmp    %edi,%ebx
f010ceb5:	0f 84 8b 00 00 00    	je     f010cf46 <_ZL14stab_binsearchPK4StabPiS2_ij+0xe6>
			m--;
f010cebb:	83 e8 01             	sub    $0x1,%eax
f010cebe:	eb e5                	jmp    f010cea5 <_ZL14stab_binsearchPK4StabPiS2_ij+0x45>
		}

		// actual binary search
		any_matches = 1;
		if (stabs[m].n_value < addr) {
			*region_left = m;
f010cec0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010cec3:	8b 45 e8             	mov    -0x18(%ebp),%eax
f010cec6:	89 10                	mov    %edx,(%eax)
			l = true_m + 1;
f010cec8:	8d 56 01             	lea    0x1(%esi),%edx
f010cecb:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
f010ced2:	eb 31                	jmp    f010cf05 <_ZL14stab_binsearchPK4StabPiS2_ij+0xa5>
		} else if (stabs[m].n_value > addr) {
f010ced4:	3b 4d 0c             	cmp    0xc(%ebp),%ecx
f010ced7:	76 17                	jbe    f010cef0 <_ZL14stab_binsearchPK4StabPiS2_ij+0x90>
			*region_right = m - 1;
f010ced9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f010cedc:	83 e9 01             	sub    $0x1,%ecx
f010cedf:	89 4d ec             	mov    %ecx,-0x14(%ebp)
f010cee2:	8b 5d e0             	mov    -0x20(%ebp),%ebx
f010cee5:	89 0b                	mov    %ecx,(%ebx)
f010cee7:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
f010ceee:	eb 15                	jmp    f010cf05 <_ZL14stab_binsearchPK4StabPiS2_ij+0xa5>
			r = m - 1;
		} else {
			// exact match for 'addr', but continue loop to find
			// *region_right
			*region_left = m;
f010cef0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f010cef3:	8b 55 e8             	mov    -0x18(%ebp),%edx
f010cef6:	89 0a                	mov    %ecx,(%edx)
			l = m;
			addr++;
f010cef8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
f010cefc:	89 c2                	mov    %eax,%edx
f010cefe:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
stab_binsearch(const struct Stab *stabs, int *region_left, int *region_right,
	       int type, uintptr_t addr)
{
	int l = *region_left, r = *region_right, any_matches = 0;
	
	while (l <= r) {
f010cf05:	39 55 ec             	cmp    %edx,-0x14(%ebp)
f010cf08:	7d 81                	jge    f010ce8b <_ZL14stab_binsearchPK4StabPiS2_ij+0x2b>
			l = m;
			addr++;
		}
	}

	if (!any_matches)
f010cf0a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
f010cf0e:	75 0f                	jne    f010cf1f <_ZL14stab_binsearchPK4StabPiS2_ij+0xbf>
		*region_right = *region_left - 1;
f010cf10:	8b 5d e8             	mov    -0x18(%ebp),%ebx
f010cf13:	8b 03                	mov    (%ebx),%eax
f010cf15:	83 e8 01             	sub    $0x1,%eax
f010cf18:	8b 55 e0             	mov    -0x20(%ebp),%edx
f010cf1b:	89 02                	mov    %eax,(%edx)
f010cf1d:	eb 53                	jmp    f010cf72 <_ZL14stab_binsearchPK4StabPiS2_ij+0x112>
	else {
		// find rightmost region containing 'addr'
		for (l = *region_right;
f010cf1f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
f010cf22:	8b 01                	mov    (%ecx),%eax
f010cf24:	8b 5d e8             	mov    -0x18(%ebp),%ebx
f010cf27:	8b 0b                	mov    (%ebx),%ecx
f010cf29:	8d 14 40             	lea    (%eax,%eax,2),%edx
f010cf2c:	8b 5d f0             	mov    -0x10(%ebp),%ebx
f010cf2f:	8d 54 93 04          	lea    0x4(%ebx,%edx,4),%edx
f010cf33:	39 c8                	cmp    %ecx,%eax
f010cf35:	7e 2a                	jle    f010cf61 <_ZL14stab_binsearchPK4StabPiS2_ij+0x101>
f010cf37:	0f b6 1a             	movzbl (%edx),%ebx
f010cf3a:	83 ea 0c             	sub    $0xc,%edx
f010cf3d:	39 fb                	cmp    %edi,%ebx
f010cf3f:	74 20                	je     f010cf61 <_ZL14stab_binsearchPK4StabPiS2_ij+0x101>
f010cf41:	83 e8 01             	sub    $0x1,%eax
f010cf44:	eb ed                	jmp    f010cf33 <_ZL14stab_binsearchPK4StabPiS2_ij+0xd3>
		     l > *region_left && stabs[l].n_type != type;
		     l--)
			/* do nothing */;
		*region_left = l;
	}
}
f010cf46:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			continue;
		}

		// actual binary search
		any_matches = 1;
		if (stabs[m].n_value < addr) {
f010cf49:	8d 0c 40             	lea    (%eax,%eax,2),%ecx
f010cf4c:	8b 5d f0             	mov    -0x10(%ebp),%ebx
f010cf4f:	8b 4c 8b 08          	mov    0x8(%ebx,%ecx,4),%ecx
f010cf53:	3b 4d 0c             	cmp    0xc(%ebp),%ecx
f010cf56:	0f 82 64 ff ff ff    	jb     f010cec0 <_ZL14stab_binsearchPK4StabPiS2_ij+0x60>
f010cf5c:	e9 73 ff ff ff       	jmp    f010ced4 <_ZL14stab_binsearchPK4StabPiS2_ij+0x74>
		// find rightmost region containing 'addr'
		for (l = *region_right;
		     l > *region_left && stabs[l].n_type != type;
		     l--)
			/* do nothing */;
		*region_left = l;
f010cf61:	8b 55 e8             	mov    -0x18(%ebp),%edx
f010cf64:	89 02                	mov    %eax,(%edx)
f010cf66:	eb 0a                	jmp    f010cf72 <_ZL14stab_binsearchPK4StabPiS2_ij+0x112>
		
		// search for earliest stab with right type
		while (m >= l && stabs[m].n_type != type)
			m--;
		if (m < l) {	// no match in [l, m]
			l = true_m + 1;
f010cf68:	8d 56 01             	lea    0x1(%esi),%edx
			continue;
f010cf6b:	90                   	nop
f010cf6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cf70:	eb 93                	jmp    f010cf05 <_ZL14stab_binsearchPK4StabPiS2_ij+0xa5>
		     l > *region_left && stabs[l].n_type != type;
		     l--)
			/* do nothing */;
		*region_left = l;
	}
}
f010cf72:	83 c4 14             	add    $0x14,%esp
f010cf75:	5b                   	pop    %ebx
f010cf76:	5e                   	pop    %esi
f010cf77:	5f                   	pop    %edi
f010cf78:	5d                   	pop    %ebp
f010cf79:	c3                   	ret    

f010cf7a <_Z13debuginfo_eipjP12Eipdebuginfo>:
//	negative if not.  But even if it returns negative it has stored some
//	information into '*info'.
//
int
debuginfo_eip(uintptr_t addr, struct Eipdebuginfo *info)
{
f010cf7a:	55                   	push   %ebp
f010cf7b:	89 e5                	mov    %esp,%ebp
f010cf7d:	83 ec 48             	sub    $0x48,%esp
f010cf80:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f010cf83:	89 75 f8             	mov    %esi,-0x8(%ebp)
f010cf86:	89 7d fc             	mov    %edi,-0x4(%ebp)
f010cf89:	8b 7d 08             	mov    0x8(%ebp),%edi
f010cf8c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	const struct Stab *stabs, *stab_end;
	const char *stabstr, *stabstr_end;
	int lfile, rfile, lfun, rfun, lline, rline;

	// Initialize *info
	info->eip_file = "<unknown>";
f010cf8f:	c7 03 40 f3 10 f0    	movl   $0xf010f340,(%ebx)
	info->eip_line = 0;
f010cf95:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
	info->eip_fn_name = "<unknown>";
f010cf9c:	c7 43 08 40 f3 10 f0 	movl   $0xf010f340,0x8(%ebx)
	info->eip_fn_namelen = 9;
f010cfa3:	c7 43 0c 09 00 00 00 	movl   $0x9,0xc(%ebx)
	info->eip_fn_addr = addr;
f010cfaa:	89 7b 10             	mov    %edi,0x10(%ebx)
	info->eip_fn_narg = 0;
f010cfad:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)

	// Find the relevant set of stabs
	if (addr >= ULIM) {
f010cfb4:	81 ff ff ff bf ef    	cmp    $0xefbfffff,%edi
f010cfba:	76 1a                	jbe    f010cfd6 <_Z13debuginfo_eipjP12Eipdebuginfo+0x5c>
f010cfbc:	be 06 d0 11 f0       	mov    $0xf011d006,%esi
f010cfc1:	c7 45 d4 85 80 11 f0 	movl   $0xf0118085,-0x2c(%ebp)
f010cfc8:	b8 84 80 11 f0       	mov    $0xf0118084,%eax
f010cfcd:	c7 45 d0 58 f5 10 f0 	movl   $0xf010f558,-0x30(%ebp)
f010cfd4:	eb 16                	jmp    f010cfec <_Z13debuginfo_eipjP12Eipdebuginfo+0x72>

		// Make sure this memory is valid.
		// Return -1 if it is not.  Hint: Call user_mem_check.
		// LAB 3: Your code here.
		
		stabs = usd->stabs;
f010cfd6:	ba 00 00 20 00       	mov    $0x200000,%edx
f010cfdb:	8b 02                	mov    (%edx),%eax
f010cfdd:	89 45 d0             	mov    %eax,-0x30(%ebp)
		stab_end = usd->stab_end;
f010cfe0:	8b 42 04             	mov    0x4(%edx),%eax
		stabstr = usd->stabstr;
f010cfe3:	8b 4a 08             	mov    0x8(%edx),%ecx
f010cfe6:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
		stabstr_end = usd->stabstr_end;
f010cfe9:	8b 72 0c             	mov    0xc(%edx),%esi
		// Make sure the STABS and string table memory is valid.
		// LAB 3: Your code here.
	}

	// String table validity checks
	if (stabstr_end <= stabstr || stabstr_end[-1] != 0)
f010cfec:	39 75 d4             	cmp    %esi,-0x2c(%ebp)
f010cfef:	0f 83 f9 00 00 00    	jae    f010d0ee <_Z13debuginfo_eipjP12Eipdebuginfo+0x174>
f010cff5:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
f010cff9:	0f 85 ef 00 00 00    	jne    f010d0ee <_Z13debuginfo_eipjP12Eipdebuginfo+0x174>
	// 'eip'.  First, we find the basic source file containing 'eip'.
	// Then, we look in that source file for the function.  Then we look
	// for the line number.
	
	// Search the entire set of stabs for the source file (type N_SO).
	lfile = 0;
f010cfff:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	rfile = (stab_end - stabs) - 1;
f010d006:	2b 45 d0             	sub    -0x30(%ebp),%eax
f010d009:	c1 f8 02             	sar    $0x2,%eax
f010d00c:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
f010d012:	83 e8 01             	sub    $0x1,%eax
f010d015:	89 45 e0             	mov    %eax,-0x20(%ebp)
	stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
f010d018:	8d 4d e0             	lea    -0x20(%ebp),%ecx
f010d01b:	8d 55 e4             	lea    -0x1c(%ebp),%edx
f010d01e:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010d022:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
f010d029:	8b 45 d0             	mov    -0x30(%ebp),%eax
f010d02c:	e8 2f fe ff ff       	call   f010ce60 <_ZL14stab_binsearchPK4StabPiS2_ij>
	if (lfile == 0)
f010d031:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010d034:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f010d039:	85 d2                	test   %edx,%edx
f010d03b:	0f 84 b9 00 00 00    	je     f010d0fa <_Z13debuginfo_eipjP12Eipdebuginfo+0x180>
		return -1;

	// Search within that file's stabs for the function definition
	// (N_FUN).
	lfun = lfile;
f010d041:	89 55 dc             	mov    %edx,-0x24(%ebp)
	rfun = rfile;
f010d044:	8b 45 e0             	mov    -0x20(%ebp),%eax
f010d047:	89 45 d8             	mov    %eax,-0x28(%ebp)
	stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
f010d04a:	8d 4d d8             	lea    -0x28(%ebp),%ecx
f010d04d:	8d 55 dc             	lea    -0x24(%ebp),%edx
f010d050:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010d054:	c7 04 24 24 00 00 00 	movl   $0x24,(%esp)
f010d05b:	8b 45 d0             	mov    -0x30(%ebp),%eax
f010d05e:	e8 fd fd ff ff       	call   f010ce60 <_ZL14stab_binsearchPK4StabPiS2_ij>

	if (lfun <= rfun) {
f010d063:	8b 45 dc             	mov    -0x24(%ebp),%eax
f010d066:	3b 45 d8             	cmp    -0x28(%ebp),%eax
f010d069:	7f 2a                	jg     f010d095 <_Z13debuginfo_eipjP12Eipdebuginfo+0x11b>
		// stabs[lfun] points to the function name
		// in the string table, but check bounds just in case.
		if (stabs[lfun].n_strx < (uint32_t) (stabstr_end - stabstr))
f010d06b:	6b c0 0c             	imul   $0xc,%eax,%eax
f010d06e:	8b 55 d0             	mov    -0x30(%ebp),%edx
f010d071:	8b 04 10             	mov    (%eax,%edx,1),%eax
f010d074:	89 f2                	mov    %esi,%edx
f010d076:	2b 55 d4             	sub    -0x2c(%ebp),%edx
f010d079:	39 d0                	cmp    %edx,%eax
f010d07b:	73 06                	jae    f010d083 <_Z13debuginfo_eipjP12Eipdebuginfo+0x109>
			info->eip_fn_name = stabstr + stabs[lfun].n_strx;
f010d07d:	03 45 d4             	add    -0x2c(%ebp),%eax
f010d080:	89 43 08             	mov    %eax,0x8(%ebx)
		info->eip_fn_addr = stabs[lfun].n_value;
f010d083:	8b 7d dc             	mov    -0x24(%ebp),%edi
f010d086:	6b c7 0c             	imul   $0xc,%edi,%eax
f010d089:	8b 4d d0             	mov    -0x30(%ebp),%ecx
f010d08c:	8b 44 08 08          	mov    0x8(%eax,%ecx,1),%eax
f010d090:	89 43 10             	mov    %eax,0x10(%ebx)
f010d093:	eb 06                	jmp    f010d09b <_Z13debuginfo_eipjP12Eipdebuginfo+0x121>
		lline = lfun;
		rline = rfun;
	} else {
		// Couldn't find function stab!  Maybe we're in an assembly
		// file.  Search the whole file for the line number.
		info->eip_fn_addr = addr;
f010d095:	89 7b 10             	mov    %edi,0x10(%ebx)
		lline = lfile;
f010d098:	8b 7d e4             	mov    -0x1c(%ebp),%edi
		rline = rfile;
	}
	// Ignore stuff after the colon.
	info->eip_fn_namelen =
		strfind(info->eip_fn_name, ':') - info->eip_fn_name;
f010d09b:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
f010d0a2:	00 
f010d0a3:	8b 43 08             	mov    0x8(%ebx),%eax
f010d0a6:	89 04 24             	mov    %eax,(%esp)
f010d0a9:	e8 95 08 00 00       	call   f010d943 <strfind>
f010d0ae:	2b 43 08             	sub    0x8(%ebx),%eax
f010d0b1:	89 43 0c             	mov    %eax,0xc(%ebx)
	// Search backwards from the line number for the relevant filename
	// stab.
	// We can't just use the "lfile" stab because inlined functions
	// can interpolate code from a different file!
	// Such included source files use the N_SOL stab type.
	while (lline >= lfile
f010d0b4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f010d0b7:	6b c7 0c             	imul   $0xc,%edi,%eax
f010d0ba:	8b 55 d0             	mov    -0x30(%ebp),%edx
f010d0bd:	8d 44 02 08          	lea    0x8(%edx,%eax,1),%eax
f010d0c1:	39 cf                	cmp    %ecx,%edi
f010d0c3:	7c 30                	jl     f010d0f5 <_Z13debuginfo_eipjP12Eipdebuginfo+0x17b>
f010d0c5:	0f b6 50 fc          	movzbl -0x4(%eax),%edx
f010d0c9:	80 fa 84             	cmp    $0x84,%dl
f010d0cc:	74 39                	je     f010d107 <_Z13debuginfo_eipjP12Eipdebuginfo+0x18d>
f010d0ce:	80 fa 64             	cmp    $0x64,%dl
f010d0d1:	75 05                	jne    f010d0d8 <_Z13debuginfo_eipjP12Eipdebuginfo+0x15e>
f010d0d3:	83 38 00             	cmpl   $0x0,(%eax)
f010d0d6:	75 2f                	jne    f010d107 <_Z13debuginfo_eipjP12Eipdebuginfo+0x18d>
	       && stabs[lline].n_type != N_SOL
	       && (stabs[lline].n_type != N_SO || !stabs[lline].n_value))
		lline--;
f010d0d8:	83 ef 01             	sub    $0x1,%edi
f010d0db:	83 e8 0c             	sub    $0xc,%eax
f010d0de:	66 90                	xchg   %ax,%ax
f010d0e0:	eb df                	jmp    f010d0c1 <_Z13debuginfo_eipjP12Eipdebuginfo+0x147>
	if (lline >= lfile
	    && stabs[lline].n_strx < (uint32_t) (stabstr_end - stabstr))
		info->eip_file = stabstr + stabs[lline].n_strx;
f010d0e2:	03 45 d4             	add    -0x2c(%ebp),%eax
f010d0e5:	89 03                	mov    %eax,(%ebx)
f010d0e7:	b8 00 00 00 00       	mov    $0x0,%eax
f010d0ec:	eb 0c                	jmp    f010d0fa <_Z13debuginfo_eipjP12Eipdebuginfo+0x180>
f010d0ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f010d0f3:	eb 05                	jmp    f010d0fa <_Z13debuginfo_eipjP12Eipdebuginfo+0x180>
f010d0f5:	b8 00 00 00 00       	mov    $0x0,%eax
	// or 0 if there was no containing function.
	// Your code here.

	
	return 0;
}
f010d0fa:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f010d0fd:	8b 75 f8             	mov    -0x8(%ebp),%esi
f010d100:	8b 7d fc             	mov    -0x4(%ebp),%edi
f010d103:	89 ec                	mov    %ebp,%esp
f010d105:	5d                   	pop    %ebp
f010d106:	c3                   	ret    
	// Such included source files use the N_SOL stab type.
	while (lline >= lfile
	       && stabs[lline].n_type != N_SOL
	       && (stabs[lline].n_type != N_SO || !stabs[lline].n_value))
		lline--;
	if (lline >= lfile
f010d107:	6b ff 0c             	imul   $0xc,%edi,%edi
f010d10a:	8b 4d d0             	mov    -0x30(%ebp),%ecx
f010d10d:	8b 04 0f             	mov    (%edi,%ecx,1),%eax
f010d110:	2b 75 d4             	sub    -0x2c(%ebp),%esi
f010d113:	39 f0                	cmp    %esi,%eax
f010d115:	72 cb                	jb     f010d0e2 <_Z13debuginfo_eipjP12Eipdebuginfo+0x168>
f010d117:	eb dc                	jmp    f010d0f5 <_Z13debuginfo_eipjP12Eipdebuginfo+0x17b>
f010d119:	00 00                	add    %al,(%eax)
f010d11b:	00 00                	add    %al,(%eax)
f010d11d:	00 00                	add    %al,(%eax)
	...

f010d120 <_ZL8printnumPFviPvES_yjii>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
f010d120:	55                   	push   %ebp
f010d121:	89 e5                	mov    %esp,%ebp
f010d123:	57                   	push   %edi
f010d124:	56                   	push   %esi
f010d125:	53                   	push   %ebx
f010d126:	83 ec 4c             	sub    $0x4c,%esp
f010d129:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010d12c:	89 d6                	mov    %edx,%esi
f010d12e:	8b 45 08             	mov    0x8(%ebp),%eax
f010d131:	89 45 d8             	mov    %eax,-0x28(%ebp)
f010d134:	8b 55 0c             	mov    0xc(%ebp),%edx
f010d137:	89 55 e0             	mov    %edx,-0x20(%ebp)
f010d13a:	8b 45 10             	mov    0x10(%ebp),%eax
f010d13d:	8b 5d 14             	mov    0x14(%ebp),%ebx
f010d140:	8b 7d 18             	mov    0x18(%ebp),%edi
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
f010d143:	89 45 dc             	mov    %eax,-0x24(%ebp)
f010d146:	b9 00 00 00 00       	mov    $0x0,%ecx
f010d14b:	39 d1                	cmp    %edx,%ecx
f010d14d:	72 15                	jb     f010d164 <_ZL8printnumPFviPvES_yjii+0x44>
f010d14f:	77 07                	ja     f010d158 <_ZL8printnumPFviPvES_yjii+0x38>
f010d151:	8b 55 d8             	mov    -0x28(%ebp),%edx
f010d154:	39 d0                	cmp    %edx,%eax
f010d156:	76 0c                	jbe    f010d164 <_ZL8printnumPFviPvES_yjii+0x44>
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
f010d158:	83 eb 01             	sub    $0x1,%ebx
f010d15b:	85 db                	test   %ebx,%ebx
f010d15d:	8d 76 00             	lea    0x0(%esi),%esi
f010d160:	7f 61                	jg     f010d1c3 <_ZL8printnumPFviPvES_yjii+0xa3>
f010d162:	eb 70                	jmp    f010d1d4 <_ZL8printnumPFviPvES_yjii+0xb4>
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
f010d164:	89 7c 24 10          	mov    %edi,0x10(%esp)
f010d168:	83 eb 01             	sub    $0x1,%ebx
f010d16b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
f010d16f:	89 44 24 08          	mov    %eax,0x8(%esp)
f010d173:	8b 4c 24 08          	mov    0x8(%esp),%ecx
f010d177:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
f010d17b:	89 4d d0             	mov    %ecx,-0x30(%ebp)
f010d17e:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
f010d181:	8b 5d dc             	mov    -0x24(%ebp),%ebx
f010d184:	89 5c 24 08          	mov    %ebx,0x8(%esp)
f010d188:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010d18f:	00 
f010d190:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010d193:	89 04 24             	mov    %eax,(%esp)
f010d196:	8b 55 e0             	mov    -0x20(%ebp),%edx
f010d199:	89 54 24 04          	mov    %edx,0x4(%esp)
f010d19d:	e8 de 09 00 00       	call   f010db80 <__udivdi3>
f010d1a2:	8b 4d d0             	mov    -0x30(%ebp),%ecx
f010d1a5:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
f010d1a8:	89 4c 24 08          	mov    %ecx,0x8(%esp)
f010d1ac:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
f010d1b0:	89 04 24             	mov    %eax,(%esp)
f010d1b3:	89 54 24 04          	mov    %edx,0x4(%esp)
f010d1b7:	89 f2                	mov    %esi,%edx
f010d1b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f010d1bc:	e8 5f ff ff ff       	call   f010d120 <_ZL8printnumPFviPvES_yjii>
f010d1c1:	eb 11                	jmp    f010d1d4 <_ZL8printnumPFviPvES_yjii+0xb4>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
f010d1c3:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d1c7:	89 3c 24             	mov    %edi,(%esp)
f010d1ca:	ff 55 e4             	call   *-0x1c(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
f010d1cd:	83 eb 01             	sub    $0x1,%ebx
f010d1d0:	85 db                	test   %ebx,%ebx
f010d1d2:	7f ef                	jg     f010d1c3 <_ZL8printnumPFviPvES_yjii+0xa3>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
f010d1d4:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d1d8:	8b 74 24 04          	mov    0x4(%esp),%esi
f010d1dc:	8b 45 dc             	mov    -0x24(%ebp),%eax
f010d1df:	89 44 24 08          	mov    %eax,0x8(%esp)
f010d1e3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010d1ea:	00 
f010d1eb:	8b 55 d8             	mov    -0x28(%ebp),%edx
f010d1ee:	89 14 24             	mov    %edx,(%esp)
f010d1f1:	8b 4d e0             	mov    -0x20(%ebp),%ecx
f010d1f4:	89 4c 24 04          	mov    %ecx,0x4(%esp)
f010d1f8:	e8 c3 0a 00 00       	call   f010dcc0 <__umoddi3>
f010d1fd:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d201:	0f be 80 4a f3 10 f0 	movsbl -0xfef0cb6(%eax),%eax
f010d208:	89 04 24             	mov    %eax,(%esp)
f010d20b:	ff 55 e4             	call   *-0x1c(%ebp)
}
f010d20e:	83 c4 4c             	add    $0x4c,%esp
f010d211:	5b                   	pop    %ebx
f010d212:	5e                   	pop    %esi
f010d213:	5f                   	pop    %edi
f010d214:	5d                   	pop    %ebp
f010d215:	c3                   	ret    

f010d216 <_ZL7getuintPPci>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
f010d216:	55                   	push   %ebp
f010d217:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
f010d219:	83 fa 01             	cmp    $0x1,%edx
f010d21c:	7e 0f                	jle    f010d22d <_ZL7getuintPPci+0x17>
		return va_arg(*ap, unsigned long long);
f010d21e:	8b 10                	mov    (%eax),%edx
f010d220:	83 c2 08             	add    $0x8,%edx
f010d223:	89 10                	mov    %edx,(%eax)
f010d225:	8b 42 f8             	mov    -0x8(%edx),%eax
f010d228:	8b 52 fc             	mov    -0x4(%edx),%edx
f010d22b:	eb 24                	jmp    f010d251 <_ZL7getuintPPci+0x3b>
	else if (lflag)
f010d22d:	85 d2                	test   %edx,%edx
f010d22f:	74 11                	je     f010d242 <_ZL7getuintPPci+0x2c>
		return va_arg(*ap, unsigned long);
f010d231:	8b 10                	mov    (%eax),%edx
f010d233:	83 c2 04             	add    $0x4,%edx
f010d236:	89 10                	mov    %edx,(%eax)
f010d238:	8b 42 fc             	mov    -0x4(%edx),%eax
f010d23b:	ba 00 00 00 00       	mov    $0x0,%edx
f010d240:	eb 0f                	jmp    f010d251 <_ZL7getuintPPci+0x3b>
	else
		return va_arg(*ap, unsigned int);
f010d242:	8b 10                	mov    (%eax),%edx
f010d244:	83 c2 04             	add    $0x4,%edx
f010d247:	89 10                	mov    %edx,(%eax)
f010d249:	8b 42 fc             	mov    -0x4(%edx),%eax
f010d24c:	ba 00 00 00 00       	mov    $0x0,%edx
}
f010d251:	5d                   	pop    %ebp
f010d252:	c3                   	ret    

f010d253 <_ZL11sprintputchiPv>:
	int cnt;
};

static void
sprintputch(int ch, void *thunk)
{
f010d253:	55                   	push   %ebp
f010d254:	89 e5                	mov    %esp,%ebp
	struct sprintbuf *b = (struct sprintbuf *) thunk;
f010d256:	8b 45 0c             	mov    0xc(%ebp),%eax
	b->cnt++;
f010d259:	83 40 08 01          	addl   $0x1,0x8(%eax)
	if (b->buf < b->ebuf)
f010d25d:	8b 10                	mov    (%eax),%edx
f010d25f:	3b 50 04             	cmp    0x4(%eax),%edx
f010d262:	73 0a                	jae    f010d26e <_ZL11sprintputchiPv+0x1b>
		*b->buf++ = ch;
f010d264:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010d267:	88 0a                	mov    %cl,(%edx)
f010d269:	83 c2 01             	add    $0x1,%edx
f010d26c:	89 10                	mov    %edx,(%eax)
}
f010d26e:	5d                   	pop    %ebp
f010d26f:	c3                   	ret    

f010d270 <_Z9vprintfmtPFviPvES_PKcPc>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
f010d270:	55                   	push   %ebp
f010d271:	89 e5                	mov    %esp,%ebp
f010d273:	57                   	push   %edi
f010d274:	56                   	push   %esi
f010d275:	53                   	push   %ebx
f010d276:	83 ec 5c             	sub    $0x5c,%esp
f010d279:	8b 7d 08             	mov    0x8(%ebp),%edi
f010d27c:	8b 75 0c             	mov    0xc(%ebp),%esi
f010d27f:	8b 5d 10             	mov    0x10(%ebp),%ebx
		case '#':
			altflag = 1;
			goto reswitch;

		process_precision:
			if (width < 0)
f010d282:	c7 45 c4 ff ff ff ff 	movl   $0xffffffff,-0x3c(%ebp)
f010d289:	eb 03                	jmp    f010d28e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
f010d28b:	8b 5d cc             	mov    -0x34(%ebp),%ebx
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
f010d28e:	0f b6 03             	movzbl (%ebx),%eax
f010d291:	83 c3 01             	add    $0x1,%ebx
f010d294:	83 f8 25             	cmp    $0x25,%eax
f010d297:	74 29                	je     f010d2c2 <_Z9vprintfmtPFviPvES_PKcPc+0x52>
			if (ch == '\0')
f010d299:	85 c0                	test   %eax,%eax
f010d29b:	75 11                	jne    f010d2ae <_Z9vprintfmtPFviPvES_PKcPc+0x3e>
f010d29d:	e9 c6 03 00 00       	jmp    f010d668 <_Z9vprintfmtPFviPvES_PKcPc+0x3f8>
f010d2a2:	85 c0                	test   %eax,%eax
f010d2a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010d2a8:	0f 84 ba 03 00 00    	je     f010d668 <_Z9vprintfmtPFviPvES_PKcPc+0x3f8>
				return;
			putch(ch, putdat);
f010d2ae:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d2b2:	89 04 24             	mov    %eax,(%esp)
f010d2b5:	ff d7                	call   *%edi
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
f010d2b7:	0f b6 03             	movzbl (%ebx),%eax
f010d2ba:	83 c3 01             	add    $0x1,%ebx
f010d2bd:	83 f8 25             	cmp    $0x25,%eax
f010d2c0:	75 e0                	jne    f010d2a2 <_Z9vprintfmtPFviPvES_PKcPc+0x32>
f010d2c2:	c6 45 d4 20          	movb   $0x20,-0x2c(%ebp)
f010d2c6:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
f010d2cd:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
f010d2d4:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
f010d2db:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
f010d2e2:	eb 06                	jmp    f010d2ea <_Z9vprintfmtPFviPvES_PKcPc+0x7a>
f010d2e4:	c6 45 d4 2d          	movb   $0x2d,-0x2c(%ebp)
f010d2e8:	89 c3                	mov    %eax,%ebx
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
f010d2ea:	0f b6 0b             	movzbl (%ebx),%ecx
f010d2ed:	0f b6 d1             	movzbl %cl,%edx
f010d2f0:	8d 43 01             	lea    0x1(%ebx),%eax
f010d2f3:	83 e9 23             	sub    $0x23,%ecx
f010d2f6:	80 f9 55             	cmp    $0x55,%cl
f010d2f9:	0f 87 2c 03 00 00    	ja     f010d62b <_Z9vprintfmtPFviPvES_PKcPc+0x3bb>
f010d2ff:	0f b6 c9             	movzbl %cl,%ecx
f010d302:	ff 24 8d d4 f3 10 f0 	jmp    *-0xfef0c2c(,%ecx,4)
f010d309:	c6 45 d4 30          	movb   $0x30,-0x2c(%ebp)
f010d30d:	eb d9                	jmp    f010d2e8 <_Z9vprintfmtPFviPvES_PKcPc+0x78>
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
				precision = precision * 10 + ch - '0';
f010d30f:	83 ea 30             	sub    $0x30,%edx
f010d312:	89 55 d8             	mov    %edx,-0x28(%ebp)
				ch = *fmt;
f010d315:	0f be 10             	movsbl (%eax),%edx
				if (ch < '0' || ch > '9')
f010d318:	8d 4a d0             	lea    -0x30(%edx),%ecx
f010d31b:	83 f9 09             	cmp    $0x9,%ecx
f010d31e:	77 44                	ja     f010d364 <_Z9vprintfmtPFviPvES_PKcPc+0xf4>
f010d320:	8b 4d d8             	mov    -0x28(%ebp),%ecx
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
f010d323:	83 c0 01             	add    $0x1,%eax
				precision = precision * 10 + ch - '0';
f010d326:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
f010d329:	8d 4c 4a d0          	lea    -0x30(%edx,%ecx,2),%ecx
				ch = *fmt;
f010d32d:	0f be 10             	movsbl (%eax),%edx
				if (ch < '0' || ch > '9')
f010d330:	8d 5a d0             	lea    -0x30(%edx),%ebx
f010d333:	83 fb 09             	cmp    $0x9,%ebx
f010d336:	76 eb                	jbe    f010d323 <_Z9vprintfmtPFviPvES_PKcPc+0xb3>
f010d338:	89 4d d8             	mov    %ecx,-0x28(%ebp)
f010d33b:	eb 27                	jmp    f010d364 <_Z9vprintfmtPFviPvES_PKcPc+0xf4>
					break;
			}
			goto process_precision;

		case '*':
			precision = va_arg(ap, int);
f010d33d:	8b 55 14             	mov    0x14(%ebp),%edx
f010d340:	83 c2 04             	add    $0x4,%edx
f010d343:	89 55 14             	mov    %edx,0x14(%ebp)
f010d346:	8b 52 fc             	mov    -0x4(%edx),%edx
f010d349:	89 55 d8             	mov    %edx,-0x28(%ebp)
			goto process_precision;
f010d34c:	eb 16                	jmp    f010d364 <_Z9vprintfmtPFviPvES_PKcPc+0xf4>

		case '.':
			if (width < 0)
f010d34e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010d351:	c1 fa 1f             	sar    $0x1f,%edx
f010d354:	f7 d2                	not    %edx
f010d356:	21 55 e4             	and    %edx,-0x1c(%ebp)
f010d359:	eb 8d                	jmp    f010d2e8 <_Z9vprintfmtPFviPvES_PKcPc+0x78>
f010d35b:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
				width = 0;
			goto reswitch;

		case '#':
			altflag = 1;
			goto reswitch;
f010d362:	eb 84                	jmp    f010d2e8 <_Z9vprintfmtPFviPvES_PKcPc+0x78>

		process_precision:
			if (width < 0)
f010d364:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
f010d368:	0f 89 7a ff ff ff    	jns    f010d2e8 <_Z9vprintfmtPFviPvES_PKcPc+0x78>
f010d36e:	8b 55 d8             	mov    -0x28(%ebp),%edx
f010d371:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f010d374:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
f010d377:	89 4d d8             	mov    %ecx,-0x28(%ebp)
f010d37a:	e9 69 ff ff ff       	jmp    f010d2e8 <_Z9vprintfmtPFviPvES_PKcPc+0x78>
				width = precision, precision = -1;
			goto reswitch;

		// long flag (doubled for long long)
		case 'l':
			lflag++;
f010d37f:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
			goto reswitch;
f010d383:	e9 60 ff ff ff       	jmp    f010d2e8 <_Z9vprintfmtPFviPvES_PKcPc+0x78>
f010d388:	89 45 cc             	mov    %eax,-0x34(%ebp)

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
f010d38b:	8b 45 14             	mov    0x14(%ebp),%eax
f010d38e:	83 c0 04             	add    $0x4,%eax
f010d391:	89 45 14             	mov    %eax,0x14(%ebp)
f010d394:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d398:	8b 40 fc             	mov    -0x4(%eax),%eax
f010d39b:	89 04 24             	mov    %eax,(%esp)
f010d39e:	ff d7                	call   *%edi
f010d3a0:	8b 5d cc             	mov    -0x34(%ebp),%ebx
			break;
f010d3a3:	e9 e6 fe ff ff       	jmp    f010d28e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
f010d3a8:	89 45 cc             	mov    %eax,-0x34(%ebp)

		// error message
		case 'e':
			err = va_arg(ap, int);
f010d3ab:	8b 45 14             	mov    0x14(%ebp),%eax
f010d3ae:	83 c0 04             	add    $0x4,%eax
f010d3b1:	89 45 14             	mov    %eax,0x14(%ebp)
f010d3b4:	8b 40 fc             	mov    -0x4(%eax),%eax
f010d3b7:	89 c2                	mov    %eax,%edx
f010d3b9:	c1 fa 1f             	sar    $0x1f,%edx
f010d3bc:	31 d0                	xor    %edx,%eax
f010d3be:	29 d0                	sub    %edx,%eax
			if (err < 0)
				err = -err;
			if (err > MAXERROR || (p = error_string[err]) == NULL)
f010d3c0:	83 f8 06             	cmp    $0x6,%eax
f010d3c3:	7f 0f                	jg     f010d3d4 <_Z9vprintfmtPFviPvES_PKcPc+0x164>
f010d3c5:	8b 14 85 2c f5 10 f0 	mov    -0xfef0ad4(,%eax,4),%edx
f010d3cc:	85 d2                	test   %edx,%edx
f010d3ce:	0f 85 74 02 00 00    	jne    f010d648 <_Z9vprintfmtPFviPvES_PKcPc+0x3d8>
				printfmt(putch, putdat, "error %d", err);
f010d3d4:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010d3d8:	c7 44 24 08 5b f3 10 	movl   $0xf010f35b,0x8(%esp)
f010d3df:	f0 
f010d3e0:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d3e4:	89 3c 24             	mov    %edi,(%esp)
f010d3e7:	e8 04 03 00 00       	call   f010d6f0 <_Z8printfmtPFviPvES_PKcz>
f010d3ec:	8b 5d cc             	mov    -0x34(%ebp),%ebx
f010d3ef:	e9 9a fe ff ff       	jmp    f010d28e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
f010d3f4:	89 45 cc             	mov    %eax,-0x34(%ebp)
f010d3f7:	8b 55 d8             	mov    -0x28(%ebp),%edx
f010d3fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f010d3fd:	89 45 d0             	mov    %eax,-0x30(%ebp)
				printfmt(putch, putdat, "%s", p);
			break;

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
f010d400:	8b 45 14             	mov    0x14(%ebp),%eax
f010d403:	83 c0 04             	add    $0x4,%eax
f010d406:	89 45 14             	mov    %eax,0x14(%ebp)
f010d409:	8b 58 fc             	mov    -0x4(%eax),%ebx
f010d40c:	85 db                	test   %ebx,%ebx
f010d40e:	75 05                	jne    f010d415 <_Z9vprintfmtPFviPvES_PKcPc+0x1a5>
f010d410:	bb 64 f3 10 f0       	mov    $0xf010f364,%ebx
				p = "(null)";
			if (width > 0 && padc != '-')
f010d415:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
f010d419:	7e 6d                	jle    f010d488 <_Z9vprintfmtPFviPvES_PKcPc+0x218>
f010d41b:	80 7d d4 2d          	cmpb   $0x2d,-0x2c(%ebp)
f010d41f:	74 67                	je     f010d488 <_Z9vprintfmtPFviPvES_PKcPc+0x218>
				for (width -= strnlen(p, precision); width > 0; width--)
f010d421:	89 54 24 04          	mov    %edx,0x4(%esp)
f010d425:	89 1c 24             	mov    %ebx,(%esp)
f010d428:	e8 de 03 00 00       	call   f010d80b <strnlen>
f010d42d:	8b 55 d0             	mov    -0x30(%ebp),%edx
f010d430:	29 c2                	sub    %eax,%edx
f010d432:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f010d435:	85 d2                	test   %edx,%edx
f010d437:	7e 4f                	jle    f010d488 <_Z9vprintfmtPFviPvES_PKcPc+0x218>
					putch(padc, putdat);
f010d439:	0f be 4d d4          	movsbl -0x2c(%ebp),%ecx
f010d43d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
f010d440:	89 5d d0             	mov    %ebx,-0x30(%ebp)
f010d443:	89 d3                	mov    %edx,%ebx
f010d445:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d449:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f010d44c:	89 04 24             	mov    %eax,(%esp)
f010d44f:	ff d7                	call   *%edi
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
f010d451:	83 eb 01             	sub    $0x1,%ebx
f010d454:	85 db                	test   %ebx,%ebx
f010d456:	7f ed                	jg     f010d445 <_Z9vprintfmtPFviPvES_PKcPc+0x1d5>
f010d458:	8b 5d d0             	mov    -0x30(%ebp),%ebx
f010d45b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
f010d462:	eb 24                	jmp    f010d488 <_Z9vprintfmtPFviPvES_PKcPc+0x218>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
f010d464:	8d 50 e0             	lea    -0x20(%eax),%edx
f010d467:	83 fa 5e             	cmp    $0x5e,%edx
f010d46a:	76 0f                	jbe    f010d47b <_Z9vprintfmtPFviPvES_PKcPc+0x20b>
					putch('?', putdat);
f010d46c:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d470:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
f010d477:	ff d7                	call   *%edi
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
f010d479:	eb 09                	jmp    f010d484 <_Z9vprintfmtPFviPvES_PKcPc+0x214>
					putch('?', putdat);
				else
					putch(ch, putdat);
f010d47b:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d47f:	89 04 24             	mov    %eax,(%esp)
f010d482:	ff d7                	call   *%edi
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
f010d484:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
f010d488:	0f be 03             	movsbl (%ebx),%eax
f010d48b:	83 c3 01             	add    $0x1,%ebx
f010d48e:	85 c0                	test   %eax,%eax
f010d490:	74 18                	je     f010d4aa <_Z9vprintfmtPFviPvES_PKcPc+0x23a>
f010d492:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
f010d496:	78 06                	js     f010d49e <_Z9vprintfmtPFviPvES_PKcPc+0x22e>
f010d498:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
f010d49c:	78 0c                	js     f010d4aa <_Z9vprintfmtPFviPvES_PKcPc+0x23a>
				if (altflag && (ch < ' ' || ch > '~'))
f010d49e:	83 7d c8 00          	cmpl   $0x0,-0x38(%ebp)
f010d4a2:	75 c0                	jne    f010d464 <_Z9vprintfmtPFviPvES_PKcPc+0x1f4>
f010d4a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010d4a8:	eb d1                	jmp    f010d47b <_Z9vprintfmtPFviPvES_PKcPc+0x20b>
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
f010d4aa:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
f010d4ae:	66 90                	xchg   %ax,%ax
f010d4b0:	0f 8e d5 fd ff ff    	jle    f010d28b <_Z9vprintfmtPFviPvES_PKcPc+0x1b>
f010d4b6:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
				putch(' ', putdat);
f010d4b9:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d4bd:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
f010d4c4:	ff d7                	call   *%edi
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
f010d4c6:	83 eb 01             	sub    $0x1,%ebx
f010d4c9:	85 db                	test   %ebx,%ebx
f010d4cb:	7f ec                	jg     f010d4b9 <_Z9vprintfmtPFviPvES_PKcPc+0x249>
f010d4cd:	e9 b9 fd ff ff       	jmp    f010d28b <_Z9vprintfmtPFviPvES_PKcPc+0x1b>
f010d4d2:	89 45 cc             	mov    %eax,-0x34(%ebp)
// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
	if (lflag >= 2)
f010d4d5:	83 7d d0 01          	cmpl   $0x1,-0x30(%ebp)
f010d4d9:	7e 17                	jle    f010d4f2 <_Z9vprintfmtPFviPvES_PKcPc+0x282>
		return va_arg(*ap, long long);
f010d4db:	8b 45 14             	mov    0x14(%ebp),%eax
f010d4de:	83 c0 08             	add    $0x8,%eax
f010d4e1:	89 45 14             	mov    %eax,0x14(%ebp)
f010d4e4:	8b 50 f8             	mov    -0x8(%eax),%edx
f010d4e7:	8b 48 fc             	mov    -0x4(%eax),%ecx
f010d4ea:	89 55 d8             	mov    %edx,-0x28(%ebp)
f010d4ed:	89 4d dc             	mov    %ecx,-0x24(%ebp)
f010d4f0:	eb 36                	jmp    f010d528 <_Z9vprintfmtPFviPvES_PKcPc+0x2b8>
	else if (lflag)
f010d4f2:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
f010d4f6:	74 19                	je     f010d511 <_Z9vprintfmtPFviPvES_PKcPc+0x2a1>
		return va_arg(*ap, long);
f010d4f8:	8b 45 14             	mov    0x14(%ebp),%eax
f010d4fb:	83 c0 04             	add    $0x4,%eax
f010d4fe:	89 45 14             	mov    %eax,0x14(%ebp)
f010d501:	8b 40 fc             	mov    -0x4(%eax),%eax
f010d504:	89 45 d8             	mov    %eax,-0x28(%ebp)
f010d507:	89 c1                	mov    %eax,%ecx
f010d509:	c1 f9 1f             	sar    $0x1f,%ecx
f010d50c:	89 4d dc             	mov    %ecx,-0x24(%ebp)
f010d50f:	eb 17                	jmp    f010d528 <_Z9vprintfmtPFviPvES_PKcPc+0x2b8>
	else
		return va_arg(*ap, int);
f010d511:	8b 45 14             	mov    0x14(%ebp),%eax
f010d514:	83 c0 04             	add    $0x4,%eax
f010d517:	89 45 14             	mov    %eax,0x14(%ebp)
f010d51a:	8b 40 fc             	mov    -0x4(%eax),%eax
f010d51d:	89 45 d8             	mov    %eax,-0x28(%ebp)
f010d520:	89 c2                	mov    %eax,%edx
f010d522:	c1 fa 1f             	sar    $0x1f,%edx
f010d525:	89 55 dc             	mov    %edx,-0x24(%ebp)
				putch(' ', putdat);
			break;

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
f010d528:	8b 4d d8             	mov    -0x28(%ebp),%ecx
f010d52b:	8b 5d dc             	mov    -0x24(%ebp),%ebx
f010d52e:	b8 0a 00 00 00       	mov    $0xa,%eax
			if ((long long) num < 0) {
f010d533:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
f010d537:	0f 89 af 00 00 00    	jns    f010d5ec <_Z9vprintfmtPFviPvES_PKcPc+0x37c>
				putch('-', putdat);
f010d53d:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d541:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
f010d548:	ff d7                	call   *%edi
				num = -(long long) num;
f010d54a:	8b 4d d8             	mov    -0x28(%ebp),%ecx
f010d54d:	8b 5d dc             	mov    -0x24(%ebp),%ebx
f010d550:	f7 d9                	neg    %ecx
f010d552:	83 d3 00             	adc    $0x0,%ebx
f010d555:	f7 db                	neg    %ebx
f010d557:	b8 0a 00 00 00       	mov    $0xa,%eax
f010d55c:	e9 8b 00 00 00       	jmp    f010d5ec <_Z9vprintfmtPFviPvES_PKcPc+0x37c>
f010d561:	89 45 cc             	mov    %eax,-0x34(%ebp)
			base = 10;
			goto number;

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
f010d564:	8b 55 d0             	mov    -0x30(%ebp),%edx
f010d567:	8d 45 14             	lea    0x14(%ebp),%eax
f010d56a:	e8 a7 fc ff ff       	call   f010d216 <_ZL7getuintPPci>
f010d56f:	89 c1                	mov    %eax,%ecx
f010d571:	89 d3                	mov    %edx,%ebx
f010d573:	b8 0a 00 00 00       	mov    $0xa,%eax
			base = 10;
			goto number;
f010d578:	eb 72                	jmp    f010d5ec <_Z9vprintfmtPFviPvES_PKcPc+0x37c>
f010d57a:	89 45 cc             	mov    %eax,-0x34(%ebp)
		case 'o':
			// Replace this with your code.
			//putch('X', putdat);
			//putch('X', putdat);
			//putch('X', putdat);
			putch('0', putdat);
f010d57d:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d581:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
f010d588:	ff d7                	call   *%edi
			num = getuint(&ap, lflag);
f010d58a:	8b 55 d0             	mov    -0x30(%ebp),%edx
f010d58d:	8d 45 14             	lea    0x14(%ebp),%eax
f010d590:	e8 81 fc ff ff       	call   f010d216 <_ZL7getuintPPci>
f010d595:	89 c1                	mov    %eax,%ecx
f010d597:	89 d3                	mov    %edx,%ebx
f010d599:	b8 08 00 00 00       	mov    $0x8,%eax
			base = 8;
			goto number;
f010d59e:	eb 4c                	jmp    f010d5ec <_Z9vprintfmtPFviPvES_PKcPc+0x37c>
f010d5a0:	89 45 cc             	mov    %eax,-0x34(%ebp)

		// pointer
		case 'p':
			putch('0', putdat);
f010d5a3:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d5a7:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
f010d5ae:	ff d7                	call   *%edi
			putch('x', putdat);
f010d5b0:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d5b4:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
f010d5bb:	ff d7                	call   *%edi
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
f010d5bd:	8b 45 14             	mov    0x14(%ebp),%eax
f010d5c0:	83 c0 04             	add    $0x4,%eax
f010d5c3:	89 45 14             	mov    %eax,0x14(%ebp)
f010d5c6:	8b 48 fc             	mov    -0x4(%eax),%ecx
f010d5c9:	bb 00 00 00 00       	mov    $0x0,%ebx
f010d5ce:	b8 10 00 00 00       	mov    $0x10,%eax
			base = 16;
			goto number;
f010d5d3:	eb 17                	jmp    f010d5ec <_Z9vprintfmtPFviPvES_PKcPc+0x37c>
f010d5d5:	89 45 cc             	mov    %eax,-0x34(%ebp)

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
f010d5d8:	8b 55 d0             	mov    -0x30(%ebp),%edx
f010d5db:	8d 45 14             	lea    0x14(%ebp),%eax
f010d5de:	e8 33 fc ff ff       	call   f010d216 <_ZL7getuintPPci>
f010d5e3:	89 c1                	mov    %eax,%ecx
f010d5e5:	89 d3                	mov    %edx,%ebx
f010d5e7:	b8 10 00 00 00       	mov    $0x10,%eax
			base = 16;
		number:
			printnum(putch, putdat, num, base, width, padc);
f010d5ec:	0f be 55 d4          	movsbl -0x2c(%ebp),%edx
f010d5f0:	89 54 24 10          	mov    %edx,0x10(%esp)
f010d5f4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010d5f7:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010d5fb:	89 44 24 08          	mov    %eax,0x8(%esp)
f010d5ff:	89 0c 24             	mov    %ecx,(%esp)
f010d602:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010d606:	89 f2                	mov    %esi,%edx
f010d608:	89 f8                	mov    %edi,%eax
f010d60a:	e8 11 fb ff ff       	call   f010d120 <_ZL8printnumPFviPvES_yjii>
f010d60f:	8b 5d cc             	mov    -0x34(%ebp),%ebx
			break;
f010d612:	e9 77 fc ff ff       	jmp    f010d28e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
f010d617:	89 45 cc             	mov    %eax,-0x34(%ebp)

		// escaped '%' character
		case '%':
			putch(ch, putdat);
f010d61a:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d61e:	89 14 24             	mov    %edx,(%esp)
f010d621:	ff d7                	call   *%edi
f010d623:	8b 5d cc             	mov    -0x34(%ebp),%ebx
			break;
f010d626:	e9 63 fc ff ff       	jmp    f010d28e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
f010d62b:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d62f:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
f010d636:	ff d7                	call   *%edi
			for (fmt--; fmt[-1] != '%'; fmt--)
f010d638:	8d 43 ff             	lea    -0x1(%ebx),%eax
f010d63b:	80 38 25             	cmpb   $0x25,(%eax)
f010d63e:	0f 84 4a fc ff ff    	je     f010d28e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
f010d644:	89 c3                	mov    %eax,%ebx
f010d646:	eb f0                	jmp    f010d638 <_Z9vprintfmtPFviPvES_PKcPc+0x3c8>
			if (err < 0)
				err = -err;
			if (err > MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
f010d648:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010d64c:	c7 44 24 08 99 eb 10 	movl   $0xf010eb99,0x8(%esp)
f010d653:	f0 
f010d654:	89 74 24 04          	mov    %esi,0x4(%esp)
f010d658:	89 3c 24             	mov    %edi,(%esp)
f010d65b:	e8 90 00 00 00       	call   f010d6f0 <_Z8printfmtPFviPvES_PKcz>
f010d660:	8b 5d cc             	mov    -0x34(%ebp),%ebx
f010d663:	e9 26 fc ff ff       	jmp    f010d28e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
f010d668:	83 c4 5c             	add    $0x5c,%esp
f010d66b:	5b                   	pop    %ebx
f010d66c:	5e                   	pop    %esi
f010d66d:	5f                   	pop    %edi
f010d66e:	5d                   	pop    %ebp
f010d66f:	c3                   	ret    

f010d670 <_Z9vsnprintfPciPKcS_>:
		*b->buf++ = ch;
}

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
f010d670:	55                   	push   %ebp
f010d671:	89 e5                	mov    %esp,%ebp
f010d673:	83 ec 28             	sub    $0x28,%esp
f010d676:	8b 45 08             	mov    0x8(%ebp),%eax
f010d679:	8b 55 0c             	mov    0xc(%ebp),%edx
	struct sprintbuf b = {buf, buf+n-1, 0};

	if (buf == NULL || n < 1)
f010d67c:	85 c0                	test   %eax,%eax
f010d67e:	74 04                	je     f010d684 <_Z9vsnprintfPciPKcS_+0x14>
f010d680:	85 d2                	test   %edx,%edx
f010d682:	7f 07                	jg     f010d68b <_Z9vsnprintfPciPKcS_+0x1b>
f010d684:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f010d689:	eb 3b                	jmp    f010d6c6 <_Z9vsnprintfPciPKcS_+0x56>
}

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
	struct sprintbuf b = {buf, buf+n-1, 0};
f010d68b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
f010d692:	89 45 ec             	mov    %eax,-0x14(%ebp)
f010d695:	8d 44 10 ff          	lea    -0x1(%eax,%edx,1),%eax
f010d699:	89 45 f0             	mov    %eax,-0x10(%ebp)

	if (buf == NULL || n < 1)
		return -E_INVAL;

	// print the string to the buffer
	vprintfmt(sprintputch, &b, fmt, ap);
f010d69c:	8b 45 14             	mov    0x14(%ebp),%eax
f010d69f:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010d6a3:	8b 45 10             	mov    0x10(%ebp),%eax
f010d6a6:	89 44 24 08          	mov    %eax,0x8(%esp)
f010d6aa:	8d 45 ec             	lea    -0x14(%ebp),%eax
f010d6ad:	89 44 24 04          	mov    %eax,0x4(%esp)
f010d6b1:	c7 04 24 53 d2 10 f0 	movl   $0xf010d253,(%esp)
f010d6b8:	e8 b3 fb ff ff       	call   f010d270 <_Z9vprintfmtPFviPvES_PKcPc>

	// null terminate the buffer
	*b.buf = '\0';
f010d6bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
f010d6c0:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
f010d6c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
f010d6c6:	c9                   	leave  
f010d6c7:	c3                   	ret    

f010d6c8 <_Z8snprintfPciPKcz>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
f010d6c8:	55                   	push   %ebp
f010d6c9:	89 e5                	mov    %esp,%ebp
f010d6cb:	83 ec 18             	sub    $0x18,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
	rc = vsnprintf(buf, n, fmt, ap);
f010d6ce:	8d 45 14             	lea    0x14(%ebp),%eax
f010d6d1:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010d6d5:	8b 45 10             	mov    0x10(%ebp),%eax
f010d6d8:	89 44 24 08          	mov    %eax,0x8(%esp)
f010d6dc:	8b 45 0c             	mov    0xc(%ebp),%eax
f010d6df:	89 44 24 04          	mov    %eax,0x4(%esp)
f010d6e3:	8b 45 08             	mov    0x8(%ebp),%eax
f010d6e6:	89 04 24             	mov    %eax,(%esp)
f010d6e9:	e8 82 ff ff ff       	call   f010d670 <_Z9vsnprintfPciPKcS_>
	va_end(ap);

	return rc;
}
f010d6ee:	c9                   	leave  
f010d6ef:	c3                   	ret    

f010d6f0 <_Z8printfmtPFviPvES_PKcz>:
	}
}

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
f010d6f0:	55                   	push   %ebp
f010d6f1:	89 e5                	mov    %esp,%ebp
f010d6f3:	83 ec 18             	sub    $0x18,%esp
	va_list ap;

	va_start(ap, fmt);
	vprintfmt(putch, putdat, fmt, ap);
f010d6f6:	8d 45 14             	lea    0x14(%ebp),%eax
f010d6f9:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010d6fd:	8b 45 10             	mov    0x10(%ebp),%eax
f010d700:	89 44 24 08          	mov    %eax,0x8(%esp)
f010d704:	8b 45 0c             	mov    0xc(%ebp),%eax
f010d707:	89 44 24 04          	mov    %eax,0x4(%esp)
f010d70b:	8b 45 08             	mov    0x8(%ebp),%eax
f010d70e:	89 04 24             	mov    %eax,(%esp)
f010d711:	e8 5a fb ff ff       	call   f010d270 <_Z9vprintfmtPFviPvES_PKcPc>
	va_end(ap);
}
f010d716:	c9                   	leave  
f010d717:	c3                   	ret    
	...

f010d720 <_Z8readlinePKc>:
#define BUFLEN 1024
static char buf[BUFLEN];

char *
readline(const char *prompt)
{
f010d720:	55                   	push   %ebp
f010d721:	89 e5                	mov    %esp,%ebp
f010d723:	57                   	push   %edi
f010d724:	56                   	push   %esi
f010d725:	53                   	push   %ebx
f010d726:	83 ec 1c             	sub    $0x1c,%esp
f010d729:	8b 45 08             	mov    0x8(%ebp),%eax
	int i, c, echoing;

	if (prompt != NULL)
f010d72c:	85 c0                	test   %eax,%eax
f010d72e:	74 10                	je     f010d740 <_Z8readlinePKc+0x20>
		cprintf("%s", prompt);
f010d730:	89 44 24 04          	mov    %eax,0x4(%esp)
f010d734:	c7 04 24 99 eb 10 f0 	movl   $0xf010eb99,(%esp)
f010d73b:	e8 4f ee ff ff       	call   f010c58f <_Z7cprintfPKcz>

	i = 0;
	echoing = (iscons(0) > 0);
f010d740:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f010d747:	e8 31 bb ff ff       	call   f010927d <_Z6isconsi>
f010d74c:	85 c0                	test   %eax,%eax
f010d74e:	0f 9f c0             	setg   %al
f010d751:	0f b6 f8             	movzbl %al,%edi
f010d754:	be 00 00 00 00       	mov    $0x0,%esi
	while (1) {
		c = getchar();
f010d759:	e8 0e bb ff ff       	call   f010926c <_Z7getcharv>
f010d75e:	89 c3                	mov    %eax,%ebx
		if (c < 0) {
f010d760:	85 c0                	test   %eax,%eax
f010d762:	79 17                	jns    f010d77b <_Z8readlinePKc+0x5b>
			cprintf("read error: %e\n", c);
f010d764:	89 44 24 04          	mov    %eax,0x4(%esp)
f010d768:	c7 04 24 48 f5 10 f0 	movl   $0xf010f548,(%esp)
f010d76f:	e8 1b ee ff ff       	call   f010c58f <_Z7cprintfPKcz>
f010d774:	b8 00 00 00 00       	mov    $0x0,%eax
			return NULL;
f010d779:	eb 6b                	jmp    f010d7e6 <_Z8readlinePKc+0xc6>
		} else if (c >= ' ' && i < BUFLEN-1) {
f010d77b:	83 f8 1f             	cmp    $0x1f,%eax
f010d77e:	7e 20                	jle    f010d7a0 <_Z8readlinePKc+0x80>
f010d780:	81 fe fe 03 00 00    	cmp    $0x3fe,%esi
f010d786:	7f 18                	jg     f010d7a0 <_Z8readlinePKc+0x80>
			if (echoing)
f010d788:	85 ff                	test   %edi,%edi
f010d78a:	74 09                	je     f010d795 <_Z8readlinePKc+0x75>
				cputchar(c);
f010d78c:	89 04 24             	mov    %eax,(%esp)
f010d78f:	90                   	nop
f010d790:	e8 bf c0 ff ff       	call   f0109854 <_Z8cputchari>
			buf[i++] = c;
f010d795:	88 9e 40 49 19 f0    	mov    %bl,-0xfe6b6c0(%esi)
f010d79b:	83 c6 01             	add    $0x1,%esi
f010d79e:	eb b9                	jmp    f010d759 <_Z8readlinePKc+0x39>
		} else if (c == '\b' && i > 0) {
f010d7a0:	83 fb 08             	cmp    $0x8,%ebx
f010d7a3:	75 1a                	jne    f010d7bf <_Z8readlinePKc+0x9f>
f010d7a5:	85 f6                	test   %esi,%esi
f010d7a7:	7e 16                	jle    f010d7bf <_Z8readlinePKc+0x9f>
			if (echoing)
f010d7a9:	85 ff                	test   %edi,%edi
f010d7ab:	90                   	nop
f010d7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010d7b0:	74 08                	je     f010d7ba <_Z8readlinePKc+0x9a>
				cputchar(c);
f010d7b2:	89 1c 24             	mov    %ebx,(%esp)
f010d7b5:	e8 9a c0 ff ff       	call   f0109854 <_Z8cputchari>
			i--;
f010d7ba:	83 ee 01             	sub    $0x1,%esi
f010d7bd:	eb 9a                	jmp    f010d759 <_Z8readlinePKc+0x39>
		} else if (c == '\n' || c == '\r') {
f010d7bf:	83 fb 0a             	cmp    $0xa,%ebx
f010d7c2:	74 05                	je     f010d7c9 <_Z8readlinePKc+0xa9>
f010d7c4:	83 fb 0d             	cmp    $0xd,%ebx
f010d7c7:	75 90                	jne    f010d759 <_Z8readlinePKc+0x39>
			if (echoing)
f010d7c9:	85 ff                	test   %edi,%edi
f010d7cb:	90                   	nop
f010d7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010d7d0:	74 08                	je     f010d7da <_Z8readlinePKc+0xba>
				cputchar(c);
f010d7d2:	89 1c 24             	mov    %ebx,(%esp)
f010d7d5:	e8 7a c0 ff ff       	call   f0109854 <_Z8cputchari>
			buf[i] = 0;
f010d7da:	c6 86 40 49 19 f0 00 	movb   $0x0,-0xfe6b6c0(%esi)
f010d7e1:	b8 40 49 19 f0       	mov    $0xf0194940,%eax
			return buf;
		}
	}
}
f010d7e6:	83 c4 1c             	add    $0x1c,%esp
f010d7e9:	5b                   	pop    %ebx
f010d7ea:	5e                   	pop    %esi
f010d7eb:	5f                   	pop    %edi
f010d7ec:	5d                   	pop    %ebp
f010d7ed:	c3                   	ret    
	...

f010d7f0 <strlen>:
#include <inc/string.h>
extern "C" {

int
strlen(const char *s)
{
f010d7f0:	55                   	push   %ebp
f010d7f1:	89 e5                	mov    %esp,%ebp
f010d7f3:	8b 55 08             	mov    0x8(%ebp),%edx
	int n;

	for (n = 0; *s != '\0'; s++)
f010d7f6:	b8 00 00 00 00       	mov    $0x0,%eax
f010d7fb:	80 3a 00             	cmpb   $0x0,(%edx)
f010d7fe:	74 09                	je     f010d809 <strlen+0x19>
		n++;
f010d800:	83 c0 01             	add    $0x1,%eax
int
strlen(const char *s)
{
	int n;

	for (n = 0; *s != '\0'; s++)
f010d803:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
f010d807:	75 f7                	jne    f010d800 <strlen+0x10>
		n++;
	return n;
}
f010d809:	5d                   	pop    %ebp
f010d80a:	c3                   	ret    

f010d80b <strnlen>:

int
strnlen(const char *s, size_t size)
{
f010d80b:	55                   	push   %ebp
f010d80c:	89 e5                	mov    %esp,%ebp
f010d80e:	53                   	push   %ebx
f010d80f:	8b 5d 08             	mov    0x8(%ebp),%ebx
f010d812:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f010d815:	b8 00 00 00 00       	mov    $0x0,%eax
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
f010d81a:	39 c1                	cmp    %eax,%ecx
f010d81c:	74 0b                	je     f010d829 <strnlen+0x1e>
f010d81e:	80 3c 03 00          	cmpb   $0x0,(%ebx,%eax,1)
f010d822:	74 05                	je     f010d829 <strnlen+0x1e>
		n++;
f010d824:	83 c0 01             	add    $0x1,%eax
f010d827:	eb f1                	jmp    f010d81a <strnlen+0xf>
	return n;
}
f010d829:	5b                   	pop    %ebx
f010d82a:	5d                   	pop    %ebp
f010d82b:	90                   	nop
f010d82c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010d830:	c3                   	ret    

f010d831 <strcpy>:

char *
strcpy(char *dst, const char *src)
{
f010d831:	55                   	push   %ebp
f010d832:	89 e5                	mov    %esp,%ebp
f010d834:	53                   	push   %ebx
f010d835:	8b 45 08             	mov    0x8(%ebp),%eax
f010d838:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010d83b:	ba 00 00 00 00       	mov    $0x0,%edx
	char *ret = dst;

	while ((*dst++ = *src++) != '\0')
f010d840:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
f010d844:	88 0c 10             	mov    %cl,(%eax,%edx,1)
f010d847:	83 c2 01             	add    $0x1,%edx
f010d84a:	84 c9                	test   %cl,%cl
f010d84c:	75 f2                	jne    f010d840 <strcpy+0xf>
		/* do nothing */;
	return ret;
}
f010d84e:	5b                   	pop    %ebx
f010d84f:	5d                   	pop    %ebp
f010d850:	c3                   	ret    

f010d851 <strncpy>:

char *
strncpy(char *dst, const char *src, size_t size)
{
f010d851:	55                   	push   %ebp
f010d852:	89 e5                	mov    %esp,%ebp
f010d854:	56                   	push   %esi
f010d855:	53                   	push   %ebx
f010d856:	8b 45 08             	mov    0x8(%ebp),%eax
f010d859:	8b 55 0c             	mov    0xc(%ebp),%edx
f010d85c:	8b 75 10             	mov    0x10(%ebp),%esi
	char *ret = dst;

	for (size_t i = 0; i < size; i++) {
f010d85f:	85 f6                	test   %esi,%esi
f010d861:	74 18                	je     f010d87b <strncpy+0x2a>
f010d863:	b9 00 00 00 00       	mov    $0x0,%ecx
		*dst++ = *src;
f010d868:	0f b6 1a             	movzbl (%edx),%ebx
f010d86b:	88 1c 08             	mov    %bl,(%eax,%ecx,1)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
f010d86e:	80 3a 01             	cmpb   $0x1,(%edx)
f010d871:	83 da ff             	sbb    $0xffffffff,%edx
char *
strncpy(char *dst, const char *src, size_t size)
{
	char *ret = dst;

	for (size_t i = 0; i < size; i++) {
f010d874:	83 c1 01             	add    $0x1,%ecx
f010d877:	39 ce                	cmp    %ecx,%esi
f010d879:	77 ed                	ja     f010d868 <strncpy+0x17>
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
}
f010d87b:	5b                   	pop    %ebx
f010d87c:	5e                   	pop    %esi
f010d87d:	5d                   	pop    %ebp
f010d87e:	c3                   	ret    

f010d87f <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
f010d87f:	55                   	push   %ebp
f010d880:	89 e5                	mov    %esp,%ebp
f010d882:	56                   	push   %esi
f010d883:	53                   	push   %ebx
f010d884:	8b 75 08             	mov    0x8(%ebp),%esi
f010d887:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f010d88a:	8b 55 10             	mov    0x10(%ebp),%edx
	char *dst_in = dst;

	if (size > 0) {
		while (--size > 0 && *src != '\0')
			*dst++ = *src++;
f010d88d:	89 f0                	mov    %esi,%eax
size_t
strlcpy(char *dst, const char *src, size_t size)
{
	char *dst_in = dst;

	if (size > 0) {
f010d88f:	85 d2                	test   %edx,%edx
f010d891:	74 17                	je     f010d8aa <strlcpy+0x2b>
		while (--size > 0 && *src != '\0')
f010d893:	83 ea 01             	sub    $0x1,%edx
f010d896:	74 18                	je     f010d8b0 <strlcpy+0x31>
f010d898:	80 39 00             	cmpb   $0x0,(%ecx)
f010d89b:	74 13                	je     f010d8b0 <strlcpy+0x31>
			*dst++ = *src++;
f010d89d:	0f b6 19             	movzbl (%ecx),%ebx
f010d8a0:	88 18                	mov    %bl,(%eax)
f010d8a2:	83 c0 01             	add    $0x1,%eax
f010d8a5:	83 c1 01             	add    $0x1,%ecx
f010d8a8:	eb e9                	jmp    f010d893 <strlcpy+0x14>
f010d8aa:	29 f0                	sub    %esi,%eax
		*dst = '\0';
	}
	return dst - dst_in;
}
f010d8ac:	5b                   	pop    %ebx
f010d8ad:	5e                   	pop    %esi
f010d8ae:	5d                   	pop    %ebp
f010d8af:	c3                   	ret    
	char *dst_in = dst;

	if (size > 0) {
		while (--size > 0 && *src != '\0')
			*dst++ = *src++;
		*dst = '\0';
f010d8b0:	c6 00 00             	movb   $0x0,(%eax)
f010d8b3:	eb f5                	jmp    f010d8aa <strlcpy+0x2b>

f010d8b5 <strcmp>:
	return dst - dst_in;
}

int
strcmp(const char *p, const char *q)
{
f010d8b5:	55                   	push   %ebp
f010d8b6:	89 e5                	mov    %esp,%ebp
f010d8b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010d8bb:	8b 55 0c             	mov    0xc(%ebp),%edx
	while (*p && *p == *q)
f010d8be:	0f b6 01             	movzbl (%ecx),%eax
f010d8c1:	84 c0                	test   %al,%al
f010d8c3:	74 0c                	je     f010d8d1 <strcmp+0x1c>
f010d8c5:	3a 02                	cmp    (%edx),%al
f010d8c7:	75 08                	jne    f010d8d1 <strcmp+0x1c>
		p++, q++;
f010d8c9:	83 c1 01             	add    $0x1,%ecx
f010d8cc:	83 c2 01             	add    $0x1,%edx
f010d8cf:	eb ed                	jmp    f010d8be <strcmp+0x9>
f010d8d1:	0f b6 c0             	movzbl %al,%eax
f010d8d4:	0f b6 12             	movzbl (%edx),%edx
f010d8d7:	29 d0                	sub    %edx,%eax
	return (unsigned char) *p - (unsigned char) *q;
}
f010d8d9:	5d                   	pop    %ebp
f010d8da:	c3                   	ret    

f010d8db <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
f010d8db:	55                   	push   %ebp
f010d8dc:	89 e5                	mov    %esp,%ebp
f010d8de:	53                   	push   %ebx
f010d8df:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010d8e2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010d8e5:	8b 55 10             	mov    0x10(%ebp),%edx
	while (n > 0 && *p && *p == *q)
f010d8e8:	85 d2                	test   %edx,%edx
f010d8ea:	74 16                	je     f010d902 <strncmp+0x27>
f010d8ec:	0f b6 01             	movzbl (%ecx),%eax
f010d8ef:	84 c0                	test   %al,%al
f010d8f1:	74 17                	je     f010d90a <strncmp+0x2f>
f010d8f3:	3a 03                	cmp    (%ebx),%al
f010d8f5:	75 13                	jne    f010d90a <strncmp+0x2f>
		n--, p++, q++;
f010d8f7:	83 ea 01             	sub    $0x1,%edx
f010d8fa:	83 c1 01             	add    $0x1,%ecx
f010d8fd:	83 c3 01             	add    $0x1,%ebx
f010d900:	eb e6                	jmp    f010d8e8 <strncmp+0xd>
f010d902:	b8 00 00 00 00       	mov    $0x0,%eax
	if (n == 0)
		return 0;
	else
		return (unsigned char) *p - (unsigned char) *q;
}
f010d907:	5b                   	pop    %ebx
f010d908:	5d                   	pop    %ebp
f010d909:	c3                   	ret    
	while (n > 0 && *p && *p == *q)
		n--, p++, q++;
	if (n == 0)
		return 0;
	else
		return (unsigned char) *p - (unsigned char) *q;
f010d90a:	0f b6 01             	movzbl (%ecx),%eax
f010d90d:	0f b6 13             	movzbl (%ebx),%edx
f010d910:	29 d0                	sub    %edx,%eax
f010d912:	eb f3                	jmp    f010d907 <strncmp+0x2c>

f010d914 <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
f010d914:	55                   	push   %ebp
f010d915:	89 e5                	mov    %esp,%ebp
f010d917:	8b 45 08             	mov    0x8(%ebp),%eax
f010d91a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
	for (; *s; s++)
f010d91e:	0f b6 10             	movzbl (%eax),%edx
f010d921:	84 d2                	test   %dl,%dl
f010d923:	74 17                	je     f010d93c <strchr+0x28>
		if (*s == c)
f010d925:	38 ca                	cmp    %cl,%dl
f010d927:	75 09                	jne    f010d932 <strchr+0x1e>
f010d929:	eb 16                	jmp    f010d941 <strchr+0x2d>
f010d92b:	38 ca                	cmp    %cl,%dl
f010d92d:	8d 76 00             	lea    0x0(%esi),%esi
f010d930:	74 0f                	je     f010d941 <strchr+0x2d>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
f010d932:	83 c0 01             	add    $0x1,%eax
f010d935:	0f b6 10             	movzbl (%eax),%edx
f010d938:	84 d2                	test   %dl,%dl
f010d93a:	75 ef                	jne    f010d92b <strchr+0x17>
f010d93c:	b8 00 00 00 00       	mov    $0x0,%eax
		if (*s == c)
			return (char *) s;
	return 0;
}
f010d941:	5d                   	pop    %ebp
f010d942:	c3                   	ret    

f010d943 <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
f010d943:	55                   	push   %ebp
f010d944:	89 e5                	mov    %esp,%ebp
f010d946:	8b 45 08             	mov    0x8(%ebp),%eax
f010d949:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
	for (; *s; s++)
f010d94d:	0f b6 10             	movzbl (%eax),%edx
f010d950:	84 d2                	test   %dl,%dl
f010d952:	74 18                	je     f010d96c <strfind+0x29>
		if (*s == c)
f010d954:	38 ca                	cmp    %cl,%dl
f010d956:	75 0a                	jne    f010d962 <strfind+0x1f>
f010d958:	eb 12                	jmp    f010d96c <strfind+0x29>
f010d95a:	38 ca                	cmp    %cl,%dl
f010d95c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010d960:	74 0a                	je     f010d96c <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
f010d962:	83 c0 01             	add    $0x1,%eax
f010d965:	0f b6 10             	movzbl (%eax),%edx
f010d968:	84 d2                	test   %dl,%dl
f010d96a:	75 ee                	jne    f010d95a <strfind+0x17>
		if (*s == c)
			break;
	return (char *) s;
}
f010d96c:	5d                   	pop    %ebp
f010d96d:	c3                   	ret    

f010d96e <memset>:


void *
memset(void *v, int c, size_t n)
{
f010d96e:	55                   	push   %ebp
f010d96f:	89 e5                	mov    %esp,%ebp
f010d971:	53                   	push   %ebx
f010d972:	8b 45 08             	mov    0x8(%ebp),%eax
f010d975:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f010d978:	8b 5d 10             	mov    0x10(%ebp),%ebx
	char *p = (char *) v;
	int m = n;

	while (--m >= 0)
f010d97b:	89 da                	mov    %ebx,%edx
f010d97d:	83 ea 01             	sub    $0x1,%edx
f010d980:	78 0e                	js     f010d990 <memset+0x22>


void *
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
f010d982:	89 c2                	mov    %eax,%edx
	return (char *) s;
}


void *
memset(void *v, int c, size_t n)
f010d984:	8d 1c 18             	lea    (%eax,%ebx,1),%ebx
{
	char *p = (char *) v;
	int m = n;

	while (--m >= 0)
		*p++ = c;
f010d987:	88 0a                	mov    %cl,(%edx)
f010d989:	83 c2 01             	add    $0x1,%edx
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
	int m = n;

	while (--m >= 0)
f010d98c:	39 da                	cmp    %ebx,%edx
f010d98e:	75 f7                	jne    f010d987 <memset+0x19>
		*p++ = c;
	return v;
}
f010d990:	5b                   	pop    %ebx
f010d991:	5d                   	pop    %ebp
f010d992:	c3                   	ret    

f010d993 <memcpy>:

void *
memcpy(void *dst, const void *src, size_t n)
{
f010d993:	55                   	push   %ebp
f010d994:	89 e5                	mov    %esp,%ebp
f010d996:	56                   	push   %esi
f010d997:	53                   	push   %ebx
f010d998:	8b 45 08             	mov    0x8(%ebp),%eax
f010d99b:	8b 75 0c             	mov    0xc(%ebp),%esi
f010d99e:	8b 5d 10             	mov    0x10(%ebp),%ebx
	const char *s = (const char *) src;
	char *d = (char *) dst;

	while (n-- > 0)
f010d9a1:	85 db                	test   %ebx,%ebx
f010d9a3:	74 13                	je     f010d9b8 <memcpy+0x25>
f010d9a5:	ba 00 00 00 00       	mov    $0x0,%edx
		*d++ = *s++;
f010d9aa:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
f010d9ae:	88 0c 10             	mov    %cl,(%eax,%edx,1)
f010d9b1:	83 c2 01             	add    $0x1,%edx
memcpy(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;

	while (n-- > 0)
f010d9b4:	39 da                	cmp    %ebx,%edx
f010d9b6:	75 f2                	jne    f010d9aa <memcpy+0x17>
		*d++ = *s++;

	return dst;
}
f010d9b8:	5b                   	pop    %ebx
f010d9b9:	5e                   	pop    %esi
f010d9ba:	5d                   	pop    %ebp
f010d9bb:	c3                   	ret    

f010d9bc <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
f010d9bc:	55                   	push   %ebp
f010d9bd:	89 e5                	mov    %esp,%ebp
f010d9bf:	57                   	push   %edi
f010d9c0:	56                   	push   %esi
f010d9c1:	53                   	push   %ebx
f010d9c2:	8b 45 08             	mov    0x8(%ebp),%eax
f010d9c5:	8b 75 0c             	mov    0xc(%ebp),%esi
f010d9c8:	8b 5d 10             	mov    0x10(%ebp),%ebx
	const char *s = (const char *) src;
f010d9cb:	89 f7                	mov    %esi,%edi
	char *d = (char *) dst;

	if (s < d && s + n > d) {
f010d9cd:	39 c6                	cmp    %eax,%esi
f010d9cf:	72 0b                	jb     f010d9dc <memmove+0x20>
		s += n;
		d += n;
		while (n-- > 0)
f010d9d1:	ba 00 00 00 00       	mov    $0x0,%edx
			*--d = *--s;
	} else
		while (n-- > 0)
f010d9d6:	85 db                	test   %ebx,%ebx
f010d9d8:	75 29                	jne    f010da03 <memmove+0x47>
f010d9da:	eb 35                	jmp    f010da11 <memmove+0x55>
memmove(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;

	if (s < d && s + n > d) {
f010d9dc:	01 df                	add    %ebx,%edi
f010d9de:	39 f8                	cmp    %edi,%eax
f010d9e0:	73 ef                	jae    f010d9d1 <memmove+0x15>
		s += n;
		d += n;
		while (n-- > 0)
f010d9e2:	85 db                	test   %ebx,%ebx
f010d9e4:	74 2b                	je     f010da11 <memmove+0x55>
	const char *s = (const char *) src;
	char *d = (char *) dst;

	if (s < d && s + n > d) {
		s += n;
		d += n;
f010d9e6:	8d 34 18             	lea    (%eax,%ebx,1),%esi
f010d9e9:	ba 00 00 00 00       	mov    $0x0,%edx
		while (n-- > 0)
			*--d = *--s;
f010d9ee:	0f b6 4c 17 ff       	movzbl -0x1(%edi,%edx,1),%ecx
f010d9f3:	88 4c 16 ff          	mov    %cl,-0x1(%esi,%edx,1)
f010d9f7:	83 ea 01             	sub    $0x1,%edx
	char *d = (char *) dst;

	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
f010d9fa:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
f010d9fd:	85 c9                	test   %ecx,%ecx
f010d9ff:	75 ed                	jne    f010d9ee <memmove+0x32>
f010da01:	eb 0e                	jmp    f010da11 <memmove+0x55>
			*--d = *--s;
	} else
		while (n-- > 0)
			*d++ = *s++;
f010da03:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
f010da07:	88 0c 10             	mov    %cl,(%eax,%edx,1)
f010da0a:	83 c2 01             	add    $0x1,%edx
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
f010da0d:	39 d3                	cmp    %edx,%ebx
f010da0f:	75 f2                	jne    f010da03 <memmove+0x47>
			*d++ = *s++;

	return dst;
}
f010da11:	5b                   	pop    %ebx
f010da12:	5e                   	pop    %esi
f010da13:	5f                   	pop    %edi
f010da14:	5d                   	pop    %ebp
f010da15:	c3                   	ret    

f010da16 <memcmp>:

int
memcmp(const void *v1, const void *v2, size_t n)
{
f010da16:	55                   	push   %ebp
f010da17:	89 e5                	mov    %esp,%ebp
f010da19:	57                   	push   %edi
f010da1a:	56                   	push   %esi
f010da1b:	53                   	push   %ebx
f010da1c:	8b 75 08             	mov    0x8(%ebp),%esi
f010da1f:	8b 7d 0c             	mov    0xc(%ebp),%edi
f010da22:	8b 4d 10             	mov    0x10(%ebp),%ecx
	const unsigned char *s1 = (const unsigned char *) v1;
	const unsigned char *s2 = (const unsigned char *) v2;

	while (n-- > 0) {
f010da25:	85 c9                	test   %ecx,%ecx
f010da27:	74 36                	je     f010da5f <memcmp+0x49>
		if (*s1 != *s2)
f010da29:	0f b6 06             	movzbl (%esi),%eax
f010da2c:	0f b6 1f             	movzbl (%edi),%ebx
f010da2f:	38 d8                	cmp    %bl,%al
f010da31:	74 20                	je     f010da53 <memcmp+0x3d>
f010da33:	eb 14                	jmp    f010da49 <memcmp+0x33>
f010da35:	0f b6 44 16 01       	movzbl 0x1(%esi,%edx,1),%eax
f010da3a:	0f b6 5c 17 01       	movzbl 0x1(%edi,%edx,1),%ebx
f010da3f:	83 c2 01             	add    $0x1,%edx
f010da42:	83 e9 01             	sub    $0x1,%ecx
f010da45:	38 d8                	cmp    %bl,%al
f010da47:	74 12                	je     f010da5b <memcmp+0x45>
			return *s1 - *s2;
f010da49:	0f b6 c0             	movzbl %al,%eax
f010da4c:	0f b6 db             	movzbl %bl,%ebx
f010da4f:	29 d8                	sub    %ebx,%eax
f010da51:	eb 11                	jmp    f010da64 <memcmp+0x4e>
memcmp(const void *v1, const void *v2, size_t n)
{
	const unsigned char *s1 = (const unsigned char *) v1;
	const unsigned char *s2 = (const unsigned char *) v2;

	while (n-- > 0) {
f010da53:	83 e9 01             	sub    $0x1,%ecx
f010da56:	ba 00 00 00 00       	mov    $0x0,%edx
f010da5b:	85 c9                	test   %ecx,%ecx
f010da5d:	75 d6                	jne    f010da35 <memcmp+0x1f>
f010da5f:	b8 00 00 00 00       	mov    $0x0,%eax
		if (*s1 != *s2)
			return *s1 - *s2;
		s1++, s2++;
	}
	return 0;
}
f010da64:	5b                   	pop    %ebx
f010da65:	5e                   	pop    %esi
f010da66:	5f                   	pop    %edi
f010da67:	5d                   	pop    %ebp
f010da68:	c3                   	ret    

f010da69 <memfind>:

void *
memfind(const void *v, int c, size_t n)
{
f010da69:	55                   	push   %ebp
f010da6a:	89 e5                	mov    %esp,%ebp
	const unsigned char *s = (const unsigned char *) v;
f010da6c:	8b 45 08             	mov    0x8(%ebp),%eax
	
	const unsigned char *ends = s + n;
f010da6f:	89 c2                	mov    %eax,%edx
f010da71:	03 55 10             	add    0x10(%ebp),%edx
	for (; s < ends; s++)
f010da74:	39 d0                	cmp    %edx,%eax
f010da76:	73 1a                	jae    f010da92 <memfind+0x29>
		if (*s == (unsigned char) c)
f010da78:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
f010da7c:	38 08                	cmp    %cl,(%eax)
f010da7e:	75 06                	jne    f010da86 <memfind+0x1d>
f010da80:	eb 10                	jmp    f010da92 <memfind+0x29>
f010da82:	38 08                	cmp    %cl,(%eax)
f010da84:	74 0c                	je     f010da92 <memfind+0x29>
memfind(const void *v, int c, size_t n)
{
	const unsigned char *s = (const unsigned char *) v;
	
	const unsigned char *ends = s + n;
	for (; s < ends; s++)
f010da86:	83 c0 01             	add    $0x1,%eax
f010da89:	39 c2                	cmp    %eax,%edx
f010da8b:	90                   	nop
f010da8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010da90:	77 f0                	ja     f010da82 <memfind+0x19>
		if (*s == (unsigned char) c)
			break;
	return (void *) s;
}
f010da92:	5d                   	pop    %ebp
f010da93:	c3                   	ret    

f010da94 <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
f010da94:	55                   	push   %ebp
f010da95:	89 e5                	mov    %esp,%ebp
f010da97:	57                   	push   %edi
f010da98:	56                   	push   %esi
f010da99:	53                   	push   %ebx
f010da9a:	83 ec 04             	sub    $0x4,%esp
f010da9d:	8b 55 08             	mov    0x8(%ebp),%edx
f010daa0:	8b 5d 10             	mov    0x10(%ebp),%ebx
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
f010daa3:	0f b6 02             	movzbl (%edx),%eax
f010daa6:	3c 20                	cmp    $0x20,%al
f010daa8:	74 04                	je     f010daae <strtol+0x1a>
f010daaa:	3c 09                	cmp    $0x9,%al
f010daac:	75 0e                	jne    f010dabc <strtol+0x28>
		s++;
f010daae:	83 c2 01             	add    $0x1,%edx
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
f010dab1:	0f b6 02             	movzbl (%edx),%eax
f010dab4:	3c 20                	cmp    $0x20,%al
f010dab6:	74 f6                	je     f010daae <strtol+0x1a>
f010dab8:	3c 09                	cmp    $0x9,%al
f010daba:	74 f2                	je     f010daae <strtol+0x1a>
		s++;

	// plus/minus sign
	if (*s == '+')
f010dabc:	3c 2b                	cmp    $0x2b,%al
f010dabe:	75 0c                	jne    f010dacc <strtol+0x38>
		s++;
f010dac0:	83 c2 01             	add    $0x1,%edx
f010dac3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
f010daca:	eb 15                	jmp    f010dae1 <strtol+0x4d>
	else if (*s == '-')
f010dacc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
f010dad3:	3c 2d                	cmp    $0x2d,%al
f010dad5:	75 0a                	jne    f010dae1 <strtol+0x4d>
		s++, neg = 1;
f010dad7:	83 c2 01             	add    $0x1,%edx
f010dada:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
f010dae1:	85 db                	test   %ebx,%ebx
f010dae3:	0f 94 c0             	sete   %al
f010dae6:	74 05                	je     f010daed <strtol+0x59>
f010dae8:	83 fb 10             	cmp    $0x10,%ebx
f010daeb:	75 15                	jne    f010db02 <strtol+0x6e>
f010daed:	80 3a 30             	cmpb   $0x30,(%edx)
f010daf0:	75 10                	jne    f010db02 <strtol+0x6e>
f010daf2:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
f010daf6:	75 0a                	jne    f010db02 <strtol+0x6e>
		s += 2, base = 16;
f010daf8:	83 c2 02             	add    $0x2,%edx
f010dafb:	bb 10 00 00 00       	mov    $0x10,%ebx
		s++;
	else if (*s == '-')
		s++, neg = 1;

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
f010db00:	eb 13                	jmp    f010db15 <strtol+0x81>
		s += 2, base = 16;
	else if (base == 0 && s[0] == '0')
f010db02:	84 c0                	test   %al,%al
f010db04:	74 0f                	je     f010db15 <strtol+0x81>
f010db06:	bb 0a 00 00 00       	mov    $0xa,%ebx
f010db0b:	80 3a 30             	cmpb   $0x30,(%edx)
f010db0e:	75 05                	jne    f010db15 <strtol+0x81>
		s++, base = 8;
f010db10:	83 c2 01             	add    $0x1,%edx
f010db13:	b3 08                	mov    $0x8,%bl
		s++, neg = 1;

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
		s += 2, base = 16;
	else if (base == 0 && s[0] == '0')
f010db15:	b8 00 00 00 00       	mov    $0x0,%eax
f010db1a:	89 de                	mov    %ebx,%esi

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
f010db1c:	0f b6 0a             	movzbl (%edx),%ecx
f010db1f:	89 cf                	mov    %ecx,%edi
f010db21:	8d 59 d0             	lea    -0x30(%ecx),%ebx
f010db24:	80 fb 09             	cmp    $0x9,%bl
f010db27:	77 08                	ja     f010db31 <strtol+0x9d>
			dig = *s - '0';
f010db29:	0f be c9             	movsbl %cl,%ecx
f010db2c:	83 e9 30             	sub    $0x30,%ecx
f010db2f:	eb 1e                	jmp    f010db4f <strtol+0xbb>
		else if (*s >= 'a' && *s <= 'z')
f010db31:	8d 5f 9f             	lea    -0x61(%edi),%ebx
f010db34:	80 fb 19             	cmp    $0x19,%bl
f010db37:	77 08                	ja     f010db41 <strtol+0xad>
			dig = *s - 'a' + 10;
f010db39:	0f be c9             	movsbl %cl,%ecx
f010db3c:	83 e9 57             	sub    $0x57,%ecx
f010db3f:	eb 0e                	jmp    f010db4f <strtol+0xbb>
		else if (*s >= 'A' && *s <= 'Z')
f010db41:	8d 5f bf             	lea    -0x41(%edi),%ebx
f010db44:	80 fb 19             	cmp    $0x19,%bl
f010db47:	77 15                	ja     f010db5e <strtol+0xca>
			dig = *s - 'A' + 10;
f010db49:	0f be c9             	movsbl %cl,%ecx
f010db4c:	83 e9 37             	sub    $0x37,%ecx
		else
			break;
		if (dig >= base)
f010db4f:	39 f1                	cmp    %esi,%ecx
f010db51:	7d 0b                	jge    f010db5e <strtol+0xca>
			break;
		s++, val = (val * base) + dig;
f010db53:	83 c2 01             	add    $0x1,%edx
f010db56:	0f af c6             	imul   %esi,%eax
f010db59:	8d 04 01             	lea    (%ecx,%eax,1),%eax
		s++, base = 8;
	else if (base == 0)
		base = 10;

	// digits
	while (1) {
f010db5c:	eb be                	jmp    f010db1c <strtol+0x88>
f010db5e:	89 c1                	mov    %eax,%ecx
			break;
		s++, val = (val * base) + dig;
		// we don't properly detect overflow!
	}

	if (endptr)
f010db60:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
f010db64:	74 05                	je     f010db6b <strtol+0xd7>
		*endptr = (char *) s;
f010db66:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010db69:	89 13                	mov    %edx,(%ebx)
	return (neg ? -val : val);
f010db6b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
f010db6f:	74 04                	je     f010db75 <strtol+0xe1>
f010db71:	89 c8                	mov    %ecx,%eax
f010db73:	f7 d8                	neg    %eax
}
f010db75:	83 c4 04             	add    $0x4,%esp
f010db78:	5b                   	pop    %ebx
f010db79:	5e                   	pop    %esi
f010db7a:	5f                   	pop    %edi
f010db7b:	5d                   	pop    %ebp
f010db7c:	c3                   	ret    
f010db7d:	00 00                	add    %al,(%eax)
	...

f010db80 <__udivdi3>:
f010db80:	55                   	push   %ebp
f010db81:	89 e5                	mov    %esp,%ebp
f010db83:	57                   	push   %edi
f010db84:	56                   	push   %esi
f010db85:	83 ec 10             	sub    $0x10,%esp
f010db88:	8b 55 14             	mov    0x14(%ebp),%edx
f010db8b:	8b 45 08             	mov    0x8(%ebp),%eax
f010db8e:	8b 75 10             	mov    0x10(%ebp),%esi
f010db91:	8b 7d 0c             	mov    0xc(%ebp),%edi
f010db94:	85 d2                	test   %edx,%edx
f010db96:	89 45 f0             	mov    %eax,-0x10(%ebp)
f010db99:	75 35                	jne    f010dbd0 <__udivdi3+0x50>
f010db9b:	39 fe                	cmp    %edi,%esi
f010db9d:	77 61                	ja     f010dc00 <__udivdi3+0x80>
f010db9f:	85 f6                	test   %esi,%esi
f010dba1:	0f 85 d9 00 00 00    	jne    f010dc80 <__udivdi3+0x100>
f010dba7:	31 d2                	xor    %edx,%edx
f010dba9:	b8 01 00 00 00       	mov    $0x1,%eax
f010dbae:	f7 f6                	div    %esi
f010dbb0:	89 f2                	mov    %esi,%edx
f010dbb2:	8b 75 f0             	mov    -0x10(%ebp),%esi
f010dbb5:	89 45 f4             	mov    %eax,-0xc(%ebp)
f010dbb8:	89 f8                	mov    %edi,%eax
f010dbba:	f7 75 f4             	divl   -0xc(%ebp)
f010dbbd:	89 c7                	mov    %eax,%edi
f010dbbf:	89 f0                	mov    %esi,%eax
f010dbc1:	f7 75 f4             	divl   -0xc(%ebp)
f010dbc4:	89 fa                	mov    %edi,%edx
f010dbc6:	83 c4 10             	add    $0x10,%esp
f010dbc9:	5e                   	pop    %esi
f010dbca:	5f                   	pop    %edi
f010dbcb:	5d                   	pop    %ebp
f010dbcc:	c3                   	ret    
f010dbcd:	8d 76 00             	lea    0x0(%esi),%esi
f010dbd0:	39 fa                	cmp    %edi,%edx
f010dbd2:	77 1c                	ja     f010dbf0 <__udivdi3+0x70>
f010dbd4:	0f bd c2             	bsr    %edx,%eax
f010dbd7:	83 f0 1f             	xor    $0x1f,%eax
f010dbda:	89 45 f4             	mov    %eax,-0xc(%ebp)
f010dbdd:	75 31                	jne    f010dc10 <__udivdi3+0x90>
f010dbdf:	39 75 f0             	cmp    %esi,-0x10(%ebp)
f010dbe2:	0f 83 b0 00 00 00    	jae    f010dc98 <__udivdi3+0x118>
f010dbe8:	39 d7                	cmp    %edx,%edi
f010dbea:	0f 87 a8 00 00 00    	ja     f010dc98 <__udivdi3+0x118>
f010dbf0:	31 ff                	xor    %edi,%edi
f010dbf2:	31 c9                	xor    %ecx,%ecx
f010dbf4:	89 c8                	mov    %ecx,%eax
f010dbf6:	89 fa                	mov    %edi,%edx
f010dbf8:	83 c4 10             	add    $0x10,%esp
f010dbfb:	5e                   	pop    %esi
f010dbfc:	5f                   	pop    %edi
f010dbfd:	5d                   	pop    %ebp
f010dbfe:	c3                   	ret    
f010dbff:	90                   	nop
f010dc00:	89 fa                	mov    %edi,%edx
f010dc02:	31 ff                	xor    %edi,%edi
f010dc04:	f7 f6                	div    %esi
f010dc06:	89 c1                	mov    %eax,%ecx
f010dc08:	eb ea                	jmp    f010dbf4 <__udivdi3+0x74>
f010dc0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010dc10:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010dc14:	b8 20 00 00 00       	mov    $0x20,%eax
f010dc19:	2b 45 f4             	sub    -0xc(%ebp),%eax
f010dc1c:	d3 e2                	shl    %cl,%edx
f010dc1e:	89 c1                	mov    %eax,%ecx
f010dc20:	89 55 ec             	mov    %edx,-0x14(%ebp)
f010dc23:	89 f2                	mov    %esi,%edx
f010dc25:	d3 ea                	shr    %cl,%edx
f010dc27:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010dc2b:	0b 55 ec             	or     -0x14(%ebp),%edx
f010dc2e:	d3 e6                	shl    %cl,%esi
f010dc30:	89 c1                	mov    %eax,%ecx
f010dc32:	89 75 e8             	mov    %esi,-0x18(%ebp)
f010dc35:	89 fe                	mov    %edi,%esi
f010dc37:	d3 ee                	shr    %cl,%esi
f010dc39:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010dc3d:	89 55 ec             	mov    %edx,-0x14(%ebp)
f010dc40:	8b 55 f0             	mov    -0x10(%ebp),%edx
f010dc43:	d3 e7                	shl    %cl,%edi
f010dc45:	89 c1                	mov    %eax,%ecx
f010dc47:	d3 ea                	shr    %cl,%edx
f010dc49:	09 d7                	or     %edx,%edi
f010dc4b:	89 f2                	mov    %esi,%edx
f010dc4d:	89 f8                	mov    %edi,%eax
f010dc4f:	f7 75 ec             	divl   -0x14(%ebp)
f010dc52:	89 d6                	mov    %edx,%esi
f010dc54:	89 c7                	mov    %eax,%edi
f010dc56:	f7 65 e8             	mull   -0x18(%ebp)
f010dc59:	39 d6                	cmp    %edx,%esi
f010dc5b:	89 55 ec             	mov    %edx,-0x14(%ebp)
f010dc5e:	72 48                	jb     f010dca8 <__udivdi3+0x128>
f010dc60:	8b 55 f0             	mov    -0x10(%ebp),%edx
f010dc63:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010dc67:	d3 e2                	shl    %cl,%edx
f010dc69:	39 d0                	cmp    %edx,%eax
f010dc6b:	76 05                	jbe    f010dc72 <__udivdi3+0xf2>
f010dc6d:	39 75 ec             	cmp    %esi,-0x14(%ebp)
f010dc70:	74 36                	je     f010dca8 <__udivdi3+0x128>
f010dc72:	89 f9                	mov    %edi,%ecx
f010dc74:	31 ff                	xor    %edi,%edi
f010dc76:	e9 79 ff ff ff       	jmp    f010dbf4 <__udivdi3+0x74>
f010dc7b:	90                   	nop
f010dc7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010dc80:	8b 4d f0             	mov    -0x10(%ebp),%ecx
f010dc83:	89 f8                	mov    %edi,%eax
f010dc85:	f7 f6                	div    %esi
f010dc87:	89 c7                	mov    %eax,%edi
f010dc89:	89 c8                	mov    %ecx,%eax
f010dc8b:	f7 f6                	div    %esi
f010dc8d:	89 c1                	mov    %eax,%ecx
f010dc8f:	e9 60 ff ff ff       	jmp    f010dbf4 <__udivdi3+0x74>
f010dc94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010dc98:	31 ff                	xor    %edi,%edi
f010dc9a:	b9 01 00 00 00       	mov    $0x1,%ecx
f010dc9f:	e9 50 ff ff ff       	jmp    f010dbf4 <__udivdi3+0x74>
f010dca4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010dca8:	8d 4f ff             	lea    -0x1(%edi),%ecx
f010dcab:	31 ff                	xor    %edi,%edi
f010dcad:	e9 42 ff ff ff       	jmp    f010dbf4 <__udivdi3+0x74>
	...

f010dcc0 <__umoddi3>:
f010dcc0:	55                   	push   %ebp
f010dcc1:	89 e5                	mov    %esp,%ebp
f010dcc3:	57                   	push   %edi
f010dcc4:	56                   	push   %esi
f010dcc5:	83 ec 20             	sub    $0x20,%esp
f010dcc8:	8b 55 14             	mov    0x14(%ebp),%edx
f010dccb:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010dcce:	8b 7d 10             	mov    0x10(%ebp),%edi
f010dcd1:	8b 75 0c             	mov    0xc(%ebp),%esi
f010dcd4:	85 d2                	test   %edx,%edx
f010dcd6:	89 4d f0             	mov    %ecx,-0x10(%ebp)
f010dcd9:	89 c8                	mov    %ecx,%eax
f010dcdb:	75 1b                	jne    f010dcf8 <__umoddi3+0x38>
f010dcdd:	39 f7                	cmp    %esi,%edi
f010dcdf:	76 47                	jbe    f010dd28 <__umoddi3+0x68>
f010dce1:	89 f2                	mov    %esi,%edx
f010dce3:	31 f6                	xor    %esi,%esi
f010dce5:	f7 f7                	div    %edi
f010dce7:	89 d0                	mov    %edx,%eax
f010dce9:	89 f2                	mov    %esi,%edx
f010dceb:	83 c4 20             	add    $0x20,%esp
f010dcee:	5e                   	pop    %esi
f010dcef:	5f                   	pop    %edi
f010dcf0:	5d                   	pop    %ebp
f010dcf1:	c3                   	ret    
f010dcf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010dcf8:	39 f2                	cmp    %esi,%edx
f010dcfa:	77 5c                	ja     f010dd58 <__umoddi3+0x98>
f010dcfc:	0f bd ca             	bsr    %edx,%ecx
f010dcff:	83 f1 1f             	xor    $0x1f,%ecx
f010dd02:	89 4d f4             	mov    %ecx,-0xc(%ebp)
f010dd05:	75 61                	jne    f010dd68 <__umoddi3+0xa8>
f010dd07:	39 f8                	cmp    %edi,%eax
f010dd09:	0f 83 f9 00 00 00    	jae    f010de08 <__umoddi3+0x148>
f010dd0f:	39 d6                	cmp    %edx,%esi
f010dd11:	0f 87 f1 00 00 00    	ja     f010de08 <__umoddi3+0x148>
f010dd17:	89 c2                	mov    %eax,%edx
f010dd19:	89 d0                	mov    %edx,%eax
f010dd1b:	89 f2                	mov    %esi,%edx
f010dd1d:	83 c4 20             	add    $0x20,%esp
f010dd20:	5e                   	pop    %esi
f010dd21:	5f                   	pop    %edi
f010dd22:	5d                   	pop    %ebp
f010dd23:	c3                   	ret    
f010dd24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010dd28:	85 ff                	test   %edi,%edi
f010dd2a:	0f 85 c0 00 00 00    	jne    f010ddf0 <__umoddi3+0x130>
f010dd30:	31 d2                	xor    %edx,%edx
f010dd32:	b8 01 00 00 00       	mov    $0x1,%eax
f010dd37:	f7 f7                	div    %edi
f010dd39:	89 fa                	mov    %edi,%edx
f010dd3b:	89 c1                	mov    %eax,%ecx
f010dd3d:	89 f0                	mov    %esi,%eax
f010dd3f:	31 f6                	xor    %esi,%esi
f010dd41:	f7 f1                	div    %ecx
f010dd43:	8b 45 f0             	mov    -0x10(%ebp),%eax
f010dd46:	f7 f1                	div    %ecx
f010dd48:	89 d0                	mov    %edx,%eax
f010dd4a:	89 f2                	mov    %esi,%edx
f010dd4c:	83 c4 20             	add    $0x20,%esp
f010dd4f:	5e                   	pop    %esi
f010dd50:	5f                   	pop    %edi
f010dd51:	5d                   	pop    %ebp
f010dd52:	c3                   	ret    
f010dd53:	90                   	nop
f010dd54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010dd58:	89 ca                	mov    %ecx,%edx
f010dd5a:	89 d0                	mov    %edx,%eax
f010dd5c:	89 f2                	mov    %esi,%edx
f010dd5e:	83 c4 20             	add    $0x20,%esp
f010dd61:	5e                   	pop    %esi
f010dd62:	5f                   	pop    %edi
f010dd63:	5d                   	pop    %ebp
f010dd64:	c3                   	ret    
f010dd65:	8d 76 00             	lea    0x0(%esi),%esi
f010dd68:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010dd6c:	89 d0                	mov    %edx,%eax
f010dd6e:	ba 20 00 00 00       	mov    $0x20,%edx
f010dd73:	2b 55 f4             	sub    -0xc(%ebp),%edx
f010dd76:	d3 e0                	shl    %cl,%eax
f010dd78:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f010dd7b:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010dd7f:	89 fa                	mov    %edi,%edx
f010dd81:	d3 ea                	shr    %cl,%edx
f010dd83:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010dd87:	09 c2                	or     %eax,%edx
f010dd89:	8b 45 f0             	mov    -0x10(%ebp),%eax
f010dd8c:	89 55 e8             	mov    %edx,-0x18(%ebp)
f010dd8f:	89 f2                	mov    %esi,%edx
f010dd91:	d3 e7                	shl    %cl,%edi
f010dd93:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010dd97:	89 7d ec             	mov    %edi,-0x14(%ebp)
f010dd9a:	8b 7d f0             	mov    -0x10(%ebp),%edi
f010dd9d:	d3 ea                	shr    %cl,%edx
f010dd9f:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010dda3:	d3 e6                	shl    %cl,%esi
f010dda5:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010dda9:	d3 e8                	shr    %cl,%eax
f010ddab:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010ddaf:	09 f0                	or     %esi,%eax
f010ddb1:	f7 75 e8             	divl   -0x18(%ebp)
f010ddb4:	d3 e7                	shl    %cl,%edi
f010ddb6:	89 d1                	mov    %edx,%ecx
f010ddb8:	f7 65 ec             	mull   -0x14(%ebp)
f010ddbb:	39 d1                	cmp    %edx,%ecx
f010ddbd:	72 61                	jb     f010de20 <__umoddi3+0x160>
f010ddbf:	39 f8                	cmp    %edi,%eax
f010ddc1:	77 55                	ja     f010de18 <__umoddi3+0x158>
f010ddc3:	89 ce                	mov    %ecx,%esi
f010ddc5:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010ddc9:	29 c7                	sub    %eax,%edi
f010ddcb:	19 d6                	sbb    %edx,%esi
f010ddcd:	89 f2                	mov    %esi,%edx
f010ddcf:	d3 ef                	shr    %cl,%edi
f010ddd1:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010ddd5:	d3 e2                	shl    %cl,%edx
f010ddd7:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010dddb:	09 fa                	or     %edi,%edx
f010dddd:	d3 ee                	shr    %cl,%esi
f010dddf:	89 d0                	mov    %edx,%eax
f010dde1:	89 f2                	mov    %esi,%edx
f010dde3:	83 c4 20             	add    $0x20,%esp
f010dde6:	5e                   	pop    %esi
f010dde7:	5f                   	pop    %edi
f010dde8:	5d                   	pop    %ebp
f010dde9:	c3                   	ret    
f010ddea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010ddf0:	89 f0                	mov    %esi,%eax
f010ddf2:	31 f6                	xor    %esi,%esi
f010ddf4:	f7 f7                	div    %edi
f010ddf6:	8b 45 f0             	mov    -0x10(%ebp),%eax
f010ddf9:	f7 f7                	div    %edi
f010ddfb:	89 d0                	mov    %edx,%eax
f010ddfd:	89 f2                	mov    %esi,%edx
f010ddff:	83 c4 20             	add    $0x20,%esp
f010de02:	5e                   	pop    %esi
f010de03:	5f                   	pop    %edi
f010de04:	5d                   	pop    %ebp
f010de05:	c3                   	ret    
f010de06:	66 90                	xchg   %ax,%ax
f010de08:	29 f8                	sub    %edi,%eax
f010de0a:	19 d6                	sbb    %edx,%esi
f010de0c:	89 c2                	mov    %eax,%edx
f010de0e:	e9 06 ff ff ff       	jmp    f010dd19 <__umoddi3+0x59>
f010de13:	90                   	nop
f010de14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010de18:	39 ca                	cmp    %ecx,%edx
f010de1a:	75 a7                	jne    f010ddc3 <__umoddi3+0x103>
f010de1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010de20:	2b 45 ec             	sub    -0x14(%ebp),%eax
f010de23:	1b 55 e8             	sbb    -0x18(%ebp),%edx
f010de26:	eb 9b                	jmp    f010ddc3 <__umoddi3+0x103>
