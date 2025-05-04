
_stressfs:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
    1007:	b8 30 00 00 00       	mov    $0x30,%eax
{
    100c:	ff 71 fc             	push   -0x4(%ecx)
    100f:	55                   	push   %ebp
    1010:	89 e5                	mov    %esp,%ebp
    1012:	57                   	push   %edi
    1013:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
    1014:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
    101a:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
    101b:	31 db                	xor    %ebx,%ebx
{
    101d:	51                   	push   %ecx
    101e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
    1024:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
    102b:	68 f8 18 00 00       	push   $0x18f8
    1030:	6a 01                	push   $0x1
  char path[] = "stressfs0";
    1032:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
    1039:	74 72 65 
    103c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
    1043:	73 66 73 
  printf(1, "stressfs starting\n");
    1046:	e8 85 05 00 00       	call   15d0 <printf>
  memset(data, 'a', sizeof(data));
    104b:	83 c4 0c             	add    $0xc,%esp
    104e:	68 00 02 00 00       	push   $0x200
    1053:	6a 61                	push   $0x61
    1055:	56                   	push   %esi
    1056:	e8 a5 01 00 00       	call   1200 <memset>
    105b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
    105e:	e8 ce 03 00 00       	call   1431 <fork>
    1063:	85 c0                	test   %eax,%eax
    1065:	0f 8f bf 00 00 00    	jg     112a <main+0x12a>
  for(i = 0; i < 4; i++)
    106b:	83 c3 01             	add    $0x1,%ebx
    106e:	83 fb 04             	cmp    $0x4,%ebx
    1071:	75 eb                	jne    105e <main+0x5e>
    1073:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
    1078:	83 ec 04             	sub    $0x4,%esp
    107b:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
    107c:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
    1081:	68 0b 19 00 00       	push   $0x190b
    1086:	6a 01                	push   $0x1
    1088:	e8 43 05 00 00       	call   15d0 <printf>
  path[8] += i;
    108d:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
    108f:	5f                   	pop    %edi
  path[8] += i;
    1090:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
    1096:	58                   	pop    %eax
    1097:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
    109d:	68 02 02 00 00       	push   $0x202
    10a2:	50                   	push   %eax
    10a3:	e8 d1 03 00 00       	call   1479 <open>
    10a8:	83 c4 10             	add    $0x10,%esp
    10ab:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
    10ad:	8d 76 00             	lea    0x0(%esi),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	68 00 02 00 00       	push   $0x200
    10b8:	56                   	push   %esi
    10b9:	57                   	push   %edi
    10ba:	e8 9a 03 00 00       	call   1459 <write>
  for(i = 0; i < 20; i++)
    10bf:	83 c4 10             	add    $0x10,%esp
    10c2:	83 eb 01             	sub    $0x1,%ebx
    10c5:	75 e9                	jne    10b0 <main+0xb0>
  close(fd);
    10c7:	83 ec 0c             	sub    $0xc,%esp
    10ca:	57                   	push   %edi
    10cb:	e8 91 03 00 00       	call   1461 <close>

  printf(1, "read\n");
    10d0:	58                   	pop    %eax
    10d1:	5a                   	pop    %edx
    10d2:	68 15 19 00 00       	push   $0x1915
    10d7:	6a 01                	push   $0x1
    10d9:	e8 f2 04 00 00       	call   15d0 <printf>

  fd = open(path, O_RDONLY);
    10de:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
    10e4:	59                   	pop    %ecx
    10e5:	5b                   	pop    %ebx
    10e6:	6a 00                	push   $0x0
    10e8:	bb 14 00 00 00       	mov    $0x14,%ebx
    10ed:	50                   	push   %eax
    10ee:	e8 86 03 00 00       	call   1479 <open>
    10f3:	83 c4 10             	add    $0x10,%esp
    10f6:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
    10f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ff:	90                   	nop
    read(fd, data, sizeof(data));
    1100:	83 ec 04             	sub    $0x4,%esp
    1103:	68 00 02 00 00       	push   $0x200
    1108:	56                   	push   %esi
    1109:	57                   	push   %edi
    110a:	e8 42 03 00 00       	call   1451 <read>
  for (i = 0; i < 20; i++)
    110f:	83 c4 10             	add    $0x10,%esp
    1112:	83 eb 01             	sub    $0x1,%ebx
    1115:	75 e9                	jne    1100 <main+0x100>
  close(fd);
    1117:	83 ec 0c             	sub    $0xc,%esp
    111a:	57                   	push   %edi
    111b:	e8 41 03 00 00       	call   1461 <close>

  wait();
    1120:	e8 1c 03 00 00       	call   1441 <wait>

  exit();
    1125:	e8 0f 03 00 00       	call   1439 <exit>
  path[8] += i;
    112a:	89 df                	mov    %ebx,%edi
    112c:	e9 47 ff ff ff       	jmp    1078 <main+0x78>
    1131:	66 90                	xchg   %ax,%ax
    1133:	66 90                	xchg   %ax,%ax
    1135:	66 90                	xchg   %ax,%ax
    1137:	66 90                	xchg   %ax,%ax
    1139:	66 90                	xchg   %ax,%ax
    113b:	66 90                	xchg   %ax,%ax
    113d:	66 90                	xchg   %ax,%ax
    113f:	90                   	nop

00001140 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    1140:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1141:	31 c0                	xor    %eax,%eax
{
    1143:	89 e5                	mov    %esp,%ebp
    1145:	53                   	push   %ebx
    1146:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1157:	83 c0 01             	add    $0x1,%eax
    115a:	84 d2                	test   %dl,%dl
    115c:	75 f2                	jne    1150 <strcpy+0x10>
    ;
  return os;
}
    115e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1161:	89 c8                	mov    %ecx,%eax
    1163:	c9                   	leave  
    1164:	c3                   	ret    
    1165:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    116c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	53                   	push   %ebx
    1174:	8b 55 08             	mov    0x8(%ebp),%edx
    1177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    117a:	0f b6 02             	movzbl (%edx),%eax
    117d:	84 c0                	test   %al,%al
    117f:	75 17                	jne    1198 <strcmp+0x28>
    1181:	eb 3a                	jmp    11bd <strcmp+0x4d>
    1183:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1187:	90                   	nop
    1188:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    118c:	83 c2 01             	add    $0x1,%edx
    118f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1192:	84 c0                	test   %al,%al
    1194:	74 1a                	je     11b0 <strcmp+0x40>
    p++, q++;
    1196:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1198:	0f b6 19             	movzbl (%ecx),%ebx
    119b:	38 c3                	cmp    %al,%bl
    119d:	74 e9                	je     1188 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    119f:	29 d8                	sub    %ebx,%eax
}
    11a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11a4:	c9                   	leave  
    11a5:	c3                   	ret    
    11a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    11b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    11b4:	31 c0                	xor    %eax,%eax
    11b6:	29 d8                	sub    %ebx,%eax
}
    11b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11bb:	c9                   	leave  
    11bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    11bd:	0f b6 19             	movzbl (%ecx),%ebx
    11c0:	31 c0                	xor    %eax,%eax
    11c2:	eb db                	jmp    119f <strcmp+0x2f>
    11c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11cf:	90                   	nop

000011d0 <strlen>:

uint
strlen(const char *s)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    11d6:	80 3a 00             	cmpb   $0x0,(%edx)
    11d9:	74 15                	je     11f0 <strlen+0x20>
    11db:	31 c0                	xor    %eax,%eax
    11dd:	8d 76 00             	lea    0x0(%esi),%esi
    11e0:	83 c0 01             	add    $0x1,%eax
    11e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    11e7:	89 c1                	mov    %eax,%ecx
    11e9:	75 f5                	jne    11e0 <strlen+0x10>
    ;
  return n;
}
    11eb:	89 c8                	mov    %ecx,%eax
    11ed:	5d                   	pop    %ebp
    11ee:	c3                   	ret    
    11ef:	90                   	nop
  for(n = 0; s[n]; n++)
    11f0:	31 c9                	xor    %ecx,%ecx
}
    11f2:	5d                   	pop    %ebp
    11f3:	89 c8                	mov    %ecx,%eax
    11f5:	c3                   	ret    
    11f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11fd:	8d 76 00             	lea    0x0(%esi),%esi

00001200 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	57                   	push   %edi
    1204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1207:	8b 4d 10             	mov    0x10(%ebp),%ecx
    120a:	8b 45 0c             	mov    0xc(%ebp),%eax
    120d:	89 d7                	mov    %edx,%edi
    120f:	fc                   	cld    
    1210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1212:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1215:	89 d0                	mov    %edx,%eax
    1217:	c9                   	leave  
    1218:	c3                   	ret    
    1219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001220 <strchr>:

char*
strchr(const char *s, char c)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	8b 45 08             	mov    0x8(%ebp),%eax
    1226:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    122a:	0f b6 10             	movzbl (%eax),%edx
    122d:	84 d2                	test   %dl,%dl
    122f:	75 12                	jne    1243 <strchr+0x23>
    1231:	eb 1d                	jmp    1250 <strchr+0x30>
    1233:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1237:	90                   	nop
    1238:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    123c:	83 c0 01             	add    $0x1,%eax
    123f:	84 d2                	test   %dl,%dl
    1241:	74 0d                	je     1250 <strchr+0x30>
    if(*s == c)
    1243:	38 d1                	cmp    %dl,%cl
    1245:	75 f1                	jne    1238 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1247:	5d                   	pop    %ebp
    1248:	c3                   	ret    
    1249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1250:	31 c0                	xor    %eax,%eax
}
    1252:	5d                   	pop    %ebp
    1253:	c3                   	ret    
    1254:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    125b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    125f:	90                   	nop

00001260 <gets>:

char*
gets(char *buf, int max)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	57                   	push   %edi
    1264:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1265:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1268:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1269:	31 db                	xor    %ebx,%ebx
{
    126b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    126e:	eb 27                	jmp    1297 <gets+0x37>
    cc = read(0, &c, 1);
    1270:	83 ec 04             	sub    $0x4,%esp
    1273:	6a 01                	push   $0x1
    1275:	57                   	push   %edi
    1276:	6a 00                	push   $0x0
    1278:	e8 d4 01 00 00       	call   1451 <read>
    if(cc < 1)
    127d:	83 c4 10             	add    $0x10,%esp
    1280:	85 c0                	test   %eax,%eax
    1282:	7e 1d                	jle    12a1 <gets+0x41>
      break;
    buf[i++] = c;
    1284:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1288:	8b 55 08             	mov    0x8(%ebp),%edx
    128b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    128f:	3c 0a                	cmp    $0xa,%al
    1291:	74 1d                	je     12b0 <gets+0x50>
    1293:	3c 0d                	cmp    $0xd,%al
    1295:	74 19                	je     12b0 <gets+0x50>
  for(i=0; i+1 < max; ){
    1297:	89 de                	mov    %ebx,%esi
    1299:	83 c3 01             	add    $0x1,%ebx
    129c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    129f:	7c cf                	jl     1270 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    12a1:	8b 45 08             	mov    0x8(%ebp),%eax
    12a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    12a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12ab:	5b                   	pop    %ebx
    12ac:	5e                   	pop    %esi
    12ad:	5f                   	pop    %edi
    12ae:	5d                   	pop    %ebp
    12af:	c3                   	ret    
  buf[i] = '\0';
    12b0:	8b 45 08             	mov    0x8(%ebp),%eax
    12b3:	89 de                	mov    %ebx,%esi
    12b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    12b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12bc:	5b                   	pop    %ebx
    12bd:	5e                   	pop    %esi
    12be:	5f                   	pop    %edi
    12bf:	5d                   	pop    %ebp
    12c0:	c3                   	ret    
    12c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12cf:	90                   	nop

000012d0 <stat>:

int
stat(const char *n, struct stat *st)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	56                   	push   %esi
    12d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12d5:	83 ec 08             	sub    $0x8,%esp
    12d8:	6a 00                	push   $0x0
    12da:	ff 75 08             	push   0x8(%ebp)
    12dd:	e8 97 01 00 00       	call   1479 <open>
  if(fd < 0)
    12e2:	83 c4 10             	add    $0x10,%esp
    12e5:	85 c0                	test   %eax,%eax
    12e7:	78 27                	js     1310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12e9:	83 ec 08             	sub    $0x8,%esp
    12ec:	ff 75 0c             	push   0xc(%ebp)
    12ef:	89 c3                	mov    %eax,%ebx
    12f1:	50                   	push   %eax
    12f2:	e8 9a 01 00 00       	call   1491 <fstat>
  close(fd);
    12f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12fa:	89 c6                	mov    %eax,%esi
  close(fd);
    12fc:	e8 60 01 00 00       	call   1461 <close>
  return r;
    1301:	83 c4 10             	add    $0x10,%esp
}
    1304:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1307:	89 f0                	mov    %esi,%eax
    1309:	5b                   	pop    %ebx
    130a:	5e                   	pop    %esi
    130b:	5d                   	pop    %ebp
    130c:	c3                   	ret    
    130d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1310:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1315:	eb ed                	jmp    1304 <stat+0x34>
    1317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    131e:	66 90                	xchg   %ax,%ax

00001320 <atoi>:

int
atoi(const char *s)
{
    1320:	55                   	push   %ebp
    1321:	89 e5                	mov    %esp,%ebp
    1323:	53                   	push   %ebx
    1324:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1327:	0f be 02             	movsbl (%edx),%eax
    132a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    132d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1330:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1335:	77 1e                	ja     1355 <atoi+0x35>
    1337:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    133e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1340:	83 c2 01             	add    $0x1,%edx
    1343:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1346:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    134a:	0f be 02             	movsbl (%edx),%eax
    134d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1350:	80 fb 09             	cmp    $0x9,%bl
    1353:	76 eb                	jbe    1340 <atoi+0x20>
  return n;
}
    1355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1358:	89 c8                	mov    %ecx,%eax
    135a:	c9                   	leave  
    135b:	c3                   	ret    
    135c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	57                   	push   %edi
    1364:	8b 45 10             	mov    0x10(%ebp),%eax
    1367:	8b 55 08             	mov    0x8(%ebp),%edx
    136a:	56                   	push   %esi
    136b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    136e:	85 c0                	test   %eax,%eax
    1370:	7e 13                	jle    1385 <memmove+0x25>
    1372:	01 d0                	add    %edx,%eax
  dst = vdst;
    1374:	89 d7                	mov    %edx,%edi
    1376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    137d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1380:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1381:	39 f8                	cmp    %edi,%eax
    1383:	75 fb                	jne    1380 <memmove+0x20>
  return vdst;
}
    1385:	5e                   	pop    %esi
    1386:	89 d0                	mov    %edx,%eax
    1388:	5f                   	pop    %edi
    1389:	5d                   	pop    %ebp
    138a:	c3                   	ret    
    138b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    138f:	90                   	nop

00001390 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    1396:	68 00 10 00 00       	push   $0x1000
    139b:	e8 60 04 00 00       	call   1800 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    13a0:	50                   	push   %eax
    13a1:	ff 75 10             	push   0x10(%ebp)
    13a4:	ff 75 0c             	push   0xc(%ebp)
    13a7:	ff 75 08             	push   0x8(%ebp)
    13aa:	e8 42 01 00 00       	call   14f1 <clone>
}
    13af:	c9                   	leave  
    13b0:	c3                   	ret    
    13b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13bf:	90                   	nop

000013c0 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    13c0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    13c1:	b9 01 00 00 00       	mov    $0x1,%ecx
    13c6:	89 e5                	mov    %esp,%ebp
    13c8:	8b 55 08             	mov    0x8(%ebp),%edx
    13cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13cf:	90                   	nop
    13d0:	89 c8                	mov    %ecx,%eax
    13d2:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    13d5:	85 c0                	test   %eax,%eax
    13d7:	75 f7                	jne    13d0 <lock_acquire+0x10>
}
    13d9:	5d                   	pop    %ebp
    13da:	c3                   	ret    
    13db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13df:	90                   	nop

000013e0 <lock_release>:

void lock_release(lock_thread *lock){
    13e0:	55                   	push   %ebp
    13e1:	31 c0                	xor    %eax,%eax
    13e3:	89 e5                	mov    %esp,%ebp
    13e5:	8b 55 08             	mov    0x8(%ebp),%edx
    13e8:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    13eb:	5d                   	pop    %ebp
    13ec:	c3                   	ret    
    13ed:	8d 76 00             	lea    0x0(%esi),%esi

000013f0 <lock_init>:

int lock_init(lock_thread *lock)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    13f6:	68 1b 19 00 00       	push   $0x191b
    13fb:	6a 01                	push   $0x1
    13fd:	e8 ce 01 00 00       	call   15d0 <printf>
  lock->locked = 0;
    1402:	8b 45 08             	mov    0x8(%ebp),%eax
    1405:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    140b:	58                   	pop    %eax
    140c:	5a                   	pop    %edx
    140d:	68 1b 19 00 00       	push   $0x191b
    1412:	6a 01                	push   $0x1
    1414:	e8 b7 01 00 00       	call   15d0 <printf>
  return 0;
}
    1419:	31 c0                	xor    %eax,%eax
    141b:	c9                   	leave  
    141c:	c3                   	ret    
    141d:	8d 76 00             	lea    0x0(%esi),%esi

00001420 <thread_join>:



int thread_join()
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    1426:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1429:	50                   	push   %eax
    142a:	e8 ca 00 00 00       	call   14f9 <join>
  return a;
    142f:	c9                   	leave  
    1430:	c3                   	ret    

00001431 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1431:	b8 01 00 00 00       	mov    $0x1,%eax
    1436:	cd 40                	int    $0x40
    1438:	c3                   	ret    

00001439 <exit>:
SYSCALL(exit)
    1439:	b8 02 00 00 00       	mov    $0x2,%eax
    143e:	cd 40                	int    $0x40
    1440:	c3                   	ret    

00001441 <wait>:
SYSCALL(wait)
    1441:	b8 03 00 00 00       	mov    $0x3,%eax
    1446:	cd 40                	int    $0x40
    1448:	c3                   	ret    

00001449 <pipe>:
SYSCALL(pipe)
    1449:	b8 04 00 00 00       	mov    $0x4,%eax
    144e:	cd 40                	int    $0x40
    1450:	c3                   	ret    

00001451 <read>:
SYSCALL(read)
    1451:	b8 05 00 00 00       	mov    $0x5,%eax
    1456:	cd 40                	int    $0x40
    1458:	c3                   	ret    

00001459 <write>:
SYSCALL(write)
    1459:	b8 10 00 00 00       	mov    $0x10,%eax
    145e:	cd 40                	int    $0x40
    1460:	c3                   	ret    

00001461 <close>:
SYSCALL(close)
    1461:	b8 15 00 00 00       	mov    $0x15,%eax
    1466:	cd 40                	int    $0x40
    1468:	c3                   	ret    

00001469 <kill>:
SYSCALL(kill)
    1469:	b8 06 00 00 00       	mov    $0x6,%eax
    146e:	cd 40                	int    $0x40
    1470:	c3                   	ret    

00001471 <exec>:
SYSCALL(exec)
    1471:	b8 07 00 00 00       	mov    $0x7,%eax
    1476:	cd 40                	int    $0x40
    1478:	c3                   	ret    

00001479 <open>:
SYSCALL(open)
    1479:	b8 0f 00 00 00       	mov    $0xf,%eax
    147e:	cd 40                	int    $0x40
    1480:	c3                   	ret    

00001481 <mknod>:
SYSCALL(mknod)
    1481:	b8 11 00 00 00       	mov    $0x11,%eax
    1486:	cd 40                	int    $0x40
    1488:	c3                   	ret    

00001489 <unlink>:
SYSCALL(unlink)
    1489:	b8 12 00 00 00       	mov    $0x12,%eax
    148e:	cd 40                	int    $0x40
    1490:	c3                   	ret    

00001491 <fstat>:
SYSCALL(fstat)
    1491:	b8 08 00 00 00       	mov    $0x8,%eax
    1496:	cd 40                	int    $0x40
    1498:	c3                   	ret    

00001499 <link>:
SYSCALL(link)
    1499:	b8 13 00 00 00       	mov    $0x13,%eax
    149e:	cd 40                	int    $0x40
    14a0:	c3                   	ret    

000014a1 <mkdir>:
SYSCALL(mkdir)
    14a1:	b8 14 00 00 00       	mov    $0x14,%eax
    14a6:	cd 40                	int    $0x40
    14a8:	c3                   	ret    

000014a9 <chdir>:
SYSCALL(chdir)
    14a9:	b8 09 00 00 00       	mov    $0x9,%eax
    14ae:	cd 40                	int    $0x40
    14b0:	c3                   	ret    

000014b1 <dup>:
SYSCALL(dup)
    14b1:	b8 0a 00 00 00       	mov    $0xa,%eax
    14b6:	cd 40                	int    $0x40
    14b8:	c3                   	ret    

000014b9 <getpid>:
SYSCALL(getpid)
    14b9:	b8 0b 00 00 00       	mov    $0xb,%eax
    14be:	cd 40                	int    $0x40
    14c0:	c3                   	ret    

000014c1 <sbrk>:
SYSCALL(sbrk)
    14c1:	b8 0c 00 00 00       	mov    $0xc,%eax
    14c6:	cd 40                	int    $0x40
    14c8:	c3                   	ret    

000014c9 <sleep>:
SYSCALL(sleep)
    14c9:	b8 0d 00 00 00       	mov    $0xd,%eax
    14ce:	cd 40                	int    $0x40
    14d0:	c3                   	ret    

000014d1 <uptime>:
SYSCALL(uptime)
    14d1:	b8 0e 00 00 00       	mov    $0xe,%eax
    14d6:	cd 40                	int    $0x40
    14d8:	c3                   	ret    

000014d9 <getreadcount>:
SYSCALL(getreadcount)
    14d9:	b8 16 00 00 00       	mov    $0x16,%eax
    14de:	cd 40                	int    $0x40
    14e0:	c3                   	ret    

000014e1 <settickets>:
SYSCALL(settickets)
    14e1:	b8 17 00 00 00       	mov    $0x17,%eax
    14e6:	cd 40                	int    $0x40
    14e8:	c3                   	ret    

000014e9 <getpinfo>:
SYSCALL(getpinfo)
    14e9:	b8 18 00 00 00       	mov    $0x18,%eax
    14ee:	cd 40                	int    $0x40
    14f0:	c3                   	ret    

000014f1 <clone>:
SYSCALL(clone)
    14f1:	b8 19 00 00 00       	mov    $0x19,%eax
    14f6:	cd 40                	int    $0x40
    14f8:	c3                   	ret    

000014f9 <join>:
SYSCALL(join)
    14f9:	b8 1a 00 00 00       	mov    $0x1a,%eax
    14fe:	cd 40                	int    $0x40
    1500:	c3                   	ret    

00001501 <mprotect>:
SYSCALL(mprotect)
    1501:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1506:	cd 40                	int    $0x40
    1508:	c3                   	ret    

00001509 <munprotect>:
SYSCALL(munprotect)
    1509:	b8 1c 00 00 00       	mov    $0x1c,%eax
    150e:	cd 40                	int    $0x40
    1510:	c3                   	ret    
    1511:	66 90                	xchg   %ax,%ax
    1513:	66 90                	xchg   %ax,%ax
    1515:	66 90                	xchg   %ax,%ax
    1517:	66 90                	xchg   %ax,%ax
    1519:	66 90                	xchg   %ax,%ax
    151b:	66 90                	xchg   %ax,%ax
    151d:	66 90                	xchg   %ax,%ax
    151f:	90                   	nop

00001520 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1520:	55                   	push   %ebp
    1521:	89 e5                	mov    %esp,%ebp
    1523:	57                   	push   %edi
    1524:	56                   	push   %esi
    1525:	53                   	push   %ebx
    1526:	83 ec 3c             	sub    $0x3c,%esp
    1529:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    152c:	89 d1                	mov    %edx,%ecx
{
    152e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1531:	85 d2                	test   %edx,%edx
    1533:	0f 89 7f 00 00 00    	jns    15b8 <printint+0x98>
    1539:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    153d:	74 79                	je     15b8 <printint+0x98>
    neg = 1;
    153f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1546:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1548:	31 db                	xor    %ebx,%ebx
    154a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    154d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1550:	89 c8                	mov    %ecx,%eax
    1552:	31 d2                	xor    %edx,%edx
    1554:	89 cf                	mov    %ecx,%edi
    1556:	f7 75 c4             	divl   -0x3c(%ebp)
    1559:	0f b6 92 80 19 00 00 	movzbl 0x1980(%edx),%edx
    1560:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1563:	89 d8                	mov    %ebx,%eax
    1565:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1568:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    156b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    156e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1571:	76 dd                	jbe    1550 <printint+0x30>
  if(neg)
    1573:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1576:	85 c9                	test   %ecx,%ecx
    1578:	74 0c                	je     1586 <printint+0x66>
    buf[i++] = '-';
    157a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    157f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1581:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1586:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1589:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    158d:	eb 07                	jmp    1596 <printint+0x76>
    158f:	90                   	nop
    putc(fd, buf[i]);
    1590:	0f b6 13             	movzbl (%ebx),%edx
    1593:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1596:	83 ec 04             	sub    $0x4,%esp
    1599:	88 55 d7             	mov    %dl,-0x29(%ebp)
    159c:	6a 01                	push   $0x1
    159e:	56                   	push   %esi
    159f:	57                   	push   %edi
    15a0:	e8 b4 fe ff ff       	call   1459 <write>
  while(--i >= 0)
    15a5:	83 c4 10             	add    $0x10,%esp
    15a8:	39 de                	cmp    %ebx,%esi
    15aa:	75 e4                	jne    1590 <printint+0x70>
}
    15ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15af:	5b                   	pop    %ebx
    15b0:	5e                   	pop    %esi
    15b1:	5f                   	pop    %edi
    15b2:	5d                   	pop    %ebp
    15b3:	c3                   	ret    
    15b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    15b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    15bf:	eb 87                	jmp    1548 <printint+0x28>
    15c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15cf:	90                   	nop

000015d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    15d0:	55                   	push   %ebp
    15d1:	89 e5                	mov    %esp,%ebp
    15d3:	57                   	push   %edi
    15d4:	56                   	push   %esi
    15d5:	53                   	push   %ebx
    15d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    15dc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    15df:	0f b6 13             	movzbl (%ebx),%edx
    15e2:	84 d2                	test   %dl,%dl
    15e4:	74 6a                	je     1650 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    15e6:	8d 45 10             	lea    0x10(%ebp),%eax
    15e9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    15ec:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    15ef:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    15f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15f4:	eb 36                	jmp    162c <printf+0x5c>
    15f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15fd:	8d 76 00             	lea    0x0(%esi),%esi
    1600:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1603:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1608:	83 f8 25             	cmp    $0x25,%eax
    160b:	74 15                	je     1622 <printf+0x52>
  write(fd, &c, 1);
    160d:	83 ec 04             	sub    $0x4,%esp
    1610:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1613:	6a 01                	push   $0x1
    1615:	57                   	push   %edi
    1616:	56                   	push   %esi
    1617:	e8 3d fe ff ff       	call   1459 <write>
    161c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    161f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1622:	0f b6 13             	movzbl (%ebx),%edx
    1625:	83 c3 01             	add    $0x1,%ebx
    1628:	84 d2                	test   %dl,%dl
    162a:	74 24                	je     1650 <printf+0x80>
    c = fmt[i] & 0xff;
    162c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    162f:	85 c9                	test   %ecx,%ecx
    1631:	74 cd                	je     1600 <printf+0x30>
      }
    } else if(state == '%'){
    1633:	83 f9 25             	cmp    $0x25,%ecx
    1636:	75 ea                	jne    1622 <printf+0x52>
      if(c == 'd'){
    1638:	83 f8 25             	cmp    $0x25,%eax
    163b:	0f 84 07 01 00 00    	je     1748 <printf+0x178>
    1641:	83 e8 63             	sub    $0x63,%eax
    1644:	83 f8 15             	cmp    $0x15,%eax
    1647:	77 17                	ja     1660 <printf+0x90>
    1649:	ff 24 85 28 19 00 00 	jmp    *0x1928(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1650:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1653:	5b                   	pop    %ebx
    1654:	5e                   	pop    %esi
    1655:	5f                   	pop    %edi
    1656:	5d                   	pop    %ebp
    1657:	c3                   	ret    
    1658:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    165f:	90                   	nop
  write(fd, &c, 1);
    1660:	83 ec 04             	sub    $0x4,%esp
    1663:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1666:	6a 01                	push   $0x1
    1668:	57                   	push   %edi
    1669:	56                   	push   %esi
    166a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    166e:	e8 e6 fd ff ff       	call   1459 <write>
        putc(fd, c);
    1673:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1677:	83 c4 0c             	add    $0xc,%esp
    167a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    167d:	6a 01                	push   $0x1
    167f:	57                   	push   %edi
    1680:	56                   	push   %esi
    1681:	e8 d3 fd ff ff       	call   1459 <write>
        putc(fd, c);
    1686:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1689:	31 c9                	xor    %ecx,%ecx
    168b:	eb 95                	jmp    1622 <printf+0x52>
    168d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1690:	83 ec 0c             	sub    $0xc,%esp
    1693:	b9 10 00 00 00       	mov    $0x10,%ecx
    1698:	6a 00                	push   $0x0
    169a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    169d:	8b 10                	mov    (%eax),%edx
    169f:	89 f0                	mov    %esi,%eax
    16a1:	e8 7a fe ff ff       	call   1520 <printint>
        ap++;
    16a6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    16aa:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16ad:	31 c9                	xor    %ecx,%ecx
    16af:	e9 6e ff ff ff       	jmp    1622 <printf+0x52>
    16b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    16b8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    16bb:	8b 10                	mov    (%eax),%edx
        ap++;
    16bd:	83 c0 04             	add    $0x4,%eax
    16c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    16c3:	85 d2                	test   %edx,%edx
    16c5:	0f 84 8d 00 00 00    	je     1758 <printf+0x188>
        while(*s != 0){
    16cb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    16ce:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    16d0:	84 c0                	test   %al,%al
    16d2:	0f 84 4a ff ff ff    	je     1622 <printf+0x52>
    16d8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    16db:	89 d3                	mov    %edx,%ebx
    16dd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    16e0:	83 ec 04             	sub    $0x4,%esp
          s++;
    16e3:	83 c3 01             	add    $0x1,%ebx
    16e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    16e9:	6a 01                	push   $0x1
    16eb:	57                   	push   %edi
    16ec:	56                   	push   %esi
    16ed:	e8 67 fd ff ff       	call   1459 <write>
        while(*s != 0){
    16f2:	0f b6 03             	movzbl (%ebx),%eax
    16f5:	83 c4 10             	add    $0x10,%esp
    16f8:	84 c0                	test   %al,%al
    16fa:	75 e4                	jne    16e0 <printf+0x110>
      state = 0;
    16fc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    16ff:	31 c9                	xor    %ecx,%ecx
    1701:	e9 1c ff ff ff       	jmp    1622 <printf+0x52>
    1706:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    170d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1710:	83 ec 0c             	sub    $0xc,%esp
    1713:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1718:	6a 01                	push   $0x1
    171a:	e9 7b ff ff ff       	jmp    169a <printf+0xca>
    171f:	90                   	nop
        putc(fd, *ap);
    1720:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1723:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1726:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1728:	6a 01                	push   $0x1
    172a:	57                   	push   %edi
    172b:	56                   	push   %esi
        putc(fd, *ap);
    172c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    172f:	e8 25 fd ff ff       	call   1459 <write>
        ap++;
    1734:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1738:	83 c4 10             	add    $0x10,%esp
      state = 0;
    173b:	31 c9                	xor    %ecx,%ecx
    173d:	e9 e0 fe ff ff       	jmp    1622 <printf+0x52>
    1742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1748:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    174b:	83 ec 04             	sub    $0x4,%esp
    174e:	e9 2a ff ff ff       	jmp    167d <printf+0xad>
    1753:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1757:	90                   	nop
          s = "(null)";
    1758:	ba 1e 19 00 00       	mov    $0x191e,%edx
        while(*s != 0){
    175d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1760:	b8 28 00 00 00       	mov    $0x28,%eax
    1765:	89 d3                	mov    %edx,%ebx
    1767:	e9 74 ff ff ff       	jmp    16e0 <printf+0x110>
    176c:	66 90                	xchg   %ax,%ax
    176e:	66 90                	xchg   %ax,%ax

00001770 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1770:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1771:	a1 d8 1c 00 00       	mov    0x1cd8,%eax
{
    1776:	89 e5                	mov    %esp,%ebp
    1778:	57                   	push   %edi
    1779:	56                   	push   %esi
    177a:	53                   	push   %ebx
    177b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    177e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1788:	89 c2                	mov    %eax,%edx
    178a:	8b 00                	mov    (%eax),%eax
    178c:	39 ca                	cmp    %ecx,%edx
    178e:	73 30                	jae    17c0 <free+0x50>
    1790:	39 c1                	cmp    %eax,%ecx
    1792:	72 04                	jb     1798 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1794:	39 c2                	cmp    %eax,%edx
    1796:	72 f0                	jb     1788 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1798:	8b 73 fc             	mov    -0x4(%ebx),%esi
    179b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    179e:	39 f8                	cmp    %edi,%eax
    17a0:	74 30                	je     17d2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    17a2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    17a5:	8b 42 04             	mov    0x4(%edx),%eax
    17a8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    17ab:	39 f1                	cmp    %esi,%ecx
    17ad:	74 3a                	je     17e9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    17af:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    17b1:	5b                   	pop    %ebx
  freep = p;
    17b2:	89 15 d8 1c 00 00    	mov    %edx,0x1cd8
}
    17b8:	5e                   	pop    %esi
    17b9:	5f                   	pop    %edi
    17ba:	5d                   	pop    %ebp
    17bb:	c3                   	ret    
    17bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    17c0:	39 c2                	cmp    %eax,%edx
    17c2:	72 c4                	jb     1788 <free+0x18>
    17c4:	39 c1                	cmp    %eax,%ecx
    17c6:	73 c0                	jae    1788 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    17c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    17cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    17ce:	39 f8                	cmp    %edi,%eax
    17d0:	75 d0                	jne    17a2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    17d2:	03 70 04             	add    0x4(%eax),%esi
    17d5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    17d8:	8b 02                	mov    (%edx),%eax
    17da:	8b 00                	mov    (%eax),%eax
    17dc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    17df:	8b 42 04             	mov    0x4(%edx),%eax
    17e2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    17e5:	39 f1                	cmp    %esi,%ecx
    17e7:	75 c6                	jne    17af <free+0x3f>
    p->s.size += bp->s.size;
    17e9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    17ec:	89 15 d8 1c 00 00    	mov    %edx,0x1cd8
    p->s.size += bp->s.size;
    17f2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    17f5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    17f8:	89 0a                	mov    %ecx,(%edx)
}
    17fa:	5b                   	pop    %ebx
    17fb:	5e                   	pop    %esi
    17fc:	5f                   	pop    %edi
    17fd:	5d                   	pop    %ebp
    17fe:	c3                   	ret    
    17ff:	90                   	nop

00001800 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1800:	55                   	push   %ebp
    1801:	89 e5                	mov    %esp,%ebp
    1803:	57                   	push   %edi
    1804:	56                   	push   %esi
    1805:	53                   	push   %ebx
    1806:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1809:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    180c:	8b 3d d8 1c 00 00    	mov    0x1cd8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1812:	8d 70 07             	lea    0x7(%eax),%esi
    1815:	c1 ee 03             	shr    $0x3,%esi
    1818:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    181b:	85 ff                	test   %edi,%edi
    181d:	0f 84 9d 00 00 00    	je     18c0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1823:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1825:	8b 4a 04             	mov    0x4(%edx),%ecx
    1828:	39 f1                	cmp    %esi,%ecx
    182a:	73 6a                	jae    1896 <malloc+0x96>
    182c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1831:	39 de                	cmp    %ebx,%esi
    1833:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1836:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    183d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1840:	eb 17                	jmp    1859 <malloc+0x59>
    1842:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1848:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    184a:	8b 48 04             	mov    0x4(%eax),%ecx
    184d:	39 f1                	cmp    %esi,%ecx
    184f:	73 4f                	jae    18a0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1851:	8b 3d d8 1c 00 00    	mov    0x1cd8,%edi
    1857:	89 c2                	mov    %eax,%edx
    1859:	39 d7                	cmp    %edx,%edi
    185b:	75 eb                	jne    1848 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    185d:	83 ec 0c             	sub    $0xc,%esp
    1860:	ff 75 e4             	push   -0x1c(%ebp)
    1863:	e8 59 fc ff ff       	call   14c1 <sbrk>
  if(p == (char*)-1)
    1868:	83 c4 10             	add    $0x10,%esp
    186b:	83 f8 ff             	cmp    $0xffffffff,%eax
    186e:	74 1c                	je     188c <malloc+0x8c>
  hp->s.size = nu;
    1870:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1873:	83 ec 0c             	sub    $0xc,%esp
    1876:	83 c0 08             	add    $0x8,%eax
    1879:	50                   	push   %eax
    187a:	e8 f1 fe ff ff       	call   1770 <free>
  return freep;
    187f:	8b 15 d8 1c 00 00    	mov    0x1cd8,%edx
      if((p = morecore(nunits)) == 0)
    1885:	83 c4 10             	add    $0x10,%esp
    1888:	85 d2                	test   %edx,%edx
    188a:	75 bc                	jne    1848 <malloc+0x48>
        return 0;
  }
}
    188c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    188f:	31 c0                	xor    %eax,%eax
}
    1891:	5b                   	pop    %ebx
    1892:	5e                   	pop    %esi
    1893:	5f                   	pop    %edi
    1894:	5d                   	pop    %ebp
    1895:	c3                   	ret    
    if(p->s.size >= nunits){
    1896:	89 d0                	mov    %edx,%eax
    1898:	89 fa                	mov    %edi,%edx
    189a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    18a0:	39 ce                	cmp    %ecx,%esi
    18a2:	74 4c                	je     18f0 <malloc+0xf0>
        p->s.size -= nunits;
    18a4:	29 f1                	sub    %esi,%ecx
    18a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    18a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    18ac:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    18af:	89 15 d8 1c 00 00    	mov    %edx,0x1cd8
}
    18b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    18b8:	83 c0 08             	add    $0x8,%eax
}
    18bb:	5b                   	pop    %ebx
    18bc:	5e                   	pop    %esi
    18bd:	5f                   	pop    %edi
    18be:	5d                   	pop    %ebp
    18bf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    18c0:	c7 05 d8 1c 00 00 dc 	movl   $0x1cdc,0x1cd8
    18c7:	1c 00 00 
    base.s.size = 0;
    18ca:	bf dc 1c 00 00       	mov    $0x1cdc,%edi
    base.s.ptr = freep = prevp = &base;
    18cf:	c7 05 dc 1c 00 00 dc 	movl   $0x1cdc,0x1cdc
    18d6:	1c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18d9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    18db:	c7 05 e0 1c 00 00 00 	movl   $0x0,0x1ce0
    18e2:	00 00 00 
    if(p->s.size >= nunits){
    18e5:	e9 42 ff ff ff       	jmp    182c <malloc+0x2c>
    18ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    18f0:	8b 08                	mov    (%eax),%ecx
    18f2:	89 0a                	mov    %ecx,(%edx)
    18f4:	eb b9                	jmp    18af <malloc+0xaf>
