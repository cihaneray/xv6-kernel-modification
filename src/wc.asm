
_wc:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
    1027:	7e 56                	jle    107f <main+0x7f>
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	6a 00                	push   $0x0
    1035:	ff 33                	push   (%ebx)
    1037:	e8 7d 04 00 00       	call   14b9 <open>
    103c:	83 c4 10             	add    $0x10,%esp
    103f:	89 c7                	mov    %eax,%edi
    1041:	85 c0                	test   %eax,%eax
    1043:	78 26                	js     106b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
    1045:	83 ec 08             	sub    $0x8,%esp
    1048:	ff 33                	push   (%ebx)
  for(i = 1; i < argc; i++){
    104a:	83 c6 01             	add    $0x1,%esi
    104d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
    1050:	50                   	push   %eax
    1051:	e8 4a 00 00 00       	call   10a0 <wc>
    close(fd);
    1056:	89 3c 24             	mov    %edi,(%esp)
    1059:	e8 43 04 00 00       	call   14a1 <close>
  for(i = 1; i < argc; i++){
    105e:	83 c4 10             	add    $0x10,%esp
    1061:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1064:	75 ca                	jne    1030 <main+0x30>
  }
  exit();
    1066:	e8 0e 04 00 00       	call   1479 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
    106b:	50                   	push   %eax
    106c:	ff 33                	push   (%ebx)
    106e:	68 5b 19 00 00       	push   $0x195b
    1073:	6a 01                	push   $0x1
    1075:	e8 96 05 00 00       	call   1610 <printf>
      exit();
    107a:	e8 fa 03 00 00       	call   1479 <exit>
    wc(0, "");
    107f:	52                   	push   %edx
    1080:	52                   	push   %edx
    1081:	68 4d 19 00 00       	push   $0x194d
    1086:	6a 00                	push   $0x0
    1088:	e8 13 00 00 00       	call   10a0 <wc>
    exit();
    108d:	e8 e7 03 00 00       	call   1479 <exit>
    1092:	66 90                	xchg   %ax,%ax
    1094:	66 90                	xchg   %ax,%ax
    1096:	66 90                	xchg   %ax,%ax
    1098:	66 90                	xchg   %ax,%ax
    109a:	66 90                	xchg   %ax,%ax
    109c:	66 90                	xchg   %ax,%ax
    109e:	66 90                	xchg   %ax,%ax

000010a0 <wc>:
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	57                   	push   %edi
    10a4:	56                   	push   %esi
    10a5:	53                   	push   %ebx
  l = w = c = 0;
    10a6:	31 db                	xor    %ebx,%ebx
{
    10a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
    10ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
    10b2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    10b9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
    10c0:	83 ec 04             	sub    $0x4,%esp
    10c3:	68 00 02 00 00       	push   $0x200
    10c8:	68 60 1d 00 00       	push   $0x1d60
    10cd:	ff 75 08             	push   0x8(%ebp)
    10d0:	e8 bc 03 00 00       	call   1491 <read>
    10d5:	83 c4 10             	add    $0x10,%esp
    10d8:	89 c6                	mov    %eax,%esi
    10da:	85 c0                	test   %eax,%eax
    10dc:	7e 62                	jle    1140 <wc+0xa0>
    for(i=0; i<n; i++){
    10de:	31 ff                	xor    %edi,%edi
    10e0:	eb 14                	jmp    10f6 <wc+0x56>
    10e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
    10e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
    10ef:	83 c7 01             	add    $0x1,%edi
    10f2:	39 fe                	cmp    %edi,%esi
    10f4:	74 42                	je     1138 <wc+0x98>
      if(buf[i] == '\n')
    10f6:	0f be 87 60 1d 00 00 	movsbl 0x1d60(%edi),%eax
        l++;
    10fd:	31 c9                	xor    %ecx,%ecx
    10ff:	3c 0a                	cmp    $0xa,%al
    1101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
    1104:	83 ec 08             	sub    $0x8,%esp
    1107:	50                   	push   %eax
        l++;
    1108:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
    110a:	68 38 19 00 00       	push   $0x1938
    110f:	e8 4c 01 00 00       	call   1260 <strchr>
    1114:	83 c4 10             	add    $0x10,%esp
    1117:	85 c0                	test   %eax,%eax
    1119:	75 cd                	jne    10e8 <wc+0x48>
      else if(!inword){
    111b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    111e:	85 d2                	test   %edx,%edx
    1120:	75 cd                	jne    10ef <wc+0x4f>
    for(i=0; i<n; i++){
    1122:	83 c7 01             	add    $0x1,%edi
        w++;
    1125:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
    1129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
    1130:	39 fe                	cmp    %edi,%esi
    1132:	75 c2                	jne    10f6 <wc+0x56>
    1134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      c++;
    1138:	01 75 dc             	add    %esi,-0x24(%ebp)
    113b:	eb 83                	jmp    10c0 <wc+0x20>
    113d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
    1140:	75 24                	jne    1166 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
    1142:	83 ec 08             	sub    $0x8,%esp
    1145:	ff 75 0c             	push   0xc(%ebp)
    1148:	ff 75 dc             	push   -0x24(%ebp)
    114b:	ff 75 e0             	push   -0x20(%ebp)
    114e:	53                   	push   %ebx
    114f:	68 4e 19 00 00       	push   $0x194e
    1154:	6a 01                	push   $0x1
    1156:	e8 b5 04 00 00       	call   1610 <printf>
}
    115b:	83 c4 20             	add    $0x20,%esp
    115e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1161:	5b                   	pop    %ebx
    1162:	5e                   	pop    %esi
    1163:	5f                   	pop    %edi
    1164:	5d                   	pop    %ebp
    1165:	c3                   	ret    
    printf(1, "wc: read error\n");
    1166:	50                   	push   %eax
    1167:	50                   	push   %eax
    1168:	68 3e 19 00 00       	push   $0x193e
    116d:	6a 01                	push   $0x1
    116f:	e8 9c 04 00 00       	call   1610 <printf>
    exit();
    1174:	e8 00 03 00 00       	call   1479 <exit>
    1179:	66 90                	xchg   %ax,%ax
    117b:	66 90                	xchg   %ax,%ax
    117d:	66 90                	xchg   %ax,%ax
    117f:	90                   	nop

00001180 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    1180:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1181:	31 c0                	xor    %eax,%eax
{
    1183:	89 e5                	mov    %esp,%ebp
    1185:	53                   	push   %ebx
    1186:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1197:	83 c0 01             	add    $0x1,%eax
    119a:	84 d2                	test   %dl,%dl
    119c:	75 f2                	jne    1190 <strcpy+0x10>
    ;
  return os;
}
    119e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11a1:	89 c8                	mov    %ecx,%eax
    11a3:	c9                   	leave  
    11a4:	c3                   	ret    
    11a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	53                   	push   %ebx
    11b4:	8b 55 08             	mov    0x8(%ebp),%edx
    11b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    11ba:	0f b6 02             	movzbl (%edx),%eax
    11bd:	84 c0                	test   %al,%al
    11bf:	75 17                	jne    11d8 <strcmp+0x28>
    11c1:	eb 3a                	jmp    11fd <strcmp+0x4d>
    11c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11c7:	90                   	nop
    11c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    11cc:	83 c2 01             	add    $0x1,%edx
    11cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    11d2:	84 c0                	test   %al,%al
    11d4:	74 1a                	je     11f0 <strcmp+0x40>
    p++, q++;
    11d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    11d8:	0f b6 19             	movzbl (%ecx),%ebx
    11db:	38 c3                	cmp    %al,%bl
    11dd:	74 e9                	je     11c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    11df:	29 d8                	sub    %ebx,%eax
}
    11e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11e4:	c9                   	leave  
    11e5:	c3                   	ret    
    11e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    11f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    11f4:	31 c0                	xor    %eax,%eax
    11f6:	29 d8                	sub    %ebx,%eax
}
    11f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11fb:	c9                   	leave  
    11fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    11fd:	0f b6 19             	movzbl (%ecx),%ebx
    1200:	31 c0                	xor    %eax,%eax
    1202:	eb db                	jmp    11df <strcmp+0x2f>
    1204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    120f:	90                   	nop

00001210 <strlen>:

uint
strlen(const char *s)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1216:	80 3a 00             	cmpb   $0x0,(%edx)
    1219:	74 15                	je     1230 <strlen+0x20>
    121b:	31 c0                	xor    %eax,%eax
    121d:	8d 76 00             	lea    0x0(%esi),%esi
    1220:	83 c0 01             	add    $0x1,%eax
    1223:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1227:	89 c1                	mov    %eax,%ecx
    1229:	75 f5                	jne    1220 <strlen+0x10>
    ;
  return n;
}
    122b:	89 c8                	mov    %ecx,%eax
    122d:	5d                   	pop    %ebp
    122e:	c3                   	ret    
    122f:	90                   	nop
  for(n = 0; s[n]; n++)
    1230:	31 c9                	xor    %ecx,%ecx
}
    1232:	5d                   	pop    %ebp
    1233:	89 c8                	mov    %ecx,%eax
    1235:	c3                   	ret    
    1236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    123d:	8d 76 00             	lea    0x0(%esi),%esi

00001240 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	57                   	push   %edi
    1244:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1247:	8b 4d 10             	mov    0x10(%ebp),%ecx
    124a:	8b 45 0c             	mov    0xc(%ebp),%eax
    124d:	89 d7                	mov    %edx,%edi
    124f:	fc                   	cld    
    1250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1252:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1255:	89 d0                	mov    %edx,%eax
    1257:	c9                   	leave  
    1258:	c3                   	ret    
    1259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001260 <strchr>:

char*
strchr(const char *s, char c)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	8b 45 08             	mov    0x8(%ebp),%eax
    1266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    126a:	0f b6 10             	movzbl (%eax),%edx
    126d:	84 d2                	test   %dl,%dl
    126f:	75 12                	jne    1283 <strchr+0x23>
    1271:	eb 1d                	jmp    1290 <strchr+0x30>
    1273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1277:	90                   	nop
    1278:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    127c:	83 c0 01             	add    $0x1,%eax
    127f:	84 d2                	test   %dl,%dl
    1281:	74 0d                	je     1290 <strchr+0x30>
    if(*s == c)
    1283:	38 d1                	cmp    %dl,%cl
    1285:	75 f1                	jne    1278 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1287:	5d                   	pop    %ebp
    1288:	c3                   	ret    
    1289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1290:	31 c0                	xor    %eax,%eax
}
    1292:	5d                   	pop    %ebp
    1293:	c3                   	ret    
    1294:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    129b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    129f:	90                   	nop

000012a0 <gets>:

char*
gets(char *buf, int max)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	57                   	push   %edi
    12a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    12a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    12a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    12a9:	31 db                	xor    %ebx,%ebx
{
    12ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    12ae:	eb 27                	jmp    12d7 <gets+0x37>
    cc = read(0, &c, 1);
    12b0:	83 ec 04             	sub    $0x4,%esp
    12b3:	6a 01                	push   $0x1
    12b5:	57                   	push   %edi
    12b6:	6a 00                	push   $0x0
    12b8:	e8 d4 01 00 00       	call   1491 <read>
    if(cc < 1)
    12bd:	83 c4 10             	add    $0x10,%esp
    12c0:	85 c0                	test   %eax,%eax
    12c2:	7e 1d                	jle    12e1 <gets+0x41>
      break;
    buf[i++] = c;
    12c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    12c8:	8b 55 08             	mov    0x8(%ebp),%edx
    12cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    12cf:	3c 0a                	cmp    $0xa,%al
    12d1:	74 1d                	je     12f0 <gets+0x50>
    12d3:	3c 0d                	cmp    $0xd,%al
    12d5:	74 19                	je     12f0 <gets+0x50>
  for(i=0; i+1 < max; ){
    12d7:	89 de                	mov    %ebx,%esi
    12d9:	83 c3 01             	add    $0x1,%ebx
    12dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    12df:	7c cf                	jl     12b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    12e1:	8b 45 08             	mov    0x8(%ebp),%eax
    12e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    12e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12eb:	5b                   	pop    %ebx
    12ec:	5e                   	pop    %esi
    12ed:	5f                   	pop    %edi
    12ee:	5d                   	pop    %ebp
    12ef:	c3                   	ret    
  buf[i] = '\0';
    12f0:	8b 45 08             	mov    0x8(%ebp),%eax
    12f3:	89 de                	mov    %ebx,%esi
    12f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    12f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12fc:	5b                   	pop    %ebx
    12fd:	5e                   	pop    %esi
    12fe:	5f                   	pop    %edi
    12ff:	5d                   	pop    %ebp
    1300:	c3                   	ret    
    1301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    130f:	90                   	nop

00001310 <stat>:

int
stat(const char *n, struct stat *st)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	56                   	push   %esi
    1314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1315:	83 ec 08             	sub    $0x8,%esp
    1318:	6a 00                	push   $0x0
    131a:	ff 75 08             	push   0x8(%ebp)
    131d:	e8 97 01 00 00       	call   14b9 <open>
  if(fd < 0)
    1322:	83 c4 10             	add    $0x10,%esp
    1325:	85 c0                	test   %eax,%eax
    1327:	78 27                	js     1350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1329:	83 ec 08             	sub    $0x8,%esp
    132c:	ff 75 0c             	push   0xc(%ebp)
    132f:	89 c3                	mov    %eax,%ebx
    1331:	50                   	push   %eax
    1332:	e8 9a 01 00 00       	call   14d1 <fstat>
  close(fd);
    1337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    133a:	89 c6                	mov    %eax,%esi
  close(fd);
    133c:	e8 60 01 00 00       	call   14a1 <close>
  return r;
    1341:	83 c4 10             	add    $0x10,%esp
}
    1344:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1347:	89 f0                	mov    %esi,%eax
    1349:	5b                   	pop    %ebx
    134a:	5e                   	pop    %esi
    134b:	5d                   	pop    %ebp
    134c:	c3                   	ret    
    134d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1350:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1355:	eb ed                	jmp    1344 <stat+0x34>
    1357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    135e:	66 90                	xchg   %ax,%ax

00001360 <atoi>:

int
atoi(const char *s)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	53                   	push   %ebx
    1364:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1367:	0f be 02             	movsbl (%edx),%eax
    136a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    136d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1370:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1375:	77 1e                	ja     1395 <atoi+0x35>
    1377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    137e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1380:	83 c2 01             	add    $0x1,%edx
    1383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    138a:	0f be 02             	movsbl (%edx),%eax
    138d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1390:	80 fb 09             	cmp    $0x9,%bl
    1393:	76 eb                	jbe    1380 <atoi+0x20>
  return n;
}
    1395:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1398:	89 c8                	mov    %ecx,%eax
    139a:	c9                   	leave  
    139b:	c3                   	ret    
    139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	57                   	push   %edi
    13a4:	8b 45 10             	mov    0x10(%ebp),%eax
    13a7:	8b 55 08             	mov    0x8(%ebp),%edx
    13aa:	56                   	push   %esi
    13ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    13ae:	85 c0                	test   %eax,%eax
    13b0:	7e 13                	jle    13c5 <memmove+0x25>
    13b2:	01 d0                	add    %edx,%eax
  dst = vdst;
    13b4:	89 d7                	mov    %edx,%edi
    13b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    13c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    13c1:	39 f8                	cmp    %edi,%eax
    13c3:	75 fb                	jne    13c0 <memmove+0x20>
  return vdst;
}
    13c5:	5e                   	pop    %esi
    13c6:	89 d0                	mov    %edx,%eax
    13c8:	5f                   	pop    %edi
    13c9:	5d                   	pop    %ebp
    13ca:	c3                   	ret    
    13cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13cf:	90                   	nop

000013d0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    13d3:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    13d6:	68 00 10 00 00       	push   $0x1000
    13db:	e8 60 04 00 00       	call   1840 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    13e0:	50                   	push   %eax
    13e1:	ff 75 10             	push   0x10(%ebp)
    13e4:	ff 75 0c             	push   0xc(%ebp)
    13e7:	ff 75 08             	push   0x8(%ebp)
    13ea:	e8 42 01 00 00       	call   1531 <clone>
}
    13ef:	c9                   	leave  
    13f0:	c3                   	ret    
    13f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ff:	90                   	nop

00001400 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    1400:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1401:	b9 01 00 00 00       	mov    $0x1,%ecx
    1406:	89 e5                	mov    %esp,%ebp
    1408:	8b 55 08             	mov    0x8(%ebp),%edx
    140b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    140f:	90                   	nop
    1410:	89 c8                	mov    %ecx,%eax
    1412:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    1415:	85 c0                	test   %eax,%eax
    1417:	75 f7                	jne    1410 <lock_acquire+0x10>
}
    1419:	5d                   	pop    %ebp
    141a:	c3                   	ret    
    141b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    141f:	90                   	nop

00001420 <lock_release>:

void lock_release(lock_thread *lock){
    1420:	55                   	push   %ebp
    1421:	31 c0                	xor    %eax,%eax
    1423:	89 e5                	mov    %esp,%ebp
    1425:	8b 55 08             	mov    0x8(%ebp),%edx
    1428:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    142b:	5d                   	pop    %ebp
    142c:	c3                   	ret    
    142d:	8d 76 00             	lea    0x0(%esi),%esi

00001430 <lock_init>:

int lock_init(lock_thread *lock)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    1436:	68 6f 19 00 00       	push   $0x196f
    143b:	6a 01                	push   $0x1
    143d:	e8 ce 01 00 00       	call   1610 <printf>
  lock->locked = 0;
    1442:	8b 45 08             	mov    0x8(%ebp),%eax
    1445:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    144b:	58                   	pop    %eax
    144c:	5a                   	pop    %edx
    144d:	68 6f 19 00 00       	push   $0x196f
    1452:	6a 01                	push   $0x1
    1454:	e8 b7 01 00 00       	call   1610 <printf>
  return 0;
}
    1459:	31 c0                	xor    %eax,%eax
    145b:	c9                   	leave  
    145c:	c3                   	ret    
    145d:	8d 76 00             	lea    0x0(%esi),%esi

00001460 <thread_join>:



int thread_join()
{
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    1466:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1469:	50                   	push   %eax
    146a:	e8 ca 00 00 00       	call   1539 <join>
  return a;
    146f:	c9                   	leave  
    1470:	c3                   	ret    

00001471 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1471:	b8 01 00 00 00       	mov    $0x1,%eax
    1476:	cd 40                	int    $0x40
    1478:	c3                   	ret    

00001479 <exit>:
SYSCALL(exit)
    1479:	b8 02 00 00 00       	mov    $0x2,%eax
    147e:	cd 40                	int    $0x40
    1480:	c3                   	ret    

00001481 <wait>:
SYSCALL(wait)
    1481:	b8 03 00 00 00       	mov    $0x3,%eax
    1486:	cd 40                	int    $0x40
    1488:	c3                   	ret    

00001489 <pipe>:
SYSCALL(pipe)
    1489:	b8 04 00 00 00       	mov    $0x4,%eax
    148e:	cd 40                	int    $0x40
    1490:	c3                   	ret    

00001491 <read>:
SYSCALL(read)
    1491:	b8 05 00 00 00       	mov    $0x5,%eax
    1496:	cd 40                	int    $0x40
    1498:	c3                   	ret    

00001499 <write>:
SYSCALL(write)
    1499:	b8 10 00 00 00       	mov    $0x10,%eax
    149e:	cd 40                	int    $0x40
    14a0:	c3                   	ret    

000014a1 <close>:
SYSCALL(close)
    14a1:	b8 15 00 00 00       	mov    $0x15,%eax
    14a6:	cd 40                	int    $0x40
    14a8:	c3                   	ret    

000014a9 <kill>:
SYSCALL(kill)
    14a9:	b8 06 00 00 00       	mov    $0x6,%eax
    14ae:	cd 40                	int    $0x40
    14b0:	c3                   	ret    

000014b1 <exec>:
SYSCALL(exec)
    14b1:	b8 07 00 00 00       	mov    $0x7,%eax
    14b6:	cd 40                	int    $0x40
    14b8:	c3                   	ret    

000014b9 <open>:
SYSCALL(open)
    14b9:	b8 0f 00 00 00       	mov    $0xf,%eax
    14be:	cd 40                	int    $0x40
    14c0:	c3                   	ret    

000014c1 <mknod>:
SYSCALL(mknod)
    14c1:	b8 11 00 00 00       	mov    $0x11,%eax
    14c6:	cd 40                	int    $0x40
    14c8:	c3                   	ret    

000014c9 <unlink>:
SYSCALL(unlink)
    14c9:	b8 12 00 00 00       	mov    $0x12,%eax
    14ce:	cd 40                	int    $0x40
    14d0:	c3                   	ret    

000014d1 <fstat>:
SYSCALL(fstat)
    14d1:	b8 08 00 00 00       	mov    $0x8,%eax
    14d6:	cd 40                	int    $0x40
    14d8:	c3                   	ret    

000014d9 <link>:
SYSCALL(link)
    14d9:	b8 13 00 00 00       	mov    $0x13,%eax
    14de:	cd 40                	int    $0x40
    14e0:	c3                   	ret    

000014e1 <mkdir>:
SYSCALL(mkdir)
    14e1:	b8 14 00 00 00       	mov    $0x14,%eax
    14e6:	cd 40                	int    $0x40
    14e8:	c3                   	ret    

000014e9 <chdir>:
SYSCALL(chdir)
    14e9:	b8 09 00 00 00       	mov    $0x9,%eax
    14ee:	cd 40                	int    $0x40
    14f0:	c3                   	ret    

000014f1 <dup>:
SYSCALL(dup)
    14f1:	b8 0a 00 00 00       	mov    $0xa,%eax
    14f6:	cd 40                	int    $0x40
    14f8:	c3                   	ret    

000014f9 <getpid>:
SYSCALL(getpid)
    14f9:	b8 0b 00 00 00       	mov    $0xb,%eax
    14fe:	cd 40                	int    $0x40
    1500:	c3                   	ret    

00001501 <sbrk>:
SYSCALL(sbrk)
    1501:	b8 0c 00 00 00       	mov    $0xc,%eax
    1506:	cd 40                	int    $0x40
    1508:	c3                   	ret    

00001509 <sleep>:
SYSCALL(sleep)
    1509:	b8 0d 00 00 00       	mov    $0xd,%eax
    150e:	cd 40                	int    $0x40
    1510:	c3                   	ret    

00001511 <uptime>:
SYSCALL(uptime)
    1511:	b8 0e 00 00 00       	mov    $0xe,%eax
    1516:	cd 40                	int    $0x40
    1518:	c3                   	ret    

00001519 <getreadcount>:
SYSCALL(getreadcount)
    1519:	b8 16 00 00 00       	mov    $0x16,%eax
    151e:	cd 40                	int    $0x40
    1520:	c3                   	ret    

00001521 <settickets>:
SYSCALL(settickets)
    1521:	b8 17 00 00 00       	mov    $0x17,%eax
    1526:	cd 40                	int    $0x40
    1528:	c3                   	ret    

00001529 <getpinfo>:
SYSCALL(getpinfo)
    1529:	b8 18 00 00 00       	mov    $0x18,%eax
    152e:	cd 40                	int    $0x40
    1530:	c3                   	ret    

00001531 <clone>:
SYSCALL(clone)
    1531:	b8 19 00 00 00       	mov    $0x19,%eax
    1536:	cd 40                	int    $0x40
    1538:	c3                   	ret    

00001539 <join>:
SYSCALL(join)
    1539:	b8 1a 00 00 00       	mov    $0x1a,%eax
    153e:	cd 40                	int    $0x40
    1540:	c3                   	ret    

00001541 <mprotect>:
SYSCALL(mprotect)
    1541:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1546:	cd 40                	int    $0x40
    1548:	c3                   	ret    

00001549 <munprotect>:
SYSCALL(munprotect)
    1549:	b8 1c 00 00 00       	mov    $0x1c,%eax
    154e:	cd 40                	int    $0x40
    1550:	c3                   	ret    
    1551:	66 90                	xchg   %ax,%ax
    1553:	66 90                	xchg   %ax,%ax
    1555:	66 90                	xchg   %ax,%ax
    1557:	66 90                	xchg   %ax,%ax
    1559:	66 90                	xchg   %ax,%ax
    155b:	66 90                	xchg   %ax,%ax
    155d:	66 90                	xchg   %ax,%ax
    155f:	90                   	nop

00001560 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1560:	55                   	push   %ebp
    1561:	89 e5                	mov    %esp,%ebp
    1563:	57                   	push   %edi
    1564:	56                   	push   %esi
    1565:	53                   	push   %ebx
    1566:	83 ec 3c             	sub    $0x3c,%esp
    1569:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    156c:	89 d1                	mov    %edx,%ecx
{
    156e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1571:	85 d2                	test   %edx,%edx
    1573:	0f 89 7f 00 00 00    	jns    15f8 <printint+0x98>
    1579:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    157d:	74 79                	je     15f8 <printint+0x98>
    neg = 1;
    157f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1586:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1588:	31 db                	xor    %ebx,%ebx
    158a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    158d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1590:	89 c8                	mov    %ecx,%eax
    1592:	31 d2                	xor    %edx,%edx
    1594:	89 cf                	mov    %ecx,%edi
    1596:	f7 75 c4             	divl   -0x3c(%ebp)
    1599:	0f b6 92 d4 19 00 00 	movzbl 0x19d4(%edx),%edx
    15a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    15a3:	89 d8                	mov    %ebx,%eax
    15a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    15a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    15ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    15ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    15b1:	76 dd                	jbe    1590 <printint+0x30>
  if(neg)
    15b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    15b6:	85 c9                	test   %ecx,%ecx
    15b8:	74 0c                	je     15c6 <printint+0x66>
    buf[i++] = '-';
    15ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    15bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    15c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    15c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    15c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    15cd:	eb 07                	jmp    15d6 <printint+0x76>
    15cf:	90                   	nop
    putc(fd, buf[i]);
    15d0:	0f b6 13             	movzbl (%ebx),%edx
    15d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    15d6:	83 ec 04             	sub    $0x4,%esp
    15d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    15dc:	6a 01                	push   $0x1
    15de:	56                   	push   %esi
    15df:	57                   	push   %edi
    15e0:	e8 b4 fe ff ff       	call   1499 <write>
  while(--i >= 0)
    15e5:	83 c4 10             	add    $0x10,%esp
    15e8:	39 de                	cmp    %ebx,%esi
    15ea:	75 e4                	jne    15d0 <printint+0x70>
}
    15ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15ef:	5b                   	pop    %ebx
    15f0:	5e                   	pop    %esi
    15f1:	5f                   	pop    %edi
    15f2:	5d                   	pop    %ebp
    15f3:	c3                   	ret    
    15f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    15f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    15ff:	eb 87                	jmp    1588 <printint+0x28>
    1601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1608:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    160f:	90                   	nop

00001610 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1610:	55                   	push   %ebp
    1611:	89 e5                	mov    %esp,%ebp
    1613:	57                   	push   %edi
    1614:	56                   	push   %esi
    1615:	53                   	push   %ebx
    1616:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1619:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    161c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    161f:	0f b6 13             	movzbl (%ebx),%edx
    1622:	84 d2                	test   %dl,%dl
    1624:	74 6a                	je     1690 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1626:	8d 45 10             	lea    0x10(%ebp),%eax
    1629:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    162c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    162f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1631:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1634:	eb 36                	jmp    166c <printf+0x5c>
    1636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    163d:	8d 76 00             	lea    0x0(%esi),%esi
    1640:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1643:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1648:	83 f8 25             	cmp    $0x25,%eax
    164b:	74 15                	je     1662 <printf+0x52>
  write(fd, &c, 1);
    164d:	83 ec 04             	sub    $0x4,%esp
    1650:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1653:	6a 01                	push   $0x1
    1655:	57                   	push   %edi
    1656:	56                   	push   %esi
    1657:	e8 3d fe ff ff       	call   1499 <write>
    165c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    165f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1662:	0f b6 13             	movzbl (%ebx),%edx
    1665:	83 c3 01             	add    $0x1,%ebx
    1668:	84 d2                	test   %dl,%dl
    166a:	74 24                	je     1690 <printf+0x80>
    c = fmt[i] & 0xff;
    166c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    166f:	85 c9                	test   %ecx,%ecx
    1671:	74 cd                	je     1640 <printf+0x30>
      }
    } else if(state == '%'){
    1673:	83 f9 25             	cmp    $0x25,%ecx
    1676:	75 ea                	jne    1662 <printf+0x52>
      if(c == 'd'){
    1678:	83 f8 25             	cmp    $0x25,%eax
    167b:	0f 84 07 01 00 00    	je     1788 <printf+0x178>
    1681:	83 e8 63             	sub    $0x63,%eax
    1684:	83 f8 15             	cmp    $0x15,%eax
    1687:	77 17                	ja     16a0 <printf+0x90>
    1689:	ff 24 85 7c 19 00 00 	jmp    *0x197c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1690:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1693:	5b                   	pop    %ebx
    1694:	5e                   	pop    %esi
    1695:	5f                   	pop    %edi
    1696:	5d                   	pop    %ebp
    1697:	c3                   	ret    
    1698:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    169f:	90                   	nop
  write(fd, &c, 1);
    16a0:	83 ec 04             	sub    $0x4,%esp
    16a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    16a6:	6a 01                	push   $0x1
    16a8:	57                   	push   %edi
    16a9:	56                   	push   %esi
    16aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    16ae:	e8 e6 fd ff ff       	call   1499 <write>
        putc(fd, c);
    16b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    16b7:	83 c4 0c             	add    $0xc,%esp
    16ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
    16bd:	6a 01                	push   $0x1
    16bf:	57                   	push   %edi
    16c0:	56                   	push   %esi
    16c1:	e8 d3 fd ff ff       	call   1499 <write>
        putc(fd, c);
    16c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16c9:	31 c9                	xor    %ecx,%ecx
    16cb:	eb 95                	jmp    1662 <printf+0x52>
    16cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    16d0:	83 ec 0c             	sub    $0xc,%esp
    16d3:	b9 10 00 00 00       	mov    $0x10,%ecx
    16d8:	6a 00                	push   $0x0
    16da:	8b 45 d0             	mov    -0x30(%ebp),%eax
    16dd:	8b 10                	mov    (%eax),%edx
    16df:	89 f0                	mov    %esi,%eax
    16e1:	e8 7a fe ff ff       	call   1560 <printint>
        ap++;
    16e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    16ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16ed:	31 c9                	xor    %ecx,%ecx
    16ef:	e9 6e ff ff ff       	jmp    1662 <printf+0x52>
    16f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    16f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    16fb:	8b 10                	mov    (%eax),%edx
        ap++;
    16fd:	83 c0 04             	add    $0x4,%eax
    1700:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1703:	85 d2                	test   %edx,%edx
    1705:	0f 84 8d 00 00 00    	je     1798 <printf+0x188>
        while(*s != 0){
    170b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    170e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1710:	84 c0                	test   %al,%al
    1712:	0f 84 4a ff ff ff    	je     1662 <printf+0x52>
    1718:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    171b:	89 d3                	mov    %edx,%ebx
    171d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1720:	83 ec 04             	sub    $0x4,%esp
          s++;
    1723:	83 c3 01             	add    $0x1,%ebx
    1726:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1729:	6a 01                	push   $0x1
    172b:	57                   	push   %edi
    172c:	56                   	push   %esi
    172d:	e8 67 fd ff ff       	call   1499 <write>
        while(*s != 0){
    1732:	0f b6 03             	movzbl (%ebx),%eax
    1735:	83 c4 10             	add    $0x10,%esp
    1738:	84 c0                	test   %al,%al
    173a:	75 e4                	jne    1720 <printf+0x110>
      state = 0;
    173c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    173f:	31 c9                	xor    %ecx,%ecx
    1741:	e9 1c ff ff ff       	jmp    1662 <printf+0x52>
    1746:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    174d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1750:	83 ec 0c             	sub    $0xc,%esp
    1753:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1758:	6a 01                	push   $0x1
    175a:	e9 7b ff ff ff       	jmp    16da <printf+0xca>
    175f:	90                   	nop
        putc(fd, *ap);
    1760:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1763:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1766:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1768:	6a 01                	push   $0x1
    176a:	57                   	push   %edi
    176b:	56                   	push   %esi
        putc(fd, *ap);
    176c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    176f:	e8 25 fd ff ff       	call   1499 <write>
        ap++;
    1774:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1778:	83 c4 10             	add    $0x10,%esp
      state = 0;
    177b:	31 c9                	xor    %ecx,%ecx
    177d:	e9 e0 fe ff ff       	jmp    1662 <printf+0x52>
    1782:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1788:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    178b:	83 ec 04             	sub    $0x4,%esp
    178e:	e9 2a ff ff ff       	jmp    16bd <printf+0xad>
    1793:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1797:	90                   	nop
          s = "(null)";
    1798:	ba 72 19 00 00       	mov    $0x1972,%edx
        while(*s != 0){
    179d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    17a0:	b8 28 00 00 00       	mov    $0x28,%eax
    17a5:	89 d3                	mov    %edx,%ebx
    17a7:	e9 74 ff ff ff       	jmp    1720 <printf+0x110>
    17ac:	66 90                	xchg   %ax,%ax
    17ae:	66 90                	xchg   %ax,%ax

000017b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    17b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17b1:	a1 60 1f 00 00       	mov    0x1f60,%eax
{
    17b6:	89 e5                	mov    %esp,%ebp
    17b8:	57                   	push   %edi
    17b9:	56                   	push   %esi
    17ba:	53                   	push   %ebx
    17bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    17be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17c8:	89 c2                	mov    %eax,%edx
    17ca:	8b 00                	mov    (%eax),%eax
    17cc:	39 ca                	cmp    %ecx,%edx
    17ce:	73 30                	jae    1800 <free+0x50>
    17d0:	39 c1                	cmp    %eax,%ecx
    17d2:	72 04                	jb     17d8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    17d4:	39 c2                	cmp    %eax,%edx
    17d6:	72 f0                	jb     17c8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    17d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    17db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    17de:	39 f8                	cmp    %edi,%eax
    17e0:	74 30                	je     1812 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    17e2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    17e5:	8b 42 04             	mov    0x4(%edx),%eax
    17e8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    17eb:	39 f1                	cmp    %esi,%ecx
    17ed:	74 3a                	je     1829 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    17ef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    17f1:	5b                   	pop    %ebx
  freep = p;
    17f2:	89 15 60 1f 00 00    	mov    %edx,0x1f60
}
    17f8:	5e                   	pop    %esi
    17f9:	5f                   	pop    %edi
    17fa:	5d                   	pop    %ebp
    17fb:	c3                   	ret    
    17fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1800:	39 c2                	cmp    %eax,%edx
    1802:	72 c4                	jb     17c8 <free+0x18>
    1804:	39 c1                	cmp    %eax,%ecx
    1806:	73 c0                	jae    17c8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1808:	8b 73 fc             	mov    -0x4(%ebx),%esi
    180b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    180e:	39 f8                	cmp    %edi,%eax
    1810:	75 d0                	jne    17e2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1812:	03 70 04             	add    0x4(%eax),%esi
    1815:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1818:	8b 02                	mov    (%edx),%eax
    181a:	8b 00                	mov    (%eax),%eax
    181c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    181f:	8b 42 04             	mov    0x4(%edx),%eax
    1822:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1825:	39 f1                	cmp    %esi,%ecx
    1827:	75 c6                	jne    17ef <free+0x3f>
    p->s.size += bp->s.size;
    1829:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    182c:	89 15 60 1f 00 00    	mov    %edx,0x1f60
    p->s.size += bp->s.size;
    1832:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1835:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1838:	89 0a                	mov    %ecx,(%edx)
}
    183a:	5b                   	pop    %ebx
    183b:	5e                   	pop    %esi
    183c:	5f                   	pop    %edi
    183d:	5d                   	pop    %ebp
    183e:	c3                   	ret    
    183f:	90                   	nop

00001840 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1840:	55                   	push   %ebp
    1841:	89 e5                	mov    %esp,%ebp
    1843:	57                   	push   %edi
    1844:	56                   	push   %esi
    1845:	53                   	push   %ebx
    1846:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1849:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    184c:	8b 3d 60 1f 00 00    	mov    0x1f60,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1852:	8d 70 07             	lea    0x7(%eax),%esi
    1855:	c1 ee 03             	shr    $0x3,%esi
    1858:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    185b:	85 ff                	test   %edi,%edi
    185d:	0f 84 9d 00 00 00    	je     1900 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1863:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1865:	8b 4a 04             	mov    0x4(%edx),%ecx
    1868:	39 f1                	cmp    %esi,%ecx
    186a:	73 6a                	jae    18d6 <malloc+0x96>
    186c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1871:	39 de                	cmp    %ebx,%esi
    1873:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1876:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    187d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1880:	eb 17                	jmp    1899 <malloc+0x59>
    1882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1888:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    188a:	8b 48 04             	mov    0x4(%eax),%ecx
    188d:	39 f1                	cmp    %esi,%ecx
    188f:	73 4f                	jae    18e0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1891:	8b 3d 60 1f 00 00    	mov    0x1f60,%edi
    1897:	89 c2                	mov    %eax,%edx
    1899:	39 d7                	cmp    %edx,%edi
    189b:	75 eb                	jne    1888 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    189d:	83 ec 0c             	sub    $0xc,%esp
    18a0:	ff 75 e4             	push   -0x1c(%ebp)
    18a3:	e8 59 fc ff ff       	call   1501 <sbrk>
  if(p == (char*)-1)
    18a8:	83 c4 10             	add    $0x10,%esp
    18ab:	83 f8 ff             	cmp    $0xffffffff,%eax
    18ae:	74 1c                	je     18cc <malloc+0x8c>
  hp->s.size = nu;
    18b0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    18b3:	83 ec 0c             	sub    $0xc,%esp
    18b6:	83 c0 08             	add    $0x8,%eax
    18b9:	50                   	push   %eax
    18ba:	e8 f1 fe ff ff       	call   17b0 <free>
  return freep;
    18bf:	8b 15 60 1f 00 00    	mov    0x1f60,%edx
      if((p = morecore(nunits)) == 0)
    18c5:	83 c4 10             	add    $0x10,%esp
    18c8:	85 d2                	test   %edx,%edx
    18ca:	75 bc                	jne    1888 <malloc+0x48>
        return 0;
  }
}
    18cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    18cf:	31 c0                	xor    %eax,%eax
}
    18d1:	5b                   	pop    %ebx
    18d2:	5e                   	pop    %esi
    18d3:	5f                   	pop    %edi
    18d4:	5d                   	pop    %ebp
    18d5:	c3                   	ret    
    if(p->s.size >= nunits){
    18d6:	89 d0                	mov    %edx,%eax
    18d8:	89 fa                	mov    %edi,%edx
    18da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    18e0:	39 ce                	cmp    %ecx,%esi
    18e2:	74 4c                	je     1930 <malloc+0xf0>
        p->s.size -= nunits;
    18e4:	29 f1                	sub    %esi,%ecx
    18e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    18e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    18ec:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    18ef:	89 15 60 1f 00 00    	mov    %edx,0x1f60
}
    18f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    18f8:	83 c0 08             	add    $0x8,%eax
}
    18fb:	5b                   	pop    %ebx
    18fc:	5e                   	pop    %esi
    18fd:	5f                   	pop    %edi
    18fe:	5d                   	pop    %ebp
    18ff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1900:	c7 05 60 1f 00 00 64 	movl   $0x1f64,0x1f60
    1907:	1f 00 00 
    base.s.size = 0;
    190a:	bf 64 1f 00 00       	mov    $0x1f64,%edi
    base.s.ptr = freep = prevp = &base;
    190f:	c7 05 64 1f 00 00 64 	movl   $0x1f64,0x1f64
    1916:	1f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1919:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    191b:	c7 05 68 1f 00 00 00 	movl   $0x0,0x1f68
    1922:	00 00 00 
    if(p->s.size >= nunits){
    1925:	e9 42 ff ff ff       	jmp    186c <malloc+0x2c>
    192a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1930:	8b 08                	mov    (%eax),%ecx
    1932:	89 0a                	mov    %ecx,(%edx)
    1934:	eb b9                	jmp    18ef <malloc+0xaf>
