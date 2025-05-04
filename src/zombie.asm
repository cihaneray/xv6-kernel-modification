
_zombie:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
    1011:	e8 0b 03 00 00       	call   1321 <fork>
    1016:	85 c0                	test   %eax,%eax
    1018:	7e 0d                	jle    1027 <main+0x27>
    sleep(5);  // Let child exit before parent.
    101a:	83 ec 0c             	sub    $0xc,%esp
    101d:	6a 05                	push   $0x5
    101f:	e8 95 03 00 00       	call   13b9 <sleep>
    1024:	83 c4 10             	add    $0x10,%esp
  exit();
    1027:	e8 fd 02 00 00       	call   1329 <exit>
    102c:	66 90                	xchg   %ax,%ax
    102e:	66 90                	xchg   %ax,%ax

00001030 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    1030:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1031:	31 c0                	xor    %eax,%eax
{
    1033:	89 e5                	mov    %esp,%ebp
    1035:	53                   	push   %ebx
    1036:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1039:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1040:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1044:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1047:	83 c0 01             	add    $0x1,%eax
    104a:	84 d2                	test   %dl,%dl
    104c:	75 f2                	jne    1040 <strcpy+0x10>
    ;
  return os;
}
    104e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1051:	89 c8                	mov    %ecx,%eax
    1053:	c9                   	leave  
    1054:	c3                   	ret    
    1055:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    105c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	53                   	push   %ebx
    1064:	8b 55 08             	mov    0x8(%ebp),%edx
    1067:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    106a:	0f b6 02             	movzbl (%edx),%eax
    106d:	84 c0                	test   %al,%al
    106f:	75 17                	jne    1088 <strcmp+0x28>
    1071:	eb 3a                	jmp    10ad <strcmp+0x4d>
    1073:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1077:	90                   	nop
    1078:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    107c:	83 c2 01             	add    $0x1,%edx
    107f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1082:	84 c0                	test   %al,%al
    1084:	74 1a                	je     10a0 <strcmp+0x40>
    p++, q++;
    1086:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1088:	0f b6 19             	movzbl (%ecx),%ebx
    108b:	38 c3                	cmp    %al,%bl
    108d:	74 e9                	je     1078 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    108f:	29 d8                	sub    %ebx,%eax
}
    1091:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1094:	c9                   	leave  
    1095:	c3                   	ret    
    1096:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    109d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    10a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10a4:	31 c0                	xor    %eax,%eax
    10a6:	29 d8                	sub    %ebx,%eax
}
    10a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10ab:	c9                   	leave  
    10ac:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    10ad:	0f b6 19             	movzbl (%ecx),%ebx
    10b0:	31 c0                	xor    %eax,%eax
    10b2:	eb db                	jmp    108f <strcmp+0x2f>
    10b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10bf:	90                   	nop

000010c0 <strlen>:

uint
strlen(const char *s)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    10c6:	80 3a 00             	cmpb   $0x0,(%edx)
    10c9:	74 15                	je     10e0 <strlen+0x20>
    10cb:	31 c0                	xor    %eax,%eax
    10cd:	8d 76 00             	lea    0x0(%esi),%esi
    10d0:	83 c0 01             	add    $0x1,%eax
    10d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    10d7:	89 c1                	mov    %eax,%ecx
    10d9:	75 f5                	jne    10d0 <strlen+0x10>
    ;
  return n;
}
    10db:	89 c8                	mov    %ecx,%eax
    10dd:	5d                   	pop    %ebp
    10de:	c3                   	ret    
    10df:	90                   	nop
  for(n = 0; s[n]; n++)
    10e0:	31 c9                	xor    %ecx,%ecx
}
    10e2:	5d                   	pop    %ebp
    10e3:	89 c8                	mov    %ecx,%eax
    10e5:	c3                   	ret    
    10e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ed:	8d 76 00             	lea    0x0(%esi),%esi

000010f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	57                   	push   %edi
    10f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    10fd:	89 d7                	mov    %edx,%edi
    10ff:	fc                   	cld    
    1100:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1102:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1105:	89 d0                	mov    %edx,%eax
    1107:	c9                   	leave  
    1108:	c3                   	ret    
    1109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001110 <strchr>:

char*
strchr(const char *s, char c)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	8b 45 08             	mov    0x8(%ebp),%eax
    1116:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    111a:	0f b6 10             	movzbl (%eax),%edx
    111d:	84 d2                	test   %dl,%dl
    111f:	75 12                	jne    1133 <strchr+0x23>
    1121:	eb 1d                	jmp    1140 <strchr+0x30>
    1123:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1127:	90                   	nop
    1128:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    112c:	83 c0 01             	add    $0x1,%eax
    112f:	84 d2                	test   %dl,%dl
    1131:	74 0d                	je     1140 <strchr+0x30>
    if(*s == c)
    1133:	38 d1                	cmp    %dl,%cl
    1135:	75 f1                	jne    1128 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1137:	5d                   	pop    %ebp
    1138:	c3                   	ret    
    1139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1140:	31 c0                	xor    %eax,%eax
}
    1142:	5d                   	pop    %ebp
    1143:	c3                   	ret    
    1144:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    114b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    114f:	90                   	nop

00001150 <gets>:

char*
gets(char *buf, int max)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	57                   	push   %edi
    1154:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1155:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1158:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1159:	31 db                	xor    %ebx,%ebx
{
    115b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    115e:	eb 27                	jmp    1187 <gets+0x37>
    cc = read(0, &c, 1);
    1160:	83 ec 04             	sub    $0x4,%esp
    1163:	6a 01                	push   $0x1
    1165:	57                   	push   %edi
    1166:	6a 00                	push   $0x0
    1168:	e8 d4 01 00 00       	call   1341 <read>
    if(cc < 1)
    116d:	83 c4 10             	add    $0x10,%esp
    1170:	85 c0                	test   %eax,%eax
    1172:	7e 1d                	jle    1191 <gets+0x41>
      break;
    buf[i++] = c;
    1174:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1178:	8b 55 08             	mov    0x8(%ebp),%edx
    117b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    117f:	3c 0a                	cmp    $0xa,%al
    1181:	74 1d                	je     11a0 <gets+0x50>
    1183:	3c 0d                	cmp    $0xd,%al
    1185:	74 19                	je     11a0 <gets+0x50>
  for(i=0; i+1 < max; ){
    1187:	89 de                	mov    %ebx,%esi
    1189:	83 c3 01             	add    $0x1,%ebx
    118c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    118f:	7c cf                	jl     1160 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1191:	8b 45 08             	mov    0x8(%ebp),%eax
    1194:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1198:	8d 65 f4             	lea    -0xc(%ebp),%esp
    119b:	5b                   	pop    %ebx
    119c:	5e                   	pop    %esi
    119d:	5f                   	pop    %edi
    119e:	5d                   	pop    %ebp
    119f:	c3                   	ret    
  buf[i] = '\0';
    11a0:	8b 45 08             	mov    0x8(%ebp),%eax
    11a3:	89 de                	mov    %ebx,%esi
    11a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    11a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11ac:	5b                   	pop    %ebx
    11ad:	5e                   	pop    %esi
    11ae:	5f                   	pop    %edi
    11af:	5d                   	pop    %ebp
    11b0:	c3                   	ret    
    11b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11bf:	90                   	nop

000011c0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	56                   	push   %esi
    11c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11c5:	83 ec 08             	sub    $0x8,%esp
    11c8:	6a 00                	push   $0x0
    11ca:	ff 75 08             	push   0x8(%ebp)
    11cd:	e8 97 01 00 00       	call   1369 <open>
  if(fd < 0)
    11d2:	83 c4 10             	add    $0x10,%esp
    11d5:	85 c0                	test   %eax,%eax
    11d7:	78 27                	js     1200 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11d9:	83 ec 08             	sub    $0x8,%esp
    11dc:	ff 75 0c             	push   0xc(%ebp)
    11df:	89 c3                	mov    %eax,%ebx
    11e1:	50                   	push   %eax
    11e2:	e8 9a 01 00 00       	call   1381 <fstat>
  close(fd);
    11e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    11ea:	89 c6                	mov    %eax,%esi
  close(fd);
    11ec:	e8 60 01 00 00       	call   1351 <close>
  return r;
    11f1:	83 c4 10             	add    $0x10,%esp
}
    11f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11f7:	89 f0                	mov    %esi,%eax
    11f9:	5b                   	pop    %ebx
    11fa:	5e                   	pop    %esi
    11fb:	5d                   	pop    %ebp
    11fc:	c3                   	ret    
    11fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1200:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1205:	eb ed                	jmp    11f4 <stat+0x34>
    1207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120e:	66 90                	xchg   %ax,%ax

00001210 <atoi>:

int
atoi(const char *s)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	53                   	push   %ebx
    1214:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1217:	0f be 02             	movsbl (%edx),%eax
    121a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    121d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1220:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1225:	77 1e                	ja     1245 <atoi+0x35>
    1227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    122e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1230:	83 c2 01             	add    $0x1,%edx
    1233:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1236:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    123a:	0f be 02             	movsbl (%edx),%eax
    123d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1240:	80 fb 09             	cmp    $0x9,%bl
    1243:	76 eb                	jbe    1230 <atoi+0x20>
  return n;
}
    1245:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1248:	89 c8                	mov    %ecx,%eax
    124a:	c9                   	leave  
    124b:	c3                   	ret    
    124c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	57                   	push   %edi
    1254:	8b 45 10             	mov    0x10(%ebp),%eax
    1257:	8b 55 08             	mov    0x8(%ebp),%edx
    125a:	56                   	push   %esi
    125b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    125e:	85 c0                	test   %eax,%eax
    1260:	7e 13                	jle    1275 <memmove+0x25>
    1262:	01 d0                	add    %edx,%eax
  dst = vdst;
    1264:	89 d7                	mov    %edx,%edi
    1266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    126d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1270:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1271:	39 f8                	cmp    %edi,%eax
    1273:	75 fb                	jne    1270 <memmove+0x20>
  return vdst;
}
    1275:	5e                   	pop    %esi
    1276:	89 d0                	mov    %edx,%eax
    1278:	5f                   	pop    %edi
    1279:	5d                   	pop    %ebp
    127a:	c3                   	ret    
    127b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    127f:	90                   	nop

00001280 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    1286:	68 00 10 00 00       	push   $0x1000
    128b:	e8 60 04 00 00       	call   16f0 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    1290:	50                   	push   %eax
    1291:	ff 75 10             	push   0x10(%ebp)
    1294:	ff 75 0c             	push   0xc(%ebp)
    1297:	ff 75 08             	push   0x8(%ebp)
    129a:	e8 42 01 00 00       	call   13e1 <clone>
}
    129f:	c9                   	leave  
    12a0:	c3                   	ret    
    12a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12af:	90                   	nop

000012b0 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    12b0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    12b1:	b9 01 00 00 00       	mov    $0x1,%ecx
    12b6:	89 e5                	mov    %esp,%ebp
    12b8:	8b 55 08             	mov    0x8(%ebp),%edx
    12bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12bf:	90                   	nop
    12c0:	89 c8                	mov    %ecx,%eax
    12c2:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    12c5:	85 c0                	test   %eax,%eax
    12c7:	75 f7                	jne    12c0 <lock_acquire+0x10>
}
    12c9:	5d                   	pop    %ebp
    12ca:	c3                   	ret    
    12cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12cf:	90                   	nop

000012d0 <lock_release>:

void lock_release(lock_thread *lock){
    12d0:	55                   	push   %ebp
    12d1:	31 c0                	xor    %eax,%eax
    12d3:	89 e5                	mov    %esp,%ebp
    12d5:	8b 55 08             	mov    0x8(%ebp),%edx
    12d8:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    12db:	5d                   	pop    %ebp
    12dc:	c3                   	ret    
    12dd:	8d 76 00             	lea    0x0(%esi),%esi

000012e0 <lock_init>:

int lock_init(lock_thread *lock)
{
    12e0:	55                   	push   %ebp
    12e1:	89 e5                	mov    %esp,%ebp
    12e3:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    12e6:	68 e8 17 00 00       	push   $0x17e8
    12eb:	6a 01                	push   $0x1
    12ed:	e8 ce 01 00 00       	call   14c0 <printf>
  lock->locked = 0;
    12f2:	8b 45 08             	mov    0x8(%ebp),%eax
    12f5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    12fb:	58                   	pop    %eax
    12fc:	5a                   	pop    %edx
    12fd:	68 e8 17 00 00       	push   $0x17e8
    1302:	6a 01                	push   $0x1
    1304:	e8 b7 01 00 00       	call   14c0 <printf>
  return 0;
}
    1309:	31 c0                	xor    %eax,%eax
    130b:	c9                   	leave  
    130c:	c3                   	ret    
    130d:	8d 76 00             	lea    0x0(%esi),%esi

00001310 <thread_join>:



int thread_join()
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    1316:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1319:	50                   	push   %eax
    131a:	e8 ca 00 00 00       	call   13e9 <join>
  return a;
    131f:	c9                   	leave  
    1320:	c3                   	ret    

00001321 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1321:	b8 01 00 00 00       	mov    $0x1,%eax
    1326:	cd 40                	int    $0x40
    1328:	c3                   	ret    

00001329 <exit>:
SYSCALL(exit)
    1329:	b8 02 00 00 00       	mov    $0x2,%eax
    132e:	cd 40                	int    $0x40
    1330:	c3                   	ret    

00001331 <wait>:
SYSCALL(wait)
    1331:	b8 03 00 00 00       	mov    $0x3,%eax
    1336:	cd 40                	int    $0x40
    1338:	c3                   	ret    

00001339 <pipe>:
SYSCALL(pipe)
    1339:	b8 04 00 00 00       	mov    $0x4,%eax
    133e:	cd 40                	int    $0x40
    1340:	c3                   	ret    

00001341 <read>:
SYSCALL(read)
    1341:	b8 05 00 00 00       	mov    $0x5,%eax
    1346:	cd 40                	int    $0x40
    1348:	c3                   	ret    

00001349 <write>:
SYSCALL(write)
    1349:	b8 10 00 00 00       	mov    $0x10,%eax
    134e:	cd 40                	int    $0x40
    1350:	c3                   	ret    

00001351 <close>:
SYSCALL(close)
    1351:	b8 15 00 00 00       	mov    $0x15,%eax
    1356:	cd 40                	int    $0x40
    1358:	c3                   	ret    

00001359 <kill>:
SYSCALL(kill)
    1359:	b8 06 00 00 00       	mov    $0x6,%eax
    135e:	cd 40                	int    $0x40
    1360:	c3                   	ret    

00001361 <exec>:
SYSCALL(exec)
    1361:	b8 07 00 00 00       	mov    $0x7,%eax
    1366:	cd 40                	int    $0x40
    1368:	c3                   	ret    

00001369 <open>:
SYSCALL(open)
    1369:	b8 0f 00 00 00       	mov    $0xf,%eax
    136e:	cd 40                	int    $0x40
    1370:	c3                   	ret    

00001371 <mknod>:
SYSCALL(mknod)
    1371:	b8 11 00 00 00       	mov    $0x11,%eax
    1376:	cd 40                	int    $0x40
    1378:	c3                   	ret    

00001379 <unlink>:
SYSCALL(unlink)
    1379:	b8 12 00 00 00       	mov    $0x12,%eax
    137e:	cd 40                	int    $0x40
    1380:	c3                   	ret    

00001381 <fstat>:
SYSCALL(fstat)
    1381:	b8 08 00 00 00       	mov    $0x8,%eax
    1386:	cd 40                	int    $0x40
    1388:	c3                   	ret    

00001389 <link>:
SYSCALL(link)
    1389:	b8 13 00 00 00       	mov    $0x13,%eax
    138e:	cd 40                	int    $0x40
    1390:	c3                   	ret    

00001391 <mkdir>:
SYSCALL(mkdir)
    1391:	b8 14 00 00 00       	mov    $0x14,%eax
    1396:	cd 40                	int    $0x40
    1398:	c3                   	ret    

00001399 <chdir>:
SYSCALL(chdir)
    1399:	b8 09 00 00 00       	mov    $0x9,%eax
    139e:	cd 40                	int    $0x40
    13a0:	c3                   	ret    

000013a1 <dup>:
SYSCALL(dup)
    13a1:	b8 0a 00 00 00       	mov    $0xa,%eax
    13a6:	cd 40                	int    $0x40
    13a8:	c3                   	ret    

000013a9 <getpid>:
SYSCALL(getpid)
    13a9:	b8 0b 00 00 00       	mov    $0xb,%eax
    13ae:	cd 40                	int    $0x40
    13b0:	c3                   	ret    

000013b1 <sbrk>:
SYSCALL(sbrk)
    13b1:	b8 0c 00 00 00       	mov    $0xc,%eax
    13b6:	cd 40                	int    $0x40
    13b8:	c3                   	ret    

000013b9 <sleep>:
SYSCALL(sleep)
    13b9:	b8 0d 00 00 00       	mov    $0xd,%eax
    13be:	cd 40                	int    $0x40
    13c0:	c3                   	ret    

000013c1 <uptime>:
SYSCALL(uptime)
    13c1:	b8 0e 00 00 00       	mov    $0xe,%eax
    13c6:	cd 40                	int    $0x40
    13c8:	c3                   	ret    

000013c9 <getreadcount>:
SYSCALL(getreadcount)
    13c9:	b8 16 00 00 00       	mov    $0x16,%eax
    13ce:	cd 40                	int    $0x40
    13d0:	c3                   	ret    

000013d1 <settickets>:
SYSCALL(settickets)
    13d1:	b8 17 00 00 00       	mov    $0x17,%eax
    13d6:	cd 40                	int    $0x40
    13d8:	c3                   	ret    

000013d9 <getpinfo>:
SYSCALL(getpinfo)
    13d9:	b8 18 00 00 00       	mov    $0x18,%eax
    13de:	cd 40                	int    $0x40
    13e0:	c3                   	ret    

000013e1 <clone>:
SYSCALL(clone)
    13e1:	b8 19 00 00 00       	mov    $0x19,%eax
    13e6:	cd 40                	int    $0x40
    13e8:	c3                   	ret    

000013e9 <join>:
SYSCALL(join)
    13e9:	b8 1a 00 00 00       	mov    $0x1a,%eax
    13ee:	cd 40                	int    $0x40
    13f0:	c3                   	ret    

000013f1 <mprotect>:
SYSCALL(mprotect)
    13f1:	b8 1b 00 00 00       	mov    $0x1b,%eax
    13f6:	cd 40                	int    $0x40
    13f8:	c3                   	ret    

000013f9 <munprotect>:
SYSCALL(munprotect)
    13f9:	b8 1c 00 00 00       	mov    $0x1c,%eax
    13fe:	cd 40                	int    $0x40
    1400:	c3                   	ret    
    1401:	66 90                	xchg   %ax,%ax
    1403:	66 90                	xchg   %ax,%ax
    1405:	66 90                	xchg   %ax,%ax
    1407:	66 90                	xchg   %ax,%ax
    1409:	66 90                	xchg   %ax,%ax
    140b:	66 90                	xchg   %ax,%ax
    140d:	66 90                	xchg   %ax,%ax
    140f:	90                   	nop

00001410 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	57                   	push   %edi
    1414:	56                   	push   %esi
    1415:	53                   	push   %ebx
    1416:	83 ec 3c             	sub    $0x3c,%esp
    1419:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    141c:	89 d1                	mov    %edx,%ecx
{
    141e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1421:	85 d2                	test   %edx,%edx
    1423:	0f 89 7f 00 00 00    	jns    14a8 <printint+0x98>
    1429:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    142d:	74 79                	je     14a8 <printint+0x98>
    neg = 1;
    142f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1436:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1438:	31 db                	xor    %ebx,%ebx
    143a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    143d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1440:	89 c8                	mov    %ecx,%eax
    1442:	31 d2                	xor    %edx,%edx
    1444:	89 cf                	mov    %ecx,%edi
    1446:	f7 75 c4             	divl   -0x3c(%ebp)
    1449:	0f b6 92 4c 18 00 00 	movzbl 0x184c(%edx),%edx
    1450:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1453:	89 d8                	mov    %ebx,%eax
    1455:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1458:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    145b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    145e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1461:	76 dd                	jbe    1440 <printint+0x30>
  if(neg)
    1463:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1466:	85 c9                	test   %ecx,%ecx
    1468:	74 0c                	je     1476 <printint+0x66>
    buf[i++] = '-';
    146a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    146f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1471:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1476:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1479:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    147d:	eb 07                	jmp    1486 <printint+0x76>
    147f:	90                   	nop
    putc(fd, buf[i]);
    1480:	0f b6 13             	movzbl (%ebx),%edx
    1483:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1486:	83 ec 04             	sub    $0x4,%esp
    1489:	88 55 d7             	mov    %dl,-0x29(%ebp)
    148c:	6a 01                	push   $0x1
    148e:	56                   	push   %esi
    148f:	57                   	push   %edi
    1490:	e8 b4 fe ff ff       	call   1349 <write>
  while(--i >= 0)
    1495:	83 c4 10             	add    $0x10,%esp
    1498:	39 de                	cmp    %ebx,%esi
    149a:	75 e4                	jne    1480 <printint+0x70>
}
    149c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    149f:	5b                   	pop    %ebx
    14a0:	5e                   	pop    %esi
    14a1:	5f                   	pop    %edi
    14a2:	5d                   	pop    %ebp
    14a3:	c3                   	ret    
    14a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    14af:	eb 87                	jmp    1438 <printint+0x28>
    14b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14bf:	90                   	nop

000014c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    14c0:	55                   	push   %ebp
    14c1:	89 e5                	mov    %esp,%ebp
    14c3:	57                   	push   %edi
    14c4:	56                   	push   %esi
    14c5:	53                   	push   %ebx
    14c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    14cc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    14cf:	0f b6 13             	movzbl (%ebx),%edx
    14d2:	84 d2                	test   %dl,%dl
    14d4:	74 6a                	je     1540 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    14d6:	8d 45 10             	lea    0x10(%ebp),%eax
    14d9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    14dc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    14df:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    14e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14e4:	eb 36                	jmp    151c <printf+0x5c>
    14e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ed:	8d 76 00             	lea    0x0(%esi),%esi
    14f0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    14f3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    14f8:	83 f8 25             	cmp    $0x25,%eax
    14fb:	74 15                	je     1512 <printf+0x52>
  write(fd, &c, 1);
    14fd:	83 ec 04             	sub    $0x4,%esp
    1500:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1503:	6a 01                	push   $0x1
    1505:	57                   	push   %edi
    1506:	56                   	push   %esi
    1507:	e8 3d fe ff ff       	call   1349 <write>
    150c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    150f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1512:	0f b6 13             	movzbl (%ebx),%edx
    1515:	83 c3 01             	add    $0x1,%ebx
    1518:	84 d2                	test   %dl,%dl
    151a:	74 24                	je     1540 <printf+0x80>
    c = fmt[i] & 0xff;
    151c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    151f:	85 c9                	test   %ecx,%ecx
    1521:	74 cd                	je     14f0 <printf+0x30>
      }
    } else if(state == '%'){
    1523:	83 f9 25             	cmp    $0x25,%ecx
    1526:	75 ea                	jne    1512 <printf+0x52>
      if(c == 'd'){
    1528:	83 f8 25             	cmp    $0x25,%eax
    152b:	0f 84 07 01 00 00    	je     1638 <printf+0x178>
    1531:	83 e8 63             	sub    $0x63,%eax
    1534:	83 f8 15             	cmp    $0x15,%eax
    1537:	77 17                	ja     1550 <printf+0x90>
    1539:	ff 24 85 f4 17 00 00 	jmp    *0x17f4(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1540:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1543:	5b                   	pop    %ebx
    1544:	5e                   	pop    %esi
    1545:	5f                   	pop    %edi
    1546:	5d                   	pop    %ebp
    1547:	c3                   	ret    
    1548:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    154f:	90                   	nop
  write(fd, &c, 1);
    1550:	83 ec 04             	sub    $0x4,%esp
    1553:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1556:	6a 01                	push   $0x1
    1558:	57                   	push   %edi
    1559:	56                   	push   %esi
    155a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    155e:	e8 e6 fd ff ff       	call   1349 <write>
        putc(fd, c);
    1563:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1567:	83 c4 0c             	add    $0xc,%esp
    156a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    156d:	6a 01                	push   $0x1
    156f:	57                   	push   %edi
    1570:	56                   	push   %esi
    1571:	e8 d3 fd ff ff       	call   1349 <write>
        putc(fd, c);
    1576:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1579:	31 c9                	xor    %ecx,%ecx
    157b:	eb 95                	jmp    1512 <printf+0x52>
    157d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1580:	83 ec 0c             	sub    $0xc,%esp
    1583:	b9 10 00 00 00       	mov    $0x10,%ecx
    1588:	6a 00                	push   $0x0
    158a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    158d:	8b 10                	mov    (%eax),%edx
    158f:	89 f0                	mov    %esi,%eax
    1591:	e8 7a fe ff ff       	call   1410 <printint>
        ap++;
    1596:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    159a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    159d:	31 c9                	xor    %ecx,%ecx
    159f:	e9 6e ff ff ff       	jmp    1512 <printf+0x52>
    15a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    15a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15ab:	8b 10                	mov    (%eax),%edx
        ap++;
    15ad:	83 c0 04             	add    $0x4,%eax
    15b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    15b3:	85 d2                	test   %edx,%edx
    15b5:	0f 84 8d 00 00 00    	je     1648 <printf+0x188>
        while(*s != 0){
    15bb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    15be:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    15c0:	84 c0                	test   %al,%al
    15c2:	0f 84 4a ff ff ff    	je     1512 <printf+0x52>
    15c8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    15cb:	89 d3                	mov    %edx,%ebx
    15cd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    15d0:	83 ec 04             	sub    $0x4,%esp
          s++;
    15d3:	83 c3 01             	add    $0x1,%ebx
    15d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15d9:	6a 01                	push   $0x1
    15db:	57                   	push   %edi
    15dc:	56                   	push   %esi
    15dd:	e8 67 fd ff ff       	call   1349 <write>
        while(*s != 0){
    15e2:	0f b6 03             	movzbl (%ebx),%eax
    15e5:	83 c4 10             	add    $0x10,%esp
    15e8:	84 c0                	test   %al,%al
    15ea:	75 e4                	jne    15d0 <printf+0x110>
      state = 0;
    15ec:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    15ef:	31 c9                	xor    %ecx,%ecx
    15f1:	e9 1c ff ff ff       	jmp    1512 <printf+0x52>
    15f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1600:	83 ec 0c             	sub    $0xc,%esp
    1603:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1608:	6a 01                	push   $0x1
    160a:	e9 7b ff ff ff       	jmp    158a <printf+0xca>
    160f:	90                   	nop
        putc(fd, *ap);
    1610:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1613:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1616:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1618:	6a 01                	push   $0x1
    161a:	57                   	push   %edi
    161b:	56                   	push   %esi
        putc(fd, *ap);
    161c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    161f:	e8 25 fd ff ff       	call   1349 <write>
        ap++;
    1624:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1628:	83 c4 10             	add    $0x10,%esp
      state = 0;
    162b:	31 c9                	xor    %ecx,%ecx
    162d:	e9 e0 fe ff ff       	jmp    1512 <printf+0x52>
    1632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1638:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    163b:	83 ec 04             	sub    $0x4,%esp
    163e:	e9 2a ff ff ff       	jmp    156d <printf+0xad>
    1643:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1647:	90                   	nop
          s = "(null)";
    1648:	ba eb 17 00 00       	mov    $0x17eb,%edx
        while(*s != 0){
    164d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1650:	b8 28 00 00 00       	mov    $0x28,%eax
    1655:	89 d3                	mov    %edx,%ebx
    1657:	e9 74 ff ff ff       	jmp    15d0 <printf+0x110>
    165c:	66 90                	xchg   %ax,%ax
    165e:	66 90                	xchg   %ax,%ax

00001660 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1660:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1661:	a1 94 1b 00 00       	mov    0x1b94,%eax
{
    1666:	89 e5                	mov    %esp,%ebp
    1668:	57                   	push   %edi
    1669:	56                   	push   %esi
    166a:	53                   	push   %ebx
    166b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    166e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1678:	89 c2                	mov    %eax,%edx
    167a:	8b 00                	mov    (%eax),%eax
    167c:	39 ca                	cmp    %ecx,%edx
    167e:	73 30                	jae    16b0 <free+0x50>
    1680:	39 c1                	cmp    %eax,%ecx
    1682:	72 04                	jb     1688 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1684:	39 c2                	cmp    %eax,%edx
    1686:	72 f0                	jb     1678 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1688:	8b 73 fc             	mov    -0x4(%ebx),%esi
    168b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    168e:	39 f8                	cmp    %edi,%eax
    1690:	74 30                	je     16c2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1692:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1695:	8b 42 04             	mov    0x4(%edx),%eax
    1698:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    169b:	39 f1                	cmp    %esi,%ecx
    169d:	74 3a                	je     16d9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    169f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16a1:	5b                   	pop    %ebx
  freep = p;
    16a2:	89 15 94 1b 00 00    	mov    %edx,0x1b94
}
    16a8:	5e                   	pop    %esi
    16a9:	5f                   	pop    %edi
    16aa:	5d                   	pop    %ebp
    16ab:	c3                   	ret    
    16ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16b0:	39 c2                	cmp    %eax,%edx
    16b2:	72 c4                	jb     1678 <free+0x18>
    16b4:	39 c1                	cmp    %eax,%ecx
    16b6:	73 c0                	jae    1678 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    16b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16be:	39 f8                	cmp    %edi,%eax
    16c0:	75 d0                	jne    1692 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    16c2:	03 70 04             	add    0x4(%eax),%esi
    16c5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16c8:	8b 02                	mov    (%edx),%eax
    16ca:	8b 00                	mov    (%eax),%eax
    16cc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    16cf:	8b 42 04             	mov    0x4(%edx),%eax
    16d2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    16d5:	39 f1                	cmp    %esi,%ecx
    16d7:	75 c6                	jne    169f <free+0x3f>
    p->s.size += bp->s.size;
    16d9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    16dc:	89 15 94 1b 00 00    	mov    %edx,0x1b94
    p->s.size += bp->s.size;
    16e2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    16e5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    16e8:	89 0a                	mov    %ecx,(%edx)
}
    16ea:	5b                   	pop    %ebx
    16eb:	5e                   	pop    %esi
    16ec:	5f                   	pop    %edi
    16ed:	5d                   	pop    %ebp
    16ee:	c3                   	ret    
    16ef:	90                   	nop

000016f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16f0:	55                   	push   %ebp
    16f1:	89 e5                	mov    %esp,%ebp
    16f3:	57                   	push   %edi
    16f4:	56                   	push   %esi
    16f5:	53                   	push   %ebx
    16f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16fc:	8b 3d 94 1b 00 00    	mov    0x1b94,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1702:	8d 70 07             	lea    0x7(%eax),%esi
    1705:	c1 ee 03             	shr    $0x3,%esi
    1708:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    170b:	85 ff                	test   %edi,%edi
    170d:	0f 84 9d 00 00 00    	je     17b0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1713:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1715:	8b 4a 04             	mov    0x4(%edx),%ecx
    1718:	39 f1                	cmp    %esi,%ecx
    171a:	73 6a                	jae    1786 <malloc+0x96>
    171c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1721:	39 de                	cmp    %ebx,%esi
    1723:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1726:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    172d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1730:	eb 17                	jmp    1749 <malloc+0x59>
    1732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1738:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    173a:	8b 48 04             	mov    0x4(%eax),%ecx
    173d:	39 f1                	cmp    %esi,%ecx
    173f:	73 4f                	jae    1790 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1741:	8b 3d 94 1b 00 00    	mov    0x1b94,%edi
    1747:	89 c2                	mov    %eax,%edx
    1749:	39 d7                	cmp    %edx,%edi
    174b:	75 eb                	jne    1738 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    174d:	83 ec 0c             	sub    $0xc,%esp
    1750:	ff 75 e4             	push   -0x1c(%ebp)
    1753:	e8 59 fc ff ff       	call   13b1 <sbrk>
  if(p == (char*)-1)
    1758:	83 c4 10             	add    $0x10,%esp
    175b:	83 f8 ff             	cmp    $0xffffffff,%eax
    175e:	74 1c                	je     177c <malloc+0x8c>
  hp->s.size = nu;
    1760:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1763:	83 ec 0c             	sub    $0xc,%esp
    1766:	83 c0 08             	add    $0x8,%eax
    1769:	50                   	push   %eax
    176a:	e8 f1 fe ff ff       	call   1660 <free>
  return freep;
    176f:	8b 15 94 1b 00 00    	mov    0x1b94,%edx
      if((p = morecore(nunits)) == 0)
    1775:	83 c4 10             	add    $0x10,%esp
    1778:	85 d2                	test   %edx,%edx
    177a:	75 bc                	jne    1738 <malloc+0x48>
        return 0;
  }
}
    177c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    177f:	31 c0                	xor    %eax,%eax
}
    1781:	5b                   	pop    %ebx
    1782:	5e                   	pop    %esi
    1783:	5f                   	pop    %edi
    1784:	5d                   	pop    %ebp
    1785:	c3                   	ret    
    if(p->s.size >= nunits){
    1786:	89 d0                	mov    %edx,%eax
    1788:	89 fa                	mov    %edi,%edx
    178a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1790:	39 ce                	cmp    %ecx,%esi
    1792:	74 4c                	je     17e0 <malloc+0xf0>
        p->s.size -= nunits;
    1794:	29 f1                	sub    %esi,%ecx
    1796:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1799:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    179c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    179f:	89 15 94 1b 00 00    	mov    %edx,0x1b94
}
    17a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    17a8:	83 c0 08             	add    $0x8,%eax
}
    17ab:	5b                   	pop    %ebx
    17ac:	5e                   	pop    %esi
    17ad:	5f                   	pop    %edi
    17ae:	5d                   	pop    %ebp
    17af:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    17b0:	c7 05 94 1b 00 00 98 	movl   $0x1b98,0x1b94
    17b7:	1b 00 00 
    base.s.size = 0;
    17ba:	bf 98 1b 00 00       	mov    $0x1b98,%edi
    base.s.ptr = freep = prevp = &base;
    17bf:	c7 05 98 1b 00 00 98 	movl   $0x1b98,0x1b98
    17c6:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17c9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    17cb:	c7 05 9c 1b 00 00 00 	movl   $0x0,0x1b9c
    17d2:	00 00 00 
    if(p->s.size >= nunits){
    17d5:	e9 42 ff ff ff       	jmp    171c <malloc+0x2c>
    17da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    17e0:	8b 08                	mov    (%eax),%ecx
    17e2:	89 0a                	mov    %ecx,(%edx)
    17e4:	eb b9                	jmp    179f <malloc+0xaf>
