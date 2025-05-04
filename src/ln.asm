
_ln:     file format elf32-i386


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
  if(argc != 3){
    100a:	83 39 03             	cmpl   $0x3,(%ecx)
{
    100d:	55                   	push   %ebp
    100e:	89 e5                	mov    %esp,%ebp
    1010:	53                   	push   %ebx
    1011:	51                   	push   %ecx
    1012:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
    1015:	74 13                	je     102a <main+0x2a>
    printf(2, "Usage: ln old new\n");
    1017:	52                   	push   %edx
    1018:	52                   	push   %edx
    1019:	68 18 18 00 00       	push   $0x1818
    101e:	6a 02                	push   $0x2
    1020:	e8 cb 04 00 00       	call   14f0 <printf>
    exit();
    1025:	e8 2f 03 00 00       	call   1359 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
    102a:	50                   	push   %eax
    102b:	50                   	push   %eax
    102c:	ff 73 08             	push   0x8(%ebx)
    102f:	ff 73 04             	push   0x4(%ebx)
    1032:	e8 82 03 00 00       	call   13b9 <link>
    1037:	83 c4 10             	add    $0x10,%esp
    103a:	85 c0                	test   %eax,%eax
    103c:	78 05                	js     1043 <main+0x43>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
    103e:	e8 16 03 00 00       	call   1359 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
    1043:	ff 73 08             	push   0x8(%ebx)
    1046:	ff 73 04             	push   0x4(%ebx)
    1049:	68 2b 18 00 00       	push   $0x182b
    104e:	6a 02                	push   $0x2
    1050:	e8 9b 04 00 00       	call   14f0 <printf>
    1055:	83 c4 10             	add    $0x10,%esp
    1058:	eb e4                	jmp    103e <main+0x3e>
    105a:	66 90                	xchg   %ax,%ax
    105c:	66 90                	xchg   %ax,%ax
    105e:	66 90                	xchg   %ax,%ax

00001060 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    1060:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1061:	31 c0                	xor    %eax,%eax
{
    1063:	89 e5                	mov    %esp,%ebp
    1065:	53                   	push   %ebx
    1066:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1069:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1070:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1074:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1077:	83 c0 01             	add    $0x1,%eax
    107a:	84 d2                	test   %dl,%dl
    107c:	75 f2                	jne    1070 <strcpy+0x10>
    ;
  return os;
}
    107e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1081:	89 c8                	mov    %ecx,%eax
    1083:	c9                   	leave  
    1084:	c3                   	ret    
    1085:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    108c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	53                   	push   %ebx
    1094:	8b 55 08             	mov    0x8(%ebp),%edx
    1097:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    109a:	0f b6 02             	movzbl (%edx),%eax
    109d:	84 c0                	test   %al,%al
    109f:	75 17                	jne    10b8 <strcmp+0x28>
    10a1:	eb 3a                	jmp    10dd <strcmp+0x4d>
    10a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10a7:	90                   	nop
    10a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    10ac:	83 c2 01             	add    $0x1,%edx
    10af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10b2:	84 c0                	test   %al,%al
    10b4:	74 1a                	je     10d0 <strcmp+0x40>
    p++, q++;
    10b6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    10b8:	0f b6 19             	movzbl (%ecx),%ebx
    10bb:	38 c3                	cmp    %al,%bl
    10bd:	74 e9                	je     10a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    10bf:	29 d8                	sub    %ebx,%eax
}
    10c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10c4:	c9                   	leave  
    10c5:	c3                   	ret    
    10c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10cd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    10d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10d4:	31 c0                	xor    %eax,%eax
    10d6:	29 d8                	sub    %ebx,%eax
}
    10d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10db:	c9                   	leave  
    10dc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    10dd:	0f b6 19             	movzbl (%ecx),%ebx
    10e0:	31 c0                	xor    %eax,%eax
    10e2:	eb db                	jmp    10bf <strcmp+0x2f>
    10e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10ef:	90                   	nop

000010f0 <strlen>:

uint
strlen(const char *s)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    10f6:	80 3a 00             	cmpb   $0x0,(%edx)
    10f9:	74 15                	je     1110 <strlen+0x20>
    10fb:	31 c0                	xor    %eax,%eax
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
    1100:	83 c0 01             	add    $0x1,%eax
    1103:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1107:	89 c1                	mov    %eax,%ecx
    1109:	75 f5                	jne    1100 <strlen+0x10>
    ;
  return n;
}
    110b:	89 c8                	mov    %ecx,%eax
    110d:	5d                   	pop    %ebp
    110e:	c3                   	ret    
    110f:	90                   	nop
  for(n = 0; s[n]; n++)
    1110:	31 c9                	xor    %ecx,%ecx
}
    1112:	5d                   	pop    %ebp
    1113:	89 c8                	mov    %ecx,%eax
    1115:	c3                   	ret    
    1116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111d:	8d 76 00             	lea    0x0(%esi),%esi

00001120 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	57                   	push   %edi
    1124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1127:	8b 4d 10             	mov    0x10(%ebp),%ecx
    112a:	8b 45 0c             	mov    0xc(%ebp),%eax
    112d:	89 d7                	mov    %edx,%edi
    112f:	fc                   	cld    
    1130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1132:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1135:	89 d0                	mov    %edx,%eax
    1137:	c9                   	leave  
    1138:	c3                   	ret    
    1139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001140 <strchr>:

char*
strchr(const char *s, char c)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	8b 45 08             	mov    0x8(%ebp),%eax
    1146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    114a:	0f b6 10             	movzbl (%eax),%edx
    114d:	84 d2                	test   %dl,%dl
    114f:	75 12                	jne    1163 <strchr+0x23>
    1151:	eb 1d                	jmp    1170 <strchr+0x30>
    1153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1157:	90                   	nop
    1158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    115c:	83 c0 01             	add    $0x1,%eax
    115f:	84 d2                	test   %dl,%dl
    1161:	74 0d                	je     1170 <strchr+0x30>
    if(*s == c)
    1163:	38 d1                	cmp    %dl,%cl
    1165:	75 f1                	jne    1158 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1167:	5d                   	pop    %ebp
    1168:	c3                   	ret    
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1170:	31 c0                	xor    %eax,%eax
}
    1172:	5d                   	pop    %ebp
    1173:	c3                   	ret    
    1174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    117f:	90                   	nop

00001180 <gets>:

char*
gets(char *buf, int max)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	57                   	push   %edi
    1184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1185:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1188:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1189:	31 db                	xor    %ebx,%ebx
{
    118b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    118e:	eb 27                	jmp    11b7 <gets+0x37>
    cc = read(0, &c, 1);
    1190:	83 ec 04             	sub    $0x4,%esp
    1193:	6a 01                	push   $0x1
    1195:	57                   	push   %edi
    1196:	6a 00                	push   $0x0
    1198:	e8 d4 01 00 00       	call   1371 <read>
    if(cc < 1)
    119d:	83 c4 10             	add    $0x10,%esp
    11a0:	85 c0                	test   %eax,%eax
    11a2:	7e 1d                	jle    11c1 <gets+0x41>
      break;
    buf[i++] = c;
    11a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11a8:	8b 55 08             	mov    0x8(%ebp),%edx
    11ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11af:	3c 0a                	cmp    $0xa,%al
    11b1:	74 1d                	je     11d0 <gets+0x50>
    11b3:	3c 0d                	cmp    $0xd,%al
    11b5:	74 19                	je     11d0 <gets+0x50>
  for(i=0; i+1 < max; ){
    11b7:	89 de                	mov    %ebx,%esi
    11b9:	83 c3 01             	add    $0x1,%ebx
    11bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11bf:	7c cf                	jl     1190 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    11c1:	8b 45 08             	mov    0x8(%ebp),%eax
    11c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11cb:	5b                   	pop    %ebx
    11cc:	5e                   	pop    %esi
    11cd:	5f                   	pop    %edi
    11ce:	5d                   	pop    %ebp
    11cf:	c3                   	ret    
  buf[i] = '\0';
    11d0:	8b 45 08             	mov    0x8(%ebp),%eax
    11d3:	89 de                	mov    %ebx,%esi
    11d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    11d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11dc:	5b                   	pop    %ebx
    11dd:	5e                   	pop    %esi
    11de:	5f                   	pop    %edi
    11df:	5d                   	pop    %ebp
    11e0:	c3                   	ret    
    11e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ef:	90                   	nop

000011f0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	56                   	push   %esi
    11f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11f5:	83 ec 08             	sub    $0x8,%esp
    11f8:	6a 00                	push   $0x0
    11fa:	ff 75 08             	push   0x8(%ebp)
    11fd:	e8 97 01 00 00       	call   1399 <open>
  if(fd < 0)
    1202:	83 c4 10             	add    $0x10,%esp
    1205:	85 c0                	test   %eax,%eax
    1207:	78 27                	js     1230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1209:	83 ec 08             	sub    $0x8,%esp
    120c:	ff 75 0c             	push   0xc(%ebp)
    120f:	89 c3                	mov    %eax,%ebx
    1211:	50                   	push   %eax
    1212:	e8 9a 01 00 00       	call   13b1 <fstat>
  close(fd);
    1217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    121a:	89 c6                	mov    %eax,%esi
  close(fd);
    121c:	e8 60 01 00 00       	call   1381 <close>
  return r;
    1221:	83 c4 10             	add    $0x10,%esp
}
    1224:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1227:	89 f0                	mov    %esi,%eax
    1229:	5b                   	pop    %ebx
    122a:	5e                   	pop    %esi
    122b:	5d                   	pop    %ebp
    122c:	c3                   	ret    
    122d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1230:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1235:	eb ed                	jmp    1224 <stat+0x34>
    1237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    123e:	66 90                	xchg   %ax,%ax

00001240 <atoi>:

int
atoi(const char *s)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	53                   	push   %ebx
    1244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1247:	0f be 02             	movsbl (%edx),%eax
    124a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    124d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1255:	77 1e                	ja     1275 <atoi+0x35>
    1257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    125e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1260:	83 c2 01             	add    $0x1,%edx
    1263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    126a:	0f be 02             	movsbl (%edx),%eax
    126d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1270:	80 fb 09             	cmp    $0x9,%bl
    1273:	76 eb                	jbe    1260 <atoi+0x20>
  return n;
}
    1275:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1278:	89 c8                	mov    %ecx,%eax
    127a:	c9                   	leave  
    127b:	c3                   	ret    
    127c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	57                   	push   %edi
    1284:	8b 45 10             	mov    0x10(%ebp),%eax
    1287:	8b 55 08             	mov    0x8(%ebp),%edx
    128a:	56                   	push   %esi
    128b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    128e:	85 c0                	test   %eax,%eax
    1290:	7e 13                	jle    12a5 <memmove+0x25>
    1292:	01 d0                	add    %edx,%eax
  dst = vdst;
    1294:	89 d7                	mov    %edx,%edi
    1296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    129d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12a1:	39 f8                	cmp    %edi,%eax
    12a3:	75 fb                	jne    12a0 <memmove+0x20>
  return vdst;
}
    12a5:	5e                   	pop    %esi
    12a6:	89 d0                	mov    %edx,%eax
    12a8:	5f                   	pop    %edi
    12a9:	5d                   	pop    %ebp
    12aa:	c3                   	ret    
    12ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12af:	90                   	nop

000012b0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    12b6:	68 00 10 00 00       	push   $0x1000
    12bb:	e8 60 04 00 00       	call   1720 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    12c0:	50                   	push   %eax
    12c1:	ff 75 10             	push   0x10(%ebp)
    12c4:	ff 75 0c             	push   0xc(%ebp)
    12c7:	ff 75 08             	push   0x8(%ebp)
    12ca:	e8 42 01 00 00       	call   1411 <clone>
}
    12cf:	c9                   	leave  
    12d0:	c3                   	ret    
    12d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12df:	90                   	nop

000012e0 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    12e0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    12e1:	b9 01 00 00 00       	mov    $0x1,%ecx
    12e6:	89 e5                	mov    %esp,%ebp
    12e8:	8b 55 08             	mov    0x8(%ebp),%edx
    12eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12ef:	90                   	nop
    12f0:	89 c8                	mov    %ecx,%eax
    12f2:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    12f5:	85 c0                	test   %eax,%eax
    12f7:	75 f7                	jne    12f0 <lock_acquire+0x10>
}
    12f9:	5d                   	pop    %ebp
    12fa:	c3                   	ret    
    12fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12ff:	90                   	nop

00001300 <lock_release>:

void lock_release(lock_thread *lock){
    1300:	55                   	push   %ebp
    1301:	31 c0                	xor    %eax,%eax
    1303:	89 e5                	mov    %esp,%ebp
    1305:	8b 55 08             	mov    0x8(%ebp),%edx
    1308:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    130b:	5d                   	pop    %ebp
    130c:	c3                   	ret    
    130d:	8d 76 00             	lea    0x0(%esi),%esi

00001310 <lock_init>:

int lock_init(lock_thread *lock)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    1316:	68 3f 18 00 00       	push   $0x183f
    131b:	6a 01                	push   $0x1
    131d:	e8 ce 01 00 00       	call   14f0 <printf>
  lock->locked = 0;
    1322:	8b 45 08             	mov    0x8(%ebp),%eax
    1325:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    132b:	58                   	pop    %eax
    132c:	5a                   	pop    %edx
    132d:	68 3f 18 00 00       	push   $0x183f
    1332:	6a 01                	push   $0x1
    1334:	e8 b7 01 00 00       	call   14f0 <printf>
  return 0;
}
    1339:	31 c0                	xor    %eax,%eax
    133b:	c9                   	leave  
    133c:	c3                   	ret    
    133d:	8d 76 00             	lea    0x0(%esi),%esi

00001340 <thread_join>:



int thread_join()
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    1346:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1349:	50                   	push   %eax
    134a:	e8 ca 00 00 00       	call   1419 <join>
  return a;
    134f:	c9                   	leave  
    1350:	c3                   	ret    

00001351 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1351:	b8 01 00 00 00       	mov    $0x1,%eax
    1356:	cd 40                	int    $0x40
    1358:	c3                   	ret    

00001359 <exit>:
SYSCALL(exit)
    1359:	b8 02 00 00 00       	mov    $0x2,%eax
    135e:	cd 40                	int    $0x40
    1360:	c3                   	ret    

00001361 <wait>:
SYSCALL(wait)
    1361:	b8 03 00 00 00       	mov    $0x3,%eax
    1366:	cd 40                	int    $0x40
    1368:	c3                   	ret    

00001369 <pipe>:
SYSCALL(pipe)
    1369:	b8 04 00 00 00       	mov    $0x4,%eax
    136e:	cd 40                	int    $0x40
    1370:	c3                   	ret    

00001371 <read>:
SYSCALL(read)
    1371:	b8 05 00 00 00       	mov    $0x5,%eax
    1376:	cd 40                	int    $0x40
    1378:	c3                   	ret    

00001379 <write>:
SYSCALL(write)
    1379:	b8 10 00 00 00       	mov    $0x10,%eax
    137e:	cd 40                	int    $0x40
    1380:	c3                   	ret    

00001381 <close>:
SYSCALL(close)
    1381:	b8 15 00 00 00       	mov    $0x15,%eax
    1386:	cd 40                	int    $0x40
    1388:	c3                   	ret    

00001389 <kill>:
SYSCALL(kill)
    1389:	b8 06 00 00 00       	mov    $0x6,%eax
    138e:	cd 40                	int    $0x40
    1390:	c3                   	ret    

00001391 <exec>:
SYSCALL(exec)
    1391:	b8 07 00 00 00       	mov    $0x7,%eax
    1396:	cd 40                	int    $0x40
    1398:	c3                   	ret    

00001399 <open>:
SYSCALL(open)
    1399:	b8 0f 00 00 00       	mov    $0xf,%eax
    139e:	cd 40                	int    $0x40
    13a0:	c3                   	ret    

000013a1 <mknod>:
SYSCALL(mknod)
    13a1:	b8 11 00 00 00       	mov    $0x11,%eax
    13a6:	cd 40                	int    $0x40
    13a8:	c3                   	ret    

000013a9 <unlink>:
SYSCALL(unlink)
    13a9:	b8 12 00 00 00       	mov    $0x12,%eax
    13ae:	cd 40                	int    $0x40
    13b0:	c3                   	ret    

000013b1 <fstat>:
SYSCALL(fstat)
    13b1:	b8 08 00 00 00       	mov    $0x8,%eax
    13b6:	cd 40                	int    $0x40
    13b8:	c3                   	ret    

000013b9 <link>:
SYSCALL(link)
    13b9:	b8 13 00 00 00       	mov    $0x13,%eax
    13be:	cd 40                	int    $0x40
    13c0:	c3                   	ret    

000013c1 <mkdir>:
SYSCALL(mkdir)
    13c1:	b8 14 00 00 00       	mov    $0x14,%eax
    13c6:	cd 40                	int    $0x40
    13c8:	c3                   	ret    

000013c9 <chdir>:
SYSCALL(chdir)
    13c9:	b8 09 00 00 00       	mov    $0x9,%eax
    13ce:	cd 40                	int    $0x40
    13d0:	c3                   	ret    

000013d1 <dup>:
SYSCALL(dup)
    13d1:	b8 0a 00 00 00       	mov    $0xa,%eax
    13d6:	cd 40                	int    $0x40
    13d8:	c3                   	ret    

000013d9 <getpid>:
SYSCALL(getpid)
    13d9:	b8 0b 00 00 00       	mov    $0xb,%eax
    13de:	cd 40                	int    $0x40
    13e0:	c3                   	ret    

000013e1 <sbrk>:
SYSCALL(sbrk)
    13e1:	b8 0c 00 00 00       	mov    $0xc,%eax
    13e6:	cd 40                	int    $0x40
    13e8:	c3                   	ret    

000013e9 <sleep>:
SYSCALL(sleep)
    13e9:	b8 0d 00 00 00       	mov    $0xd,%eax
    13ee:	cd 40                	int    $0x40
    13f0:	c3                   	ret    

000013f1 <uptime>:
SYSCALL(uptime)
    13f1:	b8 0e 00 00 00       	mov    $0xe,%eax
    13f6:	cd 40                	int    $0x40
    13f8:	c3                   	ret    

000013f9 <getreadcount>:
SYSCALL(getreadcount)
    13f9:	b8 16 00 00 00       	mov    $0x16,%eax
    13fe:	cd 40                	int    $0x40
    1400:	c3                   	ret    

00001401 <settickets>:
SYSCALL(settickets)
    1401:	b8 17 00 00 00       	mov    $0x17,%eax
    1406:	cd 40                	int    $0x40
    1408:	c3                   	ret    

00001409 <getpinfo>:
SYSCALL(getpinfo)
    1409:	b8 18 00 00 00       	mov    $0x18,%eax
    140e:	cd 40                	int    $0x40
    1410:	c3                   	ret    

00001411 <clone>:
SYSCALL(clone)
    1411:	b8 19 00 00 00       	mov    $0x19,%eax
    1416:	cd 40                	int    $0x40
    1418:	c3                   	ret    

00001419 <join>:
SYSCALL(join)
    1419:	b8 1a 00 00 00       	mov    $0x1a,%eax
    141e:	cd 40                	int    $0x40
    1420:	c3                   	ret    

00001421 <mprotect>:
SYSCALL(mprotect)
    1421:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1426:	cd 40                	int    $0x40
    1428:	c3                   	ret    

00001429 <munprotect>:
SYSCALL(munprotect)
    1429:	b8 1c 00 00 00       	mov    $0x1c,%eax
    142e:	cd 40                	int    $0x40
    1430:	c3                   	ret    
    1431:	66 90                	xchg   %ax,%ax
    1433:	66 90                	xchg   %ax,%ax
    1435:	66 90                	xchg   %ax,%ax
    1437:	66 90                	xchg   %ax,%ax
    1439:	66 90                	xchg   %ax,%ax
    143b:	66 90                	xchg   %ax,%ax
    143d:	66 90                	xchg   %ax,%ax
    143f:	90                   	nop

00001440 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	57                   	push   %edi
    1444:	56                   	push   %esi
    1445:	53                   	push   %ebx
    1446:	83 ec 3c             	sub    $0x3c,%esp
    1449:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    144c:	89 d1                	mov    %edx,%ecx
{
    144e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1451:	85 d2                	test   %edx,%edx
    1453:	0f 89 7f 00 00 00    	jns    14d8 <printint+0x98>
    1459:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    145d:	74 79                	je     14d8 <printint+0x98>
    neg = 1;
    145f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1466:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1468:	31 db                	xor    %ebx,%ebx
    146a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    146d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1470:	89 c8                	mov    %ecx,%eax
    1472:	31 d2                	xor    %edx,%edx
    1474:	89 cf                	mov    %ecx,%edi
    1476:	f7 75 c4             	divl   -0x3c(%ebp)
    1479:	0f b6 92 a4 18 00 00 	movzbl 0x18a4(%edx),%edx
    1480:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1483:	89 d8                	mov    %ebx,%eax
    1485:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1488:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    148b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    148e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1491:	76 dd                	jbe    1470 <printint+0x30>
  if(neg)
    1493:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1496:	85 c9                	test   %ecx,%ecx
    1498:	74 0c                	je     14a6 <printint+0x66>
    buf[i++] = '-';
    149a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    149f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    14a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    14a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    14a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    14ad:	eb 07                	jmp    14b6 <printint+0x76>
    14af:	90                   	nop
    putc(fd, buf[i]);
    14b0:	0f b6 13             	movzbl (%ebx),%edx
    14b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    14b6:	83 ec 04             	sub    $0x4,%esp
    14b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    14bc:	6a 01                	push   $0x1
    14be:	56                   	push   %esi
    14bf:	57                   	push   %edi
    14c0:	e8 b4 fe ff ff       	call   1379 <write>
  while(--i >= 0)
    14c5:	83 c4 10             	add    $0x10,%esp
    14c8:	39 de                	cmp    %ebx,%esi
    14ca:	75 e4                	jne    14b0 <printint+0x70>
}
    14cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14cf:	5b                   	pop    %ebx
    14d0:	5e                   	pop    %esi
    14d1:	5f                   	pop    %edi
    14d2:	5d                   	pop    %ebp
    14d3:	c3                   	ret    
    14d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    14df:	eb 87                	jmp    1468 <printint+0x28>
    14e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ef:	90                   	nop

000014f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    14f0:	55                   	push   %ebp
    14f1:	89 e5                	mov    %esp,%ebp
    14f3:	57                   	push   %edi
    14f4:	56                   	push   %esi
    14f5:	53                   	push   %ebx
    14f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    14fc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    14ff:	0f b6 13             	movzbl (%ebx),%edx
    1502:	84 d2                	test   %dl,%dl
    1504:	74 6a                	je     1570 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1506:	8d 45 10             	lea    0x10(%ebp),%eax
    1509:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    150c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    150f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1511:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1514:	eb 36                	jmp    154c <printf+0x5c>
    1516:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    151d:	8d 76 00             	lea    0x0(%esi),%esi
    1520:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1523:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1528:	83 f8 25             	cmp    $0x25,%eax
    152b:	74 15                	je     1542 <printf+0x52>
  write(fd, &c, 1);
    152d:	83 ec 04             	sub    $0x4,%esp
    1530:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1533:	6a 01                	push   $0x1
    1535:	57                   	push   %edi
    1536:	56                   	push   %esi
    1537:	e8 3d fe ff ff       	call   1379 <write>
    153c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    153f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1542:	0f b6 13             	movzbl (%ebx),%edx
    1545:	83 c3 01             	add    $0x1,%ebx
    1548:	84 d2                	test   %dl,%dl
    154a:	74 24                	je     1570 <printf+0x80>
    c = fmt[i] & 0xff;
    154c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    154f:	85 c9                	test   %ecx,%ecx
    1551:	74 cd                	je     1520 <printf+0x30>
      }
    } else if(state == '%'){
    1553:	83 f9 25             	cmp    $0x25,%ecx
    1556:	75 ea                	jne    1542 <printf+0x52>
      if(c == 'd'){
    1558:	83 f8 25             	cmp    $0x25,%eax
    155b:	0f 84 07 01 00 00    	je     1668 <printf+0x178>
    1561:	83 e8 63             	sub    $0x63,%eax
    1564:	83 f8 15             	cmp    $0x15,%eax
    1567:	77 17                	ja     1580 <printf+0x90>
    1569:	ff 24 85 4c 18 00 00 	jmp    *0x184c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1570:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1573:	5b                   	pop    %ebx
    1574:	5e                   	pop    %esi
    1575:	5f                   	pop    %edi
    1576:	5d                   	pop    %ebp
    1577:	c3                   	ret    
    1578:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    157f:	90                   	nop
  write(fd, &c, 1);
    1580:	83 ec 04             	sub    $0x4,%esp
    1583:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1586:	6a 01                	push   $0x1
    1588:	57                   	push   %edi
    1589:	56                   	push   %esi
    158a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    158e:	e8 e6 fd ff ff       	call   1379 <write>
        putc(fd, c);
    1593:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1597:	83 c4 0c             	add    $0xc,%esp
    159a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    159d:	6a 01                	push   $0x1
    159f:	57                   	push   %edi
    15a0:	56                   	push   %esi
    15a1:	e8 d3 fd ff ff       	call   1379 <write>
        putc(fd, c);
    15a6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15a9:	31 c9                	xor    %ecx,%ecx
    15ab:	eb 95                	jmp    1542 <printf+0x52>
    15ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    15b0:	83 ec 0c             	sub    $0xc,%esp
    15b3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15b8:	6a 00                	push   $0x0
    15ba:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15bd:	8b 10                	mov    (%eax),%edx
    15bf:	89 f0                	mov    %esi,%eax
    15c1:	e8 7a fe ff ff       	call   1440 <printint>
        ap++;
    15c6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    15ca:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15cd:	31 c9                	xor    %ecx,%ecx
    15cf:	e9 6e ff ff ff       	jmp    1542 <printf+0x52>
    15d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    15d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15db:	8b 10                	mov    (%eax),%edx
        ap++;
    15dd:	83 c0 04             	add    $0x4,%eax
    15e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    15e3:	85 d2                	test   %edx,%edx
    15e5:	0f 84 8d 00 00 00    	je     1678 <printf+0x188>
        while(*s != 0){
    15eb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    15ee:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    15f0:	84 c0                	test   %al,%al
    15f2:	0f 84 4a ff ff ff    	je     1542 <printf+0x52>
    15f8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    15fb:	89 d3                	mov    %edx,%ebx
    15fd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1600:	83 ec 04             	sub    $0x4,%esp
          s++;
    1603:	83 c3 01             	add    $0x1,%ebx
    1606:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1609:	6a 01                	push   $0x1
    160b:	57                   	push   %edi
    160c:	56                   	push   %esi
    160d:	e8 67 fd ff ff       	call   1379 <write>
        while(*s != 0){
    1612:	0f b6 03             	movzbl (%ebx),%eax
    1615:	83 c4 10             	add    $0x10,%esp
    1618:	84 c0                	test   %al,%al
    161a:	75 e4                	jne    1600 <printf+0x110>
      state = 0;
    161c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    161f:	31 c9                	xor    %ecx,%ecx
    1621:	e9 1c ff ff ff       	jmp    1542 <printf+0x52>
    1626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    162d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1630:	83 ec 0c             	sub    $0xc,%esp
    1633:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1638:	6a 01                	push   $0x1
    163a:	e9 7b ff ff ff       	jmp    15ba <printf+0xca>
    163f:	90                   	nop
        putc(fd, *ap);
    1640:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1643:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1646:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1648:	6a 01                	push   $0x1
    164a:	57                   	push   %edi
    164b:	56                   	push   %esi
        putc(fd, *ap);
    164c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    164f:	e8 25 fd ff ff       	call   1379 <write>
        ap++;
    1654:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1658:	83 c4 10             	add    $0x10,%esp
      state = 0;
    165b:	31 c9                	xor    %ecx,%ecx
    165d:	e9 e0 fe ff ff       	jmp    1542 <printf+0x52>
    1662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1668:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    166b:	83 ec 04             	sub    $0x4,%esp
    166e:	e9 2a ff ff ff       	jmp    159d <printf+0xad>
    1673:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1677:	90                   	nop
          s = "(null)";
    1678:	ba 42 18 00 00       	mov    $0x1842,%edx
        while(*s != 0){
    167d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1680:	b8 28 00 00 00       	mov    $0x28,%eax
    1685:	89 d3                	mov    %edx,%ebx
    1687:	e9 74 ff ff ff       	jmp    1600 <printf+0x110>
    168c:	66 90                	xchg   %ax,%ax
    168e:	66 90                	xchg   %ax,%ax

00001690 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1690:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1691:	a1 f0 1b 00 00       	mov    0x1bf0,%eax
{
    1696:	89 e5                	mov    %esp,%ebp
    1698:	57                   	push   %edi
    1699:	56                   	push   %esi
    169a:	53                   	push   %ebx
    169b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    169e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16a8:	89 c2                	mov    %eax,%edx
    16aa:	8b 00                	mov    (%eax),%eax
    16ac:	39 ca                	cmp    %ecx,%edx
    16ae:	73 30                	jae    16e0 <free+0x50>
    16b0:	39 c1                	cmp    %eax,%ecx
    16b2:	72 04                	jb     16b8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16b4:	39 c2                	cmp    %eax,%edx
    16b6:	72 f0                	jb     16a8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16be:	39 f8                	cmp    %edi,%eax
    16c0:	74 30                	je     16f2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    16c2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    16c5:	8b 42 04             	mov    0x4(%edx),%eax
    16c8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    16cb:	39 f1                	cmp    %esi,%ecx
    16cd:	74 3a                	je     1709 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    16cf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16d1:	5b                   	pop    %ebx
  freep = p;
    16d2:	89 15 f0 1b 00 00    	mov    %edx,0x1bf0
}
    16d8:	5e                   	pop    %esi
    16d9:	5f                   	pop    %edi
    16da:	5d                   	pop    %ebp
    16db:	c3                   	ret    
    16dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16e0:	39 c2                	cmp    %eax,%edx
    16e2:	72 c4                	jb     16a8 <free+0x18>
    16e4:	39 c1                	cmp    %eax,%ecx
    16e6:	73 c0                	jae    16a8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    16e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16ee:	39 f8                	cmp    %edi,%eax
    16f0:	75 d0                	jne    16c2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    16f2:	03 70 04             	add    0x4(%eax),%esi
    16f5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16f8:	8b 02                	mov    (%edx),%eax
    16fa:	8b 00                	mov    (%eax),%eax
    16fc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    16ff:	8b 42 04             	mov    0x4(%edx),%eax
    1702:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1705:	39 f1                	cmp    %esi,%ecx
    1707:	75 c6                	jne    16cf <free+0x3f>
    p->s.size += bp->s.size;
    1709:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    170c:	89 15 f0 1b 00 00    	mov    %edx,0x1bf0
    p->s.size += bp->s.size;
    1712:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1715:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1718:	89 0a                	mov    %ecx,(%edx)
}
    171a:	5b                   	pop    %ebx
    171b:	5e                   	pop    %esi
    171c:	5f                   	pop    %edi
    171d:	5d                   	pop    %ebp
    171e:	c3                   	ret    
    171f:	90                   	nop

00001720 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1720:	55                   	push   %ebp
    1721:	89 e5                	mov    %esp,%ebp
    1723:	57                   	push   %edi
    1724:	56                   	push   %esi
    1725:	53                   	push   %ebx
    1726:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1729:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    172c:	8b 3d f0 1b 00 00    	mov    0x1bf0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1732:	8d 70 07             	lea    0x7(%eax),%esi
    1735:	c1 ee 03             	shr    $0x3,%esi
    1738:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    173b:	85 ff                	test   %edi,%edi
    173d:	0f 84 9d 00 00 00    	je     17e0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1743:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1745:	8b 4a 04             	mov    0x4(%edx),%ecx
    1748:	39 f1                	cmp    %esi,%ecx
    174a:	73 6a                	jae    17b6 <malloc+0x96>
    174c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1751:	39 de                	cmp    %ebx,%esi
    1753:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1756:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    175d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1760:	eb 17                	jmp    1779 <malloc+0x59>
    1762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1768:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    176a:	8b 48 04             	mov    0x4(%eax),%ecx
    176d:	39 f1                	cmp    %esi,%ecx
    176f:	73 4f                	jae    17c0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1771:	8b 3d f0 1b 00 00    	mov    0x1bf0,%edi
    1777:	89 c2                	mov    %eax,%edx
    1779:	39 d7                	cmp    %edx,%edi
    177b:	75 eb                	jne    1768 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    177d:	83 ec 0c             	sub    $0xc,%esp
    1780:	ff 75 e4             	push   -0x1c(%ebp)
    1783:	e8 59 fc ff ff       	call   13e1 <sbrk>
  if(p == (char*)-1)
    1788:	83 c4 10             	add    $0x10,%esp
    178b:	83 f8 ff             	cmp    $0xffffffff,%eax
    178e:	74 1c                	je     17ac <malloc+0x8c>
  hp->s.size = nu;
    1790:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1793:	83 ec 0c             	sub    $0xc,%esp
    1796:	83 c0 08             	add    $0x8,%eax
    1799:	50                   	push   %eax
    179a:	e8 f1 fe ff ff       	call   1690 <free>
  return freep;
    179f:	8b 15 f0 1b 00 00    	mov    0x1bf0,%edx
      if((p = morecore(nunits)) == 0)
    17a5:	83 c4 10             	add    $0x10,%esp
    17a8:	85 d2                	test   %edx,%edx
    17aa:	75 bc                	jne    1768 <malloc+0x48>
        return 0;
  }
}
    17ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    17af:	31 c0                	xor    %eax,%eax
}
    17b1:	5b                   	pop    %ebx
    17b2:	5e                   	pop    %esi
    17b3:	5f                   	pop    %edi
    17b4:	5d                   	pop    %ebp
    17b5:	c3                   	ret    
    if(p->s.size >= nunits){
    17b6:	89 d0                	mov    %edx,%eax
    17b8:	89 fa                	mov    %edi,%edx
    17ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    17c0:	39 ce                	cmp    %ecx,%esi
    17c2:	74 4c                	je     1810 <malloc+0xf0>
        p->s.size -= nunits;
    17c4:	29 f1                	sub    %esi,%ecx
    17c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    17c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    17cc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    17cf:	89 15 f0 1b 00 00    	mov    %edx,0x1bf0
}
    17d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    17d8:	83 c0 08             	add    $0x8,%eax
}
    17db:	5b                   	pop    %ebx
    17dc:	5e                   	pop    %esi
    17dd:	5f                   	pop    %edi
    17de:	5d                   	pop    %ebp
    17df:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    17e0:	c7 05 f0 1b 00 00 f4 	movl   $0x1bf4,0x1bf0
    17e7:	1b 00 00 
    base.s.size = 0;
    17ea:	bf f4 1b 00 00       	mov    $0x1bf4,%edi
    base.s.ptr = freep = prevp = &base;
    17ef:	c7 05 f4 1b 00 00 f4 	movl   $0x1bf4,0x1bf4
    17f6:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17f9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    17fb:	c7 05 f8 1b 00 00 00 	movl   $0x0,0x1bf8
    1802:	00 00 00 
    if(p->s.size >= nunits){
    1805:	e9 42 ff ff ff       	jmp    174c <malloc+0x2c>
    180a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1810:	8b 08                	mov    (%eax),%ecx
    1812:	89 0a                	mov    %ecx,(%edx)
    1814:	eb b9                	jmp    17cf <malloc+0xaf>
