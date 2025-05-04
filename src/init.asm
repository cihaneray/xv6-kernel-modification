
_init:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	53                   	push   %ebx
    100e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    100f:	83 ec 08             	sub    $0x8,%esp
    1012:	6a 02                	push   $0x2
    1014:	68 a8 18 00 00       	push   $0x18a8
    1019:	e8 0b 04 00 00       	call   1429 <open>
    101e:	83 c4 10             	add    $0x10,%esp
    1021:	85 c0                	test   %eax,%eax
    1023:	0f 88 9f 00 00 00    	js     10c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
    1029:	83 ec 0c             	sub    $0xc,%esp
    102c:	6a 00                	push   $0x0
    102e:	e8 2e 04 00 00       	call   1461 <dup>
  dup(0);  // stderr
    1033:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    103a:	e8 22 04 00 00       	call   1461 <dup>
    103f:	83 c4 10             	add    $0x10,%esp
    1042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
    1048:	83 ec 08             	sub    $0x8,%esp
    104b:	68 b0 18 00 00       	push   $0x18b0
    1050:	6a 01                	push   $0x1
    1052:	e8 29 05 00 00       	call   1580 <printf>
    pid = fork();
    1057:	e8 85 03 00 00       	call   13e1 <fork>
    if(pid < 0){
    105c:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    105f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    1061:	85 c0                	test   %eax,%eax
    1063:	78 2c                	js     1091 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
    1065:	74 3d                	je     10a4 <main+0xa4>
    1067:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    106e:	66 90                	xchg   %ax,%ax
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
    1070:	e8 7c 03 00 00       	call   13f1 <wait>
    1075:	85 c0                	test   %eax,%eax
    1077:	78 cf                	js     1048 <main+0x48>
    1079:	39 c3                	cmp    %eax,%ebx
    107b:	74 cb                	je     1048 <main+0x48>
      printf(1, "zombie!\n");
    107d:	83 ec 08             	sub    $0x8,%esp
    1080:	68 ef 18 00 00       	push   $0x18ef
    1085:	6a 01                	push   $0x1
    1087:	e8 f4 04 00 00       	call   1580 <printf>
    108c:	83 c4 10             	add    $0x10,%esp
    108f:	eb df                	jmp    1070 <main+0x70>
      printf(1, "init: fork failed\n");
    1091:	53                   	push   %ebx
    1092:	53                   	push   %ebx
    1093:	68 c3 18 00 00       	push   $0x18c3
    1098:	6a 01                	push   $0x1
    109a:	e8 e1 04 00 00       	call   1580 <printf>
      exit();
    109f:	e8 45 03 00 00       	call   13e9 <exit>
      exec("sh", argv);
    10a4:	50                   	push   %eax
    10a5:	50                   	push   %eax
    10a6:	68 a8 1c 00 00       	push   $0x1ca8
    10ab:	68 d6 18 00 00       	push   $0x18d6
    10b0:	e8 6c 03 00 00       	call   1421 <exec>
      printf(1, "init: exec sh failed\n");
    10b5:	5a                   	pop    %edx
    10b6:	59                   	pop    %ecx
    10b7:	68 d9 18 00 00       	push   $0x18d9
    10bc:	6a 01                	push   $0x1
    10be:	e8 bd 04 00 00       	call   1580 <printf>
      exit();
    10c3:	e8 21 03 00 00       	call   13e9 <exit>
    mknod("console", 1, 1);
    10c8:	50                   	push   %eax
    10c9:	6a 01                	push   $0x1
    10cb:	6a 01                	push   $0x1
    10cd:	68 a8 18 00 00       	push   $0x18a8
    10d2:	e8 5a 03 00 00       	call   1431 <mknod>
    open("console", O_RDWR);
    10d7:	58                   	pop    %eax
    10d8:	5a                   	pop    %edx
    10d9:	6a 02                	push   $0x2
    10db:	68 a8 18 00 00       	push   $0x18a8
    10e0:	e8 44 03 00 00       	call   1429 <open>
    10e5:	83 c4 10             	add    $0x10,%esp
    10e8:	e9 3c ff ff ff       	jmp    1029 <main+0x29>
    10ed:	66 90                	xchg   %ax,%ax
    10ef:	90                   	nop

000010f0 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    10f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10f1:	31 c0                	xor    %eax,%eax
{
    10f3:	89 e5                	mov    %esp,%ebp
    10f5:	53                   	push   %ebx
    10f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    10fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1107:	83 c0 01             	add    $0x1,%eax
    110a:	84 d2                	test   %dl,%dl
    110c:	75 f2                	jne    1100 <strcpy+0x10>
    ;
  return os;
}
    110e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1111:	89 c8                	mov    %ecx,%eax
    1113:	c9                   	leave  
    1114:	c3                   	ret    
    1115:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	53                   	push   %ebx
    1124:	8b 55 08             	mov    0x8(%ebp),%edx
    1127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    112a:	0f b6 02             	movzbl (%edx),%eax
    112d:	84 c0                	test   %al,%al
    112f:	75 17                	jne    1148 <strcmp+0x28>
    1131:	eb 3a                	jmp    116d <strcmp+0x4d>
    1133:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1137:	90                   	nop
    1138:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    113c:	83 c2 01             	add    $0x1,%edx
    113f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1142:	84 c0                	test   %al,%al
    1144:	74 1a                	je     1160 <strcmp+0x40>
    p++, q++;
    1146:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1148:	0f b6 19             	movzbl (%ecx),%ebx
    114b:	38 c3                	cmp    %al,%bl
    114d:	74 e9                	je     1138 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    114f:	29 d8                	sub    %ebx,%eax
}
    1151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1154:	c9                   	leave  
    1155:	c3                   	ret    
    1156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    115d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1164:	31 c0                	xor    %eax,%eax
    1166:	29 d8                	sub    %ebx,%eax
}
    1168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    116b:	c9                   	leave  
    116c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    116d:	0f b6 19             	movzbl (%ecx),%ebx
    1170:	31 c0                	xor    %eax,%eax
    1172:	eb db                	jmp    114f <strcmp+0x2f>
    1174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    117f:	90                   	nop

00001180 <strlen>:

uint
strlen(const char *s)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1186:	80 3a 00             	cmpb   $0x0,(%edx)
    1189:	74 15                	je     11a0 <strlen+0x20>
    118b:	31 c0                	xor    %eax,%eax
    118d:	8d 76 00             	lea    0x0(%esi),%esi
    1190:	83 c0 01             	add    $0x1,%eax
    1193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1197:	89 c1                	mov    %eax,%ecx
    1199:	75 f5                	jne    1190 <strlen+0x10>
    ;
  return n;
}
    119b:	89 c8                	mov    %ecx,%eax
    119d:	5d                   	pop    %ebp
    119e:	c3                   	ret    
    119f:	90                   	nop
  for(n = 0; s[n]; n++)
    11a0:	31 c9                	xor    %ecx,%ecx
}
    11a2:	5d                   	pop    %ebp
    11a3:	89 c8                	mov    %ecx,%eax
    11a5:	c3                   	ret    
    11a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ad:	8d 76 00             	lea    0x0(%esi),%esi

000011b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    11bd:	89 d7                	mov    %edx,%edi
    11bf:	fc                   	cld    
    11c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
    11c5:	89 d0                	mov    %edx,%eax
    11c7:	c9                   	leave  
    11c8:	c3                   	ret    
    11c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011d0 <strchr>:

char*
strchr(const char *s, char c)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	8b 45 08             	mov    0x8(%ebp),%eax
    11d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    11da:	0f b6 10             	movzbl (%eax),%edx
    11dd:	84 d2                	test   %dl,%dl
    11df:	75 12                	jne    11f3 <strchr+0x23>
    11e1:	eb 1d                	jmp    1200 <strchr+0x30>
    11e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11e7:	90                   	nop
    11e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    11ec:	83 c0 01             	add    $0x1,%eax
    11ef:	84 d2                	test   %dl,%dl
    11f1:	74 0d                	je     1200 <strchr+0x30>
    if(*s == c)
    11f3:	38 d1                	cmp    %dl,%cl
    11f5:	75 f1                	jne    11e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
    11f7:	5d                   	pop    %ebp
    11f8:	c3                   	ret    
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1200:	31 c0                	xor    %eax,%eax
}
    1202:	5d                   	pop    %ebp
    1203:	c3                   	ret    
    1204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    120f:	90                   	nop

00001210 <gets>:

char*
gets(char *buf, int max)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	57                   	push   %edi
    1214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1215:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1218:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1219:	31 db                	xor    %ebx,%ebx
{
    121b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    121e:	eb 27                	jmp    1247 <gets+0x37>
    cc = read(0, &c, 1);
    1220:	83 ec 04             	sub    $0x4,%esp
    1223:	6a 01                	push   $0x1
    1225:	57                   	push   %edi
    1226:	6a 00                	push   $0x0
    1228:	e8 d4 01 00 00       	call   1401 <read>
    if(cc < 1)
    122d:	83 c4 10             	add    $0x10,%esp
    1230:	85 c0                	test   %eax,%eax
    1232:	7e 1d                	jle    1251 <gets+0x41>
      break;
    buf[i++] = c;
    1234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1238:	8b 55 08             	mov    0x8(%ebp),%edx
    123b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    123f:	3c 0a                	cmp    $0xa,%al
    1241:	74 1d                	je     1260 <gets+0x50>
    1243:	3c 0d                	cmp    $0xd,%al
    1245:	74 19                	je     1260 <gets+0x50>
  for(i=0; i+1 < max; ){
    1247:	89 de                	mov    %ebx,%esi
    1249:	83 c3 01             	add    $0x1,%ebx
    124c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    124f:	7c cf                	jl     1220 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1251:	8b 45 08             	mov    0x8(%ebp),%eax
    1254:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1258:	8d 65 f4             	lea    -0xc(%ebp),%esp
    125b:	5b                   	pop    %ebx
    125c:	5e                   	pop    %esi
    125d:	5f                   	pop    %edi
    125e:	5d                   	pop    %ebp
    125f:	c3                   	ret    
  buf[i] = '\0';
    1260:	8b 45 08             	mov    0x8(%ebp),%eax
    1263:	89 de                	mov    %ebx,%esi
    1265:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    1269:	8d 65 f4             	lea    -0xc(%ebp),%esp
    126c:	5b                   	pop    %ebx
    126d:	5e                   	pop    %esi
    126e:	5f                   	pop    %edi
    126f:	5d                   	pop    %ebp
    1270:	c3                   	ret    
    1271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1278:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    127f:	90                   	nop

00001280 <stat>:

int
stat(const char *n, struct stat *st)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	56                   	push   %esi
    1284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1285:	83 ec 08             	sub    $0x8,%esp
    1288:	6a 00                	push   $0x0
    128a:	ff 75 08             	push   0x8(%ebp)
    128d:	e8 97 01 00 00       	call   1429 <open>
  if(fd < 0)
    1292:	83 c4 10             	add    $0x10,%esp
    1295:	85 c0                	test   %eax,%eax
    1297:	78 27                	js     12c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1299:	83 ec 08             	sub    $0x8,%esp
    129c:	ff 75 0c             	push   0xc(%ebp)
    129f:	89 c3                	mov    %eax,%ebx
    12a1:	50                   	push   %eax
    12a2:	e8 9a 01 00 00       	call   1441 <fstat>
  close(fd);
    12a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12aa:	89 c6                	mov    %eax,%esi
  close(fd);
    12ac:	e8 60 01 00 00       	call   1411 <close>
  return r;
    12b1:	83 c4 10             	add    $0x10,%esp
}
    12b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12b7:	89 f0                	mov    %esi,%eax
    12b9:	5b                   	pop    %ebx
    12ba:	5e                   	pop    %esi
    12bb:	5d                   	pop    %ebp
    12bc:	c3                   	ret    
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    12c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12c5:	eb ed                	jmp    12b4 <stat+0x34>
    12c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ce:	66 90                	xchg   %ax,%ax

000012d0 <atoi>:

int
atoi(const char *s)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	53                   	push   %ebx
    12d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12d7:	0f be 02             	movsbl (%edx),%eax
    12da:	8d 48 d0             	lea    -0x30(%eax),%ecx
    12dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    12e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    12e5:	77 1e                	ja     1305 <atoi+0x35>
    12e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ee:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    12f0:	83 c2 01             	add    $0x1,%edx
    12f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    12f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    12fa:	0f be 02             	movsbl (%edx),%eax
    12fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1300:	80 fb 09             	cmp    $0x9,%bl
    1303:	76 eb                	jbe    12f0 <atoi+0x20>
  return n;
}
    1305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1308:	89 c8                	mov    %ecx,%eax
    130a:	c9                   	leave  
    130b:	c3                   	ret    
    130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	57                   	push   %edi
    1314:	8b 45 10             	mov    0x10(%ebp),%eax
    1317:	8b 55 08             	mov    0x8(%ebp),%edx
    131a:	56                   	push   %esi
    131b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    131e:	85 c0                	test   %eax,%eax
    1320:	7e 13                	jle    1335 <memmove+0x25>
    1322:	01 d0                	add    %edx,%eax
  dst = vdst;
    1324:	89 d7                	mov    %edx,%edi
    1326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    132d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1331:	39 f8                	cmp    %edi,%eax
    1333:	75 fb                	jne    1330 <memmove+0x20>
  return vdst;
}
    1335:	5e                   	pop    %esi
    1336:	89 d0                	mov    %edx,%eax
    1338:	5f                   	pop    %edi
    1339:	5d                   	pop    %ebp
    133a:	c3                   	ret    
    133b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    133f:	90                   	nop

00001340 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    1346:	68 00 10 00 00       	push   $0x1000
    134b:	e8 60 04 00 00       	call   17b0 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    1350:	50                   	push   %eax
    1351:	ff 75 10             	push   0x10(%ebp)
    1354:	ff 75 0c             	push   0xc(%ebp)
    1357:	ff 75 08             	push   0x8(%ebp)
    135a:	e8 42 01 00 00       	call   14a1 <clone>
}
    135f:	c9                   	leave  
    1360:	c3                   	ret    
    1361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1368:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    136f:	90                   	nop

00001370 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    1370:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1371:	b9 01 00 00 00       	mov    $0x1,%ecx
    1376:	89 e5                	mov    %esp,%ebp
    1378:	8b 55 08             	mov    0x8(%ebp),%edx
    137b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    137f:	90                   	nop
    1380:	89 c8                	mov    %ecx,%eax
    1382:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    1385:	85 c0                	test   %eax,%eax
    1387:	75 f7                	jne    1380 <lock_acquire+0x10>
}
    1389:	5d                   	pop    %ebp
    138a:	c3                   	ret    
    138b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    138f:	90                   	nop

00001390 <lock_release>:

void lock_release(lock_thread *lock){
    1390:	55                   	push   %ebp
    1391:	31 c0                	xor    %eax,%eax
    1393:	89 e5                	mov    %esp,%ebp
    1395:	8b 55 08             	mov    0x8(%ebp),%edx
    1398:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    139b:	5d                   	pop    %ebp
    139c:	c3                   	ret    
    139d:	8d 76 00             	lea    0x0(%esi),%esi

000013a0 <lock_init>:

int lock_init(lock_thread *lock)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    13a6:	68 f8 18 00 00       	push   $0x18f8
    13ab:	6a 01                	push   $0x1
    13ad:	e8 ce 01 00 00       	call   1580 <printf>
  lock->locked = 0;
    13b2:	8b 45 08             	mov    0x8(%ebp),%eax
    13b5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    13bb:	58                   	pop    %eax
    13bc:	5a                   	pop    %edx
    13bd:	68 f8 18 00 00       	push   $0x18f8
    13c2:	6a 01                	push   $0x1
    13c4:	e8 b7 01 00 00       	call   1580 <printf>
  return 0;
}
    13c9:	31 c0                	xor    %eax,%eax
    13cb:	c9                   	leave  
    13cc:	c3                   	ret    
    13cd:	8d 76 00             	lea    0x0(%esi),%esi

000013d0 <thread_join>:



int thread_join()
{
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    13d3:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    13d6:	8d 45 f4             	lea    -0xc(%ebp),%eax
    13d9:	50                   	push   %eax
    13da:	e8 ca 00 00 00       	call   14a9 <join>
  return a;
    13df:	c9                   	leave  
    13e0:	c3                   	ret    

000013e1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    13e1:	b8 01 00 00 00       	mov    $0x1,%eax
    13e6:	cd 40                	int    $0x40
    13e8:	c3                   	ret    

000013e9 <exit>:
SYSCALL(exit)
    13e9:	b8 02 00 00 00       	mov    $0x2,%eax
    13ee:	cd 40                	int    $0x40
    13f0:	c3                   	ret    

000013f1 <wait>:
SYSCALL(wait)
    13f1:	b8 03 00 00 00       	mov    $0x3,%eax
    13f6:	cd 40                	int    $0x40
    13f8:	c3                   	ret    

000013f9 <pipe>:
SYSCALL(pipe)
    13f9:	b8 04 00 00 00       	mov    $0x4,%eax
    13fe:	cd 40                	int    $0x40
    1400:	c3                   	ret    

00001401 <read>:
SYSCALL(read)
    1401:	b8 05 00 00 00       	mov    $0x5,%eax
    1406:	cd 40                	int    $0x40
    1408:	c3                   	ret    

00001409 <write>:
SYSCALL(write)
    1409:	b8 10 00 00 00       	mov    $0x10,%eax
    140e:	cd 40                	int    $0x40
    1410:	c3                   	ret    

00001411 <close>:
SYSCALL(close)
    1411:	b8 15 00 00 00       	mov    $0x15,%eax
    1416:	cd 40                	int    $0x40
    1418:	c3                   	ret    

00001419 <kill>:
SYSCALL(kill)
    1419:	b8 06 00 00 00       	mov    $0x6,%eax
    141e:	cd 40                	int    $0x40
    1420:	c3                   	ret    

00001421 <exec>:
SYSCALL(exec)
    1421:	b8 07 00 00 00       	mov    $0x7,%eax
    1426:	cd 40                	int    $0x40
    1428:	c3                   	ret    

00001429 <open>:
SYSCALL(open)
    1429:	b8 0f 00 00 00       	mov    $0xf,%eax
    142e:	cd 40                	int    $0x40
    1430:	c3                   	ret    

00001431 <mknod>:
SYSCALL(mknod)
    1431:	b8 11 00 00 00       	mov    $0x11,%eax
    1436:	cd 40                	int    $0x40
    1438:	c3                   	ret    

00001439 <unlink>:
SYSCALL(unlink)
    1439:	b8 12 00 00 00       	mov    $0x12,%eax
    143e:	cd 40                	int    $0x40
    1440:	c3                   	ret    

00001441 <fstat>:
SYSCALL(fstat)
    1441:	b8 08 00 00 00       	mov    $0x8,%eax
    1446:	cd 40                	int    $0x40
    1448:	c3                   	ret    

00001449 <link>:
SYSCALL(link)
    1449:	b8 13 00 00 00       	mov    $0x13,%eax
    144e:	cd 40                	int    $0x40
    1450:	c3                   	ret    

00001451 <mkdir>:
SYSCALL(mkdir)
    1451:	b8 14 00 00 00       	mov    $0x14,%eax
    1456:	cd 40                	int    $0x40
    1458:	c3                   	ret    

00001459 <chdir>:
SYSCALL(chdir)
    1459:	b8 09 00 00 00       	mov    $0x9,%eax
    145e:	cd 40                	int    $0x40
    1460:	c3                   	ret    

00001461 <dup>:
SYSCALL(dup)
    1461:	b8 0a 00 00 00       	mov    $0xa,%eax
    1466:	cd 40                	int    $0x40
    1468:	c3                   	ret    

00001469 <getpid>:
SYSCALL(getpid)
    1469:	b8 0b 00 00 00       	mov    $0xb,%eax
    146e:	cd 40                	int    $0x40
    1470:	c3                   	ret    

00001471 <sbrk>:
SYSCALL(sbrk)
    1471:	b8 0c 00 00 00       	mov    $0xc,%eax
    1476:	cd 40                	int    $0x40
    1478:	c3                   	ret    

00001479 <sleep>:
SYSCALL(sleep)
    1479:	b8 0d 00 00 00       	mov    $0xd,%eax
    147e:	cd 40                	int    $0x40
    1480:	c3                   	ret    

00001481 <uptime>:
SYSCALL(uptime)
    1481:	b8 0e 00 00 00       	mov    $0xe,%eax
    1486:	cd 40                	int    $0x40
    1488:	c3                   	ret    

00001489 <getreadcount>:
SYSCALL(getreadcount)
    1489:	b8 16 00 00 00       	mov    $0x16,%eax
    148e:	cd 40                	int    $0x40
    1490:	c3                   	ret    

00001491 <settickets>:
SYSCALL(settickets)
    1491:	b8 17 00 00 00       	mov    $0x17,%eax
    1496:	cd 40                	int    $0x40
    1498:	c3                   	ret    

00001499 <getpinfo>:
SYSCALL(getpinfo)
    1499:	b8 18 00 00 00       	mov    $0x18,%eax
    149e:	cd 40                	int    $0x40
    14a0:	c3                   	ret    

000014a1 <clone>:
SYSCALL(clone)
    14a1:	b8 19 00 00 00       	mov    $0x19,%eax
    14a6:	cd 40                	int    $0x40
    14a8:	c3                   	ret    

000014a9 <join>:
SYSCALL(join)
    14a9:	b8 1a 00 00 00       	mov    $0x1a,%eax
    14ae:	cd 40                	int    $0x40
    14b0:	c3                   	ret    

000014b1 <mprotect>:
SYSCALL(mprotect)
    14b1:	b8 1b 00 00 00       	mov    $0x1b,%eax
    14b6:	cd 40                	int    $0x40
    14b8:	c3                   	ret    

000014b9 <munprotect>:
SYSCALL(munprotect)
    14b9:	b8 1c 00 00 00       	mov    $0x1c,%eax
    14be:	cd 40                	int    $0x40
    14c0:	c3                   	ret    
    14c1:	66 90                	xchg   %ax,%ax
    14c3:	66 90                	xchg   %ax,%ax
    14c5:	66 90                	xchg   %ax,%ax
    14c7:	66 90                	xchg   %ax,%ax
    14c9:	66 90                	xchg   %ax,%ax
    14cb:	66 90                	xchg   %ax,%ax
    14cd:	66 90                	xchg   %ax,%ax
    14cf:	90                   	nop

000014d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    14d0:	55                   	push   %ebp
    14d1:	89 e5                	mov    %esp,%ebp
    14d3:	57                   	push   %edi
    14d4:	56                   	push   %esi
    14d5:	53                   	push   %ebx
    14d6:	83 ec 3c             	sub    $0x3c,%esp
    14d9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    14dc:	89 d1                	mov    %edx,%ecx
{
    14de:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    14e1:	85 d2                	test   %edx,%edx
    14e3:	0f 89 7f 00 00 00    	jns    1568 <printint+0x98>
    14e9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    14ed:	74 79                	je     1568 <printint+0x98>
    neg = 1;
    14ef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    14f6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    14f8:	31 db                	xor    %ebx,%ebx
    14fa:	8d 75 d7             	lea    -0x29(%ebp),%esi
    14fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1500:	89 c8                	mov    %ecx,%eax
    1502:	31 d2                	xor    %edx,%edx
    1504:	89 cf                	mov    %ecx,%edi
    1506:	f7 75 c4             	divl   -0x3c(%ebp)
    1509:	0f b6 92 5c 19 00 00 	movzbl 0x195c(%edx),%edx
    1510:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1513:	89 d8                	mov    %ebx,%eax
    1515:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1518:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    151b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    151e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1521:	76 dd                	jbe    1500 <printint+0x30>
  if(neg)
    1523:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1526:	85 c9                	test   %ecx,%ecx
    1528:	74 0c                	je     1536 <printint+0x66>
    buf[i++] = '-';
    152a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    152f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1531:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1536:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1539:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    153d:	eb 07                	jmp    1546 <printint+0x76>
    153f:	90                   	nop
    putc(fd, buf[i]);
    1540:	0f b6 13             	movzbl (%ebx),%edx
    1543:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1546:	83 ec 04             	sub    $0x4,%esp
    1549:	88 55 d7             	mov    %dl,-0x29(%ebp)
    154c:	6a 01                	push   $0x1
    154e:	56                   	push   %esi
    154f:	57                   	push   %edi
    1550:	e8 b4 fe ff ff       	call   1409 <write>
  while(--i >= 0)
    1555:	83 c4 10             	add    $0x10,%esp
    1558:	39 de                	cmp    %ebx,%esi
    155a:	75 e4                	jne    1540 <printint+0x70>
}
    155c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    155f:	5b                   	pop    %ebx
    1560:	5e                   	pop    %esi
    1561:	5f                   	pop    %edi
    1562:	5d                   	pop    %ebp
    1563:	c3                   	ret    
    1564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1568:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    156f:	eb 87                	jmp    14f8 <printint+0x28>
    1571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1578:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    157f:	90                   	nop

00001580 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1580:	55                   	push   %ebp
    1581:	89 e5                	mov    %esp,%ebp
    1583:	57                   	push   %edi
    1584:	56                   	push   %esi
    1585:	53                   	push   %ebx
    1586:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1589:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    158c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    158f:	0f b6 13             	movzbl (%ebx),%edx
    1592:	84 d2                	test   %dl,%dl
    1594:	74 6a                	je     1600 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1596:	8d 45 10             	lea    0x10(%ebp),%eax
    1599:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    159c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    159f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    15a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15a4:	eb 36                	jmp    15dc <printf+0x5c>
    15a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15ad:	8d 76 00             	lea    0x0(%esi),%esi
    15b0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    15b3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    15b8:	83 f8 25             	cmp    $0x25,%eax
    15bb:	74 15                	je     15d2 <printf+0x52>
  write(fd, &c, 1);
    15bd:	83 ec 04             	sub    $0x4,%esp
    15c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
    15c3:	6a 01                	push   $0x1
    15c5:	57                   	push   %edi
    15c6:	56                   	push   %esi
    15c7:	e8 3d fe ff ff       	call   1409 <write>
    15cc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    15cf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    15d2:	0f b6 13             	movzbl (%ebx),%edx
    15d5:	83 c3 01             	add    $0x1,%ebx
    15d8:	84 d2                	test   %dl,%dl
    15da:	74 24                	je     1600 <printf+0x80>
    c = fmt[i] & 0xff;
    15dc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    15df:	85 c9                	test   %ecx,%ecx
    15e1:	74 cd                	je     15b0 <printf+0x30>
      }
    } else if(state == '%'){
    15e3:	83 f9 25             	cmp    $0x25,%ecx
    15e6:	75 ea                	jne    15d2 <printf+0x52>
      if(c == 'd'){
    15e8:	83 f8 25             	cmp    $0x25,%eax
    15eb:	0f 84 07 01 00 00    	je     16f8 <printf+0x178>
    15f1:	83 e8 63             	sub    $0x63,%eax
    15f4:	83 f8 15             	cmp    $0x15,%eax
    15f7:	77 17                	ja     1610 <printf+0x90>
    15f9:	ff 24 85 04 19 00 00 	jmp    *0x1904(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1600:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1603:	5b                   	pop    %ebx
    1604:	5e                   	pop    %esi
    1605:	5f                   	pop    %edi
    1606:	5d                   	pop    %ebp
    1607:	c3                   	ret    
    1608:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    160f:	90                   	nop
  write(fd, &c, 1);
    1610:	83 ec 04             	sub    $0x4,%esp
    1613:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1616:	6a 01                	push   $0x1
    1618:	57                   	push   %edi
    1619:	56                   	push   %esi
    161a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    161e:	e8 e6 fd ff ff       	call   1409 <write>
        putc(fd, c);
    1623:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1627:	83 c4 0c             	add    $0xc,%esp
    162a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    162d:	6a 01                	push   $0x1
    162f:	57                   	push   %edi
    1630:	56                   	push   %esi
    1631:	e8 d3 fd ff ff       	call   1409 <write>
        putc(fd, c);
    1636:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1639:	31 c9                	xor    %ecx,%ecx
    163b:	eb 95                	jmp    15d2 <printf+0x52>
    163d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1640:	83 ec 0c             	sub    $0xc,%esp
    1643:	b9 10 00 00 00       	mov    $0x10,%ecx
    1648:	6a 00                	push   $0x0
    164a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    164d:	8b 10                	mov    (%eax),%edx
    164f:	89 f0                	mov    %esi,%eax
    1651:	e8 7a fe ff ff       	call   14d0 <printint>
        ap++;
    1656:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    165a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    165d:	31 c9                	xor    %ecx,%ecx
    165f:	e9 6e ff ff ff       	jmp    15d2 <printf+0x52>
    1664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1668:	8b 45 d0             	mov    -0x30(%ebp),%eax
    166b:	8b 10                	mov    (%eax),%edx
        ap++;
    166d:	83 c0 04             	add    $0x4,%eax
    1670:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1673:	85 d2                	test   %edx,%edx
    1675:	0f 84 8d 00 00 00    	je     1708 <printf+0x188>
        while(*s != 0){
    167b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    167e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1680:	84 c0                	test   %al,%al
    1682:	0f 84 4a ff ff ff    	je     15d2 <printf+0x52>
    1688:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    168b:	89 d3                	mov    %edx,%ebx
    168d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1690:	83 ec 04             	sub    $0x4,%esp
          s++;
    1693:	83 c3 01             	add    $0x1,%ebx
    1696:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1699:	6a 01                	push   $0x1
    169b:	57                   	push   %edi
    169c:	56                   	push   %esi
    169d:	e8 67 fd ff ff       	call   1409 <write>
        while(*s != 0){
    16a2:	0f b6 03             	movzbl (%ebx),%eax
    16a5:	83 c4 10             	add    $0x10,%esp
    16a8:	84 c0                	test   %al,%al
    16aa:	75 e4                	jne    1690 <printf+0x110>
      state = 0;
    16ac:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    16af:	31 c9                	xor    %ecx,%ecx
    16b1:	e9 1c ff ff ff       	jmp    15d2 <printf+0x52>
    16b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    16c0:	83 ec 0c             	sub    $0xc,%esp
    16c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    16c8:	6a 01                	push   $0x1
    16ca:	e9 7b ff ff ff       	jmp    164a <printf+0xca>
    16cf:	90                   	nop
        putc(fd, *ap);
    16d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    16d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    16d6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    16d8:	6a 01                	push   $0x1
    16da:	57                   	push   %edi
    16db:	56                   	push   %esi
        putc(fd, *ap);
    16dc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    16df:	e8 25 fd ff ff       	call   1409 <write>
        ap++;
    16e4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    16e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16eb:	31 c9                	xor    %ecx,%ecx
    16ed:	e9 e0 fe ff ff       	jmp    15d2 <printf+0x52>
    16f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    16f8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    16fb:	83 ec 04             	sub    $0x4,%esp
    16fe:	e9 2a ff ff ff       	jmp    162d <printf+0xad>
    1703:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1707:	90                   	nop
          s = "(null)";
    1708:	ba fb 18 00 00       	mov    $0x18fb,%edx
        while(*s != 0){
    170d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1710:	b8 28 00 00 00       	mov    $0x28,%eax
    1715:	89 d3                	mov    %edx,%ebx
    1717:	e9 74 ff ff ff       	jmp    1690 <printf+0x110>
    171c:	66 90                	xchg   %ax,%ax
    171e:	66 90                	xchg   %ax,%ax

00001720 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1720:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1721:	a1 b0 1c 00 00       	mov    0x1cb0,%eax
{
    1726:	89 e5                	mov    %esp,%ebp
    1728:	57                   	push   %edi
    1729:	56                   	push   %esi
    172a:	53                   	push   %ebx
    172b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    172e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1738:	89 c2                	mov    %eax,%edx
    173a:	8b 00                	mov    (%eax),%eax
    173c:	39 ca                	cmp    %ecx,%edx
    173e:	73 30                	jae    1770 <free+0x50>
    1740:	39 c1                	cmp    %eax,%ecx
    1742:	72 04                	jb     1748 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1744:	39 c2                	cmp    %eax,%edx
    1746:	72 f0                	jb     1738 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1748:	8b 73 fc             	mov    -0x4(%ebx),%esi
    174b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    174e:	39 f8                	cmp    %edi,%eax
    1750:	74 30                	je     1782 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1752:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1755:	8b 42 04             	mov    0x4(%edx),%eax
    1758:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    175b:	39 f1                	cmp    %esi,%ecx
    175d:	74 3a                	je     1799 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    175f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1761:	5b                   	pop    %ebx
  freep = p;
    1762:	89 15 b0 1c 00 00    	mov    %edx,0x1cb0
}
    1768:	5e                   	pop    %esi
    1769:	5f                   	pop    %edi
    176a:	5d                   	pop    %ebp
    176b:	c3                   	ret    
    176c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1770:	39 c2                	cmp    %eax,%edx
    1772:	72 c4                	jb     1738 <free+0x18>
    1774:	39 c1                	cmp    %eax,%ecx
    1776:	73 c0                	jae    1738 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1778:	8b 73 fc             	mov    -0x4(%ebx),%esi
    177b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    177e:	39 f8                	cmp    %edi,%eax
    1780:	75 d0                	jne    1752 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1782:	03 70 04             	add    0x4(%eax),%esi
    1785:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1788:	8b 02                	mov    (%edx),%eax
    178a:	8b 00                	mov    (%eax),%eax
    178c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    178f:	8b 42 04             	mov    0x4(%edx),%eax
    1792:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1795:	39 f1                	cmp    %esi,%ecx
    1797:	75 c6                	jne    175f <free+0x3f>
    p->s.size += bp->s.size;
    1799:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    179c:	89 15 b0 1c 00 00    	mov    %edx,0x1cb0
    p->s.size += bp->s.size;
    17a2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    17a5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    17a8:	89 0a                	mov    %ecx,(%edx)
}
    17aa:	5b                   	pop    %ebx
    17ab:	5e                   	pop    %esi
    17ac:	5f                   	pop    %edi
    17ad:	5d                   	pop    %ebp
    17ae:	c3                   	ret    
    17af:	90                   	nop

000017b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    17b0:	55                   	push   %ebp
    17b1:	89 e5                	mov    %esp,%ebp
    17b3:	57                   	push   %edi
    17b4:	56                   	push   %esi
    17b5:	53                   	push   %ebx
    17b6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    17bc:	8b 3d b0 1c 00 00    	mov    0x1cb0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17c2:	8d 70 07             	lea    0x7(%eax),%esi
    17c5:	c1 ee 03             	shr    $0x3,%esi
    17c8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    17cb:	85 ff                	test   %edi,%edi
    17cd:	0f 84 9d 00 00 00    	je     1870 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17d3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    17d5:	8b 4a 04             	mov    0x4(%edx),%ecx
    17d8:	39 f1                	cmp    %esi,%ecx
    17da:	73 6a                	jae    1846 <malloc+0x96>
    17dc:	bb 00 10 00 00       	mov    $0x1000,%ebx
    17e1:	39 de                	cmp    %ebx,%esi
    17e3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    17e6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    17ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    17f0:	eb 17                	jmp    1809 <malloc+0x59>
    17f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    17fa:	8b 48 04             	mov    0x4(%eax),%ecx
    17fd:	39 f1                	cmp    %esi,%ecx
    17ff:	73 4f                	jae    1850 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1801:	8b 3d b0 1c 00 00    	mov    0x1cb0,%edi
    1807:	89 c2                	mov    %eax,%edx
    1809:	39 d7                	cmp    %edx,%edi
    180b:	75 eb                	jne    17f8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    180d:	83 ec 0c             	sub    $0xc,%esp
    1810:	ff 75 e4             	push   -0x1c(%ebp)
    1813:	e8 59 fc ff ff       	call   1471 <sbrk>
  if(p == (char*)-1)
    1818:	83 c4 10             	add    $0x10,%esp
    181b:	83 f8 ff             	cmp    $0xffffffff,%eax
    181e:	74 1c                	je     183c <malloc+0x8c>
  hp->s.size = nu;
    1820:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1823:	83 ec 0c             	sub    $0xc,%esp
    1826:	83 c0 08             	add    $0x8,%eax
    1829:	50                   	push   %eax
    182a:	e8 f1 fe ff ff       	call   1720 <free>
  return freep;
    182f:	8b 15 b0 1c 00 00    	mov    0x1cb0,%edx
      if((p = morecore(nunits)) == 0)
    1835:	83 c4 10             	add    $0x10,%esp
    1838:	85 d2                	test   %edx,%edx
    183a:	75 bc                	jne    17f8 <malloc+0x48>
        return 0;
  }
}
    183c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    183f:	31 c0                	xor    %eax,%eax
}
    1841:	5b                   	pop    %ebx
    1842:	5e                   	pop    %esi
    1843:	5f                   	pop    %edi
    1844:	5d                   	pop    %ebp
    1845:	c3                   	ret    
    if(p->s.size >= nunits){
    1846:	89 d0                	mov    %edx,%eax
    1848:	89 fa                	mov    %edi,%edx
    184a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1850:	39 ce                	cmp    %ecx,%esi
    1852:	74 4c                	je     18a0 <malloc+0xf0>
        p->s.size -= nunits;
    1854:	29 f1                	sub    %esi,%ecx
    1856:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1859:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    185c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    185f:	89 15 b0 1c 00 00    	mov    %edx,0x1cb0
}
    1865:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1868:	83 c0 08             	add    $0x8,%eax
}
    186b:	5b                   	pop    %ebx
    186c:	5e                   	pop    %esi
    186d:	5f                   	pop    %edi
    186e:	5d                   	pop    %ebp
    186f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1870:	c7 05 b0 1c 00 00 b4 	movl   $0x1cb4,0x1cb0
    1877:	1c 00 00 
    base.s.size = 0;
    187a:	bf b4 1c 00 00       	mov    $0x1cb4,%edi
    base.s.ptr = freep = prevp = &base;
    187f:	c7 05 b4 1c 00 00 b4 	movl   $0x1cb4,0x1cb4
    1886:	1c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1889:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    188b:	c7 05 b8 1c 00 00 00 	movl   $0x0,0x1cb8
    1892:	00 00 00 
    if(p->s.size >= nunits){
    1895:	e9 42 ff ff ff       	jmp    17dc <malloc+0x2c>
    189a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    18a0:	8b 08                	mov    (%eax),%ecx
    18a2:	89 0a                	mov    %ecx,(%edx)
    18a4:	eb b9                	jmp    185f <malloc+0xaf>
