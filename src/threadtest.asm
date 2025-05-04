
_threadtest:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
    lock_release(lock);
  exit();
}
int
main()
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	56                   	push   %esi
    100e:	53                   	push   %ebx
  lock_init(lock);
  int arg1 = 1, arg2 = 1;

  printf(1, "Threads will be executed in call order in this section:\n");
  thread_create(&proc1, (void *)&arg1, (void *)&arg2);
    100f:	8d 75 e4             	lea    -0x1c(%ebp),%esi
    1012:	8d 5d e0             	lea    -0x20(%ebp),%ebx
{
    1015:	51                   	push   %ecx
    1016:	83 ec 28             	sub    $0x28,%esp
  lock_init(lock);
    1019:	ff 35 28 20 00 00    	push   0x2028
    101f:	e8 dc 05 00 00       	call   1600 <lock_init>
  printf(1, "Threads will be executed in call order in this section:\n");
    1024:	58                   	pop    %eax
    1025:	5a                   	pop    %edx
    1026:	68 7c 1b 00 00       	push   $0x1b7c
    102b:	6a 01                	push   $0x1
  int arg1 = 1, arg2 = 1;
    102d:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
    1034:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  printf(1, "Threads will be executed in call order in this section:\n");
    103b:	e8 a0 07 00 00       	call   17e0 <printf>
  thread_create(&proc1, (void *)&arg1, (void *)&arg2);
    1040:	83 c4 0c             	add    $0xc,%esp
    1043:	56                   	push   %esi
    1044:	53                   	push   %ebx
    1045:	68 10 11 00 00       	push   $0x1110
    104a:	e8 51 05 00 00       	call   15a0 <thread_create>
  thread_join();
    104f:	e8 dc 05 00 00       	call   1630 <thread_join>
  thread_create(&proc2, (void *)&arg1, (void *)&arg2);
    1054:	83 c4 0c             	add    $0xc,%esp
    1057:	56                   	push   %esi
    1058:	53                   	push   %ebx
    1059:	68 a0 11 00 00       	push   $0x11a0
    105e:	e8 3d 05 00 00       	call   15a0 <thread_create>
  thread_join();
    1063:	e8 c8 05 00 00       	call   1630 <thread_join>
  thread_create(&proc3, (void *)&arg1, (void *)&arg2);
    1068:	83 c4 0c             	add    $0xc,%esp
    106b:	56                   	push   %esi
    106c:	53                   	push   %ebx
    106d:	68 30 12 00 00       	push   $0x1230
    1072:	e8 29 05 00 00       	call   15a0 <thread_create>
  thread_join();
    1077:	e8 b4 05 00 00       	call   1630 <thread_join>
  thread_create(&proc4,(void *)&arg1, (void *)&arg2);
    107c:	83 c4 0c             	add    $0xc,%esp
    107f:	56                   	push   %esi
    1080:	53                   	push   %ebx
    1081:	68 c0 12 00 00       	push   $0x12c0
    1086:	e8 15 05 00 00       	call   15a0 <thread_create>
  thread_join();
    108b:	e8 a0 05 00 00       	call   1630 <thread_join>

  printf(1,"\n");
    1090:	59                   	pop    %ecx
    1091:	58                   	pop    %eax
    1092:	68 0e 1b 00 00       	push   $0x1b0e
    1097:	6a 01                	push   $0x1
    1099:	e8 42 07 00 00       	call   17e0 <printf>
  arg1 = 0;
  printf(1, "Threads will print their output in the order they finish in this section:\n");
    109e:	58                   	pop    %eax
    109f:	5a                   	pop    %edx
    10a0:	68 b8 1b 00 00       	push   $0x1bb8
    10a5:	6a 01                	push   $0x1
  arg1 = 0;
    10a7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  printf(1, "Threads will print their output in the order they finish in this section:\n");
    10ae:	e8 2d 07 00 00       	call   17e0 <printf>
  thread_create(&proc1, (void *)&arg1, (void *)&arg2);
    10b3:	83 c4 0c             	add    $0xc,%esp
    10b6:	56                   	push   %esi
    10b7:	53                   	push   %ebx
    10b8:	68 10 11 00 00       	push   $0x1110
    10bd:	e8 de 04 00 00       	call   15a0 <thread_create>
  thread_create(&proc2, (void *)&arg1, (void *)&arg2);
    10c2:	83 c4 0c             	add    $0xc,%esp
    10c5:	56                   	push   %esi
    10c6:	53                   	push   %ebx
    10c7:	68 a0 11 00 00       	push   $0x11a0
    10cc:	e8 cf 04 00 00       	call   15a0 <thread_create>
  thread_create(&proc3, (void *)&arg1, (void *)&arg2);
    10d1:	83 c4 0c             	add    $0xc,%esp
    10d4:	56                   	push   %esi
    10d5:	53                   	push   %ebx
    10d6:	68 30 12 00 00       	push   $0x1230
    10db:	e8 c0 04 00 00       	call   15a0 <thread_create>
  thread_create(&proc4,(void *)&arg1, (void *)&arg2);
    10e0:	83 c4 0c             	add    $0xc,%esp
    10e3:	56                   	push   %esi
    10e4:	53                   	push   %ebx
    10e5:	68 c0 12 00 00       	push   $0x12c0
    10ea:	e8 b1 04 00 00       	call   15a0 <thread_create>
  thread_join();
    10ef:	e8 3c 05 00 00       	call   1630 <thread_join>
  thread_join();
    10f4:	e8 37 05 00 00       	call   1630 <thread_join>
  thread_join();
    10f9:	e8 32 05 00 00       	call   1630 <thread_join>
  thread_join();
    10fe:	e8 2d 05 00 00       	call   1630 <thread_join>

  exit();
    1103:	e8 41 05 00 00       	call   1649 <exit>
    1108:	66 90                	xchg   %ax,%ax
    110a:	66 90                	xchg   %ax,%ax
    110c:	66 90                	xchg   %ax,%ax
    110e:	66 90                	xchg   %ax,%ax

00001110 <proc1>:
void proc1(void* arg1, void* arg2) {
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	83 ec 08             	sub    $0x8,%esp
  if (is_lock) 
    1116:	8b 45 08             	mov    0x8(%ebp),%eax
    1119:	8b 00                	mov    (%eax),%eax
    111b:	85 c0                	test   %eax,%eax
    111d:	75 31                	jne    1150 <proc1+0x40>
  printf(1, "Proc 1\n");
    111f:	83 ec 08             	sub    $0x8,%esp
    1122:	68 08 1b 00 00       	push   $0x1b08
    1127:	6a 01                	push   $0x1
    1129:	e8 b2 06 00 00       	call   17e0 <printf>
  sleep(TIME);
    112e:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
    1135:	e8 9f 05 00 00       	call   16d9 <sleep>
  printf(1,"Proc 1 second print\n");
    113a:	58                   	pop    %eax
    113b:	5a                   	pop    %edx
    113c:	68 10 1b 00 00       	push   $0x1b10
    1141:	6a 01                	push   $0x1
    1143:	e8 98 06 00 00       	call   17e0 <printf>
    1148:	83 c4 10             	add    $0x10,%esp
  exit();
    114b:	e8 f9 04 00 00       	call   1649 <exit>
    lock_acquire(lock);
    1150:	83 ec 0c             	sub    $0xc,%esp
    1153:	ff 35 28 20 00 00    	push   0x2028
    1159:	e8 72 04 00 00       	call   15d0 <lock_acquire>
  printf(1, "Proc 1\n");
    115e:	59                   	pop    %ecx
    115f:	58                   	pop    %eax
    1160:	68 08 1b 00 00       	push   $0x1b08
    1165:	6a 01                	push   $0x1
    1167:	e8 74 06 00 00       	call   17e0 <printf>
  sleep(TIME);
    116c:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
    1173:	e8 61 05 00 00       	call   16d9 <sleep>
  printf(1,"Proc 1 second print\n");
    1178:	58                   	pop    %eax
    1179:	5a                   	pop    %edx
    117a:	68 10 1b 00 00       	push   $0x1b10
    117f:	6a 01                	push   $0x1
    1181:	e8 5a 06 00 00       	call   17e0 <printf>
    lock_release(lock);
    1186:	59                   	pop    %ecx
    1187:	ff 35 28 20 00 00    	push   0x2028
    118d:	e8 5e 04 00 00       	call   15f0 <lock_release>
    1192:	83 c4 10             	add    $0x10,%esp
    1195:	eb b4                	jmp    114b <proc1+0x3b>
    1197:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    119e:	66 90                	xchg   %ax,%ax

000011a0 <proc2>:
void proc2(void* arg1, void* arg2) {
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	83 ec 08             	sub    $0x8,%esp
  if (is_lock) 
    11a6:	8b 45 08             	mov    0x8(%ebp),%eax
    11a9:	8b 00                	mov    (%eax),%eax
    11ab:	85 c0                	test   %eax,%eax
    11ad:	75 31                	jne    11e0 <proc2+0x40>
  printf(1, "Proc 2\n");
    11af:	83 ec 08             	sub    $0x8,%esp
    11b2:	68 25 1b 00 00       	push   $0x1b25
    11b7:	6a 01                	push   $0x1
    11b9:	e8 22 06 00 00       	call   17e0 <printf>
  sleep(TIME);
    11be:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
    11c5:	e8 0f 05 00 00       	call   16d9 <sleep>
  printf(1,"Proc 2 second print\n");
    11ca:	58                   	pop    %eax
    11cb:	5a                   	pop    %edx
    11cc:	68 2d 1b 00 00       	push   $0x1b2d
    11d1:	6a 01                	push   $0x1
    11d3:	e8 08 06 00 00       	call   17e0 <printf>
    11d8:	83 c4 10             	add    $0x10,%esp
  exit();
    11db:	e8 69 04 00 00       	call   1649 <exit>
    lock_acquire(lock);
    11e0:	83 ec 0c             	sub    $0xc,%esp
    11e3:	ff 35 28 20 00 00    	push   0x2028
    11e9:	e8 e2 03 00 00       	call   15d0 <lock_acquire>
  printf(1, "Proc 2\n");
    11ee:	59                   	pop    %ecx
    11ef:	58                   	pop    %eax
    11f0:	68 25 1b 00 00       	push   $0x1b25
    11f5:	6a 01                	push   $0x1
    11f7:	e8 e4 05 00 00       	call   17e0 <printf>
  sleep(TIME);
    11fc:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
    1203:	e8 d1 04 00 00       	call   16d9 <sleep>
  printf(1,"Proc 2 second print\n");
    1208:	58                   	pop    %eax
    1209:	5a                   	pop    %edx
    120a:	68 2d 1b 00 00       	push   $0x1b2d
    120f:	6a 01                	push   $0x1
    1211:	e8 ca 05 00 00       	call   17e0 <printf>
    lock_release(lock);
    1216:	59                   	pop    %ecx
    1217:	ff 35 28 20 00 00    	push   0x2028
    121d:	e8 ce 03 00 00       	call   15f0 <lock_release>
    1222:	83 c4 10             	add    $0x10,%esp
    1225:	eb b4                	jmp    11db <proc2+0x3b>
    1227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    122e:	66 90                	xchg   %ax,%ax

00001230 <proc3>:
void proc3(void* arg1, void* arg2) {
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	83 ec 08             	sub    $0x8,%esp
  if (is_lock) 
    1236:	8b 45 08             	mov    0x8(%ebp),%eax
    1239:	8b 00                	mov    (%eax),%eax
    123b:	85 c0                	test   %eax,%eax
    123d:	75 31                	jne    1270 <proc3+0x40>
  printf(1, "Proc 3\n");
    123f:	83 ec 08             	sub    $0x8,%esp
    1242:	68 42 1b 00 00       	push   $0x1b42
    1247:	6a 01                	push   $0x1
    1249:	e8 92 05 00 00       	call   17e0 <printf>
  sleep(TIME);
    124e:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
    1255:	e8 7f 04 00 00       	call   16d9 <sleep>
  printf(1,"Proc 3 second print\n");
    125a:	58                   	pop    %eax
    125b:	5a                   	pop    %edx
    125c:	68 4a 1b 00 00       	push   $0x1b4a
    1261:	6a 01                	push   $0x1
    1263:	e8 78 05 00 00       	call   17e0 <printf>
    1268:	83 c4 10             	add    $0x10,%esp
  exit();
    126b:	e8 d9 03 00 00       	call   1649 <exit>
    lock_acquire(lock);
    1270:	83 ec 0c             	sub    $0xc,%esp
    1273:	ff 35 28 20 00 00    	push   0x2028
    1279:	e8 52 03 00 00       	call   15d0 <lock_acquire>
  printf(1, "Proc 3\n");
    127e:	59                   	pop    %ecx
    127f:	58                   	pop    %eax
    1280:	68 42 1b 00 00       	push   $0x1b42
    1285:	6a 01                	push   $0x1
    1287:	e8 54 05 00 00       	call   17e0 <printf>
  sleep(TIME);
    128c:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
    1293:	e8 41 04 00 00       	call   16d9 <sleep>
  printf(1,"Proc 3 second print\n");
    1298:	58                   	pop    %eax
    1299:	5a                   	pop    %edx
    129a:	68 4a 1b 00 00       	push   $0x1b4a
    129f:	6a 01                	push   $0x1
    12a1:	e8 3a 05 00 00       	call   17e0 <printf>
    lock_release(lock);
    12a6:	59                   	pop    %ecx
    12a7:	ff 35 28 20 00 00    	push   0x2028
    12ad:	e8 3e 03 00 00       	call   15f0 <lock_release>
    12b2:	83 c4 10             	add    $0x10,%esp
    12b5:	eb b4                	jmp    126b <proc3+0x3b>
    12b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12be:	66 90                	xchg   %ax,%ax

000012c0 <proc4>:
void proc4(void* arg1, void* arg2) {
    12c0:	55                   	push   %ebp
    12c1:	89 e5                	mov    %esp,%ebp
    12c3:	83 ec 08             	sub    $0x8,%esp
  if (is_lock) 
    12c6:	8b 45 08             	mov    0x8(%ebp),%eax
    12c9:	8b 00                	mov    (%eax),%eax
    12cb:	85 c0                	test   %eax,%eax
    12cd:	75 31                	jne    1300 <proc4+0x40>
  printf(1, "Proc 4\n");
    12cf:	83 ec 08             	sub    $0x8,%esp
    12d2:	68 5f 1b 00 00       	push   $0x1b5f
    12d7:	6a 01                	push   $0x1
    12d9:	e8 02 05 00 00       	call   17e0 <printf>
  sleep(TIME);
    12de:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
    12e5:	e8 ef 03 00 00       	call   16d9 <sleep>
  printf(1,"Proc 4 second print\n");
    12ea:	58                   	pop    %eax
    12eb:	5a                   	pop    %edx
    12ec:	68 67 1b 00 00       	push   $0x1b67
    12f1:	6a 01                	push   $0x1
    12f3:	e8 e8 04 00 00       	call   17e0 <printf>
    12f8:	83 c4 10             	add    $0x10,%esp
  exit();
    12fb:	e8 49 03 00 00       	call   1649 <exit>
    lock_acquire(lock);
    1300:	83 ec 0c             	sub    $0xc,%esp
    1303:	ff 35 28 20 00 00    	push   0x2028
    1309:	e8 c2 02 00 00       	call   15d0 <lock_acquire>
  printf(1, "Proc 4\n");
    130e:	59                   	pop    %ecx
    130f:	58                   	pop    %eax
    1310:	68 5f 1b 00 00       	push   $0x1b5f
    1315:	6a 01                	push   $0x1
    1317:	e8 c4 04 00 00       	call   17e0 <printf>
  sleep(TIME);
    131c:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
    1323:	e8 b1 03 00 00       	call   16d9 <sleep>
  printf(1,"Proc 4 second print\n");
    1328:	58                   	pop    %eax
    1329:	5a                   	pop    %edx
    132a:	68 67 1b 00 00       	push   $0x1b67
    132f:	6a 01                	push   $0x1
    1331:	e8 aa 04 00 00       	call   17e0 <printf>
    lock_release(lock);
    1336:	59                   	pop    %ecx
    1337:	ff 35 28 20 00 00    	push   0x2028
    133d:	e8 ae 02 00 00       	call   15f0 <lock_release>
    1342:	83 c4 10             	add    $0x10,%esp
    1345:	eb b4                	jmp    12fb <proc4+0x3b>
    1347:	66 90                	xchg   %ax,%ax
    1349:	66 90                	xchg   %ax,%ax
    134b:	66 90                	xchg   %ax,%ax
    134d:	66 90                	xchg   %ax,%ax
    134f:	90                   	nop

00001350 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    1350:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1351:	31 c0                	xor    %eax,%eax
{
    1353:	89 e5                	mov    %esp,%ebp
    1355:	53                   	push   %ebx
    1356:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1359:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    135c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1360:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1364:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1367:	83 c0 01             	add    $0x1,%eax
    136a:	84 d2                	test   %dl,%dl
    136c:	75 f2                	jne    1360 <strcpy+0x10>
    ;
  return os;
}
    136e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1371:	89 c8                	mov    %ecx,%eax
    1373:	c9                   	leave  
    1374:	c3                   	ret    
    1375:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    137c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001380 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	53                   	push   %ebx
    1384:	8b 55 08             	mov    0x8(%ebp),%edx
    1387:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    138a:	0f b6 02             	movzbl (%edx),%eax
    138d:	84 c0                	test   %al,%al
    138f:	75 17                	jne    13a8 <strcmp+0x28>
    1391:	eb 3a                	jmp    13cd <strcmp+0x4d>
    1393:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1397:	90                   	nop
    1398:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    139c:	83 c2 01             	add    $0x1,%edx
    139f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    13a2:	84 c0                	test   %al,%al
    13a4:	74 1a                	je     13c0 <strcmp+0x40>
    p++, q++;
    13a6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    13a8:	0f b6 19             	movzbl (%ecx),%ebx
    13ab:	38 c3                	cmp    %al,%bl
    13ad:	74 e9                	je     1398 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    13af:	29 d8                	sub    %ebx,%eax
}
    13b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13b4:	c9                   	leave  
    13b5:	c3                   	ret    
    13b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13bd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    13c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    13c4:	31 c0                	xor    %eax,%eax
    13c6:	29 d8                	sub    %ebx,%eax
}
    13c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13cb:	c9                   	leave  
    13cc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    13cd:	0f b6 19             	movzbl (%ecx),%ebx
    13d0:	31 c0                	xor    %eax,%eax
    13d2:	eb db                	jmp    13af <strcmp+0x2f>
    13d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13df:	90                   	nop

000013e0 <strlen>:

uint
strlen(const char *s)
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
    13e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    13e6:	80 3a 00             	cmpb   $0x0,(%edx)
    13e9:	74 15                	je     1400 <strlen+0x20>
    13eb:	31 c0                	xor    %eax,%eax
    13ed:	8d 76 00             	lea    0x0(%esi),%esi
    13f0:	83 c0 01             	add    $0x1,%eax
    13f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    13f7:	89 c1                	mov    %eax,%ecx
    13f9:	75 f5                	jne    13f0 <strlen+0x10>
    ;
  return n;
}
    13fb:	89 c8                	mov    %ecx,%eax
    13fd:	5d                   	pop    %ebp
    13fe:	c3                   	ret    
    13ff:	90                   	nop
  for(n = 0; s[n]; n++)
    1400:	31 c9                	xor    %ecx,%ecx
}
    1402:	5d                   	pop    %ebp
    1403:	89 c8                	mov    %ecx,%eax
    1405:	c3                   	ret    
    1406:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    140d:	8d 76 00             	lea    0x0(%esi),%esi

00001410 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	57                   	push   %edi
    1414:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1417:	8b 4d 10             	mov    0x10(%ebp),%ecx
    141a:	8b 45 0c             	mov    0xc(%ebp),%eax
    141d:	89 d7                	mov    %edx,%edi
    141f:	fc                   	cld    
    1420:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1422:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1425:	89 d0                	mov    %edx,%eax
    1427:	c9                   	leave  
    1428:	c3                   	ret    
    1429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001430 <strchr>:

char*
strchr(const char *s, char c)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	8b 45 08             	mov    0x8(%ebp),%eax
    1436:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    143a:	0f b6 10             	movzbl (%eax),%edx
    143d:	84 d2                	test   %dl,%dl
    143f:	75 12                	jne    1453 <strchr+0x23>
    1441:	eb 1d                	jmp    1460 <strchr+0x30>
    1443:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1447:	90                   	nop
    1448:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    144c:	83 c0 01             	add    $0x1,%eax
    144f:	84 d2                	test   %dl,%dl
    1451:	74 0d                	je     1460 <strchr+0x30>
    if(*s == c)
    1453:	38 d1                	cmp    %dl,%cl
    1455:	75 f1                	jne    1448 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1457:	5d                   	pop    %ebp
    1458:	c3                   	ret    
    1459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1460:	31 c0                	xor    %eax,%eax
}
    1462:	5d                   	pop    %ebp
    1463:	c3                   	ret    
    1464:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    146b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    146f:	90                   	nop

00001470 <gets>:

char*
gets(char *buf, int max)
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	57                   	push   %edi
    1474:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1475:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1478:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1479:	31 db                	xor    %ebx,%ebx
{
    147b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    147e:	eb 27                	jmp    14a7 <gets+0x37>
    cc = read(0, &c, 1);
    1480:	83 ec 04             	sub    $0x4,%esp
    1483:	6a 01                	push   $0x1
    1485:	57                   	push   %edi
    1486:	6a 00                	push   $0x0
    1488:	e8 d4 01 00 00       	call   1661 <read>
    if(cc < 1)
    148d:	83 c4 10             	add    $0x10,%esp
    1490:	85 c0                	test   %eax,%eax
    1492:	7e 1d                	jle    14b1 <gets+0x41>
      break;
    buf[i++] = c;
    1494:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1498:	8b 55 08             	mov    0x8(%ebp),%edx
    149b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    149f:	3c 0a                	cmp    $0xa,%al
    14a1:	74 1d                	je     14c0 <gets+0x50>
    14a3:	3c 0d                	cmp    $0xd,%al
    14a5:	74 19                	je     14c0 <gets+0x50>
  for(i=0; i+1 < max; ){
    14a7:	89 de                	mov    %ebx,%esi
    14a9:	83 c3 01             	add    $0x1,%ebx
    14ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    14af:	7c cf                	jl     1480 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    14b1:	8b 45 08             	mov    0x8(%ebp),%eax
    14b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    14b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14bb:	5b                   	pop    %ebx
    14bc:	5e                   	pop    %esi
    14bd:	5f                   	pop    %edi
    14be:	5d                   	pop    %ebp
    14bf:	c3                   	ret    
  buf[i] = '\0';
    14c0:	8b 45 08             	mov    0x8(%ebp),%eax
    14c3:	89 de                	mov    %ebx,%esi
    14c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    14c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14cc:	5b                   	pop    %ebx
    14cd:	5e                   	pop    %esi
    14ce:	5f                   	pop    %edi
    14cf:	5d                   	pop    %ebp
    14d0:	c3                   	ret    
    14d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14df:	90                   	nop

000014e0 <stat>:

int
stat(const char *n, struct stat *st)
{
    14e0:	55                   	push   %ebp
    14e1:	89 e5                	mov    %esp,%ebp
    14e3:	56                   	push   %esi
    14e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    14e5:	83 ec 08             	sub    $0x8,%esp
    14e8:	6a 00                	push   $0x0
    14ea:	ff 75 08             	push   0x8(%ebp)
    14ed:	e8 97 01 00 00       	call   1689 <open>
  if(fd < 0)
    14f2:	83 c4 10             	add    $0x10,%esp
    14f5:	85 c0                	test   %eax,%eax
    14f7:	78 27                	js     1520 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    14f9:	83 ec 08             	sub    $0x8,%esp
    14fc:	ff 75 0c             	push   0xc(%ebp)
    14ff:	89 c3                	mov    %eax,%ebx
    1501:	50                   	push   %eax
    1502:	e8 9a 01 00 00       	call   16a1 <fstat>
  close(fd);
    1507:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    150a:	89 c6                	mov    %eax,%esi
  close(fd);
    150c:	e8 60 01 00 00       	call   1671 <close>
  return r;
    1511:	83 c4 10             	add    $0x10,%esp
}
    1514:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1517:	89 f0                	mov    %esi,%eax
    1519:	5b                   	pop    %ebx
    151a:	5e                   	pop    %esi
    151b:	5d                   	pop    %ebp
    151c:	c3                   	ret    
    151d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1520:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1525:	eb ed                	jmp    1514 <stat+0x34>
    1527:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    152e:	66 90                	xchg   %ax,%ax

00001530 <atoi>:

int
atoi(const char *s)
{
    1530:	55                   	push   %ebp
    1531:	89 e5                	mov    %esp,%ebp
    1533:	53                   	push   %ebx
    1534:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1537:	0f be 02             	movsbl (%edx),%eax
    153a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    153d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1540:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1545:	77 1e                	ja     1565 <atoi+0x35>
    1547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    154e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1550:	83 c2 01             	add    $0x1,%edx
    1553:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1556:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    155a:	0f be 02             	movsbl (%edx),%eax
    155d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1560:	80 fb 09             	cmp    $0x9,%bl
    1563:	76 eb                	jbe    1550 <atoi+0x20>
  return n;
}
    1565:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1568:	89 c8                	mov    %ecx,%eax
    156a:	c9                   	leave  
    156b:	c3                   	ret    
    156c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001570 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1570:	55                   	push   %ebp
    1571:	89 e5                	mov    %esp,%ebp
    1573:	57                   	push   %edi
    1574:	8b 45 10             	mov    0x10(%ebp),%eax
    1577:	8b 55 08             	mov    0x8(%ebp),%edx
    157a:	56                   	push   %esi
    157b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    157e:	85 c0                	test   %eax,%eax
    1580:	7e 13                	jle    1595 <memmove+0x25>
    1582:	01 d0                	add    %edx,%eax
  dst = vdst;
    1584:	89 d7                	mov    %edx,%edi
    1586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    158d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1590:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1591:	39 f8                	cmp    %edi,%eax
    1593:	75 fb                	jne    1590 <memmove+0x20>
  return vdst;
}
    1595:	5e                   	pop    %esi
    1596:	89 d0                	mov    %edx,%eax
    1598:	5f                   	pop    %edi
    1599:	5d                   	pop    %ebp
    159a:	c3                   	ret    
    159b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    159f:	90                   	nop

000015a0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    15a0:	55                   	push   %ebp
    15a1:	89 e5                	mov    %esp,%ebp
    15a3:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    15a6:	68 00 10 00 00       	push   $0x1000
    15ab:	e8 60 04 00 00       	call   1a10 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    15b0:	50                   	push   %eax
    15b1:	ff 75 10             	push   0x10(%ebp)
    15b4:	ff 75 0c             	push   0xc(%ebp)
    15b7:	ff 75 08             	push   0x8(%ebp)
    15ba:	e8 42 01 00 00       	call   1701 <clone>
}
    15bf:	c9                   	leave  
    15c0:	c3                   	ret    
    15c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15cf:	90                   	nop

000015d0 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    15d0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    15d1:	b9 01 00 00 00       	mov    $0x1,%ecx
    15d6:	89 e5                	mov    %esp,%ebp
    15d8:	8b 55 08             	mov    0x8(%ebp),%edx
    15db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15df:	90                   	nop
    15e0:	89 c8                	mov    %ecx,%eax
    15e2:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    15e5:	85 c0                	test   %eax,%eax
    15e7:	75 f7                	jne    15e0 <lock_acquire+0x10>
}
    15e9:	5d                   	pop    %ebp
    15ea:	c3                   	ret    
    15eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15ef:	90                   	nop

000015f0 <lock_release>:

void lock_release(lock_thread *lock){
    15f0:	55                   	push   %ebp
    15f1:	31 c0                	xor    %eax,%eax
    15f3:	89 e5                	mov    %esp,%ebp
    15f5:	8b 55 08             	mov    0x8(%ebp),%edx
    15f8:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    15fb:	5d                   	pop    %ebp
    15fc:	c3                   	ret    
    15fd:	8d 76 00             	lea    0x0(%esi),%esi

00001600 <lock_init>:

int lock_init(lock_thread *lock)
{
    1600:	55                   	push   %ebp
    1601:	89 e5                	mov    %esp,%ebp
    1603:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    1606:	68 03 1c 00 00       	push   $0x1c03
    160b:	6a 01                	push   $0x1
    160d:	e8 ce 01 00 00       	call   17e0 <printf>
  lock->locked = 0;
    1612:	8b 45 08             	mov    0x8(%ebp),%eax
    1615:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    161b:	58                   	pop    %eax
    161c:	5a                   	pop    %edx
    161d:	68 03 1c 00 00       	push   $0x1c03
    1622:	6a 01                	push   $0x1
    1624:	e8 b7 01 00 00       	call   17e0 <printf>
  return 0;
}
    1629:	31 c0                	xor    %eax,%eax
    162b:	c9                   	leave  
    162c:	c3                   	ret    
    162d:	8d 76 00             	lea    0x0(%esi),%esi

00001630 <thread_join>:



int thread_join()
{
    1630:	55                   	push   %ebp
    1631:	89 e5                	mov    %esp,%ebp
    1633:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    1636:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1639:	50                   	push   %eax
    163a:	e8 ca 00 00 00       	call   1709 <join>
  return a;
    163f:	c9                   	leave  
    1640:	c3                   	ret    

00001641 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1641:	b8 01 00 00 00       	mov    $0x1,%eax
    1646:	cd 40                	int    $0x40
    1648:	c3                   	ret    

00001649 <exit>:
SYSCALL(exit)
    1649:	b8 02 00 00 00       	mov    $0x2,%eax
    164e:	cd 40                	int    $0x40
    1650:	c3                   	ret    

00001651 <wait>:
SYSCALL(wait)
    1651:	b8 03 00 00 00       	mov    $0x3,%eax
    1656:	cd 40                	int    $0x40
    1658:	c3                   	ret    

00001659 <pipe>:
SYSCALL(pipe)
    1659:	b8 04 00 00 00       	mov    $0x4,%eax
    165e:	cd 40                	int    $0x40
    1660:	c3                   	ret    

00001661 <read>:
SYSCALL(read)
    1661:	b8 05 00 00 00       	mov    $0x5,%eax
    1666:	cd 40                	int    $0x40
    1668:	c3                   	ret    

00001669 <write>:
SYSCALL(write)
    1669:	b8 10 00 00 00       	mov    $0x10,%eax
    166e:	cd 40                	int    $0x40
    1670:	c3                   	ret    

00001671 <close>:
SYSCALL(close)
    1671:	b8 15 00 00 00       	mov    $0x15,%eax
    1676:	cd 40                	int    $0x40
    1678:	c3                   	ret    

00001679 <kill>:
SYSCALL(kill)
    1679:	b8 06 00 00 00       	mov    $0x6,%eax
    167e:	cd 40                	int    $0x40
    1680:	c3                   	ret    

00001681 <exec>:
SYSCALL(exec)
    1681:	b8 07 00 00 00       	mov    $0x7,%eax
    1686:	cd 40                	int    $0x40
    1688:	c3                   	ret    

00001689 <open>:
SYSCALL(open)
    1689:	b8 0f 00 00 00       	mov    $0xf,%eax
    168e:	cd 40                	int    $0x40
    1690:	c3                   	ret    

00001691 <mknod>:
SYSCALL(mknod)
    1691:	b8 11 00 00 00       	mov    $0x11,%eax
    1696:	cd 40                	int    $0x40
    1698:	c3                   	ret    

00001699 <unlink>:
SYSCALL(unlink)
    1699:	b8 12 00 00 00       	mov    $0x12,%eax
    169e:	cd 40                	int    $0x40
    16a0:	c3                   	ret    

000016a1 <fstat>:
SYSCALL(fstat)
    16a1:	b8 08 00 00 00       	mov    $0x8,%eax
    16a6:	cd 40                	int    $0x40
    16a8:	c3                   	ret    

000016a9 <link>:
SYSCALL(link)
    16a9:	b8 13 00 00 00       	mov    $0x13,%eax
    16ae:	cd 40                	int    $0x40
    16b0:	c3                   	ret    

000016b1 <mkdir>:
SYSCALL(mkdir)
    16b1:	b8 14 00 00 00       	mov    $0x14,%eax
    16b6:	cd 40                	int    $0x40
    16b8:	c3                   	ret    

000016b9 <chdir>:
SYSCALL(chdir)
    16b9:	b8 09 00 00 00       	mov    $0x9,%eax
    16be:	cd 40                	int    $0x40
    16c0:	c3                   	ret    

000016c1 <dup>:
SYSCALL(dup)
    16c1:	b8 0a 00 00 00       	mov    $0xa,%eax
    16c6:	cd 40                	int    $0x40
    16c8:	c3                   	ret    

000016c9 <getpid>:
SYSCALL(getpid)
    16c9:	b8 0b 00 00 00       	mov    $0xb,%eax
    16ce:	cd 40                	int    $0x40
    16d0:	c3                   	ret    

000016d1 <sbrk>:
SYSCALL(sbrk)
    16d1:	b8 0c 00 00 00       	mov    $0xc,%eax
    16d6:	cd 40                	int    $0x40
    16d8:	c3                   	ret    

000016d9 <sleep>:
SYSCALL(sleep)
    16d9:	b8 0d 00 00 00       	mov    $0xd,%eax
    16de:	cd 40                	int    $0x40
    16e0:	c3                   	ret    

000016e1 <uptime>:
SYSCALL(uptime)
    16e1:	b8 0e 00 00 00       	mov    $0xe,%eax
    16e6:	cd 40                	int    $0x40
    16e8:	c3                   	ret    

000016e9 <getreadcount>:
SYSCALL(getreadcount)
    16e9:	b8 16 00 00 00       	mov    $0x16,%eax
    16ee:	cd 40                	int    $0x40
    16f0:	c3                   	ret    

000016f1 <settickets>:
SYSCALL(settickets)
    16f1:	b8 17 00 00 00       	mov    $0x17,%eax
    16f6:	cd 40                	int    $0x40
    16f8:	c3                   	ret    

000016f9 <getpinfo>:
SYSCALL(getpinfo)
    16f9:	b8 18 00 00 00       	mov    $0x18,%eax
    16fe:	cd 40                	int    $0x40
    1700:	c3                   	ret    

00001701 <clone>:
SYSCALL(clone)
    1701:	b8 19 00 00 00       	mov    $0x19,%eax
    1706:	cd 40                	int    $0x40
    1708:	c3                   	ret    

00001709 <join>:
SYSCALL(join)
    1709:	b8 1a 00 00 00       	mov    $0x1a,%eax
    170e:	cd 40                	int    $0x40
    1710:	c3                   	ret    

00001711 <mprotect>:
SYSCALL(mprotect)
    1711:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1716:	cd 40                	int    $0x40
    1718:	c3                   	ret    

00001719 <munprotect>:
SYSCALL(munprotect)
    1719:	b8 1c 00 00 00       	mov    $0x1c,%eax
    171e:	cd 40                	int    $0x40
    1720:	c3                   	ret    
    1721:	66 90                	xchg   %ax,%ax
    1723:	66 90                	xchg   %ax,%ax
    1725:	66 90                	xchg   %ax,%ax
    1727:	66 90                	xchg   %ax,%ax
    1729:	66 90                	xchg   %ax,%ax
    172b:	66 90                	xchg   %ax,%ax
    172d:	66 90                	xchg   %ax,%ax
    172f:	90                   	nop

00001730 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1730:	55                   	push   %ebp
    1731:	89 e5                	mov    %esp,%ebp
    1733:	57                   	push   %edi
    1734:	56                   	push   %esi
    1735:	53                   	push   %ebx
    1736:	83 ec 3c             	sub    $0x3c,%esp
    1739:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    173c:	89 d1                	mov    %edx,%ecx
{
    173e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1741:	85 d2                	test   %edx,%edx
    1743:	0f 89 7f 00 00 00    	jns    17c8 <printint+0x98>
    1749:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    174d:	74 79                	je     17c8 <printint+0x98>
    neg = 1;
    174f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1756:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1758:	31 db                	xor    %ebx,%ebx
    175a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    175d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1760:	89 c8                	mov    %ecx,%eax
    1762:	31 d2                	xor    %edx,%edx
    1764:	89 cf                	mov    %ecx,%edi
    1766:	f7 75 c4             	divl   -0x3c(%ebp)
    1769:	0f b6 92 68 1c 00 00 	movzbl 0x1c68(%edx),%edx
    1770:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1773:	89 d8                	mov    %ebx,%eax
    1775:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1778:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    177b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    177e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1781:	76 dd                	jbe    1760 <printint+0x30>
  if(neg)
    1783:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1786:	85 c9                	test   %ecx,%ecx
    1788:	74 0c                	je     1796 <printint+0x66>
    buf[i++] = '-';
    178a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    178f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1791:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1796:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1799:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    179d:	eb 07                	jmp    17a6 <printint+0x76>
    179f:	90                   	nop
    putc(fd, buf[i]);
    17a0:	0f b6 13             	movzbl (%ebx),%edx
    17a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    17a6:	83 ec 04             	sub    $0x4,%esp
    17a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    17ac:	6a 01                	push   $0x1
    17ae:	56                   	push   %esi
    17af:	57                   	push   %edi
    17b0:	e8 b4 fe ff ff       	call   1669 <write>
  while(--i >= 0)
    17b5:	83 c4 10             	add    $0x10,%esp
    17b8:	39 de                	cmp    %ebx,%esi
    17ba:	75 e4                	jne    17a0 <printint+0x70>
}
    17bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17bf:	5b                   	pop    %ebx
    17c0:	5e                   	pop    %esi
    17c1:	5f                   	pop    %edi
    17c2:	5d                   	pop    %ebp
    17c3:	c3                   	ret    
    17c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    17c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    17cf:	eb 87                	jmp    1758 <printint+0x28>
    17d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17df:	90                   	nop

000017e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    17e0:	55                   	push   %ebp
    17e1:	89 e5                	mov    %esp,%ebp
    17e3:	57                   	push   %edi
    17e4:	56                   	push   %esi
    17e5:	53                   	push   %ebx
    17e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    17e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    17ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    17ef:	0f b6 13             	movzbl (%ebx),%edx
    17f2:	84 d2                	test   %dl,%dl
    17f4:	74 6a                	je     1860 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    17f6:	8d 45 10             	lea    0x10(%ebp),%eax
    17f9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    17fc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    17ff:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1801:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1804:	eb 36                	jmp    183c <printf+0x5c>
    1806:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    180d:	8d 76 00             	lea    0x0(%esi),%esi
    1810:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1813:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1818:	83 f8 25             	cmp    $0x25,%eax
    181b:	74 15                	je     1832 <printf+0x52>
  write(fd, &c, 1);
    181d:	83 ec 04             	sub    $0x4,%esp
    1820:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1823:	6a 01                	push   $0x1
    1825:	57                   	push   %edi
    1826:	56                   	push   %esi
    1827:	e8 3d fe ff ff       	call   1669 <write>
    182c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    182f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1832:	0f b6 13             	movzbl (%ebx),%edx
    1835:	83 c3 01             	add    $0x1,%ebx
    1838:	84 d2                	test   %dl,%dl
    183a:	74 24                	je     1860 <printf+0x80>
    c = fmt[i] & 0xff;
    183c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    183f:	85 c9                	test   %ecx,%ecx
    1841:	74 cd                	je     1810 <printf+0x30>
      }
    } else if(state == '%'){
    1843:	83 f9 25             	cmp    $0x25,%ecx
    1846:	75 ea                	jne    1832 <printf+0x52>
      if(c == 'd'){
    1848:	83 f8 25             	cmp    $0x25,%eax
    184b:	0f 84 07 01 00 00    	je     1958 <printf+0x178>
    1851:	83 e8 63             	sub    $0x63,%eax
    1854:	83 f8 15             	cmp    $0x15,%eax
    1857:	77 17                	ja     1870 <printf+0x90>
    1859:	ff 24 85 10 1c 00 00 	jmp    *0x1c10(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1860:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1863:	5b                   	pop    %ebx
    1864:	5e                   	pop    %esi
    1865:	5f                   	pop    %edi
    1866:	5d                   	pop    %ebp
    1867:	c3                   	ret    
    1868:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    186f:	90                   	nop
  write(fd, &c, 1);
    1870:	83 ec 04             	sub    $0x4,%esp
    1873:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1876:	6a 01                	push   $0x1
    1878:	57                   	push   %edi
    1879:	56                   	push   %esi
    187a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    187e:	e8 e6 fd ff ff       	call   1669 <write>
        putc(fd, c);
    1883:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1887:	83 c4 0c             	add    $0xc,%esp
    188a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    188d:	6a 01                	push   $0x1
    188f:	57                   	push   %edi
    1890:	56                   	push   %esi
    1891:	e8 d3 fd ff ff       	call   1669 <write>
        putc(fd, c);
    1896:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1899:	31 c9                	xor    %ecx,%ecx
    189b:	eb 95                	jmp    1832 <printf+0x52>
    189d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    18a0:	83 ec 0c             	sub    $0xc,%esp
    18a3:	b9 10 00 00 00       	mov    $0x10,%ecx
    18a8:	6a 00                	push   $0x0
    18aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
    18ad:	8b 10                	mov    (%eax),%edx
    18af:	89 f0                	mov    %esi,%eax
    18b1:	e8 7a fe ff ff       	call   1730 <printint>
        ap++;
    18b6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    18ba:	83 c4 10             	add    $0x10,%esp
      state = 0;
    18bd:	31 c9                	xor    %ecx,%ecx
    18bf:	e9 6e ff ff ff       	jmp    1832 <printf+0x52>
    18c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    18c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    18cb:	8b 10                	mov    (%eax),%edx
        ap++;
    18cd:	83 c0 04             	add    $0x4,%eax
    18d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    18d3:	85 d2                	test   %edx,%edx
    18d5:	0f 84 8d 00 00 00    	je     1968 <printf+0x188>
        while(*s != 0){
    18db:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    18de:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    18e0:	84 c0                	test   %al,%al
    18e2:	0f 84 4a ff ff ff    	je     1832 <printf+0x52>
    18e8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    18eb:	89 d3                	mov    %edx,%ebx
    18ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    18f0:	83 ec 04             	sub    $0x4,%esp
          s++;
    18f3:	83 c3 01             	add    $0x1,%ebx
    18f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    18f9:	6a 01                	push   $0x1
    18fb:	57                   	push   %edi
    18fc:	56                   	push   %esi
    18fd:	e8 67 fd ff ff       	call   1669 <write>
        while(*s != 0){
    1902:	0f b6 03             	movzbl (%ebx),%eax
    1905:	83 c4 10             	add    $0x10,%esp
    1908:	84 c0                	test   %al,%al
    190a:	75 e4                	jne    18f0 <printf+0x110>
      state = 0;
    190c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    190f:	31 c9                	xor    %ecx,%ecx
    1911:	e9 1c ff ff ff       	jmp    1832 <printf+0x52>
    1916:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    191d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1920:	83 ec 0c             	sub    $0xc,%esp
    1923:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1928:	6a 01                	push   $0x1
    192a:	e9 7b ff ff ff       	jmp    18aa <printf+0xca>
    192f:	90                   	nop
        putc(fd, *ap);
    1930:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1933:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1936:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1938:	6a 01                	push   $0x1
    193a:	57                   	push   %edi
    193b:	56                   	push   %esi
        putc(fd, *ap);
    193c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    193f:	e8 25 fd ff ff       	call   1669 <write>
        ap++;
    1944:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1948:	83 c4 10             	add    $0x10,%esp
      state = 0;
    194b:	31 c9                	xor    %ecx,%ecx
    194d:	e9 e0 fe ff ff       	jmp    1832 <printf+0x52>
    1952:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1958:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    195b:	83 ec 04             	sub    $0x4,%esp
    195e:	e9 2a ff ff ff       	jmp    188d <printf+0xad>
    1963:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1967:	90                   	nop
          s = "(null)";
    1968:	ba 06 1c 00 00       	mov    $0x1c06,%edx
        while(*s != 0){
    196d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1970:	b8 28 00 00 00       	mov    $0x28,%eax
    1975:	89 d3                	mov    %edx,%ebx
    1977:	e9 74 ff ff ff       	jmp    18f0 <printf+0x110>
    197c:	66 90                	xchg   %ax,%ax
    197e:	66 90                	xchg   %ax,%ax

00001980 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1980:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1981:	a1 2c 20 00 00       	mov    0x202c,%eax
{
    1986:	89 e5                	mov    %esp,%ebp
    1988:	57                   	push   %edi
    1989:	56                   	push   %esi
    198a:	53                   	push   %ebx
    198b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    198e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1998:	89 c2                	mov    %eax,%edx
    199a:	8b 00                	mov    (%eax),%eax
    199c:	39 ca                	cmp    %ecx,%edx
    199e:	73 30                	jae    19d0 <free+0x50>
    19a0:	39 c1                	cmp    %eax,%ecx
    19a2:	72 04                	jb     19a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    19a4:	39 c2                	cmp    %eax,%edx
    19a6:	72 f0                	jb     1998 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    19a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    19ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    19ae:	39 f8                	cmp    %edi,%eax
    19b0:	74 30                	je     19e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    19b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    19b5:	8b 42 04             	mov    0x4(%edx),%eax
    19b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    19bb:	39 f1                	cmp    %esi,%ecx
    19bd:	74 3a                	je     19f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    19bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    19c1:	5b                   	pop    %ebx
  freep = p;
    19c2:	89 15 2c 20 00 00    	mov    %edx,0x202c
}
    19c8:	5e                   	pop    %esi
    19c9:	5f                   	pop    %edi
    19ca:	5d                   	pop    %ebp
    19cb:	c3                   	ret    
    19cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    19d0:	39 c2                	cmp    %eax,%edx
    19d2:	72 c4                	jb     1998 <free+0x18>
    19d4:	39 c1                	cmp    %eax,%ecx
    19d6:	73 c0                	jae    1998 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    19d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    19db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    19de:	39 f8                	cmp    %edi,%eax
    19e0:	75 d0                	jne    19b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    19e2:	03 70 04             	add    0x4(%eax),%esi
    19e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    19e8:	8b 02                	mov    (%edx),%eax
    19ea:	8b 00                	mov    (%eax),%eax
    19ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    19ef:	8b 42 04             	mov    0x4(%edx),%eax
    19f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    19f5:	39 f1                	cmp    %esi,%ecx
    19f7:	75 c6                	jne    19bf <free+0x3f>
    p->s.size += bp->s.size;
    19f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    19fc:	89 15 2c 20 00 00    	mov    %edx,0x202c
    p->s.size += bp->s.size;
    1a02:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1a05:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1a08:	89 0a                	mov    %ecx,(%edx)
}
    1a0a:	5b                   	pop    %ebx
    1a0b:	5e                   	pop    %esi
    1a0c:	5f                   	pop    %edi
    1a0d:	5d                   	pop    %ebp
    1a0e:	c3                   	ret    
    1a0f:	90                   	nop

00001a10 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1a10:	55                   	push   %ebp
    1a11:	89 e5                	mov    %esp,%ebp
    1a13:	57                   	push   %edi
    1a14:	56                   	push   %esi
    1a15:	53                   	push   %ebx
    1a16:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a19:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1a1c:	8b 3d 2c 20 00 00    	mov    0x202c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a22:	8d 70 07             	lea    0x7(%eax),%esi
    1a25:	c1 ee 03             	shr    $0x3,%esi
    1a28:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    1a2b:	85 ff                	test   %edi,%edi
    1a2d:	0f 84 9d 00 00 00    	je     1ad0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a33:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1a35:	8b 4a 04             	mov    0x4(%edx),%ecx
    1a38:	39 f1                	cmp    %esi,%ecx
    1a3a:	73 6a                	jae    1aa6 <malloc+0x96>
    1a3c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1a41:	39 de                	cmp    %ebx,%esi
    1a43:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1a46:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    1a4d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1a50:	eb 17                	jmp    1a69 <malloc+0x59>
    1a52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a58:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1a5a:	8b 48 04             	mov    0x4(%eax),%ecx
    1a5d:	39 f1                	cmp    %esi,%ecx
    1a5f:	73 4f                	jae    1ab0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1a61:	8b 3d 2c 20 00 00    	mov    0x202c,%edi
    1a67:	89 c2                	mov    %eax,%edx
    1a69:	39 d7                	cmp    %edx,%edi
    1a6b:	75 eb                	jne    1a58 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    1a6d:	83 ec 0c             	sub    $0xc,%esp
    1a70:	ff 75 e4             	push   -0x1c(%ebp)
    1a73:	e8 59 fc ff ff       	call   16d1 <sbrk>
  if(p == (char*)-1)
    1a78:	83 c4 10             	add    $0x10,%esp
    1a7b:	83 f8 ff             	cmp    $0xffffffff,%eax
    1a7e:	74 1c                	je     1a9c <malloc+0x8c>
  hp->s.size = nu;
    1a80:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1a83:	83 ec 0c             	sub    $0xc,%esp
    1a86:	83 c0 08             	add    $0x8,%eax
    1a89:	50                   	push   %eax
    1a8a:	e8 f1 fe ff ff       	call   1980 <free>
  return freep;
    1a8f:	8b 15 2c 20 00 00    	mov    0x202c,%edx
      if((p = morecore(nunits)) == 0)
    1a95:	83 c4 10             	add    $0x10,%esp
    1a98:	85 d2                	test   %edx,%edx
    1a9a:	75 bc                	jne    1a58 <malloc+0x48>
        return 0;
  }
}
    1a9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1a9f:	31 c0                	xor    %eax,%eax
}
    1aa1:	5b                   	pop    %ebx
    1aa2:	5e                   	pop    %esi
    1aa3:	5f                   	pop    %edi
    1aa4:	5d                   	pop    %ebp
    1aa5:	c3                   	ret    
    if(p->s.size >= nunits){
    1aa6:	89 d0                	mov    %edx,%eax
    1aa8:	89 fa                	mov    %edi,%edx
    1aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1ab0:	39 ce                	cmp    %ecx,%esi
    1ab2:	74 4c                	je     1b00 <malloc+0xf0>
        p->s.size -= nunits;
    1ab4:	29 f1                	sub    %esi,%ecx
    1ab6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1ab9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1abc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    1abf:	89 15 2c 20 00 00    	mov    %edx,0x202c
}
    1ac5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1ac8:	83 c0 08             	add    $0x8,%eax
}
    1acb:	5b                   	pop    %ebx
    1acc:	5e                   	pop    %esi
    1acd:	5f                   	pop    %edi
    1ace:	5d                   	pop    %ebp
    1acf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1ad0:	c7 05 2c 20 00 00 30 	movl   $0x2030,0x202c
    1ad7:	20 00 00 
    base.s.size = 0;
    1ada:	bf 30 20 00 00       	mov    $0x2030,%edi
    base.s.ptr = freep = prevp = &base;
    1adf:	c7 05 30 20 00 00 30 	movl   $0x2030,0x2030
    1ae6:	20 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1ae9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    1aeb:	c7 05 34 20 00 00 00 	movl   $0x0,0x2034
    1af2:	00 00 00 
    if(p->s.size >= nunits){
    1af5:	e9 42 ff ff ff       	jmp    1a3c <malloc+0x2c>
    1afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1b00:	8b 08                	mov    (%eax),%ecx
    1b02:	89 0a                	mov    %ecx,(%edx)
    1b04:	eb b9                	jmp    1abf <malloc+0xaf>
