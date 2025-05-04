
_echo:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	83 ec 08             	sub    $0x8,%esp
    1014:	8b 31                	mov    (%ecx),%esi
    1016:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
    1019:	83 fe 01             	cmp    $0x1,%esi
    101c:	7e 47                	jle    1065 <main+0x65>
    101e:	bb 01 00 00 00       	mov    $0x1,%ebx
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
    1023:	83 c3 01             	add    $0x1,%ebx
    1026:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
    102a:	39 f3                	cmp    %esi,%ebx
    102c:	74 22                	je     1050 <main+0x50>
    102e:	66 90                	xchg   %ax,%ax
    1030:	68 28 18 00 00       	push   $0x1828
    1035:	83 c3 01             	add    $0x1,%ebx
    1038:	50                   	push   %eax
    1039:	68 2a 18 00 00       	push   $0x182a
    103e:	6a 01                	push   $0x1
    1040:	e8 bb 04 00 00       	call   1500 <printf>
    1045:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
    1049:	83 c4 10             	add    $0x10,%esp
    104c:	39 f3                	cmp    %esi,%ebx
    104e:	75 e0                	jne    1030 <main+0x30>
    1050:	68 2f 18 00 00       	push   $0x182f
    1055:	50                   	push   %eax
    1056:	68 2a 18 00 00       	push   $0x182a
    105b:	6a 01                	push   $0x1
    105d:	e8 9e 04 00 00       	call   1500 <printf>
    1062:	83 c4 10             	add    $0x10,%esp
  exit();
    1065:	e8 ff 02 00 00       	call   1369 <exit>
    106a:	66 90                	xchg   %ax,%ax
    106c:	66 90                	xchg   %ax,%ax
    106e:	66 90                	xchg   %ax,%ax

00001070 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    1070:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1071:	31 c0                	xor    %eax,%eax
{
    1073:	89 e5                	mov    %esp,%ebp
    1075:	53                   	push   %ebx
    1076:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1079:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    107c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1080:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1084:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1087:	83 c0 01             	add    $0x1,%eax
    108a:	84 d2                	test   %dl,%dl
    108c:	75 f2                	jne    1080 <strcpy+0x10>
    ;
  return os;
}
    108e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1091:	89 c8                	mov    %ecx,%eax
    1093:	c9                   	leave  
    1094:	c3                   	ret    
    1095:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	53                   	push   %ebx
    10a4:	8b 55 08             	mov    0x8(%ebp),%edx
    10a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10aa:	0f b6 02             	movzbl (%edx),%eax
    10ad:	84 c0                	test   %al,%al
    10af:	75 17                	jne    10c8 <strcmp+0x28>
    10b1:	eb 3a                	jmp    10ed <strcmp+0x4d>
    10b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10b7:	90                   	nop
    10b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    10bc:	83 c2 01             	add    $0x1,%edx
    10bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10c2:	84 c0                	test   %al,%al
    10c4:	74 1a                	je     10e0 <strcmp+0x40>
    p++, q++;
    10c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    10c8:	0f b6 19             	movzbl (%ecx),%ebx
    10cb:	38 c3                	cmp    %al,%bl
    10cd:	74 e9                	je     10b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    10cf:	29 d8                	sub    %ebx,%eax
}
    10d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10d4:	c9                   	leave  
    10d5:	c3                   	ret    
    10d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    10e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10e4:	31 c0                	xor    %eax,%eax
    10e6:	29 d8                	sub    %ebx,%eax
}
    10e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10eb:	c9                   	leave  
    10ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    10ed:	0f b6 19             	movzbl (%ecx),%ebx
    10f0:	31 c0                	xor    %eax,%eax
    10f2:	eb db                	jmp    10cf <strcmp+0x2f>
    10f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10ff:	90                   	nop

00001100 <strlen>:

uint
strlen(const char *s)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1106:	80 3a 00             	cmpb   $0x0,(%edx)
    1109:	74 15                	je     1120 <strlen+0x20>
    110b:	31 c0                	xor    %eax,%eax
    110d:	8d 76 00             	lea    0x0(%esi),%esi
    1110:	83 c0 01             	add    $0x1,%eax
    1113:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1117:	89 c1                	mov    %eax,%ecx
    1119:	75 f5                	jne    1110 <strlen+0x10>
    ;
  return n;
}
    111b:	89 c8                	mov    %ecx,%eax
    111d:	5d                   	pop    %ebp
    111e:	c3                   	ret    
    111f:	90                   	nop
  for(n = 0; s[n]; n++)
    1120:	31 c9                	xor    %ecx,%ecx
}
    1122:	5d                   	pop    %ebp
    1123:	89 c8                	mov    %ecx,%eax
    1125:	c3                   	ret    
    1126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    112d:	8d 76 00             	lea    0x0(%esi),%esi

00001130 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	57                   	push   %edi
    1134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1137:	8b 4d 10             	mov    0x10(%ebp),%ecx
    113a:	8b 45 0c             	mov    0xc(%ebp),%eax
    113d:	89 d7                	mov    %edx,%edi
    113f:	fc                   	cld    
    1140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1142:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1145:	89 d0                	mov    %edx,%eax
    1147:	c9                   	leave  
    1148:	c3                   	ret    
    1149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001150 <strchr>:

char*
strchr(const char *s, char c)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	8b 45 08             	mov    0x8(%ebp),%eax
    1156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    115a:	0f b6 10             	movzbl (%eax),%edx
    115d:	84 d2                	test   %dl,%dl
    115f:	75 12                	jne    1173 <strchr+0x23>
    1161:	eb 1d                	jmp    1180 <strchr+0x30>
    1163:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1167:	90                   	nop
    1168:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    116c:	83 c0 01             	add    $0x1,%eax
    116f:	84 d2                	test   %dl,%dl
    1171:	74 0d                	je     1180 <strchr+0x30>
    if(*s == c)
    1173:	38 d1                	cmp    %dl,%cl
    1175:	75 f1                	jne    1168 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1177:	5d                   	pop    %ebp
    1178:	c3                   	ret    
    1179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1180:	31 c0                	xor    %eax,%eax
}
    1182:	5d                   	pop    %ebp
    1183:	c3                   	ret    
    1184:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    118b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    118f:	90                   	nop

00001190 <gets>:

char*
gets(char *buf, int max)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	57                   	push   %edi
    1194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1195:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1198:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1199:	31 db                	xor    %ebx,%ebx
{
    119b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    119e:	eb 27                	jmp    11c7 <gets+0x37>
    cc = read(0, &c, 1);
    11a0:	83 ec 04             	sub    $0x4,%esp
    11a3:	6a 01                	push   $0x1
    11a5:	57                   	push   %edi
    11a6:	6a 00                	push   $0x0
    11a8:	e8 d4 01 00 00       	call   1381 <read>
    if(cc < 1)
    11ad:	83 c4 10             	add    $0x10,%esp
    11b0:	85 c0                	test   %eax,%eax
    11b2:	7e 1d                	jle    11d1 <gets+0x41>
      break;
    buf[i++] = c;
    11b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11b8:	8b 55 08             	mov    0x8(%ebp),%edx
    11bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11bf:	3c 0a                	cmp    $0xa,%al
    11c1:	74 1d                	je     11e0 <gets+0x50>
    11c3:	3c 0d                	cmp    $0xd,%al
    11c5:	74 19                	je     11e0 <gets+0x50>
  for(i=0; i+1 < max; ){
    11c7:	89 de                	mov    %ebx,%esi
    11c9:	83 c3 01             	add    $0x1,%ebx
    11cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11cf:	7c cf                	jl     11a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    11d1:	8b 45 08             	mov    0x8(%ebp),%eax
    11d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11db:	5b                   	pop    %ebx
    11dc:	5e                   	pop    %esi
    11dd:	5f                   	pop    %edi
    11de:	5d                   	pop    %ebp
    11df:	c3                   	ret    
  buf[i] = '\0';
    11e0:	8b 45 08             	mov    0x8(%ebp),%eax
    11e3:	89 de                	mov    %ebx,%esi
    11e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    11e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11ec:	5b                   	pop    %ebx
    11ed:	5e                   	pop    %esi
    11ee:	5f                   	pop    %edi
    11ef:	5d                   	pop    %ebp
    11f0:	c3                   	ret    
    11f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ff:	90                   	nop

00001200 <stat>:

int
stat(const char *n, struct stat *st)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	56                   	push   %esi
    1204:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1205:	83 ec 08             	sub    $0x8,%esp
    1208:	6a 00                	push   $0x0
    120a:	ff 75 08             	push   0x8(%ebp)
    120d:	e8 97 01 00 00       	call   13a9 <open>
  if(fd < 0)
    1212:	83 c4 10             	add    $0x10,%esp
    1215:	85 c0                	test   %eax,%eax
    1217:	78 27                	js     1240 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1219:	83 ec 08             	sub    $0x8,%esp
    121c:	ff 75 0c             	push   0xc(%ebp)
    121f:	89 c3                	mov    %eax,%ebx
    1221:	50                   	push   %eax
    1222:	e8 9a 01 00 00       	call   13c1 <fstat>
  close(fd);
    1227:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    122a:	89 c6                	mov    %eax,%esi
  close(fd);
    122c:	e8 60 01 00 00       	call   1391 <close>
  return r;
    1231:	83 c4 10             	add    $0x10,%esp
}
    1234:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1237:	89 f0                	mov    %esi,%eax
    1239:	5b                   	pop    %ebx
    123a:	5e                   	pop    %esi
    123b:	5d                   	pop    %ebp
    123c:	c3                   	ret    
    123d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1240:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1245:	eb ed                	jmp    1234 <stat+0x34>
    1247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    124e:	66 90                	xchg   %ax,%ax

00001250 <atoi>:

int
atoi(const char *s)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	53                   	push   %ebx
    1254:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1257:	0f be 02             	movsbl (%edx),%eax
    125a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    125d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1260:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1265:	77 1e                	ja     1285 <atoi+0x35>
    1267:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    126e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1270:	83 c2 01             	add    $0x1,%edx
    1273:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1276:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    127a:	0f be 02             	movsbl (%edx),%eax
    127d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1280:	80 fb 09             	cmp    $0x9,%bl
    1283:	76 eb                	jbe    1270 <atoi+0x20>
  return n;
}
    1285:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1288:	89 c8                	mov    %ecx,%eax
    128a:	c9                   	leave  
    128b:	c3                   	ret    
    128c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	57                   	push   %edi
    1294:	8b 45 10             	mov    0x10(%ebp),%eax
    1297:	8b 55 08             	mov    0x8(%ebp),%edx
    129a:	56                   	push   %esi
    129b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    129e:	85 c0                	test   %eax,%eax
    12a0:	7e 13                	jle    12b5 <memmove+0x25>
    12a2:	01 d0                	add    %edx,%eax
  dst = vdst;
    12a4:	89 d7                	mov    %edx,%edi
    12a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12b1:	39 f8                	cmp    %edi,%eax
    12b3:	75 fb                	jne    12b0 <memmove+0x20>
  return vdst;
}
    12b5:	5e                   	pop    %esi
    12b6:	89 d0                	mov    %edx,%eax
    12b8:	5f                   	pop    %edi
    12b9:	5d                   	pop    %ebp
    12ba:	c3                   	ret    
    12bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12bf:	90                   	nop

000012c0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    12c0:	55                   	push   %ebp
    12c1:	89 e5                	mov    %esp,%ebp
    12c3:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    12c6:	68 00 10 00 00       	push   $0x1000
    12cb:	e8 60 04 00 00       	call   1730 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    12d0:	50                   	push   %eax
    12d1:	ff 75 10             	push   0x10(%ebp)
    12d4:	ff 75 0c             	push   0xc(%ebp)
    12d7:	ff 75 08             	push   0x8(%ebp)
    12da:	e8 42 01 00 00       	call   1421 <clone>
}
    12df:	c9                   	leave  
    12e0:	c3                   	ret    
    12e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ef:	90                   	nop

000012f0 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    12f0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    12f1:	b9 01 00 00 00       	mov    $0x1,%ecx
    12f6:	89 e5                	mov    %esp,%ebp
    12f8:	8b 55 08             	mov    0x8(%ebp),%edx
    12fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12ff:	90                   	nop
    1300:	89 c8                	mov    %ecx,%eax
    1302:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    1305:	85 c0                	test   %eax,%eax
    1307:	75 f7                	jne    1300 <lock_acquire+0x10>
}
    1309:	5d                   	pop    %ebp
    130a:	c3                   	ret    
    130b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    130f:	90                   	nop

00001310 <lock_release>:

void lock_release(lock_thread *lock){
    1310:	55                   	push   %ebp
    1311:	31 c0                	xor    %eax,%eax
    1313:	89 e5                	mov    %esp,%ebp
    1315:	8b 55 08             	mov    0x8(%ebp),%edx
    1318:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    131b:	5d                   	pop    %ebp
    131c:	c3                   	ret    
    131d:	8d 76 00             	lea    0x0(%esi),%esi

00001320 <lock_init>:

int lock_init(lock_thread *lock)
{
    1320:	55                   	push   %ebp
    1321:	89 e5                	mov    %esp,%ebp
    1323:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    1326:	68 31 18 00 00       	push   $0x1831
    132b:	6a 01                	push   $0x1
    132d:	e8 ce 01 00 00       	call   1500 <printf>
  lock->locked = 0;
    1332:	8b 45 08             	mov    0x8(%ebp),%eax
    1335:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    133b:	58                   	pop    %eax
    133c:	5a                   	pop    %edx
    133d:	68 31 18 00 00       	push   $0x1831
    1342:	6a 01                	push   $0x1
    1344:	e8 b7 01 00 00       	call   1500 <printf>
  return 0;
}
    1349:	31 c0                	xor    %eax,%eax
    134b:	c9                   	leave  
    134c:	c3                   	ret    
    134d:	8d 76 00             	lea    0x0(%esi),%esi

00001350 <thread_join>:



int thread_join()
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    1356:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1359:	50                   	push   %eax
    135a:	e8 ca 00 00 00       	call   1429 <join>
  return a;
    135f:	c9                   	leave  
    1360:	c3                   	ret    

00001361 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1361:	b8 01 00 00 00       	mov    $0x1,%eax
    1366:	cd 40                	int    $0x40
    1368:	c3                   	ret    

00001369 <exit>:
SYSCALL(exit)
    1369:	b8 02 00 00 00       	mov    $0x2,%eax
    136e:	cd 40                	int    $0x40
    1370:	c3                   	ret    

00001371 <wait>:
SYSCALL(wait)
    1371:	b8 03 00 00 00       	mov    $0x3,%eax
    1376:	cd 40                	int    $0x40
    1378:	c3                   	ret    

00001379 <pipe>:
SYSCALL(pipe)
    1379:	b8 04 00 00 00       	mov    $0x4,%eax
    137e:	cd 40                	int    $0x40
    1380:	c3                   	ret    

00001381 <read>:
SYSCALL(read)
    1381:	b8 05 00 00 00       	mov    $0x5,%eax
    1386:	cd 40                	int    $0x40
    1388:	c3                   	ret    

00001389 <write>:
SYSCALL(write)
    1389:	b8 10 00 00 00       	mov    $0x10,%eax
    138e:	cd 40                	int    $0x40
    1390:	c3                   	ret    

00001391 <close>:
SYSCALL(close)
    1391:	b8 15 00 00 00       	mov    $0x15,%eax
    1396:	cd 40                	int    $0x40
    1398:	c3                   	ret    

00001399 <kill>:
SYSCALL(kill)
    1399:	b8 06 00 00 00       	mov    $0x6,%eax
    139e:	cd 40                	int    $0x40
    13a0:	c3                   	ret    

000013a1 <exec>:
SYSCALL(exec)
    13a1:	b8 07 00 00 00       	mov    $0x7,%eax
    13a6:	cd 40                	int    $0x40
    13a8:	c3                   	ret    

000013a9 <open>:
SYSCALL(open)
    13a9:	b8 0f 00 00 00       	mov    $0xf,%eax
    13ae:	cd 40                	int    $0x40
    13b0:	c3                   	ret    

000013b1 <mknod>:
SYSCALL(mknod)
    13b1:	b8 11 00 00 00       	mov    $0x11,%eax
    13b6:	cd 40                	int    $0x40
    13b8:	c3                   	ret    

000013b9 <unlink>:
SYSCALL(unlink)
    13b9:	b8 12 00 00 00       	mov    $0x12,%eax
    13be:	cd 40                	int    $0x40
    13c0:	c3                   	ret    

000013c1 <fstat>:
SYSCALL(fstat)
    13c1:	b8 08 00 00 00       	mov    $0x8,%eax
    13c6:	cd 40                	int    $0x40
    13c8:	c3                   	ret    

000013c9 <link>:
SYSCALL(link)
    13c9:	b8 13 00 00 00       	mov    $0x13,%eax
    13ce:	cd 40                	int    $0x40
    13d0:	c3                   	ret    

000013d1 <mkdir>:
SYSCALL(mkdir)
    13d1:	b8 14 00 00 00       	mov    $0x14,%eax
    13d6:	cd 40                	int    $0x40
    13d8:	c3                   	ret    

000013d9 <chdir>:
SYSCALL(chdir)
    13d9:	b8 09 00 00 00       	mov    $0x9,%eax
    13de:	cd 40                	int    $0x40
    13e0:	c3                   	ret    

000013e1 <dup>:
SYSCALL(dup)
    13e1:	b8 0a 00 00 00       	mov    $0xa,%eax
    13e6:	cd 40                	int    $0x40
    13e8:	c3                   	ret    

000013e9 <getpid>:
SYSCALL(getpid)
    13e9:	b8 0b 00 00 00       	mov    $0xb,%eax
    13ee:	cd 40                	int    $0x40
    13f0:	c3                   	ret    

000013f1 <sbrk>:
SYSCALL(sbrk)
    13f1:	b8 0c 00 00 00       	mov    $0xc,%eax
    13f6:	cd 40                	int    $0x40
    13f8:	c3                   	ret    

000013f9 <sleep>:
SYSCALL(sleep)
    13f9:	b8 0d 00 00 00       	mov    $0xd,%eax
    13fe:	cd 40                	int    $0x40
    1400:	c3                   	ret    

00001401 <uptime>:
SYSCALL(uptime)
    1401:	b8 0e 00 00 00       	mov    $0xe,%eax
    1406:	cd 40                	int    $0x40
    1408:	c3                   	ret    

00001409 <getreadcount>:
SYSCALL(getreadcount)
    1409:	b8 16 00 00 00       	mov    $0x16,%eax
    140e:	cd 40                	int    $0x40
    1410:	c3                   	ret    

00001411 <settickets>:
SYSCALL(settickets)
    1411:	b8 17 00 00 00       	mov    $0x17,%eax
    1416:	cd 40                	int    $0x40
    1418:	c3                   	ret    

00001419 <getpinfo>:
SYSCALL(getpinfo)
    1419:	b8 18 00 00 00       	mov    $0x18,%eax
    141e:	cd 40                	int    $0x40
    1420:	c3                   	ret    

00001421 <clone>:
SYSCALL(clone)
    1421:	b8 19 00 00 00       	mov    $0x19,%eax
    1426:	cd 40                	int    $0x40
    1428:	c3                   	ret    

00001429 <join>:
SYSCALL(join)
    1429:	b8 1a 00 00 00       	mov    $0x1a,%eax
    142e:	cd 40                	int    $0x40
    1430:	c3                   	ret    

00001431 <mprotect>:
SYSCALL(mprotect)
    1431:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1436:	cd 40                	int    $0x40
    1438:	c3                   	ret    

00001439 <munprotect>:
SYSCALL(munprotect)
    1439:	b8 1c 00 00 00       	mov    $0x1c,%eax
    143e:	cd 40                	int    $0x40
    1440:	c3                   	ret    
    1441:	66 90                	xchg   %ax,%ax
    1443:	66 90                	xchg   %ax,%ax
    1445:	66 90                	xchg   %ax,%ax
    1447:	66 90                	xchg   %ax,%ax
    1449:	66 90                	xchg   %ax,%ax
    144b:	66 90                	xchg   %ax,%ax
    144d:	66 90                	xchg   %ax,%ax
    144f:	90                   	nop

00001450 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	57                   	push   %edi
    1454:	56                   	push   %esi
    1455:	53                   	push   %ebx
    1456:	83 ec 3c             	sub    $0x3c,%esp
    1459:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    145c:	89 d1                	mov    %edx,%ecx
{
    145e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1461:	85 d2                	test   %edx,%edx
    1463:	0f 89 7f 00 00 00    	jns    14e8 <printint+0x98>
    1469:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    146d:	74 79                	je     14e8 <printint+0x98>
    neg = 1;
    146f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1476:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1478:	31 db                	xor    %ebx,%ebx
    147a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    147d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1480:	89 c8                	mov    %ecx,%eax
    1482:	31 d2                	xor    %edx,%edx
    1484:	89 cf                	mov    %ecx,%edi
    1486:	f7 75 c4             	divl   -0x3c(%ebp)
    1489:	0f b6 92 94 18 00 00 	movzbl 0x1894(%edx),%edx
    1490:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1493:	89 d8                	mov    %ebx,%eax
    1495:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1498:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    149b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    149e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    14a1:	76 dd                	jbe    1480 <printint+0x30>
  if(neg)
    14a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    14a6:	85 c9                	test   %ecx,%ecx
    14a8:	74 0c                	je     14b6 <printint+0x66>
    buf[i++] = '-';
    14aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    14af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    14b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    14b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    14b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    14bd:	eb 07                	jmp    14c6 <printint+0x76>
    14bf:	90                   	nop
    putc(fd, buf[i]);
    14c0:	0f b6 13             	movzbl (%ebx),%edx
    14c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    14c6:	83 ec 04             	sub    $0x4,%esp
    14c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    14cc:	6a 01                	push   $0x1
    14ce:	56                   	push   %esi
    14cf:	57                   	push   %edi
    14d0:	e8 b4 fe ff ff       	call   1389 <write>
  while(--i >= 0)
    14d5:	83 c4 10             	add    $0x10,%esp
    14d8:	39 de                	cmp    %ebx,%esi
    14da:	75 e4                	jne    14c0 <printint+0x70>
}
    14dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14df:	5b                   	pop    %ebx
    14e0:	5e                   	pop    %esi
    14e1:	5f                   	pop    %edi
    14e2:	5d                   	pop    %ebp
    14e3:	c3                   	ret    
    14e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    14ef:	eb 87                	jmp    1478 <printint+0x28>
    14f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ff:	90                   	nop

00001500 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1500:	55                   	push   %ebp
    1501:	89 e5                	mov    %esp,%ebp
    1503:	57                   	push   %edi
    1504:	56                   	push   %esi
    1505:	53                   	push   %ebx
    1506:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1509:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    150c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    150f:	0f b6 13             	movzbl (%ebx),%edx
    1512:	84 d2                	test   %dl,%dl
    1514:	74 6a                	je     1580 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1516:	8d 45 10             	lea    0x10(%ebp),%eax
    1519:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    151c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    151f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1521:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1524:	eb 36                	jmp    155c <printf+0x5c>
    1526:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    152d:	8d 76 00             	lea    0x0(%esi),%esi
    1530:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1533:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1538:	83 f8 25             	cmp    $0x25,%eax
    153b:	74 15                	je     1552 <printf+0x52>
  write(fd, &c, 1);
    153d:	83 ec 04             	sub    $0x4,%esp
    1540:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1543:	6a 01                	push   $0x1
    1545:	57                   	push   %edi
    1546:	56                   	push   %esi
    1547:	e8 3d fe ff ff       	call   1389 <write>
    154c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    154f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1552:	0f b6 13             	movzbl (%ebx),%edx
    1555:	83 c3 01             	add    $0x1,%ebx
    1558:	84 d2                	test   %dl,%dl
    155a:	74 24                	je     1580 <printf+0x80>
    c = fmt[i] & 0xff;
    155c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    155f:	85 c9                	test   %ecx,%ecx
    1561:	74 cd                	je     1530 <printf+0x30>
      }
    } else if(state == '%'){
    1563:	83 f9 25             	cmp    $0x25,%ecx
    1566:	75 ea                	jne    1552 <printf+0x52>
      if(c == 'd'){
    1568:	83 f8 25             	cmp    $0x25,%eax
    156b:	0f 84 07 01 00 00    	je     1678 <printf+0x178>
    1571:	83 e8 63             	sub    $0x63,%eax
    1574:	83 f8 15             	cmp    $0x15,%eax
    1577:	77 17                	ja     1590 <printf+0x90>
    1579:	ff 24 85 3c 18 00 00 	jmp    *0x183c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1580:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1583:	5b                   	pop    %ebx
    1584:	5e                   	pop    %esi
    1585:	5f                   	pop    %edi
    1586:	5d                   	pop    %ebp
    1587:	c3                   	ret    
    1588:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    158f:	90                   	nop
  write(fd, &c, 1);
    1590:	83 ec 04             	sub    $0x4,%esp
    1593:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1596:	6a 01                	push   $0x1
    1598:	57                   	push   %edi
    1599:	56                   	push   %esi
    159a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    159e:	e8 e6 fd ff ff       	call   1389 <write>
        putc(fd, c);
    15a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    15a7:	83 c4 0c             	add    $0xc,%esp
    15aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
    15ad:	6a 01                	push   $0x1
    15af:	57                   	push   %edi
    15b0:	56                   	push   %esi
    15b1:	e8 d3 fd ff ff       	call   1389 <write>
        putc(fd, c);
    15b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15b9:	31 c9                	xor    %ecx,%ecx
    15bb:	eb 95                	jmp    1552 <printf+0x52>
    15bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    15c0:	83 ec 0c             	sub    $0xc,%esp
    15c3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15c8:	6a 00                	push   $0x0
    15ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15cd:	8b 10                	mov    (%eax),%edx
    15cf:	89 f0                	mov    %esi,%eax
    15d1:	e8 7a fe ff ff       	call   1450 <printint>
        ap++;
    15d6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    15da:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15dd:	31 c9                	xor    %ecx,%ecx
    15df:	e9 6e ff ff ff       	jmp    1552 <printf+0x52>
    15e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    15e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15eb:	8b 10                	mov    (%eax),%edx
        ap++;
    15ed:	83 c0 04             	add    $0x4,%eax
    15f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    15f3:	85 d2                	test   %edx,%edx
    15f5:	0f 84 8d 00 00 00    	je     1688 <printf+0x188>
        while(*s != 0){
    15fb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    15fe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1600:	84 c0                	test   %al,%al
    1602:	0f 84 4a ff ff ff    	je     1552 <printf+0x52>
    1608:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    160b:	89 d3                	mov    %edx,%ebx
    160d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1610:	83 ec 04             	sub    $0x4,%esp
          s++;
    1613:	83 c3 01             	add    $0x1,%ebx
    1616:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1619:	6a 01                	push   $0x1
    161b:	57                   	push   %edi
    161c:	56                   	push   %esi
    161d:	e8 67 fd ff ff       	call   1389 <write>
        while(*s != 0){
    1622:	0f b6 03             	movzbl (%ebx),%eax
    1625:	83 c4 10             	add    $0x10,%esp
    1628:	84 c0                	test   %al,%al
    162a:	75 e4                	jne    1610 <printf+0x110>
      state = 0;
    162c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    162f:	31 c9                	xor    %ecx,%ecx
    1631:	e9 1c ff ff ff       	jmp    1552 <printf+0x52>
    1636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    163d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1640:	83 ec 0c             	sub    $0xc,%esp
    1643:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1648:	6a 01                	push   $0x1
    164a:	e9 7b ff ff ff       	jmp    15ca <printf+0xca>
    164f:	90                   	nop
        putc(fd, *ap);
    1650:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1653:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1656:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1658:	6a 01                	push   $0x1
    165a:	57                   	push   %edi
    165b:	56                   	push   %esi
        putc(fd, *ap);
    165c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    165f:	e8 25 fd ff ff       	call   1389 <write>
        ap++;
    1664:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1668:	83 c4 10             	add    $0x10,%esp
      state = 0;
    166b:	31 c9                	xor    %ecx,%ecx
    166d:	e9 e0 fe ff ff       	jmp    1552 <printf+0x52>
    1672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1678:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    167b:	83 ec 04             	sub    $0x4,%esp
    167e:	e9 2a ff ff ff       	jmp    15ad <printf+0xad>
    1683:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1687:	90                   	nop
          s = "(null)";
    1688:	ba 34 18 00 00       	mov    $0x1834,%edx
        while(*s != 0){
    168d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1690:	b8 28 00 00 00       	mov    $0x28,%eax
    1695:	89 d3                	mov    %edx,%ebx
    1697:	e9 74 ff ff ff       	jmp    1610 <printf+0x110>
    169c:	66 90                	xchg   %ax,%ax
    169e:	66 90                	xchg   %ax,%ax

000016a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16a1:	a1 e8 1b 00 00       	mov    0x1be8,%eax
{
    16a6:	89 e5                	mov    %esp,%ebp
    16a8:	57                   	push   %edi
    16a9:	56                   	push   %esi
    16aa:	53                   	push   %ebx
    16ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    16ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16b8:	89 c2                	mov    %eax,%edx
    16ba:	8b 00                	mov    (%eax),%eax
    16bc:	39 ca                	cmp    %ecx,%edx
    16be:	73 30                	jae    16f0 <free+0x50>
    16c0:	39 c1                	cmp    %eax,%ecx
    16c2:	72 04                	jb     16c8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16c4:	39 c2                	cmp    %eax,%edx
    16c6:	72 f0                	jb     16b8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16ce:	39 f8                	cmp    %edi,%eax
    16d0:	74 30                	je     1702 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    16d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    16d5:	8b 42 04             	mov    0x4(%edx),%eax
    16d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    16db:	39 f1                	cmp    %esi,%ecx
    16dd:	74 3a                	je     1719 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    16df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16e1:	5b                   	pop    %ebx
  freep = p;
    16e2:	89 15 e8 1b 00 00    	mov    %edx,0x1be8
}
    16e8:	5e                   	pop    %esi
    16e9:	5f                   	pop    %edi
    16ea:	5d                   	pop    %ebp
    16eb:	c3                   	ret    
    16ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16f0:	39 c2                	cmp    %eax,%edx
    16f2:	72 c4                	jb     16b8 <free+0x18>
    16f4:	39 c1                	cmp    %eax,%ecx
    16f6:	73 c0                	jae    16b8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    16f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16fe:	39 f8                	cmp    %edi,%eax
    1700:	75 d0                	jne    16d2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1702:	03 70 04             	add    0x4(%eax),%esi
    1705:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1708:	8b 02                	mov    (%edx),%eax
    170a:	8b 00                	mov    (%eax),%eax
    170c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    170f:	8b 42 04             	mov    0x4(%edx),%eax
    1712:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1715:	39 f1                	cmp    %esi,%ecx
    1717:	75 c6                	jne    16df <free+0x3f>
    p->s.size += bp->s.size;
    1719:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    171c:	89 15 e8 1b 00 00    	mov    %edx,0x1be8
    p->s.size += bp->s.size;
    1722:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1725:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1728:	89 0a                	mov    %ecx,(%edx)
}
    172a:	5b                   	pop    %ebx
    172b:	5e                   	pop    %esi
    172c:	5f                   	pop    %edi
    172d:	5d                   	pop    %ebp
    172e:	c3                   	ret    
    172f:	90                   	nop

00001730 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1730:	55                   	push   %ebp
    1731:	89 e5                	mov    %esp,%ebp
    1733:	57                   	push   %edi
    1734:	56                   	push   %esi
    1735:	53                   	push   %ebx
    1736:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1739:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    173c:	8b 3d e8 1b 00 00    	mov    0x1be8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1742:	8d 70 07             	lea    0x7(%eax),%esi
    1745:	c1 ee 03             	shr    $0x3,%esi
    1748:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    174b:	85 ff                	test   %edi,%edi
    174d:	0f 84 9d 00 00 00    	je     17f0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1753:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1755:	8b 4a 04             	mov    0x4(%edx),%ecx
    1758:	39 f1                	cmp    %esi,%ecx
    175a:	73 6a                	jae    17c6 <malloc+0x96>
    175c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1761:	39 de                	cmp    %ebx,%esi
    1763:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1766:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    176d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1770:	eb 17                	jmp    1789 <malloc+0x59>
    1772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1778:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    177a:	8b 48 04             	mov    0x4(%eax),%ecx
    177d:	39 f1                	cmp    %esi,%ecx
    177f:	73 4f                	jae    17d0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1781:	8b 3d e8 1b 00 00    	mov    0x1be8,%edi
    1787:	89 c2                	mov    %eax,%edx
    1789:	39 d7                	cmp    %edx,%edi
    178b:	75 eb                	jne    1778 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    178d:	83 ec 0c             	sub    $0xc,%esp
    1790:	ff 75 e4             	push   -0x1c(%ebp)
    1793:	e8 59 fc ff ff       	call   13f1 <sbrk>
  if(p == (char*)-1)
    1798:	83 c4 10             	add    $0x10,%esp
    179b:	83 f8 ff             	cmp    $0xffffffff,%eax
    179e:	74 1c                	je     17bc <malloc+0x8c>
  hp->s.size = nu;
    17a0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    17a3:	83 ec 0c             	sub    $0xc,%esp
    17a6:	83 c0 08             	add    $0x8,%eax
    17a9:	50                   	push   %eax
    17aa:	e8 f1 fe ff ff       	call   16a0 <free>
  return freep;
    17af:	8b 15 e8 1b 00 00    	mov    0x1be8,%edx
      if((p = morecore(nunits)) == 0)
    17b5:	83 c4 10             	add    $0x10,%esp
    17b8:	85 d2                	test   %edx,%edx
    17ba:	75 bc                	jne    1778 <malloc+0x48>
        return 0;
  }
}
    17bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    17bf:	31 c0                	xor    %eax,%eax
}
    17c1:	5b                   	pop    %ebx
    17c2:	5e                   	pop    %esi
    17c3:	5f                   	pop    %edi
    17c4:	5d                   	pop    %ebp
    17c5:	c3                   	ret    
    if(p->s.size >= nunits){
    17c6:	89 d0                	mov    %edx,%eax
    17c8:	89 fa                	mov    %edi,%edx
    17ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    17d0:	39 ce                	cmp    %ecx,%esi
    17d2:	74 4c                	je     1820 <malloc+0xf0>
        p->s.size -= nunits;
    17d4:	29 f1                	sub    %esi,%ecx
    17d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    17d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    17dc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    17df:	89 15 e8 1b 00 00    	mov    %edx,0x1be8
}
    17e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    17e8:	83 c0 08             	add    $0x8,%eax
}
    17eb:	5b                   	pop    %ebx
    17ec:	5e                   	pop    %esi
    17ed:	5f                   	pop    %edi
    17ee:	5d                   	pop    %ebp
    17ef:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    17f0:	c7 05 e8 1b 00 00 ec 	movl   $0x1bec,0x1be8
    17f7:	1b 00 00 
    base.s.size = 0;
    17fa:	bf ec 1b 00 00       	mov    $0x1bec,%edi
    base.s.ptr = freep = prevp = &base;
    17ff:	c7 05 ec 1b 00 00 ec 	movl   $0x1bec,0x1bec
    1806:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1809:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    180b:	c7 05 f0 1b 00 00 00 	movl   $0x0,0x1bf0
    1812:	00 00 00 
    if(p->s.size >= nunits){
    1815:	e9 42 ff ff ff       	jmp    175c <malloc+0x2c>
    181a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1820:	8b 08                	mov    (%eax),%ecx
    1822:	89 0a                	mov    %ecx,(%edx)
    1824:	eb b9                	jmp    17df <malloc+0xaf>
