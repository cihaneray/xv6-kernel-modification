
_mprotectTest:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"

int main(int argc, char *argv[]) {
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	53                   	push   %ebx
    100e:	51                   	push   %ecx
  char *addr = malloc(4096);
    100f:	83 ec 0c             	sub    $0xc,%esp
    1012:	68 00 10 00 00       	push   $0x1000
    1017:	e8 34 07 00 00       	call   1750 <malloc>
  if (addr == 0) {
    101c:	83 c4 10             	add    $0x10,%esp
    101f:	85 c0                	test   %eax,%eax
    1021:	74 4c                	je     106f <main+0x6f>
    printf(1, "Error: malloc failed\n");
    exit();
  }
  printf(1, "Allocated page at address %p\n", addr);
    1023:	83 ec 04             	sub    $0x4,%esp
    1026:	89 c3                	mov    %eax,%ebx
    1028:	50                   	push   %eax
    1029:	68 5e 18 00 00       	push   $0x185e
    102e:	6a 01                	push   $0x1
    1030:	e8 eb 04 00 00       	call   1520 <printf>
  if (mprotect(addr, 1) < 0) {
    1035:	59                   	pop    %ecx
    1036:	58                   	pop    %eax
    1037:	6a 01                	push   $0x1
    1039:	53                   	push   %ebx
    103a:	e8 12 04 00 00       	call   1451 <mprotect>
    103f:	83 c4 10             	add    $0x10,%esp
    1042:	85 c0                	test   %eax,%eax
    1044:	78 16                	js     105c <main+0x5c>
    printf(1, "Error: mprotect failed\n");
    exit();
  }
  printf(1, "if a trap err occurred ----> mprotect test passed\n");
    1046:	50                   	push   %eax
    1047:	50                   	push   %eax
    1048:	68 94 18 00 00       	push   $0x1894
    104d:	6a 01                	push   $0x1
    104f:	e8 cc 04 00 00       	call   1520 <printf>
  addr[0] = 'A';
    1054:	c6 03 41             	movb   $0x41,(%ebx)
  exit();
    1057:	e8 2d 03 00 00       	call   1389 <exit>
    printf(1, "Error: mprotect failed\n");
    105c:	52                   	push   %edx
    105d:	52                   	push   %edx
    105e:	68 7c 18 00 00       	push   $0x187c
    1063:	6a 01                	push   $0x1
    1065:	e8 b6 04 00 00       	call   1520 <printf>
    exit();
    106a:	e8 1a 03 00 00       	call   1389 <exit>
    printf(1, "Error: malloc failed\n");
    106f:	50                   	push   %eax
    1070:	50                   	push   %eax
    1071:	68 48 18 00 00       	push   $0x1848
    1076:	6a 01                	push   $0x1
    1078:	e8 a3 04 00 00       	call   1520 <printf>
    exit();
    107d:	e8 07 03 00 00       	call   1389 <exit>
    1082:	66 90                	xchg   %ax,%ax
    1084:	66 90                	xchg   %ax,%ax
    1086:	66 90                	xchg   %ax,%ax
    1088:	66 90                	xchg   %ax,%ax
    108a:	66 90                	xchg   %ax,%ax
    108c:	66 90                	xchg   %ax,%ax
    108e:	66 90                	xchg   %ax,%ax

00001090 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    1090:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1091:	31 c0                	xor    %eax,%eax
{
    1093:	89 e5                	mov    %esp,%ebp
    1095:	53                   	push   %ebx
    1096:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1099:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    10a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    10a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    10a7:	83 c0 01             	add    $0x1,%eax
    10aa:	84 d2                	test   %dl,%dl
    10ac:	75 f2                	jne    10a0 <strcpy+0x10>
    ;
  return os;
}
    10ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10b1:	89 c8                	mov    %ecx,%eax
    10b3:	c9                   	leave  
    10b4:	c3                   	ret    
    10b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	53                   	push   %ebx
    10c4:	8b 55 08             	mov    0x8(%ebp),%edx
    10c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10ca:	0f b6 02             	movzbl (%edx),%eax
    10cd:	84 c0                	test   %al,%al
    10cf:	75 17                	jne    10e8 <strcmp+0x28>
    10d1:	eb 3a                	jmp    110d <strcmp+0x4d>
    10d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10d7:	90                   	nop
    10d8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    10dc:	83 c2 01             	add    $0x1,%edx
    10df:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10e2:	84 c0                	test   %al,%al
    10e4:	74 1a                	je     1100 <strcmp+0x40>
    p++, q++;
    10e6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    10e8:	0f b6 19             	movzbl (%ecx),%ebx
    10eb:	38 c3                	cmp    %al,%bl
    10ed:	74 e9                	je     10d8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    10ef:	29 d8                	sub    %ebx,%eax
}
    10f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10f4:	c9                   	leave  
    10f5:	c3                   	ret    
    10f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1100:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1104:	31 c0                	xor    %eax,%eax
    1106:	29 d8                	sub    %ebx,%eax
}
    1108:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    110b:	c9                   	leave  
    110c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    110d:	0f b6 19             	movzbl (%ecx),%ebx
    1110:	31 c0                	xor    %eax,%eax
    1112:	eb db                	jmp    10ef <strcmp+0x2f>
    1114:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    111f:	90                   	nop

00001120 <strlen>:

uint
strlen(const char *s)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1126:	80 3a 00             	cmpb   $0x0,(%edx)
    1129:	74 15                	je     1140 <strlen+0x20>
    112b:	31 c0                	xor    %eax,%eax
    112d:	8d 76 00             	lea    0x0(%esi),%esi
    1130:	83 c0 01             	add    $0x1,%eax
    1133:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1137:	89 c1                	mov    %eax,%ecx
    1139:	75 f5                	jne    1130 <strlen+0x10>
    ;
  return n;
}
    113b:	89 c8                	mov    %ecx,%eax
    113d:	5d                   	pop    %ebp
    113e:	c3                   	ret    
    113f:	90                   	nop
  for(n = 0; s[n]; n++)
    1140:	31 c9                	xor    %ecx,%ecx
}
    1142:	5d                   	pop    %ebp
    1143:	89 c8                	mov    %ecx,%eax
    1145:	c3                   	ret    
    1146:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    114d:	8d 76 00             	lea    0x0(%esi),%esi

00001150 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	57                   	push   %edi
    1154:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1157:	8b 4d 10             	mov    0x10(%ebp),%ecx
    115a:	8b 45 0c             	mov    0xc(%ebp),%eax
    115d:	89 d7                	mov    %edx,%edi
    115f:	fc                   	cld    
    1160:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1162:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1165:	89 d0                	mov    %edx,%eax
    1167:	c9                   	leave  
    1168:	c3                   	ret    
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001170 <strchr>:

char*
strchr(const char *s, char c)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	8b 45 08             	mov    0x8(%ebp),%eax
    1176:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    117a:	0f b6 10             	movzbl (%eax),%edx
    117d:	84 d2                	test   %dl,%dl
    117f:	75 12                	jne    1193 <strchr+0x23>
    1181:	eb 1d                	jmp    11a0 <strchr+0x30>
    1183:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1187:	90                   	nop
    1188:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    118c:	83 c0 01             	add    $0x1,%eax
    118f:	84 d2                	test   %dl,%dl
    1191:	74 0d                	je     11a0 <strchr+0x30>
    if(*s == c)
    1193:	38 d1                	cmp    %dl,%cl
    1195:	75 f1                	jne    1188 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1197:	5d                   	pop    %ebp
    1198:	c3                   	ret    
    1199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    11a0:	31 c0                	xor    %eax,%eax
}
    11a2:	5d                   	pop    %ebp
    11a3:	c3                   	ret    
    11a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11af:	90                   	nop

000011b0 <gets>:

char*
gets(char *buf, int max)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    11b5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    11b8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    11b9:	31 db                	xor    %ebx,%ebx
{
    11bb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    11be:	eb 27                	jmp    11e7 <gets+0x37>
    cc = read(0, &c, 1);
    11c0:	83 ec 04             	sub    $0x4,%esp
    11c3:	6a 01                	push   $0x1
    11c5:	57                   	push   %edi
    11c6:	6a 00                	push   $0x0
    11c8:	e8 d4 01 00 00       	call   13a1 <read>
    if(cc < 1)
    11cd:	83 c4 10             	add    $0x10,%esp
    11d0:	85 c0                	test   %eax,%eax
    11d2:	7e 1d                	jle    11f1 <gets+0x41>
      break;
    buf[i++] = c;
    11d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11d8:	8b 55 08             	mov    0x8(%ebp),%edx
    11db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11df:	3c 0a                	cmp    $0xa,%al
    11e1:	74 1d                	je     1200 <gets+0x50>
    11e3:	3c 0d                	cmp    $0xd,%al
    11e5:	74 19                	je     1200 <gets+0x50>
  for(i=0; i+1 < max; ){
    11e7:	89 de                	mov    %ebx,%esi
    11e9:	83 c3 01             	add    $0x1,%ebx
    11ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11ef:	7c cf                	jl     11c0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    11f1:	8b 45 08             	mov    0x8(%ebp),%eax
    11f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11fb:	5b                   	pop    %ebx
    11fc:	5e                   	pop    %esi
    11fd:	5f                   	pop    %edi
    11fe:	5d                   	pop    %ebp
    11ff:	c3                   	ret    
  buf[i] = '\0';
    1200:	8b 45 08             	mov    0x8(%ebp),%eax
    1203:	89 de                	mov    %ebx,%esi
    1205:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    1209:	8d 65 f4             	lea    -0xc(%ebp),%esp
    120c:	5b                   	pop    %ebx
    120d:	5e                   	pop    %esi
    120e:	5f                   	pop    %edi
    120f:	5d                   	pop    %ebp
    1210:	c3                   	ret    
    1211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1218:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    121f:	90                   	nop

00001220 <stat>:

int
stat(const char *n, struct stat *st)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	56                   	push   %esi
    1224:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1225:	83 ec 08             	sub    $0x8,%esp
    1228:	6a 00                	push   $0x0
    122a:	ff 75 08             	push   0x8(%ebp)
    122d:	e8 97 01 00 00       	call   13c9 <open>
  if(fd < 0)
    1232:	83 c4 10             	add    $0x10,%esp
    1235:	85 c0                	test   %eax,%eax
    1237:	78 27                	js     1260 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1239:	83 ec 08             	sub    $0x8,%esp
    123c:	ff 75 0c             	push   0xc(%ebp)
    123f:	89 c3                	mov    %eax,%ebx
    1241:	50                   	push   %eax
    1242:	e8 9a 01 00 00       	call   13e1 <fstat>
  close(fd);
    1247:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    124a:	89 c6                	mov    %eax,%esi
  close(fd);
    124c:	e8 60 01 00 00       	call   13b1 <close>
  return r;
    1251:	83 c4 10             	add    $0x10,%esp
}
    1254:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1257:	89 f0                	mov    %esi,%eax
    1259:	5b                   	pop    %ebx
    125a:	5e                   	pop    %esi
    125b:	5d                   	pop    %ebp
    125c:	c3                   	ret    
    125d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1260:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1265:	eb ed                	jmp    1254 <stat+0x34>
    1267:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    126e:	66 90                	xchg   %ax,%ax

00001270 <atoi>:

int
atoi(const char *s)
{
    1270:	55                   	push   %ebp
    1271:	89 e5                	mov    %esp,%ebp
    1273:	53                   	push   %ebx
    1274:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1277:	0f be 02             	movsbl (%edx),%eax
    127a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    127d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1280:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1285:	77 1e                	ja     12a5 <atoi+0x35>
    1287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    128e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1290:	83 c2 01             	add    $0x1,%edx
    1293:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1296:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    129a:	0f be 02             	movsbl (%edx),%eax
    129d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    12a0:	80 fb 09             	cmp    $0x9,%bl
    12a3:	76 eb                	jbe    1290 <atoi+0x20>
  return n;
}
    12a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    12a8:	89 c8                	mov    %ecx,%eax
    12aa:	c9                   	leave  
    12ab:	c3                   	ret    
    12ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	57                   	push   %edi
    12b4:	8b 45 10             	mov    0x10(%ebp),%eax
    12b7:	8b 55 08             	mov    0x8(%ebp),%edx
    12ba:	56                   	push   %esi
    12bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12be:	85 c0                	test   %eax,%eax
    12c0:	7e 13                	jle    12d5 <memmove+0x25>
    12c2:	01 d0                	add    %edx,%eax
  dst = vdst;
    12c4:	89 d7                	mov    %edx,%edi
    12c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12cd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12d1:	39 f8                	cmp    %edi,%eax
    12d3:	75 fb                	jne    12d0 <memmove+0x20>
  return vdst;
}
    12d5:	5e                   	pop    %esi
    12d6:	89 d0                	mov    %edx,%eax
    12d8:	5f                   	pop    %edi
    12d9:	5d                   	pop    %ebp
    12da:	c3                   	ret    
    12db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12df:	90                   	nop

000012e0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    12e0:	55                   	push   %ebp
    12e1:	89 e5                	mov    %esp,%ebp
    12e3:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    12e6:	68 00 10 00 00       	push   $0x1000
    12eb:	e8 60 04 00 00       	call   1750 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    12f0:	50                   	push   %eax
    12f1:	ff 75 10             	push   0x10(%ebp)
    12f4:	ff 75 0c             	push   0xc(%ebp)
    12f7:	ff 75 08             	push   0x8(%ebp)
    12fa:	e8 42 01 00 00       	call   1441 <clone>
}
    12ff:	c9                   	leave  
    1300:	c3                   	ret    
    1301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    130f:	90                   	nop

00001310 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    1310:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1311:	b9 01 00 00 00       	mov    $0x1,%ecx
    1316:	89 e5                	mov    %esp,%ebp
    1318:	8b 55 08             	mov    0x8(%ebp),%edx
    131b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    131f:	90                   	nop
    1320:	89 c8                	mov    %ecx,%eax
    1322:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    1325:	85 c0                	test   %eax,%eax
    1327:	75 f7                	jne    1320 <lock_acquire+0x10>
}
    1329:	5d                   	pop    %ebp
    132a:	c3                   	ret    
    132b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    132f:	90                   	nop

00001330 <lock_release>:

void lock_release(lock_thread *lock){
    1330:	55                   	push   %ebp
    1331:	31 c0                	xor    %eax,%eax
    1333:	89 e5                	mov    %esp,%ebp
    1335:	8b 55 08             	mov    0x8(%ebp),%edx
    1338:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    133b:	5d                   	pop    %ebp
    133c:	c3                   	ret    
    133d:	8d 76 00             	lea    0x0(%esi),%esi

00001340 <lock_init>:

int lock_init(lock_thread *lock)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    1346:	68 c7 18 00 00       	push   $0x18c7
    134b:	6a 01                	push   $0x1
    134d:	e8 ce 01 00 00       	call   1520 <printf>
  lock->locked = 0;
    1352:	8b 45 08             	mov    0x8(%ebp),%eax
    1355:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    135b:	58                   	pop    %eax
    135c:	5a                   	pop    %edx
    135d:	68 c7 18 00 00       	push   $0x18c7
    1362:	6a 01                	push   $0x1
    1364:	e8 b7 01 00 00       	call   1520 <printf>
  return 0;
}
    1369:	31 c0                	xor    %eax,%eax
    136b:	c9                   	leave  
    136c:	c3                   	ret    
    136d:	8d 76 00             	lea    0x0(%esi),%esi

00001370 <thread_join>:



int thread_join()
{
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    1376:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1379:	50                   	push   %eax
    137a:	e8 ca 00 00 00       	call   1449 <join>
  return a;
    137f:	c9                   	leave  
    1380:	c3                   	ret    

00001381 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1381:	b8 01 00 00 00       	mov    $0x1,%eax
    1386:	cd 40                	int    $0x40
    1388:	c3                   	ret    

00001389 <exit>:
SYSCALL(exit)
    1389:	b8 02 00 00 00       	mov    $0x2,%eax
    138e:	cd 40                	int    $0x40
    1390:	c3                   	ret    

00001391 <wait>:
SYSCALL(wait)
    1391:	b8 03 00 00 00       	mov    $0x3,%eax
    1396:	cd 40                	int    $0x40
    1398:	c3                   	ret    

00001399 <pipe>:
SYSCALL(pipe)
    1399:	b8 04 00 00 00       	mov    $0x4,%eax
    139e:	cd 40                	int    $0x40
    13a0:	c3                   	ret    

000013a1 <read>:
SYSCALL(read)
    13a1:	b8 05 00 00 00       	mov    $0x5,%eax
    13a6:	cd 40                	int    $0x40
    13a8:	c3                   	ret    

000013a9 <write>:
SYSCALL(write)
    13a9:	b8 10 00 00 00       	mov    $0x10,%eax
    13ae:	cd 40                	int    $0x40
    13b0:	c3                   	ret    

000013b1 <close>:
SYSCALL(close)
    13b1:	b8 15 00 00 00       	mov    $0x15,%eax
    13b6:	cd 40                	int    $0x40
    13b8:	c3                   	ret    

000013b9 <kill>:
SYSCALL(kill)
    13b9:	b8 06 00 00 00       	mov    $0x6,%eax
    13be:	cd 40                	int    $0x40
    13c0:	c3                   	ret    

000013c1 <exec>:
SYSCALL(exec)
    13c1:	b8 07 00 00 00       	mov    $0x7,%eax
    13c6:	cd 40                	int    $0x40
    13c8:	c3                   	ret    

000013c9 <open>:
SYSCALL(open)
    13c9:	b8 0f 00 00 00       	mov    $0xf,%eax
    13ce:	cd 40                	int    $0x40
    13d0:	c3                   	ret    

000013d1 <mknod>:
SYSCALL(mknod)
    13d1:	b8 11 00 00 00       	mov    $0x11,%eax
    13d6:	cd 40                	int    $0x40
    13d8:	c3                   	ret    

000013d9 <unlink>:
SYSCALL(unlink)
    13d9:	b8 12 00 00 00       	mov    $0x12,%eax
    13de:	cd 40                	int    $0x40
    13e0:	c3                   	ret    

000013e1 <fstat>:
SYSCALL(fstat)
    13e1:	b8 08 00 00 00       	mov    $0x8,%eax
    13e6:	cd 40                	int    $0x40
    13e8:	c3                   	ret    

000013e9 <link>:
SYSCALL(link)
    13e9:	b8 13 00 00 00       	mov    $0x13,%eax
    13ee:	cd 40                	int    $0x40
    13f0:	c3                   	ret    

000013f1 <mkdir>:
SYSCALL(mkdir)
    13f1:	b8 14 00 00 00       	mov    $0x14,%eax
    13f6:	cd 40                	int    $0x40
    13f8:	c3                   	ret    

000013f9 <chdir>:
SYSCALL(chdir)
    13f9:	b8 09 00 00 00       	mov    $0x9,%eax
    13fe:	cd 40                	int    $0x40
    1400:	c3                   	ret    

00001401 <dup>:
SYSCALL(dup)
    1401:	b8 0a 00 00 00       	mov    $0xa,%eax
    1406:	cd 40                	int    $0x40
    1408:	c3                   	ret    

00001409 <getpid>:
SYSCALL(getpid)
    1409:	b8 0b 00 00 00       	mov    $0xb,%eax
    140e:	cd 40                	int    $0x40
    1410:	c3                   	ret    

00001411 <sbrk>:
SYSCALL(sbrk)
    1411:	b8 0c 00 00 00       	mov    $0xc,%eax
    1416:	cd 40                	int    $0x40
    1418:	c3                   	ret    

00001419 <sleep>:
SYSCALL(sleep)
    1419:	b8 0d 00 00 00       	mov    $0xd,%eax
    141e:	cd 40                	int    $0x40
    1420:	c3                   	ret    

00001421 <uptime>:
SYSCALL(uptime)
    1421:	b8 0e 00 00 00       	mov    $0xe,%eax
    1426:	cd 40                	int    $0x40
    1428:	c3                   	ret    

00001429 <getreadcount>:
SYSCALL(getreadcount)
    1429:	b8 16 00 00 00       	mov    $0x16,%eax
    142e:	cd 40                	int    $0x40
    1430:	c3                   	ret    

00001431 <settickets>:
SYSCALL(settickets)
    1431:	b8 17 00 00 00       	mov    $0x17,%eax
    1436:	cd 40                	int    $0x40
    1438:	c3                   	ret    

00001439 <getpinfo>:
SYSCALL(getpinfo)
    1439:	b8 18 00 00 00       	mov    $0x18,%eax
    143e:	cd 40                	int    $0x40
    1440:	c3                   	ret    

00001441 <clone>:
SYSCALL(clone)
    1441:	b8 19 00 00 00       	mov    $0x19,%eax
    1446:	cd 40                	int    $0x40
    1448:	c3                   	ret    

00001449 <join>:
SYSCALL(join)
    1449:	b8 1a 00 00 00       	mov    $0x1a,%eax
    144e:	cd 40                	int    $0x40
    1450:	c3                   	ret    

00001451 <mprotect>:
SYSCALL(mprotect)
    1451:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1456:	cd 40                	int    $0x40
    1458:	c3                   	ret    

00001459 <munprotect>:
SYSCALL(munprotect)
    1459:	b8 1c 00 00 00       	mov    $0x1c,%eax
    145e:	cd 40                	int    $0x40
    1460:	c3                   	ret    
    1461:	66 90                	xchg   %ax,%ax
    1463:	66 90                	xchg   %ax,%ax
    1465:	66 90                	xchg   %ax,%ax
    1467:	66 90                	xchg   %ax,%ax
    1469:	66 90                	xchg   %ax,%ax
    146b:	66 90                	xchg   %ax,%ax
    146d:	66 90                	xchg   %ax,%ax
    146f:	90                   	nop

00001470 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	57                   	push   %edi
    1474:	56                   	push   %esi
    1475:	53                   	push   %ebx
    1476:	83 ec 3c             	sub    $0x3c,%esp
    1479:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    147c:	89 d1                	mov    %edx,%ecx
{
    147e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1481:	85 d2                	test   %edx,%edx
    1483:	0f 89 7f 00 00 00    	jns    1508 <printint+0x98>
    1489:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    148d:	74 79                	je     1508 <printint+0x98>
    neg = 1;
    148f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1496:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1498:	31 db                	xor    %ebx,%ebx
    149a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    149d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    14a0:	89 c8                	mov    %ecx,%eax
    14a2:	31 d2                	xor    %edx,%edx
    14a4:	89 cf                	mov    %ecx,%edi
    14a6:	f7 75 c4             	divl   -0x3c(%ebp)
    14a9:	0f b6 92 2c 19 00 00 	movzbl 0x192c(%edx),%edx
    14b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    14b3:	89 d8                	mov    %ebx,%eax
    14b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    14b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    14bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    14be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    14c1:	76 dd                	jbe    14a0 <printint+0x30>
  if(neg)
    14c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    14c6:	85 c9                	test   %ecx,%ecx
    14c8:	74 0c                	je     14d6 <printint+0x66>
    buf[i++] = '-';
    14ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    14cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    14d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    14d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    14d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    14dd:	eb 07                	jmp    14e6 <printint+0x76>
    14df:	90                   	nop
    putc(fd, buf[i]);
    14e0:	0f b6 13             	movzbl (%ebx),%edx
    14e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    14e6:	83 ec 04             	sub    $0x4,%esp
    14e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    14ec:	6a 01                	push   $0x1
    14ee:	56                   	push   %esi
    14ef:	57                   	push   %edi
    14f0:	e8 b4 fe ff ff       	call   13a9 <write>
  while(--i >= 0)
    14f5:	83 c4 10             	add    $0x10,%esp
    14f8:	39 de                	cmp    %ebx,%esi
    14fa:	75 e4                	jne    14e0 <printint+0x70>
}
    14fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14ff:	5b                   	pop    %ebx
    1500:	5e                   	pop    %esi
    1501:	5f                   	pop    %edi
    1502:	5d                   	pop    %ebp
    1503:	c3                   	ret    
    1504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1508:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    150f:	eb 87                	jmp    1498 <printint+0x28>
    1511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1518:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    151f:	90                   	nop

00001520 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1520:	55                   	push   %ebp
    1521:	89 e5                	mov    %esp,%ebp
    1523:	57                   	push   %edi
    1524:	56                   	push   %esi
    1525:	53                   	push   %ebx
    1526:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1529:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    152c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    152f:	0f b6 13             	movzbl (%ebx),%edx
    1532:	84 d2                	test   %dl,%dl
    1534:	74 6a                	je     15a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1536:	8d 45 10             	lea    0x10(%ebp),%eax
    1539:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    153c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    153f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1541:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1544:	eb 36                	jmp    157c <printf+0x5c>
    1546:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    154d:	8d 76 00             	lea    0x0(%esi),%esi
    1550:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1553:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1558:	83 f8 25             	cmp    $0x25,%eax
    155b:	74 15                	je     1572 <printf+0x52>
  write(fd, &c, 1);
    155d:	83 ec 04             	sub    $0x4,%esp
    1560:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1563:	6a 01                	push   $0x1
    1565:	57                   	push   %edi
    1566:	56                   	push   %esi
    1567:	e8 3d fe ff ff       	call   13a9 <write>
    156c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    156f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1572:	0f b6 13             	movzbl (%ebx),%edx
    1575:	83 c3 01             	add    $0x1,%ebx
    1578:	84 d2                	test   %dl,%dl
    157a:	74 24                	je     15a0 <printf+0x80>
    c = fmt[i] & 0xff;
    157c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    157f:	85 c9                	test   %ecx,%ecx
    1581:	74 cd                	je     1550 <printf+0x30>
      }
    } else if(state == '%'){
    1583:	83 f9 25             	cmp    $0x25,%ecx
    1586:	75 ea                	jne    1572 <printf+0x52>
      if(c == 'd'){
    1588:	83 f8 25             	cmp    $0x25,%eax
    158b:	0f 84 07 01 00 00    	je     1698 <printf+0x178>
    1591:	83 e8 63             	sub    $0x63,%eax
    1594:	83 f8 15             	cmp    $0x15,%eax
    1597:	77 17                	ja     15b0 <printf+0x90>
    1599:	ff 24 85 d4 18 00 00 	jmp    *0x18d4(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    15a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15a3:	5b                   	pop    %ebx
    15a4:	5e                   	pop    %esi
    15a5:	5f                   	pop    %edi
    15a6:	5d                   	pop    %ebp
    15a7:	c3                   	ret    
    15a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15af:	90                   	nop
  write(fd, &c, 1);
    15b0:	83 ec 04             	sub    $0x4,%esp
    15b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    15b6:	6a 01                	push   $0x1
    15b8:	57                   	push   %edi
    15b9:	56                   	push   %esi
    15ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    15be:	e8 e6 fd ff ff       	call   13a9 <write>
        putc(fd, c);
    15c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    15c7:	83 c4 0c             	add    $0xc,%esp
    15ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
    15cd:	6a 01                	push   $0x1
    15cf:	57                   	push   %edi
    15d0:	56                   	push   %esi
    15d1:	e8 d3 fd ff ff       	call   13a9 <write>
        putc(fd, c);
    15d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15d9:	31 c9                	xor    %ecx,%ecx
    15db:	eb 95                	jmp    1572 <printf+0x52>
    15dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    15e0:	83 ec 0c             	sub    $0xc,%esp
    15e3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15e8:	6a 00                	push   $0x0
    15ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15ed:	8b 10                	mov    (%eax),%edx
    15ef:	89 f0                	mov    %esi,%eax
    15f1:	e8 7a fe ff ff       	call   1470 <printint>
        ap++;
    15f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    15fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15fd:	31 c9                	xor    %ecx,%ecx
    15ff:	e9 6e ff ff ff       	jmp    1572 <printf+0x52>
    1604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1608:	8b 45 d0             	mov    -0x30(%ebp),%eax
    160b:	8b 10                	mov    (%eax),%edx
        ap++;
    160d:	83 c0 04             	add    $0x4,%eax
    1610:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1613:	85 d2                	test   %edx,%edx
    1615:	0f 84 8d 00 00 00    	je     16a8 <printf+0x188>
        while(*s != 0){
    161b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    161e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1620:	84 c0                	test   %al,%al
    1622:	0f 84 4a ff ff ff    	je     1572 <printf+0x52>
    1628:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    162b:	89 d3                	mov    %edx,%ebx
    162d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1630:	83 ec 04             	sub    $0x4,%esp
          s++;
    1633:	83 c3 01             	add    $0x1,%ebx
    1636:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1639:	6a 01                	push   $0x1
    163b:	57                   	push   %edi
    163c:	56                   	push   %esi
    163d:	e8 67 fd ff ff       	call   13a9 <write>
        while(*s != 0){
    1642:	0f b6 03             	movzbl (%ebx),%eax
    1645:	83 c4 10             	add    $0x10,%esp
    1648:	84 c0                	test   %al,%al
    164a:	75 e4                	jne    1630 <printf+0x110>
      state = 0;
    164c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    164f:	31 c9                	xor    %ecx,%ecx
    1651:	e9 1c ff ff ff       	jmp    1572 <printf+0x52>
    1656:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    165d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1660:	83 ec 0c             	sub    $0xc,%esp
    1663:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1668:	6a 01                	push   $0x1
    166a:	e9 7b ff ff ff       	jmp    15ea <printf+0xca>
    166f:	90                   	nop
        putc(fd, *ap);
    1670:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1673:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1676:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1678:	6a 01                	push   $0x1
    167a:	57                   	push   %edi
    167b:	56                   	push   %esi
        putc(fd, *ap);
    167c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    167f:	e8 25 fd ff ff       	call   13a9 <write>
        ap++;
    1684:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1688:	83 c4 10             	add    $0x10,%esp
      state = 0;
    168b:	31 c9                	xor    %ecx,%ecx
    168d:	e9 e0 fe ff ff       	jmp    1572 <printf+0x52>
    1692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1698:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    169b:	83 ec 04             	sub    $0x4,%esp
    169e:	e9 2a ff ff ff       	jmp    15cd <printf+0xad>
    16a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16a7:	90                   	nop
          s = "(null)";
    16a8:	ba ca 18 00 00       	mov    $0x18ca,%edx
        while(*s != 0){
    16ad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    16b0:	b8 28 00 00 00       	mov    $0x28,%eax
    16b5:	89 d3                	mov    %edx,%ebx
    16b7:	e9 74 ff ff ff       	jmp    1630 <printf+0x110>
    16bc:	66 90                	xchg   %ax,%ax
    16be:	66 90                	xchg   %ax,%ax

000016c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16c1:	a1 78 1c 00 00       	mov    0x1c78,%eax
{
    16c6:	89 e5                	mov    %esp,%ebp
    16c8:	57                   	push   %edi
    16c9:	56                   	push   %esi
    16ca:	53                   	push   %ebx
    16cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    16ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16d8:	89 c2                	mov    %eax,%edx
    16da:	8b 00                	mov    (%eax),%eax
    16dc:	39 ca                	cmp    %ecx,%edx
    16de:	73 30                	jae    1710 <free+0x50>
    16e0:	39 c1                	cmp    %eax,%ecx
    16e2:	72 04                	jb     16e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16e4:	39 c2                	cmp    %eax,%edx
    16e6:	72 f0                	jb     16d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16ee:	39 f8                	cmp    %edi,%eax
    16f0:	74 30                	je     1722 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    16f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    16f5:	8b 42 04             	mov    0x4(%edx),%eax
    16f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    16fb:	39 f1                	cmp    %esi,%ecx
    16fd:	74 3a                	je     1739 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    16ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1701:	5b                   	pop    %ebx
  freep = p;
    1702:	89 15 78 1c 00 00    	mov    %edx,0x1c78
}
    1708:	5e                   	pop    %esi
    1709:	5f                   	pop    %edi
    170a:	5d                   	pop    %ebp
    170b:	c3                   	ret    
    170c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1710:	39 c2                	cmp    %eax,%edx
    1712:	72 c4                	jb     16d8 <free+0x18>
    1714:	39 c1                	cmp    %eax,%ecx
    1716:	73 c0                	jae    16d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1718:	8b 73 fc             	mov    -0x4(%ebx),%esi
    171b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    171e:	39 f8                	cmp    %edi,%eax
    1720:	75 d0                	jne    16f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1722:	03 70 04             	add    0x4(%eax),%esi
    1725:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1728:	8b 02                	mov    (%edx),%eax
    172a:	8b 00                	mov    (%eax),%eax
    172c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    172f:	8b 42 04             	mov    0x4(%edx),%eax
    1732:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1735:	39 f1                	cmp    %esi,%ecx
    1737:	75 c6                	jne    16ff <free+0x3f>
    p->s.size += bp->s.size;
    1739:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    173c:	89 15 78 1c 00 00    	mov    %edx,0x1c78
    p->s.size += bp->s.size;
    1742:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1745:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1748:	89 0a                	mov    %ecx,(%edx)
}
    174a:	5b                   	pop    %ebx
    174b:	5e                   	pop    %esi
    174c:	5f                   	pop    %edi
    174d:	5d                   	pop    %ebp
    174e:	c3                   	ret    
    174f:	90                   	nop

00001750 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1750:	55                   	push   %ebp
    1751:	89 e5                	mov    %esp,%ebp
    1753:	57                   	push   %edi
    1754:	56                   	push   %esi
    1755:	53                   	push   %ebx
    1756:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1759:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    175c:	8b 3d 78 1c 00 00    	mov    0x1c78,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1762:	8d 70 07             	lea    0x7(%eax),%esi
    1765:	c1 ee 03             	shr    $0x3,%esi
    1768:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    176b:	85 ff                	test   %edi,%edi
    176d:	0f 84 9d 00 00 00    	je     1810 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1773:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1775:	8b 4a 04             	mov    0x4(%edx),%ecx
    1778:	39 f1                	cmp    %esi,%ecx
    177a:	73 6a                	jae    17e6 <malloc+0x96>
    177c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1781:	39 de                	cmp    %ebx,%esi
    1783:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1786:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    178d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1790:	eb 17                	jmp    17a9 <malloc+0x59>
    1792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1798:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    179a:	8b 48 04             	mov    0x4(%eax),%ecx
    179d:	39 f1                	cmp    %esi,%ecx
    179f:	73 4f                	jae    17f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    17a1:	8b 3d 78 1c 00 00    	mov    0x1c78,%edi
    17a7:	89 c2                	mov    %eax,%edx
    17a9:	39 d7                	cmp    %edx,%edi
    17ab:	75 eb                	jne    1798 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    17ad:	83 ec 0c             	sub    $0xc,%esp
    17b0:	ff 75 e4             	push   -0x1c(%ebp)
    17b3:	e8 59 fc ff ff       	call   1411 <sbrk>
  if(p == (char*)-1)
    17b8:	83 c4 10             	add    $0x10,%esp
    17bb:	83 f8 ff             	cmp    $0xffffffff,%eax
    17be:	74 1c                	je     17dc <malloc+0x8c>
  hp->s.size = nu;
    17c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    17c3:	83 ec 0c             	sub    $0xc,%esp
    17c6:	83 c0 08             	add    $0x8,%eax
    17c9:	50                   	push   %eax
    17ca:	e8 f1 fe ff ff       	call   16c0 <free>
  return freep;
    17cf:	8b 15 78 1c 00 00    	mov    0x1c78,%edx
      if((p = morecore(nunits)) == 0)
    17d5:	83 c4 10             	add    $0x10,%esp
    17d8:	85 d2                	test   %edx,%edx
    17da:	75 bc                	jne    1798 <malloc+0x48>
        return 0;
  }
}
    17dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    17df:	31 c0                	xor    %eax,%eax
}
    17e1:	5b                   	pop    %ebx
    17e2:	5e                   	pop    %esi
    17e3:	5f                   	pop    %edi
    17e4:	5d                   	pop    %ebp
    17e5:	c3                   	ret    
    if(p->s.size >= nunits){
    17e6:	89 d0                	mov    %edx,%eax
    17e8:	89 fa                	mov    %edi,%edx
    17ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    17f0:	39 ce                	cmp    %ecx,%esi
    17f2:	74 4c                	je     1840 <malloc+0xf0>
        p->s.size -= nunits;
    17f4:	29 f1                	sub    %esi,%ecx
    17f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    17f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    17fc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    17ff:	89 15 78 1c 00 00    	mov    %edx,0x1c78
}
    1805:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1808:	83 c0 08             	add    $0x8,%eax
}
    180b:	5b                   	pop    %ebx
    180c:	5e                   	pop    %esi
    180d:	5f                   	pop    %edi
    180e:	5d                   	pop    %ebp
    180f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1810:	c7 05 78 1c 00 00 7c 	movl   $0x1c7c,0x1c78
    1817:	1c 00 00 
    base.s.size = 0;
    181a:	bf 7c 1c 00 00       	mov    $0x1c7c,%edi
    base.s.ptr = freep = prevp = &base;
    181f:	c7 05 7c 1c 00 00 7c 	movl   $0x1c7c,0x1c7c
    1826:	1c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1829:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    182b:	c7 05 80 1c 00 00 00 	movl   $0x0,0x1c80
    1832:	00 00 00 
    if(p->s.size >= nunits){
    1835:	e9 42 ff ff ff       	jmp    177c <malloc+0x2c>
    183a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1840:	8b 08                	mov    (%eax),%ecx
    1842:	89 0a                	mov    %ecx,(%edx)
    1844:	eb b9                	jmp    17ff <malloc+0xaf>
