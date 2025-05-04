
_cat:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  }
}

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
    100f:	be 01 00 00 00       	mov    $0x1,%esi
    1014:	53                   	push   %ebx
    1015:	51                   	push   %ecx
    1016:	83 ec 18             	sub    $0x18,%esp
    1019:	8b 01                	mov    (%ecx),%eax
    101b:	8b 59 04             	mov    0x4(%ecx),%ebx
    101e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1021:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
    1024:	83 f8 01             	cmp    $0x1,%eax
    1027:	7e 54                	jle    107d <main+0x7d>
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	6a 00                	push   $0x0
    1035:	ff 33                	push   (%ebx)
    1037:	e8 0d 04 00 00       	call   1449 <open>
    103c:	83 c4 10             	add    $0x10,%esp
    103f:	89 c7                	mov    %eax,%edi
    1041:	85 c0                	test   %eax,%eax
    1043:	78 24                	js     1069 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
    1045:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
    1048:	83 c6 01             	add    $0x1,%esi
    104b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
    104e:	50                   	push   %eax
    104f:	e8 3c 00 00 00       	call   1090 <cat>
    close(fd);
    1054:	89 3c 24             	mov    %edi,(%esp)
    1057:	e8 d5 03 00 00       	call   1431 <close>
  for(i = 1; i < argc; i++){
    105c:	83 c4 10             	add    $0x10,%esp
    105f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1062:	75 cc                	jne    1030 <main+0x30>
  }
  exit();
    1064:	e8 a0 03 00 00       	call   1409 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
    1069:	50                   	push   %eax
    106a:	ff 33                	push   (%ebx)
    106c:	68 eb 18 00 00       	push   $0x18eb
    1071:	6a 01                	push   $0x1
    1073:	e8 28 05 00 00       	call   15a0 <printf>
      exit();
    1078:	e8 8c 03 00 00       	call   1409 <exit>
    cat(0);
    107d:	83 ec 0c             	sub    $0xc,%esp
    1080:	6a 00                	push   $0x0
    1082:	e8 09 00 00 00       	call   1090 <cat>
    exit();
    1087:	e8 7d 03 00 00       	call   1409 <exit>
    108c:	66 90                	xchg   %ax,%ax
    108e:	66 90                	xchg   %ax,%ax

00001090 <cat>:
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	56                   	push   %esi
    1094:	8b 75 08             	mov    0x8(%ebp),%esi
    1097:	53                   	push   %ebx
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    1098:	eb 1d                	jmp    10b7 <cat+0x27>
    109a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	53                   	push   %ebx
    10a4:	68 00 1d 00 00       	push   $0x1d00
    10a9:	6a 01                	push   $0x1
    10ab:	e8 79 03 00 00       	call   1429 <write>
    10b0:	83 c4 10             	add    $0x10,%esp
    10b3:	39 d8                	cmp    %ebx,%eax
    10b5:	75 25                	jne    10dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    10b7:	83 ec 04             	sub    $0x4,%esp
    10ba:	68 00 02 00 00       	push   $0x200
    10bf:	68 00 1d 00 00       	push   $0x1d00
    10c4:	56                   	push   %esi
    10c5:	e8 57 03 00 00       	call   1421 <read>
    10ca:	83 c4 10             	add    $0x10,%esp
    10cd:	89 c3                	mov    %eax,%ebx
    10cf:	85 c0                	test   %eax,%eax
    10d1:	7f cd                	jg     10a0 <cat+0x10>
  if(n < 0){
    10d3:	75 1b                	jne    10f0 <cat+0x60>
}
    10d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10d8:	5b                   	pop    %ebx
    10d9:	5e                   	pop    %esi
    10da:	5d                   	pop    %ebp
    10db:	c3                   	ret    
      printf(1, "cat: write error\n");
    10dc:	83 ec 08             	sub    $0x8,%esp
    10df:	68 c8 18 00 00       	push   $0x18c8
    10e4:	6a 01                	push   $0x1
    10e6:	e8 b5 04 00 00       	call   15a0 <printf>
      exit();
    10eb:	e8 19 03 00 00       	call   1409 <exit>
    printf(1, "cat: read error\n");
    10f0:	50                   	push   %eax
    10f1:	50                   	push   %eax
    10f2:	68 da 18 00 00       	push   $0x18da
    10f7:	6a 01                	push   $0x1
    10f9:	e8 a2 04 00 00       	call   15a0 <printf>
    exit();
    10fe:	e8 06 03 00 00       	call   1409 <exit>
    1103:	66 90                	xchg   %ax,%ax
    1105:	66 90                	xchg   %ax,%ax
    1107:	66 90                	xchg   %ax,%ax
    1109:	66 90                	xchg   %ax,%ax
    110b:	66 90                	xchg   %ax,%ax
    110d:	66 90                	xchg   %ax,%ax
    110f:	90                   	nop

00001110 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    1110:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1111:	31 c0                	xor    %eax,%eax
{
    1113:	89 e5                	mov    %esp,%ebp
    1115:	53                   	push   %ebx
    1116:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1119:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1127:	83 c0 01             	add    $0x1,%eax
    112a:	84 d2                	test   %dl,%dl
    112c:	75 f2                	jne    1120 <strcpy+0x10>
    ;
  return os;
}
    112e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1131:	89 c8                	mov    %ecx,%eax
    1133:	c9                   	leave  
    1134:	c3                   	ret    
    1135:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	53                   	push   %ebx
    1144:	8b 55 08             	mov    0x8(%ebp),%edx
    1147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    114a:	0f b6 02             	movzbl (%edx),%eax
    114d:	84 c0                	test   %al,%al
    114f:	75 17                	jne    1168 <strcmp+0x28>
    1151:	eb 3a                	jmp    118d <strcmp+0x4d>
    1153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1157:	90                   	nop
    1158:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    115c:	83 c2 01             	add    $0x1,%edx
    115f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1162:	84 c0                	test   %al,%al
    1164:	74 1a                	je     1180 <strcmp+0x40>
    p++, q++;
    1166:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1168:	0f b6 19             	movzbl (%ecx),%ebx
    116b:	38 c3                	cmp    %al,%bl
    116d:	74 e9                	je     1158 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    116f:	29 d8                	sub    %ebx,%eax
}
    1171:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1174:	c9                   	leave  
    1175:	c3                   	ret    
    1176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1180:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1184:	31 c0                	xor    %eax,%eax
    1186:	29 d8                	sub    %ebx,%eax
}
    1188:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    118b:	c9                   	leave  
    118c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    118d:	0f b6 19             	movzbl (%ecx),%ebx
    1190:	31 c0                	xor    %eax,%eax
    1192:	eb db                	jmp    116f <strcmp+0x2f>
    1194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    119b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    119f:	90                   	nop

000011a0 <strlen>:

uint
strlen(const char *s)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    11a6:	80 3a 00             	cmpb   $0x0,(%edx)
    11a9:	74 15                	je     11c0 <strlen+0x20>
    11ab:	31 c0                	xor    %eax,%eax
    11ad:	8d 76 00             	lea    0x0(%esi),%esi
    11b0:	83 c0 01             	add    $0x1,%eax
    11b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    11b7:	89 c1                	mov    %eax,%ecx
    11b9:	75 f5                	jne    11b0 <strlen+0x10>
    ;
  return n;
}
    11bb:	89 c8                	mov    %ecx,%eax
    11bd:	5d                   	pop    %ebp
    11be:	c3                   	ret    
    11bf:	90                   	nop
  for(n = 0; s[n]; n++)
    11c0:	31 c9                	xor    %ecx,%ecx
}
    11c2:	5d                   	pop    %ebp
    11c3:	89 c8                	mov    %ecx,%eax
    11c5:	c3                   	ret    
    11c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11cd:	8d 76 00             	lea    0x0(%esi),%esi

000011d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	57                   	push   %edi
    11d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11da:	8b 45 0c             	mov    0xc(%ebp),%eax
    11dd:	89 d7                	mov    %edx,%edi
    11df:	fc                   	cld    
    11e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
    11e5:	89 d0                	mov    %edx,%eax
    11e7:	c9                   	leave  
    11e8:	c3                   	ret    
    11e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011f0 <strchr>:

char*
strchr(const char *s, char c)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	8b 45 08             	mov    0x8(%ebp),%eax
    11f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    11fa:	0f b6 10             	movzbl (%eax),%edx
    11fd:	84 d2                	test   %dl,%dl
    11ff:	75 12                	jne    1213 <strchr+0x23>
    1201:	eb 1d                	jmp    1220 <strchr+0x30>
    1203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1207:	90                   	nop
    1208:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    120c:	83 c0 01             	add    $0x1,%eax
    120f:	84 d2                	test   %dl,%dl
    1211:	74 0d                	je     1220 <strchr+0x30>
    if(*s == c)
    1213:	38 d1                	cmp    %dl,%cl
    1215:	75 f1                	jne    1208 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1217:	5d                   	pop    %ebp
    1218:	c3                   	ret    
    1219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1220:	31 c0                	xor    %eax,%eax
}
    1222:	5d                   	pop    %ebp
    1223:	c3                   	ret    
    1224:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    122b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    122f:	90                   	nop

00001230 <gets>:

char*
gets(char *buf, int max)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	57                   	push   %edi
    1234:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1235:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1238:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1239:	31 db                	xor    %ebx,%ebx
{
    123b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    123e:	eb 27                	jmp    1267 <gets+0x37>
    cc = read(0, &c, 1);
    1240:	83 ec 04             	sub    $0x4,%esp
    1243:	6a 01                	push   $0x1
    1245:	57                   	push   %edi
    1246:	6a 00                	push   $0x0
    1248:	e8 d4 01 00 00       	call   1421 <read>
    if(cc < 1)
    124d:	83 c4 10             	add    $0x10,%esp
    1250:	85 c0                	test   %eax,%eax
    1252:	7e 1d                	jle    1271 <gets+0x41>
      break;
    buf[i++] = c;
    1254:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1258:	8b 55 08             	mov    0x8(%ebp),%edx
    125b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    125f:	3c 0a                	cmp    $0xa,%al
    1261:	74 1d                	je     1280 <gets+0x50>
    1263:	3c 0d                	cmp    $0xd,%al
    1265:	74 19                	je     1280 <gets+0x50>
  for(i=0; i+1 < max; ){
    1267:	89 de                	mov    %ebx,%esi
    1269:	83 c3 01             	add    $0x1,%ebx
    126c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    126f:	7c cf                	jl     1240 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1271:	8b 45 08             	mov    0x8(%ebp),%eax
    1274:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1278:	8d 65 f4             	lea    -0xc(%ebp),%esp
    127b:	5b                   	pop    %ebx
    127c:	5e                   	pop    %esi
    127d:	5f                   	pop    %edi
    127e:	5d                   	pop    %ebp
    127f:	c3                   	ret    
  buf[i] = '\0';
    1280:	8b 45 08             	mov    0x8(%ebp),%eax
    1283:	89 de                	mov    %ebx,%esi
    1285:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    1289:	8d 65 f4             	lea    -0xc(%ebp),%esp
    128c:	5b                   	pop    %ebx
    128d:	5e                   	pop    %esi
    128e:	5f                   	pop    %edi
    128f:	5d                   	pop    %ebp
    1290:	c3                   	ret    
    1291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1298:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    129f:	90                   	nop

000012a0 <stat>:

int
stat(const char *n, struct stat *st)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	56                   	push   %esi
    12a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12a5:	83 ec 08             	sub    $0x8,%esp
    12a8:	6a 00                	push   $0x0
    12aa:	ff 75 08             	push   0x8(%ebp)
    12ad:	e8 97 01 00 00       	call   1449 <open>
  if(fd < 0)
    12b2:	83 c4 10             	add    $0x10,%esp
    12b5:	85 c0                	test   %eax,%eax
    12b7:	78 27                	js     12e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12b9:	83 ec 08             	sub    $0x8,%esp
    12bc:	ff 75 0c             	push   0xc(%ebp)
    12bf:	89 c3                	mov    %eax,%ebx
    12c1:	50                   	push   %eax
    12c2:	e8 9a 01 00 00       	call   1461 <fstat>
  close(fd);
    12c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12ca:	89 c6                	mov    %eax,%esi
  close(fd);
    12cc:	e8 60 01 00 00       	call   1431 <close>
  return r;
    12d1:	83 c4 10             	add    $0x10,%esp
}
    12d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12d7:	89 f0                	mov    %esi,%eax
    12d9:	5b                   	pop    %ebx
    12da:	5e                   	pop    %esi
    12db:	5d                   	pop    %ebp
    12dc:	c3                   	ret    
    12dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    12e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12e5:	eb ed                	jmp    12d4 <stat+0x34>
    12e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ee:	66 90                	xchg   %ax,%ax

000012f0 <atoi>:

int
atoi(const char *s)
{
    12f0:	55                   	push   %ebp
    12f1:	89 e5                	mov    %esp,%ebp
    12f3:	53                   	push   %ebx
    12f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12f7:	0f be 02             	movsbl (%edx),%eax
    12fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
    12fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1300:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1305:	77 1e                	ja     1325 <atoi+0x35>
    1307:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    130e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1310:	83 c2 01             	add    $0x1,%edx
    1313:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1316:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    131a:	0f be 02             	movsbl (%edx),%eax
    131d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1320:	80 fb 09             	cmp    $0x9,%bl
    1323:	76 eb                	jbe    1310 <atoi+0x20>
  return n;
}
    1325:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1328:	89 c8                	mov    %ecx,%eax
    132a:	c9                   	leave  
    132b:	c3                   	ret    
    132c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	57                   	push   %edi
    1334:	8b 45 10             	mov    0x10(%ebp),%eax
    1337:	8b 55 08             	mov    0x8(%ebp),%edx
    133a:	56                   	push   %esi
    133b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    133e:	85 c0                	test   %eax,%eax
    1340:	7e 13                	jle    1355 <memmove+0x25>
    1342:	01 d0                	add    %edx,%eax
  dst = vdst;
    1344:	89 d7                	mov    %edx,%edi
    1346:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    134d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1350:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1351:	39 f8                	cmp    %edi,%eax
    1353:	75 fb                	jne    1350 <memmove+0x20>
  return vdst;
}
    1355:	5e                   	pop    %esi
    1356:	89 d0                	mov    %edx,%eax
    1358:	5f                   	pop    %edi
    1359:	5d                   	pop    %ebp
    135a:	c3                   	ret    
    135b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    135f:	90                   	nop

00001360 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    1366:	68 00 10 00 00       	push   $0x1000
    136b:	e8 60 04 00 00       	call   17d0 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    1370:	50                   	push   %eax
    1371:	ff 75 10             	push   0x10(%ebp)
    1374:	ff 75 0c             	push   0xc(%ebp)
    1377:	ff 75 08             	push   0x8(%ebp)
    137a:	e8 42 01 00 00       	call   14c1 <clone>
}
    137f:	c9                   	leave  
    1380:	c3                   	ret    
    1381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1388:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    138f:	90                   	nop

00001390 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    1390:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1391:	b9 01 00 00 00       	mov    $0x1,%ecx
    1396:	89 e5                	mov    %esp,%ebp
    1398:	8b 55 08             	mov    0x8(%ebp),%edx
    139b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    139f:	90                   	nop
    13a0:	89 c8                	mov    %ecx,%eax
    13a2:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    13a5:	85 c0                	test   %eax,%eax
    13a7:	75 f7                	jne    13a0 <lock_acquire+0x10>
}
    13a9:	5d                   	pop    %ebp
    13aa:	c3                   	ret    
    13ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13af:	90                   	nop

000013b0 <lock_release>:

void lock_release(lock_thread *lock){
    13b0:	55                   	push   %ebp
    13b1:	31 c0                	xor    %eax,%eax
    13b3:	89 e5                	mov    %esp,%ebp
    13b5:	8b 55 08             	mov    0x8(%ebp),%edx
    13b8:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    13bb:	5d                   	pop    %ebp
    13bc:	c3                   	ret    
    13bd:	8d 76 00             	lea    0x0(%esi),%esi

000013c0 <lock_init>:

int lock_init(lock_thread *lock)
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    13c6:	68 00 19 00 00       	push   $0x1900
    13cb:	6a 01                	push   $0x1
    13cd:	e8 ce 01 00 00       	call   15a0 <printf>
  lock->locked = 0;
    13d2:	8b 45 08             	mov    0x8(%ebp),%eax
    13d5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    13db:	58                   	pop    %eax
    13dc:	5a                   	pop    %edx
    13dd:	68 00 19 00 00       	push   $0x1900
    13e2:	6a 01                	push   $0x1
    13e4:	e8 b7 01 00 00       	call   15a0 <printf>
  return 0;
}
    13e9:	31 c0                	xor    %eax,%eax
    13eb:	c9                   	leave  
    13ec:	c3                   	ret    
    13ed:	8d 76 00             	lea    0x0(%esi),%esi

000013f0 <thread_join>:



int thread_join()
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    13f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
    13f9:	50                   	push   %eax
    13fa:	e8 ca 00 00 00       	call   14c9 <join>
  return a;
    13ff:	c9                   	leave  
    1400:	c3                   	ret    

00001401 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1401:	b8 01 00 00 00       	mov    $0x1,%eax
    1406:	cd 40                	int    $0x40
    1408:	c3                   	ret    

00001409 <exit>:
SYSCALL(exit)
    1409:	b8 02 00 00 00       	mov    $0x2,%eax
    140e:	cd 40                	int    $0x40
    1410:	c3                   	ret    

00001411 <wait>:
SYSCALL(wait)
    1411:	b8 03 00 00 00       	mov    $0x3,%eax
    1416:	cd 40                	int    $0x40
    1418:	c3                   	ret    

00001419 <pipe>:
SYSCALL(pipe)
    1419:	b8 04 00 00 00       	mov    $0x4,%eax
    141e:	cd 40                	int    $0x40
    1420:	c3                   	ret    

00001421 <read>:
SYSCALL(read)
    1421:	b8 05 00 00 00       	mov    $0x5,%eax
    1426:	cd 40                	int    $0x40
    1428:	c3                   	ret    

00001429 <write>:
SYSCALL(write)
    1429:	b8 10 00 00 00       	mov    $0x10,%eax
    142e:	cd 40                	int    $0x40
    1430:	c3                   	ret    

00001431 <close>:
SYSCALL(close)
    1431:	b8 15 00 00 00       	mov    $0x15,%eax
    1436:	cd 40                	int    $0x40
    1438:	c3                   	ret    

00001439 <kill>:
SYSCALL(kill)
    1439:	b8 06 00 00 00       	mov    $0x6,%eax
    143e:	cd 40                	int    $0x40
    1440:	c3                   	ret    

00001441 <exec>:
SYSCALL(exec)
    1441:	b8 07 00 00 00       	mov    $0x7,%eax
    1446:	cd 40                	int    $0x40
    1448:	c3                   	ret    

00001449 <open>:
SYSCALL(open)
    1449:	b8 0f 00 00 00       	mov    $0xf,%eax
    144e:	cd 40                	int    $0x40
    1450:	c3                   	ret    

00001451 <mknod>:
SYSCALL(mknod)
    1451:	b8 11 00 00 00       	mov    $0x11,%eax
    1456:	cd 40                	int    $0x40
    1458:	c3                   	ret    

00001459 <unlink>:
SYSCALL(unlink)
    1459:	b8 12 00 00 00       	mov    $0x12,%eax
    145e:	cd 40                	int    $0x40
    1460:	c3                   	ret    

00001461 <fstat>:
SYSCALL(fstat)
    1461:	b8 08 00 00 00       	mov    $0x8,%eax
    1466:	cd 40                	int    $0x40
    1468:	c3                   	ret    

00001469 <link>:
SYSCALL(link)
    1469:	b8 13 00 00 00       	mov    $0x13,%eax
    146e:	cd 40                	int    $0x40
    1470:	c3                   	ret    

00001471 <mkdir>:
SYSCALL(mkdir)
    1471:	b8 14 00 00 00       	mov    $0x14,%eax
    1476:	cd 40                	int    $0x40
    1478:	c3                   	ret    

00001479 <chdir>:
SYSCALL(chdir)
    1479:	b8 09 00 00 00       	mov    $0x9,%eax
    147e:	cd 40                	int    $0x40
    1480:	c3                   	ret    

00001481 <dup>:
SYSCALL(dup)
    1481:	b8 0a 00 00 00       	mov    $0xa,%eax
    1486:	cd 40                	int    $0x40
    1488:	c3                   	ret    

00001489 <getpid>:
SYSCALL(getpid)
    1489:	b8 0b 00 00 00       	mov    $0xb,%eax
    148e:	cd 40                	int    $0x40
    1490:	c3                   	ret    

00001491 <sbrk>:
SYSCALL(sbrk)
    1491:	b8 0c 00 00 00       	mov    $0xc,%eax
    1496:	cd 40                	int    $0x40
    1498:	c3                   	ret    

00001499 <sleep>:
SYSCALL(sleep)
    1499:	b8 0d 00 00 00       	mov    $0xd,%eax
    149e:	cd 40                	int    $0x40
    14a0:	c3                   	ret    

000014a1 <uptime>:
SYSCALL(uptime)
    14a1:	b8 0e 00 00 00       	mov    $0xe,%eax
    14a6:	cd 40                	int    $0x40
    14a8:	c3                   	ret    

000014a9 <getreadcount>:
SYSCALL(getreadcount)
    14a9:	b8 16 00 00 00       	mov    $0x16,%eax
    14ae:	cd 40                	int    $0x40
    14b0:	c3                   	ret    

000014b1 <settickets>:
SYSCALL(settickets)
    14b1:	b8 17 00 00 00       	mov    $0x17,%eax
    14b6:	cd 40                	int    $0x40
    14b8:	c3                   	ret    

000014b9 <getpinfo>:
SYSCALL(getpinfo)
    14b9:	b8 18 00 00 00       	mov    $0x18,%eax
    14be:	cd 40                	int    $0x40
    14c0:	c3                   	ret    

000014c1 <clone>:
SYSCALL(clone)
    14c1:	b8 19 00 00 00       	mov    $0x19,%eax
    14c6:	cd 40                	int    $0x40
    14c8:	c3                   	ret    

000014c9 <join>:
SYSCALL(join)
    14c9:	b8 1a 00 00 00       	mov    $0x1a,%eax
    14ce:	cd 40                	int    $0x40
    14d0:	c3                   	ret    

000014d1 <mprotect>:
SYSCALL(mprotect)
    14d1:	b8 1b 00 00 00       	mov    $0x1b,%eax
    14d6:	cd 40                	int    $0x40
    14d8:	c3                   	ret    

000014d9 <munprotect>:
SYSCALL(munprotect)
    14d9:	b8 1c 00 00 00       	mov    $0x1c,%eax
    14de:	cd 40                	int    $0x40
    14e0:	c3                   	ret    
    14e1:	66 90                	xchg   %ax,%ax
    14e3:	66 90                	xchg   %ax,%ax
    14e5:	66 90                	xchg   %ax,%ax
    14e7:	66 90                	xchg   %ax,%ax
    14e9:	66 90                	xchg   %ax,%ax
    14eb:	66 90                	xchg   %ax,%ax
    14ed:	66 90                	xchg   %ax,%ax
    14ef:	90                   	nop

000014f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    14f0:	55                   	push   %ebp
    14f1:	89 e5                	mov    %esp,%ebp
    14f3:	57                   	push   %edi
    14f4:	56                   	push   %esi
    14f5:	53                   	push   %ebx
    14f6:	83 ec 3c             	sub    $0x3c,%esp
    14f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    14fc:	89 d1                	mov    %edx,%ecx
{
    14fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1501:	85 d2                	test   %edx,%edx
    1503:	0f 89 7f 00 00 00    	jns    1588 <printint+0x98>
    1509:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    150d:	74 79                	je     1588 <printint+0x98>
    neg = 1;
    150f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1516:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1518:	31 db                	xor    %ebx,%ebx
    151a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    151d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1520:	89 c8                	mov    %ecx,%eax
    1522:	31 d2                	xor    %edx,%edx
    1524:	89 cf                	mov    %ecx,%edi
    1526:	f7 75 c4             	divl   -0x3c(%ebp)
    1529:	0f b6 92 64 19 00 00 	movzbl 0x1964(%edx),%edx
    1530:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1533:	89 d8                	mov    %ebx,%eax
    1535:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1538:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    153b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    153e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1541:	76 dd                	jbe    1520 <printint+0x30>
  if(neg)
    1543:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1546:	85 c9                	test   %ecx,%ecx
    1548:	74 0c                	je     1556 <printint+0x66>
    buf[i++] = '-';
    154a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    154f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1551:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1556:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1559:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    155d:	eb 07                	jmp    1566 <printint+0x76>
    155f:	90                   	nop
    putc(fd, buf[i]);
    1560:	0f b6 13             	movzbl (%ebx),%edx
    1563:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1566:	83 ec 04             	sub    $0x4,%esp
    1569:	88 55 d7             	mov    %dl,-0x29(%ebp)
    156c:	6a 01                	push   $0x1
    156e:	56                   	push   %esi
    156f:	57                   	push   %edi
    1570:	e8 b4 fe ff ff       	call   1429 <write>
  while(--i >= 0)
    1575:	83 c4 10             	add    $0x10,%esp
    1578:	39 de                	cmp    %ebx,%esi
    157a:	75 e4                	jne    1560 <printint+0x70>
}
    157c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    157f:	5b                   	pop    %ebx
    1580:	5e                   	pop    %esi
    1581:	5f                   	pop    %edi
    1582:	5d                   	pop    %ebp
    1583:	c3                   	ret    
    1584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1588:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    158f:	eb 87                	jmp    1518 <printint+0x28>
    1591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1598:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    159f:	90                   	nop

000015a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    15a0:	55                   	push   %ebp
    15a1:	89 e5                	mov    %esp,%ebp
    15a3:	57                   	push   %edi
    15a4:	56                   	push   %esi
    15a5:	53                   	push   %ebx
    15a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    15ac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    15af:	0f b6 13             	movzbl (%ebx),%edx
    15b2:	84 d2                	test   %dl,%dl
    15b4:	74 6a                	je     1620 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    15b6:	8d 45 10             	lea    0x10(%ebp),%eax
    15b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    15bc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    15bf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    15c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15c4:	eb 36                	jmp    15fc <printf+0x5c>
    15c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15cd:	8d 76 00             	lea    0x0(%esi),%esi
    15d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    15d3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    15d8:	83 f8 25             	cmp    $0x25,%eax
    15db:	74 15                	je     15f2 <printf+0x52>
  write(fd, &c, 1);
    15dd:	83 ec 04             	sub    $0x4,%esp
    15e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
    15e3:	6a 01                	push   $0x1
    15e5:	57                   	push   %edi
    15e6:	56                   	push   %esi
    15e7:	e8 3d fe ff ff       	call   1429 <write>
    15ec:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    15ef:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    15f2:	0f b6 13             	movzbl (%ebx),%edx
    15f5:	83 c3 01             	add    $0x1,%ebx
    15f8:	84 d2                	test   %dl,%dl
    15fa:	74 24                	je     1620 <printf+0x80>
    c = fmt[i] & 0xff;
    15fc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    15ff:	85 c9                	test   %ecx,%ecx
    1601:	74 cd                	je     15d0 <printf+0x30>
      }
    } else if(state == '%'){
    1603:	83 f9 25             	cmp    $0x25,%ecx
    1606:	75 ea                	jne    15f2 <printf+0x52>
      if(c == 'd'){
    1608:	83 f8 25             	cmp    $0x25,%eax
    160b:	0f 84 07 01 00 00    	je     1718 <printf+0x178>
    1611:	83 e8 63             	sub    $0x63,%eax
    1614:	83 f8 15             	cmp    $0x15,%eax
    1617:	77 17                	ja     1630 <printf+0x90>
    1619:	ff 24 85 0c 19 00 00 	jmp    *0x190c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1620:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1623:	5b                   	pop    %ebx
    1624:	5e                   	pop    %esi
    1625:	5f                   	pop    %edi
    1626:	5d                   	pop    %ebp
    1627:	c3                   	ret    
    1628:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    162f:	90                   	nop
  write(fd, &c, 1);
    1630:	83 ec 04             	sub    $0x4,%esp
    1633:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1636:	6a 01                	push   $0x1
    1638:	57                   	push   %edi
    1639:	56                   	push   %esi
    163a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    163e:	e8 e6 fd ff ff       	call   1429 <write>
        putc(fd, c);
    1643:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1647:	83 c4 0c             	add    $0xc,%esp
    164a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    164d:	6a 01                	push   $0x1
    164f:	57                   	push   %edi
    1650:	56                   	push   %esi
    1651:	e8 d3 fd ff ff       	call   1429 <write>
        putc(fd, c);
    1656:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1659:	31 c9                	xor    %ecx,%ecx
    165b:	eb 95                	jmp    15f2 <printf+0x52>
    165d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1660:	83 ec 0c             	sub    $0xc,%esp
    1663:	b9 10 00 00 00       	mov    $0x10,%ecx
    1668:	6a 00                	push   $0x0
    166a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    166d:	8b 10                	mov    (%eax),%edx
    166f:	89 f0                	mov    %esi,%eax
    1671:	e8 7a fe ff ff       	call   14f0 <printint>
        ap++;
    1676:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    167a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    167d:	31 c9                	xor    %ecx,%ecx
    167f:	e9 6e ff ff ff       	jmp    15f2 <printf+0x52>
    1684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1688:	8b 45 d0             	mov    -0x30(%ebp),%eax
    168b:	8b 10                	mov    (%eax),%edx
        ap++;
    168d:	83 c0 04             	add    $0x4,%eax
    1690:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1693:	85 d2                	test   %edx,%edx
    1695:	0f 84 8d 00 00 00    	je     1728 <printf+0x188>
        while(*s != 0){
    169b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    169e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    16a0:	84 c0                	test   %al,%al
    16a2:	0f 84 4a ff ff ff    	je     15f2 <printf+0x52>
    16a8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    16ab:	89 d3                	mov    %edx,%ebx
    16ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    16b0:	83 ec 04             	sub    $0x4,%esp
          s++;
    16b3:	83 c3 01             	add    $0x1,%ebx
    16b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    16b9:	6a 01                	push   $0x1
    16bb:	57                   	push   %edi
    16bc:	56                   	push   %esi
    16bd:	e8 67 fd ff ff       	call   1429 <write>
        while(*s != 0){
    16c2:	0f b6 03             	movzbl (%ebx),%eax
    16c5:	83 c4 10             	add    $0x10,%esp
    16c8:	84 c0                	test   %al,%al
    16ca:	75 e4                	jne    16b0 <printf+0x110>
      state = 0;
    16cc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    16cf:	31 c9                	xor    %ecx,%ecx
    16d1:	e9 1c ff ff ff       	jmp    15f2 <printf+0x52>
    16d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    16e0:	83 ec 0c             	sub    $0xc,%esp
    16e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    16e8:	6a 01                	push   $0x1
    16ea:	e9 7b ff ff ff       	jmp    166a <printf+0xca>
    16ef:	90                   	nop
        putc(fd, *ap);
    16f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    16f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    16f6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    16f8:	6a 01                	push   $0x1
    16fa:	57                   	push   %edi
    16fb:	56                   	push   %esi
        putc(fd, *ap);
    16fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    16ff:	e8 25 fd ff ff       	call   1429 <write>
        ap++;
    1704:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1708:	83 c4 10             	add    $0x10,%esp
      state = 0;
    170b:	31 c9                	xor    %ecx,%ecx
    170d:	e9 e0 fe ff ff       	jmp    15f2 <printf+0x52>
    1712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1718:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    171b:	83 ec 04             	sub    $0x4,%esp
    171e:	e9 2a ff ff ff       	jmp    164d <printf+0xad>
    1723:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1727:	90                   	nop
          s = "(null)";
    1728:	ba 03 19 00 00       	mov    $0x1903,%edx
        while(*s != 0){
    172d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1730:	b8 28 00 00 00       	mov    $0x28,%eax
    1735:	89 d3                	mov    %edx,%ebx
    1737:	e9 74 ff ff ff       	jmp    16b0 <printf+0x110>
    173c:	66 90                	xchg   %ax,%ax
    173e:	66 90                	xchg   %ax,%ax

00001740 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1740:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1741:	a1 00 1f 00 00       	mov    0x1f00,%eax
{
    1746:	89 e5                	mov    %esp,%ebp
    1748:	57                   	push   %edi
    1749:	56                   	push   %esi
    174a:	53                   	push   %ebx
    174b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    174e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1758:	89 c2                	mov    %eax,%edx
    175a:	8b 00                	mov    (%eax),%eax
    175c:	39 ca                	cmp    %ecx,%edx
    175e:	73 30                	jae    1790 <free+0x50>
    1760:	39 c1                	cmp    %eax,%ecx
    1762:	72 04                	jb     1768 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1764:	39 c2                	cmp    %eax,%edx
    1766:	72 f0                	jb     1758 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1768:	8b 73 fc             	mov    -0x4(%ebx),%esi
    176b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    176e:	39 f8                	cmp    %edi,%eax
    1770:	74 30                	je     17a2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1772:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1775:	8b 42 04             	mov    0x4(%edx),%eax
    1778:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    177b:	39 f1                	cmp    %esi,%ecx
    177d:	74 3a                	je     17b9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    177f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1781:	5b                   	pop    %ebx
  freep = p;
    1782:	89 15 00 1f 00 00    	mov    %edx,0x1f00
}
    1788:	5e                   	pop    %esi
    1789:	5f                   	pop    %edi
    178a:	5d                   	pop    %ebp
    178b:	c3                   	ret    
    178c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1790:	39 c2                	cmp    %eax,%edx
    1792:	72 c4                	jb     1758 <free+0x18>
    1794:	39 c1                	cmp    %eax,%ecx
    1796:	73 c0                	jae    1758 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1798:	8b 73 fc             	mov    -0x4(%ebx),%esi
    179b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    179e:	39 f8                	cmp    %edi,%eax
    17a0:	75 d0                	jne    1772 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    17a2:	03 70 04             	add    0x4(%eax),%esi
    17a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    17a8:	8b 02                	mov    (%edx),%eax
    17aa:	8b 00                	mov    (%eax),%eax
    17ac:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    17af:	8b 42 04             	mov    0x4(%edx),%eax
    17b2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    17b5:	39 f1                	cmp    %esi,%ecx
    17b7:	75 c6                	jne    177f <free+0x3f>
    p->s.size += bp->s.size;
    17b9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    17bc:	89 15 00 1f 00 00    	mov    %edx,0x1f00
    p->s.size += bp->s.size;
    17c2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    17c5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    17c8:	89 0a                	mov    %ecx,(%edx)
}
    17ca:	5b                   	pop    %ebx
    17cb:	5e                   	pop    %esi
    17cc:	5f                   	pop    %edi
    17cd:	5d                   	pop    %ebp
    17ce:	c3                   	ret    
    17cf:	90                   	nop

000017d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    17d0:	55                   	push   %ebp
    17d1:	89 e5                	mov    %esp,%ebp
    17d3:	57                   	push   %edi
    17d4:	56                   	push   %esi
    17d5:	53                   	push   %ebx
    17d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    17dc:	8b 3d 00 1f 00 00    	mov    0x1f00,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17e2:	8d 70 07             	lea    0x7(%eax),%esi
    17e5:	c1 ee 03             	shr    $0x3,%esi
    17e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    17eb:	85 ff                	test   %edi,%edi
    17ed:	0f 84 9d 00 00 00    	je     1890 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    17f5:	8b 4a 04             	mov    0x4(%edx),%ecx
    17f8:	39 f1                	cmp    %esi,%ecx
    17fa:	73 6a                	jae    1866 <malloc+0x96>
    17fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1801:	39 de                	cmp    %ebx,%esi
    1803:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1806:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    180d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1810:	eb 17                	jmp    1829 <malloc+0x59>
    1812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1818:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    181a:	8b 48 04             	mov    0x4(%eax),%ecx
    181d:	39 f1                	cmp    %esi,%ecx
    181f:	73 4f                	jae    1870 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1821:	8b 3d 00 1f 00 00    	mov    0x1f00,%edi
    1827:	89 c2                	mov    %eax,%edx
    1829:	39 d7                	cmp    %edx,%edi
    182b:	75 eb                	jne    1818 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    182d:	83 ec 0c             	sub    $0xc,%esp
    1830:	ff 75 e4             	push   -0x1c(%ebp)
    1833:	e8 59 fc ff ff       	call   1491 <sbrk>
  if(p == (char*)-1)
    1838:	83 c4 10             	add    $0x10,%esp
    183b:	83 f8 ff             	cmp    $0xffffffff,%eax
    183e:	74 1c                	je     185c <malloc+0x8c>
  hp->s.size = nu;
    1840:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1843:	83 ec 0c             	sub    $0xc,%esp
    1846:	83 c0 08             	add    $0x8,%eax
    1849:	50                   	push   %eax
    184a:	e8 f1 fe ff ff       	call   1740 <free>
  return freep;
    184f:	8b 15 00 1f 00 00    	mov    0x1f00,%edx
      if((p = morecore(nunits)) == 0)
    1855:	83 c4 10             	add    $0x10,%esp
    1858:	85 d2                	test   %edx,%edx
    185a:	75 bc                	jne    1818 <malloc+0x48>
        return 0;
  }
}
    185c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    185f:	31 c0                	xor    %eax,%eax
}
    1861:	5b                   	pop    %ebx
    1862:	5e                   	pop    %esi
    1863:	5f                   	pop    %edi
    1864:	5d                   	pop    %ebp
    1865:	c3                   	ret    
    if(p->s.size >= nunits){
    1866:	89 d0                	mov    %edx,%eax
    1868:	89 fa                	mov    %edi,%edx
    186a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1870:	39 ce                	cmp    %ecx,%esi
    1872:	74 4c                	je     18c0 <malloc+0xf0>
        p->s.size -= nunits;
    1874:	29 f1                	sub    %esi,%ecx
    1876:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1879:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    187c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    187f:	89 15 00 1f 00 00    	mov    %edx,0x1f00
}
    1885:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1888:	83 c0 08             	add    $0x8,%eax
}
    188b:	5b                   	pop    %ebx
    188c:	5e                   	pop    %esi
    188d:	5f                   	pop    %edi
    188e:	5d                   	pop    %ebp
    188f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1890:	c7 05 00 1f 00 00 04 	movl   $0x1f04,0x1f00
    1897:	1f 00 00 
    base.s.size = 0;
    189a:	bf 04 1f 00 00       	mov    $0x1f04,%edi
    base.s.ptr = freep = prevp = &base;
    189f:	c7 05 04 1f 00 00 04 	movl   $0x1f04,0x1f04
    18a6:	1f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18a9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    18ab:	c7 05 08 1f 00 00 00 	movl   $0x0,0x1f08
    18b2:	00 00 00 
    if(p->s.size >= nunits){
    18b5:	e9 42 ff ff ff       	jmp    17fc <malloc+0x2c>
    18ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    18c0:	8b 08                	mov    (%eax),%ecx
    18c2:	89 0a                	mov    %ecx,(%edx)
    18c4:	eb b9                	jmp    187f <malloc+0xaf>
