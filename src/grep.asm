
_grep:     file format elf32-i386


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
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	83 ec 18             	sub    $0x18,%esp
    1014:	8b 01                	mov    (%ecx),%eax
    1016:	8b 59 04             	mov    0x4(%ecx),%ebx
    1019:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
    101c:	83 f8 01             	cmp    $0x1,%eax
    101f:	7e 6f                	jle    1090 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
    1021:	8b 43 04             	mov    0x4(%ebx),%eax
    1024:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
    1027:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
    102b:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
    1030:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
    1033:	75 2d                	jne    1062 <main+0x62>
    1035:	eb 6c                	jmp    10a3 <main+0xa3>
    1037:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    103e:	66 90                	xchg   %ax,%ax
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
    1040:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
    1043:	83 c6 01             	add    $0x1,%esi
    1046:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
    1049:	50                   	push   %eax
    104a:	ff 75 e0             	push   -0x20(%ebp)
    104d:	e8 7e 01 00 00       	call   11d0 <grep>
    close(fd);
    1052:	89 3c 24             	mov    %edi,(%esp)
    1055:	e8 37 06 00 00       	call   1691 <close>
  for(i = 2; i < argc; i++){
    105a:	83 c4 10             	add    $0x10,%esp
    105d:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1060:	7e 29                	jle    108b <main+0x8b>
    if((fd = open(argv[i], 0)) < 0){
    1062:	83 ec 08             	sub    $0x8,%esp
    1065:	6a 00                	push   $0x0
    1067:	ff 33                	push   (%ebx)
    1069:	e8 3b 06 00 00       	call   16a9 <open>
    106e:	83 c4 10             	add    $0x10,%esp
    1071:	89 c7                	mov    %eax,%edi
    1073:	85 c0                	test   %eax,%eax
    1075:	79 c9                	jns    1040 <main+0x40>
      printf(1, "grep: cannot open %s\n", argv[i]);
    1077:	50                   	push   %eax
    1078:	ff 33                	push   (%ebx)
    107a:	68 48 1b 00 00       	push   $0x1b48
    107f:	6a 01                	push   $0x1
    1081:	e8 7a 07 00 00       	call   1800 <printf>
      exit();
    1086:	e8 de 05 00 00       	call   1669 <exit>
  }
  exit();
    108b:	e8 d9 05 00 00       	call   1669 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
    1090:	51                   	push   %ecx
    1091:	51                   	push   %ecx
    1092:	68 28 1b 00 00       	push   $0x1b28
    1097:	6a 02                	push   $0x2
    1099:	e8 62 07 00 00       	call   1800 <printf>
    exit();
    109e:	e8 c6 05 00 00       	call   1669 <exit>
    grep(pattern, 0);
    10a3:	52                   	push   %edx
    10a4:	52                   	push   %edx
    10a5:	6a 00                	push   $0x0
    10a7:	50                   	push   %eax
    10a8:	e8 23 01 00 00       	call   11d0 <grep>
    exit();
    10ad:	e8 b7 05 00 00       	call   1669 <exit>
    10b2:	66 90                	xchg   %ax,%ax
    10b4:	66 90                	xchg   %ax,%ax
    10b6:	66 90                	xchg   %ax,%ax
    10b8:	66 90                	xchg   %ax,%ax
    10ba:	66 90                	xchg   %ax,%ax
    10bc:	66 90                	xchg   %ax,%ax
    10be:	66 90                	xchg   %ax,%ax

000010c0 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	57                   	push   %edi
    10c4:	56                   	push   %esi
    10c5:	53                   	push   %ebx
    10c6:	83 ec 0c             	sub    $0xc,%esp
    10c9:	8b 75 08             	mov    0x8(%ebp),%esi
    10cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
    10cf:	0f b6 06             	movzbl (%esi),%eax
    10d2:	84 c0                	test   %al,%al
    10d4:	75 2d                	jne    1103 <matchhere+0x43>
    10d6:	e9 7d 00 00 00       	jmp    1158 <matchhere+0x98>
    10db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10df:	90                   	nop
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
    10e0:	0f b6 0f             	movzbl (%edi),%ecx
  if(re[0] == '$' && re[1] == '\0')
    10e3:	80 fb 24             	cmp    $0x24,%bl
    10e6:	75 04                	jne    10ec <matchhere+0x2c>
    10e8:	84 c0                	test   %al,%al
    10ea:	74 79                	je     1165 <matchhere+0xa5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    10ec:	84 c9                	test   %cl,%cl
    10ee:	74 58                	je     1148 <matchhere+0x88>
    10f0:	38 d9                	cmp    %bl,%cl
    10f2:	74 05                	je     10f9 <matchhere+0x39>
    10f4:	80 fb 2e             	cmp    $0x2e,%bl
    10f7:	75 4f                	jne    1148 <matchhere+0x88>
    return matchhere(re+1, text+1);
    10f9:	83 c7 01             	add    $0x1,%edi
    10fc:	83 c6 01             	add    $0x1,%esi
  if(re[0] == '\0')
    10ff:	84 c0                	test   %al,%al
    1101:	74 55                	je     1158 <matchhere+0x98>
  if(re[1] == '*')
    1103:	0f be d8             	movsbl %al,%ebx
    1106:	0f b6 46 01          	movzbl 0x1(%esi),%eax
    110a:	3c 2a                	cmp    $0x2a,%al
    110c:	75 d2                	jne    10e0 <matchhere+0x20>
    return matchstar(re[0], re+2, text);
    110e:	83 c6 02             	add    $0x2,%esi
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
    1111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
    1118:	83 ec 08             	sub    $0x8,%esp
    111b:	57                   	push   %edi
    111c:	56                   	push   %esi
    111d:	e8 9e ff ff ff       	call   10c0 <matchhere>
    1122:	83 c4 10             	add    $0x10,%esp
    1125:	85 c0                	test   %eax,%eax
    1127:	75 2f                	jne    1158 <matchhere+0x98>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
    1129:	0f be 17             	movsbl (%edi),%edx
    112c:	84 d2                	test   %dl,%dl
    112e:	74 0c                	je     113c <matchhere+0x7c>
    1130:	83 c7 01             	add    $0x1,%edi
    1133:	83 fb 2e             	cmp    $0x2e,%ebx
    1136:	74 e0                	je     1118 <matchhere+0x58>
    1138:	39 da                	cmp    %ebx,%edx
    113a:	74 dc                	je     1118 <matchhere+0x58>
}
    113c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    113f:	5b                   	pop    %ebx
    1140:	5e                   	pop    %esi
    1141:	5f                   	pop    %edi
    1142:	5d                   	pop    %ebp
    1143:	c3                   	ret    
    1144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1148:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
    114b:	31 c0                	xor    %eax,%eax
}
    114d:	5b                   	pop    %ebx
    114e:	5e                   	pop    %esi
    114f:	5f                   	pop    %edi
    1150:	5d                   	pop    %ebp
    1151:	c3                   	ret    
    1152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1158:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 1;
    115b:	b8 01 00 00 00       	mov    $0x1,%eax
}
    1160:	5b                   	pop    %ebx
    1161:	5e                   	pop    %esi
    1162:	5f                   	pop    %edi
    1163:	5d                   	pop    %ebp
    1164:	c3                   	ret    
    return *text == '\0';
    1165:	31 c0                	xor    %eax,%eax
    1167:	84 c9                	test   %cl,%cl
    1169:	0f 94 c0             	sete   %al
    116c:	eb ce                	jmp    113c <matchhere+0x7c>
    116e:	66 90                	xchg   %ax,%ax

00001170 <match>:
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	56                   	push   %esi
    1174:	53                   	push   %ebx
    1175:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1178:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
    117b:	80 3b 5e             	cmpb   $0x5e,(%ebx)
    117e:	75 11                	jne    1191 <match+0x21>
    1180:	eb 2e                	jmp    11b0 <match+0x40>
    1182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
    1188:	83 c6 01             	add    $0x1,%esi
    118b:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
    118f:	74 16                	je     11a7 <match+0x37>
    if(matchhere(re, text))
    1191:	83 ec 08             	sub    $0x8,%esp
    1194:	56                   	push   %esi
    1195:	53                   	push   %ebx
    1196:	e8 25 ff ff ff       	call   10c0 <matchhere>
    119b:	83 c4 10             	add    $0x10,%esp
    119e:	85 c0                	test   %eax,%eax
    11a0:	74 e6                	je     1188 <match+0x18>
      return 1;
    11a2:	b8 01 00 00 00       	mov    $0x1,%eax
}
    11a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11aa:	5b                   	pop    %ebx
    11ab:	5e                   	pop    %esi
    11ac:	5d                   	pop    %ebp
    11ad:	c3                   	ret    
    11ae:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
    11b0:	83 c3 01             	add    $0x1,%ebx
    11b3:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
    11b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11b9:	5b                   	pop    %ebx
    11ba:	5e                   	pop    %esi
    11bb:	5d                   	pop    %ebp
    return matchhere(re+1, text);
    11bc:	e9 ff fe ff ff       	jmp    10c0 <matchhere>
    11c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11cf:	90                   	nop

000011d0 <grep>:
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	57                   	push   %edi
    11d4:	56                   	push   %esi
    11d5:	53                   	push   %ebx
    11d6:	83 ec 1c             	sub    $0x1c,%esp
    11d9:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
    11dc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    return matchhere(re+1, text);
    11e3:	8d 47 01             	lea    0x1(%edi),%eax
    11e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    11e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
    11f0:	8b 4d dc             	mov    -0x24(%ebp),%ecx
    11f3:	b8 ff 03 00 00       	mov    $0x3ff,%eax
    11f8:	83 ec 04             	sub    $0x4,%esp
    11fb:	29 c8                	sub    %ecx,%eax
    11fd:	50                   	push   %eax
    11fe:	8d 81 00 20 00 00    	lea    0x2000(%ecx),%eax
    1204:	50                   	push   %eax
    1205:	ff 75 0c             	push   0xc(%ebp)
    1208:	e8 74 04 00 00       	call   1681 <read>
    120d:	83 c4 10             	add    $0x10,%esp
    1210:	85 c0                	test   %eax,%eax
    1212:	0f 8e e5 00 00 00    	jle    12fd <grep+0x12d>
    m += n;
    1218:	01 45 dc             	add    %eax,-0x24(%ebp)
    121b:	8b 4d dc             	mov    -0x24(%ebp),%ecx
    p = buf;
    121e:	c7 45 e4 00 20 00 00 	movl   $0x2000,-0x1c(%ebp)
    buf[m] = '\0';
    1225:	c6 81 00 20 00 00 00 	movb   $0x0,0x2000(%ecx)
    while((q = strchr(p, '\n')) != 0){
    122c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1230:	83 ec 08             	sub    $0x8,%esp
    1233:	6a 0a                	push   $0xa
    1235:	ff 75 e4             	push   -0x1c(%ebp)
    1238:	e8 13 02 00 00       	call   1450 <strchr>
    123d:	83 c4 10             	add    $0x10,%esp
    1240:	89 c3                	mov    %eax,%ebx
    1242:	85 c0                	test   %eax,%eax
    1244:	74 72                	je     12b8 <grep+0xe8>
      *q = 0;
    1246:	c6 03 00             	movb   $0x0,(%ebx)
        write(1, p, q+1 - p);
    1249:	8d 43 01             	lea    0x1(%ebx),%eax
  if(re[0] == '^')
    124c:	80 3f 5e             	cmpb   $0x5e,(%edi)
        write(1, p, q+1 - p);
    124f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1252:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  if(re[0] == '^')
    1255:	75 12                	jne    1269 <grep+0x99>
    1257:	eb 47                	jmp    12a0 <grep+0xd0>
    1259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }while(*text++ != '\0');
    1260:	83 c6 01             	add    $0x1,%esi
    1263:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
    1267:	74 2b                	je     1294 <grep+0xc4>
    if(matchhere(re, text))
    1269:	83 ec 08             	sub    $0x8,%esp
    126c:	56                   	push   %esi
    126d:	57                   	push   %edi
    126e:	e8 4d fe ff ff       	call   10c0 <matchhere>
    1273:	83 c4 10             	add    $0x10,%esp
    1276:	85 c0                	test   %eax,%eax
    1278:	74 e6                	je     1260 <grep+0x90>
        write(1, p, q+1 - p);
    127a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    127d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1280:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
    1283:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
    1286:	29 d0                	sub    %edx,%eax
    1288:	50                   	push   %eax
    1289:	52                   	push   %edx
    128a:	6a 01                	push   $0x1
    128c:	e8 f8 03 00 00       	call   1689 <write>
    1291:	83 c4 10             	add    $0x10,%esp
      p = q+1;
    1294:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1297:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    129a:	eb 94                	jmp    1230 <grep+0x60>
    129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return matchhere(re+1, text);
    12a0:	83 ec 08             	sub    $0x8,%esp
    12a3:	56                   	push   %esi
    12a4:	ff 75 d8             	push   -0x28(%ebp)
    12a7:	e8 14 fe ff ff       	call   10c0 <matchhere>
    12ac:	83 c4 10             	add    $0x10,%esp
      if(match(pattern, p)){
    12af:	85 c0                	test   %eax,%eax
    12b1:	74 e1                	je     1294 <grep+0xc4>
    12b3:	eb c5                	jmp    127a <grep+0xaa>
    12b5:	8d 76 00             	lea    0x0(%esi),%esi
    if(p == buf)
    12b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    12bb:	81 fa 00 20 00 00    	cmp    $0x2000,%edx
    12c1:	74 2e                	je     12f1 <grep+0x121>
    if(m > 0){
    12c3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
    12c6:	85 c9                	test   %ecx,%ecx
    12c8:	0f 8e 22 ff ff ff    	jle    11f0 <grep+0x20>
      m -= p - buf;
    12ce:	89 d0                	mov    %edx,%eax
      memmove(buf, p, m);
    12d0:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
    12d3:	2d 00 20 00 00       	sub    $0x2000,%eax
    12d8:	29 c1                	sub    %eax,%ecx
      memmove(buf, p, m);
    12da:	51                   	push   %ecx
    12db:	52                   	push   %edx
    12dc:	68 00 20 00 00       	push   $0x2000
      m -= p - buf;
    12e1:	89 4d dc             	mov    %ecx,-0x24(%ebp)
      memmove(buf, p, m);
    12e4:	e8 a7 02 00 00       	call   1590 <memmove>
    12e9:	83 c4 10             	add    $0x10,%esp
    12ec:	e9 ff fe ff ff       	jmp    11f0 <grep+0x20>
      m = 0;
    12f1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    12f8:	e9 f3 fe ff ff       	jmp    11f0 <grep+0x20>
}
    12fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1300:	5b                   	pop    %ebx
    1301:	5e                   	pop    %esi
    1302:	5f                   	pop    %edi
    1303:	5d                   	pop    %ebp
    1304:	c3                   	ret    
    1305:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001310 <matchstar>:
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	57                   	push   %edi
    1314:	56                   	push   %esi
    1315:	53                   	push   %ebx
    1316:	83 ec 0c             	sub    $0xc,%esp
    1319:	8b 5d 08             	mov    0x8(%ebp),%ebx
    131c:	8b 75 0c             	mov    0xc(%ebp),%esi
    131f:	8b 7d 10             	mov    0x10(%ebp),%edi
    1322:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(matchhere(re, text))
    1328:	83 ec 08             	sub    $0x8,%esp
    132b:	57                   	push   %edi
    132c:	56                   	push   %esi
    132d:	e8 8e fd ff ff       	call   10c0 <matchhere>
    1332:	83 c4 10             	add    $0x10,%esp
    1335:	85 c0                	test   %eax,%eax
    1337:	75 1f                	jne    1358 <matchstar+0x48>
  }while(*text!='\0' && (*text++==c || c=='.'));
    1339:	0f be 17             	movsbl (%edi),%edx
    133c:	84 d2                	test   %dl,%dl
    133e:	74 0c                	je     134c <matchstar+0x3c>
    1340:	83 c7 01             	add    $0x1,%edi
    1343:	39 da                	cmp    %ebx,%edx
    1345:	74 e1                	je     1328 <matchstar+0x18>
    1347:	83 fb 2e             	cmp    $0x2e,%ebx
    134a:	74 dc                	je     1328 <matchstar+0x18>
}
    134c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    134f:	5b                   	pop    %ebx
    1350:	5e                   	pop    %esi
    1351:	5f                   	pop    %edi
    1352:	5d                   	pop    %ebp
    1353:	c3                   	ret    
    1354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1358:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
    135b:	b8 01 00 00 00       	mov    $0x1,%eax
}
    1360:	5b                   	pop    %ebx
    1361:	5e                   	pop    %esi
    1362:	5f                   	pop    %edi
    1363:	5d                   	pop    %ebp
    1364:	c3                   	ret    
    1365:	66 90                	xchg   %ax,%ax
    1367:	66 90                	xchg   %ax,%ax
    1369:	66 90                	xchg   %ax,%ax
    136b:	66 90                	xchg   %ax,%ax
    136d:	66 90                	xchg   %ax,%ax
    136f:	90                   	nop

00001370 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    1370:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1371:	31 c0                	xor    %eax,%eax
{
    1373:	89 e5                	mov    %esp,%ebp
    1375:	53                   	push   %ebx
    1376:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1379:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    137c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1380:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1384:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1387:	83 c0 01             	add    $0x1,%eax
    138a:	84 d2                	test   %dl,%dl
    138c:	75 f2                	jne    1380 <strcpy+0x10>
    ;
  return os;
}
    138e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1391:	89 c8                	mov    %ecx,%eax
    1393:	c9                   	leave  
    1394:	c3                   	ret    
    1395:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	53                   	push   %ebx
    13a4:	8b 55 08             	mov    0x8(%ebp),%edx
    13a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    13aa:	0f b6 02             	movzbl (%edx),%eax
    13ad:	84 c0                	test   %al,%al
    13af:	75 17                	jne    13c8 <strcmp+0x28>
    13b1:	eb 3a                	jmp    13ed <strcmp+0x4d>
    13b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13b7:	90                   	nop
    13b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    13bc:	83 c2 01             	add    $0x1,%edx
    13bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    13c2:	84 c0                	test   %al,%al
    13c4:	74 1a                	je     13e0 <strcmp+0x40>
    p++, q++;
    13c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    13c8:	0f b6 19             	movzbl (%ecx),%ebx
    13cb:	38 c3                	cmp    %al,%bl
    13cd:	74 e9                	je     13b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    13cf:	29 d8                	sub    %ebx,%eax
}
    13d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13d4:	c9                   	leave  
    13d5:	c3                   	ret    
    13d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    13e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    13e4:	31 c0                	xor    %eax,%eax
    13e6:	29 d8                	sub    %ebx,%eax
}
    13e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13eb:	c9                   	leave  
    13ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    13ed:	0f b6 19             	movzbl (%ecx),%ebx
    13f0:	31 c0                	xor    %eax,%eax
    13f2:	eb db                	jmp    13cf <strcmp+0x2f>
    13f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13ff:	90                   	nop

00001400 <strlen>:

uint
strlen(const char *s)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1406:	80 3a 00             	cmpb   $0x0,(%edx)
    1409:	74 15                	je     1420 <strlen+0x20>
    140b:	31 c0                	xor    %eax,%eax
    140d:	8d 76 00             	lea    0x0(%esi),%esi
    1410:	83 c0 01             	add    $0x1,%eax
    1413:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1417:	89 c1                	mov    %eax,%ecx
    1419:	75 f5                	jne    1410 <strlen+0x10>
    ;
  return n;
}
    141b:	89 c8                	mov    %ecx,%eax
    141d:	5d                   	pop    %ebp
    141e:	c3                   	ret    
    141f:	90                   	nop
  for(n = 0; s[n]; n++)
    1420:	31 c9                	xor    %ecx,%ecx
}
    1422:	5d                   	pop    %ebp
    1423:	89 c8                	mov    %ecx,%eax
    1425:	c3                   	ret    
    1426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    142d:	8d 76 00             	lea    0x0(%esi),%esi

00001430 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	57                   	push   %edi
    1434:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1437:	8b 4d 10             	mov    0x10(%ebp),%ecx
    143a:	8b 45 0c             	mov    0xc(%ebp),%eax
    143d:	89 d7                	mov    %edx,%edi
    143f:	fc                   	cld    
    1440:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1442:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1445:	89 d0                	mov    %edx,%eax
    1447:	c9                   	leave  
    1448:	c3                   	ret    
    1449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001450 <strchr>:

char*
strchr(const char *s, char c)
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	8b 45 08             	mov    0x8(%ebp),%eax
    1456:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    145a:	0f b6 10             	movzbl (%eax),%edx
    145d:	84 d2                	test   %dl,%dl
    145f:	75 12                	jne    1473 <strchr+0x23>
    1461:	eb 1d                	jmp    1480 <strchr+0x30>
    1463:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1467:	90                   	nop
    1468:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    146c:	83 c0 01             	add    $0x1,%eax
    146f:	84 d2                	test   %dl,%dl
    1471:	74 0d                	je     1480 <strchr+0x30>
    if(*s == c)
    1473:	38 d1                	cmp    %dl,%cl
    1475:	75 f1                	jne    1468 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1477:	5d                   	pop    %ebp
    1478:	c3                   	ret    
    1479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1480:	31 c0                	xor    %eax,%eax
}
    1482:	5d                   	pop    %ebp
    1483:	c3                   	ret    
    1484:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    148b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    148f:	90                   	nop

00001490 <gets>:

char*
gets(char *buf, int max)
{
    1490:	55                   	push   %ebp
    1491:	89 e5                	mov    %esp,%ebp
    1493:	57                   	push   %edi
    1494:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1495:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1498:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1499:	31 db                	xor    %ebx,%ebx
{
    149b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    149e:	eb 27                	jmp    14c7 <gets+0x37>
    cc = read(0, &c, 1);
    14a0:	83 ec 04             	sub    $0x4,%esp
    14a3:	6a 01                	push   $0x1
    14a5:	57                   	push   %edi
    14a6:	6a 00                	push   $0x0
    14a8:	e8 d4 01 00 00       	call   1681 <read>
    if(cc < 1)
    14ad:	83 c4 10             	add    $0x10,%esp
    14b0:	85 c0                	test   %eax,%eax
    14b2:	7e 1d                	jle    14d1 <gets+0x41>
      break;
    buf[i++] = c;
    14b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    14b8:	8b 55 08             	mov    0x8(%ebp),%edx
    14bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    14bf:	3c 0a                	cmp    $0xa,%al
    14c1:	74 1d                	je     14e0 <gets+0x50>
    14c3:	3c 0d                	cmp    $0xd,%al
    14c5:	74 19                	je     14e0 <gets+0x50>
  for(i=0; i+1 < max; ){
    14c7:	89 de                	mov    %ebx,%esi
    14c9:	83 c3 01             	add    $0x1,%ebx
    14cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    14cf:	7c cf                	jl     14a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    14d1:	8b 45 08             	mov    0x8(%ebp),%eax
    14d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    14d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14db:	5b                   	pop    %ebx
    14dc:	5e                   	pop    %esi
    14dd:	5f                   	pop    %edi
    14de:	5d                   	pop    %ebp
    14df:	c3                   	ret    
  buf[i] = '\0';
    14e0:	8b 45 08             	mov    0x8(%ebp),%eax
    14e3:	89 de                	mov    %ebx,%esi
    14e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    14e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14ec:	5b                   	pop    %ebx
    14ed:	5e                   	pop    %esi
    14ee:	5f                   	pop    %edi
    14ef:	5d                   	pop    %ebp
    14f0:	c3                   	ret    
    14f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ff:	90                   	nop

00001500 <stat>:

int
stat(const char *n, struct stat *st)
{
    1500:	55                   	push   %ebp
    1501:	89 e5                	mov    %esp,%ebp
    1503:	56                   	push   %esi
    1504:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1505:	83 ec 08             	sub    $0x8,%esp
    1508:	6a 00                	push   $0x0
    150a:	ff 75 08             	push   0x8(%ebp)
    150d:	e8 97 01 00 00       	call   16a9 <open>
  if(fd < 0)
    1512:	83 c4 10             	add    $0x10,%esp
    1515:	85 c0                	test   %eax,%eax
    1517:	78 27                	js     1540 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1519:	83 ec 08             	sub    $0x8,%esp
    151c:	ff 75 0c             	push   0xc(%ebp)
    151f:	89 c3                	mov    %eax,%ebx
    1521:	50                   	push   %eax
    1522:	e8 9a 01 00 00       	call   16c1 <fstat>
  close(fd);
    1527:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    152a:	89 c6                	mov    %eax,%esi
  close(fd);
    152c:	e8 60 01 00 00       	call   1691 <close>
  return r;
    1531:	83 c4 10             	add    $0x10,%esp
}
    1534:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1537:	89 f0                	mov    %esi,%eax
    1539:	5b                   	pop    %ebx
    153a:	5e                   	pop    %esi
    153b:	5d                   	pop    %ebp
    153c:	c3                   	ret    
    153d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1540:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1545:	eb ed                	jmp    1534 <stat+0x34>
    1547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    154e:	66 90                	xchg   %ax,%ax

00001550 <atoi>:

int
atoi(const char *s)
{
    1550:	55                   	push   %ebp
    1551:	89 e5                	mov    %esp,%ebp
    1553:	53                   	push   %ebx
    1554:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1557:	0f be 02             	movsbl (%edx),%eax
    155a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    155d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1560:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1565:	77 1e                	ja     1585 <atoi+0x35>
    1567:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    156e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1570:	83 c2 01             	add    $0x1,%edx
    1573:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1576:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    157a:	0f be 02             	movsbl (%edx),%eax
    157d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1580:	80 fb 09             	cmp    $0x9,%bl
    1583:	76 eb                	jbe    1570 <atoi+0x20>
  return n;
}
    1585:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1588:	89 c8                	mov    %ecx,%eax
    158a:	c9                   	leave  
    158b:	c3                   	ret    
    158c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001590 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    1593:	57                   	push   %edi
    1594:	8b 45 10             	mov    0x10(%ebp),%eax
    1597:	8b 55 08             	mov    0x8(%ebp),%edx
    159a:	56                   	push   %esi
    159b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    159e:	85 c0                	test   %eax,%eax
    15a0:	7e 13                	jle    15b5 <memmove+0x25>
    15a2:	01 d0                	add    %edx,%eax
  dst = vdst;
    15a4:	89 d7                	mov    %edx,%edi
    15a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    15b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    15b1:	39 f8                	cmp    %edi,%eax
    15b3:	75 fb                	jne    15b0 <memmove+0x20>
  return vdst;
}
    15b5:	5e                   	pop    %esi
    15b6:	89 d0                	mov    %edx,%eax
    15b8:	5f                   	pop    %edi
    15b9:	5d                   	pop    %ebp
    15ba:	c3                   	ret    
    15bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15bf:	90                   	nop

000015c0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    15c0:	55                   	push   %ebp
    15c1:	89 e5                	mov    %esp,%ebp
    15c3:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    15c6:	68 00 10 00 00       	push   $0x1000
    15cb:	e8 60 04 00 00       	call   1a30 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    15d0:	50                   	push   %eax
    15d1:	ff 75 10             	push   0x10(%ebp)
    15d4:	ff 75 0c             	push   0xc(%ebp)
    15d7:	ff 75 08             	push   0x8(%ebp)
    15da:	e8 42 01 00 00       	call   1721 <clone>
}
    15df:	c9                   	leave  
    15e0:	c3                   	ret    
    15e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15ef:	90                   	nop

000015f0 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    15f0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    15f1:	b9 01 00 00 00       	mov    $0x1,%ecx
    15f6:	89 e5                	mov    %esp,%ebp
    15f8:	8b 55 08             	mov    0x8(%ebp),%edx
    15fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15ff:	90                   	nop
    1600:	89 c8                	mov    %ecx,%eax
    1602:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    1605:	85 c0                	test   %eax,%eax
    1607:	75 f7                	jne    1600 <lock_acquire+0x10>
}
    1609:	5d                   	pop    %ebp
    160a:	c3                   	ret    
    160b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    160f:	90                   	nop

00001610 <lock_release>:

void lock_release(lock_thread *lock){
    1610:	55                   	push   %ebp
    1611:	31 c0                	xor    %eax,%eax
    1613:	89 e5                	mov    %esp,%ebp
    1615:	8b 55 08             	mov    0x8(%ebp),%edx
    1618:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    161b:	5d                   	pop    %ebp
    161c:	c3                   	ret    
    161d:	8d 76 00             	lea    0x0(%esi),%esi

00001620 <lock_init>:

int lock_init(lock_thread *lock)
{
    1620:	55                   	push   %ebp
    1621:	89 e5                	mov    %esp,%ebp
    1623:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    1626:	68 5e 1b 00 00       	push   $0x1b5e
    162b:	6a 01                	push   $0x1
    162d:	e8 ce 01 00 00       	call   1800 <printf>
  lock->locked = 0;
    1632:	8b 45 08             	mov    0x8(%ebp),%eax
    1635:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    163b:	58                   	pop    %eax
    163c:	5a                   	pop    %edx
    163d:	68 5e 1b 00 00       	push   $0x1b5e
    1642:	6a 01                	push   $0x1
    1644:	e8 b7 01 00 00       	call   1800 <printf>
  return 0;
}
    1649:	31 c0                	xor    %eax,%eax
    164b:	c9                   	leave  
    164c:	c3                   	ret    
    164d:	8d 76 00             	lea    0x0(%esi),%esi

00001650 <thread_join>:



int thread_join()
{
    1650:	55                   	push   %ebp
    1651:	89 e5                	mov    %esp,%ebp
    1653:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    1656:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1659:	50                   	push   %eax
    165a:	e8 ca 00 00 00       	call   1729 <join>
  return a;
    165f:	c9                   	leave  
    1660:	c3                   	ret    

00001661 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1661:	b8 01 00 00 00       	mov    $0x1,%eax
    1666:	cd 40                	int    $0x40
    1668:	c3                   	ret    

00001669 <exit>:
SYSCALL(exit)
    1669:	b8 02 00 00 00       	mov    $0x2,%eax
    166e:	cd 40                	int    $0x40
    1670:	c3                   	ret    

00001671 <wait>:
SYSCALL(wait)
    1671:	b8 03 00 00 00       	mov    $0x3,%eax
    1676:	cd 40                	int    $0x40
    1678:	c3                   	ret    

00001679 <pipe>:
SYSCALL(pipe)
    1679:	b8 04 00 00 00       	mov    $0x4,%eax
    167e:	cd 40                	int    $0x40
    1680:	c3                   	ret    

00001681 <read>:
SYSCALL(read)
    1681:	b8 05 00 00 00       	mov    $0x5,%eax
    1686:	cd 40                	int    $0x40
    1688:	c3                   	ret    

00001689 <write>:
SYSCALL(write)
    1689:	b8 10 00 00 00       	mov    $0x10,%eax
    168e:	cd 40                	int    $0x40
    1690:	c3                   	ret    

00001691 <close>:
SYSCALL(close)
    1691:	b8 15 00 00 00       	mov    $0x15,%eax
    1696:	cd 40                	int    $0x40
    1698:	c3                   	ret    

00001699 <kill>:
SYSCALL(kill)
    1699:	b8 06 00 00 00       	mov    $0x6,%eax
    169e:	cd 40                	int    $0x40
    16a0:	c3                   	ret    

000016a1 <exec>:
SYSCALL(exec)
    16a1:	b8 07 00 00 00       	mov    $0x7,%eax
    16a6:	cd 40                	int    $0x40
    16a8:	c3                   	ret    

000016a9 <open>:
SYSCALL(open)
    16a9:	b8 0f 00 00 00       	mov    $0xf,%eax
    16ae:	cd 40                	int    $0x40
    16b0:	c3                   	ret    

000016b1 <mknod>:
SYSCALL(mknod)
    16b1:	b8 11 00 00 00       	mov    $0x11,%eax
    16b6:	cd 40                	int    $0x40
    16b8:	c3                   	ret    

000016b9 <unlink>:
SYSCALL(unlink)
    16b9:	b8 12 00 00 00       	mov    $0x12,%eax
    16be:	cd 40                	int    $0x40
    16c0:	c3                   	ret    

000016c1 <fstat>:
SYSCALL(fstat)
    16c1:	b8 08 00 00 00       	mov    $0x8,%eax
    16c6:	cd 40                	int    $0x40
    16c8:	c3                   	ret    

000016c9 <link>:
SYSCALL(link)
    16c9:	b8 13 00 00 00       	mov    $0x13,%eax
    16ce:	cd 40                	int    $0x40
    16d0:	c3                   	ret    

000016d1 <mkdir>:
SYSCALL(mkdir)
    16d1:	b8 14 00 00 00       	mov    $0x14,%eax
    16d6:	cd 40                	int    $0x40
    16d8:	c3                   	ret    

000016d9 <chdir>:
SYSCALL(chdir)
    16d9:	b8 09 00 00 00       	mov    $0x9,%eax
    16de:	cd 40                	int    $0x40
    16e0:	c3                   	ret    

000016e1 <dup>:
SYSCALL(dup)
    16e1:	b8 0a 00 00 00       	mov    $0xa,%eax
    16e6:	cd 40                	int    $0x40
    16e8:	c3                   	ret    

000016e9 <getpid>:
SYSCALL(getpid)
    16e9:	b8 0b 00 00 00       	mov    $0xb,%eax
    16ee:	cd 40                	int    $0x40
    16f0:	c3                   	ret    

000016f1 <sbrk>:
SYSCALL(sbrk)
    16f1:	b8 0c 00 00 00       	mov    $0xc,%eax
    16f6:	cd 40                	int    $0x40
    16f8:	c3                   	ret    

000016f9 <sleep>:
SYSCALL(sleep)
    16f9:	b8 0d 00 00 00       	mov    $0xd,%eax
    16fe:	cd 40                	int    $0x40
    1700:	c3                   	ret    

00001701 <uptime>:
SYSCALL(uptime)
    1701:	b8 0e 00 00 00       	mov    $0xe,%eax
    1706:	cd 40                	int    $0x40
    1708:	c3                   	ret    

00001709 <getreadcount>:
SYSCALL(getreadcount)
    1709:	b8 16 00 00 00       	mov    $0x16,%eax
    170e:	cd 40                	int    $0x40
    1710:	c3                   	ret    

00001711 <settickets>:
SYSCALL(settickets)
    1711:	b8 17 00 00 00       	mov    $0x17,%eax
    1716:	cd 40                	int    $0x40
    1718:	c3                   	ret    

00001719 <getpinfo>:
SYSCALL(getpinfo)
    1719:	b8 18 00 00 00       	mov    $0x18,%eax
    171e:	cd 40                	int    $0x40
    1720:	c3                   	ret    

00001721 <clone>:
SYSCALL(clone)
    1721:	b8 19 00 00 00       	mov    $0x19,%eax
    1726:	cd 40                	int    $0x40
    1728:	c3                   	ret    

00001729 <join>:
SYSCALL(join)
    1729:	b8 1a 00 00 00       	mov    $0x1a,%eax
    172e:	cd 40                	int    $0x40
    1730:	c3                   	ret    

00001731 <mprotect>:
SYSCALL(mprotect)
    1731:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1736:	cd 40                	int    $0x40
    1738:	c3                   	ret    

00001739 <munprotect>:
SYSCALL(munprotect)
    1739:	b8 1c 00 00 00       	mov    $0x1c,%eax
    173e:	cd 40                	int    $0x40
    1740:	c3                   	ret    
    1741:	66 90                	xchg   %ax,%ax
    1743:	66 90                	xchg   %ax,%ax
    1745:	66 90                	xchg   %ax,%ax
    1747:	66 90                	xchg   %ax,%ax
    1749:	66 90                	xchg   %ax,%ax
    174b:	66 90                	xchg   %ax,%ax
    174d:	66 90                	xchg   %ax,%ax
    174f:	90                   	nop

00001750 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1750:	55                   	push   %ebp
    1751:	89 e5                	mov    %esp,%ebp
    1753:	57                   	push   %edi
    1754:	56                   	push   %esi
    1755:	53                   	push   %ebx
    1756:	83 ec 3c             	sub    $0x3c,%esp
    1759:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    175c:	89 d1                	mov    %edx,%ecx
{
    175e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1761:	85 d2                	test   %edx,%edx
    1763:	0f 89 7f 00 00 00    	jns    17e8 <printint+0x98>
    1769:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    176d:	74 79                	je     17e8 <printint+0x98>
    neg = 1;
    176f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1776:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1778:	31 db                	xor    %ebx,%ebx
    177a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    177d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1780:	89 c8                	mov    %ecx,%eax
    1782:	31 d2                	xor    %edx,%edx
    1784:	89 cf                	mov    %ecx,%edi
    1786:	f7 75 c4             	divl   -0x3c(%ebp)
    1789:	0f b6 92 c0 1b 00 00 	movzbl 0x1bc0(%edx),%edx
    1790:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1793:	89 d8                	mov    %ebx,%eax
    1795:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1798:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    179b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    179e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    17a1:	76 dd                	jbe    1780 <printint+0x30>
  if(neg)
    17a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    17a6:	85 c9                	test   %ecx,%ecx
    17a8:	74 0c                	je     17b6 <printint+0x66>
    buf[i++] = '-';
    17aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    17af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    17b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    17b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    17b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    17bd:	eb 07                	jmp    17c6 <printint+0x76>
    17bf:	90                   	nop
    putc(fd, buf[i]);
    17c0:	0f b6 13             	movzbl (%ebx),%edx
    17c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    17c6:	83 ec 04             	sub    $0x4,%esp
    17c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    17cc:	6a 01                	push   $0x1
    17ce:	56                   	push   %esi
    17cf:	57                   	push   %edi
    17d0:	e8 b4 fe ff ff       	call   1689 <write>
  while(--i >= 0)
    17d5:	83 c4 10             	add    $0x10,%esp
    17d8:	39 de                	cmp    %ebx,%esi
    17da:	75 e4                	jne    17c0 <printint+0x70>
}
    17dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17df:	5b                   	pop    %ebx
    17e0:	5e                   	pop    %esi
    17e1:	5f                   	pop    %edi
    17e2:	5d                   	pop    %ebp
    17e3:	c3                   	ret    
    17e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    17e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    17ef:	eb 87                	jmp    1778 <printint+0x28>
    17f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17ff:	90                   	nop

00001800 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1800:	55                   	push   %ebp
    1801:	89 e5                	mov    %esp,%ebp
    1803:	57                   	push   %edi
    1804:	56                   	push   %esi
    1805:	53                   	push   %ebx
    1806:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1809:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    180c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    180f:	0f b6 13             	movzbl (%ebx),%edx
    1812:	84 d2                	test   %dl,%dl
    1814:	74 6a                	je     1880 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1816:	8d 45 10             	lea    0x10(%ebp),%eax
    1819:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    181c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    181f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1821:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1824:	eb 36                	jmp    185c <printf+0x5c>
    1826:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    182d:	8d 76 00             	lea    0x0(%esi),%esi
    1830:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1833:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1838:	83 f8 25             	cmp    $0x25,%eax
    183b:	74 15                	je     1852 <printf+0x52>
  write(fd, &c, 1);
    183d:	83 ec 04             	sub    $0x4,%esp
    1840:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1843:	6a 01                	push   $0x1
    1845:	57                   	push   %edi
    1846:	56                   	push   %esi
    1847:	e8 3d fe ff ff       	call   1689 <write>
    184c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    184f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1852:	0f b6 13             	movzbl (%ebx),%edx
    1855:	83 c3 01             	add    $0x1,%ebx
    1858:	84 d2                	test   %dl,%dl
    185a:	74 24                	je     1880 <printf+0x80>
    c = fmt[i] & 0xff;
    185c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    185f:	85 c9                	test   %ecx,%ecx
    1861:	74 cd                	je     1830 <printf+0x30>
      }
    } else if(state == '%'){
    1863:	83 f9 25             	cmp    $0x25,%ecx
    1866:	75 ea                	jne    1852 <printf+0x52>
      if(c == 'd'){
    1868:	83 f8 25             	cmp    $0x25,%eax
    186b:	0f 84 07 01 00 00    	je     1978 <printf+0x178>
    1871:	83 e8 63             	sub    $0x63,%eax
    1874:	83 f8 15             	cmp    $0x15,%eax
    1877:	77 17                	ja     1890 <printf+0x90>
    1879:	ff 24 85 68 1b 00 00 	jmp    *0x1b68(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1880:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1883:	5b                   	pop    %ebx
    1884:	5e                   	pop    %esi
    1885:	5f                   	pop    %edi
    1886:	5d                   	pop    %ebp
    1887:	c3                   	ret    
    1888:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    188f:	90                   	nop
  write(fd, &c, 1);
    1890:	83 ec 04             	sub    $0x4,%esp
    1893:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1896:	6a 01                	push   $0x1
    1898:	57                   	push   %edi
    1899:	56                   	push   %esi
    189a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    189e:	e8 e6 fd ff ff       	call   1689 <write>
        putc(fd, c);
    18a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    18a7:	83 c4 0c             	add    $0xc,%esp
    18aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
    18ad:	6a 01                	push   $0x1
    18af:	57                   	push   %edi
    18b0:	56                   	push   %esi
    18b1:	e8 d3 fd ff ff       	call   1689 <write>
        putc(fd, c);
    18b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    18b9:	31 c9                	xor    %ecx,%ecx
    18bb:	eb 95                	jmp    1852 <printf+0x52>
    18bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    18c0:	83 ec 0c             	sub    $0xc,%esp
    18c3:	b9 10 00 00 00       	mov    $0x10,%ecx
    18c8:	6a 00                	push   $0x0
    18ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
    18cd:	8b 10                	mov    (%eax),%edx
    18cf:	89 f0                	mov    %esi,%eax
    18d1:	e8 7a fe ff ff       	call   1750 <printint>
        ap++;
    18d6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    18da:	83 c4 10             	add    $0x10,%esp
      state = 0;
    18dd:	31 c9                	xor    %ecx,%ecx
    18df:	e9 6e ff ff ff       	jmp    1852 <printf+0x52>
    18e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    18e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    18eb:	8b 10                	mov    (%eax),%edx
        ap++;
    18ed:	83 c0 04             	add    $0x4,%eax
    18f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    18f3:	85 d2                	test   %edx,%edx
    18f5:	0f 84 8d 00 00 00    	je     1988 <printf+0x188>
        while(*s != 0){
    18fb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    18fe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1900:	84 c0                	test   %al,%al
    1902:	0f 84 4a ff ff ff    	je     1852 <printf+0x52>
    1908:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    190b:	89 d3                	mov    %edx,%ebx
    190d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1910:	83 ec 04             	sub    $0x4,%esp
          s++;
    1913:	83 c3 01             	add    $0x1,%ebx
    1916:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1919:	6a 01                	push   $0x1
    191b:	57                   	push   %edi
    191c:	56                   	push   %esi
    191d:	e8 67 fd ff ff       	call   1689 <write>
        while(*s != 0){
    1922:	0f b6 03             	movzbl (%ebx),%eax
    1925:	83 c4 10             	add    $0x10,%esp
    1928:	84 c0                	test   %al,%al
    192a:	75 e4                	jne    1910 <printf+0x110>
      state = 0;
    192c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    192f:	31 c9                	xor    %ecx,%ecx
    1931:	e9 1c ff ff ff       	jmp    1852 <printf+0x52>
    1936:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    193d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1940:	83 ec 0c             	sub    $0xc,%esp
    1943:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1948:	6a 01                	push   $0x1
    194a:	e9 7b ff ff ff       	jmp    18ca <printf+0xca>
    194f:	90                   	nop
        putc(fd, *ap);
    1950:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1953:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1956:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1958:	6a 01                	push   $0x1
    195a:	57                   	push   %edi
    195b:	56                   	push   %esi
        putc(fd, *ap);
    195c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    195f:	e8 25 fd ff ff       	call   1689 <write>
        ap++;
    1964:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1968:	83 c4 10             	add    $0x10,%esp
      state = 0;
    196b:	31 c9                	xor    %ecx,%ecx
    196d:	e9 e0 fe ff ff       	jmp    1852 <printf+0x52>
    1972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1978:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    197b:	83 ec 04             	sub    $0x4,%esp
    197e:	e9 2a ff ff ff       	jmp    18ad <printf+0xad>
    1983:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1987:	90                   	nop
          s = "(null)";
    1988:	ba 61 1b 00 00       	mov    $0x1b61,%edx
        while(*s != 0){
    198d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1990:	b8 28 00 00 00       	mov    $0x28,%eax
    1995:	89 d3                	mov    %edx,%ebx
    1997:	e9 74 ff ff ff       	jmp    1910 <printf+0x110>
    199c:	66 90                	xchg   %ax,%ax
    199e:	66 90                	xchg   %ax,%ax

000019a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    19a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    19a1:	a1 00 24 00 00       	mov    0x2400,%eax
{
    19a6:	89 e5                	mov    %esp,%ebp
    19a8:	57                   	push   %edi
    19a9:	56                   	push   %esi
    19aa:	53                   	push   %ebx
    19ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    19ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    19b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    19b8:	89 c2                	mov    %eax,%edx
    19ba:	8b 00                	mov    (%eax),%eax
    19bc:	39 ca                	cmp    %ecx,%edx
    19be:	73 30                	jae    19f0 <free+0x50>
    19c0:	39 c1                	cmp    %eax,%ecx
    19c2:	72 04                	jb     19c8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    19c4:	39 c2                	cmp    %eax,%edx
    19c6:	72 f0                	jb     19b8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    19c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    19cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    19ce:	39 f8                	cmp    %edi,%eax
    19d0:	74 30                	je     1a02 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    19d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    19d5:	8b 42 04             	mov    0x4(%edx),%eax
    19d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    19db:	39 f1                	cmp    %esi,%ecx
    19dd:	74 3a                	je     1a19 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    19df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    19e1:	5b                   	pop    %ebx
  freep = p;
    19e2:	89 15 00 24 00 00    	mov    %edx,0x2400
}
    19e8:	5e                   	pop    %esi
    19e9:	5f                   	pop    %edi
    19ea:	5d                   	pop    %ebp
    19eb:	c3                   	ret    
    19ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    19f0:	39 c2                	cmp    %eax,%edx
    19f2:	72 c4                	jb     19b8 <free+0x18>
    19f4:	39 c1                	cmp    %eax,%ecx
    19f6:	73 c0                	jae    19b8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    19f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    19fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    19fe:	39 f8                	cmp    %edi,%eax
    1a00:	75 d0                	jne    19d2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1a02:	03 70 04             	add    0x4(%eax),%esi
    1a05:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1a08:	8b 02                	mov    (%edx),%eax
    1a0a:	8b 00                	mov    (%eax),%eax
    1a0c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    1a0f:	8b 42 04             	mov    0x4(%edx),%eax
    1a12:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1a15:	39 f1                	cmp    %esi,%ecx
    1a17:	75 c6                	jne    19df <free+0x3f>
    p->s.size += bp->s.size;
    1a19:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    1a1c:	89 15 00 24 00 00    	mov    %edx,0x2400
    p->s.size += bp->s.size;
    1a22:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1a25:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1a28:	89 0a                	mov    %ecx,(%edx)
}
    1a2a:	5b                   	pop    %ebx
    1a2b:	5e                   	pop    %esi
    1a2c:	5f                   	pop    %edi
    1a2d:	5d                   	pop    %ebp
    1a2e:	c3                   	ret    
    1a2f:	90                   	nop

00001a30 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1a30:	55                   	push   %ebp
    1a31:	89 e5                	mov    %esp,%ebp
    1a33:	57                   	push   %edi
    1a34:	56                   	push   %esi
    1a35:	53                   	push   %ebx
    1a36:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a39:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1a3c:	8b 3d 00 24 00 00    	mov    0x2400,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a42:	8d 70 07             	lea    0x7(%eax),%esi
    1a45:	c1 ee 03             	shr    $0x3,%esi
    1a48:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    1a4b:	85 ff                	test   %edi,%edi
    1a4d:	0f 84 9d 00 00 00    	je     1af0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a53:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1a55:	8b 4a 04             	mov    0x4(%edx),%ecx
    1a58:	39 f1                	cmp    %esi,%ecx
    1a5a:	73 6a                	jae    1ac6 <malloc+0x96>
    1a5c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1a61:	39 de                	cmp    %ebx,%esi
    1a63:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1a66:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    1a6d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1a70:	eb 17                	jmp    1a89 <malloc+0x59>
    1a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a78:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1a7a:	8b 48 04             	mov    0x4(%eax),%ecx
    1a7d:	39 f1                	cmp    %esi,%ecx
    1a7f:	73 4f                	jae    1ad0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1a81:	8b 3d 00 24 00 00    	mov    0x2400,%edi
    1a87:	89 c2                	mov    %eax,%edx
    1a89:	39 d7                	cmp    %edx,%edi
    1a8b:	75 eb                	jne    1a78 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    1a8d:	83 ec 0c             	sub    $0xc,%esp
    1a90:	ff 75 e4             	push   -0x1c(%ebp)
    1a93:	e8 59 fc ff ff       	call   16f1 <sbrk>
  if(p == (char*)-1)
    1a98:	83 c4 10             	add    $0x10,%esp
    1a9b:	83 f8 ff             	cmp    $0xffffffff,%eax
    1a9e:	74 1c                	je     1abc <malloc+0x8c>
  hp->s.size = nu;
    1aa0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1aa3:	83 ec 0c             	sub    $0xc,%esp
    1aa6:	83 c0 08             	add    $0x8,%eax
    1aa9:	50                   	push   %eax
    1aaa:	e8 f1 fe ff ff       	call   19a0 <free>
  return freep;
    1aaf:	8b 15 00 24 00 00    	mov    0x2400,%edx
      if((p = morecore(nunits)) == 0)
    1ab5:	83 c4 10             	add    $0x10,%esp
    1ab8:	85 d2                	test   %edx,%edx
    1aba:	75 bc                	jne    1a78 <malloc+0x48>
        return 0;
  }
}
    1abc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1abf:	31 c0                	xor    %eax,%eax
}
    1ac1:	5b                   	pop    %ebx
    1ac2:	5e                   	pop    %esi
    1ac3:	5f                   	pop    %edi
    1ac4:	5d                   	pop    %ebp
    1ac5:	c3                   	ret    
    if(p->s.size >= nunits){
    1ac6:	89 d0                	mov    %edx,%eax
    1ac8:	89 fa                	mov    %edi,%edx
    1aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1ad0:	39 ce                	cmp    %ecx,%esi
    1ad2:	74 4c                	je     1b20 <malloc+0xf0>
        p->s.size -= nunits;
    1ad4:	29 f1                	sub    %esi,%ecx
    1ad6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1ad9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1adc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    1adf:	89 15 00 24 00 00    	mov    %edx,0x2400
}
    1ae5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1ae8:	83 c0 08             	add    $0x8,%eax
}
    1aeb:	5b                   	pop    %ebx
    1aec:	5e                   	pop    %esi
    1aed:	5f                   	pop    %edi
    1aee:	5d                   	pop    %ebp
    1aef:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1af0:	c7 05 00 24 00 00 04 	movl   $0x2404,0x2400
    1af7:	24 00 00 
    base.s.size = 0;
    1afa:	bf 04 24 00 00       	mov    $0x2404,%edi
    base.s.ptr = freep = prevp = &base;
    1aff:	c7 05 04 24 00 00 04 	movl   $0x2404,0x2404
    1b06:	24 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1b09:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    1b0b:	c7 05 08 24 00 00 00 	movl   $0x0,0x2408
    1b12:	00 00 00 
    if(p->s.size >= nunits){
    1b15:	e9 42 ff ff ff       	jmp    1a5c <malloc+0x2c>
    1b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1b20:	8b 08                	mov    (%eax),%ecx
    1b22:	89 0a                	mov    %ecx,(%edx)
    1b24:	eb b9                	jmp    1adf <malloc+0xaf>
