
_readSyscallTest:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
        (void)read(fd, &buf, 1);
    close(fd);
}

int main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	56                   	push   %esi
    100e:	53                   	push   %ebx
    100f:	51                   	push   %ecx
    1010:	83 ec 0c             	sub    $0xc,%esp
    int rc1 = getreadcount();
    1013:	e8 a1 04 00 00       	call   14b9 <getreadcount>
    printf(1, "Read count %d\n", rc1);
    1018:	83 ec 04             	sub    $0x4,%esp
    101b:	50                   	push   %eax
    int rc1 = getreadcount();
    101c:	89 c6                	mov    %eax,%esi
    printf(1, "Read count %d\n", rc1);
    101e:	68 d8 18 00 00       	push   $0x18d8
    1023:	6a 01                	push   $0x1
    1025:	e8 86 05 00 00       	call   15b0 <printf>
    int rc = fork();
    102a:	e8 e2 03 00 00       	call   1411 <fork>
    if (rc < 0)
    102f:	83 c4 10             	add    $0x10,%esp
    1032:	85 c0                	test   %eax,%eax
    1034:	78 74                	js     10aa <main+0xaa>
    {
        printf(1, "Fork failed!\n");
        exit();
    }
    readfile("README", 5);
    1036:	51                   	push   %ecx
    1037:	89 c3                	mov    %eax,%ebx
    1039:	51                   	push   %ecx
    103a:	6a 05                	push   $0x5
    103c:	68 f5 18 00 00       	push   $0x18f5
    1041:	e8 7a 00 00 00       	call   10c0 <readfile>
    if (rc > 0)
    1046:	83 c4 10             	add    $0x10,%esp
    1049:	85 db                	test   %ebx,%ebx
    104b:	74 58                	je     10a5 <main+0xa5>
    {
        wait();
    104d:	e8 cf 03 00 00       	call   1421 <wait>
        int rc2 = getreadcount();
    1052:	e8 62 04 00 00       	call   14b9 <getreadcount>
        printf(1, "Read count %d\n", rc2);
    1057:	52                   	push   %edx
        int rc2 = getreadcount();
    1058:	89 c3                	mov    %eax,%ebx
        printf(1, "Read count %d\n", rc2);
    105a:	50                   	push   %eax
        assert((rc2 - rc1) == 10);
    105b:	29 f3                	sub    %esi,%ebx
        printf(1, "Read count %d\n", rc2);
    105d:	68 d8 18 00 00       	push   $0x18d8
    1062:	6a 01                	push   $0x1
    1064:	e8 47 05 00 00       	call   15b0 <printf>
        assert((rc2 - rc1) == 10);
    1069:	83 c4 10             	add    $0x10,%esp
    106c:	83 fb 0a             	cmp    $0xa,%ebx
    106f:	74 23                	je     1094 <main+0x94>
    1071:	83 ec 0c             	sub    $0xc,%esp
    1074:	6a 29                	push   $0x29
    1076:	68 fc 18 00 00       	push   $0x18fc
    107b:	68 0e 19 00 00       	push   $0x190e
    1080:	68 20 19 00 00       	push   $0x1920
    1085:	6a 01                	push   $0x1
    1087:	e8 24 05 00 00       	call   15b0 <printf>
    108c:	83 c4 20             	add    $0x20,%esp
    108f:	e8 85 03 00 00       	call   1419 <exit>
        printf(1, "TEST PASSED\n");
    1094:	50                   	push   %eax
    1095:	50                   	push   %eax
    1096:	68 38 19 00 00       	push   $0x1938
    109b:	6a 01                	push   $0x1
    109d:	e8 0e 05 00 00       	call   15b0 <printf>
    10a2:	83 c4 10             	add    $0x10,%esp
    }
    exit();
    10a5:	e8 6f 03 00 00       	call   1419 <exit>
        printf(1, "Fork failed!\n");
    10aa:	53                   	push   %ebx
    10ab:	53                   	push   %ebx
    10ac:	68 e7 18 00 00       	push   $0x18e7
    10b1:	6a 01                	push   $0x1
    10b3:	e8 f8 04 00 00       	call   15b0 <printf>
        exit();
    10b8:	e8 5c 03 00 00       	call   1419 <exit>
    10bd:	66 90                	xchg   %ax,%ax
    10bf:	90                   	nop

000010c0 <readfile>:
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	57                   	push   %edi
    10c4:	56                   	push   %esi
    10c5:	53                   	push   %ebx
    10c6:	83 ec 24             	sub    $0x24,%esp
    int fd = open(file, 0);
    10c9:	6a 00                	push   $0x0
    10cb:	ff 75 08             	push   0x8(%ebp)
    10ce:	e8 86 03 00 00       	call   1459 <open>
    for (i = 0; i < howmany; i++)
    10d3:	83 c4 10             	add    $0x10,%esp
    int fd = open(file, 0);
    10d6:	89 c3                	mov    %eax,%ebx
    for (i = 0; i < howmany; i++)
    10d8:	8b 45 0c             	mov    0xc(%ebp),%eax
    10db:	85 c0                	test   %eax,%eax
    10dd:	7e 20                	jle    10ff <readfile+0x3f>
    10df:	31 f6                	xor    %esi,%esi
    10e1:	8d 7d e7             	lea    -0x19(%ebp),%edi
    10e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        (void)read(fd, &buf, 1);
    10e8:	83 ec 04             	sub    $0x4,%esp
    for (i = 0; i < howmany; i++)
    10eb:	83 c6 01             	add    $0x1,%esi
        (void)read(fd, &buf, 1);
    10ee:	6a 01                	push   $0x1
    10f0:	57                   	push   %edi
    10f1:	53                   	push   %ebx
    10f2:	e8 3a 03 00 00       	call   1431 <read>
    for (i = 0; i < howmany; i++)
    10f7:	83 c4 10             	add    $0x10,%esp
    10fa:	39 75 0c             	cmp    %esi,0xc(%ebp)
    10fd:	75 e9                	jne    10e8 <readfile+0x28>
    close(fd);
    10ff:	83 ec 0c             	sub    $0xc,%esp
    1102:	53                   	push   %ebx
    1103:	e8 39 03 00 00       	call   1441 <close>
}
    1108:	83 c4 10             	add    $0x10,%esp
    110b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    110e:	5b                   	pop    %ebx
    110f:	5e                   	pop    %esi
    1110:	5f                   	pop    %edi
    1111:	5d                   	pop    %ebp
    1112:	c3                   	ret    
    1113:	66 90                	xchg   %ax,%ax
    1115:	66 90                	xchg   %ax,%ax
    1117:	66 90                	xchg   %ax,%ax
    1119:	66 90                	xchg   %ax,%ax
    111b:	66 90                	xchg   %ax,%ax
    111d:	66 90                	xchg   %ax,%ax
    111f:	90                   	nop

00001120 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    1120:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1121:	31 c0                	xor    %eax,%eax
{
    1123:	89 e5                	mov    %esp,%ebp
    1125:	53                   	push   %ebx
    1126:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    112c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1130:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1134:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1137:	83 c0 01             	add    $0x1,%eax
    113a:	84 d2                	test   %dl,%dl
    113c:	75 f2                	jne    1130 <strcpy+0x10>
    ;
  return os;
}
    113e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1141:	89 c8                	mov    %ecx,%eax
    1143:	c9                   	leave  
    1144:	c3                   	ret    
    1145:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	53                   	push   %ebx
    1154:	8b 55 08             	mov    0x8(%ebp),%edx
    1157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    115a:	0f b6 02             	movzbl (%edx),%eax
    115d:	84 c0                	test   %al,%al
    115f:	75 17                	jne    1178 <strcmp+0x28>
    1161:	eb 3a                	jmp    119d <strcmp+0x4d>
    1163:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1167:	90                   	nop
    1168:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    116c:	83 c2 01             	add    $0x1,%edx
    116f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1172:	84 c0                	test   %al,%al
    1174:	74 1a                	je     1190 <strcmp+0x40>
    p++, q++;
    1176:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1178:	0f b6 19             	movzbl (%ecx),%ebx
    117b:	38 c3                	cmp    %al,%bl
    117d:	74 e9                	je     1168 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    117f:	29 d8                	sub    %ebx,%eax
}
    1181:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1184:	c9                   	leave  
    1185:	c3                   	ret    
    1186:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    118d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1190:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1194:	31 c0                	xor    %eax,%eax
    1196:	29 d8                	sub    %ebx,%eax
}
    1198:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    119b:	c9                   	leave  
    119c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    119d:	0f b6 19             	movzbl (%ecx),%ebx
    11a0:	31 c0                	xor    %eax,%eax
    11a2:	eb db                	jmp    117f <strcmp+0x2f>
    11a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11af:	90                   	nop

000011b0 <strlen>:

uint
strlen(const char *s)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    11b6:	80 3a 00             	cmpb   $0x0,(%edx)
    11b9:	74 15                	je     11d0 <strlen+0x20>
    11bb:	31 c0                	xor    %eax,%eax
    11bd:	8d 76 00             	lea    0x0(%esi),%esi
    11c0:	83 c0 01             	add    $0x1,%eax
    11c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    11c7:	89 c1                	mov    %eax,%ecx
    11c9:	75 f5                	jne    11c0 <strlen+0x10>
    ;
  return n;
}
    11cb:	89 c8                	mov    %ecx,%eax
    11cd:	5d                   	pop    %ebp
    11ce:	c3                   	ret    
    11cf:	90                   	nop
  for(n = 0; s[n]; n++)
    11d0:	31 c9                	xor    %ecx,%ecx
}
    11d2:	5d                   	pop    %ebp
    11d3:	89 c8                	mov    %ecx,%eax
    11d5:	c3                   	ret    
    11d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11dd:	8d 76 00             	lea    0x0(%esi),%esi

000011e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	57                   	push   %edi
    11e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ed:	89 d7                	mov    %edx,%edi
    11ef:	fc                   	cld    
    11f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
    11f5:	89 d0                	mov    %edx,%eax
    11f7:	c9                   	leave  
    11f8:	c3                   	ret    
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001200 <strchr>:

char*
strchr(const char *s, char c)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	8b 45 08             	mov    0x8(%ebp),%eax
    1206:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    120a:	0f b6 10             	movzbl (%eax),%edx
    120d:	84 d2                	test   %dl,%dl
    120f:	75 12                	jne    1223 <strchr+0x23>
    1211:	eb 1d                	jmp    1230 <strchr+0x30>
    1213:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1217:	90                   	nop
    1218:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    121c:	83 c0 01             	add    $0x1,%eax
    121f:	84 d2                	test   %dl,%dl
    1221:	74 0d                	je     1230 <strchr+0x30>
    if(*s == c)
    1223:	38 d1                	cmp    %dl,%cl
    1225:	75 f1                	jne    1218 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1227:	5d                   	pop    %ebp
    1228:	c3                   	ret    
    1229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1230:	31 c0                	xor    %eax,%eax
}
    1232:	5d                   	pop    %ebp
    1233:	c3                   	ret    
    1234:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    123b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    123f:	90                   	nop

00001240 <gets>:

char*
gets(char *buf, int max)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	57                   	push   %edi
    1244:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1245:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1248:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1249:	31 db                	xor    %ebx,%ebx
{
    124b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    124e:	eb 27                	jmp    1277 <gets+0x37>
    cc = read(0, &c, 1);
    1250:	83 ec 04             	sub    $0x4,%esp
    1253:	6a 01                	push   $0x1
    1255:	57                   	push   %edi
    1256:	6a 00                	push   $0x0
    1258:	e8 d4 01 00 00       	call   1431 <read>
    if(cc < 1)
    125d:	83 c4 10             	add    $0x10,%esp
    1260:	85 c0                	test   %eax,%eax
    1262:	7e 1d                	jle    1281 <gets+0x41>
      break;
    buf[i++] = c;
    1264:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1268:	8b 55 08             	mov    0x8(%ebp),%edx
    126b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    126f:	3c 0a                	cmp    $0xa,%al
    1271:	74 1d                	je     1290 <gets+0x50>
    1273:	3c 0d                	cmp    $0xd,%al
    1275:	74 19                	je     1290 <gets+0x50>
  for(i=0; i+1 < max; ){
    1277:	89 de                	mov    %ebx,%esi
    1279:	83 c3 01             	add    $0x1,%ebx
    127c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    127f:	7c cf                	jl     1250 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1281:	8b 45 08             	mov    0x8(%ebp),%eax
    1284:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1288:	8d 65 f4             	lea    -0xc(%ebp),%esp
    128b:	5b                   	pop    %ebx
    128c:	5e                   	pop    %esi
    128d:	5f                   	pop    %edi
    128e:	5d                   	pop    %ebp
    128f:	c3                   	ret    
  buf[i] = '\0';
    1290:	8b 45 08             	mov    0x8(%ebp),%eax
    1293:	89 de                	mov    %ebx,%esi
    1295:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    1299:	8d 65 f4             	lea    -0xc(%ebp),%esp
    129c:	5b                   	pop    %ebx
    129d:	5e                   	pop    %esi
    129e:	5f                   	pop    %edi
    129f:	5d                   	pop    %ebp
    12a0:	c3                   	ret    
    12a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12af:	90                   	nop

000012b0 <stat>:

int
stat(const char *n, struct stat *st)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	56                   	push   %esi
    12b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12b5:	83 ec 08             	sub    $0x8,%esp
    12b8:	6a 00                	push   $0x0
    12ba:	ff 75 08             	push   0x8(%ebp)
    12bd:	e8 97 01 00 00       	call   1459 <open>
  if(fd < 0)
    12c2:	83 c4 10             	add    $0x10,%esp
    12c5:	85 c0                	test   %eax,%eax
    12c7:	78 27                	js     12f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12c9:	83 ec 08             	sub    $0x8,%esp
    12cc:	ff 75 0c             	push   0xc(%ebp)
    12cf:	89 c3                	mov    %eax,%ebx
    12d1:	50                   	push   %eax
    12d2:	e8 9a 01 00 00       	call   1471 <fstat>
  close(fd);
    12d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12da:	89 c6                	mov    %eax,%esi
  close(fd);
    12dc:	e8 60 01 00 00       	call   1441 <close>
  return r;
    12e1:	83 c4 10             	add    $0x10,%esp
}
    12e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12e7:	89 f0                	mov    %esi,%eax
    12e9:	5b                   	pop    %ebx
    12ea:	5e                   	pop    %esi
    12eb:	5d                   	pop    %ebp
    12ec:	c3                   	ret    
    12ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    12f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12f5:	eb ed                	jmp    12e4 <stat+0x34>
    12f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12fe:	66 90                	xchg   %ax,%ax

00001300 <atoi>:

int
atoi(const char *s)
{
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	53                   	push   %ebx
    1304:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1307:	0f be 02             	movsbl (%edx),%eax
    130a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    130d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1310:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1315:	77 1e                	ja     1335 <atoi+0x35>
    1317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    131e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1320:	83 c2 01             	add    $0x1,%edx
    1323:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1326:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    132a:	0f be 02             	movsbl (%edx),%eax
    132d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1330:	80 fb 09             	cmp    $0x9,%bl
    1333:	76 eb                	jbe    1320 <atoi+0x20>
  return n;
}
    1335:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1338:	89 c8                	mov    %ecx,%eax
    133a:	c9                   	leave  
    133b:	c3                   	ret    
    133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	57                   	push   %edi
    1344:	8b 45 10             	mov    0x10(%ebp),%eax
    1347:	8b 55 08             	mov    0x8(%ebp),%edx
    134a:	56                   	push   %esi
    134b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    134e:	85 c0                	test   %eax,%eax
    1350:	7e 13                	jle    1365 <memmove+0x25>
    1352:	01 d0                	add    %edx,%eax
  dst = vdst;
    1354:	89 d7                	mov    %edx,%edi
    1356:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    135d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1360:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1361:	39 f8                	cmp    %edi,%eax
    1363:	75 fb                	jne    1360 <memmove+0x20>
  return vdst;
}
    1365:	5e                   	pop    %esi
    1366:	89 d0                	mov    %edx,%eax
    1368:	5f                   	pop    %edi
    1369:	5d                   	pop    %ebp
    136a:	c3                   	ret    
    136b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    136f:	90                   	nop

00001370 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    1376:	68 00 10 00 00       	push   $0x1000
    137b:	e8 60 04 00 00       	call   17e0 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    1380:	50                   	push   %eax
    1381:	ff 75 10             	push   0x10(%ebp)
    1384:	ff 75 0c             	push   0xc(%ebp)
    1387:	ff 75 08             	push   0x8(%ebp)
    138a:	e8 42 01 00 00       	call   14d1 <clone>
}
    138f:	c9                   	leave  
    1390:	c3                   	ret    
    1391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1398:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    139f:	90                   	nop

000013a0 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    13a0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    13a1:	b9 01 00 00 00       	mov    $0x1,%ecx
    13a6:	89 e5                	mov    %esp,%ebp
    13a8:	8b 55 08             	mov    0x8(%ebp),%edx
    13ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13af:	90                   	nop
    13b0:	89 c8                	mov    %ecx,%eax
    13b2:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    13b5:	85 c0                	test   %eax,%eax
    13b7:	75 f7                	jne    13b0 <lock_acquire+0x10>
}
    13b9:	5d                   	pop    %ebp
    13ba:	c3                   	ret    
    13bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13bf:	90                   	nop

000013c0 <lock_release>:

void lock_release(lock_thread *lock){
    13c0:	55                   	push   %ebp
    13c1:	31 c0                	xor    %eax,%eax
    13c3:	89 e5                	mov    %esp,%ebp
    13c5:	8b 55 08             	mov    0x8(%ebp),%edx
    13c8:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    13cb:	5d                   	pop    %ebp
    13cc:	c3                   	ret    
    13cd:	8d 76 00             	lea    0x0(%esi),%esi

000013d0 <lock_init>:

int lock_init(lock_thread *lock)
{
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    13d3:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    13d6:	68 45 19 00 00       	push   $0x1945
    13db:	6a 01                	push   $0x1
    13dd:	e8 ce 01 00 00       	call   15b0 <printf>
  lock->locked = 0;
    13e2:	8b 45 08             	mov    0x8(%ebp),%eax
    13e5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    13eb:	58                   	pop    %eax
    13ec:	5a                   	pop    %edx
    13ed:	68 45 19 00 00       	push   $0x1945
    13f2:	6a 01                	push   $0x1
    13f4:	e8 b7 01 00 00       	call   15b0 <printf>
  return 0;
}
    13f9:	31 c0                	xor    %eax,%eax
    13fb:	c9                   	leave  
    13fc:	c3                   	ret    
    13fd:	8d 76 00             	lea    0x0(%esi),%esi

00001400 <thread_join>:



int thread_join()
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    1406:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1409:	50                   	push   %eax
    140a:	e8 ca 00 00 00       	call   14d9 <join>
  return a;
    140f:	c9                   	leave  
    1410:	c3                   	ret    

00001411 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1411:	b8 01 00 00 00       	mov    $0x1,%eax
    1416:	cd 40                	int    $0x40
    1418:	c3                   	ret    

00001419 <exit>:
SYSCALL(exit)
    1419:	b8 02 00 00 00       	mov    $0x2,%eax
    141e:	cd 40                	int    $0x40
    1420:	c3                   	ret    

00001421 <wait>:
SYSCALL(wait)
    1421:	b8 03 00 00 00       	mov    $0x3,%eax
    1426:	cd 40                	int    $0x40
    1428:	c3                   	ret    

00001429 <pipe>:
SYSCALL(pipe)
    1429:	b8 04 00 00 00       	mov    $0x4,%eax
    142e:	cd 40                	int    $0x40
    1430:	c3                   	ret    

00001431 <read>:
SYSCALL(read)
    1431:	b8 05 00 00 00       	mov    $0x5,%eax
    1436:	cd 40                	int    $0x40
    1438:	c3                   	ret    

00001439 <write>:
SYSCALL(write)
    1439:	b8 10 00 00 00       	mov    $0x10,%eax
    143e:	cd 40                	int    $0x40
    1440:	c3                   	ret    

00001441 <close>:
SYSCALL(close)
    1441:	b8 15 00 00 00       	mov    $0x15,%eax
    1446:	cd 40                	int    $0x40
    1448:	c3                   	ret    

00001449 <kill>:
SYSCALL(kill)
    1449:	b8 06 00 00 00       	mov    $0x6,%eax
    144e:	cd 40                	int    $0x40
    1450:	c3                   	ret    

00001451 <exec>:
SYSCALL(exec)
    1451:	b8 07 00 00 00       	mov    $0x7,%eax
    1456:	cd 40                	int    $0x40
    1458:	c3                   	ret    

00001459 <open>:
SYSCALL(open)
    1459:	b8 0f 00 00 00       	mov    $0xf,%eax
    145e:	cd 40                	int    $0x40
    1460:	c3                   	ret    

00001461 <mknod>:
SYSCALL(mknod)
    1461:	b8 11 00 00 00       	mov    $0x11,%eax
    1466:	cd 40                	int    $0x40
    1468:	c3                   	ret    

00001469 <unlink>:
SYSCALL(unlink)
    1469:	b8 12 00 00 00       	mov    $0x12,%eax
    146e:	cd 40                	int    $0x40
    1470:	c3                   	ret    

00001471 <fstat>:
SYSCALL(fstat)
    1471:	b8 08 00 00 00       	mov    $0x8,%eax
    1476:	cd 40                	int    $0x40
    1478:	c3                   	ret    

00001479 <link>:
SYSCALL(link)
    1479:	b8 13 00 00 00       	mov    $0x13,%eax
    147e:	cd 40                	int    $0x40
    1480:	c3                   	ret    

00001481 <mkdir>:
SYSCALL(mkdir)
    1481:	b8 14 00 00 00       	mov    $0x14,%eax
    1486:	cd 40                	int    $0x40
    1488:	c3                   	ret    

00001489 <chdir>:
SYSCALL(chdir)
    1489:	b8 09 00 00 00       	mov    $0x9,%eax
    148e:	cd 40                	int    $0x40
    1490:	c3                   	ret    

00001491 <dup>:
SYSCALL(dup)
    1491:	b8 0a 00 00 00       	mov    $0xa,%eax
    1496:	cd 40                	int    $0x40
    1498:	c3                   	ret    

00001499 <getpid>:
SYSCALL(getpid)
    1499:	b8 0b 00 00 00       	mov    $0xb,%eax
    149e:	cd 40                	int    $0x40
    14a0:	c3                   	ret    

000014a1 <sbrk>:
SYSCALL(sbrk)
    14a1:	b8 0c 00 00 00       	mov    $0xc,%eax
    14a6:	cd 40                	int    $0x40
    14a8:	c3                   	ret    

000014a9 <sleep>:
SYSCALL(sleep)
    14a9:	b8 0d 00 00 00       	mov    $0xd,%eax
    14ae:	cd 40                	int    $0x40
    14b0:	c3                   	ret    

000014b1 <uptime>:
SYSCALL(uptime)
    14b1:	b8 0e 00 00 00       	mov    $0xe,%eax
    14b6:	cd 40                	int    $0x40
    14b8:	c3                   	ret    

000014b9 <getreadcount>:
SYSCALL(getreadcount)
    14b9:	b8 16 00 00 00       	mov    $0x16,%eax
    14be:	cd 40                	int    $0x40
    14c0:	c3                   	ret    

000014c1 <settickets>:
SYSCALL(settickets)
    14c1:	b8 17 00 00 00       	mov    $0x17,%eax
    14c6:	cd 40                	int    $0x40
    14c8:	c3                   	ret    

000014c9 <getpinfo>:
SYSCALL(getpinfo)
    14c9:	b8 18 00 00 00       	mov    $0x18,%eax
    14ce:	cd 40                	int    $0x40
    14d0:	c3                   	ret    

000014d1 <clone>:
SYSCALL(clone)
    14d1:	b8 19 00 00 00       	mov    $0x19,%eax
    14d6:	cd 40                	int    $0x40
    14d8:	c3                   	ret    

000014d9 <join>:
SYSCALL(join)
    14d9:	b8 1a 00 00 00       	mov    $0x1a,%eax
    14de:	cd 40                	int    $0x40
    14e0:	c3                   	ret    

000014e1 <mprotect>:
SYSCALL(mprotect)
    14e1:	b8 1b 00 00 00       	mov    $0x1b,%eax
    14e6:	cd 40                	int    $0x40
    14e8:	c3                   	ret    

000014e9 <munprotect>:
SYSCALL(munprotect)
    14e9:	b8 1c 00 00 00       	mov    $0x1c,%eax
    14ee:	cd 40                	int    $0x40
    14f0:	c3                   	ret    
    14f1:	66 90                	xchg   %ax,%ax
    14f3:	66 90                	xchg   %ax,%ax
    14f5:	66 90                	xchg   %ax,%ax
    14f7:	66 90                	xchg   %ax,%ax
    14f9:	66 90                	xchg   %ax,%ax
    14fb:	66 90                	xchg   %ax,%ax
    14fd:	66 90                	xchg   %ax,%ax
    14ff:	90                   	nop

00001500 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1500:	55                   	push   %ebp
    1501:	89 e5                	mov    %esp,%ebp
    1503:	57                   	push   %edi
    1504:	56                   	push   %esi
    1505:	53                   	push   %ebx
    1506:	83 ec 3c             	sub    $0x3c,%esp
    1509:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    150c:	89 d1                	mov    %edx,%ecx
{
    150e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1511:	85 d2                	test   %edx,%edx
    1513:	0f 89 7f 00 00 00    	jns    1598 <printint+0x98>
    1519:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    151d:	74 79                	je     1598 <printint+0x98>
    neg = 1;
    151f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1526:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1528:	31 db                	xor    %ebx,%ebx
    152a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    152d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1530:	89 c8                	mov    %ecx,%eax
    1532:	31 d2                	xor    %edx,%edx
    1534:	89 cf                	mov    %ecx,%edi
    1536:	f7 75 c4             	divl   -0x3c(%ebp)
    1539:	0f b6 92 a8 19 00 00 	movzbl 0x19a8(%edx),%edx
    1540:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1543:	89 d8                	mov    %ebx,%eax
    1545:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1548:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    154b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    154e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1551:	76 dd                	jbe    1530 <printint+0x30>
  if(neg)
    1553:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1556:	85 c9                	test   %ecx,%ecx
    1558:	74 0c                	je     1566 <printint+0x66>
    buf[i++] = '-';
    155a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    155f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1561:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1566:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1569:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    156d:	eb 07                	jmp    1576 <printint+0x76>
    156f:	90                   	nop
    putc(fd, buf[i]);
    1570:	0f b6 13             	movzbl (%ebx),%edx
    1573:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1576:	83 ec 04             	sub    $0x4,%esp
    1579:	88 55 d7             	mov    %dl,-0x29(%ebp)
    157c:	6a 01                	push   $0x1
    157e:	56                   	push   %esi
    157f:	57                   	push   %edi
    1580:	e8 b4 fe ff ff       	call   1439 <write>
  while(--i >= 0)
    1585:	83 c4 10             	add    $0x10,%esp
    1588:	39 de                	cmp    %ebx,%esi
    158a:	75 e4                	jne    1570 <printint+0x70>
}
    158c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    158f:	5b                   	pop    %ebx
    1590:	5e                   	pop    %esi
    1591:	5f                   	pop    %edi
    1592:	5d                   	pop    %ebp
    1593:	c3                   	ret    
    1594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1598:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    159f:	eb 87                	jmp    1528 <printint+0x28>
    15a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15af:	90                   	nop

000015b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    15b0:	55                   	push   %ebp
    15b1:	89 e5                	mov    %esp,%ebp
    15b3:	57                   	push   %edi
    15b4:	56                   	push   %esi
    15b5:	53                   	push   %ebx
    15b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    15bc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    15bf:	0f b6 13             	movzbl (%ebx),%edx
    15c2:	84 d2                	test   %dl,%dl
    15c4:	74 6a                	je     1630 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    15c6:	8d 45 10             	lea    0x10(%ebp),%eax
    15c9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    15cc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    15cf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    15d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15d4:	eb 36                	jmp    160c <printf+0x5c>
    15d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15dd:	8d 76 00             	lea    0x0(%esi),%esi
    15e0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    15e3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    15e8:	83 f8 25             	cmp    $0x25,%eax
    15eb:	74 15                	je     1602 <printf+0x52>
  write(fd, &c, 1);
    15ed:	83 ec 04             	sub    $0x4,%esp
    15f0:	88 55 e7             	mov    %dl,-0x19(%ebp)
    15f3:	6a 01                	push   $0x1
    15f5:	57                   	push   %edi
    15f6:	56                   	push   %esi
    15f7:	e8 3d fe ff ff       	call   1439 <write>
    15fc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    15ff:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1602:	0f b6 13             	movzbl (%ebx),%edx
    1605:	83 c3 01             	add    $0x1,%ebx
    1608:	84 d2                	test   %dl,%dl
    160a:	74 24                	je     1630 <printf+0x80>
    c = fmt[i] & 0xff;
    160c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    160f:	85 c9                	test   %ecx,%ecx
    1611:	74 cd                	je     15e0 <printf+0x30>
      }
    } else if(state == '%'){
    1613:	83 f9 25             	cmp    $0x25,%ecx
    1616:	75 ea                	jne    1602 <printf+0x52>
      if(c == 'd'){
    1618:	83 f8 25             	cmp    $0x25,%eax
    161b:	0f 84 07 01 00 00    	je     1728 <printf+0x178>
    1621:	83 e8 63             	sub    $0x63,%eax
    1624:	83 f8 15             	cmp    $0x15,%eax
    1627:	77 17                	ja     1640 <printf+0x90>
    1629:	ff 24 85 50 19 00 00 	jmp    *0x1950(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1630:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1633:	5b                   	pop    %ebx
    1634:	5e                   	pop    %esi
    1635:	5f                   	pop    %edi
    1636:	5d                   	pop    %ebp
    1637:	c3                   	ret    
    1638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    163f:	90                   	nop
  write(fd, &c, 1);
    1640:	83 ec 04             	sub    $0x4,%esp
    1643:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1646:	6a 01                	push   $0x1
    1648:	57                   	push   %edi
    1649:	56                   	push   %esi
    164a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    164e:	e8 e6 fd ff ff       	call   1439 <write>
        putc(fd, c);
    1653:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1657:	83 c4 0c             	add    $0xc,%esp
    165a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    165d:	6a 01                	push   $0x1
    165f:	57                   	push   %edi
    1660:	56                   	push   %esi
    1661:	e8 d3 fd ff ff       	call   1439 <write>
        putc(fd, c);
    1666:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1669:	31 c9                	xor    %ecx,%ecx
    166b:	eb 95                	jmp    1602 <printf+0x52>
    166d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1670:	83 ec 0c             	sub    $0xc,%esp
    1673:	b9 10 00 00 00       	mov    $0x10,%ecx
    1678:	6a 00                	push   $0x0
    167a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    167d:	8b 10                	mov    (%eax),%edx
    167f:	89 f0                	mov    %esi,%eax
    1681:	e8 7a fe ff ff       	call   1500 <printint>
        ap++;
    1686:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    168a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    168d:	31 c9                	xor    %ecx,%ecx
    168f:	e9 6e ff ff ff       	jmp    1602 <printf+0x52>
    1694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1698:	8b 45 d0             	mov    -0x30(%ebp),%eax
    169b:	8b 10                	mov    (%eax),%edx
        ap++;
    169d:	83 c0 04             	add    $0x4,%eax
    16a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    16a3:	85 d2                	test   %edx,%edx
    16a5:	0f 84 8d 00 00 00    	je     1738 <printf+0x188>
        while(*s != 0){
    16ab:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    16ae:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    16b0:	84 c0                	test   %al,%al
    16b2:	0f 84 4a ff ff ff    	je     1602 <printf+0x52>
    16b8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    16bb:	89 d3                	mov    %edx,%ebx
    16bd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    16c0:	83 ec 04             	sub    $0x4,%esp
          s++;
    16c3:	83 c3 01             	add    $0x1,%ebx
    16c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    16c9:	6a 01                	push   $0x1
    16cb:	57                   	push   %edi
    16cc:	56                   	push   %esi
    16cd:	e8 67 fd ff ff       	call   1439 <write>
        while(*s != 0){
    16d2:	0f b6 03             	movzbl (%ebx),%eax
    16d5:	83 c4 10             	add    $0x10,%esp
    16d8:	84 c0                	test   %al,%al
    16da:	75 e4                	jne    16c0 <printf+0x110>
      state = 0;
    16dc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    16df:	31 c9                	xor    %ecx,%ecx
    16e1:	e9 1c ff ff ff       	jmp    1602 <printf+0x52>
    16e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    16f0:	83 ec 0c             	sub    $0xc,%esp
    16f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    16f8:	6a 01                	push   $0x1
    16fa:	e9 7b ff ff ff       	jmp    167a <printf+0xca>
    16ff:	90                   	nop
        putc(fd, *ap);
    1700:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1703:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1706:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1708:	6a 01                	push   $0x1
    170a:	57                   	push   %edi
    170b:	56                   	push   %esi
        putc(fd, *ap);
    170c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    170f:	e8 25 fd ff ff       	call   1439 <write>
        ap++;
    1714:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1718:	83 c4 10             	add    $0x10,%esp
      state = 0;
    171b:	31 c9                	xor    %ecx,%ecx
    171d:	e9 e0 fe ff ff       	jmp    1602 <printf+0x52>
    1722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1728:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    172b:	83 ec 04             	sub    $0x4,%esp
    172e:	e9 2a ff ff ff       	jmp    165d <printf+0xad>
    1733:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1737:	90                   	nop
          s = "(null)";
    1738:	ba 48 19 00 00       	mov    $0x1948,%edx
        while(*s != 0){
    173d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1740:	b8 28 00 00 00       	mov    $0x28,%eax
    1745:	89 d3                	mov    %edx,%ebx
    1747:	e9 74 ff ff ff       	jmp    16c0 <printf+0x110>
    174c:	66 90                	xchg   %ax,%ax
    174e:	66 90                	xchg   %ax,%ax

00001750 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1750:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1751:	a1 24 1d 00 00       	mov    0x1d24,%eax
{
    1756:	89 e5                	mov    %esp,%ebp
    1758:	57                   	push   %edi
    1759:	56                   	push   %esi
    175a:	53                   	push   %ebx
    175b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    175e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1768:	89 c2                	mov    %eax,%edx
    176a:	8b 00                	mov    (%eax),%eax
    176c:	39 ca                	cmp    %ecx,%edx
    176e:	73 30                	jae    17a0 <free+0x50>
    1770:	39 c1                	cmp    %eax,%ecx
    1772:	72 04                	jb     1778 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1774:	39 c2                	cmp    %eax,%edx
    1776:	72 f0                	jb     1768 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1778:	8b 73 fc             	mov    -0x4(%ebx),%esi
    177b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    177e:	39 f8                	cmp    %edi,%eax
    1780:	74 30                	je     17b2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1782:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1785:	8b 42 04             	mov    0x4(%edx),%eax
    1788:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    178b:	39 f1                	cmp    %esi,%ecx
    178d:	74 3a                	je     17c9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    178f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1791:	5b                   	pop    %ebx
  freep = p;
    1792:	89 15 24 1d 00 00    	mov    %edx,0x1d24
}
    1798:	5e                   	pop    %esi
    1799:	5f                   	pop    %edi
    179a:	5d                   	pop    %ebp
    179b:	c3                   	ret    
    179c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    17a0:	39 c2                	cmp    %eax,%edx
    17a2:	72 c4                	jb     1768 <free+0x18>
    17a4:	39 c1                	cmp    %eax,%ecx
    17a6:	73 c0                	jae    1768 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    17a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    17ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    17ae:	39 f8                	cmp    %edi,%eax
    17b0:	75 d0                	jne    1782 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    17b2:	03 70 04             	add    0x4(%eax),%esi
    17b5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    17b8:	8b 02                	mov    (%edx),%eax
    17ba:	8b 00                	mov    (%eax),%eax
    17bc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    17bf:	8b 42 04             	mov    0x4(%edx),%eax
    17c2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    17c5:	39 f1                	cmp    %esi,%ecx
    17c7:	75 c6                	jne    178f <free+0x3f>
    p->s.size += bp->s.size;
    17c9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    17cc:	89 15 24 1d 00 00    	mov    %edx,0x1d24
    p->s.size += bp->s.size;
    17d2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    17d5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    17d8:	89 0a                	mov    %ecx,(%edx)
}
    17da:	5b                   	pop    %ebx
    17db:	5e                   	pop    %esi
    17dc:	5f                   	pop    %edi
    17dd:	5d                   	pop    %ebp
    17de:	c3                   	ret    
    17df:	90                   	nop

000017e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    17e0:	55                   	push   %ebp
    17e1:	89 e5                	mov    %esp,%ebp
    17e3:	57                   	push   %edi
    17e4:	56                   	push   %esi
    17e5:	53                   	push   %ebx
    17e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    17ec:	8b 3d 24 1d 00 00    	mov    0x1d24,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17f2:	8d 70 07             	lea    0x7(%eax),%esi
    17f5:	c1 ee 03             	shr    $0x3,%esi
    17f8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    17fb:	85 ff                	test   %edi,%edi
    17fd:	0f 84 9d 00 00 00    	je     18a0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1803:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1805:	8b 4a 04             	mov    0x4(%edx),%ecx
    1808:	39 f1                	cmp    %esi,%ecx
    180a:	73 6a                	jae    1876 <malloc+0x96>
    180c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1811:	39 de                	cmp    %ebx,%esi
    1813:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1816:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    181d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1820:	eb 17                	jmp    1839 <malloc+0x59>
    1822:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1828:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    182a:	8b 48 04             	mov    0x4(%eax),%ecx
    182d:	39 f1                	cmp    %esi,%ecx
    182f:	73 4f                	jae    1880 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1831:	8b 3d 24 1d 00 00    	mov    0x1d24,%edi
    1837:	89 c2                	mov    %eax,%edx
    1839:	39 d7                	cmp    %edx,%edi
    183b:	75 eb                	jne    1828 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    183d:	83 ec 0c             	sub    $0xc,%esp
    1840:	ff 75 e4             	push   -0x1c(%ebp)
    1843:	e8 59 fc ff ff       	call   14a1 <sbrk>
  if(p == (char*)-1)
    1848:	83 c4 10             	add    $0x10,%esp
    184b:	83 f8 ff             	cmp    $0xffffffff,%eax
    184e:	74 1c                	je     186c <malloc+0x8c>
  hp->s.size = nu;
    1850:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1853:	83 ec 0c             	sub    $0xc,%esp
    1856:	83 c0 08             	add    $0x8,%eax
    1859:	50                   	push   %eax
    185a:	e8 f1 fe ff ff       	call   1750 <free>
  return freep;
    185f:	8b 15 24 1d 00 00    	mov    0x1d24,%edx
      if((p = morecore(nunits)) == 0)
    1865:	83 c4 10             	add    $0x10,%esp
    1868:	85 d2                	test   %edx,%edx
    186a:	75 bc                	jne    1828 <malloc+0x48>
        return 0;
  }
}
    186c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    186f:	31 c0                	xor    %eax,%eax
}
    1871:	5b                   	pop    %ebx
    1872:	5e                   	pop    %esi
    1873:	5f                   	pop    %edi
    1874:	5d                   	pop    %ebp
    1875:	c3                   	ret    
    if(p->s.size >= nunits){
    1876:	89 d0                	mov    %edx,%eax
    1878:	89 fa                	mov    %edi,%edx
    187a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1880:	39 ce                	cmp    %ecx,%esi
    1882:	74 4c                	je     18d0 <malloc+0xf0>
        p->s.size -= nunits;
    1884:	29 f1                	sub    %esi,%ecx
    1886:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1889:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    188c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    188f:	89 15 24 1d 00 00    	mov    %edx,0x1d24
}
    1895:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1898:	83 c0 08             	add    $0x8,%eax
}
    189b:	5b                   	pop    %ebx
    189c:	5e                   	pop    %esi
    189d:	5f                   	pop    %edi
    189e:	5d                   	pop    %ebp
    189f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    18a0:	c7 05 24 1d 00 00 28 	movl   $0x1d28,0x1d24
    18a7:	1d 00 00 
    base.s.size = 0;
    18aa:	bf 28 1d 00 00       	mov    $0x1d28,%edi
    base.s.ptr = freep = prevp = &base;
    18af:	c7 05 28 1d 00 00 28 	movl   $0x1d28,0x1d28
    18b6:	1d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18b9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    18bb:	c7 05 2c 1d 00 00 00 	movl   $0x0,0x1d2c
    18c2:	00 00 00 
    if(p->s.size >= nunits){
    18c5:	e9 42 ff ff ff       	jmp    180c <malloc+0x2c>
    18ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    18d0:	8b 08                	mov    (%eax),%ecx
    18d2:	89 0a                	mov    %ecx,(%edx)
    18d4:	eb b9                	jmp    188f <malloc+0xaf>
