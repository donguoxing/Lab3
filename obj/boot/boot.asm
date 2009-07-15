
obj/boot/boot.out:     file format elf32-i386


Disassembly of section .text:

00007c00 <start>:
.set CR0_PE_ON,      0x1         # protected mode enable flag

.globl start
start:
  .code16                     # Assemble for 16-bit mode
  cli                         # Disable interrupts
    7c00:	fa                   	cli    
  cld                         # String operations increment
    7c01:	fc                   	cld    

  # Set up the important data segment registers (DS, ES, SS).
  xorw    %ax,%ax             # Segment number zero
    7c02:	31 c0                	xor    %eax,%eax
  movw    %ax,%ds             # -> Data Segment
    7c04:	8e d8                	mov    %eax,%ds
  movw    %ax,%es             # -> Extra Segment
    7c06:	8e c0                	mov    %eax,%es
  movw    %ax,%ss             # -> Stack Segment
    7c08:	8e d0                	mov    %eax,%ss

00007c0a <seta20.1>:
  # Enable A20:
  #   For backwards compatibility with the earliest PCs, physical
  #   address line 20 is tied low, so that addresses higher than
  #   1MB wrap around to zero by default.  This code undoes this.
seta20.1:
  inb     $0x64,%al               # Wait for not busy
    7c0a:	e4 64                	in     $0x64,%al
  testb   $0x2,%al
    7c0c:	a8 02                	test   $0x2,%al
  jnz     seta20.1
    7c0e:	75 fa                	jne    7c0a <seta20.1>

  movb    $0xd1,%al               # 0xd1 -> port 0x64
    7c10:	b0 d1                	mov    $0xd1,%al
  outb    %al,$0x64
    7c12:	e6 64                	out    %al,$0x64

00007c14 <seta20.2>:

seta20.2:
  inb     $0x64,%al               # Wait for not busy
    7c14:	e4 64                	in     $0x64,%al
  testb   $0x2,%al
    7c16:	a8 02                	test   $0x2,%al
  jnz     seta20.2
    7c18:	75 fa                	jne    7c14 <seta20.2>

  movb    $0xdf,%al               # 0xdf -> port 0x60
    7c1a:	b0 df                	mov    $0xdf,%al
  outb    %al,$0x60
    7c1c:	e6 60                	out    %al,$0x60

  # Switch from real to protected mode, using a bootstrap GDT
  # and segment translation that makes virtual addresses 
  # identical to their physical addresses, so that the 
  # effective memory map does not change during the switch.
  lgdt    gdtdesc
    7c1e:	0f 01 16             	lgdtl  (%esi)
    7c21:	64                   	fs
    7c22:	7c 0f                	jl     7c33 <protcseg+0x1>
  movl    %cr0, %eax
    7c24:	20 c0                	and    %al,%al
  orl     $CR0_PE_ON, %eax
    7c26:	66 83 c8 01          	or     $0x1,%ax
  movl    %eax, %cr0
    7c2a:	0f 22 c0             	mov    %eax,%cr0
  
  # Jump to next instruction, but in 32-bit code segment.
  # Switches processor into 32-bit mode.
  ljmp    $PROT_MODE_CSEG, $protcseg
    7c2d:	ea 32 7c 08 00 66 b8 	ljmp   $0xb866,$0x87c32

00007c32 <protcseg>:

  .code32                     # Assemble for 32-bit mode
protcseg:
  # Set up the protected-mode data segment registers
  movw    $PROT_MODE_DSEG, %ax    # Our data segment selector
    7c32:	66 b8 10 00          	mov    $0x10,%ax
  movw    %ax, %ds                # -> DS: Data Segment
    7c36:	8e d8                	mov    %eax,%ds
  movw    %ax, %es                # -> ES: Extra Segment
    7c38:	8e c0                	mov    %eax,%es
  movw    %ax, %fs                # -> FS
    7c3a:	8e e0                	mov    %eax,%fs
  movw    %ax, %gs                # -> GS
    7c3c:	8e e8                	mov    %eax,%gs
  movw    %ax, %ss                # -> SS: Stack Segment
    7c3e:	8e d0                	mov    %eax,%ss
  
  # Set up the stack pointer and call into C.
  movl    $start, %esp
    7c40:	bc 00 7c 00 00       	mov    $0x7c00,%esp
  call bootmain
    7c45:	e8 f1 00 00 00       	call   7d3b <bootmain>

00007c4a <spin>:

  # If bootmain returns (it shouldn't), loop.
spin:
  jmp spin
    7c4a:	eb fe                	jmp    7c4a <spin>

00007c4c <gdt>:
	...
    7c54:	ff                   	(bad)  
    7c55:	ff 00                	incl   (%eax)
    7c57:	00 00                	add    %al,(%eax)
    7c59:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    7c60:	00 92 cf 00 17 00    	add    %dl,0x1700cf(%edx)

00007c64 <gdtdesc>:
    7c64:	17                   	pop    %ss
    7c65:	00 4c 7c 00          	add    %cl,0x0(%esp,%edi,2)
    7c69:	00 90 90 55 ba f7    	add    %dl,-0x845aa70(%eax)

00007c6c <_Z8waitdiskv>:
	while (end_va < memsz)
		*((uint8_t*) end_va++) = 0;
}

void
waitdisk(void)
    7c6c:	55                   	push   %ebp

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
    7c6d:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7c72:	89 e5                	mov    %esp,%ebp
    7c74:	ec                   	in     (%dx),%al
{
	// wait for disk reaady
	while ((inb(0x1F7) & 0xC0) != 0x40)
    7c75:	25 c0 00 00 00       	and    $0xc0,%eax
    7c7a:	83 f8 40             	cmp    $0x40,%eax
    7c7d:	75 f5                	jne    7c74 <_Z8waitdiskv+0x8>
		/* do nothing */;
}
    7c7f:	5d                   	pop    %ebp
    7c80:	c3                   	ret    

00007c81 <_Z8readsectPvj>:

void
readsect(void *dst, uint32_t offset)
    7c81:	55                   	push   %ebp
    7c82:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7c87:	89 e5                	mov    %esp,%ebp
    7c89:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7c8c:	57                   	push   %edi
    7c8d:	ec                   	in     (%dx),%al

void
waitdisk(void)
{
	// wait for disk reaady
	while ((inb(0x1F7) & 0xC0) != 0x40)
    7c8e:	25 c0 00 00 00       	and    $0xc0,%eax
    7c93:	83 f8 40             	cmp    $0x40,%eax
    7c96:	75 f5                	jne    7c8d <_Z8readsectPvj+0xc>
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
    7c98:	ba f2 01 00 00       	mov    $0x1f2,%edx
    7c9d:	b0 01                	mov    $0x1,%al
    7c9f:	ee                   	out    %al,(%dx)
    7ca0:	b2 f3                	mov    $0xf3,%dl
    7ca2:	88 c8                	mov    %cl,%al
    7ca4:	ee                   	out    %al,(%dx)
    7ca5:	c1 e9 08             	shr    $0x8,%ecx
    7ca8:	b2 f4                	mov    $0xf4,%dl
    7caa:	88 c8                	mov    %cl,%al
    7cac:	ee                   	out    %al,(%dx)
    7cad:	c1 e9 08             	shr    $0x8,%ecx
    7cb0:	b2 f5                	mov    $0xf5,%dl
    7cb2:	88 c8                	mov    %cl,%al
    7cb4:	ee                   	out    %al,(%dx)
    7cb5:	c1 e9 08             	shr    $0x8,%ecx
    7cb8:	b2 f6                	mov    $0xf6,%dl
    7cba:	88 c8                	mov    %cl,%al
    7cbc:	83 c8 e0             	or     $0xffffffe0,%eax
    7cbf:	ee                   	out    %al,(%dx)
    7cc0:	b0 20                	mov    $0x20,%al
    7cc2:	b2 f7                	mov    $0xf7,%dl
    7cc4:	ee                   	out    %al,(%dx)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
    7cc5:	ec                   	in     (%dx),%al
    7cc6:	25 c0 00 00 00       	and    $0xc0,%eax
    7ccb:	83 f8 40             	cmp    $0x40,%eax
    7cce:	75 f5                	jne    7cc5 <_Z8readsectPvj+0x44>
insl(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsl"			:
			 "=D" (addr), "=c" (cnt)		:
			 "d" (port), "0" (addr), "1" (cnt)	:
			 "memory", "cc");
    7cd0:	8b 7d 08             	mov    0x8(%ebp),%edi
    7cd3:	b9 80 00 00 00       	mov    $0x80,%ecx
    7cd8:	ba f0 01 00 00       	mov    $0x1f0,%edx
    7cdd:	fc                   	cld    
    7cde:	f2 6d                	repnz insl (%dx),%es:(%edi)
	// wait for disk to be ready
	waitdisk();

	// read a sector
	insl(0x1F0, dst, SECTSIZE/4);
}
    7ce0:	5f                   	pop    %edi
    7ce1:	5d                   	pop    %ebp
    7ce2:	c3                   	ret    

00007ce3 <_Z7readsegjjjj>:
}

// Read 'filesz' bytes at 'offset' from kernel into virtual address 'va',
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
void
readseg(uint32_t va, uint32_t filesz, uint32_t memsz, uint32_t offset)
    7ce3:	55                   	push   %ebp
    7ce4:	89 e5                	mov    %esp,%ebp
    7ce6:	57                   	push   %edi
    7ce7:	56                   	push   %esi
    7ce8:	53                   	push   %ebx
    7ce9:	83 ec 04             	sub    $0x4,%esp
    7cec:	8b 4d 08             	mov    0x8(%ebp),%ecx
{
	uint32_t end_va;

	va &= 0xFFFFFF;
	end_va = va + filesz;
    7cef:	8b 7d 0c             	mov    0xc(%ebp),%edi
}

// Read 'filesz' bytes at 'offset' from kernel into virtual address 'va',
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
void
readseg(uint32_t va, uint32_t filesz, uint32_t memsz, uint32_t offset)
    7cf2:	8b 55 14             	mov    0x14(%ebp),%edx
{
	uint32_t end_va;

	va &= 0xFFFFFF;
    7cf5:	89 c8                	mov    %ecx,%eax
	end_va = va + filesz;
	memsz += va;
	
	// round down to sector boundary
	va &= ~(SECTSIZE - 1);
    7cf7:	89 cb                	mov    %ecx,%ebx
void
readseg(uint32_t va, uint32_t filesz, uint32_t memsz, uint32_t offset)
{
	uint32_t end_va;

	va &= 0xFFFFFF;
    7cf9:	25 ff ff ff 00       	and    $0xffffff,%eax
	end_va = va + filesz;
	memsz += va;
	
	// round down to sector boundary
	va &= ~(SECTSIZE - 1);
    7cfe:	81 e3 00 fe ff 00    	and    $0xfffe00,%ebx
readseg(uint32_t va, uint32_t filesz, uint32_t memsz, uint32_t offset)
{
	uint32_t end_va;

	va &= 0xFFFFFF;
	end_va = va + filesz;
    7d04:	01 c7                	add    %eax,%edi
	memsz += va;
    7d06:	03 45 10             	add    0x10(%ebp),%eax
	
	// round down to sector boundary
	va &= ~(SECTSIZE - 1);

	// translate from bytes to sectors, and kernel starts at sector 1
	offset = (offset / SECTSIZE) + 1;
    7d09:	c1 ea 09             	shr    $0x9,%edx
    7d0c:	8d 72 01             	lea    0x1(%edx),%esi
{
	uint32_t end_va;

	va &= 0xFFFFFF;
	end_va = va + filesz;
	memsz += va;
    7d0f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7d12:	eb 10                	jmp    7d24 <_Z7readsegjjjj+0x41>
	// translate from bytes to sectors, and kernel starts at sector 1
	offset = (offset / SECTSIZE) + 1;

	// read sectors
	while (va < end_va) {
		readsect((uint8_t*) va, offset);
    7d14:	56                   	push   %esi
		va += SECTSIZE;
		offset++;
    7d15:	46                   	inc    %esi
	// translate from bytes to sectors, and kernel starts at sector 1
	offset = (offset / SECTSIZE) + 1;

	// read sectors
	while (va < end_va) {
		readsect((uint8_t*) va, offset);
    7d16:	53                   	push   %ebx
		va += SECTSIZE;
    7d17:	81 c3 00 02 00 00    	add    $0x200,%ebx
	// translate from bytes to sectors, and kernel starts at sector 1
	offset = (offset / SECTSIZE) + 1;

	// read sectors
	while (va < end_va) {
		readsect((uint8_t*) va, offset);
    7d1d:	e8 5f ff ff ff       	call   7c81 <_Z8readsectPvj>
		va += SECTSIZE;
		offset++;
    7d22:	58                   	pop    %eax
    7d23:	5a                   	pop    %edx

	// translate from bytes to sectors, and kernel starts at sector 1
	offset = (offset / SECTSIZE) + 1;

	// read sectors
	while (va < end_va) {
    7d24:	39 fb                	cmp    %edi,%ebx
    7d26:	72 ec                	jb     7d14 <_Z7readsegjjjj+0x31>
    7d28:	eb 04                	jmp    7d2e <_Z7readsegjjjj+0x4b>
		offset++;
	}

	// clear bss segment
	while (end_va < memsz)
		*((uint8_t*) end_va++) = 0;
    7d2a:	c6 07 00             	movb   $0x0,(%edi)
    7d2d:	47                   	inc    %edi
		va += SECTSIZE;
		offset++;
	}

	// clear bss segment
	while (end_va < memsz)
    7d2e:	3b 7d f0             	cmp    -0x10(%ebp),%edi
    7d31:	72 f7                	jb     7d2a <_Z7readsegjjjj+0x47>
		*((uint8_t*) end_va++) = 0;
}
    7d33:	8d 65 f4             	lea    -0xc(%ebp),%esp
    7d36:	5b                   	pop    %ebx
    7d37:	5e                   	pop    %esi
    7d38:	5f                   	pop    %edi
    7d39:	5d                   	pop    %ebp
    7d3a:	c3                   	ret    

00007d3b <bootmain>:
void readsect(void *addr, uint32_t sectornum);
void readseg(uint32_t va, uint32_t filesz, uint32_t memsz, uint32_t offset);

extern "C" {
void
bootmain(void)
    7d3b:	55                   	push   %ebp
    7d3c:	89 e5                	mov    %esp,%ebp
    7d3e:	56                   	push   %esi
    7d3f:	53                   	push   %ebx
{
	struct Proghdr *ph, *eph;

	// read 1st page off disk
	readseg((uint32_t) ELFHDR, PAGESIZE, PAGESIZE, 0);
    7d40:	6a 00                	push   $0x0
    7d42:	68 00 10 00 00       	push   $0x1000
    7d47:	68 00 10 00 00       	push   $0x1000
    7d4c:	68 00 00 01 00       	push   $0x10000
    7d51:	e8 8d ff ff ff       	call   7ce3 <_Z7readsegjjjj>

	// is this a valid ELF?
	if (ELFHDR->e_magic != ELF_MAGIC)
    7d56:	83 c4 10             	add    $0x10,%esp
    7d59:	81 3d 00 00 01 00 7f 	cmpl   $0x464c457f,0x10000
    7d60:	45 4c 46 
    7d63:	75 41                	jne    7da6 <bootmain+0x6b>
		goto bad;

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr *) ((uint8_t *) ELFHDR + ELFHDR->e_phoff);
    7d65:	a1 1c 00 01 00       	mov    0x1001c,%eax
    7d6a:	8d 98 00 00 01 00    	lea    0x10000(%eax),%ebx
	eph = ph + ELFHDR->e_phnum;
    7d70:	0f b7 05 2c 00 01 00 	movzwl 0x1002c,%eax
    7d77:	c1 e0 05             	shl    $0x5,%eax
    7d7a:	8d 34 03             	lea    (%ebx,%eax,1),%esi
    7d7d:	eb 17                	jmp    7d96 <bootmain+0x5b>
	for (; ph < eph; ph++)
		readseg(ph->p_va, ph->p_filesz, ph->p_memsz, ph->p_offset);
    7d7f:	ff 73 04             	pushl  0x4(%ebx)
    7d82:	ff 73 14             	pushl  0x14(%ebx)
    7d85:	ff 73 10             	pushl  0x10(%ebx)
    7d88:	ff 73 08             	pushl  0x8(%ebx)
		goto bad;

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr *) ((uint8_t *) ELFHDR + ELFHDR->e_phoff);
	eph = ph + ELFHDR->e_phnum;
	for (; ph < eph; ph++)
    7d8b:	83 c3 20             	add    $0x20,%ebx
		readseg(ph->p_va, ph->p_filesz, ph->p_memsz, ph->p_offset);
    7d8e:	e8 50 ff ff ff       	call   7ce3 <_Z7readsegjjjj>
		goto bad;

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr *) ((uint8_t *) ELFHDR + ELFHDR->e_phoff);
	eph = ph + ELFHDR->e_phnum;
	for (; ph < eph; ph++)
    7d93:	83 c4 10             	add    $0x10,%esp
    7d96:	39 f3                	cmp    %esi,%ebx
    7d98:	72 e5                	jb     7d7f <bootmain+0x44>
		readseg(ph->p_va, ph->p_filesz, ph->p_memsz, ph->p_offset);

	// call the entry point from the ELF header
	// note: does not return!
	((void (*)(void)) (ELFHDR->e_entry & 0xFFFFFF))();
    7d9a:	a1 18 00 01 00       	mov    0x10018,%eax
    7d9f:	25 ff ff ff 00       	and    $0xffffff,%eax
    7da4:	ff d0                	call   *%eax
}

static __inline void
outw(int port, uint16_t data)
{
	__asm __volatile("outw %0,%w1" : : "a" (data), "d" (port));
    7da6:	ba 00 8a 00 00       	mov    $0x8a00,%edx
    7dab:	b8 00 8a ff ff       	mov    $0xffff8a00,%eax
    7db0:	66 ef                	out    %ax,(%dx)
    7db2:	b8 00 8e ff ff       	mov    $0xffff8e00,%eax
    7db7:	66 ef                	out    %ax,(%dx)

bad:
	outw(0x8A00, 0x8A00);
	outw(0x8A00, 0x8E00);
	/* boot.S will spin for us */
}
    7db9:	8d 65 f8             	lea    -0x8(%ebp),%esp
    7dbc:	5b                   	pop    %ebx
    7dbd:	5e                   	pop    %esi
    7dbe:	5d                   	pop    %ebp
    7dbf:	c3                   	ret    
