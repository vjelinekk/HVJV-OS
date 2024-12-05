
elf/process_1.elf:     file format elf32-i386


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
/home/viktor/HVJV-OS/user_space/process_1/main.c:3
#include <stdio.h>

int main() {
    8010:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    8014:	83 e4 f0             	and    $0xfffffff0,%esp
    8017:	ff 71 fc             	push   -0x4(%ecx)
    801a:	55                   	push   %ebp
    801b:	89 e5                	mov    %esp,%ebp
    801d:	51                   	push   %ecx
    801e:	83 ec 10             	sub    $0x10,%esp
/home/viktor/HVJV-OS/user_space/process_1/main.c:4
    printf("Test\n");
    8021:	68 9c 88 00 00       	push   $0x889c
    8026:	e8 15 00 00 00       	call   8040 <printf>
/home/viktor/HVJV-OS/user_space/process_1/main.c:7

    return 0;
}
    802b:	8b 4d fc             	mov    -0x4(%ebp),%ecx
    802e:	31 c0                	xor    %eax,%eax
    8030:	c9                   	leave
    8031:	8d 61 fc             	lea    -0x4(%ecx),%esp
    8034:	c3                   	ret
    8035:	66 90                	xchg   %ax,%ax
    8037:	66 90                	xchg   %ax,%ax
    8039:	66 90                	xchg   %ax,%ax
    803b:	66 90                	xchg   %ax,%ax
    803d:	66 90                	xchg   %ax,%ax
    803f:	90                   	nop

00008040 <printf>:
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:16
		if (putchar(bytes[i]) == EOF)
			return false;
	return true;
}

int printf(const char* restrict format, ...) {
    8040:	55                   	push   %ebp
    8041:	89 e5                	mov    %esp,%ebp
    8043:	57                   	push   %edi
    8044:	56                   	push   %esi
/home/viktor/HVJV-OS/libc/stdio/printf.c:18
    va_list parameters;
	va_start(parameters, format);
    8045:	8d 45 0c             	lea    0xc(%ebp),%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:16
int printf(const char* restrict format, ...) {
    8048:	53                   	push   %ebx
    8049:	83 ec 2c             	sub    $0x2c,%esp
    804c:	8b 4d 08             	mov    0x8(%ebp),%ecx
/home/viktor/HVJV-OS/libc/stdio/printf.c:18
	va_start(parameters, format);
    804f:	89 45 cc             	mov    %eax,-0x34(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:22

	int written = 0;

	while (*format != '\0') {
    8052:	0f b6 01             	movzbl (%ecx),%eax
    8055:	84 c0                	test   %al,%al
    8057:	0f 84 9a 06 00 00    	je     86f7 <printf+0x6b7>
/home/viktor/HVJV-OS/libc/stdio/printf.c:20
	int written = 0;
    805d:	31 d2                	xor    %edx,%edx
/home/viktor/HVJV-OS/libc/stdio/printf.c:104
            written += len;
		} else if (*format == 'b') {
            format++;
            int i = va_arg(parameters, int);
            char str[12];
            itoa(i, str, 2, 0);
    805f:	89 cb                	mov    %ecx,%ebx
    8061:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    8068:	00 
    8069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
/home/viktor/HVJV-OS/libc/stdio/printf.c:23
		size_t maxrem = INT_MAX - written;
    8070:	bf ff ff ff 7f       	mov    $0x7fffffff,%edi
    8075:	29 d7                	sub    %edx,%edi
/home/viktor/HVJV-OS/libc/stdio/printf.c:25
		if (format[0] != '%' || format[1] == '%') {
    8077:	3c 25                	cmp    $0x25,%al
    8079:	0f 85 bc 03 00 00    	jne    843b <printf+0x3fb>
/home/viktor/HVJV-OS/libc/stdio/printf.c:25 (discriminator 1)
    807f:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    8083:	3c 25                	cmp    $0x25,%al
    8085:	0f 84 ad 03 00 00    	je     8438 <printf+0x3f8>
    808b:	83 e8 62             	sub    $0x62,%eax
    808e:	3c 16                	cmp    $0x16,%al
    8090:	77 0e                	ja     80a0 <printf+0x60>
    8092:	0f b6 c0             	movzbl %al,%eax
    8095:	ff 24 85 a4 88 00 00 	jmp    *0x88a4(,%eax,4)
    809c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
/home/viktor/HVJV-OS/libc/stdio/printf.c:153
                    return -1;
                written += len;
            }
        } else {
			format = format_begun_at;
			size_t len = strlen(format);
    80a0:	83 ec 0c             	sub    $0xc,%esp
    80a3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    80a6:	53                   	push   %ebx
    80a7:	e8 d4 07 00 00       	call   8880 <strlen>
/home/viktor/HVJV-OS/libc/stdio/printf.c:154
			if (maxrem < len) {
    80ac:	83 c4 10             	add    $0x10,%esp
    80af:	39 c7                	cmp    %eax,%edi
    80b1:	72 3d                	jb     80f0 <printf+0xb0>
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:10 (discriminator 1)
	for (size_t i = 0; i < length; i++)
    80b3:	85 c0                	test   %eax,%eax
    80b5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    80b8:	8d 3c 03             	lea    (%ebx,%eax,1),%edi
    80bb:	0f 84 2f 06 00 00    	je     86f0 <printf+0x6b0>
    80c1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    80c4:	89 d6                	mov    %edx,%esi
    80c6:	eb 13                	jmp    80db <printf+0x9b>
    80c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    80cf:	00 
    80d0:	83 c3 01             	add    $0x1,%ebx
    80d3:	39 fb                	cmp    %edi,%ebx
    80d5:	0f 84 3c 04 00 00    	je     8517 <printf+0x4d7>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    80db:	0f b6 03             	movzbl (%ebx),%eax
    80de:	83 ec 0c             	sub    $0xc,%esp
    80e1:	50                   	push   %eax
    80e2:	e8 19 06 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    80e7:	83 c4 10             	add    $0x10,%esp
    80ea:	83 f8 ff             	cmp    $0xffffffff,%eax
    80ed:	75 e1                	jne    80d0 <printf+0x90>
    80ef:	90                   	nop
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:33
				return -1;
    80f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:167
		}
	}

	va_end(parameters);
	return written;
}
    80f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    80f8:	5b                   	pop    %ebx
    80f9:	5e                   	pop    %esi
    80fa:	5f                   	pop    %edi
    80fb:	5d                   	pop    %ebp
    80fc:	c3                   	ret
/home/viktor/HVJV-OS/libc/stdio/printf.c:88
            format++;
    80fd:	8d 43 02             	lea    0x2(%ebx),%eax
    8100:	89 55 c8             	mov    %edx,-0x38(%ebp)
    8103:	89 45 d4             	mov    %eax,-0x2c(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:89
            int i = va_arg(parameters, int);
    8106:	8b 45 cc             	mov    -0x34(%ebp),%eax
    8109:	8d 48 04             	lea    0x4(%eax),%ecx
    810c:	89 4d cc             	mov    %ecx,-0x34(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:91
            itoa(i, str, 16, 0);
    810f:	8d 4d dc             	lea    -0x24(%ebp),%ecx
    8112:	6a 00                	push   $0x0
    8114:	6a 10                	push   $0x10
    8116:	51                   	push   %ecx
    8117:	ff 30                	push   (%eax)
    8119:	e8 22 06 00 00       	call   8740 <itoa>
/home/viktor/HVJV-OS/libc/stdio/printf.c:92
            size_t len = strlen(str);
    811e:	8d 45 dc             	lea    -0x24(%ebp),%eax
    8121:	89 04 24             	mov    %eax,(%esp)
    8124:	e8 57 07 00 00       	call   8880 <strlen>
/home/viktor/HVJV-OS/libc/stdio/printf.c:93
            if (maxrem < len)
    8129:	83 c4 10             	add    $0x10,%esp
/home/viktor/HVJV-OS/libc/stdio/printf.c:92
            size_t len = strlen(str);
    812c:	89 45 d0             	mov    %eax,-0x30(%ebp)
    812f:	89 c6                	mov    %eax,%esi
/home/viktor/HVJV-OS/libc/stdio/printf.c:93
            if (maxrem < len)
    8131:	39 c7                	cmp    %eax,%edi
    8133:	72 bb                	jb     80f0 <printf+0xb0>
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    8135:	83 ec 0c             	sub    $0xc,%esp
    8138:	6a 30                	push   $0x30
    813a:	e8 c1 05 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    813f:	83 c4 10             	add    $0x10,%esp
    8142:	83 f8 ff             	cmp    $0xffffffff,%eax
    8145:	74 a9                	je     80f0 <printf+0xb0>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
    8147:	83 ec 0c             	sub    $0xc,%esp
    814a:	6a 78                	push   $0x78
    814c:	e8 af 05 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    8151:	83 c4 10             	add    $0x10,%esp
    8154:	83 f8 ff             	cmp    $0xffffffff,%eax
    8157:	74 97                	je     80f0 <printf+0xb0>
/home/viktor/HVJV-OS/libc/stdio/printf.c:10 (discriminator 1)
	for (size_t i = 0; i < length; i++)
    8159:	89 f0                	mov    %esi,%eax
    815b:	8d 7d dc             	lea    -0x24(%ebp),%edi
    815e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8161:	85 c0                	test   %eax,%eax
    8163:	8d 34 37             	lea    (%edi,%esi,1),%esi
    8166:	0f 84 81 03 00 00    	je     84ed <printf+0x4ad>
    816c:	89 5d 08             	mov    %ebx,0x8(%ebp)
    816f:	89 fb                	mov    %edi,%ebx
    8171:	89 d7                	mov    %edx,%edi
    8173:	eb 0e                	jmp    8183 <printf+0x143>
    8175:	8d 76 00             	lea    0x0(%esi),%esi
    8178:	83 c3 01             	add    $0x1,%ebx
    817b:	39 f3                	cmp    %esi,%ebx
    817d:	0f 84 65 03 00 00    	je     84e8 <printf+0x4a8>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    8183:	0f b6 03             	movzbl (%ebx),%eax
    8186:	83 ec 0c             	sub    $0xc,%esp
    8189:	50                   	push   %eax
    818a:	e8 71 05 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    818f:	83 c4 10             	add    $0x10,%esp
    8192:	83 f8 ff             	cmp    $0xffffffff,%eax
    8195:	75 e1                	jne    8178 <printf+0x138>
    8197:	e9 54 ff ff ff       	jmp    80f0 <printf+0xb0>
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:77
            format++;
    819c:	8d 43 02             	lea    0x2(%ebx),%eax
    819f:	89 55 c8             	mov    %edx,-0x38(%ebp)
    81a2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:78
            unsigned int i = va_arg(parameters, unsigned int);
    81a5:	8b 45 cc             	mov    -0x34(%ebp),%eax
    81a8:	8d 48 04             	lea    0x4(%eax),%ecx
    81ab:	89 4d d0             	mov    %ecx,-0x30(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:80
            itoa(i, str, 10, 1);
    81ae:	8d 4d dc             	lea    -0x24(%ebp),%ecx
    81b1:	6a 01                	push   $0x1
    81b3:	6a 0a                	push   $0xa
    81b5:	51                   	push   %ecx
    81b6:	ff 30                	push   (%eax)
    81b8:	e8 83 05 00 00       	call   8740 <itoa>
/home/viktor/HVJV-OS/libc/stdio/printf.c:81
            size_t len = strlen(str);
    81bd:	8d 45 dc             	lea    -0x24(%ebp),%eax
    81c0:	89 04 24             	mov    %eax,(%esp)
    81c3:	e8 b8 06 00 00       	call   8880 <strlen>
/home/viktor/HVJV-OS/libc/stdio/printf.c:82
            if (maxrem < len)
    81c8:	83 c4 10             	add    $0x10,%esp
/home/viktor/HVJV-OS/libc/stdio/printf.c:81
            size_t len = strlen(str);
    81cb:	89 c1                	mov    %eax,%ecx
/home/viktor/HVJV-OS/libc/stdio/printf.c:82
            if (maxrem < len)
    81cd:	39 c7                	cmp    %eax,%edi
    81cf:	0f 82 1b ff ff ff    	jb     80f0 <printf+0xb0>
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:10 (discriminator 1)
	for (size_t i = 0; i < length; i++)
    81d5:	8d 75 dc             	lea    -0x24(%ebp),%esi
    81d8:	85 c0                	test   %eax,%eax
    81da:	8b 55 c8             	mov    -0x38(%ebp),%edx
    81dd:	8d 3c 06             	lea    (%esi,%eax,1),%edi
    81e0:	0f 84 ea 02 00 00    	je     84d0 <printf+0x490>
    81e6:	89 5d 08             	mov    %ebx,0x8(%ebp)
    81e9:	89 f3                	mov    %esi,%ebx
    81eb:	89 d6                	mov    %edx,%esi
    81ed:	89 4d cc             	mov    %ecx,-0x34(%ebp)
    81f0:	eb 11                	jmp    8203 <printf+0x1c3>
    81f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    81f8:	83 c3 01             	add    $0x1,%ebx
    81fb:	39 fb                	cmp    %edi,%ebx
    81fd:	0f 84 c5 02 00 00    	je     84c8 <printf+0x488>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    8203:	0f b6 03             	movzbl (%ebx),%eax
    8206:	83 ec 0c             	sub    $0xc,%esp
    8209:	50                   	push   %eax
    820a:	e8 f1 04 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    820f:	83 c4 10             	add    $0x10,%esp
    8212:	83 f8 ff             	cmp    $0xffffffff,%eax
    8215:	75 e1                	jne    81f8 <printf+0x1b8>
    8217:	e9 d4 fe ff ff       	jmp    80f0 <printf+0xb0>
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:55
			format++;
    821c:	8d 43 02             	lea    0x2(%ebx),%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:57
			size_t len = strlen(str);
    821f:	83 ec 0c             	sub    $0xc,%esp
    8222:	89 55 c8             	mov    %edx,-0x38(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:55
			format++;
    8225:	89 45 d4             	mov    %eax,-0x2c(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:56
			const char* str = va_arg(parameters, const char*);
    8228:	8b 45 cc             	mov    -0x34(%ebp),%eax
    822b:	8b 30                	mov    (%eax),%esi
    822d:	8d 48 04             	lea    0x4(%eax),%ecx
    8230:	89 4d d0             	mov    %ecx,-0x30(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:57
			size_t len = strlen(str);
    8233:	56                   	push   %esi
    8234:	e8 47 06 00 00       	call   8880 <strlen>
/home/viktor/HVJV-OS/libc/stdio/printf.c:58
			if (maxrem < len) {
    8239:	83 c4 10             	add    $0x10,%esp
/home/viktor/HVJV-OS/libc/stdio/printf.c:57
			size_t len = strlen(str);
    823c:	89 c1                	mov    %eax,%ecx
/home/viktor/HVJV-OS/libc/stdio/printf.c:58
			if (maxrem < len) {
    823e:	39 c7                	cmp    %eax,%edi
    8240:	0f 82 aa fe ff ff    	jb     80f0 <printf+0xb0>
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:10 (discriminator 1)
	for (size_t i = 0; i < length; i++)
    8246:	85 c0                	test   %eax,%eax
    8248:	8b 55 c8             	mov    -0x38(%ebp),%edx
    824b:	8d 3c 06             	lea    (%esi,%eax,1),%edi
    824e:	0f 84 7c 02 00 00    	je     84d0 <printf+0x490>
    8254:	89 5d 08             	mov    %ebx,0x8(%ebp)
    8257:	89 f3                	mov    %esi,%ebx
    8259:	89 d6                	mov    %edx,%esi
    825b:	89 45 cc             	mov    %eax,-0x34(%ebp)
    825e:	eb 0b                	jmp    826b <printf+0x22b>
    8260:	83 c3 01             	add    $0x1,%ebx
    8263:	39 df                	cmp    %ebx,%edi
    8265:	0f 84 5d 02 00 00    	je     84c8 <printf+0x488>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    826b:	0f b6 03             	movzbl (%ebx),%eax
    826e:	83 ec 0c             	sub    $0xc,%esp
    8271:	50                   	push   %eax
    8272:	e8 89 04 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    8277:	83 c4 10             	add    $0x10,%esp
    827a:	83 f8 ff             	cmp    $0xffffffff,%eax
    827d:	75 e1                	jne    8260 <printf+0x220>
    827f:	e9 6c fe ff ff       	jmp    80f0 <printf+0xb0>
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:115
            if (*format == 'x') {
    8284:	0f b6 43 02          	movzbl 0x2(%ebx),%eax
    8288:	3c 78                	cmp    $0x78,%al
    828a:	0f 84 98 02 00 00    	je     8528 <printf+0x4e8>
/home/viktor/HVJV-OS/libc/stdio/printf.c:128
            } else if (*format == 'u') {
    8290:	3c 75                	cmp    $0x75,%al
    8292:	0f 84 54 03 00 00    	je     85ec <printf+0x5ac>
/home/viktor/HVJV-OS/libc/stdio/printf.c:139
            } else if (*format == 'd') {
    8298:	3c 64                	cmp    $0x64,%al
    829a:	0f 84 dc 03 00 00    	je     867c <printf+0x63c>
/home/viktor/HVJV-OS/libc/stdio/printf.c:114
            format++;
    82a0:	83 c3 02             	add    $0x2,%ebx
    82a3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    82aa:	00 
    82ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
/home/viktor/HVJV-OS/libc/stdio/printf.c:22
	while (*format != '\0') {
    82b0:	84 c0                	test   %al,%al
    82b2:	0f 85 b8 fd ff ff    	jne    8070 <printf+0x30>
/home/viktor/HVJV-OS/libc/stdio/printf.c:167
}
    82b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    82bb:	89 d0                	mov    %edx,%eax
    82bd:	5b                   	pop    %ebx
    82be:	5e                   	pop    %esi
    82bf:	5f                   	pop    %edi
    82c0:	5d                   	pop    %ebp
    82c1:	c3                   	ret
/home/viktor/HVJV-OS/libc/stdio/printf.c:66
            format++;
    82c2:	8d 43 02             	lea    0x2(%ebx),%eax
    82c5:	89 55 c8             	mov    %edx,-0x38(%ebp)
    82c8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:67
            int i = va_arg(parameters, int);
    82cb:	8b 45 cc             	mov    -0x34(%ebp),%eax
    82ce:	8d 48 04             	lea    0x4(%eax),%ecx
    82d1:	89 4d d0             	mov    %ecx,-0x30(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:69
            itoa(i, str, 10, 0);
    82d4:	8d 4d dc             	lea    -0x24(%ebp),%ecx
    82d7:	6a 00                	push   $0x0
    82d9:	6a 0a                	push   $0xa
    82db:	51                   	push   %ecx
    82dc:	ff 30                	push   (%eax)
    82de:	e8 5d 04 00 00       	call   8740 <itoa>
/home/viktor/HVJV-OS/libc/stdio/printf.c:70
            size_t len = strlen(str);
    82e3:	8d 45 dc             	lea    -0x24(%ebp),%eax
    82e6:	89 04 24             	mov    %eax,(%esp)
    82e9:	e8 92 05 00 00       	call   8880 <strlen>
/home/viktor/HVJV-OS/libc/stdio/printf.c:71
            if (maxrem < len)
    82ee:	83 c4 10             	add    $0x10,%esp
/home/viktor/HVJV-OS/libc/stdio/printf.c:70
            size_t len = strlen(str);
    82f1:	89 c1                	mov    %eax,%ecx
/home/viktor/HVJV-OS/libc/stdio/printf.c:71
            if (maxrem < len)
    82f3:	39 c7                	cmp    %eax,%edi
    82f5:	0f 82 f5 fd ff ff    	jb     80f0 <printf+0xb0>
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:10 (discriminator 1)
	for (size_t i = 0; i < length; i++)
    82fb:	8d 75 dc             	lea    -0x24(%ebp),%esi
    82fe:	85 c0                	test   %eax,%eax
    8300:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8303:	8d 3c 06             	lea    (%esi,%eax,1),%edi
    8306:	0f 84 c4 01 00 00    	je     84d0 <printf+0x490>
    830c:	89 5d 08             	mov    %ebx,0x8(%ebp)
    830f:	89 f3                	mov    %esi,%ebx
    8311:	89 d6                	mov    %edx,%esi
    8313:	89 4d cc             	mov    %ecx,-0x34(%ebp)
    8316:	eb 13                	jmp    832b <printf+0x2eb>
    8318:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    831f:	00 
    8320:	83 c3 01             	add    $0x1,%ebx
    8323:	39 df                	cmp    %ebx,%edi
    8325:	0f 84 9d 01 00 00    	je     84c8 <printf+0x488>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    832b:	0f b6 03             	movzbl (%ebx),%eax
    832e:	83 ec 0c             	sub    $0xc,%esp
    8331:	50                   	push   %eax
    8332:	e8 c9 03 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    8337:	83 c4 10             	add    $0x10,%esp
    833a:	83 f8 ff             	cmp    $0xffffffff,%eax
    833d:	75 e1                	jne    8320 <printf+0x2e0>
    833f:	e9 ac fd ff ff       	jmp    80f0 <printf+0xb0>
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:46
			char c = (char) va_arg(parameters, int /* char promotes to int */);
    8344:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    8347:	89 55 d4             	mov    %edx,-0x2c(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:45
			format++;
    834a:	8d 73 02             	lea    0x2(%ebx),%esi
/home/viktor/HVJV-OS/libc/stdio/printf.c:46
			char c = (char) va_arg(parameters, int /* char promotes to int */);
    834d:	89 c8                	mov    %ecx,%eax
    834f:	83 c1 04             	add    $0x4,%ecx
    8352:	89 4d cc             	mov    %ecx,-0x34(%ebp)
    8355:	8b 00                	mov    (%eax),%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:47
			if (!maxrem) {
    8357:	85 ff                	test   %edi,%edi
    8359:	0f 84 91 fd ff ff    	je     80f0 <printf+0xb0>
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    835f:	83 ec 0c             	sub    $0xc,%esp
    8362:	0f b6 c0             	movzbl %al,%eax
    8365:	50                   	push   %eax
    8366:	e8 95 03 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    836b:	83 c4 10             	add    $0x10,%esp
    836e:	83 f8 ff             	cmp    $0xffffffff,%eax
    8371:	0f 84 79 fd ff ff    	je     80f0 <printf+0xb0>
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:53
			written++;
    8377:	8b 55 d4             	mov    -0x2c(%ebp),%edx
/home/viktor/HVJV-OS/libc/stdio/printf.c:22
	while (*format != '\0') {
    837a:	0f b6 43 02          	movzbl 0x2(%ebx),%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:45
			format++;
    837e:	89 f3                	mov    %esi,%ebx
/home/viktor/HVJV-OS/libc/stdio/printf.c:53
			written++;
    8380:	83 c2 01             	add    $0x1,%edx
    8383:	e9 28 ff ff ff       	jmp    82b0 <printf+0x270>
/home/viktor/HVJV-OS/libc/stdio/printf.c:101
            format++;
    8388:	8d 43 02             	lea    0x2(%ebx),%eax
    838b:	89 55 c8             	mov    %edx,-0x38(%ebp)
    838e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:102
            int i = va_arg(parameters, int);
    8391:	8b 45 cc             	mov    -0x34(%ebp),%eax
    8394:	8d 48 04             	lea    0x4(%eax),%ecx
    8397:	89 4d cc             	mov    %ecx,-0x34(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:104
            itoa(i, str, 2, 0);
    839a:	8d 4d dc             	lea    -0x24(%ebp),%ecx
    839d:	6a 00                	push   $0x0
    839f:	6a 02                	push   $0x2
    83a1:	51                   	push   %ecx
    83a2:	ff 30                	push   (%eax)
    83a4:	e8 97 03 00 00       	call   8740 <itoa>
/home/viktor/HVJV-OS/libc/stdio/printf.c:105
            size_t len = strlen(str);
    83a9:	8d 45 dc             	lea    -0x24(%ebp),%eax
    83ac:	89 04 24             	mov    %eax,(%esp)
    83af:	e8 cc 04 00 00       	call   8880 <strlen>
/home/viktor/HVJV-OS/libc/stdio/printf.c:106
            if (maxrem < len)
    83b4:	83 c4 10             	add    $0x10,%esp
/home/viktor/HVJV-OS/libc/stdio/printf.c:105
            size_t len = strlen(str);
    83b7:	89 45 d0             	mov    %eax,-0x30(%ebp)
    83ba:	89 c6                	mov    %eax,%esi
/home/viktor/HVJV-OS/libc/stdio/printf.c:106
            if (maxrem < len)
    83bc:	39 c7                	cmp    %eax,%edi
    83be:	0f 82 2c fd ff ff    	jb     80f0 <printf+0xb0>
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    83c4:	83 ec 0c             	sub    $0xc,%esp
    83c7:	6a 30                	push   $0x30
    83c9:	e8 32 03 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    83ce:	83 c4 10             	add    $0x10,%esp
    83d1:	83 f8 ff             	cmp    $0xffffffff,%eax
    83d4:	0f 84 16 fd ff ff    	je     80f0 <printf+0xb0>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
    83da:	83 ec 0c             	sub    $0xc,%esp
    83dd:	6a 62                	push   $0x62
    83df:	e8 1c 03 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    83e4:	83 c4 10             	add    $0x10,%esp
    83e7:	83 f8 ff             	cmp    $0xffffffff,%eax
    83ea:	0f 84 00 fd ff ff    	je     80f0 <printf+0xb0>
/home/viktor/HVJV-OS/libc/stdio/printf.c:10 (discriminator 1)
	for (size_t i = 0; i < length; i++)
    83f0:	89 f0                	mov    %esi,%eax
    83f2:	8d 7d dc             	lea    -0x24(%ebp),%edi
    83f5:	8b 55 c8             	mov    -0x38(%ebp),%edx
    83f8:	85 c0                	test   %eax,%eax
    83fa:	8d 34 37             	lea    (%edi,%esi,1),%esi
    83fd:	0f 84 ea 00 00 00    	je     84ed <printf+0x4ad>
    8403:	89 5d 08             	mov    %ebx,0x8(%ebp)
    8406:	89 fb                	mov    %edi,%ebx
    8408:	89 d7                	mov    %edx,%edi
    840a:	eb 0f                	jmp    841b <printf+0x3db>
    840c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    8410:	83 c3 01             	add    $0x1,%ebx
    8413:	39 f3                	cmp    %esi,%ebx
    8415:	0f 84 cd 00 00 00    	je     84e8 <printf+0x4a8>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    841b:	0f b6 03             	movzbl (%ebx),%eax
    841e:	83 ec 0c             	sub    $0xc,%esp
    8421:	50                   	push   %eax
    8422:	e8 d9 02 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    8427:	83 c4 10             	add    $0x10,%esp
    842a:	83 f8 ff             	cmp    $0xffffffff,%eax
    842d:	75 e1                	jne    8410 <printf+0x3d0>
    842f:	e9 bc fc ff ff       	jmp    80f0 <printf+0xb0>
    8434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:27
				format++;
    8438:	83 c3 01             	add    $0x1,%ebx
/home/viktor/HVJV-OS/libc/stdio/printf.c:29
			while (format[amount] && format[amount] != '%')
    843b:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    843f:	84 c0                	test   %al,%al
    8441:	0f 84 b9 00 00 00    	je     8500 <printf+0x4c0>
    8447:	3c 25                	cmp    $0x25,%al
    8449:	0f 84 b1 00 00 00    	je     8500 <printf+0x4c0>
/home/viktor/HVJV-OS/libc/stdio/printf.c:28
			size_t amount = 1;
    844f:	be 01 00 00 00       	mov    $0x1,%esi
    8454:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    845b:	00 
    845c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
/home/viktor/HVJV-OS/libc/stdio/printf.c:30
				amount++;
    8460:	83 c6 01             	add    $0x1,%esi
/home/viktor/HVJV-OS/libc/stdio/printf.c:29
			while (format[amount] && format[amount] != '%')
    8463:	0f b6 04 33          	movzbl (%ebx,%esi,1),%eax
    8467:	84 c0                	test   %al,%al
    8469:	74 04                	je     846f <printf+0x42f>
    846b:	3c 25                	cmp    $0x25,%al
    846d:	75 f1                	jne    8460 <printf+0x420>
/home/viktor/HVJV-OS/libc/stdio/printf.c:31
			if (maxrem < amount) {
    846f:	39 f7                	cmp    %esi,%edi
    8471:	0f 82 79 fc ff ff    	jb     80f0 <printf+0xb0>
/home/viktor/HVJV-OS/libc/stdio/printf.c:29
			while (format[amount] && format[amount] != '%')
    8477:	8d 3c 33             	lea    (%ebx,%esi,1),%edi
    847a:	89 f9                	mov    %edi,%ecx
    847c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    847f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    8482:	eb 0b                	jmp    848f <printf+0x44f>
    8484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:10 (discriminator 1)
	for (size_t i = 0; i < length; i++)
    8488:	83 c3 01             	add    $0x1,%ebx
    848b:	39 df                	cmp    %ebx,%edi
    848d:	74 21                	je     84b0 <printf+0x470>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    848f:	0f b6 03             	movzbl (%ebx),%eax
    8492:	83 ec 0c             	sub    $0xc,%esp
    8495:	50                   	push   %eax
    8496:	e8 65 02 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    849b:	83 c4 10             	add    $0x10,%esp
    849e:	83 f8 ff             	cmp    $0xffffffff,%eax
    84a1:	75 e5                	jne    8488 <printf+0x448>
    84a3:	e9 48 fc ff ff       	jmp    80f0 <printf+0xb0>
    84a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    84af:	00 
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:22
	while (*format != '\0') {
    84b0:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    84b3:	8b 55 d0             	mov    -0x30(%ebp),%edx
    84b6:	0f b6 01             	movzbl (%ecx),%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:38
			written += amount;
    84b9:	01 f2                	add    %esi,%edx
/home/viktor/HVJV-OS/libc/stdio/printf.c:37
			format += amount;
    84bb:	89 cb                	mov    %ecx,%ebx
/home/viktor/HVJV-OS/libc/stdio/printf.c:39
			continue;
    84bd:	e9 ee fd ff ff       	jmp    82b0 <printf+0x270>
    84c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:39
    84c8:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    84cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    84ce:	89 f2                	mov    %esi,%edx
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:86
            written += len;
    84d0:	01 ca                	add    %ecx,%edx
/home/viktor/HVJV-OS/libc/stdio/printf.c:78
            unsigned int i = va_arg(parameters, unsigned int);
    84d2:	8b 4d d0             	mov    -0x30(%ebp),%ecx
/home/viktor/HVJV-OS/libc/stdio/printf.c:22
	while (*format != '\0') {
    84d5:	0f b6 43 02          	movzbl 0x2(%ebx),%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:77
            format++;
    84d9:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
/home/viktor/HVJV-OS/libc/stdio/printf.c:78
            unsigned int i = va_arg(parameters, unsigned int);
    84dc:	89 4d cc             	mov    %ecx,-0x34(%ebp)
    84df:	e9 cc fd ff ff       	jmp    82b0 <printf+0x270>
    84e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:78
    84e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
    84eb:	89 fa                	mov    %edi,%edx
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:112
            written += len;
    84ed:	8b 45 d0             	mov    -0x30(%ebp),%eax
    84f0:	01 c2                	add    %eax,%edx
/home/viktor/HVJV-OS/libc/stdio/printf.c:22
	while (*format != '\0') {
    84f2:	0f b6 43 02          	movzbl 0x2(%ebx),%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:101
            format++;
    84f6:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    84f9:	e9 b2 fd ff ff       	jmp    82b0 <printf+0x270>
    84fe:	66 90                	xchg   %ax,%ax
/home/viktor/HVJV-OS/libc/stdio/printf.c:31
			if (maxrem < amount) {
    8500:	85 ff                	test   %edi,%edi
    8502:	0f 84 e8 fb ff ff    	je     80f0 <printf+0xb0>
/home/viktor/HVJV-OS/libc/stdio/printf.c:29
			while (format[amount] && format[amount] != '%')
    8508:	8d 4b 01             	lea    0x1(%ebx),%ecx
/home/viktor/HVJV-OS/libc/stdio/printf.c:28
			size_t amount = 1;
    850b:	be 01 00 00 00       	mov    $0x1,%esi
    8510:	89 cf                	mov    %ecx,%edi
    8512:	e9 65 ff ff ff       	jmp    847c <printf+0x43c>
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:28
    8517:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    851a:	89 f2                	mov    %esi,%edx
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:160
			written += len;
    851c:	01 c2                	add    %eax,%edx
/home/viktor/HVJV-OS/libc/stdio/printf.c:161
			format += len;
    851e:	89 fb                	mov    %edi,%ebx
/home/viktor/HVJV-OS/libc/stdio/printf.c:22
	while (*format != '\0') {
    8520:	0f b6 07             	movzbl (%edi),%eax
    8523:	e9 88 fd ff ff       	jmp    82b0 <printf+0x270>
/home/viktor/HVJV-OS/libc/stdio/printf.c:116
                format++;
    8528:	8d 43 03             	lea    0x3(%ebx),%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:119
                itoa(i, str, 16, 0);
    852b:	8d 75 dc             	lea    -0x24(%ebp),%esi
    852e:	89 55 c8             	mov    %edx,-0x38(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:116
                format++;
    8531:	89 45 d0             	mov    %eax,-0x30(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:117
                long i = va_arg(parameters, long);
    8534:	8b 45 cc             	mov    -0x34(%ebp),%eax
    8537:	8d 48 04             	lea    0x4(%eax),%ecx
    853a:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:119
                itoa(i, str, 16, 0);
    853d:	6a 00                	push   $0x0
    853f:	6a 10                	push   $0x10
    8541:	56                   	push   %esi
    8542:	ff 30                	push   (%eax)
    8544:	e8 f7 01 00 00       	call   8740 <itoa>
/home/viktor/HVJV-OS/libc/stdio/printf.c:120
                size_t len = strlen(str);
    8549:	89 34 24             	mov    %esi,(%esp)
    854c:	e8 2f 03 00 00       	call   8880 <strlen>
/home/viktor/HVJV-OS/libc/stdio/printf.c:121
                if (maxrem < len)
    8551:	83 c4 10             	add    $0x10,%esp
    8554:	39 c7                	cmp    %eax,%edi
    8556:	89 45 cc             	mov    %eax,-0x34(%ebp)
    8559:	0f 82 91 fb ff ff    	jb     80f0 <printf+0xb0>
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    855f:	83 ec 0c             	sub    $0xc,%esp
    8562:	6a 30                	push   $0x30
    8564:	e8 97 01 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    8569:	83 c4 10             	add    $0x10,%esp
    856c:	83 f8 ff             	cmp    $0xffffffff,%eax
    856f:	0f 84 7b fb ff ff    	je     80f0 <printf+0xb0>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
    8575:	83 ec 0c             	sub    $0xc,%esp
    8578:	6a 78                	push   $0x78
    857a:	e8 81 01 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    857f:	83 c4 10             	add    $0x10,%esp
    8582:	83 f8 ff             	cmp    $0xffffffff,%eax
    8585:	0f 84 65 fb ff ff    	je     80f0 <printf+0xb0>
/home/viktor/HVJV-OS/libc/stdio/printf.c:10 (discriminator 1)
	for (size_t i = 0; i < length; i++)
    858b:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    858e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8591:	85 c9                	test   %ecx,%ecx
    8593:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
    8596:	74 40                	je     85d8 <printf+0x598>
    8598:	89 5d 08             	mov    %ebx,0x8(%ebp)
    859b:	89 f3                	mov    %esi,%ebx
    859d:	8b 75 08             	mov    0x8(%ebp),%esi
    85a0:	89 4d cc             	mov    %ecx,-0x34(%ebp)
    85a3:	89 55 c8             	mov    %edx,-0x38(%ebp)
    85a6:	eb 0f                	jmp    85b7 <printf+0x577>
    85a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    85af:	00 
    85b0:	83 c3 01             	add    $0x1,%ebx
    85b3:	39 fb                	cmp    %edi,%ebx
    85b5:	74 19                	je     85d0 <printf+0x590>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    85b7:	0f b6 03             	movzbl (%ebx),%eax
    85ba:	83 ec 0c             	sub    $0xc,%esp
    85bd:	50                   	push   %eax
    85be:	e8 3d 01 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    85c3:	83 c4 10             	add    $0x10,%esp
    85c6:	83 f8 ff             	cmp    $0xffffffff,%eax
    85c9:	75 e5                	jne    85b0 <printf+0x570>
    85cb:	e9 20 fb ff ff       	jmp    80f0 <printf+0xb0>
    85d0:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    85d3:	8b 55 c8             	mov    -0x38(%ebp),%edx
    85d6:	89 f3                	mov    %esi,%ebx
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:127
                written += len;
    85d8:	01 ca                	add    %ecx,%edx
/home/viktor/HVJV-OS/libc/stdio/printf.c:117
                long i = va_arg(parameters, long);
    85da:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
/home/viktor/HVJV-OS/libc/stdio/printf.c:22
	while (*format != '\0') {
    85dd:	0f b6 43 03          	movzbl 0x3(%ebx),%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:116
                format++;
    85e1:	8b 5d d0             	mov    -0x30(%ebp),%ebx
/home/viktor/HVJV-OS/libc/stdio/printf.c:117
                long i = va_arg(parameters, long);
    85e4:	89 4d cc             	mov    %ecx,-0x34(%ebp)
    85e7:	e9 c4 fc ff ff       	jmp    82b0 <printf+0x270>
/home/viktor/HVJV-OS/libc/stdio/printf.c:129
                format++;
    85ec:	8d 43 03             	lea    0x3(%ebx),%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:132
                itoa(i, str, 10, 1);
    85ef:	8d 75 dc             	lea    -0x24(%ebp),%esi
    85f2:	89 55 c8             	mov    %edx,-0x38(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:129
                format++;
    85f5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:130
                unsigned long i = va_arg(parameters, unsigned long);
    85f8:	8b 45 cc             	mov    -0x34(%ebp),%eax
    85fb:	8d 48 04             	lea    0x4(%eax),%ecx
    85fe:	89 4d d0             	mov    %ecx,-0x30(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:132
                itoa(i, str, 10, 1);
    8601:	6a 01                	push   $0x1
    8603:	6a 0a                	push   $0xa
    8605:	56                   	push   %esi
    8606:	ff 30                	push   (%eax)
    8608:	e8 33 01 00 00       	call   8740 <itoa>
/home/viktor/HVJV-OS/libc/stdio/printf.c:133
                size_t len = strlen(str);
    860d:	89 34 24             	mov    %esi,(%esp)
    8610:	e8 6b 02 00 00       	call   8880 <strlen>
/home/viktor/HVJV-OS/libc/stdio/printf.c:134
                if (maxrem < len)
    8615:	83 c4 10             	add    $0x10,%esp
    8618:	39 c7                	cmp    %eax,%edi
    861a:	0f 82 d0 fa ff ff    	jb     80f0 <printf+0xb0>
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:10 (discriminator 1)
	for (size_t i = 0; i < length; i++)
    8620:	85 c0                	test   %eax,%eax
    8622:	89 f7                	mov    %esi,%edi
    8624:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8627:	8d 34 06             	lea    (%esi,%eax,1),%esi
    862a:	74 3c                	je     8668 <printf+0x628>
    862c:	89 5d 08             	mov    %ebx,0x8(%ebp)
    862f:	89 fb                	mov    %edi,%ebx
    8631:	8b 7d 08             	mov    0x8(%ebp),%edi
    8634:	89 45 cc             	mov    %eax,-0x34(%ebp)
    8637:	89 55 c8             	mov    %edx,-0x38(%ebp)
    863a:	eb 0b                	jmp    8647 <printf+0x607>
    863c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    8640:	83 c3 01             	add    $0x1,%ebx
    8643:	39 f3                	cmp    %esi,%ebx
    8645:	74 19                	je     8660 <printf+0x620>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    8647:	0f b6 03             	movzbl (%ebx),%eax
    864a:	83 ec 0c             	sub    $0xc,%esp
    864d:	50                   	push   %eax
    864e:	e8 ad 00 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    8653:	83 c4 10             	add    $0x10,%esp
    8656:	83 f8 ff             	cmp    $0xffffffff,%eax
    8659:	75 e5                	jne    8640 <printf+0x600>
    865b:	e9 90 fa ff ff       	jmp    80f0 <printf+0xb0>
    8660:	8b 45 cc             	mov    -0x34(%ebp),%eax
    8663:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8666:	89 fb                	mov    %edi,%ebx
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:141
                long i = va_arg(parameters, long);
    8668:	8b 4d d0             	mov    -0x30(%ebp),%ecx
/home/viktor/HVJV-OS/libc/stdio/printf.c:149
                written += len;
    866b:	01 c2                	add    %eax,%edx
/home/viktor/HVJV-OS/libc/stdio/printf.c:22
	while (*format != '\0') {
    866d:	0f b6 43 03          	movzbl 0x3(%ebx),%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:140
                format++;
    8671:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
/home/viktor/HVJV-OS/libc/stdio/printf.c:141
                long i = va_arg(parameters, long);
    8674:	89 4d cc             	mov    %ecx,-0x34(%ebp)
    8677:	e9 34 fc ff ff       	jmp    82b0 <printf+0x270>
/home/viktor/HVJV-OS/libc/stdio/printf.c:140
                format++;
    867c:	8d 43 03             	lea    0x3(%ebx),%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:143
                itoa(i, str, 10, 0);
    867f:	8d 75 dc             	lea    -0x24(%ebp),%esi
    8682:	89 55 c8             	mov    %edx,-0x38(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:140
                format++;
    8685:	89 45 d4             	mov    %eax,-0x2c(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:141
                long i = va_arg(parameters, long);
    8688:	8b 45 cc             	mov    -0x34(%ebp),%eax
    868b:	8d 48 04             	lea    0x4(%eax),%ecx
    868e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
/home/viktor/HVJV-OS/libc/stdio/printf.c:143
                itoa(i, str, 10, 0);
    8691:	6a 00                	push   $0x0
    8693:	6a 0a                	push   $0xa
    8695:	56                   	push   %esi
    8696:	ff 30                	push   (%eax)
    8698:	e8 a3 00 00 00       	call   8740 <itoa>
/home/viktor/HVJV-OS/libc/stdio/printf.c:144
                size_t len = strlen(str);
    869d:	89 34 24             	mov    %esi,(%esp)
    86a0:	e8 db 01 00 00       	call   8880 <strlen>
/home/viktor/HVJV-OS/libc/stdio/printf.c:145
                if (maxrem < len)
    86a5:	83 c4 10             	add    $0x10,%esp
    86a8:	39 c7                	cmp    %eax,%edi
    86aa:	0f 82 40 fa ff ff    	jb     80f0 <printf+0xb0>
print():
/home/viktor/HVJV-OS/libc/stdio/printf.c:10 (discriminator 1)
	for (size_t i = 0; i < length; i++)
    86b0:	85 c0                	test   %eax,%eax
    86b2:	89 f7                	mov    %esi,%edi
    86b4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    86b7:	8d 34 06             	lea    (%esi,%eax,1),%esi
    86ba:	74 ac                	je     8668 <printf+0x628>
    86bc:	89 5d 08             	mov    %ebx,0x8(%ebp)
    86bf:	89 fb                	mov    %edi,%ebx
    86c1:	8b 7d 08             	mov    0x8(%ebp),%edi
    86c4:	89 45 cc             	mov    %eax,-0x34(%ebp)
    86c7:	89 55 c8             	mov    %edx,-0x38(%ebp)
    86ca:	eb 0b                	jmp    86d7 <printf+0x697>
    86cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    86d0:	83 c3 01             	add    $0x1,%ebx
    86d3:	39 f3                	cmp    %esi,%ebx
    86d5:	74 89                	je     8660 <printf+0x620>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11
		if (putchar(bytes[i]) == EOF)
    86d7:	0f b6 03             	movzbl (%ebx),%eax
    86da:	83 ec 0c             	sub    $0xc,%esp
    86dd:	50                   	push   %eax
    86de:	e8 1d 00 00 00       	call   8700 <putchar>
/home/viktor/HVJV-OS/libc/stdio/printf.c:11 (discriminator 1)
    86e3:	83 c4 10             	add    $0x10,%esp
    86e6:	83 f8 ff             	cmp    $0xffffffff,%eax
    86e9:	75 e5                	jne    86d0 <printf+0x690>
    86eb:	e9 00 fa ff ff       	jmp    80f0 <printf+0xb0>
    86f0:	89 df                	mov    %ebx,%edi
    86f2:	e9 25 fe ff ff       	jmp    851c <printf+0x4dc>
printf():
/home/viktor/HVJV-OS/libc/stdio/printf.c:20
	int written = 0;
    86f7:	31 c0                	xor    %eax,%eax
/home/viktor/HVJV-OS/libc/stdio/printf.c:166
	return written;
    86f9:	e9 f7 f9 ff ff       	jmp    80f5 <printf+0xb5>
    86fe:	66 90                	xchg   %ax,%ax

00008700 <putchar>:
putchar():
/home/viktor/HVJV-OS/libc/stdio/putchar.c:7

#if defined(__is_libk)
#include <kernel/tty.h>
#endif

int putchar(int ic) {
    8700:	55                   	push   %ebp
    8701:	89 e5                	mov    %esp,%ebp
/home/viktor/HVJV-OS/libc/stdio/putchar.c:15
	terminal_write(&c, sizeof(c));
#else
	// TODO: Implement stdio and the write system call.
#endif
	return ic;
}
    8703:	8b 45 08             	mov    0x8(%ebp),%eax
    8706:	5d                   	pop    %ebp
    8707:	c3                   	ret
    8708:	66 90                	xchg   %ax,%ax
    870a:	66 90                	xchg   %ax,%ax
    870c:	66 90                	xchg   %ax,%ax
    870e:	66 90                	xchg   %ax,%ax
    8710:	66 90                	xchg   %ax,%ax
    8712:	66 90                	xchg   %ax,%ax
    8714:	66 90                	xchg   %ax,%ax
    8716:	66 90                	xchg   %ax,%ax
    8718:	66 90                	xchg   %ax,%ax
    871a:	66 90                	xchg   %ax,%ax
    871c:	66 90                	xchg   %ax,%ax
    871e:	66 90                	xchg   %ax,%ax
    8720:	66 90                	xchg   %ax,%ax
    8722:	66 90                	xchg   %ax,%ax
    8724:	66 90                	xchg   %ax,%ax
    8726:	66 90                	xchg   %ax,%ax
    8728:	66 90                	xchg   %ax,%ax
    872a:	66 90                	xchg   %ax,%ax
    872c:	66 90                	xchg   %ax,%ax
    872e:	66 90                	xchg   %ax,%ax
    8730:	66 90                	xchg   %ax,%ax
    8732:	66 90                	xchg   %ax,%ax
    8734:	66 90                	xchg   %ax,%ax
    8736:	66 90                	xchg   %ax,%ax
    8738:	66 90                	xchg   %ax,%ax
    873a:	66 90                	xchg   %ax,%ax
    873c:	66 90                	xchg   %ax,%ax
    873e:	66 90                	xchg   %ax,%ax

00008740 <itoa>:
itoa():
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:3
#include <stdlib.h>

char* itoa(long value, char* buffer, int base, int is_unsigned) {
    8740:	55                   	push   %ebp
    8741:	89 e5                	mov    %esp,%ebp
    8743:	57                   	push   %edi
    8744:	56                   	push   %esi
    8745:	53                   	push   %ebx
    8746:	83 ec 04             	sub    $0x4,%esp
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:4
    if (base < 2 || base > 36) {
    8749:	8b 45 10             	mov    0x10(%ebp),%eax
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:3
char* itoa(long value, char* buffer, int base, int is_unsigned) {
    874c:	8b 5d 08             	mov    0x8(%ebp),%ebx
    874f:	8b 7d 0c             	mov    0xc(%ebp),%edi
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:4
    if (base < 2 || base > 36) {
    8752:	83 e8 02             	sub    $0x2,%eax
    8755:	83 f8 22             	cmp    $0x22,%eax
    8758:	0f 87 fa 00 00 00    	ja     8858 <itoa+0x118>
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:12
    }

    char* ptr = buffer;
    int isNegative = 0;

    if (value == 0) {
    875e:	85 db                	test   %ebx,%ebx
    8760:	0f 84 da 00 00 00    	je     8840 <itoa+0x100>
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:19
        *ptr = '\0';
        return buffer;
    }

    // Handle negative numbers only for base 10 and signed values
    if (!is_unsigned && value < 0 && base == 10) {
    8766:	8b 55 14             	mov    0x14(%ebp),%edx
    8769:	89 d8                	mov    %ebx,%eax
    876b:	85 d2                	test   %edx,%edx
    876d:	0f 94 c2             	sete   %dl
    8770:	c1 e8 1f             	shr    $0x1f,%eax
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:19 (discriminator 1)
    8773:	84 c2                	test   %al,%dl
    8775:	74 0a                	je     8781 <itoa+0x41>
    8777:	83 7d 10 0a          	cmpl   $0xa,0x10(%ebp)
    877b:	0f 84 e7 00 00 00    	je     8868 <itoa+0x128>
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:10
    int isNegative = 0;
    8781:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:27
    }

    unsigned long abs_value = is_unsigned ? (unsigned long)value : (unsigned long)value;

    // Convert the number to the specified base
    while (abs_value != 0) {
    8788:	89 7d 0c             	mov    %edi,0xc(%ebp)
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:9
    char* ptr = buffer;
    878b:	89 f9                	mov    %edi,%ecx
    878d:	eb 35                	jmp    87c4 <itoa+0x84>
    878f:	eb 2f                	jmp    87c0 <itoa+0x80>
    8791:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    8798:	00 
    8799:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    87a0:	00 
    87a1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    87a8:	00 
    87a9:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    87b0:	00 
    87b1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    87b8:	00 
    87b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:30
        int remainder = abs_value % base;
        *ptr++ = (remainder > 9) ? (remainder - 10) + 'a' : remainder + '0';
        abs_value /= base;
    87c0:	89 c3                	mov    %eax,%ebx
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:29 (discriminator 4)
        *ptr++ = (remainder > 9) ? (remainder - 10) + 'a' : remainder + '0';
    87c2:	89 f1                	mov    %esi,%ecx
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:28
        int remainder = abs_value % base;
    87c4:	31 d2                	xor    %edx,%edx
    87c6:	89 d8                	mov    %ebx,%eax
    87c8:	f7 75 10             	divl   0x10(%ebp)
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:29 (discriminator 1)
        *ptr++ = (remainder > 9) ? (remainder - 10) + 'a' : remainder + '0';
    87cb:	8d 72 30             	lea    0x30(%edx),%esi
    87ce:	8d 7a 57             	lea    0x57(%edx),%edi
    87d1:	83 fa 0a             	cmp    $0xa,%edx
    87d4:	0f 42 fe             	cmovb  %esi,%edi
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:29 (discriminator 4)
    87d7:	8d 71 01             	lea    0x1(%ecx),%esi
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:29 (discriminator 1)
    87da:	89 fa                	mov    %edi,%edx
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:29 (discriminator 4)
    87dc:	88 56 ff             	mov    %dl,-0x1(%esi)
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:27
    while (abs_value != 0) {
    87df:	3b 5d 10             	cmp    0x10(%ebp),%ebx
    87e2:	73 dc                	jae    87c0 <itoa+0x80>
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:33
    }

    if (isNegative) {
    87e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    87e7:	8b 7d 0c             	mov    0xc(%ebp),%edi
    87ea:	85 c0                	test   %eax,%eax
    87ec:	74 0a                	je     87f8 <itoa+0xb8>
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:34
        *ptr++ = '-';
    87ee:	8d 41 02             	lea    0x2(%ecx),%eax
    87f1:	c6 06 2d             	movb   $0x2d,(%esi)
    87f4:	89 f1                	mov    %esi,%ecx
    87f6:	89 c6                	mov    %eax,%esi
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:37
    }

    *ptr = '\0'; // Null-terminate the string
    87f8:	c6 06 00             	movb   $0x0,(%esi)
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:40

    // Reverse the string
    char* start = buffer;
    87fb:	89 f8                	mov    %edi,%eax
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:42
    char* end = ptr - 1;
    while (start < end) {
    87fd:	39 cf                	cmp    %ecx,%edi
    87ff:	73 47                	jae    8848 <itoa+0x108>
    8801:	eb 1d                	jmp    8820 <itoa+0xe0>
    8803:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    880a:	00 
    880b:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    8812:	00 
    8813:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    881a:	00 
    881b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:43
        char temp = *start;
    8820:	0f b6 10             	movzbl (%eax),%edx
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:44
        *start++ = *end;
    8823:	0f b6 19             	movzbl (%ecx),%ebx
    8826:	83 c0 01             	add    $0x1,%eax
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:45
        *end-- = temp;
    8829:	83 e9 01             	sub    $0x1,%ecx
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:44
        *start++ = *end;
    882c:	88 58 ff             	mov    %bl,-0x1(%eax)
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:45
        *end-- = temp;
    882f:	88 51 01             	mov    %dl,0x1(%ecx)
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:42
    while (start < end) {
    8832:	39 c8                	cmp    %ecx,%eax
    8834:	72 ea                	jb     8820 <itoa+0xe0>
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:49
    }

    return buffer;
}
    8836:	83 c4 04             	add    $0x4,%esp
    8839:	89 f8                	mov    %edi,%eax
    883b:	5b                   	pop    %ebx
    883c:	5e                   	pop    %esi
    883d:	5f                   	pop    %edi
    883e:	5d                   	pop    %ebp
    883f:	c3                   	ret
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:13
        *ptr++ = '0';
    8840:	b9 30 00 00 00       	mov    $0x30,%ecx
    8845:	66 89 0f             	mov    %cx,(%edi)
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:49
}
    8848:	83 c4 04             	add    $0x4,%esp
    884b:	89 f8                	mov    %edi,%eax
    884d:	5b                   	pop    %ebx
    884e:	5e                   	pop    %esi
    884f:	5f                   	pop    %edi
    8850:	5d                   	pop    %ebp
    8851:	c3                   	ret
    8852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:5
        *buffer = '\0'; // Invalid base; return empty string
    8858:	c6 07 00             	movb   $0x0,(%edi)
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:49
}
    885b:	83 c4 04             	add    $0x4,%esp
    885e:	89 f8                	mov    %edi,%eax
    8860:	5b                   	pop    %ebx
    8861:	5e                   	pop    %esi
    8862:	5f                   	pop    %edi
    8863:	5d                   	pop    %ebp
    8864:	c3                   	ret
    8865:	8d 76 00             	lea    0x0(%esi),%esi
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:20
        isNegative = 1;
    8868:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
/home/viktor/HVJV-OS/libc/stdlib/itoa.c:21
        value = -value; // Make value positive
    886f:	f7 db                	neg    %ebx
    8871:	e9 12 ff ff ff       	jmp    8788 <itoa+0x48>
    8876:	66 90                	xchg   %ax,%ax
    8878:	66 90                	xchg   %ax,%ax
    887a:	66 90                	xchg   %ax,%ax
    887c:	66 90                	xchg   %ax,%ax
    887e:	66 90                	xchg   %ax,%ax

00008880 <strlen>:
strlen():
/home/viktor/HVJV-OS/libc/string/strlen.c:3
#include <string.h>

size_t strlen(const char* str) {
    8880:	55                   	push   %ebp
/home/viktor/HVJV-OS/libc/string/strlen.c:4
	size_t len = 0;
    8881:	31 c0                	xor    %eax,%eax
/home/viktor/HVJV-OS/libc/string/strlen.c:3
size_t strlen(const char* str) {
    8883:	89 e5                	mov    %esp,%ebp
    8885:	8b 55 08             	mov    0x8(%ebp),%edx
/home/viktor/HVJV-OS/libc/string/strlen.c:5
	while (str[len])
    8888:	80 3a 00             	cmpb   $0x0,(%edx)
    888b:	74 0c                	je     8899 <strlen+0x19>
    888d:	8d 76 00             	lea    0x0(%esi),%esi
/home/viktor/HVJV-OS/libc/string/strlen.c:6
		len++;
    8890:	83 c0 01             	add    $0x1,%eax
/home/viktor/HVJV-OS/libc/string/strlen.c:5
	while (str[len])
    8893:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    8897:	75 f7                	jne    8890 <strlen+0x10>
/home/viktor/HVJV-OS/libc/string/strlen.c:8
	return len;
}
    8899:	5d                   	pop    %ebp
    889a:	c3                   	ret

Disassembly of section .rodata:

0000889c <__bss_end-0x64>:
    889c:	54                   	push   %esp
    889d:	65 73 74             	gs jae 8914 <__bss_end+0x14>
    88a0:	0a 00                	or     (%eax),%al
    88a2:	00 00                	add    %al,(%eax)
    88a4:	88 83 00 00 44 83    	mov    %al,-0x7cbc0000(%ebx)
    88aa:	00 00                	add    %al,(%eax)
    88ac:	c2 82 00             	ret    $0x82
    88af:	00 a0 80 00 00 a0    	add    %ah,-0x5fffff80(%eax)
    88b5:	80 00 00             	addb   $0x0,(%eax)
    88b8:	a0 80 00 00 a0       	mov    0xa0000080,%al
    88bd:	80 00 00             	addb   $0x0,(%eax)
    88c0:	a0 80 00 00 a0       	mov    0xa0000080,%al
    88c5:	80 00 00             	addb   $0x0,(%eax)
    88c8:	a0 80 00 00 84       	mov    0x84000080,%al
    88cd:	82 00 00             	addb   $0x0,(%eax)
    88d0:	a0 80 00 00 a0       	mov    0xa0000080,%al
    88d5:	80 00 00             	addb   $0x0,(%eax)
    88d8:	a0 80 00 00 a0       	mov    0xa0000080,%al
    88dd:	80 00 00             	addb   $0x0,(%eax)
    88e0:	a0 80 00 00 a0       	mov    0xa0000080,%al
    88e5:	80 00 00             	addb   $0x0,(%eax)
    88e8:	1c 82                	sbb    $0x82,%al
    88ea:	00 00                	add    %al,(%eax)
    88ec:	a0 80 00 00 9c       	mov    0x9c000080,%al
    88f1:	81 00 00 a0 80 00    	addl   $0x80a000,(%eax)
    88f7:	00 a0 80 00 00 fd    	add    %ah,-0x2ffff80(%eax)
    88fd:	80 00 00             	addb   $0x0,(%eax)

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
  3e:	02 05 00 01 01 5f    	add    0x5f010100,%al
  44:	00 00                	add    %al,(%eax)
  46:	00 05 00 04 00 37    	add    %al,0x37000400
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
  64:	03 00                	add    (%eax),%eax
  66:	00 00                	add    %al,(%eax)
  68:	00 38                	add    %bh,(%eax)
  6a:	00 00                	add    %al,(%eax)
  6c:	00 42 00             	add    %al,0x0(%edx)
  6f:	00 00                	add    %al,(%eax)
  71:	02 01                	add    (%ecx),%al
  73:	1f                   	pop    %ds
  74:	02 0f                	add    (%edi),%cl
  76:	03 31                	add    (%ecx),%esi
  78:	00 00                	add    %al,(%eax)
  7a:	00 01                	add    %al,(%ecx)
  7c:	31 00                	xor    %eax,(%eax)
  7e:	00 00                	add    %al,(%eax)
  80:	01 6b 00             	add    %ebp,0x0(%ebx)
  83:	00 00                	add    %al,(%eax)
  85:	02 05 0c 00 05 02    	add    0x205000c,%al
  8b:	10 80 00 00 14 05    	adc    %al,0x5140000(%eax)
  91:	05 13 05 0c 06       	add    $0x60c0513,%eax
  96:	11 05 05 08 13 06    	adc    %eax,0x6130805
  9c:	a0 05 01 06 13       	mov    0x13060105,%al
  a1:	02 0a                	add    (%edx),%cl
  a3:	00 01                	add    %al,(%ecx)
  a5:	01 fd                	add    %edi,%ebp
  a7:	06                   	push   %es
  a8:	00 00                	add    %al,(%eax)
  aa:	05 00 04 00 4f       	add    $0x4f000400,%eax
  af:	00 00                	add    %al,(%eax)
  b1:	00 01                	add    %al,(%ecx)
  b3:	01 01                	add    %eax,(%ecx)
  b5:	fb                   	sti
  b6:	0e                   	push   %cs
  b7:	0d 00 01 01 01       	or     $0x1010100,%eax
  bc:	01 00                	add    %eax,(%eax)
  be:	00 00                	add    %al,(%eax)
  c0:	01 00                	add    %eax,(%eax)
  c2:	00 01                	add    %al,(%ecx)
  c4:	01 01                	add    %eax,(%ecx)
  c6:	1f                   	pop    %ds
  c7:	04 73                	add    $0x73,%al
  c9:	00 00                	add    %al,(%eax)
  cb:	00 9c 00 00 00 a2 00 	add    %bl,0xa20000(%eax,%eax,1)
  d2:	00 00                	add    %al,(%eax)
  d4:	d1 00                	roll   $1,(%eax)
  d6:	00 00                	add    %al,(%eax)
  d8:	02 01                	add    (%ecx),%al
  da:	1f                   	pop    %ds
  db:	02 0f                	add    (%edi),%cl
  dd:	07                   	pop    %es
  de:	93                   	xchg   %eax,%ebx
  df:	00 00                	add    %al,(%eax)
  e1:	00 01                	add    %al,(%ecx)
  e3:	93                   	xchg   %eax,%ebx
  e4:	00 00                	add    %al,(%eax)
  e6:	00 01                	add    %al,(%ecx)
  e8:	d9 00                	flds   (%eax)
  ea:	00 00                	add    %al,(%eax)
  ec:	02 e2                	add    %dl,%ah
  ee:	00 00                	add    %al,(%eax)
  f0:	00 02                	add    %al,(%edx)
  f2:	6b 00 00             	imul   $0x0,(%eax),%eax
  f5:	00 03                	add    %al,(%ebx)
  f7:	eb 00                	jmp    f9 <_start-0x7f07>
  f9:	00 00                	add    %al,(%eax)
  fb:	03 f4                	add    %esp,%esi
  fd:	00 00                	add    %al,(%eax)
  ff:	00 03                	add    %al,(%ebx)
 101:	05 2e 00 05 02       	add    $0x205002e,%eax
 106:	40                   	inc    %eax
 107:	80 00 00             	addb   $0x0,(%eax)
 10a:	03 0f                	add    (%edi),%ecx
 10c:	01 06                	add    %eax,(%esi)
 10e:	01 05 05 06 3d 05    	add    %eax,0x53d0605
 114:	02 13                	add    (%ebx),%dl
 116:	05 2e 06 10 05       	add    $0x510062e,%eax
 11b:	02 30                	add    (%eax),%dh
 11d:	05 2e 3a 4a 05       	add    $0x54a3a2e,%eax
 122:	02 3e                	add    (%esi),%bh
 124:	06                   	push   %es
 125:	3e 14 05             	ds adc $0x5,%al
 128:	11 01                	adc    %eax,(%ecx)
 12a:	05 09 06 01 05       	add    $0x5010609,%eax
 12f:	11 3c 05 06 80 05 0d 	adc    %edi,0xd058006(,%eax,1)
 136:	03 d4                	add    %esp,%edx
 138:	00 2e                	add    %ch,(%esi)
 13a:	08 12                	or     %dl,(%edx)
 13c:	05 03 06 03 af       	add    $0xaf030603,%eax
 141:	7f 01                	jg     144 <_start-0x7ebc>
 143:	05 1b 06 01 05       	add    $0x501061b,%eax
 148:	03 06                	add    (%esi),%eax
 14a:	76 05                	jbe    151 <_start-0x7eaf>
 14c:	06                   	push   %es
 14d:	06                   	push   %es
 14e:	01 05 21 00 02 04    	add    %eax,0x4020021
 154:	01 82 05 11 03 80    	add    %eax,-0x7ffceefb(%edx)
 15a:	01 08                	add    %ecx,(%eax)
 15c:	f2 05 04 06 65 13    	repnz add $0x13650604,%eax
 162:	05 11 06 01 05       	add    $0x5010611,%eax
 167:	04 06                	add    $0x6,%al
 169:	67 05 07 06 01 05    	addr16 add $0x5010607,%eax
 16f:	17                   	pop    %ss
 170:	00 02                	add    %al,(%edx)
 172:	04 01                	add    $0x1,%al
 174:	06                   	push   %es
 175:	03 f0                	add    %eax,%esi
 177:	7e 74                	jle    1ed <_start-0x7e13>
 179:	00 02                	add    %al,(%edx)
 17b:	04 01                	add    $0x1,%al
 17d:	06                   	push   %es
 17e:	82 00 02             	addb   $0x2,(%eax)
 181:	04 01                	add    $0x1,%al
 183:	90                   	nop
 184:	05 22 00 02 04       	add    $0x4020022,%eax
 189:	02 06                	add    (%esi),%al
 18b:	ba 05 17 00 02       	mov    $0x2001705,%edx
 190:	04 01                	add    $0x1,%al
 192:	01 00                	add    %eax,(%eax)
 194:	02 04 01             	add    (%ecx,%eax,1),%al
 197:	06                   	push   %es
 198:	3c 05                	cmp    $0x5,%al
 19a:	03 06                	add    (%esi),%eax
 19c:	83 05 07 06 01 05 06 	addl   $0x6,0x5010607
 1a3:	00 02                	add    %al,(%edx)
 1a5:	04 01                	add    $0x1,%al
 1a7:	ba 00 02 04 01       	mov    $0x1040200,%edx
 1ac:	90                   	nop
 1ad:	05 0c 03 16 01       	add    $0x116030c,%eax
 1b2:	58                   	pop    %eax
 1b3:	05 01 03 86 01       	add    $0x1860301,%eax
 1b8:	01 05 13 03 b1 7f    	add    %eax,0x7fb10313
 1be:	82 05 0d 06 66 05 13 	addb   $0x13,0x566060d
 1c5:	06                   	push   %es
 1c6:	01 05 0d 06 3d 05    	add    %eax,0x53d060d
 1cc:	11 06                	adc    %eax,(%esi)
 1ce:	01 3c 05 0d 06 67 13 	add    %edi,0x1367060d(,%eax,1)
 1d5:	06                   	push   %es
 1d6:	3c 06                	cmp    $0x6,%al
 1d8:	bb 05 1a 06 01       	mov    $0x1061a05,%ebx
 1dd:	05 10 ad 05 1a       	add    $0x1a05ad10,%eax
 1e2:	3b 05 0d 06 3d 05    	cmp    0x53d060d,%eax
 1e8:	1a 06                	sbb    (%esi),%al
 1ea:	11 05 10 2f 05 17    	adc    %eax,0x17052f10
 1f0:	00 02                	add    %al,(%edx)
 1f2:	04 01                	add    $0x1,%al
 1f4:	06                   	push   %es
 1f5:	03 ad 7f 4a 05 03    	add    0x3054a7f(%ebp),%ebp
 1fb:	13 05 07 06 01 05    	adc    0x5010607,%eax
 201:	06                   	push   %es
 202:	00 02                	add    %al,(%edx)
 204:	04 01                	add    $0x1,%al
 206:	9e                   	sahf
 207:	05 22 00 02 04       	add    $0x4020022,%eax
 20c:	02 06                	add    (%esi),%al
 20e:	81 05 17 00 02 04 01 	addl   $0x3050101,0x4020017
 215:	01 05 03 
 218:	13 05 07 06 01 05    	adc    0x5010607,%eax
 21e:	06                   	push   %es
 21f:	00 02                	add    %al,(%edx)
 221:	04 01                	add    $0x1,%al
 223:	9e                   	sahf
 224:	00 02                	add    %al,(%edx)
 226:	04 01                	add    $0x1,%al
 228:	82 05 17 00 02 04 01 	addb   $0x1,0x4020017
 22f:	06                   	push   %es
 230:	11 00                	adc    %eax,(%eax)
 232:	02 04 01             	add    (%ecx,%eax,1),%al
 235:	06                   	push   %es
 236:	58                   	pop    %eax
 237:	00 02                	add    %al,(%edx)
 239:	04 01                	add    $0x1,%al
 23b:	82 05 22 00 02 04 02 	addb   $0x2,0x4020022
 242:	06                   	push   %es
 243:	08 20                	or     %ah,(%eax)
 245:	05 17 00 02 04       	add    $0x4020017,%eax
 24a:	01 01                	add    %eax,(%ecx)
 24c:	00 02                	add    %al,(%edx)
 24e:	04 01                	add    $0x1,%al
 250:	06                   	push   %es
 251:	3c 05                	cmp    $0x5,%al
 253:	03 06                	add    (%esi),%eax
 255:	83 05 07 06 01 05 06 	addl   $0x6,0x5010607
 25c:	00 02                	add    %al,(%edx)
 25e:	04 01                	add    $0x1,%al
 260:	ba 00 02 04 01       	mov    $0x1040200,%edx
 265:	c8 05 13 03          	enter  $0x1305,$0x3
 269:	c2 00 01             	ret    $0x100
 26c:	05 0d 06 66 05       	add    $0x566060d,%eax
 271:	13 06                	adc    (%esi),%eax
 273:	01 05 0d 06 3d 05    	add    %eax,0x53d060d
 279:	1a 06                	sbb    (%esi),%al
 27b:	01 3c 05 0d 06 67 13 	add    %edi,0x1367060d(,%eax,1)
 282:	06                   	push   %es
 283:	3c 06                	cmp    $0x6,%al
 285:	bb 05 1a 06 01       	mov    $0x1061a05,%ebx
 28a:	05 10 ad 05 1a       	add    $0x1a05ad10,%eax
 28f:	3b 05 0d 06 2f 05    	cmp    0x52f060d,%eax
 295:	10 06                	adc    %al,(%esi)
 297:	01 05 17 00 02 04    	add    %eax,0x4020017
 29d:	01 06                	add    %eax,(%esi)
 29f:	03 b8 7f 82 00 02    	add    0x200827f(%eax),%edi
 2a5:	04 01                	add    $0x1,%al
 2a7:	06                   	push   %es
 2a8:	ac                   	lods   %ds:(%esi),%al
 2a9:	05 22 00 02 04       	add    $0x4020022,%eax
 2ae:	02 06                	add    (%esi),%al
 2b0:	08 74 05 17          	or     %dh,0x17(%ebp,%eax,1)
 2b4:	00 02                	add    %al,(%edx)
 2b6:	04 01                	add    $0x1,%al
 2b8:	01 00                	add    %eax,(%eax)
 2ba:	02 04 01             	add    (%ecx,%eax,1),%al
 2bd:	06                   	push   %es
 2be:	3c 05                	cmp    $0x5,%al
 2c0:	03 06                	add    (%esi),%eax
 2c2:	83 05 07 06 01 05 06 	addl   $0x6,0x5010607
 2c9:	00 02                	add    %al,(%edx)
 2cb:	04 01                	add    $0x1,%al
 2cd:	ba 00 02 04 01       	mov    $0x1040200,%edx
 2d2:	c8 05 0a 03          	enter  $0xa05,$0x3
 2d6:	2c 01                	sub    $0x1,%al
 2d8:	05 11 3e 05 04       	add    $0x4053e11,%eax
 2dd:	06                   	push   %es
 2de:	64 05 0a 06 01 05    	fs add $0x501060a,%eax
 2e4:	04 06                	add    $0x6,%al
 2e6:	3d 05 10 06 01       	cmp    $0x1061005,%eax
 2eb:	3c 05                	cmp    $0x5,%al
 2ed:	04 06                	add    $0x6,%al
 2ef:	83 05 11 06 01 05 07 	addl   $0x7,0x5010611
 2f6:	67 05 11 3b 05 04    	addr16 add $0x4053b11,%eax
 2fc:	06                   	push   %es
 2fd:	2f                   	das
 2fe:	05 07 06 01 05       	add    $0x5010607,%eax
 303:	17                   	pop    %ss
 304:	00 02                	add    %al,(%edx)
 306:	04 01                	add    $0x1,%al
 308:	06                   	push   %es
 309:	03 50 82             	add    -0x7e(%eax),%edx
 30c:	00 02                	add    %al,(%edx)
 30e:	04 01                	add    $0x1,%al
 310:	06                   	push   %es
 311:	82 05 22 00 02 04 02 	addb   $0x2,0x4020022
 318:	06                   	push   %es
 319:	08 20                	or     %ah,(%eax)
 31b:	05 17 00 02 04       	add    $0x4020017,%eax
 320:	01 01                	add    %eax,(%ecx)
 322:	00 02                	add    %al,(%edx)
 324:	04 01                	add    $0x1,%al
 326:	06                   	push   %es
 327:	3c 05                	cmp    $0x5,%al
 329:	03 06                	add    (%esi),%eax
 32b:	83 05 07 06 01 05 06 	addl   $0x6,0x5010607
 332:	00 02                	add    %al,(%edx)
 334:	04 01                	add    $0x1,%al
 336:	ba 00 02 04 01       	mov    $0x1040200,%edx
 33b:	c8 05 0d 06          	enter  $0xd05,$0x6
 33f:	03 e7                	add    %edi,%esp
 341:	00 01                	add    %al,(%ecx)
 343:	13 05 11 06 01 05    	adc    0x5010611,%eax
 349:	10 4a 05             	adc    %cl,0x5(%edx)
 34c:	14 06                	adc    $0x6,%al
 34e:	03 0d 82 05 17 06    	add    0x6170582,%ecx
 354:	01 05 14 06 03 0b    	add    %eax,0xb030614
 35a:	82 05 17 06 01 05 13 	addb   $0x13,0x5010617
 361:	03 67 82             	add    -0x7e(%edi),%esp
 364:	f2 05 11 06 03 a4    	repnz add $0xa4030611,%eax
 36a:	7f 01                	jg     36d <_start-0x7c93>
 36c:	05 01 06 03 91       	add    $0x91030601,%eax
 371:	01 82 90 05 13 03    	add    %eax,0x3130590(%edx)
 377:	9b                   	fwait
 378:	7f 20                	jg     39a <_start-0x7c66>
 37a:	05 0d 06 66 05       	add    $0x566060d,%eax
 37f:	13 06                	adc    (%esi),%eax
 381:	01 05 0d 06 3d 05    	add    %eax,0x53d060d
 387:	11 06                	adc    %eax,(%esi)
 389:	01 3c 05 0d 06 67 13 	add    %edi,0x1367060d(,%eax,1)
 390:	06                   	push   %es
 391:	3c 06                	cmp    $0x6,%al
 393:	bb 05 1a 06 01       	mov    $0x1061a05,%ebx
 398:	05 10 ad 05 1a       	add    $0x1a05ad10,%eax
 39d:	3b 05 0d 06 2f 05    	cmp    0x52f060d,%eax
 3a3:	10 06                	adc    %al,(%esi)
 3a5:	01 05 17 00 02 04    	add    %eax,0x4020017
 3ab:	01 06                	add    %eax,(%esi)
 3ad:	03 43 82             	add    -0x7e(%ebx),%eax
 3b0:	00 02                	add    %al,(%edx)
 3b2:	04 01                	add    $0x1,%al
 3b4:	06                   	push   %es
 3b5:	ac                   	lods   %ds:(%esi),%al
 3b6:	05 22 00 02 04       	add    $0x4020022,%eax
 3bb:	02 06                	add    (%esi),%al
 3bd:	08 90 05 17 00 02    	or     %dl,0x2001705(%eax)
 3c3:	04 01                	add    $0x1,%al
 3c5:	01 00                	add    %eax,(%eax)
 3c7:	02 04 01             	add    (%ecx,%eax,1),%al
 3ca:	06                   	push   %es
 3cb:	3c 05                	cmp    $0x5,%al
 3cd:	03 06                	add    (%esi),%eax
 3cf:	83 05 07 06 01 05 06 	addl   $0x6,0x5010607
 3d6:	00 02                	add    %al,(%edx)
 3d8:	04 01                	add    $0x1,%al
 3da:	ba 00 02 04 01       	mov    $0x1040200,%edx
 3df:	c8 05 14 03          	enter  $0x1405,$0x3
 3e3:	23 01                	and    (%ecx),%eax
 3e5:	05 04 06 65 05       	add    $0x5650604,%eax
 3ea:	0a 06                	or     (%esi),%al
 3ec:	01 05 04 06 3d 05    	add    %eax,0x53d0604
 3f2:	14 06                	adc    $0x6,%al
 3f4:	01 82 05 04 06 2f    	add    %eax,0x2f060405(%edx)
 3fa:	05 07 06 01 05       	add    $0x5010607,%eax
 3ff:	17                   	pop    %ss
 400:	00 02                	add    %al,(%edx)
 402:	04 01                	add    $0x1,%al
 404:	06                   	push   %es
 405:	03 5b 82             	add    -0x7e(%ebx),%ebx
 408:	05 03 13 05 07       	add    $0x7051303,%eax
 40d:	06                   	push   %es
 40e:	01 74 05 06          	add    %esi,0x6(%ebp,%eax,1)
 412:	00 02                	add    %al,(%edx)
 414:	04 01                	add    $0x1,%al
 416:	58                   	pop    %eax
 417:	05 17 00 02 04       	add    $0x4020017,%eax
 41c:	01 06                	add    %eax,(%esi)
 41e:	b9 00 02 04 01       	mov    $0x1040200,%ecx
 423:	06                   	push   %es
 424:	01 05 04 06 03 2b    	add    %eax,0x2b030604
 42a:	01 05 0b 06 01 05    	add    %eax,0x501060b
 430:	09 03                	or     %eax,(%ebx)
 432:	61                   	popa
 433:	3c 05                	cmp    $0x5,%al
 435:	0a 03                	or     (%ebx),%al
 437:	17                   	pop    %ss
 438:	4a                   	dec    %edx
 439:	05 0b 36 3c 05       	add    $0x53c360b,%eax
 43e:	13 03                	adc    (%ebx),%eax
 440:	30 58 05             	xor    %bl,0x5(%eax)
 443:	0d 06 66 05 13       	or     $0x13056606,%eax
 448:	06                   	push   %es
 449:	01 05 0d 06 3d 05    	add    %eax,0x53d060d
 44f:	11 06                	adc    %eax,(%esi)
 451:	01 3c 05 0d 06 67 13 	add    %edi,0x1367060d(,%eax,1)
 458:	06                   	push   %es
 459:	3c 06                	cmp    $0x6,%al
 45b:	bb 05 1a 06 01       	mov    $0x1061a05,%ebx
 460:	05 10 ad 05 1a       	add    $0x1a05ad10,%eax
 465:	3b 05 0d 06 3d 05    	cmp    0x53d060d,%eax
 46b:	1a 06                	sbb    (%esi),%al
 46d:	11 05 10 2f 05 17    	adc    %eax,0x17052f10
 473:	00 02                	add    %al,(%edx)
 475:	04 01                	add    $0x1,%al
 477:	06                   	push   %es
 478:	03 a0 7f 82 05 03    	add    0x305827f(%eax),%esp
 47e:	13 05 07 06 01 05    	adc    0x5010607,%eax
 484:	06                   	push   %es
 485:	00 02                	add    %al,(%edx)
 487:	04 01                	add    $0x1,%al
 489:	9e                   	sahf
 48a:	05 22 00 02 04       	add    $0x4020022,%eax
 48f:	02 06                	add    (%esi),%al
 491:	b9 05 17 00 02       	mov    $0x2001705,%ecx
 496:	04 01                	add    $0x1,%al
 498:	01 05 03 13 05 07    	add    %eax,0x7051303
 49e:	06                   	push   %es
 49f:	01 05 06 00 02 04    	add    %eax,0x4020006
 4a5:	01 9e 00 02 04 01    	add    %ebx,0x1040200(%esi)
 4ab:	ba 05 17 00 02       	mov    $0x2001705,%edx
 4b0:	04 01                	add    $0x1,%al
 4b2:	06                   	push   %es
 4b3:	11 00                	adc    %eax,(%eax)
 4b5:	02 04 01             	add    (%ecx,%eax,1),%al
 4b8:	06                   	push   %es
 4b9:	58                   	pop    %eax
 4ba:	00 02                	add    %al,(%edx)
 4bc:	04 01                	add    $0x1,%al
 4be:	82 05 22 00 02 04 02 	addb   $0x2,0x4020022
 4c5:	06                   	push   %es
 4c6:	08 2e                	or     %ch,(%esi)
 4c8:	05 17 00 02 04       	add    $0x4020017,%eax
 4cd:	01 01                	add    %eax,(%ecx)
 4cf:	00 02                	add    %al,(%edx)
 4d1:	04 01                	add    $0x1,%al
 4d3:	06                   	push   %es
 4d4:	3c 05                	cmp    $0x5,%al
 4d6:	03 06                	add    (%esi),%eax
 4d8:	83 05 07 06 01 05 06 	addl   $0x6,0x5010607
 4df:	00 02                	add    %al,(%edx)
 4e1:	04 01                	add    $0x1,%al
 4e3:	ba 00 02 04 01       	mov    $0x1040200,%edx
 4e8:	08 12                	or     %dl,(%edx)
 4ea:	05 04 06 03 0f       	add    $0xf030604,%eax
 4ef:	01 05 05 13 05 0b    	add    %eax,0xb051305
 4f5:	06                   	push   %es
 4f6:	01 05 04 06 3d 13    	add    %eax,0x133d0604
 4fc:	05 1a 01 05 11       	add    $0x1105011a,%eax
 501:	06                   	push   %es
 502:	01 05 1a 4a 05 0b    	add    %eax,0xb054a1a
 508:	f1                   	int1
 509:	58                   	pop    %eax
 50a:	05 05 06 bc 05       	add    $0x5bc0605,%eax
 50f:	0b 06                	or     (%esi),%eax
 511:	01 05 1a 06 3b 05    	add    %eax,0x53b061a
 517:	11 06                	adc    %eax,(%esi)
 519:	01 05 1a 4a 05 04    	add    %eax,0x4054a1a
 51f:	06                   	push   %es
 520:	84 05 07 06 01 05    	test   %al,0x5010607
 526:	11 80 3c 2e 05 22    	adc    %eax,0x22052e3c(%eax)
 52c:	00 02                	add    %al,(%edx)
 52e:	04 02                	add    $0x2,%al
 530:	06                   	push   %es
 531:	03 6d ba             	add    -0x46(%ebp),%ebp
 534:	05 17 00 02 04       	add    $0x4020017,%eax
 539:	01 01                	add    %eax,(%ecx)
 53b:	00 02                	add    %al,(%edx)
 53d:	04 01                	add    $0x1,%al
 53f:	06                   	push   %es
 540:	3c 05                	cmp    $0x5,%al
 542:	03 06                	add    (%esi),%eax
 544:	4b                   	dec    %ebx
 545:	05 07 06 01 05       	add    $0x5010607,%eax
 54a:	06                   	push   %es
 54b:	00 02                	add    %al,(%edx)
 54d:	04 01                	add    $0x1,%al
 54f:	ba 00 02 04 01       	mov    $0x1040200,%edx
 554:	08 4a 05             	or     %cl,0x5(%edx)
 557:	09 03                	or     %eax,(%ebx)
 559:	0b 01                	or     (%ecx),%eax
 55b:	05 04 06 03 0f       	add    $0xf030604,%eax
 560:	90                   	nop
 561:	13 05 0c 06 01 05    	adc    0x501060c,%eax
 567:	04 06                	add    $0x6,%al
 569:	2f                   	das
 56a:	05 0b 06 10 05       	add    $0x510060b,%eax
 56f:	04 30                	add    $0x30,%al
 571:	ac                   	lods   %ds:(%esi),%al
 572:	05 0d 06 03 2f       	add    $0x2f03060d,%eax
 577:	82 05 15 06 01 05 1a 	addb   $0x1a,0x5010615
 57e:	03 78 2e             	add    0x2e(%eax),%edi
 581:	05 09 03 48 3c       	add    $0x3c480309,%eax
 586:	05 13 03 37 4a       	add    $0x4a370313,%eax
 58b:	05 1a 3d ba 05       	add    $0x5ba3d1a,%eax
 590:	0d 06 03 22 58       	or     $0x58220306,%eax
 595:	05 15 06 01 58       	add    $0x58010615,%eax
 59a:	05 09 03 a6 7f       	add    $0x7fa60309,%eax
 59f:	01 05 13 03 cf 00    	add    %eax,0xcf0313
 5a5:	4a                   	dec    %edx
 5a6:	05 04 06 03 ba       	add    $0xba030604,%eax
 5ab:	7f 9e                	jg     54b <_start-0x7ab5>
 5ad:	05 07 06 01 05       	add    $0x5010607,%eax
 5b2:	11 80 05 0b 3b 74    	adc    %eax,0x743b0b05(%eax)
 5b8:	58                   	pop    %eax
 5b9:	58                   	pop    %eax
 5ba:	05 04 06 03 84       	add    $0x84030604,%eax
 5bf:	01 01                	add    %eax,(%ecx)
 5c1:	05 0c 06 01 05       	add    $0x501060c,%eax
 5c6:	04 06                	add    $0x6,%al
 5c8:	2f                   	das
 5c9:	05 0b 06 01 2e       	add    $0x2e01060b,%eax
 5ce:	05 09 03 f5 7e       	add    $0x7ef50309,%eax
 5d3:	01 05 17 03 de 00    	add    %eax,0xde0317
 5d9:	82 05 11 3f 06 63 05 	addb   $0x5,0x63063f11
 5e0:	17                   	pop    %ss
 5e1:	06                   	push   %es
 5e2:	01 05 11 06 3d 05    	add    %eax,0x53d0611
 5e8:	16                   	push   %ss
 5e9:	06                   	push   %es
 5ea:	01 3c 05 11 06 67 13 	add    %edi,0x13670611(,%eax,1)
 5f1:	bb 05 1e 06 01       	mov    $0x1061e05,%ebx
 5f6:	05 11 06 83 05       	add    $0x5830611,%eax
 5fb:	14 06                	adc    $0x6,%al
 5fd:	01 05 17 00 02 04    	add    %eax,0x4020017
 603:	01 06                	add    %eax,(%esi)
 605:	03 91 7f d6 05 03    	add    0x305d67f(%ecx),%edx
 60b:	13 05 07 06 01 05    	adc    0x5010607,%eax
 611:	06                   	push   %es
 612:	00 02                	add    %al,(%edx)
 614:	04 01                	add    $0x1,%al
 616:	9e                   	sahf
 617:	05 22 00 02 04       	add    $0x4020022,%eax
 61c:	02 06                	add    (%esi),%al
 61e:	b9 05 17 00 02       	mov    $0x2001705,%ecx
 623:	04 01                	add    $0x1,%al
 625:	01 05 03 13 05 07    	add    %eax,0x7051303
 62b:	06                   	push   %es
 62c:	01 05 06 00 02 04    	add    %eax,0x4020006
 632:	01 9e 00 02 04 01    	add    %ebx,0x1040200(%esi)
 638:	ba 05 17 00 02       	mov    $0x2001705,%edx
 63d:	04 01                	add    $0x1,%al
 63f:	06                   	push   %es
 640:	11 00                	adc    %eax,(%eax)
 642:	02 04 01             	add    (%ecx,%eax,1),%al
 645:	06                   	push   %es
 646:	ac                   	lods   %ds:(%esi),%al
 647:	00 02                	add    %al,(%edx)
 649:	04 01                	add    $0x1,%al
 64b:	c8 00 02 04          	enter  $0x200,$0x4
 64f:	01 3c 05 22 00 02 04 	add    %edi,0x4020022(,%eax,1)
 656:	02 06                	add    (%esi),%al
 658:	9e                   	sahf
 659:	05 17 00 02 04       	add    $0x4020017,%eax
 65e:	01 01                	add    %eax,(%ecx)
 660:	00 02                	add    %al,(%edx)
 662:	04 01                	add    $0x1,%al
 664:	06                   	push   %es
 665:	3c 05                	cmp    $0x5,%al
 667:	03 06                	add    (%esi),%eax
 669:	4b                   	dec    %ebx
 66a:	05 07 06 01 05       	add    $0x5010607,%eax
 66f:	06                   	push   %es
 670:	00 02                	add    %al,(%edx)
 672:	04 01                	add    $0x1,%al
 674:	ba 00 02 04 01       	mov    $0x1040200,%edx
 679:	c8 00 02 04          	enter  $0x200,$0x4
 67d:	01 82 05 11 06 03    	add    %eax,0x3061105(%edx)
 683:	f4                   	hlt
 684:	00 01                	add    %al,(%ecx)
 686:	05 19 06 01 05       	add    $0x5010619,%eax
 68b:	16                   	push   %ss
 68c:	03 76 2e             	add    0x2e(%esi),%esi
 68f:	05 09 03 a1 7f       	add    $0x7fa10309,%eax
 694:	3c 05                	cmp    $0x5,%al
 696:	17                   	pop    %ss
 697:	03 de                	add    %esi,%ebx
 699:	00 4a 05             	add    %cl,0x5(%edx)
 69c:	16                   	push   %ss
 69d:	3d 05 17 03 0c       	cmp    $0xc031705,%eax
 6a2:	82 05 11 3f 06 63 05 	addb   $0x5,0x63063f11
 6a9:	17                   	pop    %ss
 6aa:	06                   	push   %es
 6ab:	01 05 11 06 3d 05    	add    %eax,0x53d0611
 6b1:	1f                   	pop    %ds
 6b2:	06                   	push   %es
 6b3:	01 3c 05 11 06 67 13 	add    %edi,0x13670611(,%eax,1)
 6ba:	bb 05 1e 06 01       	mov    $0x1061e05,%ebx
 6bf:	05 11 06 83 05       	add    $0x5830611,%eax
 6c4:	14 06                	adc    $0x6,%al
 6c6:	01 05 17 00 02 04    	add    %eax,0x4020017
 6cc:	01 06                	add    %eax,(%esi)
 6ce:	03 84 7f ac 00 02 04 	add    0x40200ac(%edi,%edi,2),%eax
 6d5:	01 06                	add    %eax,(%esi)
 6d7:	4a                   	dec    %edx
 6d8:	00 02                	add    %al,(%edx)
 6da:	04 01                	add    $0x1,%al
 6dc:	08 58 05             	or     %bl,0x5(%eax)
 6df:	22 00                	and    (%eax),%al
 6e1:	02 04 02             	add    (%edx,%eax,1),%al
 6e4:	06                   	push   %es
 6e5:	66 05 17 00          	add    $0x17,%ax
 6e9:	02 04 01             	add    (%ecx,%eax,1),%al
 6ec:	01 00                	add    %eax,(%eax)
 6ee:	02 04 01             	add    (%ecx,%eax,1),%al
 6f1:	06                   	push   %es
 6f2:	3c 05                	cmp    $0x5,%al
 6f4:	03 06                	add    (%esi),%eax
 6f6:	4b                   	dec    %ebx
 6f7:	05 07 06 01 05       	add    $0x5010607,%eax
 6fc:	06                   	push   %es
 6fd:	00 02                	add    %al,(%edx)
 6ff:	04 01                	add    $0x1,%al
 701:	ba 00 02 04 01       	mov    $0x1040200,%edx
 706:	c8 05 11 06          	enter  $0x1105,$0x6
 70a:	03 8a 01 82 05 16    	add    0x16058201(%edx),%ecx
 710:	06                   	push   %es
 711:	03 78 01             	add    0x1(%eax),%edi
 714:	05 19 44 2e 05       	add    $0x52e4419,%eax
 719:	09 03                	or     %eax,(%ebx)
 71b:	81 7f 01 05 17 03 f6 	cmpl   $0xf6031705,0x1(%edi)
 722:	00 4a 05             	add    %cl,0x5(%edx)
 725:	16                   	push   %ss
 726:	3d 05 17 81 05       	cmp    $0x5811705,%eax
 72b:	11 3f                	adc    %edi,(%edi)
 72d:	06                   	push   %es
 72e:	63 05 17 06 01 05    	arpl   %eax,0x5010617
 734:	11 06                	adc    %eax,(%esi)
 736:	3d 05 16 06 01       	cmp    $0x1061605,%eax
 73b:	3c 05                	cmp    $0x5,%al
 73d:	11 06                	adc    %eax,(%esi)
 73f:	67 13 bb 05 1e       	adc    0x1e05(%bp,%di),%edi
 744:	06                   	push   %es
 745:	01 05 11 06 83 05    	add    %eax,0x5830611
 74b:	14 06                	adc    $0x6,%al
 74d:	01 05 17 00 02 04    	add    %eax,0x4020017
 753:	01 06                	add    %eax,(%esi)
 755:	03 f9                	add    %ecx,%edi
 757:	7e ac                	jle    705 <_start-0x78fb>
 759:	00 02                	add    %al,(%edx)
 75b:	04 01                	add    $0x1,%al
 75d:	06                   	push   %es
 75e:	4a                   	dec    %edx
 75f:	00 02                	add    %al,(%edx)
 761:	04 01                	add    $0x1,%al
 763:	08 58 05             	or     %bl,0x5(%eax)
 766:	22 00                	and    (%eax),%al
 768:	02 04 02             	add    (%edx,%eax,1),%al
 76b:	06                   	push   %es
 76c:	66 05 17 00          	add    $0x17,%ax
 770:	02 04 01             	add    (%ecx,%eax,1),%al
 773:	01 00                	add    %eax,(%eax)
 775:	02 04 01             	add    (%ecx,%eax,1),%al
 778:	06                   	push   %es
 779:	3c 05                	cmp    $0x5,%al
 77b:	03 06                	add    (%esi),%eax
 77d:	4b                   	dec    %ebx
 77e:	05 07 06 01 05       	add    $0x5010607,%eax
 783:	06                   	push   %es
 784:	00 02                	add    %al,(%edx)
 786:	04 01                	add    $0x1,%al
 788:	ba 00 02 04 01       	mov    $0x1040200,%edx
 78d:	c8 00 02 04          	enter  $0x200,$0x4
 791:	01 74 03 09          	add    %esi,0x9(%ebx,%eax,1)
 795:	01 05 02 06 03 91    	add    %eax,0x91030602
 79b:	01 2e                	add    %ebp,(%esi)
 79d:	13 05 09 06 01 02    	adc    0x2010609,%eax
 7a3:	05 00 01 01 51       	add    $0x51010100,%eax
 7a8:	00 00                	add    %al,(%eax)
 7aa:	00 05 00 04 00 2e    	add    %al,0x2e000400
 7b0:	00 00                	add    %al,(%eax)
 7b2:	00 01                	add    %al,(%ecx)
 7b4:	01 01                	add    %eax,(%ecx)
 7b6:	fb                   	sti
 7b7:	0e                   	push   %cs
 7b8:	0d 00 01 01 01       	or     $0x1010100,%eax
 7bd:	01 00                	add    %eax,(%eax)
 7bf:	00 00                	add    %al,(%eax)
 7c1:	01 00                	add    %eax,(%eax)
 7c3:	00 01                	add    %al,(%ecx)
 7c5:	01 01                	add    %eax,(%ecx)
 7c7:	1f                   	pop    %ds
 7c8:	02 73 00             	add    0x0(%ebx),%dh
 7cb:	00 00                	add    %al,(%eax)
 7cd:	9c                   	pushf
 7ce:	00 00                	add    %al,(%eax)
 7d0:	00 02                	add    %al,(%edx)
 7d2:	01 1f                	add    %ebx,(%edi)
 7d4:	02 0f                	add    (%edi),%cl
 7d6:	02 03                	add    (%ebx),%al
 7d8:	01 00                	add    %eax,(%eax)
 7da:	00 01                	add    %al,(%ecx)
 7dc:	03 01                	add    (%ecx),%eax
 7de:	00 00                	add    %al,(%eax)
 7e0:	01 05 15 00 05 02    	add    %eax,0x2050015
 7e6:	00 87 00 00 18 05    	add    %al,0x5180000(%edi)
 7ec:	02 19                	add    (%ecx),%bl
 7ee:	05 15 06 03 79       	add    $0x79030615,%eax
 7f3:	01 05 01 44 02 05    	add    %eax,0x5024401
 7f9:	00 01                	add    %al,(%ecx)
 7fb:	01 66 01             	add    %esp,0x1(%esi)
 7fe:	00 00                	add    %al,(%eax)
 800:	05 00 04 00 2e       	add    $0x2e000400,%eax
 805:	00 00                	add    %al,(%eax)
 807:	00 01                	add    %al,(%ecx)
 809:	01 01                	add    %eax,(%ecx)
 80b:	fb                   	sti
 80c:	0e                   	push   %cs
 80d:	0d 00 01 01 01       	or     $0x1010100,%eax
 812:	01 00                	add    %eax,(%eax)
 814:	00 00                	add    %al,(%eax)
 816:	01 00                	add    %eax,(%eax)
 818:	00 01                	add    %al,(%ecx)
 81a:	01 01                	add    %eax,(%ecx)
 81c:	1f                   	pop    %ds
 81d:	02 73 00             	add    0x0(%ebx),%dh
 820:	00 00                	add    %al,(%eax)
 822:	1b 01                	sbb    (%ecx),%eax
 824:	00 00                	add    %al,(%eax)
 826:	02 01                	add    (%ecx),%al
 828:	1f                   	pop    %ds
 829:	02 0f                	add    (%edi),%cl
 82b:	02 14 01             	add    (%ecx,%eax,1),%dl
 82e:	00 00                	add    %al,(%eax)
 830:	01 14 01             	add    %edx,(%ecx,%eax,1)
 833:	00 00                	add    %al,(%eax)
 835:	01 05 41 00 05 02    	add    %eax,0x2050041
 83b:	40                   	inc    %eax
 83c:	87 00                	xchg   %eax,(%eax)
 83e:	00 14 06             	add    %dl,(%esi,%eax,1)
 841:	01 05 05 06 3d 05    	add    %eax,0x53d0605
 847:	41                   	inc    %ecx
 848:	06                   	push   %es
 849:	11 05 12 67 05 41    	adc    %eax,0x41056712
 84f:	3b 05 12 67 05 08    	cmp    0x8056712,%eax
 855:	3c 05                	cmp    $0x5,%al
 857:	05 06 95 13 14       	add    $0x14139506,%eax
 85c:	05 08 06 01 05       	add    $0x5010608,%eax
 861:	05 06 89 05 09       	add    $0x9058906,%eax
 866:	06                   	push   %es
 867:	01 05 1f 3c 05 09    	add    %eax,0x9053c1f
 86d:	2e 05 1f 58 05 23    	cs add $0x2305581f,%eax
 873:	00 02                	add    %al,(%edx)
 875:	04 01                	add    $0x1,%al
 877:	3c 05                	cmp    $0x5,%al
 879:	09 03                	or     %eax,(%ebx)
 87b:	77 d6                	ja     853 <_start-0x77ad>
 87d:	05 05 06 03 0e       	add    $0xe030605,%eax
 882:	74 15                	je     899 <_start-0x7767>
 884:	05 16 01 05 0b       	add    $0xb050116,%eax
 889:	06                   	push   %es
 88a:	03 6e 3c             	add    0x3c(%esi),%ebp
 88d:	4a                   	dec    %edx
 88e:	05 13 03 15 02       	add    $0x2150313,%eax
 893:	31 01                	xor    %eax,(%ecx)
 895:	05 0d 00 02 04       	add    $0x402000d,%eax
 89a:	04 2d                	add    $0x2d,%al
 89c:	05 09 06 2d 75       	add    $0x752d0609,%eax
 8a1:	05 35 00 02 04       	add    $0x4020035,%eax
 8a6:	01 06                	add    %eax,(%esi)
 8a8:	01 05 0d 00 02 04    	add    %eax,0x402000d
 8ae:	04 ba                	add    $0xba,%al
 8b0:	05 35 00 02 04       	add    $0x4020035,%eax
 8b5:	01 3c 05 10 00 02 04 	add    %edi,0x4020010(,%eax,1)
 8bc:	04 2e                	add    $0x2e,%al
 8be:	05 09 06 3d 06       	add    $0x63d0609,%eax
 8c3:	01 05 16 06 0f 05    	add    %eax,0x50f0616
 8c9:	08 06                	or     %al,(%esi)
 8cb:	5e                   	pop    %esi
 8cc:	3c 05                	cmp    $0x5,%al
 8ce:	05 06 3c 05 08       	add    $0x8053c06,%eax
 8d3:	06                   	push   %es
 8d4:	01 05 09 06 4b 05    	add    %eax,0x54b0609
 8da:	0d 06 01 05 10       	or     $0x10050106,%eax
 8df:	3c 05                	cmp    $0x5,%al
 8e1:	0d 58 05 05 06       	or     $0x6050558,%eax
 8e6:	31 05 0a 06 01 05    	xor    %eax,0x501060a
 8ec:	05 06 3f 13 13       	add    $0x13133f06,%eax
 8f1:	05 12 01 05 0b       	add    $0xb050112,%eax
 8f6:	06                   	push   %es
 8f7:	10 05 12 30 4a 05    	adc    %al,0x54a3012
 8fd:	09 06                	or     %eax,(%esi)
 8ff:	08 d7                	or     %dl,%bh
 901:	05 0e 06 01 05       	add    $0x501060e,%eax
 906:	09 06                	or     %eax,(%esi)
 908:	3d 05 14 06 01       	cmp    $0x1061405,%eax
 90d:	05 0f 3c 05 0d       	add    $0xd053c0f,%eax
 912:	3d 05 12 3b 05       	cmp    $0x53b1205,%eax
 917:	09 06                	or     %eax,(%esi)
 919:	3d 05 10 06 01       	cmp    $0x1061005,%eax
 91e:	3c 05                	cmp    $0x5,%al
 920:	12 06                	adc    (%esi),%al
 922:	0f 05                	syscall
 924:	01 06                	add    %eax,(%esi)
 926:	51                   	push   %ecx
 927:	58                   	pop    %eax
 928:	2e 05 09 06 03 5c    	cs add $0x5c030609,%eax
 92e:	3c 13                	cmp    $0x13,%al
 930:	05 10 06 11 05       	add    $0x5110610,%eax
 935:	09 06                	or     %eax,(%esi)
 937:	84 05 01 06 03 22    	test   %al,0x22030601
 93d:	01 05 09 06 03 54    	add    %eax,0x54030609
 943:	f2 05 11 06 01 05    	repnz add $0x5010611,%eax
 949:	09 06                	or     %eax,(%esi)
 94b:	3d 05 01 06 03       	cmp    $0x3060105,%eax
 950:	2b 01                	sub    (%ecx),%eax
 952:	05 09 06 03 63       	add    $0x63030609,%eax
 957:	c8 13 05 14          	enter  $0x513,$0x14
 95b:	06                   	push   %es
 95c:	11 05 0f 75 2e 02    	adc    %eax,0x22e750f
 962:	05 00 01 01 74       	add    $0x74010100,%eax
 967:	00 00                	add    %al,(%eax)
 969:	00 05 00 04 00 37    	add    %al,0x37000400
 96f:	00 00                	add    %al,(%eax)
 971:	00 01                	add    %al,(%ecx)
 973:	01 01                	add    %eax,(%ecx)
 975:	fb                   	sti
 976:	0e                   	push   %cs
 977:	0d 00 01 01 01       	or     $0x1010100,%eax
 97c:	01 00                	add    %eax,(%eax)
 97e:	00 00                	add    %al,(%eax)
 980:	01 00                	add    %eax,(%eax)
 982:	00 01                	add    %al,(%ecx)
 984:	01 01                	add    %eax,(%ecx)
 986:	1f                   	pop    %ds
 987:	03 73 00             	add    0x0(%ebx),%esi
 98a:	00 00                	add    %al,(%eax)
 98c:	32 01                	xor    (%ecx),%al
 98e:	00 00                	add    %al,(%eax)
 990:	a2 00 00 00 02       	mov    %al,0x2000000
 995:	01 1f                	add    %ebx,(%edi)
 997:	02 0f                	add    (%edi),%cl
 999:	03 29                	add    (%ecx),%ebp
 99b:	01 00                	add    %eax,(%eax)
 99d:	00 01                	add    %al,(%ecx)
 99f:	29 01                	sub    %eax,(%ecx)
 9a1:	00 00                	add    %al,(%eax)
 9a3:	01 e2                	add    %esp,%edx
 9a5:	00 00                	add    %al,(%eax)
 9a7:	00 02                	add    %al,(%edx)
 9a9:	05 20 00 05 02       	add    $0x2050020,%eax
 9ae:	80 88 00 00 14 05 02 	orb    $0x2,0x5140000(%eax)
 9b5:	13 13                	adc    (%ebx),%edx
 9b7:	05 09 01 05 20       	add    $0x20050109,%eax
 9bc:	06                   	push   %es
 9bd:	10 05 09 21 05 20    	adc    %al,0x20052109
 9c3:	2d 2e 05 09 3e       	sub    $0x3e09052e,%eax
 9c8:	58                   	pop    %eax
 9c9:	05 03 06 3d 05       	add    $0x53d0603,%eax
 9ce:	06                   	push   %es
 9cf:	06                   	push   %es
 9d0:	01 05 09 06 3b 05    	add    %eax,0x53b0609
 9d6:	01 06                	add    %eax,(%esi)
 9d8:	69 02 02 00 01 01    	imul   $0x1010002,(%edx),%eax

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
  2f:	31 2f                	xor    %ebp,(%edi)
  31:	6d                   	insl   (%dx),%es:(%edi)
  32:	61                   	popa
  33:	69 6e 2e 63 00 70 72 	imul   $0x72700063,0x2e(%esi),%ebp
  3a:	6f                   	outsl  %ds:(%esi),(%dx)
  3b:	63 65 73             	arpl   %esp,0x73(%ebp)
  3e:	73 5f                	jae    9f <_start-0x7f61>
  40:	31 00                	xor    %eax,(%eax)
  42:	2f                   	das
  43:	68 6f 6d 65 2f       	push   $0x2f656d6f
  48:	76 69                	jbe    b3 <_start-0x7f4d>
  4a:	6b 74 6f 72 2f       	imul   $0x2f,0x72(%edi,%ebp,2),%esi
  4f:	48                   	dec    %eax
  50:	56                   	push   %esi
  51:	4a                   	dec    %edx
  52:	56                   	push   %esi
  53:	2d 4f 53 2f 73       	sub    $0x732f534f,%eax
  58:	79 73                	jns    cd <_start-0x7f33>
  5a:	72 6f                	jb     cb <_start-0x7f35>
  5c:	6f                   	outsl  %ds:(%esi),(%dx)
  5d:	74 2f                	je     8e <_start-0x7f72>
  5f:	75 73                	jne    d4 <_start-0x7f2c>
  61:	72 2f                	jb     92 <_start-0x7f6e>
  63:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  6a:	00 73 74             	add    %dh,0x74(%ebx)
  6d:	64 69 6f 2e 68 00 2f 	imul   $0x682f0068,%fs:0x2e(%edi),%ebp
  74:	68 
  75:	6f                   	outsl  %ds:(%esi),(%dx)
  76:	6d                   	insl   (%dx),%es:(%edi)
  77:	65 2f                	gs das
  79:	76 69                	jbe    e4 <_start-0x7f1c>
  7b:	6b 74 6f 72 2f       	imul   $0x2f,0x72(%edi,%ebp,2),%esi
  80:	48                   	dec    %eax
  81:	56                   	push   %esi
  82:	4a                   	dec    %edx
  83:	56                   	push   %esi
  84:	2d 4f 53 2f 6c       	sub    $0x6c2f534f,%eax
  89:	69 62 63 00 73 74 64 	imul   $0x64747300,0x63(%edx),%esp
  90:	69 6f 2f 70 72 69 6e 	imul   $0x6e697270,0x2f(%edi),%ebp
  97:	74 66                	je     ff <_start-0x7f01>
  99:	2e 63 00             	arpl   %eax,%cs:(%eax)
  9c:	73 74                	jae    112 <_start-0x7eee>
  9e:	64 69 6f 00 2f 68 6f 	imul   $0x6d6f682f,%fs:0x0(%edi),%ebp
  a5:	6d 
  a6:	65 2f                	gs das
  a8:	76 69                	jbe    113 <_start-0x7eed>
  aa:	6b 74 6f 72 2f       	imul   $0x2f,0x72(%edi,%ebp,2),%esi
  af:	6f                   	outsl  %ds:(%esi),(%dx)
  b0:	70 74                	jo     126 <_start-0x7eda>
  b2:	2f                   	das
  b3:	63 72 6f             	arpl   %esi,0x6f(%edx)
  b6:	73 73                	jae    12b <_start-0x7ed5>
  b8:	2f                   	das
  b9:	6c                   	insb   (%dx),%es:(%edi)
  ba:	69 62 2f 67 63 63 2f 	imul   $0x2f636367,0x2f(%edx),%esp
  c1:	69 36 38 36 2d 65    	imul   $0x652d3638,(%esi),%esi
  c7:	6c                   	insb   (%dx),%es:(%edi)
  c8:	66 2f                	data16 das
  ca:	31 34 2e             	xor    %esi,(%esi,%ebp,1)
  cd:	32 2e                	xor    (%esi),%ch
  cf:	30 2f                	xor    %ch,(%edi)
  d1:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  d8:	00 73 74             	add    %dh,0x74(%ebx)
  db:	64 61                	fs popa
  dd:	72 67                	jb     146 <_start-0x7eba>
  df:	2e 68 00 73 74 64    	cs push $0x64747300
  e5:	64 65 66 2e 68 00 73 	fs gs cs pushw $0x7300
  ec:	74 64                	je     152 <_start-0x7eae>
  ee:	6c                   	insb   (%dx),%es:(%edi)
  ef:	69 62 2e 68 00 73 74 	imul   $0x74730068,0x2e(%edx),%esp
  f6:	72 69                	jb     161 <_start-0x7e9f>
  f8:	6e                   	outsb  %ds:(%esi),(%dx)
  f9:	67 2e 68 00 73 74 64 	addr16 cs push $0x64747300
 100:	69 6f 2f 70 75 74 63 	imul   $0x63747570,0x2f(%edi),%ebp
 107:	68 61 72 2e 63       	push   $0x632e7261
 10c:	00 73 74             	add    %dh,0x74(%ebx)
 10f:	64 6c                	fs insb (%dx),%es:(%edi)
 111:	69 62 2f 69 74 6f 61 	imul   $0x616f7469,0x2f(%edx),%esp
 118:	2e 63 00             	arpl   %eax,%cs:(%eax)
 11b:	73 74                	jae    191 <_start-0x7e6f>
 11d:	64 6c                	fs insb (%dx),%es:(%edi)
 11f:	69 62 00 73 74 72 69 	imul   $0x69727473,0x0(%edx),%esp
 126:	6e                   	outsb  %ds:(%esi),(%dx)
 127:	67 2f                	addr16 das
 129:	73 74                	jae    19f <_start-0x7e61>
 12b:	72 6c                	jb     199 <_start-0x7e67>
 12d:	65 6e                	outsb  %gs:(%esi),(%dx)
 12f:	2e 63 00             	arpl   %eax,%cs:(%eax)
 132:	73 74                	jae    1a8 <_start-0x7e58>
 134:	72 69                	jb     19f <_start-0x7e61>
 136:	6e                   	outsb  %ds:(%esi),(%dx)
 137:	67                   	addr16
	...

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
  23:	80 78 00 00          	cmpb   $0x0,0x0(%eax)
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
  4f:	02 0c 05 3d 00 00 00 	add    0x3d(,%eax,1),%cl
  56:	3d 00 00 00 03       	cmp    $0x3000000,%eax
  5b:	4a                   	dec    %edx
  5c:	00 00                	add    %al,(%eax)
  5e:	00 04 00             	add    %al,(%eax,%eax,1)
  61:	05 04 05 69 6e       	add    $0x6e690504,%eax
  66:	74 00                	je     68 <_start-0x7f98>
  68:	06                   	push   %es
  69:	04 56                	add    $0x56,%al
  6b:	00 00                	add    %al,(%eax)
  6d:	00 07                	add    %al,(%edi)
  6f:	44                   	inc    %esp
  70:	00 00                	add    %al,(%eax)
  72:	00 08                	add    %cl,(%eax)
  74:	01 06                	add    %eax,(%esi)
  76:	ad                   	lods   %ds:(%esi),%eax
  77:	00 00                	add    %al,(%eax)
  79:	00 09                	add    %cl,(%ecx)
  7b:	4f                   	dec    %edi
  7c:	00 00                	add    %al,(%eax)
  7e:	00 0a                	add    %cl,(%edx)
  80:	82 00 00             	addb   $0x0,(%eax)
  83:	00 01                	add    %al,(%ecx)
  85:	03 05 3d 00 00 00    	add    0x3d,%eax
  8b:	10 80 00 00 25 00    	adc    %al,0x250000(%eax)
  91:	00 00                	add    %al,(%eax)
  93:	01 9c 0b 2b 80 00 00 	add    %ebx,0x802b(%ebx,%ecx,1)
  9a:	26 00 00             	add    %al,%es:(%eax)
  9d:	00 00                	add    %al,(%eax)
  9f:	00 36                	add    %dh,(%esi)
  a1:	08 00                	or     %al,(%eax)
  a3:	00 05 00 01 04 9a    	add    %al,0x9a040100
  a9:	00 00                	add    %al,(%eax)
  ab:	00 19                	add    %bl,(%ecx)
  ad:	06                   	push   %es
  ae:	01 00                	add    %eax,(%eax)
  b0:	00 1d 8d 00 00 00    	add    %bl,0x8d
  b6:	73 00                	jae    b8 <_start-0x7f48>
  b8:	00 00                	add    %al,(%eax)
  ba:	40                   	inc    %eax
  bb:	80 00 00             	addb   $0x0,(%eax)
  be:	be 06 00 00 a6       	mov    $0xa6000006,%esi
  c3:	00 00                	add    %al,(%eax)
  c5:	00 12                	add    %dl,(%edx)
  c7:	8e 01                	mov    (%ecx),%es
  c9:	00 00                	add    %al,(%eax)
  cb:	02 28                	add    (%eax),%ch
  cd:	1b 32                	sbb    (%edx),%esi
  cf:	00 00                	add    %al,(%eax)
  d1:	00 1a                	add    %bl,(%edx)
  d3:	04 b9                	add    $0xb9,%al
  d5:	00 00                	add    %al,(%eax)
  d7:	00 3c 00             	add    %bh,(%eax,%eax,1)
  da:	00 00                	add    %al,(%eax)
  dc:	07                   	pop    %es
  dd:	01 06                	add    %eax,(%esi)
  df:	ad                   	lods   %ds:(%esi),%eax
  e0:	00 00                	add    %al,(%eax)
  e2:	00 15 3c 00 00 00    	add    %dl,0x3c
  e8:	12 95 01 00 00 02    	adc    0x2000001(%ebp),%dl
  ee:	67 18 26 00 00       	sbb    %ah,0x0
  f3:	00 07                	add    %al,(%edi)
  f5:	04 05                	add    $0x5,%al
  f7:	8c 00                	mov    %es,(%eax)
  f9:	00 00                	add    %al,(%eax)
  fb:	12 9d 00 00 00 03    	adc    0x3000000(%ebp),%bl
 101:	d6                   	(bad)
 102:	17                   	pop    %ss
 103:	67 00 00             	add    %al,(%bx,%si)
 106:	00 07                	add    %al,(%edi)
 108:	04 07                	add    $0x7,%al
 10a:	e2 00                	loop   10c <_start-0x7ef4>
 10c:	00 00                	add    %al,(%eax)
 10e:	1b 04 05 69 6e 74 00 	sbb    0x746e69(,%eax,1),%eax
 115:	07                   	pop    %es
 116:	08 05 87 00 00 00    	or     %al,0x87
 11c:	07                   	pop    %es
 11d:	0c 04                	or     $0x4,%al
 11f:	9d                   	popf
 120:	01 00                	add    %eax,(%eax)
 122:	00 07                	add    %al,(%edi)
 124:	10 04 d8             	adc    %al,(%eax,%ebx,8)
 127:	00 00                	add    %al,(%eax)
 129:	00 13                	add    %dl,(%ebx)
 12b:	95                   	xchg   %eax,%ebp
 12c:	00 00                	add    %al,(%eax)
 12e:	00 04 0d 05 6e 00 00 	add    %al,0x6e05(,%ecx,1)
 135:	00 a0 00 00 00 0b    	add    %ah,0xb000000(%eax)
 13b:	6e                   	outsb  %ds:(%esi),(%dx)
 13c:	00 00                	add    %al,(%eax)
 13e:	00 00                	add    %al,(%eax)
 140:	13 a9 01 00 00 05    	adc    0x5000001(%ecx),%ebp
 146:	0d 07 c5 00 00       	or     $0xc507,%eax
 14b:	00 c5                	add    %al,%ch
 14d:	00 00                	add    %al,(%eax)
 14f:	00 0b                	add    %cl,(%ebx)
 151:	54                   	push   %esp
 152:	00 00                	add    %al,(%eax)
 154:	00 0b                	add    %cl,(%ebx)
 156:	c5 00                	lds    (%eax),%eax
 158:	00 00                	add    %al,(%eax)
 15a:	0b 6e 00             	or     0x0(%esi),%ebp
 15d:	00 00                	add    %al,(%eax)
 15f:	0b 6e 00             	or     0x0(%esi),%ebp
 162:	00 00                	add    %al,(%eax)
 164:	00 14 3c             	add    %dl,(%esp,%edi,1)
 167:	00 00                	add    %al,(%eax)
 169:	00 13                	add    %dl,(%ebx)
 16b:	80 01 00             	addb   $0x0,(%ecx)
 16e:	00 06                	add    %al,(%esi)
 170:	10 08                	adc    %cl,(%eax)
 172:	5b                   	pop    %ebx
 173:	00 00                	add    %al,(%eax)
 175:	00 e0                	add    %ah,%al
 177:	00 00                	add    %al,(%eax)
 179:	00 0b                	add    %cl,(%ebx)
 17b:	e0 00                	loopne 17d <_start-0x7e83>
 17d:	00 00                	add    %al,(%eax)
 17f:	00 14 43             	add    %dl,(%ebx,%eax,2)
 182:	00 00                	add    %al,(%eax)
 184:	00 1c e0             	add    %bl,(%eax,%eiz,8)
 187:	00 00                	add    %al,(%eax)
 189:	00 1d 7b 00 00 00    	add    %bl,0x7b
 18f:	01 10                	add    %edx,(%eax)
 191:	05 6e 00 00 00       	add    $0x6e,%eax
 196:	40                   	inc    %eax
 197:	80 00 00             	addb   $0x0,(%eax)
 19a:	be 06 00 00 01       	mov    $0x1000006,%esi
 19f:	9c                   	pushf
 1a0:	ce                   	into
 1a1:	07                   	pop    %es
 1a2:	00 00                	add    %al,(%eax)
 1a4:	1e                   	push   %ds
 1a5:	d1 00                	roll   $1,(%eax)
 1a7:	00 00                	add    %al,(%eax)
 1a9:	01 10                	add    %edx,(%eax)
 1ab:	21 e5                	and    %esp,%ebp
 1ad:	00 00                	add    %al,(%eax)
 1af:	00 3a                	add    %bh,(%edx)
 1b1:	00 00                	add    %al,(%eax)
 1b3:	00 0c 00             	add    %cl,(%eax,%eax,1)
 1b6:	00 00                	add    %al,(%eax)
 1b8:	1f                   	pop    %ds
 1b9:	0e                   	push   %cs
 1ba:	75 01                	jne    1bd <_start-0x7e43>
 1bc:	00 00                	add    %al,(%eax)
 1be:	11 0d 48 00 00 00    	adc    %ecx,0x48
 1c4:	27                   	daa
 1c5:	01 00                	add    %eax,(%eax)
 1c7:	00 e9                	add    %ch,%cl
 1c9:	00 00                	add    %al,(%eax)
 1cb:	00 0e                	add    %cl,(%esi)
 1cd:	57                   	push   %edi
 1ce:	01 00                	add    %eax,(%eax)
 1d0:	00 14 06             	add    %dl,(%esi,%eax,1)
 1d3:	6e                   	outsb  %ds:(%esi),(%dx)
 1d4:	00 00                	add    %al,(%eax)
 1d6:	00 4f 02             	add    %cl,0x2(%edi)
 1d9:	00 00                	add    %al,(%eax)
 1db:	13 02                	adc    (%edx),%eax
 1dd:	00 00                	add    %al,(%eax)
 1df:	0c 1f                	or     $0x1f,%al
 1e1:	00 00                	add    %al,(%eax)
 1e3:	00 0e                	add    %cl,(%esi)
 1e5:	b2 00                	mov    $0x0,%dl
 1e7:	00 00                	add    %al,(%eax)
 1e9:	17                   	pop    %ss
 1ea:	0a 5b 00             	or     0x0(%ebx),%bl
 1ed:	00 00                	add    %al,(%eax)
 1ef:	61                   	popa
 1f0:	03 00                	add    (%eax),%eax
 1f2:	00 2d 03 00 00 16    	add    %ch,0x16000003
 1f8:	5f                   	pop    %edi
 1f9:	01 00                	add    %eax,(%eax)
 1fb:	00 2a                	add    %ch,(%edx)
 1fd:	0f e0 00             	pavgb  (%eax),%mm0
 200:	00 00                	add    %al,(%eax)
 202:	0d 83 00 00 00       	or     $0x83,%eax
 207:	b9 01 00 00 0e       	mov    $0xe000001,%ecx
 20c:	87 01                	xchg   %eax,(%ecx)
 20e:	00 00                	add    %al,(%eax)
 210:	1c 0b                	sbb    $0xb,%al
 212:	5b                   	pop    %ebx
 213:	00 00                	add    %al,(%eax)
 215:	00 97 04 00 00 91    	add    %dl,-0x6efffffc(%edi)
 21b:	04 00                	add    $0x0,%al
 21d:	00 17                	add    %dl,(%edi)
 21f:	e5 07                	in     $0x7,%eax
 221:	00 00                	add    %al,(%eax)
 223:	88 84 00 00 28 00 00 	mov    %al,0x2800(%eax,%eax,1)
 22a:	00 23                	add    %ah,(%ebx)
 22c:	02 f6                	add    %dh,%dh
 22e:	07                   	pop    %es
 22f:	00 00                	add    %al,(%eax)
 231:	02 00                	add    (%eax),%al
 233:	08 00                	or     %al,(%eax)
 235:	00 03                	add    %al,(%ebx)
 237:	0a 08                	or     (%eax),%cl
 239:	00 00                	add    %al,(%eax)
 23b:	05 15 08 00 00       	add    $0x815,%eax
 240:	88 84 00 00 28 00 00 	mov    %al,0x2800(%eax,%eax,1)
 247:	00 03                	add    %al,(%ebx)
 249:	16                   	push   %ss
 24a:	08 00                	or     %al,(%eax)
 24c:	00 01                	add    %al,(%ecx)
 24e:	9b                   	fwait
 24f:	84 00                	test   %al,(%eax)
 251:	00 8a 00 00 00 00    	add    %cl,0x0(%edx)
 257:	00 00                	add    %al,(%eax)
 259:	0d b3 00 00 00       	or     $0xb3,%eax
 25e:	16                   	push   %ss
 25f:	02 00                	add    (%eax),%al
 261:	00 06                	add    %al,(%esi)
 263:	63 00                	arpl   %eax,(%eax)
 265:	2e 09 3c 00          	or     %edi,%cs:(%eax,%eax,1)
 269:	00 00                	add    %al,(%eax)
 26b:	b1 04                	mov    $0x4,%cl
 26d:	00 00                	add    %al,(%eax)
 26f:	af                   	scas   %es:(%edi),%eax
 270:	04 00                	add    $0x0,%al
 272:	00 17                	add    %dl,(%edi)
 274:	e5 07                	in     $0x7,%eax
 276:	00 00                	add    %al,(%eax)
 278:	5f                   	pop    %edi
 279:	83 00 00             	addl   $0x0,(%eax)
 27c:	18 00                	sbb    %al,(%eax)
 27e:	00 00                	add    %al,(%eax)
 280:	33 02                	xor    (%edx),%eax
 282:	f6 07 00             	testb  $0x0,(%edi)
 285:	00 02                	add    %al,(%edx)
 287:	00 08                	add    %cl,(%eax)
 289:	00 00                	add    %al,(%eax)
 28b:	03 0a                	add    (%edx),%ecx
 28d:	08 00                	or     %al,(%eax)
 28f:	00 05 15 08 00 00    	add    %al,0x815
 295:	5f                   	pop    %edi
 296:	83 00 00             	addl   $0x0,(%eax)
 299:	18 00                	sbb    %al,(%eax)
 29b:	00 00                	add    %al,(%eax)
 29d:	04 16                	add    $0x16,%al
 29f:	08 00                	or     %al,(%eax)
 2a1:	00 be 04 00 00 ba    	add    %bh,-0x45fffffc(%esi)
 2a7:	04 00                	add    $0x0,%al
 2a9:	00 01                	add    %al,(%ecx)
 2ab:	6b 83 00 00 8a 00 00 	imul   $0x0,0x8a0000(%ebx),%eax
 2b2:	00 00                	add    %al,(%eax)
 2b4:	00 00                	add    %al,(%eax)
 2b6:	0f 1c 82 00 00 68 00 	cldemote 0x680000(%edx)
 2bd:	00 00                	add    %al,(%eax)
 2bf:	94                   	xchg   %eax,%esp
 2c0:	02 00                	add    (%eax),%al
 2c2:	00 08                	add    %cl,(%eax)
 2c4:	73 74                	jae    33a <_start-0x7cc6>
 2c6:	72 00                	jb     2c8 <_start-0x7d38>
 2c8:	38 10                	cmp    %dl,(%eax)
 2ca:	e0 00                	loopne 2cc <_start-0x7d34>
 2cc:	00 00                	add    %al,(%eax)
 2ce:	01 56 06             	add    %edx,0x6(%esi)
 2d1:	6c                   	insb   (%dx),%es:(%edi)
 2d2:	65 6e                	outsb  %gs:(%esi),(%dx)
 2d4:	00 39                	add    %bh,(%ecx)
 2d6:	0b 5b 00             	or     0x0(%ebx),%ebx
 2d9:	00 00                	add    %al,(%eax)
 2db:	d3 04 00             	roll   %cl,(%eax,%eax,1)
 2de:	00 cf                	add    %cl,%bh
 2e0:	04 00                	add    $0x0,%al
 2e2:	00 09                	add    %cl,(%ecx)
 2e4:	e5 07                	in     $0x7,%eax
 2e6:	00 00                	add    %al,(%eax)
 2e8:	46                   	inc    %esi
 2e9:	82 00 00             	addb   $0x0,(%eax)
 2ec:	3e 00 00             	add    %al,%ds:(%eax)
 2ef:	00 3e                	add    %bh,(%esi)
 2f1:	09 8a 02 00 00 02    	or     %ecx,0x2000002(%edx)
 2f7:	f6 07 00             	testb  $0x0,(%edi)
 2fa:	00 02                	add    %al,(%edx)
 2fc:	00 08                	add    %cl,(%eax)
 2fe:	00 00                	add    %al,(%eax)
 300:	03 0a                	add    (%edx),%ecx
 302:	08 00                	or     %al,(%eax)
 304:	00 05 15 08 00 00    	add    %al,0x815
 30a:	46                   	inc    %esi
 30b:	82 00 00             	addb   $0x0,(%eax)
 30e:	3e 00 00             	add    %al,%ds:(%eax)
 311:	00 04 16             	add    %al,(%esi,%edx,1)
 314:	08 00                	or     %al,(%eax)
 316:	00 e5                	add    %ah,%ch
 318:	04 00                	add    $0x0,%al
 31a:	00 e3                	add    %ah,%bl
 31c:	04 00                	add    $0x0,%al
 31e:	00 01                	add    %al,(%ecx)
 320:	77 82                	ja     2a4 <_start-0x7d5c>
 322:	00 00                	add    %al,(%eax)
 324:	8a 00                	mov    (%eax),%al
 326:	00 00                	add    %al,(%eax)
 328:	00 00                	add    %al,(%eax)
 32a:	01 39                	add    %edi,(%ecx)
 32c:	82 00 00             	addb   $0x0,(%eax)
 32f:	ca 00 00             	lret   $0x0
 332:	00 00                	add    %al,(%eax)
 334:	0f c2 82 00 00 82 00 	cmpeqps 0x820000(%edx),%xmm0
 33b:	00 
 33c:	00 25 03 00 00 0a    	add    %ah,0xa000003
 342:	69 00 43 11 6e 00    	imul   $0x6e1143,(%eax),%eax
 348:	00 00                	add    %al,(%eax)
 34a:	08 73 74             	or     %dh,0x74(%ebx)
 34d:	72 00                	jb     34f <_start-0x7cb1>
 34f:	44                   	inc    %esp
 350:	12 ce                	adc    %dh,%cl
 352:	07                   	pop    %es
 353:	00 00                	add    %al,(%eax)
 355:	02 91 54 06 6c 65    	add    0x656c0654(%ecx),%dl
 35b:	6e                   	outsb  %ds:(%esi),(%dx)
 35c:	00 46 14             	add    %al,0x14(%esi)
 35f:	5b                   	pop    %ebx
 360:	00 00                	add    %al,(%eax)
 362:	00 f2                	add    %dh,%dl
 364:	04 00                	add    $0x0,%al
 366:	00 ee                	add    %ch,%dh
 368:	04 00                	add    $0x0,%al
 36a:	00 09                	add    %cl,(%ecx)
 36c:	e5 07                	in     $0x7,%eax
 36e:	00 00                	add    %al,(%eax)
 370:	fb                   	sti
 371:	82 00 00             	addb   $0x0,(%eax)
 374:	49                   	dec    %ecx
 375:	00 00                	add    %al,(%eax)
 377:	00 49 12             	add    %cl,0x12(%ecx)
 37a:	12 03                	adc    (%ebx),%al
 37c:	00 00                	add    %al,(%eax)
 37e:	02 f6                	add    %dh,%dh
 380:	07                   	pop    %es
 381:	00 00                	add    %al,(%eax)
 383:	02 00                	add    (%eax),%al
 385:	08 00                	or     %al,(%eax)
 387:	00 03                	add    %al,(%ebx)
 389:	0a 08                	or     (%eax),%cl
 38b:	00 00                	add    %al,(%eax)
 38d:	05 15 08 00 00       	add    $0x815,%eax
 392:	fb                   	sti
 393:	82 00 00             	addb   $0x0,(%eax)
 396:	49                   	dec    %ecx
 397:	00 00                	add    %al,(%eax)
 399:	00 04 16             	add    %al,(%esi,%edx,1)
 39c:	08 00                	or     %al,(%eax)
 39e:	00 0a                	add    %cl,(%edx)
 3a0:	05 00 00 02 05       	add    $0x5020000,%eax
 3a5:	00 00                	add    %al,(%eax)
 3a7:	01 37                	add    %esi,(%edi)
 3a9:	83 00 00             	addl   $0x0,(%eax)
 3ac:	8a 00                	mov    (%eax),%al
 3ae:	00 00                	add    %al,(%eax)
 3b0:	00 00                	add    %al,(%eax)
 3b2:	01 e3                	add    %esp,%ebx
 3b4:	82 00 00             	addb   $0x0,(%eax)
 3b7:	a0 00 00 00 01       	mov    0x1000000,%al
 3bc:	ee                   	out    %al,(%dx)
 3bd:	82 00 00             	addb   $0x0,(%eax)
 3c0:	ca 00 00             	lret   $0x0
 3c3:	00 00                	add    %al,(%eax)
 3c5:	0d 98 00 00 00       	or     $0x98,%eax
 3ca:	b0 03                	mov    $0x3,%al
 3cc:	00 00                	add    %al,(%eax)
 3ce:	0a 69 00             	or     0x0(%ecx),%ch
 3d1:	4e                   	dec    %esi
 3d2:	1a de                	sbb    %dh,%bl
 3d4:	07                   	pop    %es
 3d5:	00 00                	add    %al,(%eax)
 3d7:	08 73 74             	or     %dh,0x74(%ebx)
 3da:	72 00                	jb     3dc <_start-0x7c24>
 3dc:	4f                   	dec    %edi
 3dd:	12 ce                	adc    %dh,%cl
 3df:	07                   	pop    %es
 3e0:	00 00                	add    %al,(%eax)
 3e2:	02 91 54 06 6c 65    	add    0x656c0654(%ecx),%dl
 3e8:	6e                   	outsb  %ds:(%esi),(%dx)
 3e9:	00 51 14             	add    %dl,0x14(%ecx)
 3ec:	5b                   	pop    %ebx
 3ed:	00 00                	add    %al,(%eax)
 3ef:	00 41 05             	add    %al,0x5(%ecx)
 3f2:	00 00                	add    %al,(%eax)
 3f4:	3d 05 00 00 10       	cmp    $0x10000005,%eax
 3f9:	e5 07                	in     $0x7,%eax
 3fb:	00 00                	add    %al,(%eax)
 3fd:	a8 00                	test   $0x0,%al
 3ff:	00 00                	add    %al,(%eax)
 401:	54                   	push   %esp
 402:	12 9d 03 00 00 02    	adc    0x2000003(%ebp),%bl
 408:	f6 07 00             	testb  $0x0,(%edi)
 40b:	00 02                	add    %al,(%edx)
 40d:	00 08                	add    %cl,(%eax)
 40f:	00 00                	add    %al,(%eax)
 411:	0c a8                	or     $0xa8,%al
 413:	00 00                	add    %al,(%eax)
 415:	00 03                	add    %al,(%ebx)
 417:	0a 08                	or     (%eax),%cl
 419:	00 00                	add    %al,(%eax)
 41b:	11 15 08 00 00 a8    	adc    %edx,0xa8000008
 421:	00 00                	add    %al,(%eax)
 423:	00 04 16             	add    %al,(%esi,%edx,1)
 426:	08 00                	or     %al,(%eax)
 428:	00 59 05             	add    %bl,0x5(%ecx)
 42b:	00 00                	add    %al,(%eax)
 42d:	51                   	push   %ecx
 42e:	05 00 00 01 0f       	add    $0xf010000,%eax
 433:	82 00 00             	addb   $0x0,(%eax)
 436:	8a 00                	mov    (%eax),%al
 438:	00 00                	add    %al,(%eax)
 43a:	00 00                	add    %al,(%eax)
 43c:	00 01                	add    %al,(%ecx)
 43e:	bd 81 00 00 a0       	mov    $0xa0000081,%ebp
 443:	00 00                	add    %al,(%eax)
 445:	00 01                	add    %al,(%ecx)
 447:	c8 81 00 00          	enter  $0x81,$0x0
 44b:	ca 00 00             	lret   $0x0
 44e:	00 00                	add    %al,(%eax)
 450:	0f fd 80 00 00 9f 00 	paddw  0x9f0000(%eax),%mm0
 457:	00 00                	add    %al,(%eax)
 459:	91                   	xchg   %eax,%ecx
 45a:	04 00                	add    $0x0,%al
 45c:	00 0a                	add    %cl,(%edx)
 45e:	69 00 59 11 6e 00    	imul   $0x6e1159,(%eax),%eax
 464:	00 00                	add    %al,(%eax)
 466:	08 73 74             	or     %dh,0x74(%ebx)
 469:	72 00                	jb     46b <_start-0x7b95>
 46b:	5a                   	pop    %edx
 46c:	12 ce                	adc    %dh,%cl
 46e:	07                   	pop    %es
 46f:	00 00                	add    %al,(%eax)
 471:	02 91 54 06 6c 65    	add    0x656c0654(%ecx),%dl
 477:	6e                   	outsb  %ds:(%esi),(%dx)
 478:	00 5c 14 5b          	add    %bl,0x5b(%esp,%edx,1)
 47c:	00 00                	add    %al,(%eax)
 47e:	00 94 05 00 00 8c 05 	add    %dl,0x58c0000(%ebp,%eax,1)
 485:	00 00                	add    %al,(%eax)
 487:	09 e5                	or     %esp,%ebp
 489:	07                   	pop    %es
 48a:	00 00                	add    %al,(%eax)
 48c:	35 81 00 00 24       	xor    $0x24000081,%eax
 491:	00 00                	add    %al,(%eax)
 493:	00 5f 12             	add    %bl,0x12(%edi)
 496:	37                   	aaa
 497:	04 00                	add    $0x0,%al
 499:	00 02                	add    %al,(%edx)
 49b:	f6 07 00             	testb  $0x0,(%edi)
 49e:	00 02                	add    %al,(%edx)
 4a0:	00 08                	add    %cl,(%eax)
 4a2:	00 00                	add    %al,(%eax)
 4a4:	03 0a                	add    (%edx),%ecx
 4a6:	08 00                	or     %al,(%eax)
 4a8:	00 05 15 08 00 00    	add    %al,0x815
 4ae:	35 81 00 00 24       	xor    $0x24000081,%eax
 4b3:	00 00                	add    %al,(%eax)
 4b5:	00 04 16             	add    %al,(%esi,%edx,1)
 4b8:	08 00                	or     %al,(%eax)
 4ba:	00 b6 05 00 00 b2    	add    %dh,-0x4dfffffb(%esi)
 4c0:	05 00 00 01 3f       	add    $0x3f010000,%eax
 4c5:	81 00 00 8a 00 00    	addl   $0x8a00,(%eax)
 4cb:	00 01                	add    %al,(%ecx)
 4cd:	51                   	push   %ecx
 4ce:	81 00 00 8a 00 00    	addl   $0x8a00,(%eax)
 4d4:	00 00                	add    %al,(%eax)
 4d6:	00 09                	add    %cl,(%ecx)
 4d8:	e5 07                	in     $0x7,%eax
 4da:	00 00                	add    %al,(%eax)
 4dc:	59                   	pop    %ecx
 4dd:	81 00 00 43 00 00    	addl   $0x4300,(%eax)
 4e3:	00 61 12             	add    %ah,0x12(%ecx)
 4e6:	7e 04                	jle    4ec <_start-0x7b14>
 4e8:	00 00                	add    %al,(%eax)
 4ea:	02 f6                	add    %dh,%dh
 4ec:	07                   	pop    %es
 4ed:	00 00                	add    %al,(%eax)
 4ef:	02 00                	add    (%eax),%al
 4f1:	08 00                	or     %al,(%eax)
 4f3:	00 03                	add    %al,(%ebx)
 4f5:	0a 08                	or     (%eax),%cl
 4f7:	00 00                	add    %al,(%eax)
 4f9:	05 15 08 00 00       	add    $0x815,%eax
 4fe:	59                   	pop    %ecx
 4ff:	81 00 00 43 00 00    	addl   $0x4300,(%eax)
 505:	00 04 16             	add    %al,(%esi,%edx,1)
 508:	08 00                	or     %al,(%eax)
 50a:	00 cf                	add    %cl,%bh
 50c:	05 00 00 c7 05       	add    $0x5c70000,%eax
 511:	00 00                	add    %al,(%eax)
 513:	01 8f 81 00 00 8a    	add    %ecx,-0x75ffff7f(%edi)
 519:	00 00                	add    %al,(%eax)
 51b:	00 00                	add    %al,(%eax)
 51d:	00 01                	add    %al,(%ecx)
 51f:	1e                   	push   %ds
 520:	81 00 00 a0 00 00    	addl   $0xa000,(%eax)
 526:	00 01                	add    %al,(%ecx)
 528:	29 81 00 00 ca 00    	sub    %eax,0xca0000(%ecx)
 52e:	00 00                	add    %al,(%eax)
 530:	00 0d 51 00 00 00    	add    %cl,0x51
 536:	6c                   	insb   (%dx),%es:(%edi)
 537:	05 00 00 0a 69       	add    $0x690a0000,%eax
 53c:	00 66 11             	add    %ah,0x11(%esi)
 53f:	6e                   	outsb  %ds:(%esi),(%dx)
 540:	00 00                	add    %al,(%eax)
 542:	00 08                	add    %cl,(%eax)
 544:	73 74                	jae    5ba <_start-0x7a46>
 546:	72 00                	jb     548 <_start-0x7ab8>
 548:	67 12 ce             	addr16 adc %dh,%cl
 54b:	07                   	pop    %es
 54c:	00 00                	add    %al,(%eax)
 54e:	02 91 54 06 6c 65    	add    0x656c0654(%ecx),%dl
 554:	6e                   	outsb  %ds:(%esi),(%dx)
 555:	00 69 14             	add    %ch,0x14(%ecx)
 558:	5b                   	pop    %ebx
 559:	00 00                	add    %al,(%eax)
 55b:	00 0a                	add    %cl,(%edx)
 55d:	06                   	push   %es
 55e:	00 00                	add    %al,(%eax)
 560:	02 06                	add    (%esi),%al
 562:	00 00                	add    %al,(%eax)
 564:	09 e5                	or     %esp,%ebp
 566:	07                   	pop    %es
 567:	00 00                	add    %al,(%eax)
 569:	c4 83 00 00 2c 00    	les    0x2c0000(%ebx),%eax
 56f:	00 00                	add    %al,(%eax)
 571:	6c                   	insb   (%dx),%es:(%edi)
 572:	12 14 05 00 00 02 f6 	adc    -0x9fe0000(,%eax,1),%dl
 579:	07                   	pop    %es
 57a:	00 00                	add    %al,(%eax)
 57c:	02 00                	add    (%eax),%al
 57e:	08 00                	or     %al,(%eax)
 580:	00 03                	add    %al,(%ebx)
 582:	0a 08                	or     (%eax),%cl
 584:	00 00                	add    %al,(%eax)
 586:	05 15 08 00 00       	add    $0x815,%eax
 58b:	c4 83 00 00 2c 00    	les    0x2c0000(%ebx),%eax
 591:	00 00                	add    %al,(%eax)
 593:	04 16                	add    $0x16,%al
 595:	08 00                	or     %al,(%eax)
 597:	00 2c 06             	add    %ch,(%esi,%eax,1)
 59a:	00 00                	add    %al,(%eax)
 59c:	28 06                	sub    %al,(%esi)
 59e:	00 00                	add    %al,(%eax)
 5a0:	01 ce                	add    %ecx,%esi
 5a2:	83 00 00             	addl   $0x0,(%eax)
 5a5:	8a 00                	mov    (%eax),%al
 5a7:	00 00                	add    %al,(%eax)
 5a9:	01 e4                	add    %esp,%esp
 5ab:	83 00 00             	addl   $0x0,(%eax)
 5ae:	8a 00                	mov    (%eax),%al
 5b0:	00 00                	add    %al,(%eax)
 5b2:	00 00                	add    %al,(%eax)
 5b4:	10 e5                	adc    %ah,%ch
 5b6:	07                   	pop    %es
 5b7:	00 00                	add    %al,(%eax)
 5b9:	64 00 00             	add    %al,%fs:(%eax)
 5bc:	00 6e 12             	add    %ch,0x12(%esi)
 5bf:	59                   	pop    %ecx
 5c0:	05 00 00 02 f6       	add    $0xf6020000,%eax
 5c5:	07                   	pop    %es
 5c6:	00 00                	add    %al,(%eax)
 5c8:	02 00                	add    (%eax),%al
 5ca:	08 00                	or     %al,(%eax)
 5cc:	00 0c 64             	add    %cl,(%esp,%eiz,2)
 5cf:	00 00                	add    %al,(%eax)
 5d1:	00 03                	add    %al,(%ebx)
 5d3:	0a 08                	or     (%eax),%cl
 5d5:	00 00                	add    %al,(%eax)
 5d7:	11 15 08 00 00 64    	adc    %edx,0x64000008
 5dd:	00 00                	add    %al,(%eax)
 5df:	00 04 16             	add    %al,(%esi,%edx,1)
 5e2:	08 00                	or     %al,(%eax)
 5e4:	00 45 06             	add    %al,0x6(%ebp)
 5e7:	00 00                	add    %al,(%eax)
 5e9:	3d 06 00 00 01       	cmp    $0x1000006,%eax
 5ee:	27                   	daa
 5ef:	84 00                	test   %al,(%eax)
 5f1:	00 8a 00 00 00 00    	add    %cl,0x0(%edx)
 5f7:	00 00                	add    %al,(%eax)
 5f9:	01 a9 83 00 00 a0    	add    %ebp,-0x5fffff7d(%ecx)
 5ff:	00 00                	add    %al,(%eax)
 601:	00 01                	add    %al,(%ecx)
 603:	b4 83                	mov    $0x83,%ah
 605:	00 00                	add    %al,(%eax)
 607:	ca 00 00             	lret   $0x0
 60a:	00 00                	add    %al,(%eax)
 60c:	0d be 00 00 00       	or     $0xbe,%eax
 611:	49                   	dec    %ecx
 612:	06                   	push   %es
 613:	00 00                	add    %al,(%eax)
 615:	0a 69 00             	or     0x0(%ecx),%ch
 618:	75 16                	jne    630 <_start-0x79d0>
 61a:	54                   	push   %esp
 61b:	00 00                	add    %al,(%eax)
 61d:	00 08                	add    %cl,(%eax)
 61f:	73 74                	jae    695 <_start-0x796b>
 621:	72 00                	jb     623 <_start-0x79dd>
 623:	76 16                	jbe    63b <_start-0x79c5>
 625:	ce                   	into
 626:	07                   	pop    %es
 627:	00 00                	add    %al,(%eax)
 629:	02 91 54 06 6c 65    	add    0x656c0654(%ecx),%dl
 62f:	6e                   	outsb  %ds:(%esi),(%dx)
 630:	00 78 18             	add    %bh,0x18(%eax)
 633:	5b                   	pop    %ebx
 634:	00 00                	add    %al,(%eax)
 636:	00 7c 06 00          	add    %bh,0x0(%esi,%eax,1)
 63a:	00 78 06             	add    %bh,0x6(%eax)
 63d:	00 00                	add    %al,(%eax)
 63f:	09 e5                	or     %esp,%ebp
 641:	07                   	pop    %es
 642:	00 00                	add    %al,(%eax)
 644:	5f                   	pop    %edi
 645:	85 00                	test   %eax,(%eax)
 647:	00 2c 00             	add    %ch,(%eax,%eax,1)
 64a:	00 00                	add    %al,(%eax)
 64c:	7b 16                	jnp    664 <_start-0x799c>
 64e:	ef                   	out    %eax,(%dx)
 64f:	05 00 00 02 f6       	add    $0xf6020000,%eax
 654:	07                   	pop    %es
 655:	00 00                	add    %al,(%eax)
 657:	02 00                	add    (%eax),%al
 659:	08 00                	or     %al,(%eax)
 65b:	00 03                	add    %al,(%ebx)
 65d:	0a 08                	or     (%eax),%cl
 65f:	00 00                	add    %al,(%eax)
 661:	05 15 08 00 00       	add    $0x815,%eax
 666:	5f                   	pop    %edi
 667:	85 00                	test   %eax,(%eax)
 669:	00 2c 00             	add    %ch,(%eax,%eax,1)
 66c:	00 00                	add    %al,(%eax)
 66e:	04 16                	add    $0x16,%al
 670:	08 00                	or     %al,(%eax)
 672:	00 90 06 00 00 8c    	add    %dl,-0x73fffffa(%eax)
 678:	06                   	push   %es
 679:	00 00                	add    %al,(%eax)
 67b:	01 69 85             	add    %ebp,-0x7b(%ecx)
 67e:	00 00                	add    %al,(%eax)
 680:	8a 00                	mov    (%eax),%al
 682:	00 00                	add    %al,(%eax)
 684:	01 7f 85             	add    %edi,-0x7b(%edi)
 687:	00 00                	add    %al,(%eax)
 689:	8a 00                	mov    (%eax),%al
 68b:	00 00                	add    %al,(%eax)
 68d:	00 00                	add    %al,(%eax)
 68f:	09 e5                	or     %esp,%ebp
 691:	07                   	pop    %es
 692:	00 00                	add    %al,(%eax)
 694:	8b 85 00 00 4d 00    	mov    0x4d0000(%ebp),%eax
 69a:	00 00                	add    %al,(%eax)
 69c:	7d 16                	jge    6b4 <_start-0x794c>
 69e:	36 06                	ss push %es
 6a0:	00 00                	add    %al,(%eax)
 6a2:	02 f6                	add    %dh,%dh
 6a4:	07                   	pop    %es
 6a5:	00 00                	add    %al,(%eax)
 6a7:	02 00                	add    (%eax),%al
 6a9:	08 00                	or     %al,(%eax)
 6ab:	00 03                	add    %al,(%ebx)
 6ad:	0a 08                	or     (%eax),%cl
 6af:	00 00                	add    %al,(%eax)
 6b1:	05 15 08 00 00       	add    $0x815,%eax
 6b6:	8b 85 00 00 4d 00    	mov    0x4d0000(%ebp),%eax
 6bc:	00 00                	add    %al,(%eax)
 6be:	04 16                	add    $0x16,%al
 6c0:	08 00                	or     %al,(%eax)
 6c2:	00 a9 06 00 00 a1    	add    %ch,-0x5efffffa(%ecx)
 6c8:	06                   	push   %es
 6c9:	00 00                	add    %al,(%eax)
 6cb:	01 c3                	add    %eax,%ebx
 6cd:	85 00                	test   %eax,(%eax)
 6cf:	00 8a 00 00 00 00    	add    %cl,0x0(%edx)
 6d5:	00 01                	add    %al,(%ecx)
 6d7:	49                   	dec    %ecx
 6d8:	85 00                	test   %eax,(%eax)
 6da:	00 a0 00 00 00 01    	add    %ah,0x1000000(%eax)
 6e0:	51                   	push   %ecx
 6e1:	85 00                	test   %eax,(%eax)
 6e3:	00 ca                	add    %cl,%dl
 6e5:	00 00                	add    %al,(%eax)
 6e7:	00 00                	add    %al,(%eax)
 6e9:	0f ec 85 00 00 74 00 	paddsb 0x740000(%ebp),%mm0
 6f0:	00 00                	add    %al,(%eax)
 6f2:	da 06                	fiaddl (%esi)
 6f4:	00 00                	add    %al,(%eax)
 6f6:	0a 69 00             	or     0x0(%ecx),%ch
 6f9:	82 1f 67             	sbbb   $0x67,(%edi)
 6fc:	00 00                	add    %al,(%eax)
 6fe:	00 08                	add    %cl,(%eax)
 700:	73 74                	jae    776 <_start-0x788a>
 702:	72 00                	jb     704 <_start-0x78fc>
 704:	83 16 ce             	adcl   $0xffffffce,(%esi)
 707:	07                   	pop    %es
 708:	00 00                	add    %al,(%eax)
 70a:	02 91 54 06 6c 65    	add    0x656c0654(%ecx),%dl
 710:	6e                   	outsb  %ds:(%esi),(%dx)
 711:	00 85 18 5b 00 00    	add    %al,0x5b18(%ebp)
 717:	00 e0                	add    %ah,%al
 719:	06                   	push   %es
 71a:	00 00                	add    %al,(%eax)
 71c:	dc 06                	faddl  (%esi)
 71e:	00 00                	add    %al,(%eax)
 720:	09 e5                	or     %esp,%ebp
 722:	07                   	pop    %es
 723:	00 00                	add    %al,(%eax)
 725:	20 86 00 00 40 00    	and    %al,0x400000(%esi)
 72b:	00 00                	add    %al,(%eax)
 72d:	88 16                	mov    %dl,(%esi)
 72f:	c7 06 00 00 02 f6    	movl   $0xf6020000,(%esi)
 735:	07                   	pop    %es
 736:	00 00                	add    %al,(%eax)
 738:	02 00                	add    (%eax),%al
 73a:	08 00                	or     %al,(%eax)
 73c:	00 03                	add    %al,(%ebx)
 73e:	0a 08                	or     (%eax),%cl
 740:	00 00                	add    %al,(%eax)
 742:	05 15 08 00 00       	add    $0x815,%eax
 747:	20 86 00 00 40 00    	and    %al,0x400000(%esi)
 74d:	00 00                	add    %al,(%eax)
 74f:	04 16                	add    $0x16,%al
 751:	08 00                	or     %al,(%eax)
 753:	00 f8                	add    %bh,%al
 755:	06                   	push   %es
 756:	00 00                	add    %al,(%eax)
 758:	f0 06                	lock push %es
 75a:	00 00                	add    %al,(%eax)
 75c:	01 53 86             	add    %edx,-0x7a(%ebx)
 75f:	00 00                	add    %al,(%eax)
 761:	8a 00                	mov    (%eax),%al
 763:	00 00                	add    %al,(%eax)
 765:	00 00                	add    %al,(%eax)
 767:	01 0d 86 00 00 a0    	add    %ecx,0xa0000086
 76d:	00 00                	add    %al,(%eax)
 76f:	00 01                	add    %al,(%ecx)
 771:	15 86 00 00 ca       	adc    $0xca000086,%eax
 776:	00 00                	add    %al,(%eax)
 778:	00 00                	add    %al,(%eax)
 77a:	0d c9 00 00 00       	or     $0xc9,%eax
 77f:	65 07                	gs pop %es
 781:	00 00                	add    %al,(%eax)
 783:	0a 69 00             	or     0x0(%ecx),%ch
 786:	8d 16                	lea    (%esi),%edx
 788:	54                   	push   %esp
 789:	00 00                	add    %al,(%eax)
 78b:	00 08                	add    %cl,(%eax)
 78d:	73 74                	jae    803 <_start-0x77fd>
 78f:	72 00                	jb     791 <_start-0x786f>
 791:	8e 16                	mov    (%esi),%ss
 793:	ce                   	into
 794:	07                   	pop    %es
 795:	00 00                	add    %al,(%eax)
 797:	02 91 54 06 6c 65    	add    0x656c0654(%ecx),%dl
 79d:	6e                   	outsb  %ds:(%esi),(%dx)
 79e:	00 90 18 5b 00 00    	add    %dl,0x5b18(%eax)
 7a4:	00 2f                	add    %ch,(%edi)
 7a6:	07                   	pop    %es
 7a7:	00 00                	add    %al,(%eax)
 7a9:	2b 07                	sub    (%edi),%eax
 7ab:	00 00                	add    %al,(%eax)
 7ad:	10 e5                	adc    %ah,%ch
 7af:	07                   	pop    %es
 7b0:	00 00                	add    %al,(%eax)
 7b2:	d4 00                	aam    $0x0
 7b4:	00 00                	add    %al,(%eax)
 7b6:	93                   	xchg   %eax,%ebx
 7b7:	16                   	push   %ss
 7b8:	52                   	push   %edx
 7b9:	07                   	pop    %es
 7ba:	00 00                	add    %al,(%eax)
 7bc:	02 f6                	add    %dh,%dh
 7be:	07                   	pop    %es
 7bf:	00 00                	add    %al,(%eax)
 7c1:	02 00                	add    (%eax),%al
 7c3:	08 00                	or     %al,(%eax)
 7c5:	00 0c d4             	add    %cl,(%esp,%edx,8)
 7c8:	00 00                	add    %al,(%eax)
 7ca:	00 03                	add    %al,(%ebx)
 7cc:	0a 08                	or     (%eax),%cl
 7ce:	00 00                	add    %al,(%eax)
 7d0:	11 15 08 00 00 d4    	adc    %edx,0xd4000008
 7d6:	00 00                	add    %al,(%eax)
 7d8:	00 04 16             	add    %al,(%esi,%edx,1)
 7db:	08 00                	or     %al,(%eax)
 7dd:	00 47 07             	add    %al,0x7(%edi)
 7e0:	00 00                	add    %al,(%eax)
 7e2:	3f                   	aas
 7e3:	07                   	pop    %es
 7e4:	00 00                	add    %al,(%eax)
 7e6:	01 e3                	add    %esp,%ebx
 7e8:	86 00                	xchg   %al,(%eax)
 7ea:	00 8a 00 00 00 00    	add    %cl,0x0(%edx)
 7f0:	00 00                	add    %al,(%eax)
 7f2:	01 9d 86 00 00 a0    	add    %ebx,-0x5fffff7a(%ebp)
 7f8:	00 00                	add    %al,(%eax)
 7fa:	00 01                	add    %al,(%ecx)
 7fc:	a5                   	movsl  %ds:(%esi),%es:(%edi)
 7fd:	86 00                	xchg   %al,(%eax)
 7ff:	00 ca                	add    %cl,%dl
 801:	00 00                	add    %al,(%eax)
 803:	00 00                	add    %al,(%eax)
 805:	0c 6f                	or     $0x6f,%al
 807:	00 00                	add    %al,(%eax)
 809:	00 06                	add    %al,(%esi)
 80b:	6c                   	insb   (%dx),%es:(%edi)
 80c:	65 6e                	outsb  %gs:(%esi),(%dx)
 80e:	00 99 0b 5b 00 00    	add    %bl,0x5b0b(%ecx)
 814:	00 82 07 00 00 7a    	add    %al,0x7a000007(%edx)
 81a:	07                   	pop    %es
 81b:	00 00                	add    %al,(%eax)
 81d:	10 e5                	adc    %ah,%ch
 81f:	07                   	pop    %es
 820:	00 00                	add    %al,(%eax)
 822:	79 00                	jns    824 <_start-0x77dc>
 824:	00 00                	add    %al,(%eax)
 826:	9e                   	sahf
 827:	09 c2                	or     %eax,%edx
 829:	07                   	pop    %es
 82a:	00 00                	add    %al,(%eax)
 82c:	02 f6                	add    %dh,%dh
 82e:	07                   	pop    %es
 82f:	00 00                	add    %al,(%eax)
 831:	02 00                	add    (%eax),%al
 833:	08 00                	or     %al,(%eax)
 835:	00 0c 79             	add    %cl,(%ecx,%edi,2)
 838:	00 00                	add    %al,(%eax)
 83a:	00 03                	add    %al,(%ebx)
 83c:	0a 08                	or     (%eax),%cl
 83e:	00 00                	add    %al,(%eax)
 840:	11 15 08 00 00 79    	adc    %edx,0x79000008
 846:	00 00                	add    %al,(%eax)
 848:	00 04 16             	add    %al,(%esi,%edx,1)
 84b:	08 00                	or     %al,(%eax)
 84d:	00 a4 07 00 00 a0 07 	add    %ah,0x7a00000(%edi,%eax,1)
 854:	00 00                	add    %al,(%eax)
 856:	01 e7                	add    %esp,%edi
 858:	80 00 00             	addb   $0x0,(%eax)
 85b:	8a 00                	mov    (%eax),%al
 85d:	00 00                	add    %al,(%eax)
 85f:	00 00                	add    %al,(%eax)
 861:	00 01                	add    %al,(%ecx)
 863:	ac                   	lods   %ds:(%esi),%al
 864:	80 00 00             	addb   $0x0,(%eax)
 867:	ca 00 00             	lret   $0x0
 86a:	00 00                	add    %al,(%eax)
 86c:	00 00                	add    %al,(%eax)
 86e:	20 3c 00             	and    %bh,(%eax,%eax,1)
 871:	00 00                	add    %al,(%eax)
 873:	de 07                	fiadds (%edi)
 875:	00 00                	add    %al,(%eax)
 877:	21 67 00             	and    %esp,0x0(%edi)
 87a:	00 00                	add    %al,(%eax)
 87c:	0b 00                	or     (%eax),%eax
 87e:	07                   	pop    %es
 87f:	04 07                	add    $0x7,%al
 881:	e7 00                	out    %eax,$0x0
 883:	00 00                	add    %al,(%eax)
 885:	22 00                	and    (%eax),%al
 887:	01 00                	add    %eax,(%eax)
 889:	00 01                	add    %al,(%ecx)
 88b:	08 0d 21 08 00 00    	or     %cl,0x821
 891:	01 21                	add    %esp,(%ecx)
 893:	08 00                	or     %al,(%eax)
 895:	00 18                	add    %bl,(%eax)
 897:	f4                   	hlt
 898:	00 00                	add    %al,(%eax)
 89a:	00 1f                	add    %bl,(%edi)
 89c:	e0 00                	loopne 89e <_start-0x7762>
 89e:	00 00                	add    %al,(%eax)
 8a0:	18 f9                	sbb    %bh,%cl
 8a2:	00 00                	add    %al,(%eax)
 8a4:	00 2c 5b             	add    %ch,(%ebx,%ebx,2)
 8a7:	00 00                	add    %al,(%eax)
 8a9:	00 16                	add    %dl,(%esi)
 8ab:	cb                   	lret
 8ac:	00 00                	add    %al,(%eax)
 8ae:	00 09                	add    %cl,(%ecx)
 8b0:	17                   	pop    %ss
 8b1:	28 08                	sub    %cl,(%eax)
 8b3:	00 00                	add    %al,(%eax)
 8b5:	23 0a                	and    (%edx),%ecx
 8b7:	69 00 0a 0e 5b 00    	imul   $0x5b0e0a,(%eax),%eax
 8bd:	00 00                	add    %al,(%eax)
 8bf:	00 00                	add    %al,(%eax)
 8c1:	07                   	pop    %es
 8c2:	01 02                	add    %eax,(%edx)
 8c4:	6f                   	outsl  %ds:(%esi),(%dx)
 8c5:	01 00                	add    %eax,(%eax)
 8c7:	00 14 34             	add    %dl,(%esp,%esi,1)
 8ca:	08 00                	or     %al,(%eax)
 8cc:	00 07                	add    %al,(%edi)
 8ce:	01 08                	add    %ecx,(%eax)
 8d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 8d1:	00 00                	add    %al,(%eax)
 8d3:	00 15 2d 08 00 00    	add    %dl,0x82d
 8d9:	00 53 00             	add    %dl,0x0(%ebx)
 8dc:	00 00                	add    %al,(%eax)
 8de:	05 00 01 04 6e       	add    $0x6e040100,%eax
 8e3:	02 00                	add    (%eax),%al
 8e5:	00 01                	add    %al,(%ecx)
 8e7:	06                   	push   %es
 8e8:	01 00                	add    %eax,(%eax)
 8ea:	00 1d fd 00 00 00    	add    %bl,0xfd
 8f0:	73 00                	jae    8f2 <_start-0x770e>
 8f2:	00 00                	add    %al,(%eax)
 8f4:	00 87 00 00 08 00    	add    %al,0x80000(%edi)
 8fa:	00 00                	add    %al,(%eax)
 8fc:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 8fd:	07                   	pop    %es
 8fe:	00 00                	add    %al,(%eax)
 900:	02 95 00 00 00 01    	add    0x1000000(%ebp),%dl
 906:	07                   	pop    %es
 907:	05 4f 00 00 00       	add    $0x4f,%eax
 90c:	00 87 00 00 08 00    	add    %al,0x80000(%edi)
 912:	00 00                	add    %al,(%eax)
 914:	01 9c 4f 00 00 00 03 	add    %ebx,0x3000000(%edi,%ecx,2)
 91b:	69 63 00 01 07 11 4f 	imul   $0x4f110701,0x0(%ebx),%esp
 922:	00 00                	add    %al,(%eax)
 924:	00 02                	add    %al,(%edx)
 926:	91                   	xchg   %eax,%ecx
 927:	00 00                	add    %al,(%eax)
 929:	04 04                	add    $0x4,%al
 92b:	05 69 6e 74 00       	add    $0x746e69,%eax
 930:	00 40 01             	add    %al,0x1(%eax)
 933:	00 00                	add    %al,(%eax)
 935:	05 00 01 04 bb       	add    $0xbb040100,%eax
 93a:	02 00                	add    (%eax),%al
 93c:	00 06                	add    %al,(%esi)
 93e:	06                   	push   %es
 93f:	01 00                	add    %eax,(%eax)
 941:	00 1d 0d 01 00 00    	add    %bl,0x10d
 947:	73 00                	jae    949 <_start-0x76b7>
 949:	00 00                	add    %al,(%eax)
 94b:	40                   	inc    %eax
 94c:	87 00                	xchg   %eax,(%eax)
 94e:	00 36                	add    %dh,(%esi)
 950:	01 00                	add    %eax,(%eax)
 952:	00 fc                	add    %bh,%ah
 954:	07                   	pop    %es
 955:	00 00                	add    %al,(%eax)
 957:	02 04 07             	add    (%edi,%eax,1),%al
 95a:	e7 00                	out    %eax,$0x0
 95c:	00 00                	add    %al,(%eax)
 95e:	07                   	pop    %es
 95f:	a9 01 00 00 01       	test   $0x1000001,%eax
 964:	03 07                	add    (%edi),%eax
 966:	21 01                	and    %eax,(%ecx)
 968:	00 00                	add    %al,(%eax)
 96a:	40                   	inc    %eax
 96b:	87 00                	xchg   %eax,(%eax)
 96d:	00 36                	add    %dh,(%esi)
 96f:	01 00                	add    %eax,(%eax)
 971:	00 01                	add    %al,(%ecx)
 973:	9c                   	pushf
 974:	21 01                	and    %eax,(%ecx)
 976:	00 00                	add    %al,(%eax)
 978:	03 b2 01 00 00 11    	add    0x11000001(%edx),%esi
 97e:	2e 01 00             	add    %eax,%cs:(%eax)
 981:	00 c8                	add    %cl,%al
 983:	07                   	pop    %es
 984:	00 00                	add    %al,(%eax)
 986:	c0 07 00             	rolb   $0x0,(%edi)
 989:	00 03                	add    %al,(%ebx)
 98b:	c3                   	ret
 98c:	01 00                	add    %eax,(%eax)
 98e:	00 1e                	add    %bl,(%esi)
 990:	21 01                	and    %eax,(%ecx)
 992:	00 00                	add    %al,(%eax)
 994:	ec                   	in     (%dx),%al
 995:	07                   	pop    %es
 996:	00 00                	add    %al,(%eax)
 998:	e6 07                	out    %al,$0x7
 99a:	00 00                	add    %al,(%eax)
 99c:	04 da                	add    $0xda,%al
 99e:	01 00                	add    %eax,(%eax)
 9a0:	00 2a                	add    %ch,(%edx)
 9a2:	35 01 00 00 02       	xor    $0x2000001,%eax
 9a7:	91                   	xchg   %eax,%ecx
 9a8:	08 04 e4             	or     %al,(%esp,%eiz,8)
 9ab:	01 00                	add    %eax,(%eax)
 9ad:	00 34 35 01 00 00 02 	add    %dh,0x2000001(,%esi,1)
 9b4:	91                   	xchg   %eax,%ecx
 9b5:	0c 05                	or     $0x5,%al
 9b7:	70 74                	jo     a2d <_start-0x75d3>
 9b9:	72 00                	jb     9bb <_start-0x7645>
 9bb:	09 21                	or     %esp,(%ecx)
 9bd:	01 00                	add    %eax,(%eax)
 9bf:	00 15 08 00 00 03    	add    %dl,0x3000008
 9c5:	08 00                	or     %al,(%eax)
 9c7:	00 01                	add    %al,(%ecx)
 9c9:	b8 01 00 00 0a       	mov    $0xa000001,%eax
 9ce:	09 35 01 00 00 5e    	or     %esi,0x5e000001
 9d4:	08 00                	or     %al,(%eax)
 9d6:	00 54 08 00          	add    %dl,0x0(%eax,%ecx,1)
 9da:	00 01                	add    %al,(%ecx)
 9dc:	ae                   	scas   %es:(%edi),%al
 9dd:	01 00                	add    %eax,(%eax)
 9df:	00 18                	add    %bl,(%eax)
 9e1:	13 3c 01             	adc    (%ecx,%eax,1),%edi
 9e4:	00 00                	add    %al,(%eax)
 9e6:	8c 08                	mov    %cs,(%eax)
 9e8:	00 00                	add    %al,(%eax)
 9ea:	84 08                	test   %cl,(%eax)
 9ec:	00 00                	add    %al,(%eax)
 9ee:	01 d4                	add    %edx,%esp
 9f0:	01 00                	add    %eax,(%eax)
 9f2:	00 28                	add    %ch,(%eax)
 9f4:	0b 21                	or     (%ecx),%esp
 9f6:	01 00                	add    %eax,(%eax)
 9f8:	00 b8 08 00 00 b4    	add    %bh,-0x4bfffff8(%eax)
 9fe:	08 00                	or     %al,(%eax)
 a00:	00 05 65 6e 64 00    	add    %al,0x646e65
 a06:	29 21                	sub    %esp,(%ecx)
 a08:	01 00                	add    %eax,(%eax)
 a0a:	00 cf                	add    %cl,%bh
 a0c:	08 00                	or     %al,(%eax)
 a0e:	00 c7                	add    %al,%bh
 a10:	08 00                	or     %al,(%eax)
 a12:	00 08                	add    %cl,(%eax)
 a14:	c0 87 00 00 1f 00 00 	rolb   $0x0,0x1f0000(%edi)
 a1b:	00 03                	add    %al,(%ebx)
 a1d:	01 00                	add    %eax,(%eax)
 a1f:	00 01                	add    %al,(%ecx)
 a21:	ca 01 00             	lret   $0x1
 a24:	00 1c 0d 35 01 00 00 	add    %bl,0x135(,%ecx,1)
 a2b:	f6 08 00             	testb  $0x0,(%eax)
 a2e:	00 f0                	add    %dh,%al
 a30:	08 00                	or     %al,(%eax)
 a32:	00 00                	add    %al,(%eax)
 a34:	09 20                	or     %esp,(%eax)
 a36:	88 00                	mov    %al,(%eax)
 a38:	00 12                	add    %dl,(%edx)
 a3a:	00 00                	add    %al,(%eax)
 a3c:	00 01                	add    %al,(%ecx)
 a3e:	df 01                	filds  (%ecx)
 a40:	00 00                	add    %al,(%eax)
 a42:	2b 0e                	sub    (%esi),%ecx
 a44:	27                   	daa
 a45:	01 00                	add    %eax,(%eax)
 a47:	00 19                	add    %bl,(%ecx)
 a49:	09 00                	or     %eax,(%eax)
 a4b:	00 17                	add    %dl,(%edi)
 a4d:	09 00                	or     %eax,(%eax)
 a4f:	00 00                	add    %al,(%eax)
 a51:	00 0a                	add    %cl,(%edx)
 a53:	04 27                	add    $0x27,%al
 a55:	01 00                	add    %eax,(%eax)
 a57:	00 02                	add    %al,(%edx)
 a59:	01 06                	add    %eax,(%esi)
 a5b:	ad                   	lods   %ds:(%esi),%eax
 a5c:	00 00                	add    %al,(%eax)
 a5e:	00 02                	add    %al,(%edx)
 a60:	04 05                	add    $0x5,%al
 a62:	8c 00                	mov    %es,(%eax)
 a64:	00 00                	add    %al,(%eax)
 a66:	0b 04 05 69 6e 74 00 	or     0x746e69(,%eax,1),%eax
 a6d:	02 04 07             	add    (%edi,%eax,1),%al
 a70:	e2 00                	loop   a72 <_start-0x758e>
 a72:	00 00                	add    %al,(%eax)
 a74:	00 ae 00 00 00 05    	add    %ch,0x5000000(%esi)
 a7a:	00 01                	add    %al,(%ecx)
 a7c:	04 73                	add    $0x73,%al
 a7e:	03 00                	add    (%eax),%eax
 a80:	00 02                	add    %al,(%edx)
 a82:	06                   	push   %es
 a83:	01 00                	add    %eax,(%eax)
 a85:	00 1d 22 01 00 00    	add    %bl,0x122
 a8b:	73 00                	jae    a8d <_start-0x7573>
 a8d:	00 00                	add    %al,(%eax)
 a8f:	80 88 00 00 1b 00 00 	orb    $0x0,0x1b0000(%eax)
 a96:	00 66 09             	add    %ah,0x9(%esi)
 a99:	00 00                	add    %al,(%eax)
 a9b:	01 04 05 8c 00 00 00 	add    %eax,0x8c(,%eax,1)
 aa2:	03 9d 00 00 00 02    	add    0x2000000(%ebp),%ebx
 aa8:	d6                   	(bad)
 aa9:	17                   	pop    %ss
 aaa:	39 00                	cmp    %eax,(%eax)
 aac:	00 00                	add    %al,(%eax)
 aae:	01 04 07             	add    %eax,(%edi,%eax,1)
 ab1:	e2 00                	loop   ab3 <_start-0x754d>
 ab3:	00 00                	add    %al,(%eax)
 ab5:	04 04                	add    $0x4,%al
 ab7:	05 69 6e 74 00       	add    $0x746e69,%eax
 abc:	01 08                	add    %ecx,(%eax)
 abe:	05 87 00 00 00       	add    $0x87,%eax
 ac3:	01 0c 04             	add    %ecx,(%esp,%eax,1)
 ac6:	9d                   	popf
 ac7:	01 00                	add    %eax,(%eax)
 ac9:	00 01                	add    %al,(%ecx)
 acb:	10 04 d8             	adc    %al,(%eax,%ebx,8)
 ace:	00 00                	add    %al,(%eax)
 ad0:	00 05 80 01 00 00    	add    %al,0x180
 ad6:	01 03                	add    %eax,(%ebx)
 ad8:	08 2d 00 00 00 80    	or     %ch,0x80000000
 ade:	88 00                	mov    %al,(%eax)
 ae0:	00 1b                	add    %bl,(%ebx)
 ae2:	00 00                	add    %al,(%eax)
 ae4:	00 01                	add    %al,(%ecx)
 ae6:	9c                   	pushf
 ae7:	9f                   	lahf
 ae8:	00 00                	add    %al,(%eax)
 aea:	00 06                	add    %al,(%esi)
 aec:	73 74                	jae    b62 <_start-0x749e>
 aee:	72 00                	jb     af0 <_start-0x7510>
 af0:	01 03                	add    %eax,(%ebx)
 af2:	1b 9f 00 00 00 31    	sbb    0x31000000(%edi),%ebx
 af8:	09 00                	or     %eax,(%eax)
 afa:	00 2d 09 00 00 07    	add    %ch,0x7000009
 b00:	6c                   	insb   (%dx),%es:(%edi)
 b01:	65 6e                	outsb  %gs:(%esi),(%dx)
 b03:	00 01                	add    %al,(%ecx)
 b05:	04 09                	add    $0x9,%al
 b07:	2d 00 00 00 41       	sub    $0x41000000,%eax
 b0c:	09 00                	or     %eax,(%eax)
 b0e:	00 3d 09 00 00 00    	add    %bh,0x9
 b14:	08 04 ac             	or     %al,(%esp,%ebp,4)
 b17:	00 00                	add    %al,(%eax)
 b19:	00 01                	add    %al,(%ecx)
 b1b:	01 06                	add    %eax,(%esi)
 b1d:	ad                   	lods   %ds:(%esi),%eax
 b1e:	00 00                	add    %al,(%eax)
 b20:	00 09                	add    %cl,(%ecx)
 b22:	a5                   	movsl  %ds:(%esi),%es:(%edi)
 b23:	00 00                	add    %al,(%eax)
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
  29:	01 3f                	add    %edi,(%edi)
  2b:	19 03                	sbb    %eax,(%ebx)
  2d:	0e                   	push   %cs
  2e:	3a 0b                	cmp    (%ebx),%cl
  30:	3b 0b                	cmp    (%ebx),%ecx
  32:	39 0b                	cmp    %ecx,(%ebx)
  34:	27                   	daa
  35:	19 49 13             	sbb    %ecx,0x13(%ecx)
  38:	3c 19                	cmp    $0x19,%al
  3a:	01 13                	add    %edx,(%ebx)
  3c:	00 00                	add    %al,(%eax)
  3e:	03 05 00 49 13 00    	add    0x134900,%eax
  44:	00 04 18             	add    %al,(%eax,%ebx,1)
  47:	00 00                	add    %al,(%eax)
  49:	00 05 24 00 0b 0b    	add    %al,0xb0b0024
  4f:	3e 0b 03             	or     %ds:(%ebx),%eax
  52:	08 00                	or     %al,(%eax)
  54:	00 06                	add    %al,(%esi)
  56:	0f 00 0b             	str    (%ebx)
  59:	0b 49 13             	or     0x13(%ecx),%ecx
  5c:	00 00                	add    %al,(%eax)
  5e:	07                   	pop    %es
  5f:	37                   	aaa
  60:	00 49 13             	add    %cl,0x13(%ecx)
  63:	00 00                	add    %al,(%eax)
  65:	08 24 00             	or     %ah,(%eax,%eax,1)
  68:	0b 0b                	or     (%ebx),%ecx
  6a:	3e 0b 03             	or     %ds:(%ebx),%eax
  6d:	0e                   	push   %cs
  6e:	00 00                	add    %al,(%eax)
  70:	09 26                	or     %esp,(%esi)
  72:	00 49 13             	add    %cl,0x13(%ecx)
  75:	00 00                	add    %al,(%eax)
  77:	0a 2e                	or     (%esi),%ch
  79:	01 3f                	add    %edi,(%edi)
  7b:	19 03                	sbb    %eax,(%ebx)
  7d:	0e                   	push   %cs
  7e:	3a 0b                	cmp    (%ebx),%cl
  80:	3b 0b                	cmp    (%ebx),%ecx
  82:	39 0b                	cmp    %ecx,(%ebx)
  84:	49                   	dec    %ecx
  85:	13 11                	adc    (%ecx),%edx
  87:	01 12                	add    %edx,(%edx)
  89:	06                   	push   %es
  8a:	40                   	inc    %eax
  8b:	18 7a 19             	sbb    %bh,0x19(%edx)
  8e:	00 00                	add    %al,(%eax)
  90:	0b 48 00             	or     0x0(%eax),%ecx
  93:	7d 01                	jge    96 <_start-0x7f6a>
  95:	7f 13                	jg     aa <_start-0x7f56>
  97:	00 00                	add    %al,(%eax)
  99:	00 01                	add    %al,(%ecx)
  9b:	48                   	dec    %eax
  9c:	00 7d 01             	add    %bh,0x1(%ebp)
  9f:	7f 13                	jg     b4 <_start-0x7f4c>
  a1:	00 00                	add    %al,(%eax)
  a3:	02 05 00 31 13 00    	add    0x133100,%al
  a9:	00 03                	add    %al,(%ebx)
  ab:	34 00                	xor    $0x0,%al
  ad:	31 13                	xor    %edx,(%ebx)
  af:	00 00                	add    %al,(%eax)
  b1:	04 34                	add    $0x34,%al
  b3:	00 31                	add    %dh,(%ecx)
  b5:	13 02                	adc    (%edx),%eax
  b7:	17                   	pop    %ss
  b8:	b7 42                	mov    $0x42,%bh
  ba:	17                   	pop    %ss
  bb:	00 00                	add    %al,(%eax)
  bd:	05 0b 01 31 13       	add    $0x1331010b,%eax
  c2:	11 01                	adc    %eax,(%ecx)
  c4:	12 06                	adc    (%esi),%al
  c6:	00 00                	add    %al,(%eax)
  c8:	06                   	push   %es
  c9:	34 00                	xor    $0x0,%al
  cb:	03 08                	add    (%eax),%ecx
  cd:	3a 21                	cmp    (%ecx),%ah
  cf:	01 3b                	add    %edi,(%ebx)
  d1:	0b 39                	or     (%ecx),%edi
  d3:	0b 49 13             	or     0x13(%ecx),%ecx
  d6:	02 17                	add    (%edi),%dl
  d8:	b7 42                	mov    $0x42,%bh
  da:	17                   	pop    %ss
  db:	00 00                	add    %al,(%eax)
  dd:	07                   	pop    %es
  de:	24 00                	and    $0x0,%al
  e0:	0b 0b                	or     (%ebx),%ecx
  e2:	3e 0b 03             	or     %ds:(%ebx),%eax
  e5:	0e                   	push   %cs
  e6:	00 00                	add    %al,(%eax)
  e8:	08 34 00             	or     %dh,(%eax,%eax,1)
  eb:	03 08                	add    (%eax),%ecx
  ed:	3a 21                	cmp    (%ecx),%ah
  ef:	01 3b                	add    %edi,(%ebx)
  f1:	0b 39                	or     (%ecx),%edi
  f3:	0b 49 13             	or     0x13(%ecx),%ecx
  f6:	02 18                	add    (%eax),%bl
  f8:	00 00                	add    %al,(%eax)
  fa:	09 1d 01 31 13 11    	or     %ebx,0x11133101
 100:	01 12                	add    %edx,(%edx)
 102:	06                   	push   %es
 103:	58                   	pop    %eax
 104:	21 01                	and    %eax,(%ecx)
 106:	59                   	pop    %ecx
 107:	0b 57 0b             	or     0xb(%edi),%edx
 10a:	01 13                	add    %edx,(%ebx)
 10c:	00 00                	add    %al,(%eax)
 10e:	0a 34 00             	or     (%eax,%eax,1),%dh
 111:	03 08                	add    (%eax),%ecx
 113:	3a 21                	cmp    (%ecx),%ah
 115:	01 3b                	add    %edi,(%ebx)
 117:	0b 39                	or     (%ecx),%edi
 119:	0b 49 13             	or     0x13(%ecx),%ecx
 11c:	00 00                	add    %al,(%eax)
 11e:	0b 05 00 49 13 00    	or     0x134900,%eax
 124:	00 0c 0b             	add    %cl,(%ebx,%ecx,1)
 127:	01 55 17             	add    %edx,0x17(%ebp)
 12a:	00 00                	add    %al,(%eax)
 12c:	0d 0b 01 55 17       	or     $0x1755010b,%eax
 131:	01 13                	add    %edx,(%ebx)
 133:	00 00                	add    %al,(%eax)
 135:	0e                   	push   %cs
 136:	34 00                	xor    $0x0,%al
 138:	03 0e                	add    (%esi),%ecx
 13a:	3a 21                	cmp    (%ecx),%ah
 13c:	01 3b                	add    %edi,(%ebx)
 13e:	0b 39                	or     (%ecx),%edi
 140:	0b 49 13             	or     0x13(%ecx),%ecx
 143:	02 17                	add    (%edi),%dl
 145:	b7 42                	mov    $0x42,%bh
 147:	17                   	pop    %ss
 148:	00 00                	add    %al,(%eax)
 14a:	0f 0b                	ud2
 14c:	01 11                	add    %edx,(%ecx)
 14e:	01 12                	add    %edx,(%edx)
 150:	06                   	push   %es
 151:	01 13                	add    %edx,(%ebx)
 153:	00 00                	add    %al,(%eax)
 155:	10 1d 01 31 13 55    	adc    %bl,0x55133101
 15b:	17                   	pop    %ss
 15c:	58                   	pop    %eax
 15d:	21 01                	and    %eax,(%ecx)
 15f:	59                   	pop    %ecx
 160:	0b 57 0b             	or     0xb(%edi),%edx
 163:	01 13                	add    %edx,(%ebx)
 165:	00 00                	add    %al,(%eax)
 167:	11 0b                	adc    %ecx,(%ebx)
 169:	01 31                	add    %esi,(%ecx)
 16b:	13 55 17             	adc    0x17(%ebp),%edx
 16e:	00 00                	add    %al,(%eax)
 170:	12 16                	adc    (%esi),%dl
 172:	00 03                	add    %al,(%ebx)
 174:	0e                   	push   %cs
 175:	3a 0b                	cmp    (%ebx),%cl
 177:	3b 0b                	cmp    (%ebx),%ecx
 179:	39 0b                	cmp    %ecx,(%ebx)
 17b:	49                   	dec    %ecx
 17c:	13 00                	adc    (%eax),%eax
 17e:	00 13                	add    %dl,(%ebx)
 180:	2e 01 3f             	add    %edi,%cs:(%edi)
 183:	19 03                	sbb    %eax,(%ebx)
 185:	0e                   	push   %cs
 186:	3a 0b                	cmp    (%ebx),%cl
 188:	3b 0b                	cmp    (%ebx),%ecx
 18a:	39 0b                	cmp    %ecx,(%ebx)
 18c:	27                   	daa
 18d:	19 49 13             	sbb    %ecx,0x13(%ecx)
 190:	3c 19                	cmp    $0x19,%al
 192:	01 13                	add    %edx,(%ebx)
 194:	00 00                	add    %al,(%eax)
 196:	14 0f                	adc    $0xf,%al
 198:	00 0b                	add    %cl,(%ebx)
 19a:	21 04 49             	and    %eax,(%ecx,%ecx,2)
 19d:	13 00                	adc    (%eax),%eax
 19f:	00 15 26 00 49 13    	add    %dl,0x13490026
 1a5:	00 00                	add    %al,(%eax)
 1a7:	16                   	push   %ss
 1a8:	34 00                	xor    $0x0,%al
 1aa:	03 0e                	add    (%esi),%ecx
 1ac:	3a 21                	cmp    (%ecx),%ah
 1ae:	01 3b                	add    %edi,(%ebx)
 1b0:	0b 39                	or     (%ecx),%edi
 1b2:	0b 49 13             	or     0x13(%ecx),%ecx
 1b5:	00 00                	add    %al,(%eax)
 1b7:	17                   	pop    %ss
 1b8:	1d 01 31 13 11       	sbb    $0x11133101,%eax
 1bd:	01 12                	add    %edx,(%edx)
 1bf:	06                   	push   %es
 1c0:	58                   	pop    %eax
 1c1:	21 01                	and    %eax,(%ecx)
 1c3:	59                   	pop    %ecx
 1c4:	0b 57 21             	or     0x21(%edi),%edx
 1c7:	09 00                	or     %eax,(%eax)
 1c9:	00 18                	add    %bl,(%eax)
 1cb:	05 00 03 0e 3a       	add    $0x3a0e0300,%eax
 1d0:	21 01                	and    %eax,(%ecx)
 1d2:	3b 21                	cmp    (%ecx),%esp
 1d4:	08 39                	or     %bh,(%ecx)
 1d6:	0b 49 13             	or     0x13(%ecx),%ecx
 1d9:	00 00                	add    %al,(%eax)
 1db:	19 11                	sbb    %edx,(%ecx)
 1dd:	01 25 0e 13 0b 03    	add    %esp,0x30b130e
 1e3:	1f                   	pop    %ds
 1e4:	1b 1f                	sbb    (%edi),%ebx
 1e6:	11 01                	adc    %eax,(%ecx)
 1e8:	12 06                	adc    (%esi),%al
 1ea:	10 17                	adc    %dl,(%edi)
 1ec:	00 00                	add    %al,(%eax)
 1ee:	1a 0f                	sbb    (%edi),%cl
 1f0:	00 0b                	add    %cl,(%ebx)
 1f2:	0b 03                	or     (%ebx),%eax
 1f4:	0e                   	push   %cs
 1f5:	49                   	dec    %ecx
 1f6:	13 00                	adc    (%eax),%eax
 1f8:	00 1b                	add    %bl,(%ebx)
 1fa:	24 00                	and    $0x0,%al
 1fc:	0b 0b                	or     (%ebx),%ecx
 1fe:	3e 0b 03             	or     %ds:(%ebx),%eax
 201:	08 00                	or     %al,(%eax)
 203:	00 1c 37             	add    %bl,(%edi,%esi,1)
 206:	00 49 13             	add    %cl,0x13(%ecx)
 209:	00 00                	add    %al,(%eax)
 20b:	1d 2e 01 3f 19       	sbb    $0x193f012e,%eax
 210:	03 0e                	add    (%esi),%ecx
 212:	3a 0b                	cmp    (%ebx),%cl
 214:	3b 0b                	cmp    (%ebx),%ecx
 216:	39 0b                	cmp    %ecx,(%ebx)
 218:	27                   	daa
 219:	19 49 13             	sbb    %ecx,0x13(%ecx)
 21c:	11 01                	adc    %eax,(%ecx)
 21e:	12 06                	adc    (%esi),%al
 220:	40                   	inc    %eax
 221:	18 7a 19             	sbb    %bh,0x19(%edx)
 224:	01 13                	add    %edx,(%ebx)
 226:	00 00                	add    %al,(%eax)
 228:	1e                   	push   %ds
 229:	05 00 03 0e 3a       	add    $0x3a0e0300,%eax
 22e:	0b 3b                	or     (%ebx),%edi
 230:	0b 39                	or     (%ecx),%edi
 232:	0b 49 13             	or     0x13(%ecx),%ecx
 235:	02 17                	add    (%edi),%dl
 237:	b7 42                	mov    $0x42,%bh
 239:	17                   	pop    %ss
 23a:	00 00                	add    %al,(%eax)
 23c:	1f                   	pop    %ds
 23d:	18 00                	sbb    %al,(%eax)
 23f:	00 00                	add    %al,(%eax)
 241:	20 01                	and    %al,(%ecx)
 243:	01 49 13             	add    %ecx,0x13(%ecx)
 246:	01 13                	add    %edx,(%ebx)
 248:	00 00                	add    %al,(%eax)
 24a:	21 21                	and    %esp,(%ecx)
 24c:	00 49 13             	add    %cl,0x13(%ecx)
 24f:	2f                   	das
 250:	0b 00                	or     (%eax),%eax
 252:	00 22                	add    %ah,(%edx)
 254:	2e 01 03             	add    %eax,%cs:(%ebx)
 257:	0e                   	push   %cs
 258:	3a 0b                	cmp    (%ebx),%cl
 25a:	3b 0b                	cmp    (%ebx),%ecx
 25c:	39 0b                	cmp    %ecx,(%ebx)
 25e:	27                   	daa
 25f:	19 49 13             	sbb    %ecx,0x13(%ecx)
 262:	20 0b                	and    %cl,(%ebx)
 264:	01 13                	add    %edx,(%ebx)
 266:	00 00                	add    %al,(%eax)
 268:	23 0b                	and    (%ebx),%ecx
 26a:	01 00                	add    %eax,(%eax)
 26c:	00 00                	add    %al,(%eax)
 26e:	01 11                	add    %edx,(%ecx)
 270:	01 25 0e 13 0b 03    	add    %esp,0x30b130e
 276:	1f                   	pop    %ds
 277:	1b 1f                	sbb    (%edi),%ebx
 279:	11 01                	adc    %eax,(%ecx)
 27b:	12 06                	adc    (%esi),%al
 27d:	10 17                	adc    %dl,(%edi)
 27f:	00 00                	add    %al,(%eax)
 281:	02 2e                	add    (%esi),%ch
 283:	01 3f                	add    %edi,(%edi)
 285:	19 03                	sbb    %eax,(%ebx)
 287:	0e                   	push   %cs
 288:	3a 0b                	cmp    (%ebx),%cl
 28a:	3b 0b                	cmp    (%ebx),%ecx
 28c:	39 0b                	cmp    %ecx,(%ebx)
 28e:	27                   	daa
 28f:	19 49 13             	sbb    %ecx,0x13(%ecx)
 292:	11 01                	adc    %eax,(%ecx)
 294:	12 06                	adc    (%esi),%al
 296:	40                   	inc    %eax
 297:	18 7a 19             	sbb    %bh,0x19(%edx)
 29a:	01 13                	add    %edx,(%ebx)
 29c:	00 00                	add    %al,(%eax)
 29e:	03 05 00 03 08 3a    	add    0x3a080300,%eax
 2a4:	0b 3b                	or     (%ebx),%edi
 2a6:	0b 39                	or     (%ecx),%edi
 2a8:	0b 49 13             	or     0x13(%ecx),%ecx
 2ab:	02 18                	add    (%eax),%bl
 2ad:	00 00                	add    %al,(%eax)
 2af:	04 24                	add    $0x24,%al
 2b1:	00 0b                	add    %cl,(%ebx)
 2b3:	0b 3e                	or     (%esi),%edi
 2b5:	0b 03                	or     (%ebx),%eax
 2b7:	08 00                	or     %al,(%eax)
 2b9:	00 00                	add    %al,(%eax)
 2bb:	01 34 00             	add    %esi,(%eax,%eax,1)
 2be:	03 0e                	add    (%esi),%ecx
 2c0:	3a 21                	cmp    (%ecx),%ah
 2c2:	01 3b                	add    %edi,(%ebx)
 2c4:	0b 39                	or     (%ecx),%edi
 2c6:	0b 49 13             	or     0x13(%ecx),%ecx
 2c9:	02 17                	add    (%edi),%dl
 2cb:	b7 42                	mov    $0x42,%bh
 2cd:	17                   	pop    %ss
 2ce:	00 00                	add    %al,(%eax)
 2d0:	02 24 00             	add    (%eax,%eax,1),%ah
 2d3:	0b 0b                	or     (%ebx),%ecx
 2d5:	3e 0b 03             	or     %ds:(%ebx),%eax
 2d8:	0e                   	push   %cs
 2d9:	00 00                	add    %al,(%eax)
 2db:	03 05 00 03 0e 3a    	add    0x3a0e0300,%eax
 2e1:	21 01                	and    %eax,(%ecx)
 2e3:	3b 21                	cmp    (%ecx),%esp
 2e5:	03 39                	add    (%ecx),%edi
 2e7:	0b 49 13             	or     0x13(%ecx),%ecx
 2ea:	02 17                	add    (%edi),%dl
 2ec:	b7 42                	mov    $0x42,%bh
 2ee:	17                   	pop    %ss
 2ef:	00 00                	add    %al,(%eax)
 2f1:	04 05                	add    $0x5,%al
 2f3:	00 03                	add    %al,(%ebx)
 2f5:	0e                   	push   %cs
 2f6:	3a 21                	cmp    (%ecx),%ah
 2f8:	01 3b                	add    %edi,(%ebx)
 2fa:	21 03                	and    %eax,(%ebx)
 2fc:	39 0b                	cmp    %ecx,(%ebx)
 2fe:	49                   	dec    %ecx
 2ff:	13 02                	adc    (%edx),%eax
 301:	18 00                	sbb    %al,(%eax)
 303:	00 05 34 00 03 08    	add    %al,0x8030034
 309:	3a 21                	cmp    (%ecx),%ah
 30b:	01 3b                	add    %edi,(%ebx)
 30d:	0b 39                	or     (%ecx),%edi
 30f:	21 0b                	and    %ecx,(%ebx)
 311:	49                   	dec    %ecx
 312:	13 02                	adc    (%edx),%eax
 314:	17                   	pop    %ss
 315:	b7 42                	mov    $0x42,%bh
 317:	17                   	pop    %ss
 318:	00 00                	add    %al,(%eax)
 31a:	06                   	push   %es
 31b:	11 01                	adc    %eax,(%ecx)
 31d:	25 0e 13 0b 03       	and    $0x30b130e,%eax
 322:	1f                   	pop    %ds
 323:	1b 1f                	sbb    (%edi),%ebx
 325:	11 01                	adc    %eax,(%ecx)
 327:	12 06                	adc    (%esi),%al
 329:	10 17                	adc    %dl,(%edi)
 32b:	00 00                	add    %al,(%eax)
 32d:	07                   	pop    %es
 32e:	2e 01 3f             	add    %edi,%cs:(%edi)
 331:	19 03                	sbb    %eax,(%ebx)
 333:	0e                   	push   %cs
 334:	3a 0b                	cmp    (%ebx),%cl
 336:	3b 0b                	cmp    (%ebx),%ecx
 338:	39 0b                	cmp    %ecx,(%ebx)
 33a:	27                   	daa
 33b:	19 49 13             	sbb    %ecx,0x13(%ecx)
 33e:	11 01                	adc    %eax,(%ecx)
 340:	12 06                	adc    (%esi),%al
 342:	40                   	inc    %eax
 343:	18 7a 19             	sbb    %bh,0x19(%edx)
 346:	01 13                	add    %edx,(%ebx)
 348:	00 00                	add    %al,(%eax)
 34a:	08 0b                	or     %cl,(%ebx)
 34c:	01 11                	add    %edx,(%ecx)
 34e:	01 12                	add    %edx,(%edx)
 350:	06                   	push   %es
 351:	01 13                	add    %edx,(%ebx)
 353:	00 00                	add    %al,(%eax)
 355:	09 0b                	or     %ecx,(%ebx)
 357:	01 11                	add    %edx,(%ecx)
 359:	01 12                	add    %edx,(%edx)
 35b:	06                   	push   %es
 35c:	00 00                	add    %al,(%eax)
 35e:	0a 0f                	or     (%edi),%cl
 360:	00 0b                	add    %cl,(%ebx)
 362:	0b 49 13             	or     0x13(%ecx),%ecx
 365:	00 00                	add    %al,(%eax)
 367:	0b 24 00             	or     (%eax,%eax,1),%esp
 36a:	0b 0b                	or     (%ebx),%ecx
 36c:	3e 0b 03             	or     %ds:(%ebx),%eax
 36f:	08 00                	or     %al,(%eax)
 371:	00 00                	add    %al,(%eax)
 373:	01 24 00             	add    %esp,(%eax,%eax,1)
 376:	0b 0b                	or     (%ebx),%ecx
 378:	3e 0b 03             	or     %ds:(%ebx),%eax
 37b:	0e                   	push   %cs
 37c:	00 00                	add    %al,(%eax)
 37e:	02 11                	add    (%ecx),%dl
 380:	01 25 0e 13 0b 03    	add    %esp,0x30b130e
 386:	1f                   	pop    %ds
 387:	1b 1f                	sbb    (%edi),%ebx
 389:	11 01                	adc    %eax,(%ecx)
 38b:	12 06                	adc    (%esi),%al
 38d:	10 17                	adc    %dl,(%edi)
 38f:	00 00                	add    %al,(%eax)
 391:	03 16                	add    (%esi),%edx
 393:	00 03                	add    %al,(%ebx)
 395:	0e                   	push   %cs
 396:	3a 0b                	cmp    (%ebx),%cl
 398:	3b 0b                	cmp    (%ebx),%ecx
 39a:	39 0b                	cmp    %ecx,(%ebx)
 39c:	49                   	dec    %ecx
 39d:	13 00                	adc    (%eax),%eax
 39f:	00 04 24             	add    %al,(%esp)
 3a2:	00 0b                	add    %cl,(%ebx)
 3a4:	0b 3e                	or     (%esi),%edi
 3a6:	0b 03                	or     (%ebx),%eax
 3a8:	08 00                	or     %al,(%eax)
 3aa:	00 05 2e 01 3f 19    	add    %al,0x193f012e
 3b0:	03 0e                	add    (%esi),%ecx
 3b2:	3a 0b                	cmp    (%ebx),%cl
 3b4:	3b 0b                	cmp    (%ebx),%ecx
 3b6:	39 0b                	cmp    %ecx,(%ebx)
 3b8:	27                   	daa
 3b9:	19 49 13             	sbb    %ecx,0x13(%ecx)
 3bc:	11 01                	adc    %eax,(%ecx)
 3be:	12 06                	adc    (%esi),%al
 3c0:	40                   	inc    %eax
 3c1:	18 7a 19             	sbb    %bh,0x19(%edx)
 3c4:	01 13                	add    %edx,(%ebx)
 3c6:	00 00                	add    %al,(%eax)
 3c8:	06                   	push   %es
 3c9:	05 00 03 08 3a       	add    $0x3a080300,%eax
 3ce:	0b 3b                	or     (%ebx),%edi
 3d0:	0b 39                	or     (%ecx),%edi
 3d2:	0b 49 13             	or     0x13(%ecx),%ecx
 3d5:	02 17                	add    (%edi),%dl
 3d7:	b7 42                	mov    $0x42,%bh
 3d9:	17                   	pop    %ss
 3da:	00 00                	add    %al,(%eax)
 3dc:	07                   	pop    %es
 3dd:	34 00                	xor    $0x0,%al
 3df:	03 08                	add    (%eax),%ecx
 3e1:	3a 0b                	cmp    (%ebx),%cl
 3e3:	3b 0b                	cmp    (%ebx),%ecx
 3e5:	39 0b                	cmp    %ecx,(%ebx)
 3e7:	49                   	dec    %ecx
 3e8:	13 02                	adc    (%edx),%eax
 3ea:	17                   	pop    %ss
 3eb:	b7 42                	mov    $0x42,%bh
 3ed:	17                   	pop    %ss
 3ee:	00 00                	add    %al,(%eax)
 3f0:	08 0f                	or     %cl,(%edi)
 3f2:	00 0b                	add    %cl,(%ebx)
 3f4:	0b 49 13             	or     0x13(%ecx),%ecx
 3f7:	00 00                	add    %al,(%eax)
 3f9:	09 26                	or     %esp,(%esi)
 3fb:	00 49 13             	add    %cl,0x13(%ecx)
 3fe:	00 00                	add    %al,(%eax)
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
  30:	10 80 00 00 25 00    	adc    %al,0x250000(%eax)
	...
  3e:	00 00                	add    %al,(%eax)
  40:	1c 00                	sbb    $0x0,%al
  42:	00 00                	add    %al,(%eax)
  44:	02 00                	add    (%eax),%al
  46:	a0 00 00 00 04       	mov    0x4000000,%al
  4b:	00 00                	add    %al,(%eax)
  4d:	00 00                	add    %al,(%eax)
  4f:	00 40 80             	add    %al,-0x80(%eax)
  52:	00 00                	add    %al,(%eax)
  54:	be 06 00 00 00       	mov    $0x6,%esi
  59:	00 00                	add    %al,(%eax)
  5b:	00 00                	add    %al,(%eax)
  5d:	00 00                	add    %al,(%eax)
  5f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  62:	00 00                	add    %al,(%eax)
  64:	02 00                	add    (%eax),%al
  66:	da 08                	fimull (%eax)
  68:	00 00                	add    %al,(%eax)
  6a:	04 00                	add    $0x0,%al
  6c:	00 00                	add    %al,(%eax)
  6e:	00 00                	add    %al,(%eax)
  70:	00 87 00 00 08 00    	add    %al,0x80000(%edi)
	...
  7e:	00 00                	add    %al,(%eax)
  80:	1c 00                	sbb    $0x0,%al
  82:	00 00                	add    %al,(%eax)
  84:	02 00                	add    (%eax),%al
  86:	31 09                	xor    %ecx,(%ecx)
  88:	00 00                	add    %al,(%eax)
  8a:	04 00                	add    $0x0,%al
  8c:	00 00                	add    %al,(%eax)
  8e:	00 00                	add    %al,(%eax)
  90:	40                   	inc    %eax
  91:	87 00                	xchg   %eax,(%eax)
  93:	00 36                	add    %dh,(%esi)
  95:	01 00                	add    %eax,(%eax)
	...
  9f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  a2:	00 00                	add    %al,(%eax)
  a4:	02 00                	add    (%eax),%al
  a6:	75 0a                	jne    b2 <_start-0x7f4e>
  a8:	00 00                	add    %al,(%eax)
  aa:	04 00                	add    $0x0,%al
  ac:	00 00                	add    %al,(%eax)
  ae:	00 00                	add    %al,(%eax)
  b0:	80 88 00 00 1b 00 00 	orb    $0x0,0x1b0000(%eax)
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
  76:	64 69 6e 67 00 70 72 	imul   $0x69727000,%fs:0x67(%esi),%ebp
  7d:	69 
  7e:	6e                   	outsb  %ds:(%esi),(%dx)
  7f:	74 66                	je     e7 <_start-0x7f19>
  81:	00 6d 61             	add    %ch,0x61(%ebp)
  84:	69 6e 00 6c 6f 6e 67 	imul   $0x676e6f6c,0x0(%esi),%ebp
  8b:	20 6c 6f 6e          	and    %ch,0x6e(%edi,%ebp,2)
  8f:	67 20 69 6e          	and    %ch,0x6e(%bx,%di)
  93:	74 00                	je     95 <_start-0x7f6b>
  95:	70 75                	jo     10c <_start-0x7ef4>
  97:	74 63                	je     fc <_start-0x7f04>
  99:	68 61 72 00 73       	push   $0x73007261
  9e:	69 7a 65 5f 74 00 75 	imul   $0x7500745f,0x65(%edx),%edi
  a5:	6e                   	outsb  %ds:(%esi),(%dx)
  a6:	73 69                	jae    111 <_start-0x7eef>
  a8:	67 6e                	outsb  %ds:(%si),(%dx)
  aa:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
  af:	61                   	popa
  b0:	72 00                	jb     b2 <_start-0x7f4e>
  b2:	6d                   	insl   (%dx),%es:(%edi)
  b3:	61                   	popa
  b4:	78 72                	js     128 <_start-0x7ed8>
  b6:	65 6d                	gs insl (%dx),%es:(%edi)
  b8:	00 5f 5f             	add    %bl,0x5f(%edi)
  bb:	62 75 69             	bound  %esi,0x69(%ebp)
  be:	6c                   	insb   (%dx),%es:(%edi)
  bf:	74 69                	je     12a <_start-0x7ed6>
  c1:	6e                   	outsb  %ds:(%esi),(%dx)
  c2:	5f                   	pop    %edi
  c3:	76 61                	jbe    126 <_start-0x7eda>
  c5:	5f                   	pop    %edi
  c6:	6c                   	insb   (%dx),%es:(%edi)
  c7:	69 73 74 00 62 79 74 	imul   $0x74796200,0x74(%ebx),%esi
  ce:	65 73 00             	gs jae d1 <_start-0x7f2f>
  d1:	66 6f                	outsw  %ds:(%esi),(%dx)
  d3:	72 6d                	jb     142 <_start-0x7ebe>
  d5:	61                   	popa
  d6:	74 00                	je     d8 <_start-0x7f28>
  d8:	5f                   	pop    %edi
  d9:	46                   	inc    %esi
  da:	6c                   	insb   (%dx),%es:(%edi)
  db:	6f                   	outsl  %ds:(%esi),(%dx)
  dc:	61                   	popa
  dd:	74 31                	je     110 <_start-0x7ef0>
  df:	32 38                	xor    (%eax),%bh
  e1:	00 6c 6f 6e          	add    %ch,0x6e(%edi,%ebp,2)
  e5:	67 20 75 6e          	and    %dh,0x6e(%di)
  e9:	73 69                	jae    154 <_start-0x7eac>
  eb:	67 6e                	outsb  %ds:(%si),(%dx)
  ed:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
  f2:	74 00                	je     f4 <_start-0x7f0c>
  f4:	64 61                	fs popa
  f6:	74 61                	je     159 <_start-0x7ea7>
  f8:	00 6c 65 6e          	add    %ch,0x6e(%ebp,%eiz,2)
  fc:	67 74 68             	addr16 je 167 <_start-0x7e99>
  ff:	00 70 72             	add    %dh,0x72(%eax)
 102:	69 6e 74 00 47 4e 55 	imul   $0x554e4700,0x74(%esi),%ebp
 109:	20 43 31             	and    %al,0x31(%ebx)
 10c:	31 20                	xor    %esp,(%eax)
 10e:	31 34 2e             	xor    %esi,(%esi,%ebp,1)
 111:	32 2e                	xor    (%esi),%ch
 113:	30 20                	xor    %ah,(%eax)
 115:	2d 6d 74 75 6e       	sub    $0x6e75746d,%eax
 11a:	65 3d 67 65 6e 65    	gs cmp $0x656e6567,%eax
 120:	72 69                	jb     18b <_start-0x7e75>
 122:	63 20                	arpl   %esp,(%eax)
 124:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
 129:	68 3d 70 65 6e       	push   $0x6e65703d
 12e:	74 69                	je     199 <_start-0x7e67>
 130:	75 6d                	jne    19f <_start-0x7e61>
 132:	70 72                	jo     1a6 <_start-0x7e5a>
 134:	6f                   	outsl  %ds:(%esi),(%dx)
 135:	20 2d 67 20 2d 4f    	and    %ch,0x4f2d2067
 13b:	32 20                	xor    (%eax),%ah
 13d:	2d 73 74 64 3d       	sub    $0x3d647473,%eax
 142:	67 6e                	outsb  %ds:(%si),(%dx)
 144:	75 31                	jne    177 <_start-0x7e89>
 146:	31 20                	xor    %esp,(%eax)
 148:	2d 66 66 72 65       	sub    $0x65726666,%eax
 14d:	65 73 74             	gs jae 1c4 <_start-0x7e3c>
 150:	61                   	popa
 151:	6e                   	outsb  %ds:(%esi),(%dx)
 152:	64 69 6e 67 00 77 72 	imul   $0x69727700,%fs:0x67(%esi),%ebp
 159:	69 
 15a:	74 74                	je     1d0 <_start-0x7e30>
 15c:	65 6e                	outsb  %gs:(%esi),(%dx)
 15e:	00 66 6f             	add    %ah,0x6f(%esi)
 161:	72 6d                	jb     1d0 <_start-0x7e30>
 163:	61                   	popa
 164:	74 5f                	je     1c5 <_start-0x7e3b>
 166:	62 65 67             	bound  %esp,0x67(%ebp)
 169:	75 6e                	jne    1d9 <_start-0x7e27>
 16b:	5f                   	pop    %edi
 16c:	61                   	popa
 16d:	74 00                	je     16f <_start-0x7e91>
 16f:	5f                   	pop    %edi
 170:	42                   	inc    %edx
 171:	6f                   	outsl  %ds:(%esi),(%dx)
 172:	6f                   	outsl  %ds:(%esi),(%dx)
 173:	6c                   	insb   (%dx),%es:(%edi)
 174:	00 70 61             	add    %dh,0x61(%eax)
 177:	72 61                	jb     1da <_start-0x7e26>
 179:	6d                   	insl   (%dx),%es:(%edi)
 17a:	65 74 65             	gs je  1e2 <_start-0x7e1e>
 17d:	72 73                	jb     1f2 <_start-0x7e0e>
 17f:	00 73 74             	add    %dh,0x74(%ebx)
 182:	72 6c                	jb     1f0 <_start-0x7e10>
 184:	65 6e                	outsb  %gs:(%esi),(%dx)
 186:	00 61 6d             	add    %ah,0x6d(%ecx)
 189:	6f                   	outsl  %ds:(%esi),(%dx)
 18a:	75 6e                	jne    1fa <_start-0x7e06>
 18c:	74 00                	je     18e <_start-0x7e72>
 18e:	5f                   	pop    %edi
 18f:	5f                   	pop    %edi
 190:	67 6e                	outsb  %ds:(%si),(%dx)
 192:	75 63                	jne    1f7 <_start-0x7e09>
 194:	5f                   	pop    %edi
 195:	76 61                	jbe    1f8 <_start-0x7e08>
 197:	5f                   	pop    %edi
 198:	6c                   	insb   (%dx),%es:(%edi)
 199:	69 73 74 00 6c 6f 6e 	imul   $0x6e6f6c00,0x74(%ebx),%esi
 1a0:	67 20 64 6f          	and    %ah,0x6f(%si)
 1a4:	75 62                	jne    208 <_start-0x7df8>
 1a6:	6c                   	insb   (%dx),%es:(%edi)
 1a7:	65 00 69 74          	add    %ch,%gs:0x74(%ecx)
 1ab:	6f                   	outsl  %ds:(%esi),(%dx)
 1ac:	61                   	popa
 1ad:	00 61 62             	add    %ah,0x62(%ecx)
 1b0:	73 5f                	jae    211 <_start-0x7def>
 1b2:	76 61                	jbe    215 <_start-0x7deb>
 1b4:	6c                   	insb   (%dx),%es:(%edi)
 1b5:	75 65                	jne    21c <_start-0x7de4>
 1b7:	00 69 73             	add    %ch,0x73(%ecx)
 1ba:	4e                   	dec    %esi
 1bb:	65 67 61             	gs addr16 popa
 1be:	74 69                	je     229 <_start-0x7dd7>
 1c0:	76 65                	jbe    227 <_start-0x7dd9>
 1c2:	00 62 75             	add    %ah,0x75(%edx)
 1c5:	66 66 65 72 00       	data16 data16 gs jb 1ca <_start-0x7e36>
 1ca:	72 65                	jb     231 <_start-0x7dcf>
 1cc:	6d                   	insl   (%dx),%es:(%edi)
 1cd:	61                   	popa
 1ce:	69 6e 64 65 72 00 73 	imul   $0x73007265,0x64(%esi),%ebp
 1d5:	74 61                	je     238 <_start-0x7dc8>
 1d7:	72 74                	jb     24d <_start-0x7db3>
 1d9:	00 62 61             	add    %ah,0x61(%edx)
 1dc:	73 65                	jae    243 <_start-0x7dbd>
 1de:	00 74 65 6d          	add    %dh,0x6d(%ebp,%eiz,2)
 1e2:	70 00                	jo     1e4 <_start-0x7e1c>
 1e4:	69 73 5f 75 6e 73 69 	imul   $0x69736e75,0x5f(%ebx),%esi
 1eb:	67 6e                	outsb  %ds:(%si),(%dx)
 1ed:	65                   	gs
 1ee:	64                   	fs
	...

Disassembly of section .debug_rnglists:

00000000 <.debug_rnglists>:
   0:	0f 00 00             	sldt   (%eax)
   3:	00 05 00 04 00 00    	add    %al,0x400
   9:	00 00                	add    %al,(%eax)
   b:	00 07                	add    %al,(%edi)
   d:	10 80 00 00 25 00    	adc    %al,0x250000(%eax)
  13:	c8 00 00 00          	enter  $0x0,$0x0
  17:	05 00 04 00 00       	add    $0x400,%eax
  1c:	00 00                	add    %al,(%eax)
  1e:	00 04 1f             	add    %al,(%edi,%ebx,1)
  21:	b5 01                	mov    $0x1,%ch
  23:	04 bd                	add    $0xbd,%al
  25:	01 f0                	add    %esi,%eax
  27:	04 04                	add    $0x4,%al
  29:	82 05 ba 06 04 be 06 	addb   $0x6,0xbe0406ba
  30:	f0 08 04 f9          	lock or %al,(%ecx,%edi,8)
  34:	08 95 09 04 99 09    	or     %dl,0x9990409(%ebp)
  3a:	b2 09                	mov    $0x9,%dl
  3c:	04 b6                	add    $0xb6,%al
  3e:	09 e0                	or     %esp,%eax
  40:	09 04 e8             	or     %eax,(%eax,%ebp,8)
  43:	09 9d 0b 04 a1 0b    	or     %ebx,0xba1040b(%ebp)
  49:	ad                   	lods   %ds:(%esi),%eax
  4a:	0c 04                	or     $0x4,%al
  4c:	b1 0c                	mov    $0xc,%cl
  4e:	b7 0d                	mov    $0xd,%bh
  50:	00 04 1f             	add    %al,(%edi,%ebx,1)
  53:	30 04 c8             	xor    %al,(%eax,%ecx,8)
  56:	06                   	push   %es
  57:	f8                   	clc
  58:	07                   	pop    %es
  59:	04 a8                	add    $0xa8,%al
  5b:	09 b2 09 04 b6 09    	or     %esi,0x9b60409(%edx)
  61:	b9 09 00 04 b0       	mov    $0xb0040009,%ecx
  66:	07                   	pop    %es
  67:	f8                   	clc
  68:	07                   	pop    %es
  69:	04 a8                	add    $0xa8,%al
  6b:	09 ad 09 00 04 60    	or     %ebp,0x60040009(%ebp)
  71:	b0 01                	mov    $0x1,%al
  73:	04 d7                	add    $0xd7,%al
  75:	09 e0                	or     %esp,%eax
  77:	09 00                	or     %eax,(%eax)
  79:	04 73                	add    $0x73,%al
  7b:	b0 01                	mov    $0x1,%al
  7d:	04 d7                	add    $0xd7,%al
  7f:	09 dc                	or     %ebx,%esp
  81:	09 00                	or     %eax,(%eax)
  83:	04 b0                	add    $0xb0,%al
  85:	01 b5 01 04 f8 07    	add    %esi,0x7f80401(%ebp)
  8b:	f0 08 04 f9          	lock or %al,(%ecx,%edi,8)
  8f:	08 88 09 04 c0 09    	or     %cl,0x9c00409(%eax)
  95:	d7                   	xlat   %ds:(%ebx)
  96:	09 00                	or     %eax,(%eax)
  98:	04 dc                	add    $0xdc,%al
  9a:	02 dc                	add    %ah,%bl
  9c:	03 04 88             	add    (%eax,%ecx,4),%eax
  9f:	09 95 09 04 99 09    	or     %edx,0x9990409(%ebp)
  a5:	9f                   	lahf
  a6:	09 00                	or     %eax,(%eax)
  a8:	04 95                	add    $0x95,%al
  aa:	03 dc                	add    %esp,%ebx
  ac:	03 04 88             	add    (%eax,%ecx,4),%eax
  af:	09 90 09 00 04 84    	or     %edx,-0x7bfbfff7(%eax)
  b5:	06                   	push   %es
  b6:	ba 06 04 be 06       	mov    $0x6be0406,%edx
  bb:	c3                   	ret
  bc:	06                   	push   %es
  bd:	00 04 e8             	add    %al,(%eax,%ebp,8)
  c0:	09 9d 0b 04 a1 0b    	or     %ebx,0xba1040b(%ebp)
  c6:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
  c7:	0b 00                	or     (%eax),%eax
  c9:	04 a0                	add    $0xa0,%al
  cb:	0c ad                	or     $0xad,%al
  cd:	0c 04                	or     $0x4,%al
  cf:	b1 0c                	mov    $0xc,%cl
  d1:	b7 0d                	mov    $0xd,%bh
  d3:	00 04 a0             	add    %al,(%eax,%eiz,4)
  d6:	0c a8                	or     $0xa8,%al
  d8:	0c 04                	or     $0x4,%al
  da:	f0 0c b7             	lock or $0xb7,%al
  dd:	0d                   	.byte 0xd
	...

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
  13:	00 28                	add    %ch,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	00 00                	add    %al,(%eax)
  19:	00 00                	add    %al,(%eax)
  1b:	00 10                	add    %dl,(%eax)
  1d:	80 00 00             	addb   $0x0,(%eax)
  20:	25 00 00 00 44       	and    $0x44000000,%eax
  25:	0c 01                	or     $0x1,%al
  27:	00 49 10             	add    %cl,0x10(%ecx)
  2a:	05 02 75 00 41       	add    $0x41007502,%eax
  2f:	0f 03 75 7c          	lsl    0x7c(%ebp),%esi
  33:	06                   	push   %es
  34:	50                   	push   %eax
  35:	0c 01                	or     $0x1,%al
  37:	00 43 c5             	add    %al,-0x3b(%ebx)
  3a:	43                   	inc    %ebx
  3b:	0c 04                	or     $0x4,%al
  3d:	04 00                	add    $0x0,%al
  3f:	00 10                	add    %dl,(%eax)
  41:	00 00                	add    %al,(%eax)
  43:	00 ff                	add    %bh,%bh
  45:	ff                   	(bad)
  46:	ff                   	(bad)
  47:	ff 01                	incl   (%ecx)
  49:	00 01                	add    %al,(%ecx)
  4b:	7c 08                	jl     55 <_start-0x7fab>
  4d:	0c 04                	or     $0x4,%al
  4f:	04 88                	add    $0x88,%al
  51:	01 00                	add    %eax,(%eax)
  53:	00 3c 00             	add    %bh,(%eax,%eax,1)
  56:	00 00                	add    %al,(%eax)
  58:	40                   	inc    %eax
  59:	00 00                	add    %al,(%eax)
  5b:	00 40 80             	add    %al,-0x80(%eax)
  5e:	00 00                	add    %al,(%eax)
  60:	be 06 00 00 41       	mov    $0x41000006,%esi
  65:	0e                   	push   %cs
  66:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  6c:	49                   	dec    %ecx
  6d:	87 03                	xchg   %eax,(%ebx)
  6f:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  72:	05 02 ad 0a c3       	add    $0xc30aad02,%eax
  77:	41                   	inc    %ecx
  78:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  7c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  7f:	04 41                	add    $0x41,%al
  81:	0b 03                	or     (%ebx),%eax
  83:	c1 01 0a             	roll   $0xa,(%ecx)
  86:	c3                   	ret
  87:	41                   	inc    %ecx
  88:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  8c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  8f:	04 41                	add    $0x41,%al
  91:	0b 00                	or     (%eax),%eax
  93:	00 10                	add    %dl,(%eax)
  95:	00 00                	add    %al,(%eax)
  97:	00 ff                	add    %bh,%bh
  99:	ff                   	(bad)
  9a:	ff                   	(bad)
  9b:	ff 01                	incl   (%ecx)
  9d:	00 01                	add    %al,(%ecx)
  9f:	7c 08                	jl     a9 <_start-0x7f57>
  a1:	0c 04                	or     $0x4,%al
  a3:	04 88                	add    $0x88,%al
  a5:	01 00                	add    %eax,(%eax)
  a7:	00 1c 00             	add    %bl,(%eax,%eax,1)
  aa:	00 00                	add    %al,(%eax)
  ac:	94                   	xchg   %eax,%esp
  ad:	00 00                	add    %al,(%eax)
  af:	00 00                	add    %al,(%eax)
  b1:	87 00                	xchg   %eax,(%eax)
  b3:	00 08                	add    %cl,(%eax)
  b5:	00 00                	add    %al,(%eax)
  b7:	00 41 0e             	add    %al,0xe(%ecx)
  ba:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c0:	44                   	inc    %esp
  c1:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c4:	04 00                	add    $0x0,%al
  c6:	00 00                	add    %al,(%eax)
  c8:	10 00                	adc    %al,(%eax)
  ca:	00 00                	add    %al,(%eax)
  cc:	ff                   	(bad)
  cd:	ff                   	(bad)
  ce:	ff                   	(bad)
  cf:	ff 01                	incl   (%ecx)
  d1:	00 01                	add    %al,(%ecx)
  d3:	7c 08                	jl     dd <_start-0x7f23>
  d5:	0c 04                	or     $0x4,%al
  d7:	04 88                	add    $0x88,%al
  d9:	01 00                	add    %eax,(%eax)
  db:	00 48 00             	add    %cl,0x0(%eax)
  de:	00 00                	add    %al,(%eax)
  e0:	c8 00 00 00          	enter  $0x0,$0x0
  e4:	40                   	inc    %eax
  e5:	87 00                	xchg   %eax,(%eax)
  e7:	00 36                	add    %dh,(%esi)
  e9:	01 00                	add    %eax,(%eax)
  eb:	00 41 0e             	add    %al,0xe(%ecx)
  ee:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  f4:	46                   	inc    %esi
  f5:	87 03                	xchg   %eax,(%ebx)
  f7:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  fa:	05 02 f3 0a c3       	add    $0xc30af302,%eax
  ff:	41                   	inc    %ecx
 100:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
 104:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 107:	04 41                	add    $0x41,%al
 109:	0b 4e 0a             	or     0xa(%esi),%ecx
 10c:	c3                   	ret
 10d:	41                   	inc    %ecx
 10e:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
 112:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 115:	04 47                	add    $0x47,%al
 117:	0b 49 0a             	or     0xa(%ecx),%ecx
 11a:	c3                   	ret
 11b:	41                   	inc    %ecx
 11c:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
 120:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 123:	04 44                	add    $0x44,%al
 125:	0b 00                	or     (%eax),%eax
 127:	00 10                	add    %dl,(%eax)
 129:	00 00                	add    %al,(%eax)
 12b:	00 ff                	add    %bh,%bh
 12d:	ff                   	(bad)
 12e:	ff                   	(bad)
 12f:	ff 01                	incl   (%ecx)
 131:	00 01                	add    %al,(%ecx)
 133:	7c 08                	jl     13d <_start-0x7ec3>
 135:	0c 04                	or     $0x4,%al
 137:	04 88                	add    $0x88,%al
 139:	01 00                	add    %eax,(%eax)
 13b:	00 1c 00             	add    %bl,(%eax,%eax,1)
 13e:	00 00                	add    %al,(%eax)
 140:	28 01                	sub    %al,(%ecx)
 142:	00 00                	add    %al,(%eax)
 144:	80 88 00 00 1b 00 00 	orb    $0x0,0x1b0000(%eax)
 14b:	00 41 0e             	add    %al,0xe(%ecx)
 14e:	08 85 02 44 0d 05    	or     %al,0x50d4402(%ebp)
 154:	55                   	push   %ebp
 155:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 158:	04 00                	add    $0x0,%al
	...

Disassembly of section .debug_loclists:

00000000 <.debug_loclists>:
   0:	b0 07                	mov    $0x7,%al
   2:	00 00                	add    %al,(%eax)
   4:	05 00 04 00 00       	add    $0x400,%eax
	...
  25:	00 03                	add    %al,(%ebx)
  27:	00 01                	add    %al,(%ecx)
	...
  39:	00 04 00             	add    %al,(%eax,%eax,1)
  3c:	21 02                	and    %eax,(%edx)
  3e:	91                   	xchg   %eax,%ecx
  3f:	00 04 c6             	add    %al,(%esi,%eax,8)
  42:	01 c9                	add    %ecx,%ecx
  44:	01 01                	add    %eax,(%ecx)
  46:	50                   	push   %eax
  47:	04 c9                	add    $0xc9,%al
  49:	01 dc                	add    %ebx,%esp
  4b:	02 02                	add    (%edx),%al
  4d:	91                   	xchg   %eax,%ecx
  4e:	4c                   	dec    %esp
  4f:	04 e5                	add    $0xe5,%al
  51:	02 e8                	add    %al,%ch
  53:	02 01                	add    (%ecx),%al
  55:	50                   	push   %eax
  56:	04 e8                	add    $0xe8,%al
  58:	02 dc                	add    %ah,%bl
  5a:	03 02                	add    (%edx),%eax
  5c:	91                   	xchg   %eax,%ecx
  5d:	4c                   	dec    %esp
  5e:	04 e8                	add    $0xe8,%al
  60:	03 eb                	add    %ebx,%ebp
  62:	03 01                	add    (%ecx),%eax
  64:	50                   	push   %eax
  65:	04 eb                	add    $0xeb,%al
  67:	03 c4                	add    %esp,%eax
  69:	04 02                	add    $0x2,%al
  6b:	91                   	xchg   %eax,%ecx
  6c:	4c                   	dec    %esp
  6d:	04 e0                	add    $0xe0,%al
  6f:	04 e3                	add    $0xe3,%al
  71:	04 03                	add    $0x3,%al
  73:	73 06                	jae    7b <_start-0x7f85>
  75:	9f                   	lahf
  76:	04 8b                	add    $0x8b,%al
  78:	05 8e 05 01 50       	add    $0x5001058e,%eax
  7d:	04 8e                	add    $0x8e,%al
  7f:	05 84 06 02 91       	add    $0x91020684,%eax
  84:	4c                   	dec    %esp
  85:	04 8d                	add    $0x8d,%al
  87:	06                   	push   %es
  88:	c8 06 01 56          	enter  $0x106,$0x56
  8c:	04 d1                	add    $0xd1,%al
  8e:	06                   	push   %es
  8f:	d4 06                	aam    $0x6
  91:	01 50 04             	add    %edx,0x4(%eax)
  94:	d4 06                	aam    $0x6
  96:	f4                   	hlt
  97:	07                   	pop    %es
  98:	02 91 4c 04 f4 07    	add    0x7f4044c(%ecx),%dl
  9e:	fb                   	sti
  9f:	07                   	pop    %es
  a0:	03 73 02             	add    0x2(%ebx),%esi
  a3:	9f                   	lahf
  a4:	04 f9                	add    $0xf9,%al
  a6:	08 82 09 01 51 04    	or     %al,0x4510109(%edx)
  ac:	82 09 be             	orb    $0xbe,(%ecx)
  af:	09 02                	or     %eax,(%edx)
  b1:	91                   	xchg   %eax,%ecx
  b2:	4c                   	dec    %esp
  b3:	04 f4                	add    $0xf4,%al
  b5:	09 f7                	or     %esi,%edi
  b7:	09 01                	or     %eax,(%ecx)
  b9:	50                   	push   %eax
  ba:	04 f7                	add    $0xf7,%al
  bc:	09 ac 0b 02 91 48 04 	or     %ebp,0x4489102(%ebx,%ecx,1)
  c3:	b8 0b bb 0b 01       	mov    $0x10bbb0b,%eax
  c8:	50                   	push   %eax
  c9:	04 bb                	add    $0xbb,%al
  cb:	0b bc 0c 02 91 4c 04 	or     0x44c9102(%esp,%ecx,1),%edi
  d2:	c8 0c cb 0c          	enter  $0xcb0c,$0xc
  d6:	01 50 04             	add    %edx,0x4(%eax)
  d9:	cb                   	lret
  da:	0c b0                	or     $0xb0,%al
  dc:	0d 02 91 4c 04       	or     $0x44c9102,%eax
  e1:	b7 0d                	mov    $0xd,%bh
  e3:	be 0d 02 91 00       	mov    $0x91020d,%esi
	...
 124:	00 00                	add    %al,(%eax)
 126:	02 04 12             	add    (%edx,%edx,1),%al
 129:	15 01 50 04 15       	adc    $0x15045001,%eax
 12e:	af                   	scas   %es:(%edi),%eax
 12f:	01 02                	add    %eax,(%edx)
 131:	91                   	xchg   %eax,%ecx
 132:	44                   	inc    %esp
 133:	04 bd                	add    $0xbd,%al
 135:	01 cf                	add    %ecx,%edi
 137:	01 02                	add    %eax,(%edx)
 139:	91                   	xchg   %eax,%ecx
 13a:	44                   	inc    %esp
 13b:	04 cf                	add    $0xcf,%al
 13d:	01 d2                	add    %edx,%edx
 13f:	01 01                	add    %eax,(%ecx)
 141:	51                   	push   %ecx
 142:	04 d2                	add    $0xd2,%al
 144:	01 ee                	add    %ebp,%esi
 146:	02 02                	add    (%edx),%al
 148:	91                   	xchg   %eax,%ecx
 149:	44                   	inc    %esp
 14a:	04 ee                	add    $0xee,%al
 14c:	02 f1                	add    %cl,%dh
 14e:	02 01                	add    (%ecx),%al
 150:	51                   	push   %ecx
 151:	04 f1                	add    $0xf1,%al
 153:	02 dc                	add    %ah,%bl
 155:	03 02                	add    (%edx),%eax
 157:	91                   	xchg   %eax,%ecx
 158:	48                   	dec    %eax
 159:	04 dc                	add    $0xdc,%al
 15b:	03 f3                	add    %ebx,%esi
 15d:	03 02                	add    (%edx),%eax
 15f:	91                   	xchg   %eax,%ecx
 160:	44                   	inc    %esp
 161:	04 f3                	add    $0xf3,%al
 163:	03 f8                	add    %eax,%edi
 165:	03 01                	add    (%ecx),%eax
 167:	51                   	push   %ecx
 168:	04 f8                	add    $0xf8,%al
 16a:	03 c4                	add    %esp,%eax
 16c:	04 02                	add    $0x2,%al
 16e:	91                   	xchg   %eax,%ecx
 16f:	48                   	dec    %eax
 170:	04 c4                	add    $0xc4,%al
 172:	04 81                	add    $0x81,%al
 174:	05 02 91 44 04       	add    $0x4449102,%eax
 179:	81 05 82 05 02 74 48 	addl   $0x5820448,0x74020582
 180:	04 82 05 
 183:	94                   	xchg   %eax,%esp
 184:	05 02 91 44 04       	add    $0x4449102,%eax
 189:	94                   	xchg   %eax,%esp
 18a:	05 97 05 01 51       	add    $0x51010597,%eax
 18f:	04 97                	add    $0x97,%al
 191:	05 84 06 02 91       	add    $0x91020684,%eax
 196:	48                   	dec    %eax
 197:	04 84                	add    $0x84,%al
 199:	06                   	push   %es
 19a:	95                   	xchg   %eax,%ebp
 19b:	06                   	push   %es
 19c:	02 91 44 04 95 06    	add    0x6950444(%ecx),%dl
 1a2:	aa                   	stos   %al,%es:(%edi)
 1a3:	06                   	push   %es
 1a4:	01 51 04             	add    %edx,0x4(%ecx)
 1a7:	aa                   	stos   %al,%es:(%edi)
 1a8:	06                   	push   %es
 1a9:	da 06                	fiaddl (%esi)
 1ab:	02 91 44 04 da 06    	add    0x6da0444(%ecx),%dl
 1b1:	dd 06                	fldl   (%esi)
 1b3:	01 51 04             	add    %edx,0x4(%ecx)
 1b6:	dd 06                	fldl   (%esi)
 1b8:	82 09 02             	orb    $0x2,(%ecx)
 1bb:	91                   	xchg   %eax,%ecx
 1bc:	44                   	inc    %esp
 1bd:	04 82                	add    $0x82,%al
 1bf:	09 a4 09 02 91 48 04 	or     %esp,0x4489102(%ecx,%ecx,1)
 1c6:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 1c7:	09 fd                	or     %edi,%ebp
 1c9:	09 02                	or     %eax,(%edx)
 1cb:	91                   	xchg   %eax,%ecx
 1cc:	44                   	inc    %esp
 1cd:	04 fd                	add    $0xfd,%al
 1cf:	09 88 0a 01 51 04    	or     %ecx,0x451010a(%eax)
 1d5:	88 0a                	mov    %cl,(%edx)
 1d7:	ac                   	lods   %ds:(%esi),%al
 1d8:	0b 02                	or     (%edx),%eax
 1da:	91                   	xchg   %eax,%ecx
 1db:	4c                   	dec    %esp
 1dc:	04 ac                	add    $0xac,%al
 1de:	0b c1                	or     %ecx,%eax
 1e0:	0b 02                	or     (%edx),%eax
 1e2:	91                   	xchg   %eax,%ecx
 1e3:	44                   	inc    %esp
 1e4:	04 c1                	add    $0xc1,%al
 1e6:	0b cc                	or     %esp,%ecx
 1e8:	0b 01                	or     (%ecx),%eax
 1ea:	51                   	push   %ecx
 1eb:	04 cc                	add    $0xcc,%al
 1ed:	0b bc 0c 02 91 48 04 	or     0x4489102(%esp,%ecx,1),%edi
 1f4:	bc 0c d1 0c 02       	mov    $0x20cd10c,%esp
 1f9:	91                   	xchg   %eax,%ecx
 1fa:	44                   	inc    %esp
 1fb:	04 d1                	add    $0xd1,%al
 1fd:	0c dc                	or     $0xdc,%al
 1ff:	0c 01                	or     $0x1,%al
 201:	51                   	push   %ecx
 202:	04 dc                	add    $0xdc,%al
 204:	0c b0                	or     $0xb0,%al
 206:	0d 02 91 48 04       	or     $0x4489102,%eax
 20b:	b0 0d                	mov    $0xd,%al
 20d:	b9 0d 02 91 44       	mov    $0x4491020d,%ecx
 212:	00 01                	add    %al,(%ecx)
	...
 24c:	00 00                	add    %al,(%eax)
 24e:	00 04 12             	add    %al,(%edx,%edx,1)
 251:	21 02                	and    %eax,(%edx)
 253:	30 9f 04 21 6b 01    	xor    %bl,0x16b2104(%edi)
 259:	52                   	push   %edx
 25a:	04 6b                	add    $0x6b,%al
 25c:	84 01                	test   %al,(%ecx)
 25e:	02 91 4c 04 bd 01    	add    0x1bd044c(%ecx),%dl
 264:	dd 01                	fldl   (%ecx)
 266:	01 52 04             	add    %edx,0x4(%edx)
 269:	dd 01                	fldl   (%ecx)
 26b:	dc 02                	faddl  (%edx)
 26d:	02 91 40 04 dc 02    	add    0x2dc0440(%ecx),%dl
 273:	fc                   	cld
 274:	02 01                	add    (%ecx),%al
 276:	52                   	push   %edx
 277:	04 fc                	add    $0xfc,%al
 279:	02 dc                	add    %ah,%bl
 27b:	03 02                	add    (%edx),%eax
 27d:	91                   	xchg   %eax,%ecx
 27e:	40                   	inc    %eax
 27f:	04 dc                	add    $0xdc,%al
 281:	03 f8                	add    %eax,%edi
 283:	03 01                	add    (%ecx),%eax
 285:	52                   	push   %edx
 286:	04 f8                	add    $0xf8,%al
 288:	03 c4                	add    %esp,%eax
 28a:	04 02                	add    $0x2,%al
 28c:	91                   	xchg   %eax,%ecx
 28d:	40                   	inc    %eax
 28e:	04 c4                	add    $0xc4,%al
 290:	04 a2                	add    $0xa2,%al
 292:	05 01 52 04 a2       	add    $0xa2045201,%eax
 297:	05 84 06 02 91       	add    $0x91020684,%eax
 29c:	40                   	inc    %eax
 29d:	04 84                	add    $0x84,%al
 29f:	06                   	push   %es
 2a0:	aa                   	stos   %al,%es:(%edi)
 2a1:	06                   	push   %es
 2a2:	01 52 04             	add    %edx,0x4(%edx)
 2a5:	aa                   	stos   %al,%es:(%edi)
 2a6:	06                   	push   %es
 2a7:	c3                   	ret
 2a8:	06                   	push   %es
 2a9:	02 91 4c 04 c3 06    	add    0x6c3044c(%ecx),%dl
 2af:	e8 06 01 52 04       	call   45203ba <__bss_end+0x4517aba>
 2b4:	e8 06 f4 07 02       	call   207f6bf <__bss_end+0x2076dbf>
 2b9:	91                   	xchg   %eax,%ecx
 2ba:	40                   	inc    %eax
 2bb:	04 f4                	add    $0xf4,%al
 2bd:	07                   	pop    %es
 2be:	c4 08                	les    (%eax),%ecx
 2c0:	01 52 04             	add    %edx,0x4(%edx)
 2c3:	c4 08                	les    (%eax),%ecx
 2c5:	fb                   	sti
 2c6:	08 02                	or     %al,(%edx)
 2c8:	91                   	xchg   %eax,%ecx
 2c9:	48                   	dec    %eax
 2ca:	04 fb                	add    $0xfb,%al
 2cc:	08 82 09 01 52 04    	or     %al,0x4520109(%edx)
 2d2:	82 09 92             	orb    $0x92,(%ecx)
 2d5:	09 02                	or     %eax,(%edx)
 2d7:	91                   	xchg   %eax,%ecx
 2d8:	40                   	inc    %eax
 2d9:	04 92                	add    $0x92,%al
 2db:	09 a4 09 01 52 04 a4 	or     %esp,-0x5bfbadff(%ecx,%ecx,1)
 2e2:	09 b2 09 02 91 40    	or     %esi,0x40910209(%edx)
 2e8:	04 b2                	add    $0xb2,%al
 2ea:	09 d7                	or     %edx,%edi
 2ec:	09 01                	or     %eax,(%ecx)
 2ee:	52                   	push   %edx
 2ef:	04 de                	add    $0xde,%al
 2f1:	09 88 0a 01 52 04    	or     %ecx,0x452010a(%eax)
 2f7:	88 0a                	mov    %cl,(%edx)
 2f9:	e6 0a                	out    %al,$0xa
 2fb:	02 91 40 04 9a 0b    	add    0xb9a0440(%ecx),%dl
 301:	cc                   	int3
 302:	0b 01                	or     (%ecx),%eax
 304:	52                   	push   %edx
 305:	04 cc                	add    $0xcc,%al
 307:	0b fa                	or     %edx,%edi
 309:	0b 02                	or     (%edx),%eax
 30b:	91                   	xchg   %eax,%ecx
 30c:	40                   	inc    %eax
 30d:	04 ad                	add    $0xad,%al
 30f:	0c dc                	or     $0xdc,%al
 311:	0c 01                	or     $0x1,%al
 313:	52                   	push   %edx
 314:	04 dc                	add    $0xdc,%al
 316:	0c 8a                	or     $0x8a,%al
 318:	0d 02 91 40 04       	or     $0x4409102,%eax
 31d:	b0 0d                	mov    $0xd,%al
 31f:	b7 0d                	mov    $0xd,%bh
 321:	02 91 4c 04 b7 0d    	add    0xdb7044c(%ecx),%dl
 327:	be 0d 02 30 9f       	mov    $0x9f30020d,%esi
	...
 360:	00 04 37             	add    %al,(%edi,%esi,1)
 363:	7b 01                	jnp    366 <_start-0x7c9a>
 365:	57                   	push   %edi
 366:	04 7b                	add    $0x7b,%al
 368:	84 01                	test   %al,(%ecx)
 36a:	0a 0c ff             	or     (%edi,%edi,8),%cl
 36d:	ff                   	(bad)
 36e:	ff                   	(bad)
 36f:	7f 91                	jg     302 <_start-0x7cfe>
 371:	4c                   	dec    %esp
 372:	06                   	push   %es
 373:	1c 9f                	sbb    $0x9f,%al
 375:	04 bd                	add    $0xbd,%al
 377:	01 9e 02 01 57 04    	add    %ebx,0x4570102(%esi)
 37d:	9e                   	sahf
 37e:	02 dc                	add    %ah,%bl
 380:	02 0a                	add    (%edx),%cl
 382:	0c ff                	or     $0xff,%al
 384:	ff                   	(bad)
 385:	ff                   	(bad)
 386:	7f 91                	jg     319 <_start-0x7ce7>
 388:	40                   	inc    %eax
 389:	06                   	push   %es
 38a:	1c 9f                	sbb    $0x9f,%al
 38c:	04 dc                	add    $0xdc,%al
 38e:	02 a0 03 01 57 04    	add    0x4570103(%eax),%ah
 394:	a0 03 dc 03 0a       	mov    0xa03dc03,%al
 399:	0c ff                	or     $0xff,%al
 39b:	ff                   	(bad)
 39c:	ff                   	(bad)
 39d:	7f 91                	jg     330 <_start-0x7cd0>
 39f:	40                   	inc    %eax
 3a0:	06                   	push   %es
 3a1:	1c 9f                	sbb    $0x9f,%al
 3a3:	04 dc                	add    $0xdc,%al
 3a5:	03 8e 04 01 57 04    	add    0x4570104(%esi),%ecx
 3ab:	8e 04 c4             	mov    (%esp,%eax,8),%es
 3ae:	04 0a                	add    $0xa,%al
 3b0:	0c ff                	or     $0xff,%al
 3b2:	ff                   	(bad)
 3b3:	ff                   	(bad)
 3b4:	7f 91                	jg     347 <_start-0x7cb9>
 3b6:	40                   	inc    %eax
 3b7:	06                   	push   %es
 3b8:	1c 9f                	sbb    $0x9f,%al
 3ba:	04 c4                	add    $0xc4,%al
 3bc:	04 e3                	add    $0xe3,%al
 3be:	04 01                	add    $0x1,%al
 3c0:	57                   	push   %edi
 3c1:	04 82                	add    $0x82,%al
 3c3:	05 c6 05 01 57       	add    $0x570105c6,%eax
 3c8:	04 c6                	add    $0xc6,%al
 3ca:	05 84 06 0a 0c       	add    $0xc0a0684,%eax
 3cf:	ff                   	(bad)
 3d0:	ff                   	(bad)
 3d1:	ff                   	(bad)
 3d2:	7f 91                	jg     365 <_start-0x7c9b>
 3d4:	40                   	inc    %eax
 3d5:	06                   	push   %es
 3d6:	1c 9f                	sbb    $0x9f,%al
 3d8:	04 84                	add    $0x84,%al
 3da:	06                   	push   %es
 3db:	b5 07                	mov    $0x7,%ch
 3dd:	01 57 04             	add    %edx,0x4(%edi)
 3e0:	b5 07                	mov    $0x7,%ch
 3e2:	f4                   	hlt
 3e3:	07                   	pop    %es
 3e4:	0a 0c ff             	or     (%edi,%edi,8),%cl
 3e7:	ff                   	(bad)
 3e8:	ff                   	(bad)
 3e9:	7f 91                	jg     37c <_start-0x7c84>
 3eb:	40                   	inc    %eax
 3ec:	06                   	push   %es
 3ed:	1c 9f                	sbb    $0x9f,%al
 3ef:	04 f4                	add    $0xf4,%al
 3f1:	07                   	pop    %es
 3f2:	ba 08 01 57 04       	mov    $0x4570108,%edx
 3f7:	ba 08 c4 08 09       	mov    $0x908c408,%edx
 3fc:	0c ff                	or     $0xff,%al
 3fe:	ff                   	(bad)
 3ff:	ff                   	(bad)
 400:	7f 72                	jg     474 <_start-0x7b8c>
 402:	00 1c 9f             	add    %bl,(%edi,%ebx,4)
 405:	04 c4                	add    $0xc4,%al
 407:	08 82 09 0a 0c ff    	or     %al,-0xf3f5f7(%edx)
 40d:	ff                   	(bad)
 40e:	ff                   	(bad)
 40f:	7f 91                	jg     3a2 <_start-0x7c5e>
 411:	48                   	dec    %eax
 412:	06                   	push   %es
 413:	1c 9f                	sbb    $0x9f,%al
 415:	04 82                	add    $0x82,%al
 417:	09 be 09 0a 0c ff    	or     %edi,-0xf3f5f7(%esi)
 41d:	ff                   	(bad)
 41e:	ff                   	(bad)
 41f:	7f 91                	jg     3b2 <_start-0x7c4e>
 421:	40                   	inc    %eax
 422:	06                   	push   %es
 423:	1c 9f                	sbb    $0x9f,%al
 425:	04 be                	add    $0xbe,%al
 427:	09 d2                	or     %edx,%edx
 429:	09 01                	or     %eax,(%ecx)
 42b:	57                   	push   %edi
 42c:	04 d2                	add    $0xd2,%al
 42e:	09 d7                	or     %edx,%edi
 430:	09 09                	or     %ecx,(%ecx)
 432:	0c ff                	or     $0xff,%al
 434:	ff                   	(bad)
 435:	ff                   	(bad)
 436:	7f 72                	jg     4aa <_start-0x7b56>
 438:	00 1c 9f             	add    %bl,(%edi,%ebx,4)
 43b:	04 e8                	add    $0xe8,%al
 43d:	09 d6                	or     %edx,%esi
 43f:	0a 01                	or     (%ecx),%al
 441:	57                   	push   %edi
 442:	04 d6                	add    $0xd6,%al
 444:	0a e6                	or     %dh,%ah
 446:	0a 0a                	or     (%edx),%cl
 448:	0c ff                	or     $0xff,%al
 44a:	ff                   	(bad)
 44b:	ff                   	(bad)
 44c:	7f 91                	jg     3df <_start-0x7c21>
 44e:	40                   	inc    %eax
 44f:	06                   	push   %es
 450:	1c 9f                	sbb    $0x9f,%al
 452:	04 ac                	add    $0xac,%al
 454:	0b e4                	or     %esp,%esp
 456:	0b 01                	or     (%ecx),%eax
 458:	57                   	push   %edi
 459:	04 e4                	add    $0xe4,%al
 45b:	0b fa                	or     %edx,%edi
 45d:	0b 0a                	or     (%edx),%ecx
 45f:	0c ff                	or     $0xff,%al
 461:	ff                   	(bad)
 462:	ff                   	(bad)
 463:	7f 91                	jg     3f6 <_start-0x7c0a>
 465:	40                   	inc    %eax
 466:	06                   	push   %es
 467:	1c 9f                	sbb    $0x9f,%al
 469:	04 bc                	add    $0xbc,%al
 46b:	0c f4                	or     $0xf4,%al
 46d:	0c 01                	or     $0x1,%al
 46f:	57                   	push   %edi
 470:	04 f4                	add    $0xf4,%al
 472:	0c 8a                	or     $0x8a,%al
 474:	0d 0a 0c ff ff       	or     $0xffff0c0a,%eax
 479:	ff                   	(bad)
 47a:	7f 91                	jg     40d <_start-0x7bf3>
 47c:	40                   	inc    %eax
 47d:	06                   	push   %es
 47e:	1c 9f                	sbb    $0x9f,%al
 480:	04 b0                	add    $0xb0,%al
 482:	0d b7 0d 0a 0c       	or     $0xc0a0db7,%eax
 487:	ff                   	(bad)
 488:	ff                   	(bad)
 489:	ff                   	(bad)
 48a:	7f 91                	jg     41d <_start-0x7be3>
 48c:	4c                   	dec    %esp
 48d:	06                   	push   %es
 48e:	1c 9f                	sbb    $0x9f,%al
 490:	00 01                	add    %al,(%ecx)
 492:	00 00                	add    %al,(%eax)
 494:	00 00                	add    %al,(%eax)
 496:	00 04 fb             	add    %al,(%ebx,%edi,8)
 499:	07                   	pop    %es
 49a:	94                   	xchg   %eax,%esp
 49b:	08 02                	or     %al,(%edx)
 49d:	31 9f 04 a0 08 bc    	xor    %ebx,-0x43f75ffc(%edi)
 4a3:	08 01                	or     %al,(%ecx)
 4a5:	56                   	push   %esi
 4a6:	04 be                	add    $0xbe,%al
 4a8:	09 d7                	or     %edx,%edi
 4aa:	09 02                	or     %eax,(%edx)
 4ac:	31 9f 00 00 00 04    	xor    %ebx,0x4000000(%edi)
 4b2:	97                   	xchg   %eax,%edi
 4b3:	06                   	push   %es
 4b4:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 4b5:	06                   	push   %es
 4b6:	02 71 7c             	add    0x7c(%ecx),%dh
 4b9:	00 00                	add    %al,(%eax)
 4bb:	00 00                	add    %al,(%eax)
 4bd:	01 04 9f             	add    %eax,(%edi,%ebx,4)
 4c0:	06                   	push   %es
 4c1:	b7 06                	mov    $0x6,%bh
 4c3:	02 30                	add    (%eax),%dh
 4c5:	9f                   	lahf
 4c6:	04 b7                	add    $0xb7,%al
 4c8:	06                   	push   %es
 4c9:	b7 06                	mov    $0x6,%bh
 4cb:	02 31                	add    (%ecx),%dh
 4cd:	9f                   	lahf
 4ce:	00 00                	add    %al,(%eax)
 4d0:	00 00                	add    %al,(%eax)
 4d2:	00 04 fe             	add    %al,(%esi,%edi,8)
 4d5:	03 a0 04 01 50 04    	add    0x4500104(%eax),%esp
 4db:	a0 04 c4 04 02       	mov    0x204c404,%al
 4e0:	91                   	xchg   %eax,%ecx
 4e1:	44                   	inc    %esp
 4e2:	00 00                	add    %al,(%eax)
 4e4:	00 04 86             	add    %al,(%esi,%eax,4)
 4e7:	04 a0                	add    $0xa0,%al
 4e9:	04 02                	add    $0x2,%al
 4eb:	30 9f 00 00 00 00    	xor    %bl,0x0(%edi)
 4f1:	00 04 b3             	add    %al,(%ebx,%esi,4)
 4f4:	05 d8 05 01 50       	add    $0x500105d8,%eax
 4f9:	04 d8                	add    $0xd8,%al
 4fb:	05 84 06 02 91       	add    $0x91020684,%eax
 500:	44                   	inc    %esp
 501:	00 00                	add    %al,(%eax)
 503:	00 00                	add    %al,(%eax)
 505:	01 01                	add    %eax,(%ecx)
 507:	00 00                	add    %al,(%eax)
 509:	00 04 bb             	add    %al,(%ebx,%edi,4)
 50c:	05 d8 05 02 30       	add    $0x300205d8,%eax
 511:	9f                   	lahf
 512:	04 d8                	add    $0xd8,%al
 514:	05 d8 05 08 73       	add    $0x730805d8,%eax
 519:	00 91 00 1c 23 2c    	add    %dl,0x2c231c00(%ecx)
 51f:	9f                   	lahf
 520:	04 d8                	add    $0xd8,%al
 522:	05 e3 05 08 73       	add    $0x730805e3,%eax
 527:	00 91 00 1c 23 2d    	add    %dl,0x2d231c00(%ecx)
 52d:	9f                   	lahf
 52e:	04 e3                	add    $0xe3,%al
 530:	05 84 06 08 73       	add    $0x73080684,%eax
 535:	00 91 00 1c 23 2c    	add    %dl,0x2c231c00(%ecx)
 53b:	9f                   	lahf
 53c:	00 00                	add    %al,(%eax)
 53e:	00 00                	add    %al,(%eax)
 540:	00 04 8d 03 b2 03 01 	add    %al,0x103b203(,%ecx,4)
 547:	50                   	push   %eax
 548:	04 b2                	add    $0xb2,%al
 54a:	03 dc                	add    %esp,%ebx
 54c:	03 02                	add    (%edx),%eax
 54e:	91                   	xchg   %eax,%ecx
 54f:	44                   	inc    %esp
 550:	00 00                	add    %al,(%eax)
 552:	00 00                	add    %al,(%eax)
 554:	01 01                	add    %eax,(%ecx)
 556:	00 00                	add    %al,(%eax)
 558:	00 04 95 03 b2 03 02 	add    %al,0x203b203(,%edx,4)
 55f:	30 9f 04 b2 03 b2    	xor    %bl,-0x4dfc4dfc(%edi)
 565:	03 08                	add    (%eax),%ecx
 567:	73 00                	jae    569 <_start-0x7a97>
 569:	91                   	xchg   %eax,%ecx
 56a:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 56d:	2c 9f                	sub    $0x9f,%al
 56f:	04 b2                	add    $0xb2,%al
 571:	03 bb 03 08 73 00    	add    0x730803(%ebx),%edi
 577:	91                   	xchg   %eax,%ecx
 578:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 57b:	2d 9f 04 bb 03       	sub    $0x3bb049f,%eax
 580:	dc 03                	faddl  (%ebx)
 582:	08 73 00             	or     %dh,0x0(%ebx)
 585:	91                   	xchg   %eax,%ecx
 586:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 589:	2c 9f                	sub    $0x9f,%al
	...
 593:	00 04 ef             	add    %al,(%edi,%ebp,8)
 596:	01 fe                	add    %edi,%esi
 598:	01 01                	add    %eax,(%ecx)
 59a:	50                   	push   %eax
 59b:	04 fe                	add    $0xfe,%al
 59d:	01 a6 02 01 56 04    	add    %esp,0x4560102(%esi)
 5a3:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 5a4:	02 b5 02 01 50 04    	add    0x4500102(%ebp),%dh
 5aa:	b5 02                	mov    $0x2,%ch
 5ac:	dc 02                	faddl  (%edx)
 5ae:	02 91 48 00 00 01    	add    0x1000048(%ecx),%dl
 5b4:	01 00                	add    %eax,(%eax)
 5b6:	04 f5                	add    $0xf5,%al
 5b8:	01 87 02 02 30 9f    	add    %eax,-0x60cffdfe(%edi)
 5be:	04 87                	add    $0x87,%al
 5c0:	02 99 02 02 31 9f    	add    -0x60cefdfe(%ecx),%bl
 5c6:	00 00                	add    %al,(%eax)
 5c8:	00 00                	add    %al,(%eax)
 5ca:	01 01                	add    %eax,(%ecx)
 5cc:	00 00                	add    %al,(%eax)
 5ce:	00 04 99             	add    %al,(%ecx,%ebx,4)
 5d1:	02 b5 02 02 30 9f    	add    -0x60cffdfe(%ebp),%dh
 5d7:	04 b5                	add    $0xb5,%al
 5d9:	02 b5 02 08 73 00    	add    0x730802(%ebp),%dh
 5df:	91                   	xchg   %eax,%ecx
 5e0:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 5e3:	2c 9f                	sub    $0x9f,%al
 5e5:	04 b5                	add    $0xb5,%al
 5e7:	02 bb 02 08 73 00    	add    0x730802(%ebx),%bh
 5ed:	91                   	xchg   %eax,%ecx
 5ee:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 5f1:	2d 9f 04 bb 02       	sub    $0x2bb049f,%eax
 5f6:	dc 02                	faddl  (%edx)
 5f8:	08 73 00             	or     %dh,0x0(%ebx)
 5fb:	91                   	xchg   %eax,%ecx
 5fc:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 5ff:	2c 9f                	sub    $0x9f,%al
	...
 609:	00 04 fa             	add    %al,(%edx,%edi,8)
 60c:	06                   	push   %es
 60d:	8d 07                	lea    (%edi),%eax
 60f:	01 50 04             	add    %edx,0x4(%eax)
 612:	8d 07                	lea    (%edi),%eax
 614:	bd 07 01 56 04       	mov    $0x4560107,%ebp
 619:	bd 07 cc 07 01       	mov    $0x107cc07,%ebp
 61e:	50                   	push   %eax
 61f:	04 cc                	add    $0xcc,%al
 621:	07                   	pop    %es
 622:	f4                   	hlt
 623:	07                   	pop    %es
 624:	02 91 48 00 00 01    	add    0x1000048(%ecx),%dl
 62a:	01 00                	add    %eax,(%eax)
 62c:	04 84                	add    $0x84,%al
 62e:	07                   	pop    %es
 62f:	9a 07 02 30 9f 04 9a 	lcall  $0x9a04,$0x9f300207
 636:	07                   	pop    %es
 637:	b0 07                	mov    $0x7,%al
 639:	02 31                	add    (%ecx),%dh
 63b:	9f                   	lahf
 63c:	00 00                	add    %al,(%eax)
 63e:	00 00                	add    %al,(%eax)
 640:	01 01                	add    %eax,(%ecx)
 642:	00 00                	add    %al,(%eax)
 644:	00 04 b0             	add    %al,(%eax,%esi,4)
 647:	07                   	pop    %es
 648:	cc                   	int3
 649:	07                   	pop    %es
 64a:	02 30                	add    (%eax),%dh
 64c:	9f                   	lahf
 64d:	04 cc                	add    $0xcc,%al
 64f:	07                   	pop    %es
 650:	cc                   	int3
 651:	07                   	pop    %es
 652:	08 73 00             	or     %dh,0x0(%ebx)
 655:	91                   	xchg   %eax,%ecx
 656:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 659:	2c 9f                	sub    $0x9f,%al
 65b:	04 cc                	add    $0xcc,%al
 65d:	07                   	pop    %es
 65e:	d3 07                	roll   %cl,(%edi)
 660:	08 73 00             	or     %dh,0x0(%ebx)
 663:	91                   	xchg   %eax,%ecx
 664:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 667:	2d 9f 04 d3 07       	sub    $0x7d3049f,%eax
 66c:	f4                   	hlt
 66d:	07                   	pop    %es
 66e:	08 73 00             	or     %dh,0x0(%ebx)
 671:	91                   	xchg   %eax,%ecx
 672:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 675:	2c 9f                	sub    $0x9f,%al
 677:	00 00                	add    %al,(%eax)
 679:	00 00                	add    %al,(%eax)
 67b:	00 04 91             	add    %al,(%ecx,%edx,4)
 67e:	0a a8 0a 01 50 04    	or     0x450010a(%eax),%ch
 684:	a8 0a                	test   $0xa,%al
 686:	e3 0a                	jecxz  692 <_start-0x796e>
 688:	02 91 44 00 00 01    	add    0x1000044(%ecx),%dl
 68e:	01 00                	add    %eax,(%eax)
 690:	04 9f                	add    $0x9f,%al
 692:	0a b5 0a 02 30 9f    	or     -0x60cffdf6(%ebp),%dh
 698:	04 b5                	add    $0xb5,%al
 69a:	0a cb                	or     %bl,%cl
 69c:	0a 02                	or     (%edx),%al
 69e:	31 9f 00 00 00 00    	xor    %ebx,0x0(%edi)
 6a4:	01 01                	add    %eax,(%ecx)
 6a6:	00 00                	add    %al,(%eax)
 6a8:	00 04 cb             	add    %al,(%ebx,%ecx,8)
 6ab:	0a e8                	or     %al,%ch
 6ad:	0a 02                	or     (%edx),%al
 6af:	30 9f 04 e8 0a e8    	xor    %bl,-0x17f517fc(%edi)
 6b5:	0a 08                	or     (%eax),%cl
 6b7:	73 00                	jae    6b9 <_start-0x7947>
 6b9:	91                   	xchg   %eax,%ecx
 6ba:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 6bd:	2c 9f                	sub    $0x9f,%al
 6bf:	04 e8                	add    $0xe8,%al
 6c1:	0a f3                	or     %bl,%dh
 6c3:	0a 08                	or     (%eax),%cl
 6c5:	73 00                	jae    6c7 <_start-0x7939>
 6c7:	91                   	xchg   %eax,%ecx
 6c8:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 6cb:	2d 9f 04 f3 0a       	sub    $0xaf3049f,%eax
 6d0:	98                   	cwtl
 6d1:	0b 08                	or     (%eax),%ecx
 6d3:	73 00                	jae    6d5 <_start-0x792b>
 6d5:	91                   	xchg   %eax,%ecx
 6d6:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 6d9:	2c 9f                	sub    $0x9f,%al
 6db:	00 00                	add    %al,(%eax)
 6dd:	00 00                	add    %al,(%eax)
 6df:	00 04 d5 0b fc 0b 01 	add    %al,0x10bfc0b(,%edx,8)
 6e6:	50                   	push   %eax
 6e7:	04 fc                	add    $0xfc,%al
 6e9:	0b a0 0c 02 91 44    	or     0x4491020c(%eax),%esp
 6ef:	00 00                	add    %al,(%eax)
 6f1:	00 00                	add    %al,(%eax)
 6f3:	01 01                	add    %eax,(%ecx)
 6f5:	00 00                	add    %al,(%eax)
 6f7:	00 04 e0             	add    %al,(%eax,%eiz,8)
 6fa:	0b fc                	or     %esp,%edi
 6fc:	0b 02                	or     (%edx),%eax
 6fe:	30 9f 04 fc 0b fc    	xor    %bl,-0x3f403fc(%edi)
 704:	0b 08                	or     (%eax),%ecx
 706:	73 00                	jae    708 <_start-0x78f8>
 708:	91                   	xchg   %eax,%ecx
 709:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 70c:	2c 9f                	sub    $0x9f,%al
 70e:	04 fc                	add    $0xfc,%al
 710:	0b 83 0c 08 73 00    	or     0x73080c(%ebx),%eax
 716:	91                   	xchg   %eax,%ecx
 717:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 71a:	2d 9f 04 83 0c       	sub    $0xc83049f,%eax
 71f:	a0 0c 08 73 00       	mov    0x73080c,%al
 724:	91                   	xchg   %eax,%ecx
 725:	00 1c 23             	add    %bl,(%ebx,%eiz,1)
 728:	2c 9f                	sub    $0x9f,%al
 72a:	00 00                	add    %al,(%eax)
 72c:	00 00                	add    %al,(%eax)
 72e:	00 04 e5 0c 8c 0d 01 	add    %al,0x10d8c0c(,%eiz,8)
 735:	50                   	push   %eax
 736:	04 8c                	add    $0x8c,%al
 738:	0d b0 0d 02 91       	or     $0x91020db0,%eax
 73d:	44                   	inc    %esp
 73e:	00 00                	add    %al,(%eax)
 740:	00 00                	add    %al,(%eax)
 742:	01 01                	add    %eax,(%ecx)
 744:	00 00                	add    %al,(%eax)
 746:	00 04 f0             	add    %al,(%eax,%esi,8)
 749:	0c 8c                	or     $0x8c,%al
 74b:	0d 02 30 9f 04       	or     $0x49f3002,%eax
 750:	8c 0d 8c 0d 08 73    	mov    %cs,0x73080d8c
 756:	00 91 00 1c 23 2c    	add    %dl,0x2c231c00(%ecx)
 75c:	9f                   	lahf
 75d:	04 8c                	add    $0x8c,%al
 75f:	0d 93 0d 08 73       	or     $0x73080d93,%eax
 764:	00 91 00 1c 23 2d    	add    %dl,0x2d231c00(%ecx)
 76a:	9f                   	lahf
 76b:	04 93                	add    $0x93,%al
 76d:	0d b0 0d 08 73       	or     $0x73080db0,%eax
 772:	00 91 00 1c 23 2c    	add    %dl,0x2c231c00(%ecx)
 778:	9f                   	lahf
	...
 781:	00 04 6c             	add    %al,(%esp,%ebp,2)
 784:	88 01                	mov    %al,(%ecx)
 786:	01 50 04             	add    %edx,0x4(%eax)
 789:	88 01                	mov    %al,(%ecx)
 78b:	af                   	scas   %es:(%edi),%eax
 78c:	01 02                	add    %eax,(%edx)
 78e:	91                   	xchg   %eax,%ecx
 78f:	4c                   	dec    %esp
 790:	04 d7                	add    $0xd7,%al
 792:	09 dc                	or     %ebx,%esp
 794:	09 02                	or     %eax,(%edx)
 796:	91                   	xchg   %eax,%ecx
 797:	4c                   	dec    %esp
 798:	04 b0                	add    $0xb0,%al
 79a:	0d b7 0d 01 50       	or     $0x50010db7,%eax
 79f:	00 00                	add    %al,(%eax)
 7a1:	00 00                	add    %al,(%eax)
 7a3:	00 04 73             	add    %al,(%ebx,%esi,2)
 7a6:	88 01                	mov    %al,(%ecx)
 7a8:	02 30                	add    (%eax),%dh
 7aa:	9f                   	lahf
 7ab:	04 b0                	add    $0xb0,%al
 7ad:	0d b7 0d 02 30       	or     $0x30020db7,%eax
 7b2:	9f                   	lahf
 7b3:	00 69 01             	add    %ch,0x1(%ecx)
 7b6:	00 00                	add    %al,(%eax)
 7b8:	05 00 04 00 00       	add    $0x400,%eax
 7bd:	00 00                	add    %al,(%eax)
 7bf:	00 00                	add    %al,(%eax)
 7c1:	00 00                	add    %al,(%eax)
 7c3:	01 00                	add    %eax,(%eax)
 7c5:	00 00                	add    %al,(%eax)
 7c7:	00 04 00             	add    %al,(%eax,%eax,1)
 7ca:	48                   	dec    %eax
 7cb:	02 91 00 04 80 02    	add    0x2800400(%ecx),%dl
 7d1:	88 02                	mov    %al,(%edx)
 7d3:	02 91 00 04 92 02    	add    0x2920400(%ecx),%dl
 7d9:	b1 02                	mov    $0x2,%cl
 7db:	02 91 00 04 b1 02    	add    0x2b10400(%ecx),%dl
 7e1:	b6 02                	mov    $0x2,%dh
 7e3:	01 53 00             	add    %edx,0x0(%ebx)
 7e6:	00 00                	add    %al,(%eax)
 7e8:	00 01                	add    %al,(%ecx)
 7ea:	00 00                	add    %al,(%eax)
 7ec:	04 00                	add    $0x0,%al
 7ee:	4b                   	dec    %ebx
 7ef:	02 91 04 04 80 02    	add    0x2800404(%ecx),%dl
 7f5:	88 02                	mov    %al,(%edx)
 7f7:	02 91 04 04 92 02    	add    0x2920404(%ecx),%dl
 7fd:	b6 02                	mov    $0x2,%dh
 7ff:	02 91 04 00 01 00    	add    0x10004(%ecx),%dl
	...
 80d:	00 00                	add    %al,(%eax)
 80f:	00 01                	add    %al,(%ecx)
 811:	01 01                	add    %eax,(%ecx)
 813:	00 00                	add    %al,(%eax)
 815:	04 1e                	add    $0x1e,%al
 817:	4f                   	dec    %edi
 818:	01 57 04             	add    %edx,0x4(%edi)
 81b:	4f                   	dec    %edi
 81c:	84 01                	test   %al,(%ecx)
 81e:	01 56 04             	add    %edx,0x4(%esi)
 821:	84 01                	test   %al,(%ecx)
 823:	9c                   	pushf
 824:	01 01                	add    %eax,(%ecx)
 826:	51                   	push   %ecx
 827:	04 9c                	add    $0x9c,%al
 829:	01 b1 01 01 56 04    	add    %esi,0x4560101(%ecx)
 82f:	b1 01                	mov    $0x1,%cl
 831:	b8 01 01 50 04       	mov    $0x4500101,%eax
 836:	b8 01 fd 01 01       	mov    $0x101fd01,%eax
 83b:	56                   	push   %esi
 83c:	04 80                	add    $0x80,%al
 83e:	02 80 02 01 57 04    	add    0x4570102(%eax),%al
 844:	80 02 88             	addb   $0x88,(%edx)
 847:	02 03                	add    (%ebx),%al
 849:	77 01                	ja     84c <_start-0x77b4>
 84b:	9f                   	lahf
 84c:	04 a5                	add    $0xa5,%al
 84e:	02 b6 02 01 57 00    	add    0x570102(%esi),%dh
 854:	02 00                	add    (%eax),%al
 856:	00 00                	add    %al,(%eax)
 858:	00 01                	add    %al,(%ecx)
 85a:	00 01                	add    %al,(%ecx)
 85c:	01 00                	add    %eax,(%eax)
 85e:	04 1e                	add    $0x1e,%al
 860:	48                   	dec    %eax
 861:	02 30                	add    (%eax),%dh
 863:	9f                   	lahf
 864:	04 48                	add    $0x48,%al
 866:	80 02 02             	addb   $0x2,(%edx)
 869:	91                   	xchg   %eax,%ecx
 86a:	68 04 80 02 88       	push   $0x88028004
 86f:	02 02                	add    (%edx),%al
 871:	30 9f 04 a5 02 a5    	xor    %bl,-0x5afd5afc(%edi)
 877:	02 02                	add    (%edx),%al
 879:	30 9f 04 a5 02 b6    	xor    %bl,-0x49fd5afc(%edi)
 87f:	02 02                	add    (%edx),%al
 881:	31 9f 00 00 00 00    	xor    %ebx,0x0(%edi)
 887:	01 01                	add    %eax,(%ecx)
 889:	00 00                	add    %al,(%eax)
 88b:	00 04 4f             	add    %al,(%edi,%ecx,2)
 88e:	84 01                	test   %al,(%ecx)
 890:	01 50 04             	add    %edx,0x4(%eax)
 893:	84 01                	test   %al,(%ecx)
 895:	9f                   	lahf
 896:	01 01                	add    %eax,(%ecx)
 898:	53                   	push   %ebx
 899:	04 9f                	add    $0x9f,%al
 89b:	01 a7 01 01 50 04    	add    %esp,0x4500101(%edi)
 8a1:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 8a2:	01 c1                	add    %eax,%ecx
 8a4:	01 0d 73 00 a8 26    	add    %ecx,0x26a80073
 8aa:	91                   	xchg   %eax,%ecx
 8ab:	08 06                	or     %al,(%esi)
 8ad:	a8 26                	test   $0x26,%al
 8af:	1b a8 00 9f 00 01    	sbb    0x1009f00(%eax),%ebp
 8b5:	00 00                	add    %al,(%eax)
 8b7:	00 04 bb             	add    %al,(%ebx,%edi,4)
 8ba:	01 c1                	add    %eax,%ecx
 8bc:	01 01                	add    %eax,(%ecx)
 8be:	57                   	push   %edi
 8bf:	04 c1                	add    $0xc1,%al
 8c1:	01 fb                	add    %edi,%ebx
 8c3:	01 01                	add    %eax,(%ecx)
 8c5:	50                   	push   %eax
 8c6:	00 02                	add    %al,(%edx)
 8c8:	00 00                	add    %al,(%eax)
 8ca:	00 00                	add    %al,(%eax)
 8cc:	01 01                	add    %eax,(%ecx)
 8ce:	00 04 bb             	add    %al,(%ebx,%edi,4)
 8d1:	01 c1                	add    %eax,%ecx
 8d3:	01 03                	add    %eax,(%ebx)
 8d5:	76 7f                	jbe    956 <_start-0x76aa>
 8d7:	9f                   	lahf
 8d8:	04 e0                	add    $0xe0,%al
 8da:	01 ec                	add    %ebp,%esp
 8dc:	01 01                	add    %eax,(%ecx)
 8de:	51                   	push   %ecx
 8df:	04 ec                	add    $0xec,%al
 8e1:	01 ef                	add    %ebp,%edi
 8e3:	01 03                	add    %eax,(%ebx)
 8e5:	71 01                	jno    8e8 <_start-0x7718>
 8e7:	9f                   	lahf
 8e8:	04 ef                	add    $0xef,%al
 8ea:	01 80 02 01 51 00    	add    %eax,0x510102(%eax)
 8f0:	00 00                	add    %al,(%eax)
 8f2:	00 00                	add    %al,(%eax)
 8f4:	00 00                	add    %al,(%eax)
 8f6:	04 4f                	add    $0x4f,%al
 8f8:	82 01 07             	addb   $0x7,(%ecx)
 8fb:	73 00                	jae    8fd <_start-0x7703>
 8fd:	91                   	xchg   %eax,%ecx
 8fe:	08 06                	or     %al,(%esi)
 900:	1d 9f 04 8b 01       	sbb    $0x18b049f,%eax
 905:	9c                   	pushf
 906:	01 01                	add    %eax,(%ecx)
 908:	52                   	push   %edx
 909:	04 9c                	add    $0x9c,%al
 90b:	01 c1                	add    %eax,%ecx
 90d:	01 07                	add    %eax,(%edi)
 90f:	73 00                	jae    911 <_start-0x76ef>
 911:	91                   	xchg   %eax,%ecx
 912:	08 06                	or     %al,(%esi)
 914:	1d 9f 00 00 00       	sbb    $0x9f,%eax
 919:	04 e3                	add    $0xe3,%al
 91b:	01 80 02 01 52 00    	add    %eax,0x520102(%eax)
 921:	28 00                	sub    %al,(%eax)
 923:	00 00                	add    %al,(%eax)
 925:	05 00 04 00 00       	add    $0x400,%eax
 92a:	00 00                	add    %al,(%eax)
 92c:	00 00                	add    %al,(%eax)
 92e:	00 00                	add    %al,(%eax)
 930:	00 04 00             	add    %al,(%eax,%eax,1)
 933:	19 02                	sbb    %eax,(%edx)
 935:	91                   	xchg   %eax,%ecx
 936:	00 04 19             	add    %al,(%ecx,%ebx,1)
 939:	1b 01                	sbb    (%ecx),%eax
 93b:	52                   	push   %edx
 93c:	00 02                	add    %al,(%edx)
 93e:	00 00                	add    %al,(%eax)
 940:	00 04 00             	add    %al,(%eax,%eax,1)
 943:	0d 02 30 9f 04       	or     $0x49f3002,%eax
 948:	10 19                	adc    %bl,(%ecx)
 94a:	01 50 00             	add    %edx,0x0(%eax)
