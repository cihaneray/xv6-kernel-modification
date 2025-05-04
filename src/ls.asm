
_ls:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  close(fd);
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
    100f:	53                   	push   %ebx
    1010:	bb 01 00 00 00       	mov    $0x1,%ebx
    1015:	51                   	push   %ecx
    1016:	83 ec 08             	sub    $0x8,%esp
    1019:	8b 31                	mov    (%ecx),%esi
    101b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
    101e:	83 fe 01             	cmp    $0x1,%esi
    1021:	7e 1f                	jle    1042 <main+0x42>
    1023:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1027:	90                   	nop
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
    1028:	83 ec 0c             	sub    $0xc,%esp
    102b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
    102e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
    1031:	e8 ca 00 00 00       	call   1100 <ls>
  for(i=1; i<argc; i++)
    1036:	83 c4 10             	add    $0x10,%esp
    1039:	39 de                	cmp    %ebx,%esi
    103b:	75 eb                	jne    1028 <main+0x28>
  exit();
    103d:	e8 f7 05 00 00       	call   1639 <exit>
    ls(".");
    1042:	83 ec 0c             	sub    $0xc,%esp
    1045:	68 40 1b 00 00       	push   $0x1b40
    104a:	e8 b1 00 00 00       	call   1100 <ls>
    exit();
    104f:	e8 e5 05 00 00       	call   1639 <exit>
    1054:	66 90                	xchg   %ax,%ax
    1056:	66 90                	xchg   %ax,%ax
    1058:	66 90                	xchg   %ax,%ax
    105a:	66 90                	xchg   %ax,%ax
    105c:	66 90                	xchg   %ax,%ax
    105e:	66 90                	xchg   %ax,%ax

00001060 <fmtname>:
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	56                   	push   %esi
    1064:	53                   	push   %ebx
    1065:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    1068:	83 ec 0c             	sub    $0xc,%esp
    106b:	56                   	push   %esi
    106c:	e8 5f 03 00 00       	call   13d0 <strlen>
    1071:	83 c4 10             	add    $0x10,%esp
    1074:	01 f0                	add    %esi,%eax
    1076:	89 c3                	mov    %eax,%ebx
    1078:	73 0f                	jae    1089 <fmtname+0x29>
    107a:	eb 12                	jmp    108e <fmtname+0x2e>
    107c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1080:	8d 43 ff             	lea    -0x1(%ebx),%eax
    1083:	39 c6                	cmp    %eax,%esi
    1085:	77 0a                	ja     1091 <fmtname+0x31>
    1087:	89 c3                	mov    %eax,%ebx
    1089:	80 3b 2f             	cmpb   $0x2f,(%ebx)
    108c:	75 f2                	jne    1080 <fmtname+0x20>
  p++;
    108e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
    1091:	83 ec 0c             	sub    $0xc,%esp
    1094:	53                   	push   %ebx
    1095:	e8 36 03 00 00       	call   13d0 <strlen>
    109a:	83 c4 10             	add    $0x10,%esp
    109d:	83 f8 0d             	cmp    $0xd,%eax
    10a0:	77 4a                	ja     10ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
    10a2:	83 ec 0c             	sub    $0xc,%esp
    10a5:	53                   	push   %ebx
    10a6:	e8 25 03 00 00       	call   13d0 <strlen>
    10ab:	83 c4 0c             	add    $0xc,%esp
    10ae:	50                   	push   %eax
    10af:	53                   	push   %ebx
    10b0:	68 74 1f 00 00       	push   $0x1f74
    10b5:	e8 a6 04 00 00       	call   1560 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
    10ba:	89 1c 24             	mov    %ebx,(%esp)
    10bd:	e8 0e 03 00 00       	call   13d0 <strlen>
    10c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
    10c5:	bb 74 1f 00 00       	mov    $0x1f74,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
    10ca:	89 c6                	mov    %eax,%esi
    10cc:	e8 ff 02 00 00       	call   13d0 <strlen>
    10d1:	ba 0e 00 00 00       	mov    $0xe,%edx
    10d6:	83 c4 0c             	add    $0xc,%esp
    10d9:	29 f2                	sub    %esi,%edx
    10db:	05 74 1f 00 00       	add    $0x1f74,%eax
    10e0:	52                   	push   %edx
    10e1:	6a 20                	push   $0x20
    10e3:	50                   	push   %eax
    10e4:	e8 17 03 00 00       	call   1400 <memset>
  return buf;
    10e9:	83 c4 10             	add    $0x10,%esp
}
    10ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10ef:	89 d8                	mov    %ebx,%eax
    10f1:	5b                   	pop    %ebx
    10f2:	5e                   	pop    %esi
    10f3:	5d                   	pop    %ebp
    10f4:	c3                   	ret    
    10f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001100 <ls>:
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	57                   	push   %edi
    1104:	56                   	push   %esi
    1105:	53                   	push   %ebx
    1106:	81 ec 64 02 00 00    	sub    $0x264,%esp
    110c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
    110f:	6a 00                	push   $0x0
    1111:	57                   	push   %edi
    1112:	e8 62 05 00 00       	call   1679 <open>
    1117:	83 c4 10             	add    $0x10,%esp
    111a:	85 c0                	test   %eax,%eax
    111c:	0f 88 9e 01 00 00    	js     12c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
    1122:	83 ec 08             	sub    $0x8,%esp
    1125:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
    112b:	89 c3                	mov    %eax,%ebx
    112d:	56                   	push   %esi
    112e:	50                   	push   %eax
    112f:	e8 5d 05 00 00       	call   1691 <fstat>
    1134:	83 c4 10             	add    $0x10,%esp
    1137:	85 c0                	test   %eax,%eax
    1139:	0f 88 c1 01 00 00    	js     1300 <ls+0x200>
  switch(st.type){
    113f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
    1146:	66 83 f8 01          	cmp    $0x1,%ax
    114a:	74 64                	je     11b0 <ls+0xb0>
    114c:	66 83 f8 02          	cmp    $0x2,%ax
    1150:	74 1e                	je     1170 <ls+0x70>
  close(fd);
    1152:	83 ec 0c             	sub    $0xc,%esp
    1155:	53                   	push   %ebx
    1156:	e8 06 05 00 00       	call   1661 <close>
    115b:	83 c4 10             	add    $0x10,%esp
}
    115e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1161:	5b                   	pop    %ebx
    1162:	5e                   	pop    %esi
    1163:	5f                   	pop    %edi
    1164:	5d                   	pop    %ebp
    1165:	c3                   	ret    
    1166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    116d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    1170:	83 ec 0c             	sub    $0xc,%esp
    1173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
    1179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
    117f:	57                   	push   %edi
    1180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
    1186:	e8 d5 fe ff ff       	call   1060 <fmtname>
    118b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
    1191:	59                   	pop    %ecx
    1192:	5f                   	pop    %edi
    1193:	52                   	push   %edx
    1194:	56                   	push   %esi
    1195:	6a 02                	push   $0x2
    1197:	50                   	push   %eax
    1198:	68 20 1b 00 00       	push   $0x1b20
    119d:	6a 01                	push   $0x1
    119f:	e8 2c 06 00 00       	call   17d0 <printf>
    break;
    11a4:	83 c4 20             	add    $0x20,%esp
    11a7:	eb a9                	jmp    1152 <ls+0x52>
    11a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
    11b0:	83 ec 0c             	sub    $0xc,%esp
    11b3:	57                   	push   %edi
    11b4:	e8 17 02 00 00       	call   13d0 <strlen>
    11b9:	83 c4 10             	add    $0x10,%esp
    11bc:	83 c0 10             	add    $0x10,%eax
    11bf:	3d 00 02 00 00       	cmp    $0x200,%eax
    11c4:	0f 87 16 01 00 00    	ja     12e0 <ls+0x1e0>
    strcpy(buf, path);
    11ca:	83 ec 08             	sub    $0x8,%esp
    11cd:	57                   	push   %edi
    11ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
    11d4:	57                   	push   %edi
    11d5:	e8 66 01 00 00       	call   1340 <strcpy>
    p = buf+strlen(buf);
    11da:	89 3c 24             	mov    %edi,(%esp)
    11dd:	e8 ee 01 00 00       	call   13d0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
    11e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
    11e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
    11e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
    11ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
    11f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
    11f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1200:	83 ec 04             	sub    $0x4,%esp
    1203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
    1209:	6a 10                	push   $0x10
    120b:	50                   	push   %eax
    120c:	53                   	push   %ebx
    120d:	e8 3f 04 00 00       	call   1651 <read>
    1212:	83 c4 10             	add    $0x10,%esp
    1215:	83 f8 10             	cmp    $0x10,%eax
    1218:	0f 85 34 ff ff ff    	jne    1152 <ls+0x52>
      if(de.inum == 0)
    121e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
    1225:	00 
    1226:	74 d8                	je     1200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
    1228:	83 ec 04             	sub    $0x4,%esp
    122b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
    1231:	6a 0e                	push   $0xe
    1233:	50                   	push   %eax
    1234:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
    123a:	e8 21 03 00 00       	call   1560 <memmove>
      p[DIRSIZ] = 0;
    123f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
    1245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
    1249:	58                   	pop    %eax
    124a:	5a                   	pop    %edx
    124b:	56                   	push   %esi
    124c:	57                   	push   %edi
    124d:	e8 7e 02 00 00       	call   14d0 <stat>
    1252:	83 c4 10             	add    $0x10,%esp
    1255:	85 c0                	test   %eax,%eax
    1257:	0f 88 cb 00 00 00    	js     1328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    125d:	83 ec 0c             	sub    $0xc,%esp
    1260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
    1266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
    126c:	57                   	push   %edi
    126d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
    1274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
    127a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
    1280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
    1286:	e8 d5 fd ff ff       	call   1060 <fmtname>
    128b:	5a                   	pop    %edx
    128c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
    1292:	59                   	pop    %ecx
    1293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
    1299:	51                   	push   %ecx
    129a:	52                   	push   %edx
    129b:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
    12a1:	50                   	push   %eax
    12a2:	68 20 1b 00 00       	push   $0x1b20
    12a7:	6a 01                	push   $0x1
    12a9:	e8 22 05 00 00       	call   17d0 <printf>
    12ae:	83 c4 20             	add    $0x20,%esp
    12b1:	e9 4a ff ff ff       	jmp    1200 <ls+0x100>
    12b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
    12c0:	83 ec 04             	sub    $0x4,%esp
    12c3:	57                   	push   %edi
    12c4:	68 f8 1a 00 00       	push   $0x1af8
    12c9:	6a 02                	push   $0x2
    12cb:	e8 00 05 00 00       	call   17d0 <printf>
    return;
    12d0:	83 c4 10             	add    $0x10,%esp
}
    12d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12d6:	5b                   	pop    %ebx
    12d7:	5e                   	pop    %esi
    12d8:	5f                   	pop    %edi
    12d9:	5d                   	pop    %ebp
    12da:	c3                   	ret    
    12db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12df:	90                   	nop
      printf(1, "ls: path too long\n");
    12e0:	83 ec 08             	sub    $0x8,%esp
    12e3:	68 2d 1b 00 00       	push   $0x1b2d
    12e8:	6a 01                	push   $0x1
    12ea:	e8 e1 04 00 00       	call   17d0 <printf>
      break;
    12ef:	83 c4 10             	add    $0x10,%esp
    12f2:	e9 5b fe ff ff       	jmp    1152 <ls+0x52>
    12f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
    1300:	83 ec 04             	sub    $0x4,%esp
    1303:	57                   	push   %edi
    1304:	68 0c 1b 00 00       	push   $0x1b0c
    1309:	6a 02                	push   $0x2
    130b:	e8 c0 04 00 00       	call   17d0 <printf>
    close(fd);
    1310:	89 1c 24             	mov    %ebx,(%esp)
    1313:	e8 49 03 00 00       	call   1661 <close>
    return;
    1318:	83 c4 10             	add    $0x10,%esp
}
    131b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    131e:	5b                   	pop    %ebx
    131f:	5e                   	pop    %esi
    1320:	5f                   	pop    %edi
    1321:	5d                   	pop    %ebp
    1322:	c3                   	ret    
    1323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1327:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
    1328:	83 ec 04             	sub    $0x4,%esp
    132b:	57                   	push   %edi
    132c:	68 0c 1b 00 00       	push   $0x1b0c
    1331:	6a 01                	push   $0x1
    1333:	e8 98 04 00 00       	call   17d0 <printf>
        continue;
    1338:	83 c4 10             	add    $0x10,%esp
    133b:	e9 c0 fe ff ff       	jmp    1200 <ls+0x100>

00001340 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    1340:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1341:	31 c0                	xor    %eax,%eax
{
    1343:	89 e5                	mov    %esp,%ebp
    1345:	53                   	push   %ebx
    1346:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1349:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    134c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1357:	83 c0 01             	add    $0x1,%eax
    135a:	84 d2                	test   %dl,%dl
    135c:	75 f2                	jne    1350 <strcpy+0x10>
    ;
  return os;
}
    135e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1361:	89 c8                	mov    %ecx,%eax
    1363:	c9                   	leave  
    1364:	c3                   	ret    
    1365:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    136c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	53                   	push   %ebx
    1374:	8b 55 08             	mov    0x8(%ebp),%edx
    1377:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    137a:	0f b6 02             	movzbl (%edx),%eax
    137d:	84 c0                	test   %al,%al
    137f:	75 17                	jne    1398 <strcmp+0x28>
    1381:	eb 3a                	jmp    13bd <strcmp+0x4d>
    1383:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1387:	90                   	nop
    1388:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    138c:	83 c2 01             	add    $0x1,%edx
    138f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1392:	84 c0                	test   %al,%al
    1394:	74 1a                	je     13b0 <strcmp+0x40>
    p++, q++;
    1396:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1398:	0f b6 19             	movzbl (%ecx),%ebx
    139b:	38 c3                	cmp    %al,%bl
    139d:	74 e9                	je     1388 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    139f:	29 d8                	sub    %ebx,%eax
}
    13a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13a4:	c9                   	leave  
    13a5:	c3                   	ret    
    13a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    13b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    13b4:	31 c0                	xor    %eax,%eax
    13b6:	29 d8                	sub    %ebx,%eax
}
    13b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13bb:	c9                   	leave  
    13bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    13bd:	0f b6 19             	movzbl (%ecx),%ebx
    13c0:	31 c0                	xor    %eax,%eax
    13c2:	eb db                	jmp    139f <strcmp+0x2f>
    13c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13cf:	90                   	nop

000013d0 <strlen>:

uint
strlen(const char *s)
{
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    13d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    13d6:	80 3a 00             	cmpb   $0x0,(%edx)
    13d9:	74 15                	je     13f0 <strlen+0x20>
    13db:	31 c0                	xor    %eax,%eax
    13dd:	8d 76 00             	lea    0x0(%esi),%esi
    13e0:	83 c0 01             	add    $0x1,%eax
    13e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    13e7:	89 c1                	mov    %eax,%ecx
    13e9:	75 f5                	jne    13e0 <strlen+0x10>
    ;
  return n;
}
    13eb:	89 c8                	mov    %ecx,%eax
    13ed:	5d                   	pop    %ebp
    13ee:	c3                   	ret    
    13ef:	90                   	nop
  for(n = 0; s[n]; n++)
    13f0:	31 c9                	xor    %ecx,%ecx
}
    13f2:	5d                   	pop    %ebp
    13f3:	89 c8                	mov    %ecx,%eax
    13f5:	c3                   	ret    
    13f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13fd:	8d 76 00             	lea    0x0(%esi),%esi

00001400 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	57                   	push   %edi
    1404:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1407:	8b 4d 10             	mov    0x10(%ebp),%ecx
    140a:	8b 45 0c             	mov    0xc(%ebp),%eax
    140d:	89 d7                	mov    %edx,%edi
    140f:	fc                   	cld    
    1410:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1412:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1415:	89 d0                	mov    %edx,%eax
    1417:	c9                   	leave  
    1418:	c3                   	ret    
    1419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001420 <strchr>:

char*
strchr(const char *s, char c)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	8b 45 08             	mov    0x8(%ebp),%eax
    1426:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    142a:	0f b6 10             	movzbl (%eax),%edx
    142d:	84 d2                	test   %dl,%dl
    142f:	75 12                	jne    1443 <strchr+0x23>
    1431:	eb 1d                	jmp    1450 <strchr+0x30>
    1433:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1437:	90                   	nop
    1438:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    143c:	83 c0 01             	add    $0x1,%eax
    143f:	84 d2                	test   %dl,%dl
    1441:	74 0d                	je     1450 <strchr+0x30>
    if(*s == c)
    1443:	38 d1                	cmp    %dl,%cl
    1445:	75 f1                	jne    1438 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1447:	5d                   	pop    %ebp
    1448:	c3                   	ret    
    1449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1450:	31 c0                	xor    %eax,%eax
}
    1452:	5d                   	pop    %ebp
    1453:	c3                   	ret    
    1454:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    145b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    145f:	90                   	nop

00001460 <gets>:

char*
gets(char *buf, int max)
{
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	57                   	push   %edi
    1464:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1465:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1468:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1469:	31 db                	xor    %ebx,%ebx
{
    146b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    146e:	eb 27                	jmp    1497 <gets+0x37>
    cc = read(0, &c, 1);
    1470:	83 ec 04             	sub    $0x4,%esp
    1473:	6a 01                	push   $0x1
    1475:	57                   	push   %edi
    1476:	6a 00                	push   $0x0
    1478:	e8 d4 01 00 00       	call   1651 <read>
    if(cc < 1)
    147d:	83 c4 10             	add    $0x10,%esp
    1480:	85 c0                	test   %eax,%eax
    1482:	7e 1d                	jle    14a1 <gets+0x41>
      break;
    buf[i++] = c;
    1484:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1488:	8b 55 08             	mov    0x8(%ebp),%edx
    148b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    148f:	3c 0a                	cmp    $0xa,%al
    1491:	74 1d                	je     14b0 <gets+0x50>
    1493:	3c 0d                	cmp    $0xd,%al
    1495:	74 19                	je     14b0 <gets+0x50>
  for(i=0; i+1 < max; ){
    1497:	89 de                	mov    %ebx,%esi
    1499:	83 c3 01             	add    $0x1,%ebx
    149c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    149f:	7c cf                	jl     1470 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    14a1:	8b 45 08             	mov    0x8(%ebp),%eax
    14a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    14a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14ab:	5b                   	pop    %ebx
    14ac:	5e                   	pop    %esi
    14ad:	5f                   	pop    %edi
    14ae:	5d                   	pop    %ebp
    14af:	c3                   	ret    
  buf[i] = '\0';
    14b0:	8b 45 08             	mov    0x8(%ebp),%eax
    14b3:	89 de                	mov    %ebx,%esi
    14b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    14b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14bc:	5b                   	pop    %ebx
    14bd:	5e                   	pop    %esi
    14be:	5f                   	pop    %edi
    14bf:	5d                   	pop    %ebp
    14c0:	c3                   	ret    
    14c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14cf:	90                   	nop

000014d0 <stat>:

int
stat(const char *n, struct stat *st)
{
    14d0:	55                   	push   %ebp
    14d1:	89 e5                	mov    %esp,%ebp
    14d3:	56                   	push   %esi
    14d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    14d5:	83 ec 08             	sub    $0x8,%esp
    14d8:	6a 00                	push   $0x0
    14da:	ff 75 08             	push   0x8(%ebp)
    14dd:	e8 97 01 00 00       	call   1679 <open>
  if(fd < 0)
    14e2:	83 c4 10             	add    $0x10,%esp
    14e5:	85 c0                	test   %eax,%eax
    14e7:	78 27                	js     1510 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    14e9:	83 ec 08             	sub    $0x8,%esp
    14ec:	ff 75 0c             	push   0xc(%ebp)
    14ef:	89 c3                	mov    %eax,%ebx
    14f1:	50                   	push   %eax
    14f2:	e8 9a 01 00 00       	call   1691 <fstat>
  close(fd);
    14f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    14fa:	89 c6                	mov    %eax,%esi
  close(fd);
    14fc:	e8 60 01 00 00       	call   1661 <close>
  return r;
    1501:	83 c4 10             	add    $0x10,%esp
}
    1504:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1507:	89 f0                	mov    %esi,%eax
    1509:	5b                   	pop    %ebx
    150a:	5e                   	pop    %esi
    150b:	5d                   	pop    %ebp
    150c:	c3                   	ret    
    150d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1510:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1515:	eb ed                	jmp    1504 <stat+0x34>
    1517:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    151e:	66 90                	xchg   %ax,%ax

00001520 <atoi>:

int
atoi(const char *s)
{
    1520:	55                   	push   %ebp
    1521:	89 e5                	mov    %esp,%ebp
    1523:	53                   	push   %ebx
    1524:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1527:	0f be 02             	movsbl (%edx),%eax
    152a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    152d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1530:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1535:	77 1e                	ja     1555 <atoi+0x35>
    1537:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    153e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1540:	83 c2 01             	add    $0x1,%edx
    1543:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1546:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    154a:	0f be 02             	movsbl (%edx),%eax
    154d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1550:	80 fb 09             	cmp    $0x9,%bl
    1553:	76 eb                	jbe    1540 <atoi+0x20>
  return n;
}
    1555:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1558:	89 c8                	mov    %ecx,%eax
    155a:	c9                   	leave  
    155b:	c3                   	ret    
    155c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001560 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1560:	55                   	push   %ebp
    1561:	89 e5                	mov    %esp,%ebp
    1563:	57                   	push   %edi
    1564:	8b 45 10             	mov    0x10(%ebp),%eax
    1567:	8b 55 08             	mov    0x8(%ebp),%edx
    156a:	56                   	push   %esi
    156b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    156e:	85 c0                	test   %eax,%eax
    1570:	7e 13                	jle    1585 <memmove+0x25>
    1572:	01 d0                	add    %edx,%eax
  dst = vdst;
    1574:	89 d7                	mov    %edx,%edi
    1576:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    157d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1580:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1581:	39 f8                	cmp    %edi,%eax
    1583:	75 fb                	jne    1580 <memmove+0x20>
  return vdst;
}
    1585:	5e                   	pop    %esi
    1586:	89 d0                	mov    %edx,%eax
    1588:	5f                   	pop    %edi
    1589:	5d                   	pop    %ebp
    158a:	c3                   	ret    
    158b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    158f:	90                   	nop

00001590 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    1593:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    1596:	68 00 10 00 00       	push   $0x1000
    159b:	e8 60 04 00 00       	call   1a00 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    15a0:	50                   	push   %eax
    15a1:	ff 75 10             	push   0x10(%ebp)
    15a4:	ff 75 0c             	push   0xc(%ebp)
    15a7:	ff 75 08             	push   0x8(%ebp)
    15aa:	e8 42 01 00 00       	call   16f1 <clone>
}
    15af:	c9                   	leave  
    15b0:	c3                   	ret    
    15b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15bf:	90                   	nop

000015c0 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    15c0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    15c1:	b9 01 00 00 00       	mov    $0x1,%ecx
    15c6:	89 e5                	mov    %esp,%ebp
    15c8:	8b 55 08             	mov    0x8(%ebp),%edx
    15cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15cf:	90                   	nop
    15d0:	89 c8                	mov    %ecx,%eax
    15d2:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    15d5:	85 c0                	test   %eax,%eax
    15d7:	75 f7                	jne    15d0 <lock_acquire+0x10>
}
    15d9:	5d                   	pop    %ebp
    15da:	c3                   	ret    
    15db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15df:	90                   	nop

000015e0 <lock_release>:

void lock_release(lock_thread *lock){
    15e0:	55                   	push   %ebp
    15e1:	31 c0                	xor    %eax,%eax
    15e3:	89 e5                	mov    %esp,%ebp
    15e5:	8b 55 08             	mov    0x8(%ebp),%edx
    15e8:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    15eb:	5d                   	pop    %ebp
    15ec:	c3                   	ret    
    15ed:	8d 76 00             	lea    0x0(%esi),%esi

000015f0 <lock_init>:

int lock_init(lock_thread *lock)
{
    15f0:	55                   	push   %ebp
    15f1:	89 e5                	mov    %esp,%ebp
    15f3:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    15f6:	68 42 1b 00 00       	push   $0x1b42
    15fb:	6a 01                	push   $0x1
    15fd:	e8 ce 01 00 00       	call   17d0 <printf>
  lock->locked = 0;
    1602:	8b 45 08             	mov    0x8(%ebp),%eax
    1605:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    160b:	58                   	pop    %eax
    160c:	5a                   	pop    %edx
    160d:	68 42 1b 00 00       	push   $0x1b42
    1612:	6a 01                	push   $0x1
    1614:	e8 b7 01 00 00       	call   17d0 <printf>
  return 0;
}
    1619:	31 c0                	xor    %eax,%eax
    161b:	c9                   	leave  
    161c:	c3                   	ret    
    161d:	8d 76 00             	lea    0x0(%esi),%esi

00001620 <thread_join>:



int thread_join()
{
    1620:	55                   	push   %ebp
    1621:	89 e5                	mov    %esp,%ebp
    1623:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    1626:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1629:	50                   	push   %eax
    162a:	e8 ca 00 00 00       	call   16f9 <join>
  return a;
    162f:	c9                   	leave  
    1630:	c3                   	ret    

00001631 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1631:	b8 01 00 00 00       	mov    $0x1,%eax
    1636:	cd 40                	int    $0x40
    1638:	c3                   	ret    

00001639 <exit>:
SYSCALL(exit)
    1639:	b8 02 00 00 00       	mov    $0x2,%eax
    163e:	cd 40                	int    $0x40
    1640:	c3                   	ret    

00001641 <wait>:
SYSCALL(wait)
    1641:	b8 03 00 00 00       	mov    $0x3,%eax
    1646:	cd 40                	int    $0x40
    1648:	c3                   	ret    

00001649 <pipe>:
SYSCALL(pipe)
    1649:	b8 04 00 00 00       	mov    $0x4,%eax
    164e:	cd 40                	int    $0x40
    1650:	c3                   	ret    

00001651 <read>:
SYSCALL(read)
    1651:	b8 05 00 00 00       	mov    $0x5,%eax
    1656:	cd 40                	int    $0x40
    1658:	c3                   	ret    

00001659 <write>:
SYSCALL(write)
    1659:	b8 10 00 00 00       	mov    $0x10,%eax
    165e:	cd 40                	int    $0x40
    1660:	c3                   	ret    

00001661 <close>:
SYSCALL(close)
    1661:	b8 15 00 00 00       	mov    $0x15,%eax
    1666:	cd 40                	int    $0x40
    1668:	c3                   	ret    

00001669 <kill>:
SYSCALL(kill)
    1669:	b8 06 00 00 00       	mov    $0x6,%eax
    166e:	cd 40                	int    $0x40
    1670:	c3                   	ret    

00001671 <exec>:
SYSCALL(exec)
    1671:	b8 07 00 00 00       	mov    $0x7,%eax
    1676:	cd 40                	int    $0x40
    1678:	c3                   	ret    

00001679 <open>:
SYSCALL(open)
    1679:	b8 0f 00 00 00       	mov    $0xf,%eax
    167e:	cd 40                	int    $0x40
    1680:	c3                   	ret    

00001681 <mknod>:
SYSCALL(mknod)
    1681:	b8 11 00 00 00       	mov    $0x11,%eax
    1686:	cd 40                	int    $0x40
    1688:	c3                   	ret    

00001689 <unlink>:
SYSCALL(unlink)
    1689:	b8 12 00 00 00       	mov    $0x12,%eax
    168e:	cd 40                	int    $0x40
    1690:	c3                   	ret    

00001691 <fstat>:
SYSCALL(fstat)
    1691:	b8 08 00 00 00       	mov    $0x8,%eax
    1696:	cd 40                	int    $0x40
    1698:	c3                   	ret    

00001699 <link>:
SYSCALL(link)
    1699:	b8 13 00 00 00       	mov    $0x13,%eax
    169e:	cd 40                	int    $0x40
    16a0:	c3                   	ret    

000016a1 <mkdir>:
SYSCALL(mkdir)
    16a1:	b8 14 00 00 00       	mov    $0x14,%eax
    16a6:	cd 40                	int    $0x40
    16a8:	c3                   	ret    

000016a9 <chdir>:
SYSCALL(chdir)
    16a9:	b8 09 00 00 00       	mov    $0x9,%eax
    16ae:	cd 40                	int    $0x40
    16b0:	c3                   	ret    

000016b1 <dup>:
SYSCALL(dup)
    16b1:	b8 0a 00 00 00       	mov    $0xa,%eax
    16b6:	cd 40                	int    $0x40
    16b8:	c3                   	ret    

000016b9 <getpid>:
SYSCALL(getpid)
    16b9:	b8 0b 00 00 00       	mov    $0xb,%eax
    16be:	cd 40                	int    $0x40
    16c0:	c3                   	ret    

000016c1 <sbrk>:
SYSCALL(sbrk)
    16c1:	b8 0c 00 00 00       	mov    $0xc,%eax
    16c6:	cd 40                	int    $0x40
    16c8:	c3                   	ret    

000016c9 <sleep>:
SYSCALL(sleep)
    16c9:	b8 0d 00 00 00       	mov    $0xd,%eax
    16ce:	cd 40                	int    $0x40
    16d0:	c3                   	ret    

000016d1 <uptime>:
SYSCALL(uptime)
    16d1:	b8 0e 00 00 00       	mov    $0xe,%eax
    16d6:	cd 40                	int    $0x40
    16d8:	c3                   	ret    

000016d9 <getreadcount>:
SYSCALL(getreadcount)
    16d9:	b8 16 00 00 00       	mov    $0x16,%eax
    16de:	cd 40                	int    $0x40
    16e0:	c3                   	ret    

000016e1 <settickets>:
SYSCALL(settickets)
    16e1:	b8 17 00 00 00       	mov    $0x17,%eax
    16e6:	cd 40                	int    $0x40
    16e8:	c3                   	ret    

000016e9 <getpinfo>:
SYSCALL(getpinfo)
    16e9:	b8 18 00 00 00       	mov    $0x18,%eax
    16ee:	cd 40                	int    $0x40
    16f0:	c3                   	ret    

000016f1 <clone>:
SYSCALL(clone)
    16f1:	b8 19 00 00 00       	mov    $0x19,%eax
    16f6:	cd 40                	int    $0x40
    16f8:	c3                   	ret    

000016f9 <join>:
SYSCALL(join)
    16f9:	b8 1a 00 00 00       	mov    $0x1a,%eax
    16fe:	cd 40                	int    $0x40
    1700:	c3                   	ret    

00001701 <mprotect>:
SYSCALL(mprotect)
    1701:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1706:	cd 40                	int    $0x40
    1708:	c3                   	ret    

00001709 <munprotect>:
SYSCALL(munprotect)
    1709:	b8 1c 00 00 00       	mov    $0x1c,%eax
    170e:	cd 40                	int    $0x40
    1710:	c3                   	ret    
    1711:	66 90                	xchg   %ax,%ax
    1713:	66 90                	xchg   %ax,%ax
    1715:	66 90                	xchg   %ax,%ax
    1717:	66 90                	xchg   %ax,%ax
    1719:	66 90                	xchg   %ax,%ax
    171b:	66 90                	xchg   %ax,%ax
    171d:	66 90                	xchg   %ax,%ax
    171f:	90                   	nop

00001720 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1720:	55                   	push   %ebp
    1721:	89 e5                	mov    %esp,%ebp
    1723:	57                   	push   %edi
    1724:	56                   	push   %esi
    1725:	53                   	push   %ebx
    1726:	83 ec 3c             	sub    $0x3c,%esp
    1729:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    172c:	89 d1                	mov    %edx,%ecx
{
    172e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1731:	85 d2                	test   %edx,%edx
    1733:	0f 89 7f 00 00 00    	jns    17b8 <printint+0x98>
    1739:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    173d:	74 79                	je     17b8 <printint+0x98>
    neg = 1;
    173f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1746:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1748:	31 db                	xor    %ebx,%ebx
    174a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    174d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1750:	89 c8                	mov    %ecx,%eax
    1752:	31 d2                	xor    %edx,%edx
    1754:	89 cf                	mov    %ecx,%edi
    1756:	f7 75 c4             	divl   -0x3c(%ebp)
    1759:	0f b6 92 a4 1b 00 00 	movzbl 0x1ba4(%edx),%edx
    1760:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1763:	89 d8                	mov    %ebx,%eax
    1765:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1768:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    176b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    176e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1771:	76 dd                	jbe    1750 <printint+0x30>
  if(neg)
    1773:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1776:	85 c9                	test   %ecx,%ecx
    1778:	74 0c                	je     1786 <printint+0x66>
    buf[i++] = '-';
    177a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    177f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1781:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1786:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1789:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    178d:	eb 07                	jmp    1796 <printint+0x76>
    178f:	90                   	nop
    putc(fd, buf[i]);
    1790:	0f b6 13             	movzbl (%ebx),%edx
    1793:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1796:	83 ec 04             	sub    $0x4,%esp
    1799:	88 55 d7             	mov    %dl,-0x29(%ebp)
    179c:	6a 01                	push   $0x1
    179e:	56                   	push   %esi
    179f:	57                   	push   %edi
    17a0:	e8 b4 fe ff ff       	call   1659 <write>
  while(--i >= 0)
    17a5:	83 c4 10             	add    $0x10,%esp
    17a8:	39 de                	cmp    %ebx,%esi
    17aa:	75 e4                	jne    1790 <printint+0x70>
}
    17ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17af:	5b                   	pop    %ebx
    17b0:	5e                   	pop    %esi
    17b1:	5f                   	pop    %edi
    17b2:	5d                   	pop    %ebp
    17b3:	c3                   	ret    
    17b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    17b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    17bf:	eb 87                	jmp    1748 <printint+0x28>
    17c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17cf:	90                   	nop

000017d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    17d0:	55                   	push   %ebp
    17d1:	89 e5                	mov    %esp,%ebp
    17d3:	57                   	push   %edi
    17d4:	56                   	push   %esi
    17d5:	53                   	push   %ebx
    17d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    17d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    17dc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    17df:	0f b6 13             	movzbl (%ebx),%edx
    17e2:	84 d2                	test   %dl,%dl
    17e4:	74 6a                	je     1850 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    17e6:	8d 45 10             	lea    0x10(%ebp),%eax
    17e9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    17ec:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    17ef:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    17f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    17f4:	eb 36                	jmp    182c <printf+0x5c>
    17f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17fd:	8d 76 00             	lea    0x0(%esi),%esi
    1800:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1803:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1808:	83 f8 25             	cmp    $0x25,%eax
    180b:	74 15                	je     1822 <printf+0x52>
  write(fd, &c, 1);
    180d:	83 ec 04             	sub    $0x4,%esp
    1810:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1813:	6a 01                	push   $0x1
    1815:	57                   	push   %edi
    1816:	56                   	push   %esi
    1817:	e8 3d fe ff ff       	call   1659 <write>
    181c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    181f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1822:	0f b6 13             	movzbl (%ebx),%edx
    1825:	83 c3 01             	add    $0x1,%ebx
    1828:	84 d2                	test   %dl,%dl
    182a:	74 24                	je     1850 <printf+0x80>
    c = fmt[i] & 0xff;
    182c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    182f:	85 c9                	test   %ecx,%ecx
    1831:	74 cd                	je     1800 <printf+0x30>
      }
    } else if(state == '%'){
    1833:	83 f9 25             	cmp    $0x25,%ecx
    1836:	75 ea                	jne    1822 <printf+0x52>
      if(c == 'd'){
    1838:	83 f8 25             	cmp    $0x25,%eax
    183b:	0f 84 07 01 00 00    	je     1948 <printf+0x178>
    1841:	83 e8 63             	sub    $0x63,%eax
    1844:	83 f8 15             	cmp    $0x15,%eax
    1847:	77 17                	ja     1860 <printf+0x90>
    1849:	ff 24 85 4c 1b 00 00 	jmp    *0x1b4c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1850:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1853:	5b                   	pop    %ebx
    1854:	5e                   	pop    %esi
    1855:	5f                   	pop    %edi
    1856:	5d                   	pop    %ebp
    1857:	c3                   	ret    
    1858:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    185f:	90                   	nop
  write(fd, &c, 1);
    1860:	83 ec 04             	sub    $0x4,%esp
    1863:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1866:	6a 01                	push   $0x1
    1868:	57                   	push   %edi
    1869:	56                   	push   %esi
    186a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    186e:	e8 e6 fd ff ff       	call   1659 <write>
        putc(fd, c);
    1873:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1877:	83 c4 0c             	add    $0xc,%esp
    187a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    187d:	6a 01                	push   $0x1
    187f:	57                   	push   %edi
    1880:	56                   	push   %esi
    1881:	e8 d3 fd ff ff       	call   1659 <write>
        putc(fd, c);
    1886:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1889:	31 c9                	xor    %ecx,%ecx
    188b:	eb 95                	jmp    1822 <printf+0x52>
    188d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1890:	83 ec 0c             	sub    $0xc,%esp
    1893:	b9 10 00 00 00       	mov    $0x10,%ecx
    1898:	6a 00                	push   $0x0
    189a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    189d:	8b 10                	mov    (%eax),%edx
    189f:	89 f0                	mov    %esi,%eax
    18a1:	e8 7a fe ff ff       	call   1720 <printint>
        ap++;
    18a6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    18aa:	83 c4 10             	add    $0x10,%esp
      state = 0;
    18ad:	31 c9                	xor    %ecx,%ecx
    18af:	e9 6e ff ff ff       	jmp    1822 <printf+0x52>
    18b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    18b8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    18bb:	8b 10                	mov    (%eax),%edx
        ap++;
    18bd:	83 c0 04             	add    $0x4,%eax
    18c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    18c3:	85 d2                	test   %edx,%edx
    18c5:	0f 84 8d 00 00 00    	je     1958 <printf+0x188>
        while(*s != 0){
    18cb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    18ce:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    18d0:	84 c0                	test   %al,%al
    18d2:	0f 84 4a ff ff ff    	je     1822 <printf+0x52>
    18d8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    18db:	89 d3                	mov    %edx,%ebx
    18dd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    18e0:	83 ec 04             	sub    $0x4,%esp
          s++;
    18e3:	83 c3 01             	add    $0x1,%ebx
    18e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    18e9:	6a 01                	push   $0x1
    18eb:	57                   	push   %edi
    18ec:	56                   	push   %esi
    18ed:	e8 67 fd ff ff       	call   1659 <write>
        while(*s != 0){
    18f2:	0f b6 03             	movzbl (%ebx),%eax
    18f5:	83 c4 10             	add    $0x10,%esp
    18f8:	84 c0                	test   %al,%al
    18fa:	75 e4                	jne    18e0 <printf+0x110>
      state = 0;
    18fc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    18ff:	31 c9                	xor    %ecx,%ecx
    1901:	e9 1c ff ff ff       	jmp    1822 <printf+0x52>
    1906:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    190d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1910:	83 ec 0c             	sub    $0xc,%esp
    1913:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1918:	6a 01                	push   $0x1
    191a:	e9 7b ff ff ff       	jmp    189a <printf+0xca>
    191f:	90                   	nop
        putc(fd, *ap);
    1920:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1923:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1926:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1928:	6a 01                	push   $0x1
    192a:	57                   	push   %edi
    192b:	56                   	push   %esi
        putc(fd, *ap);
    192c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    192f:	e8 25 fd ff ff       	call   1659 <write>
        ap++;
    1934:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1938:	83 c4 10             	add    $0x10,%esp
      state = 0;
    193b:	31 c9                	xor    %ecx,%ecx
    193d:	e9 e0 fe ff ff       	jmp    1822 <printf+0x52>
    1942:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1948:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    194b:	83 ec 04             	sub    $0x4,%esp
    194e:	e9 2a ff ff ff       	jmp    187d <printf+0xad>
    1953:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1957:	90                   	nop
          s = "(null)";
    1958:	ba 45 1b 00 00       	mov    $0x1b45,%edx
        while(*s != 0){
    195d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1960:	b8 28 00 00 00       	mov    $0x28,%eax
    1965:	89 d3                	mov    %edx,%ebx
    1967:	e9 74 ff ff ff       	jmp    18e0 <printf+0x110>
    196c:	66 90                	xchg   %ax,%ax
    196e:	66 90                	xchg   %ax,%ax

00001970 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1970:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1971:	a1 84 1f 00 00       	mov    0x1f84,%eax
{
    1976:	89 e5                	mov    %esp,%ebp
    1978:	57                   	push   %edi
    1979:	56                   	push   %esi
    197a:	53                   	push   %ebx
    197b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    197e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1981:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1988:	89 c2                	mov    %eax,%edx
    198a:	8b 00                	mov    (%eax),%eax
    198c:	39 ca                	cmp    %ecx,%edx
    198e:	73 30                	jae    19c0 <free+0x50>
    1990:	39 c1                	cmp    %eax,%ecx
    1992:	72 04                	jb     1998 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1994:	39 c2                	cmp    %eax,%edx
    1996:	72 f0                	jb     1988 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1998:	8b 73 fc             	mov    -0x4(%ebx),%esi
    199b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    199e:	39 f8                	cmp    %edi,%eax
    19a0:	74 30                	je     19d2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    19a2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    19a5:	8b 42 04             	mov    0x4(%edx),%eax
    19a8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    19ab:	39 f1                	cmp    %esi,%ecx
    19ad:	74 3a                	je     19e9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    19af:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    19b1:	5b                   	pop    %ebx
  freep = p;
    19b2:	89 15 84 1f 00 00    	mov    %edx,0x1f84
}
    19b8:	5e                   	pop    %esi
    19b9:	5f                   	pop    %edi
    19ba:	5d                   	pop    %ebp
    19bb:	c3                   	ret    
    19bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    19c0:	39 c2                	cmp    %eax,%edx
    19c2:	72 c4                	jb     1988 <free+0x18>
    19c4:	39 c1                	cmp    %eax,%ecx
    19c6:	73 c0                	jae    1988 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    19c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    19cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    19ce:	39 f8                	cmp    %edi,%eax
    19d0:	75 d0                	jne    19a2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    19d2:	03 70 04             	add    0x4(%eax),%esi
    19d5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    19d8:	8b 02                	mov    (%edx),%eax
    19da:	8b 00                	mov    (%eax),%eax
    19dc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    19df:	8b 42 04             	mov    0x4(%edx),%eax
    19e2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    19e5:	39 f1                	cmp    %esi,%ecx
    19e7:	75 c6                	jne    19af <free+0x3f>
    p->s.size += bp->s.size;
    19e9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    19ec:	89 15 84 1f 00 00    	mov    %edx,0x1f84
    p->s.size += bp->s.size;
    19f2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    19f5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    19f8:	89 0a                	mov    %ecx,(%edx)
}
    19fa:	5b                   	pop    %ebx
    19fb:	5e                   	pop    %esi
    19fc:	5f                   	pop    %edi
    19fd:	5d                   	pop    %ebp
    19fe:	c3                   	ret    
    19ff:	90                   	nop

00001a00 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1a00:	55                   	push   %ebp
    1a01:	89 e5                	mov    %esp,%ebp
    1a03:	57                   	push   %edi
    1a04:	56                   	push   %esi
    1a05:	53                   	push   %ebx
    1a06:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a09:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1a0c:	8b 3d 84 1f 00 00    	mov    0x1f84,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a12:	8d 70 07             	lea    0x7(%eax),%esi
    1a15:	c1 ee 03             	shr    $0x3,%esi
    1a18:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    1a1b:	85 ff                	test   %edi,%edi
    1a1d:	0f 84 9d 00 00 00    	je     1ac0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a23:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1a25:	8b 4a 04             	mov    0x4(%edx),%ecx
    1a28:	39 f1                	cmp    %esi,%ecx
    1a2a:	73 6a                	jae    1a96 <malloc+0x96>
    1a2c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1a31:	39 de                	cmp    %ebx,%esi
    1a33:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1a36:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    1a3d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1a40:	eb 17                	jmp    1a59 <malloc+0x59>
    1a42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a48:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1a4a:	8b 48 04             	mov    0x4(%eax),%ecx
    1a4d:	39 f1                	cmp    %esi,%ecx
    1a4f:	73 4f                	jae    1aa0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1a51:	8b 3d 84 1f 00 00    	mov    0x1f84,%edi
    1a57:	89 c2                	mov    %eax,%edx
    1a59:	39 d7                	cmp    %edx,%edi
    1a5b:	75 eb                	jne    1a48 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    1a5d:	83 ec 0c             	sub    $0xc,%esp
    1a60:	ff 75 e4             	push   -0x1c(%ebp)
    1a63:	e8 59 fc ff ff       	call   16c1 <sbrk>
  if(p == (char*)-1)
    1a68:	83 c4 10             	add    $0x10,%esp
    1a6b:	83 f8 ff             	cmp    $0xffffffff,%eax
    1a6e:	74 1c                	je     1a8c <malloc+0x8c>
  hp->s.size = nu;
    1a70:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1a73:	83 ec 0c             	sub    $0xc,%esp
    1a76:	83 c0 08             	add    $0x8,%eax
    1a79:	50                   	push   %eax
    1a7a:	e8 f1 fe ff ff       	call   1970 <free>
  return freep;
    1a7f:	8b 15 84 1f 00 00    	mov    0x1f84,%edx
      if((p = morecore(nunits)) == 0)
    1a85:	83 c4 10             	add    $0x10,%esp
    1a88:	85 d2                	test   %edx,%edx
    1a8a:	75 bc                	jne    1a48 <malloc+0x48>
        return 0;
  }
}
    1a8c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1a8f:	31 c0                	xor    %eax,%eax
}
    1a91:	5b                   	pop    %ebx
    1a92:	5e                   	pop    %esi
    1a93:	5f                   	pop    %edi
    1a94:	5d                   	pop    %ebp
    1a95:	c3                   	ret    
    if(p->s.size >= nunits){
    1a96:	89 d0                	mov    %edx,%eax
    1a98:	89 fa                	mov    %edi,%edx
    1a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1aa0:	39 ce                	cmp    %ecx,%esi
    1aa2:	74 4c                	je     1af0 <malloc+0xf0>
        p->s.size -= nunits;
    1aa4:	29 f1                	sub    %esi,%ecx
    1aa6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1aa9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1aac:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    1aaf:	89 15 84 1f 00 00    	mov    %edx,0x1f84
}
    1ab5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1ab8:	83 c0 08             	add    $0x8,%eax
}
    1abb:	5b                   	pop    %ebx
    1abc:	5e                   	pop    %esi
    1abd:	5f                   	pop    %edi
    1abe:	5d                   	pop    %ebp
    1abf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1ac0:	c7 05 84 1f 00 00 88 	movl   $0x1f88,0x1f84
    1ac7:	1f 00 00 
    base.s.size = 0;
    1aca:	bf 88 1f 00 00       	mov    $0x1f88,%edi
    base.s.ptr = freep = prevp = &base;
    1acf:	c7 05 88 1f 00 00 88 	movl   $0x1f88,0x1f88
    1ad6:	1f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1ad9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    1adb:	c7 05 8c 1f 00 00 00 	movl   $0x0,0x1f8c
    1ae2:	00 00 00 
    if(p->s.size >= nunits){
    1ae5:	e9 42 ff ff ff       	jmp    1a2c <malloc+0x2c>
    1aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1af0:	8b 08                	mov    (%eax),%ecx
    1af2:	89 0a                	mov    %ecx,(%edx)
    1af4:	eb b9                	jmp    1aaf <malloc+0xaf>
