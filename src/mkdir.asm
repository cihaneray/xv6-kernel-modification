
_mkdir:     file format elf32-i386


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
    100e:	bf 01 00 00 00       	mov    $0x1,%edi
    1013:	56                   	push   %esi
    1014:	53                   	push   %ebx
    1015:	51                   	push   %ecx
    1016:	83 ec 08             	sub    $0x8,%esp
    1019:	8b 59 04             	mov    0x4(%ecx),%ebx
    101c:	8b 31                	mov    (%ecx),%esi
    101e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
    1021:	83 fe 01             	cmp    $0x1,%esi
    1024:	7e 3e                	jle    1064 <main+0x64>
    1026:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    102d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
    1030:	83 ec 0c             	sub    $0xc,%esp
    1033:	ff 33                	push   (%ebx)
    1035:	e8 a7 03 00 00       	call   13e1 <mkdir>
    103a:	83 c4 10             	add    $0x10,%esp
    103d:	85 c0                	test   %eax,%eax
    103f:	78 0f                	js     1050 <main+0x50>
  for(i = 1; i < argc; i++){
    1041:	83 c7 01             	add    $0x1,%edi
    1044:	83 c3 04             	add    $0x4,%ebx
    1047:	39 fe                	cmp    %edi,%esi
    1049:	75 e5                	jne    1030 <main+0x30>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
    104b:	e8 29 03 00 00       	call   1379 <exit>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
    1050:	50                   	push   %eax
    1051:	ff 33                	push   (%ebx)
    1053:	68 4f 18 00 00       	push   $0x184f
    1058:	6a 02                	push   $0x2
    105a:	e8 b1 04 00 00       	call   1510 <printf>
      break;
    105f:	83 c4 10             	add    $0x10,%esp
    1062:	eb e7                	jmp    104b <main+0x4b>
    printf(2, "Usage: mkdir files...\n");
    1064:	52                   	push   %edx
    1065:	52                   	push   %edx
    1066:	68 38 18 00 00       	push   $0x1838
    106b:	6a 02                	push   $0x2
    106d:	e8 9e 04 00 00       	call   1510 <printf>
    exit();
    1072:	e8 02 03 00 00       	call   1379 <exit>
    1077:	66 90                	xchg   %ax,%ax
    1079:	66 90                	xchg   %ax,%ax
    107b:	66 90                	xchg   %ax,%ax
    107d:	66 90                	xchg   %ax,%ax
    107f:	90                   	nop

00001080 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    1080:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1081:	31 c0                	xor    %eax,%eax
{
    1083:	89 e5                	mov    %esp,%ebp
    1085:	53                   	push   %ebx
    1086:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1089:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    108c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1090:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1094:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1097:	83 c0 01             	add    $0x1,%eax
    109a:	84 d2                	test   %dl,%dl
    109c:	75 f2                	jne    1090 <strcpy+0x10>
    ;
  return os;
}
    109e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10a1:	89 c8                	mov    %ecx,%eax
    10a3:	c9                   	leave  
    10a4:	c3                   	ret    
    10a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	53                   	push   %ebx
    10b4:	8b 55 08             	mov    0x8(%ebp),%edx
    10b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10ba:	0f b6 02             	movzbl (%edx),%eax
    10bd:	84 c0                	test   %al,%al
    10bf:	75 17                	jne    10d8 <strcmp+0x28>
    10c1:	eb 3a                	jmp    10fd <strcmp+0x4d>
    10c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10c7:	90                   	nop
    10c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    10cc:	83 c2 01             	add    $0x1,%edx
    10cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10d2:	84 c0                	test   %al,%al
    10d4:	74 1a                	je     10f0 <strcmp+0x40>
    p++, q++;
    10d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    10d8:	0f b6 19             	movzbl (%ecx),%ebx
    10db:	38 c3                	cmp    %al,%bl
    10dd:	74 e9                	je     10c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    10df:	29 d8                	sub    %ebx,%eax
}
    10e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10e4:	c9                   	leave  
    10e5:	c3                   	ret    
    10e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    10f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10f4:	31 c0                	xor    %eax,%eax
    10f6:	29 d8                	sub    %ebx,%eax
}
    10f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10fb:	c9                   	leave  
    10fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    10fd:	0f b6 19             	movzbl (%ecx),%ebx
    1100:	31 c0                	xor    %eax,%eax
    1102:	eb db                	jmp    10df <strcmp+0x2f>
    1104:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    110b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    110f:	90                   	nop

00001110 <strlen>:

uint
strlen(const char *s)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1116:	80 3a 00             	cmpb   $0x0,(%edx)
    1119:	74 15                	je     1130 <strlen+0x20>
    111b:	31 c0                	xor    %eax,%eax
    111d:	8d 76 00             	lea    0x0(%esi),%esi
    1120:	83 c0 01             	add    $0x1,%eax
    1123:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1127:	89 c1                	mov    %eax,%ecx
    1129:	75 f5                	jne    1120 <strlen+0x10>
    ;
  return n;
}
    112b:	89 c8                	mov    %ecx,%eax
    112d:	5d                   	pop    %ebp
    112e:	c3                   	ret    
    112f:	90                   	nop
  for(n = 0; s[n]; n++)
    1130:	31 c9                	xor    %ecx,%ecx
}
    1132:	5d                   	pop    %ebp
    1133:	89 c8                	mov    %ecx,%eax
    1135:	c3                   	ret    
    1136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    113d:	8d 76 00             	lea    0x0(%esi),%esi

00001140 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1147:	8b 4d 10             	mov    0x10(%ebp),%ecx
    114a:	8b 45 0c             	mov    0xc(%ebp),%eax
    114d:	89 d7                	mov    %edx,%edi
    114f:	fc                   	cld    
    1150:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1152:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1155:	89 d0                	mov    %edx,%eax
    1157:	c9                   	leave  
    1158:	c3                   	ret    
    1159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001160 <strchr>:

char*
strchr(const char *s, char c)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	8b 45 08             	mov    0x8(%ebp),%eax
    1166:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    116a:	0f b6 10             	movzbl (%eax),%edx
    116d:	84 d2                	test   %dl,%dl
    116f:	75 12                	jne    1183 <strchr+0x23>
    1171:	eb 1d                	jmp    1190 <strchr+0x30>
    1173:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1177:	90                   	nop
    1178:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    117c:	83 c0 01             	add    $0x1,%eax
    117f:	84 d2                	test   %dl,%dl
    1181:	74 0d                	je     1190 <strchr+0x30>
    if(*s == c)
    1183:	38 d1                	cmp    %dl,%cl
    1185:	75 f1                	jne    1178 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1187:	5d                   	pop    %ebp
    1188:	c3                   	ret    
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1190:	31 c0                	xor    %eax,%eax
}
    1192:	5d                   	pop    %ebp
    1193:	c3                   	ret    
    1194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    119b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    119f:	90                   	nop

000011a0 <gets>:

char*
gets(char *buf, int max)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	57                   	push   %edi
    11a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    11a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    11a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    11a9:	31 db                	xor    %ebx,%ebx
{
    11ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    11ae:	eb 27                	jmp    11d7 <gets+0x37>
    cc = read(0, &c, 1);
    11b0:	83 ec 04             	sub    $0x4,%esp
    11b3:	6a 01                	push   $0x1
    11b5:	57                   	push   %edi
    11b6:	6a 00                	push   $0x0
    11b8:	e8 d4 01 00 00       	call   1391 <read>
    if(cc < 1)
    11bd:	83 c4 10             	add    $0x10,%esp
    11c0:	85 c0                	test   %eax,%eax
    11c2:	7e 1d                	jle    11e1 <gets+0x41>
      break;
    buf[i++] = c;
    11c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11c8:	8b 55 08             	mov    0x8(%ebp),%edx
    11cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11cf:	3c 0a                	cmp    $0xa,%al
    11d1:	74 1d                	je     11f0 <gets+0x50>
    11d3:	3c 0d                	cmp    $0xd,%al
    11d5:	74 19                	je     11f0 <gets+0x50>
  for(i=0; i+1 < max; ){
    11d7:	89 de                	mov    %ebx,%esi
    11d9:	83 c3 01             	add    $0x1,%ebx
    11dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11df:	7c cf                	jl     11b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    11e1:	8b 45 08             	mov    0x8(%ebp),%eax
    11e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11eb:	5b                   	pop    %ebx
    11ec:	5e                   	pop    %esi
    11ed:	5f                   	pop    %edi
    11ee:	5d                   	pop    %ebp
    11ef:	c3                   	ret    
  buf[i] = '\0';
    11f0:	8b 45 08             	mov    0x8(%ebp),%eax
    11f3:	89 de                	mov    %ebx,%esi
    11f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    11f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11fc:	5b                   	pop    %ebx
    11fd:	5e                   	pop    %esi
    11fe:	5f                   	pop    %edi
    11ff:	5d                   	pop    %ebp
    1200:	c3                   	ret    
    1201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1208:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120f:	90                   	nop

00001210 <stat>:

int
stat(const char *n, struct stat *st)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	56                   	push   %esi
    1214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1215:	83 ec 08             	sub    $0x8,%esp
    1218:	6a 00                	push   $0x0
    121a:	ff 75 08             	push   0x8(%ebp)
    121d:	e8 97 01 00 00       	call   13b9 <open>
  if(fd < 0)
    1222:	83 c4 10             	add    $0x10,%esp
    1225:	85 c0                	test   %eax,%eax
    1227:	78 27                	js     1250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1229:	83 ec 08             	sub    $0x8,%esp
    122c:	ff 75 0c             	push   0xc(%ebp)
    122f:	89 c3                	mov    %eax,%ebx
    1231:	50                   	push   %eax
    1232:	e8 9a 01 00 00       	call   13d1 <fstat>
  close(fd);
    1237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    123a:	89 c6                	mov    %eax,%esi
  close(fd);
    123c:	e8 60 01 00 00       	call   13a1 <close>
  return r;
    1241:	83 c4 10             	add    $0x10,%esp
}
    1244:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1247:	89 f0                	mov    %esi,%eax
    1249:	5b                   	pop    %ebx
    124a:	5e                   	pop    %esi
    124b:	5d                   	pop    %ebp
    124c:	c3                   	ret    
    124d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1250:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1255:	eb ed                	jmp    1244 <stat+0x34>
    1257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    125e:	66 90                	xchg   %ax,%ax

00001260 <atoi>:

int
atoi(const char *s)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	53                   	push   %ebx
    1264:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1267:	0f be 02             	movsbl (%edx),%eax
    126a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    126d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1270:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1275:	77 1e                	ja     1295 <atoi+0x35>
    1277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    127e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1280:	83 c2 01             	add    $0x1,%edx
    1283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    128a:	0f be 02             	movsbl (%edx),%eax
    128d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1290:	80 fb 09             	cmp    $0x9,%bl
    1293:	76 eb                	jbe    1280 <atoi+0x20>
  return n;
}
    1295:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1298:	89 c8                	mov    %ecx,%eax
    129a:	c9                   	leave  
    129b:	c3                   	ret    
    129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	57                   	push   %edi
    12a4:	8b 45 10             	mov    0x10(%ebp),%eax
    12a7:	8b 55 08             	mov    0x8(%ebp),%edx
    12aa:	56                   	push   %esi
    12ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ae:	85 c0                	test   %eax,%eax
    12b0:	7e 13                	jle    12c5 <memmove+0x25>
    12b2:	01 d0                	add    %edx,%eax
  dst = vdst;
    12b4:	89 d7                	mov    %edx,%edi
    12b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12c1:	39 f8                	cmp    %edi,%eax
    12c3:	75 fb                	jne    12c0 <memmove+0x20>
  return vdst;
}
    12c5:	5e                   	pop    %esi
    12c6:	89 d0                	mov    %edx,%eax
    12c8:	5f                   	pop    %edi
    12c9:	5d                   	pop    %ebp
    12ca:	c3                   	ret    
    12cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12cf:	90                   	nop

000012d0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    12d6:	68 00 10 00 00       	push   $0x1000
    12db:	e8 60 04 00 00       	call   1740 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    12e0:	50                   	push   %eax
    12e1:	ff 75 10             	push   0x10(%ebp)
    12e4:	ff 75 0c             	push   0xc(%ebp)
    12e7:	ff 75 08             	push   0x8(%ebp)
    12ea:	e8 42 01 00 00       	call   1431 <clone>
}
    12ef:	c9                   	leave  
    12f0:	c3                   	ret    
    12f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ff:	90                   	nop

00001300 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    1300:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1301:	b9 01 00 00 00       	mov    $0x1,%ecx
    1306:	89 e5                	mov    %esp,%ebp
    1308:	8b 55 08             	mov    0x8(%ebp),%edx
    130b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    130f:	90                   	nop
    1310:	89 c8                	mov    %ecx,%eax
    1312:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    1315:	85 c0                	test   %eax,%eax
    1317:	75 f7                	jne    1310 <lock_acquire+0x10>
}
    1319:	5d                   	pop    %ebp
    131a:	c3                   	ret    
    131b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    131f:	90                   	nop

00001320 <lock_release>:

void lock_release(lock_thread *lock){
    1320:	55                   	push   %ebp
    1321:	31 c0                	xor    %eax,%eax
    1323:	89 e5                	mov    %esp,%ebp
    1325:	8b 55 08             	mov    0x8(%ebp),%edx
    1328:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    132b:	5d                   	pop    %ebp
    132c:	c3                   	ret    
    132d:	8d 76 00             	lea    0x0(%esi),%esi

00001330 <lock_init>:

int lock_init(lock_thread *lock)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    1336:	68 6b 18 00 00       	push   $0x186b
    133b:	6a 01                	push   $0x1
    133d:	e8 ce 01 00 00       	call   1510 <printf>
  lock->locked = 0;
    1342:	8b 45 08             	mov    0x8(%ebp),%eax
    1345:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    134b:	58                   	pop    %eax
    134c:	5a                   	pop    %edx
    134d:	68 6b 18 00 00       	push   $0x186b
    1352:	6a 01                	push   $0x1
    1354:	e8 b7 01 00 00       	call   1510 <printf>
  return 0;
}
    1359:	31 c0                	xor    %eax,%eax
    135b:	c9                   	leave  
    135c:	c3                   	ret    
    135d:	8d 76 00             	lea    0x0(%esi),%esi

00001360 <thread_join>:



int thread_join()
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    1366:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1369:	50                   	push   %eax
    136a:	e8 ca 00 00 00       	call   1439 <join>
  return a;
    136f:	c9                   	leave  
    1370:	c3                   	ret    

00001371 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1371:	b8 01 00 00 00       	mov    $0x1,%eax
    1376:	cd 40                	int    $0x40
    1378:	c3                   	ret    

00001379 <exit>:
SYSCALL(exit)
    1379:	b8 02 00 00 00       	mov    $0x2,%eax
    137e:	cd 40                	int    $0x40
    1380:	c3                   	ret    

00001381 <wait>:
SYSCALL(wait)
    1381:	b8 03 00 00 00       	mov    $0x3,%eax
    1386:	cd 40                	int    $0x40
    1388:	c3                   	ret    

00001389 <pipe>:
SYSCALL(pipe)
    1389:	b8 04 00 00 00       	mov    $0x4,%eax
    138e:	cd 40                	int    $0x40
    1390:	c3                   	ret    

00001391 <read>:
SYSCALL(read)
    1391:	b8 05 00 00 00       	mov    $0x5,%eax
    1396:	cd 40                	int    $0x40
    1398:	c3                   	ret    

00001399 <write>:
SYSCALL(write)
    1399:	b8 10 00 00 00       	mov    $0x10,%eax
    139e:	cd 40                	int    $0x40
    13a0:	c3                   	ret    

000013a1 <close>:
SYSCALL(close)
    13a1:	b8 15 00 00 00       	mov    $0x15,%eax
    13a6:	cd 40                	int    $0x40
    13a8:	c3                   	ret    

000013a9 <kill>:
SYSCALL(kill)
    13a9:	b8 06 00 00 00       	mov    $0x6,%eax
    13ae:	cd 40                	int    $0x40
    13b0:	c3                   	ret    

000013b1 <exec>:
SYSCALL(exec)
    13b1:	b8 07 00 00 00       	mov    $0x7,%eax
    13b6:	cd 40                	int    $0x40
    13b8:	c3                   	ret    

000013b9 <open>:
SYSCALL(open)
    13b9:	b8 0f 00 00 00       	mov    $0xf,%eax
    13be:	cd 40                	int    $0x40
    13c0:	c3                   	ret    

000013c1 <mknod>:
SYSCALL(mknod)
    13c1:	b8 11 00 00 00       	mov    $0x11,%eax
    13c6:	cd 40                	int    $0x40
    13c8:	c3                   	ret    

000013c9 <unlink>:
SYSCALL(unlink)
    13c9:	b8 12 00 00 00       	mov    $0x12,%eax
    13ce:	cd 40                	int    $0x40
    13d0:	c3                   	ret    

000013d1 <fstat>:
SYSCALL(fstat)
    13d1:	b8 08 00 00 00       	mov    $0x8,%eax
    13d6:	cd 40                	int    $0x40
    13d8:	c3                   	ret    

000013d9 <link>:
SYSCALL(link)
    13d9:	b8 13 00 00 00       	mov    $0x13,%eax
    13de:	cd 40                	int    $0x40
    13e0:	c3                   	ret    

000013e1 <mkdir>:
SYSCALL(mkdir)
    13e1:	b8 14 00 00 00       	mov    $0x14,%eax
    13e6:	cd 40                	int    $0x40
    13e8:	c3                   	ret    

000013e9 <chdir>:
SYSCALL(chdir)
    13e9:	b8 09 00 00 00       	mov    $0x9,%eax
    13ee:	cd 40                	int    $0x40
    13f0:	c3                   	ret    

000013f1 <dup>:
SYSCALL(dup)
    13f1:	b8 0a 00 00 00       	mov    $0xa,%eax
    13f6:	cd 40                	int    $0x40
    13f8:	c3                   	ret    

000013f9 <getpid>:
SYSCALL(getpid)
    13f9:	b8 0b 00 00 00       	mov    $0xb,%eax
    13fe:	cd 40                	int    $0x40
    1400:	c3                   	ret    

00001401 <sbrk>:
SYSCALL(sbrk)
    1401:	b8 0c 00 00 00       	mov    $0xc,%eax
    1406:	cd 40                	int    $0x40
    1408:	c3                   	ret    

00001409 <sleep>:
SYSCALL(sleep)
    1409:	b8 0d 00 00 00       	mov    $0xd,%eax
    140e:	cd 40                	int    $0x40
    1410:	c3                   	ret    

00001411 <uptime>:
SYSCALL(uptime)
    1411:	b8 0e 00 00 00       	mov    $0xe,%eax
    1416:	cd 40                	int    $0x40
    1418:	c3                   	ret    

00001419 <getreadcount>:
SYSCALL(getreadcount)
    1419:	b8 16 00 00 00       	mov    $0x16,%eax
    141e:	cd 40                	int    $0x40
    1420:	c3                   	ret    

00001421 <settickets>:
SYSCALL(settickets)
    1421:	b8 17 00 00 00       	mov    $0x17,%eax
    1426:	cd 40                	int    $0x40
    1428:	c3                   	ret    

00001429 <getpinfo>:
SYSCALL(getpinfo)
    1429:	b8 18 00 00 00       	mov    $0x18,%eax
    142e:	cd 40                	int    $0x40
    1430:	c3                   	ret    

00001431 <clone>:
SYSCALL(clone)
    1431:	b8 19 00 00 00       	mov    $0x19,%eax
    1436:	cd 40                	int    $0x40
    1438:	c3                   	ret    

00001439 <join>:
SYSCALL(join)
    1439:	b8 1a 00 00 00       	mov    $0x1a,%eax
    143e:	cd 40                	int    $0x40
    1440:	c3                   	ret    

00001441 <mprotect>:
SYSCALL(mprotect)
    1441:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1446:	cd 40                	int    $0x40
    1448:	c3                   	ret    

00001449 <munprotect>:
SYSCALL(munprotect)
    1449:	b8 1c 00 00 00       	mov    $0x1c,%eax
    144e:	cd 40                	int    $0x40
    1450:	c3                   	ret    
    1451:	66 90                	xchg   %ax,%ax
    1453:	66 90                	xchg   %ax,%ax
    1455:	66 90                	xchg   %ax,%ax
    1457:	66 90                	xchg   %ax,%ax
    1459:	66 90                	xchg   %ax,%ax
    145b:	66 90                	xchg   %ax,%ax
    145d:	66 90                	xchg   %ax,%ax
    145f:	90                   	nop

00001460 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	57                   	push   %edi
    1464:	56                   	push   %esi
    1465:	53                   	push   %ebx
    1466:	83 ec 3c             	sub    $0x3c,%esp
    1469:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    146c:	89 d1                	mov    %edx,%ecx
{
    146e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1471:	85 d2                	test   %edx,%edx
    1473:	0f 89 7f 00 00 00    	jns    14f8 <printint+0x98>
    1479:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    147d:	74 79                	je     14f8 <printint+0x98>
    neg = 1;
    147f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1486:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1488:	31 db                	xor    %ebx,%ebx
    148a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    148d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1490:	89 c8                	mov    %ecx,%eax
    1492:	31 d2                	xor    %edx,%edx
    1494:	89 cf                	mov    %ecx,%edi
    1496:	f7 75 c4             	divl   -0x3c(%ebp)
    1499:	0f b6 92 d0 18 00 00 	movzbl 0x18d0(%edx),%edx
    14a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    14a3:	89 d8                	mov    %ebx,%eax
    14a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    14a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    14ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    14ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    14b1:	76 dd                	jbe    1490 <printint+0x30>
  if(neg)
    14b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    14b6:	85 c9                	test   %ecx,%ecx
    14b8:	74 0c                	je     14c6 <printint+0x66>
    buf[i++] = '-';
    14ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    14bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    14c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    14c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    14c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    14cd:	eb 07                	jmp    14d6 <printint+0x76>
    14cf:	90                   	nop
    putc(fd, buf[i]);
    14d0:	0f b6 13             	movzbl (%ebx),%edx
    14d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    14d6:	83 ec 04             	sub    $0x4,%esp
    14d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    14dc:	6a 01                	push   $0x1
    14de:	56                   	push   %esi
    14df:	57                   	push   %edi
    14e0:	e8 b4 fe ff ff       	call   1399 <write>
  while(--i >= 0)
    14e5:	83 c4 10             	add    $0x10,%esp
    14e8:	39 de                	cmp    %ebx,%esi
    14ea:	75 e4                	jne    14d0 <printint+0x70>
}
    14ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14ef:	5b                   	pop    %ebx
    14f0:	5e                   	pop    %esi
    14f1:	5f                   	pop    %edi
    14f2:	5d                   	pop    %ebp
    14f3:	c3                   	ret    
    14f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    14ff:	eb 87                	jmp    1488 <printint+0x28>
    1501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1508:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    150f:	90                   	nop

00001510 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1510:	55                   	push   %ebp
    1511:	89 e5                	mov    %esp,%ebp
    1513:	57                   	push   %edi
    1514:	56                   	push   %esi
    1515:	53                   	push   %ebx
    1516:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1519:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    151c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    151f:	0f b6 13             	movzbl (%ebx),%edx
    1522:	84 d2                	test   %dl,%dl
    1524:	74 6a                	je     1590 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1526:	8d 45 10             	lea    0x10(%ebp),%eax
    1529:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    152c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    152f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1531:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1534:	eb 36                	jmp    156c <printf+0x5c>
    1536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    153d:	8d 76 00             	lea    0x0(%esi),%esi
    1540:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1543:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1548:	83 f8 25             	cmp    $0x25,%eax
    154b:	74 15                	je     1562 <printf+0x52>
  write(fd, &c, 1);
    154d:	83 ec 04             	sub    $0x4,%esp
    1550:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1553:	6a 01                	push   $0x1
    1555:	57                   	push   %edi
    1556:	56                   	push   %esi
    1557:	e8 3d fe ff ff       	call   1399 <write>
    155c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    155f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1562:	0f b6 13             	movzbl (%ebx),%edx
    1565:	83 c3 01             	add    $0x1,%ebx
    1568:	84 d2                	test   %dl,%dl
    156a:	74 24                	je     1590 <printf+0x80>
    c = fmt[i] & 0xff;
    156c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    156f:	85 c9                	test   %ecx,%ecx
    1571:	74 cd                	je     1540 <printf+0x30>
      }
    } else if(state == '%'){
    1573:	83 f9 25             	cmp    $0x25,%ecx
    1576:	75 ea                	jne    1562 <printf+0x52>
      if(c == 'd'){
    1578:	83 f8 25             	cmp    $0x25,%eax
    157b:	0f 84 07 01 00 00    	je     1688 <printf+0x178>
    1581:	83 e8 63             	sub    $0x63,%eax
    1584:	83 f8 15             	cmp    $0x15,%eax
    1587:	77 17                	ja     15a0 <printf+0x90>
    1589:	ff 24 85 78 18 00 00 	jmp    *0x1878(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1590:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1593:	5b                   	pop    %ebx
    1594:	5e                   	pop    %esi
    1595:	5f                   	pop    %edi
    1596:	5d                   	pop    %ebp
    1597:	c3                   	ret    
    1598:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    159f:	90                   	nop
  write(fd, &c, 1);
    15a0:	83 ec 04             	sub    $0x4,%esp
    15a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    15a6:	6a 01                	push   $0x1
    15a8:	57                   	push   %edi
    15a9:	56                   	push   %esi
    15aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    15ae:	e8 e6 fd ff ff       	call   1399 <write>
        putc(fd, c);
    15b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    15b7:	83 c4 0c             	add    $0xc,%esp
    15ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
    15bd:	6a 01                	push   $0x1
    15bf:	57                   	push   %edi
    15c0:	56                   	push   %esi
    15c1:	e8 d3 fd ff ff       	call   1399 <write>
        putc(fd, c);
    15c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15c9:	31 c9                	xor    %ecx,%ecx
    15cb:	eb 95                	jmp    1562 <printf+0x52>
    15cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    15d0:	83 ec 0c             	sub    $0xc,%esp
    15d3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15d8:	6a 00                	push   $0x0
    15da:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15dd:	8b 10                	mov    (%eax),%edx
    15df:	89 f0                	mov    %esi,%eax
    15e1:	e8 7a fe ff ff       	call   1460 <printint>
        ap++;
    15e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    15ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15ed:	31 c9                	xor    %ecx,%ecx
    15ef:	e9 6e ff ff ff       	jmp    1562 <printf+0x52>
    15f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    15f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15fb:	8b 10                	mov    (%eax),%edx
        ap++;
    15fd:	83 c0 04             	add    $0x4,%eax
    1600:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1603:	85 d2                	test   %edx,%edx
    1605:	0f 84 8d 00 00 00    	je     1698 <printf+0x188>
        while(*s != 0){
    160b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    160e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1610:	84 c0                	test   %al,%al
    1612:	0f 84 4a ff ff ff    	je     1562 <printf+0x52>
    1618:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    161b:	89 d3                	mov    %edx,%ebx
    161d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1620:	83 ec 04             	sub    $0x4,%esp
          s++;
    1623:	83 c3 01             	add    $0x1,%ebx
    1626:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1629:	6a 01                	push   $0x1
    162b:	57                   	push   %edi
    162c:	56                   	push   %esi
    162d:	e8 67 fd ff ff       	call   1399 <write>
        while(*s != 0){
    1632:	0f b6 03             	movzbl (%ebx),%eax
    1635:	83 c4 10             	add    $0x10,%esp
    1638:	84 c0                	test   %al,%al
    163a:	75 e4                	jne    1620 <printf+0x110>
      state = 0;
    163c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    163f:	31 c9                	xor    %ecx,%ecx
    1641:	e9 1c ff ff ff       	jmp    1562 <printf+0x52>
    1646:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    164d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1650:	83 ec 0c             	sub    $0xc,%esp
    1653:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1658:	6a 01                	push   $0x1
    165a:	e9 7b ff ff ff       	jmp    15da <printf+0xca>
    165f:	90                   	nop
        putc(fd, *ap);
    1660:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1663:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1666:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1668:	6a 01                	push   $0x1
    166a:	57                   	push   %edi
    166b:	56                   	push   %esi
        putc(fd, *ap);
    166c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    166f:	e8 25 fd ff ff       	call   1399 <write>
        ap++;
    1674:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1678:	83 c4 10             	add    $0x10,%esp
      state = 0;
    167b:	31 c9                	xor    %ecx,%ecx
    167d:	e9 e0 fe ff ff       	jmp    1562 <printf+0x52>
    1682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1688:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    168b:	83 ec 04             	sub    $0x4,%esp
    168e:	e9 2a ff ff ff       	jmp    15bd <printf+0xad>
    1693:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1697:	90                   	nop
          s = "(null)";
    1698:	ba 6e 18 00 00       	mov    $0x186e,%edx
        while(*s != 0){
    169d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    16a0:	b8 28 00 00 00       	mov    $0x28,%eax
    16a5:	89 d3                	mov    %edx,%ebx
    16a7:	e9 74 ff ff ff       	jmp    1620 <printf+0x110>
    16ac:	66 90                	xchg   %ax,%ax
    16ae:	66 90                	xchg   %ax,%ax

000016b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b1:	a1 28 1c 00 00       	mov    0x1c28,%eax
{
    16b6:	89 e5                	mov    %esp,%ebp
    16b8:	57                   	push   %edi
    16b9:	56                   	push   %esi
    16ba:	53                   	push   %ebx
    16bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    16be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16c8:	89 c2                	mov    %eax,%edx
    16ca:	8b 00                	mov    (%eax),%eax
    16cc:	39 ca                	cmp    %ecx,%edx
    16ce:	73 30                	jae    1700 <free+0x50>
    16d0:	39 c1                	cmp    %eax,%ecx
    16d2:	72 04                	jb     16d8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16d4:	39 c2                	cmp    %eax,%edx
    16d6:	72 f0                	jb     16c8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16de:	39 f8                	cmp    %edi,%eax
    16e0:	74 30                	je     1712 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    16e2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    16e5:	8b 42 04             	mov    0x4(%edx),%eax
    16e8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    16eb:	39 f1                	cmp    %esi,%ecx
    16ed:	74 3a                	je     1729 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    16ef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16f1:	5b                   	pop    %ebx
  freep = p;
    16f2:	89 15 28 1c 00 00    	mov    %edx,0x1c28
}
    16f8:	5e                   	pop    %esi
    16f9:	5f                   	pop    %edi
    16fa:	5d                   	pop    %ebp
    16fb:	c3                   	ret    
    16fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1700:	39 c2                	cmp    %eax,%edx
    1702:	72 c4                	jb     16c8 <free+0x18>
    1704:	39 c1                	cmp    %eax,%ecx
    1706:	73 c0                	jae    16c8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1708:	8b 73 fc             	mov    -0x4(%ebx),%esi
    170b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    170e:	39 f8                	cmp    %edi,%eax
    1710:	75 d0                	jne    16e2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1712:	03 70 04             	add    0x4(%eax),%esi
    1715:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1718:	8b 02                	mov    (%edx),%eax
    171a:	8b 00                	mov    (%eax),%eax
    171c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    171f:	8b 42 04             	mov    0x4(%edx),%eax
    1722:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1725:	39 f1                	cmp    %esi,%ecx
    1727:	75 c6                	jne    16ef <free+0x3f>
    p->s.size += bp->s.size;
    1729:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    172c:	89 15 28 1c 00 00    	mov    %edx,0x1c28
    p->s.size += bp->s.size;
    1732:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1735:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1738:	89 0a                	mov    %ecx,(%edx)
}
    173a:	5b                   	pop    %ebx
    173b:	5e                   	pop    %esi
    173c:	5f                   	pop    %edi
    173d:	5d                   	pop    %ebp
    173e:	c3                   	ret    
    173f:	90                   	nop

00001740 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1740:	55                   	push   %ebp
    1741:	89 e5                	mov    %esp,%ebp
    1743:	57                   	push   %edi
    1744:	56                   	push   %esi
    1745:	53                   	push   %ebx
    1746:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1749:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    174c:	8b 3d 28 1c 00 00    	mov    0x1c28,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1752:	8d 70 07             	lea    0x7(%eax),%esi
    1755:	c1 ee 03             	shr    $0x3,%esi
    1758:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    175b:	85 ff                	test   %edi,%edi
    175d:	0f 84 9d 00 00 00    	je     1800 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1763:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1765:	8b 4a 04             	mov    0x4(%edx),%ecx
    1768:	39 f1                	cmp    %esi,%ecx
    176a:	73 6a                	jae    17d6 <malloc+0x96>
    176c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1771:	39 de                	cmp    %ebx,%esi
    1773:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1776:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    177d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1780:	eb 17                	jmp    1799 <malloc+0x59>
    1782:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1788:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    178a:	8b 48 04             	mov    0x4(%eax),%ecx
    178d:	39 f1                	cmp    %esi,%ecx
    178f:	73 4f                	jae    17e0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1791:	8b 3d 28 1c 00 00    	mov    0x1c28,%edi
    1797:	89 c2                	mov    %eax,%edx
    1799:	39 d7                	cmp    %edx,%edi
    179b:	75 eb                	jne    1788 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    179d:	83 ec 0c             	sub    $0xc,%esp
    17a0:	ff 75 e4             	push   -0x1c(%ebp)
    17a3:	e8 59 fc ff ff       	call   1401 <sbrk>
  if(p == (char*)-1)
    17a8:	83 c4 10             	add    $0x10,%esp
    17ab:	83 f8 ff             	cmp    $0xffffffff,%eax
    17ae:	74 1c                	je     17cc <malloc+0x8c>
  hp->s.size = nu;
    17b0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    17b3:	83 ec 0c             	sub    $0xc,%esp
    17b6:	83 c0 08             	add    $0x8,%eax
    17b9:	50                   	push   %eax
    17ba:	e8 f1 fe ff ff       	call   16b0 <free>
  return freep;
    17bf:	8b 15 28 1c 00 00    	mov    0x1c28,%edx
      if((p = morecore(nunits)) == 0)
    17c5:	83 c4 10             	add    $0x10,%esp
    17c8:	85 d2                	test   %edx,%edx
    17ca:	75 bc                	jne    1788 <malloc+0x48>
        return 0;
  }
}
    17cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    17cf:	31 c0                	xor    %eax,%eax
}
    17d1:	5b                   	pop    %ebx
    17d2:	5e                   	pop    %esi
    17d3:	5f                   	pop    %edi
    17d4:	5d                   	pop    %ebp
    17d5:	c3                   	ret    
    if(p->s.size >= nunits){
    17d6:	89 d0                	mov    %edx,%eax
    17d8:	89 fa                	mov    %edi,%edx
    17da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    17e0:	39 ce                	cmp    %ecx,%esi
    17e2:	74 4c                	je     1830 <malloc+0xf0>
        p->s.size -= nunits;
    17e4:	29 f1                	sub    %esi,%ecx
    17e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    17e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    17ec:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    17ef:	89 15 28 1c 00 00    	mov    %edx,0x1c28
}
    17f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    17f8:	83 c0 08             	add    $0x8,%eax
}
    17fb:	5b                   	pop    %ebx
    17fc:	5e                   	pop    %esi
    17fd:	5f                   	pop    %edi
    17fe:	5d                   	pop    %ebp
    17ff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1800:	c7 05 28 1c 00 00 2c 	movl   $0x1c2c,0x1c28
    1807:	1c 00 00 
    base.s.size = 0;
    180a:	bf 2c 1c 00 00       	mov    $0x1c2c,%edi
    base.s.ptr = freep = prevp = &base;
    180f:	c7 05 2c 1c 00 00 2c 	movl   $0x1c2c,0x1c2c
    1816:	1c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1819:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    181b:	c7 05 30 1c 00 00 00 	movl   $0x0,0x1c30
    1822:	00 00 00 
    if(p->s.size >= nunits){
    1825:	e9 42 ff ff ff       	jmp    176c <malloc+0x2c>
    182a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1830:	8b 08                	mov    (%eax),%ecx
    1832:	89 0a                	mov    %ecx,(%edx)
    1834:	eb b9                	jmp    17ef <malloc+0xaf>
