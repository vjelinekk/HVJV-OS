
elf/process_2.elf:     file format elf32-i386


Disassembly of section .text:

00008000 <_start>:
_start():
/home/viktor/HVJV-OS/user_space/crt0.S:5
.global _start

_start:
    # Call main(argc, argv)
    call main
    8000:	e8 0b 00 00 00       	call   8010 <main>
    8005:	66 90                	xchg   %ax,%ax
    8007:	66 90                	xchg   %ax,%ax
    8009:	66 90                	xchg   %ax,%ax
    800b:	66 90                	xchg   %ax,%ax
    800d:	66 90                	xchg   %ax,%ax
    800f:	90                   	nop

00008010 <main>:
main():
/home/viktor/HVJV-OS/user_space/process_2/main.c:3

int main() {
    while (1) {
    8010:	eb fe                	jmp    8010 <main>

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	3f                   	aas
   1:	00 00                	add    %al,(%eax)
   3:	00 05 00 04 00 2a    	add    %al,0x2a000400
   9:	00 00                	add    %al,(%eax)
   b:	00 01                	add    %al,(%ecx)
   d:	01 01                	add    %eax,(%ecx)
   f:	fb                   	sti
  10:	0e                   	push   %cs
  11:	0d 00 01 01 01       	or     $0x1010100,%eax
  16:	01 00                	add    %eax,(%eax)
  18:	00 00                	add    %al,(%eax)
  1a:	01 00                	add    %eax,(%eax)
  1c:	00 01                	add    %al,(%ecx)
  1e:	01 01                	add    %eax,(%ecx)
  20:	1f                   	pop    %ds
  21:	01 00                	add    %eax,(%eax)
  23:	00 00                	add    %al,(%eax)
  25:	00 02                	add    %al,(%edx)
  27:	01 1f                	add    %ebx,(%edi)
  29:	02 0f                	add    (%edi),%cl
  2b:	02 20                	add    (%eax),%ah
  2d:	00 00                	add    %al,(%eax)
  2f:	00 00                	add    %al,(%eax)
  31:	20 00                	and    %al,(%eax)
  33:	00 00                	add    %al,(%eax)
  35:	00 00                	add    %al,(%eax)
  37:	05 02 00 80 00       	add    $0x800002,%eax
  3c:	00 16                	add    %dl,(%esi)
  3e:	02 05 00 01 01 4c    	add    0x4c010100,%al
  44:	00 00                	add    %al,(%eax)
  46:	00 05 00 04 00 2e    	add    %al,0x2e000400
  4c:	00 00                	add    %al,(%eax)
  4e:	00 01                	add    %al,(%ecx)
  50:	01 01                	add    %eax,(%ecx)
  52:	fb                   	sti
  53:	0e                   	push   %cs
  54:	0d 00 01 01 01       	or     $0x1010100,%eax
  59:	01 00                	add    %eax,(%eax)
  5b:	00 00                	add    %al,(%eax)
  5d:	01 00                	add    %eax,(%eax)
  5f:	00 01                	add    %al,(%ecx)
  61:	01 01                	add    %eax,(%ecx)
  63:	1f                   	pop    %ds
  64:	02 00                	add    (%eax),%al
  66:	00 00                	add    %al,(%eax)
  68:	00 38                	add    %bh,(%eax)
  6a:	00 00                	add    %al,(%eax)
  6c:	00 02                	add    %al,(%edx)
  6e:	01 1f                	add    %ebx,(%edi)
  70:	02 0f                	add    (%edi),%cl
  72:	02 31                	add    (%ecx),%dh
  74:	00 00                	add    %al,(%eax)
  76:	00 01                	add    %al,(%ecx)
  78:	31 00                	xor    %eax,(%eax)
  7a:	00 00                	add    %al,(%eax)
  7c:	01 05 0c 00 05 02    	add    %eax,0x205000c
  82:	10 80 00 00 13 05    	adc    %al,0x5130000(%eax)
  88:	05 13 14 05 0b       	add    $0xb051413,%eax
  8d:	10 02                	adc    %al,(%edx)
  8f:	02 00                	add    (%eax),%al
  91:	01 01                	add    %eax,(%ecx)

Disassembly of section .debug_line_str:

00000000 <.debug_line_str>:
   0:	2f                   	das
   1:	68 6f 6d 65 2f       	push   $0x2f656d6f
   6:	76 69                	jbe    71 <_start-0x7f8f>
   8:	6b 74 6f 72 2f       	imul   $0x2f,0x72(%edi,%ebp,2),%esi
   d:	48                   	dec    %eax
   e:	56                   	push   %esi
   f:	4a                   	dec    %edx
  10:	56                   	push   %esi
  11:	2d 4f 53 2f 75       	sub    $0x752f534f,%eax
  16:	73 65                	jae    7d <_start-0x7f83>
  18:	72 5f                	jb     79 <_start-0x7f87>
  1a:	73 70                	jae    8c <_start-0x7f74>
  1c:	61                   	popa
  1d:	63 65 00             	arpl   %esp,0x0(%ebp)
  20:	63 72 74             	arpl   %esi,0x74(%edx)
  23:	30 2e                	xor    %ch,(%esi)
  25:	53                   	push   %ebx
  26:	00 70 72             	add    %dh,0x72(%eax)
  29:	6f                   	outsl  %ds:(%esi),(%dx)
  2a:	63 65 73             	arpl   %esp,0x73(%ebp)
  2d:	73 5f                	jae    8e <_start-0x7f72>
  2f:	32 2f                	xor    (%edi),%ch
  31:	6d                   	insl   (%dx),%es:(%edi)
  32:	61                   	popa
  33:	69 6e 2e 63 00 70 72 	imul   $0x72700063,0x2e(%esi),%ebp
  3a:	6f                   	outsl  %ds:(%esi),(%dx)
  3b:	63 65 73             	arpl   %esp,0x73(%ebp)
  3e:	73 5f                	jae    9f <_start-0x7f61>
  40:	32 00                	xor    (%eax),%al

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	20 00                	and    %al,(%eax)
   2:	00 00                	add    %al,(%eax)
   4:	05 00 01 04 00       	add    $0x40100,%eax
   9:	00 00                	add    %al,(%eax)
   b:	00 01                	add    %al,(%ecx)
   d:	00 00                	add    %al,(%eax)
   f:	00 00                	add    %al,(%eax)
  11:	00 80 00 00 05 00    	add    %al,0x50000(%eax)
  17:	00 00                	add    %al,(%eax)
  19:	00 07                	add    %al,(%edi)
  1b:	00 00                	add    %al,(%eax)
  1d:	00 27                	add    %ah,(%edi)
  1f:	00 00                	add    %al,(%eax)
  21:	00 01                	add    %al,(%ecx)
  23:	80 40 00 00          	addb   $0x0,0x0(%eax)
  27:	00 05 00 01 04 14    	add    %al,0x14040100
  2d:	00 00                	add    %al,(%eax)
  2f:	00 01                	add    %al,(%ecx)
  31:	35 00 00 00 1d       	xor    $0x1d000000,%eax
  36:	27                   	daa
  37:	00 00                	add    %al,(%eax)
  39:	00 00                	add    %al,(%eax)
  3b:	00 00                	add    %al,(%eax)
  3d:	00 0c 00             	add    %cl,(%eax,%eax,1)
  40:	00 00                	add    %al,(%eax)
  42:	00 00                	add    %al,(%eax)
  44:	00 00                	add    %al,(%eax)
  46:	43                   	inc    %ebx
  47:	00 00                	add    %al,(%eax)
  49:	00 02                	add    %al,(%edx)
  4b:	7b 00                	jnp    4d <_start-0x7fb3>
  4d:	00 00                	add    %al,(%eax)
  4f:	01 02                	add    %eax,(%edx)
  51:	05 3c 00 00 00       	add    $0x3c,%eax
  56:	10 80 00 00 02 00    	adc    %al,0x20000(%eax)
  5c:	00 00                	add    %al,(%eax)
  5e:	01 9c 03 04 05 69 6e 	add    %ebx,0x6e690504(%ebx,%eax,1)
  65:	74 00                	je     67 <_start-0x7f99>
	...

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%ecx)
   2:	00 10                	add    %dl,(%eax)
   4:	17                   	pop    %ss
   5:	11 01                	adc    %eax,(%ecx)
   7:	12 0f                	adc    (%edi),%cl
   9:	03 0e                	add    (%esi),%ecx
   b:	1b 0e                	sbb    (%esi),%ecx
   d:	25 0e 13 05 00       	and    $0x5130e,%eax
  12:	00 00                	add    %al,(%eax)
  14:	01 11                	add    %edx,(%ecx)
  16:	01 25 0e 13 0b 03    	add    %esp,0x30b130e
  1c:	1f                   	pop    %ds
  1d:	1b 1f                	sbb    (%edi),%ebx
  1f:	55                   	push   %ebp
  20:	17                   	pop    %ss
  21:	11 01                	adc    %eax,(%ecx)
  23:	10 17                	adc    %dl,(%edi)
  25:	00 00                	add    %al,(%eax)
  27:	02 2e                	add    (%esi),%ch
  29:	00 3f                	add    %bh,(%edi)
  2b:	19 03                	sbb    %eax,(%ebx)
  2d:	0e                   	push   %cs
  2e:	3a 0b                	cmp    (%ebx),%cl
  30:	3b 0b                	cmp    (%ebx),%ecx
  32:	39 0b                	cmp    %ecx,(%ebx)
  34:	49                   	dec    %ecx
  35:	13 11                	adc    (%ecx),%edx
  37:	01 12                	add    %edx,(%edx)
  39:	06                   	push   %es
  3a:	40                   	inc    %eax
  3b:	18 7a 19             	sbb    %bh,0x19(%edx)
  3e:	00 00                	add    %al,(%eax)
  40:	03 24 00             	add    (%eax,%eax,1),%esp
  43:	0b 0b                	or     (%ebx),%ecx
  45:	3e 0b 03             	or     %ds:(%ebx),%eax
  48:	08 00                	or     %al,(%eax)
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	1c 00                	sbb    $0x0,%al
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 00                	add    $0x0,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	00 80 00 00 05 00    	add    %al,0x50000(%eax)
	...
  1e:	00 00                	add    %al,(%eax)
  20:	1c 00                	sbb    $0x0,%al
  22:	00 00                	add    %al,(%eax)
  24:	02 00                	add    (%eax),%al
  26:	24 00                	and    $0x0,%al
  28:	00 00                	add    %al,(%eax)
  2a:	04 00                	add    $0x0,%al
  2c:	00 00                	add    %al,(%eax)
  2e:	00 00                	add    %al,(%eax)
  30:	10 80 00 00 02 00    	adc    %al,0x20000(%eax)
	...

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	63 72 74             	arpl   %esi,0x74(%edx)
   3:	30 2e                	xor    %ch,(%esi)
   5:	53                   	push   %ebx
   6:	00 2f                	add    %ch,(%edi)
   8:	68 6f 6d 65 2f       	push   $0x2f656d6f
   d:	76 69                	jbe    78 <_start-0x7f88>
   f:	6b 74 6f 72 2f       	imul   $0x2f,0x72(%edi,%ebp,2),%esi
  14:	48                   	dec    %eax
  15:	56                   	push   %esi
  16:	4a                   	dec    %edx
  17:	56                   	push   %esi
  18:	2d 4f 53 2f 75       	sub    $0x752f534f,%eax
  1d:	73 65                	jae    84 <_start-0x7f7c>
  1f:	72 5f                	jb     80 <_start-0x7f80>
  21:	73 70                	jae    93 <_start-0x7f6d>
  23:	61                   	popa
  24:	63 65 00             	arpl   %esp,0x0(%ebp)
  27:	47                   	inc    %edi
  28:	4e                   	dec    %esi
  29:	55                   	push   %ebp
  2a:	20 41 53             	and    %al,0x53(%ecx)
  2d:	20 32                	and    %dh,(%edx)
  2f:	2e 34 33             	cs xor $0x33,%al
  32:	2e 31 00             	xor    %eax,%cs:(%eax)
  35:	47                   	inc    %edi
  36:	4e                   	dec    %esi
  37:	55                   	push   %ebp
  38:	20 43 31             	and    %al,0x31(%ebx)
  3b:	37                   	aaa
  3c:	20 31                	and    %dh,(%ecx)
  3e:	34 2e                	xor    $0x2e,%al
  40:	32 2e                	xor    (%esi),%ch
  42:	30 20                	xor    %ah,(%eax)
  44:	2d 6d 74 75 6e       	sub    $0x6e75746d,%eax
  49:	65 3d 67 65 6e 65    	gs cmp $0x656e6567,%eax
  4f:	72 69                	jb     ba <_start-0x7f46>
  51:	63 20                	arpl   %esp,(%eax)
  53:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
  58:	68 3d 70 65 6e       	push   $0x6e65703d
  5d:	74 69                	je     c8 <_start-0x7f38>
  5f:	75 6d                	jne    ce <_start-0x7f32>
  61:	70 72                	jo     d5 <_start-0x7f2b>
  63:	6f                   	outsl  %ds:(%esi),(%dx)
  64:	20 2d 67 20 2d 4f    	and    %ch,0x4f2d2067
  6a:	32 20                	xor    (%eax),%ah
  6c:	2d 66 66 72 65       	sub    $0x65726666,%eax
  71:	65 73 74             	gs jae e8 <_start-0x7f18>
  74:	61                   	popa
  75:	6e                   	outsb  %ds:(%esi),(%dx)
  76:	64 69 6e 67 00 6d 61 	imul   $0x69616d00,%fs:0x67(%esi),%ebp
  7d:	69 
  7e:	6e                   	outsb  %ds:(%esi),(%dx)
	...

Disassembly of section .debug_rnglists:

00000000 <.debug_rnglists>:
   0:	0f 00 00             	sldt   (%eax)
   3:	00 05 00 04 00 00    	add    %al,0x400
   9:	00 00                	add    %al,(%eax)
   b:	00 07                	add    %al,(%edi)
   d:	10 80 00 00 02 00    	adc    %al,0x20000(%eax)

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    %edi
   1:	43                   	inc    %ebx
   2:	43                   	inc    %ebx
   3:	3a 20                	cmp    (%eax),%ah
   5:	28 47 4e             	sub    %al,0x4e(%edi)
   8:	55                   	push   %ebp
   9:	29 20                	sub    %esp,(%eax)
   b:	31 34 2e             	xor    %esi,(%esi,%ebp,1)
   e:	32 2e                	xor    (%esi),%ch
  10:	30 00                	xor    %al,(%eax)

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	10 00                	adc    %al,(%eax)
   2:	00 00                	add    %al,(%eax)
   4:	ff                   	(bad)
   5:	ff                   	(bad)
   6:	ff                   	(bad)
   7:	ff 01                	incl   (%ecx)
   9:	00 01                	add    %al,(%ecx)
   b:	7c 08                	jl     15 <_start-0x7feb>
   d:	0c 04                	or     $0x4,%al
   f:	04 88                	add    $0x88,%al
  11:	01 00                	add    %eax,(%eax)
  13:	00 0c 00             	add    %cl,(%eax,%eax,1)
  16:	00 00                	add    %al,(%eax)
  18:	00 00                	add    %al,(%eax)
  1a:	00 00                	add    %al,(%eax)
  1c:	10 80 00 00 02 00    	adc    %al,0x20000(%eax)
	...
