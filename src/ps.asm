
_ps:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "pstat.h"
#include "user.h"
#include "param.h"
#include "pstat.h"
int
main(int argc, char *argv[]) {
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	56                   	push   %esi
    100e:	53                   	push   %ebx
    100f:	51                   	push   %ecx
    1010:	83 ec 18             	sub    $0x18,%esp
    struct pstat *prstat = malloc(sizeof(struct pstat));
    1013:	68 00 04 00 00       	push   $0x400
    1018:	e8 53 07 00 00       	call   1770 <malloc>
    101d:	89 c3                	mov    %eax,%ebx
    getpinfo(prstat);
    101f:	89 04 24             	mov    %eax,(%esp)
    1022:	e8 32 04 00 00       	call   1459 <getpinfo>
    int i;
    for(i=0;i<NPROC-1;i++){
    1027:	8d b3 fc 00 00 00    	lea    0xfc(%ebx),%esi
    102d:	83 c4 10             	add    $0x10,%esp
        if(prstat->inuse[i]>0){
    1030:	8b 03                	mov    (%ebx),%eax
    1032:	85 c0                	test   %eax,%eax
    1034:	7e 52                	jle    1088 <main+0x88>
            printf(1,"\nPInuse: %d ",prstat->inuse[i]);
    1036:	83 ec 04             	sub    $0x4,%esp
    1039:	50                   	push   %eax
    103a:	68 68 18 00 00       	push   $0x1868
    103f:	6a 01                	push   $0x1
    1041:	e8 fa 04 00 00       	call   1540 <printf>
            printf(1,"PID: %d ", prstat->pid[i]);
    1046:	83 c4 0c             	add    $0xc,%esp
    1049:	ff b3 00 02 00 00    	push   0x200(%ebx)
    104f:	68 75 18 00 00       	push   $0x1875
    1054:	6a 01                	push   $0x1
    1056:	e8 e5 04 00 00       	call   1540 <printf>
            printf(1,"PTickets: %d ", prstat->tickets[i]);
    105b:	83 c4 0c             	add    $0xc,%esp
    105e:	ff b3 00 01 00 00    	push   0x100(%ebx)
    1064:	68 7e 18 00 00       	push   $0x187e
    1069:	6a 01                	push   $0x1
    106b:	e8 d0 04 00 00       	call   1540 <printf>
            printf(1,"PTicks: %d",prstat->ticks[i]);
    1070:	83 c4 0c             	add    $0xc,%esp
    1073:	ff b3 00 03 00 00    	push   0x300(%ebx)
    1079:	68 8c 18 00 00       	push   $0x188c
    107e:	6a 01                	push   $0x1
    1080:	e8 bb 04 00 00       	call   1540 <printf>
    1085:	83 c4 10             	add    $0x10,%esp
    for(i=0;i<NPROC-1;i++){
    1088:	83 c3 04             	add    $0x4,%ebx
    108b:	39 f3                	cmp    %esi,%ebx
    108d:	75 a1                	jne    1030 <main+0x30>
        }
    }
    printf(1,"\n");
    108f:	83 ec 08             	sub    $0x8,%esp
    1092:	68 97 18 00 00       	push   $0x1897
    1097:	6a 01                	push   $0x1
    1099:	e8 a2 04 00 00       	call   1540 <printf>
    exit();
    109e:	e8 06 03 00 00       	call   13a9 <exit>
    10a3:	66 90                	xchg   %ax,%ax
    10a5:	66 90                	xchg   %ax,%ax
    10a7:	66 90                	xchg   %ax,%ax
    10a9:	66 90                	xchg   %ax,%ax
    10ab:	66 90                	xchg   %ax,%ax
    10ad:	66 90                	xchg   %ax,%ax
    10af:	90                   	nop

000010b0 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
    10b0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10b1:	31 c0                	xor    %eax,%eax
{
    10b3:	89 e5                	mov    %esp,%ebp
    10b5:	53                   	push   %ebx
    10b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    10bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    10c0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    10c4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    10c7:	83 c0 01             	add    $0x1,%eax
    10ca:	84 d2                	test   %dl,%dl
    10cc:	75 f2                	jne    10c0 <strcpy+0x10>
    ;
  return os;
}
    10ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10d1:	89 c8                	mov    %ecx,%eax
    10d3:	c9                   	leave  
    10d4:	c3                   	ret    
    10d5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	53                   	push   %ebx
    10e4:	8b 55 08             	mov    0x8(%ebp),%edx
    10e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10ea:	0f b6 02             	movzbl (%edx),%eax
    10ed:	84 c0                	test   %al,%al
    10ef:	75 17                	jne    1108 <strcmp+0x28>
    10f1:	eb 3a                	jmp    112d <strcmp+0x4d>
    10f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10f7:	90                   	nop
    10f8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    10fc:	83 c2 01             	add    $0x1,%edx
    10ff:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1102:	84 c0                	test   %al,%al
    1104:	74 1a                	je     1120 <strcmp+0x40>
    p++, q++;
    1106:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1108:	0f b6 19             	movzbl (%ecx),%ebx
    110b:	38 c3                	cmp    %al,%bl
    110d:	74 e9                	je     10f8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    110f:	29 d8                	sub    %ebx,%eax
}
    1111:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1114:	c9                   	leave  
    1115:	c3                   	ret    
    1116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1120:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1124:	31 c0                	xor    %eax,%eax
    1126:	29 d8                	sub    %ebx,%eax
}
    1128:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    112b:	c9                   	leave  
    112c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    112d:	0f b6 19             	movzbl (%ecx),%ebx
    1130:	31 c0                	xor    %eax,%eax
    1132:	eb db                	jmp    110f <strcmp+0x2f>
    1134:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    113b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    113f:	90                   	nop

00001140 <strlen>:

uint
strlen(const char *s)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1146:	80 3a 00             	cmpb   $0x0,(%edx)
    1149:	74 15                	je     1160 <strlen+0x20>
    114b:	31 c0                	xor    %eax,%eax
    114d:	8d 76 00             	lea    0x0(%esi),%esi
    1150:	83 c0 01             	add    $0x1,%eax
    1153:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1157:	89 c1                	mov    %eax,%ecx
    1159:	75 f5                	jne    1150 <strlen+0x10>
    ;
  return n;
}
    115b:	89 c8                	mov    %ecx,%eax
    115d:	5d                   	pop    %ebp
    115e:	c3                   	ret    
    115f:	90                   	nop
  for(n = 0; s[n]; n++)
    1160:	31 c9                	xor    %ecx,%ecx
}
    1162:	5d                   	pop    %ebp
    1163:	89 c8                	mov    %ecx,%eax
    1165:	c3                   	ret    
    1166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    116d:	8d 76 00             	lea    0x0(%esi),%esi

00001170 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	57                   	push   %edi
    1174:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1177:	8b 4d 10             	mov    0x10(%ebp),%ecx
    117a:	8b 45 0c             	mov    0xc(%ebp),%eax
    117d:	89 d7                	mov    %edx,%edi
    117f:	fc                   	cld    
    1180:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1182:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1185:	89 d0                	mov    %edx,%eax
    1187:	c9                   	leave  
    1188:	c3                   	ret    
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001190 <strchr>:

char*
strchr(const char *s, char c)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	8b 45 08             	mov    0x8(%ebp),%eax
    1196:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    119a:	0f b6 10             	movzbl (%eax),%edx
    119d:	84 d2                	test   %dl,%dl
    119f:	75 12                	jne    11b3 <strchr+0x23>
    11a1:	eb 1d                	jmp    11c0 <strchr+0x30>
    11a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11a7:	90                   	nop
    11a8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    11ac:	83 c0 01             	add    $0x1,%eax
    11af:	84 d2                	test   %dl,%dl
    11b1:	74 0d                	je     11c0 <strchr+0x30>
    if(*s == c)
    11b3:	38 d1                	cmp    %dl,%cl
    11b5:	75 f1                	jne    11a8 <strchr+0x18>
      return (char*)s;
  return 0;
}
    11b7:	5d                   	pop    %ebp
    11b8:	c3                   	ret    
    11b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    11c0:	31 c0                	xor    %eax,%eax
}
    11c2:	5d                   	pop    %ebp
    11c3:	c3                   	ret    
    11c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11cf:	90                   	nop

000011d0 <gets>:

char*
gets(char *buf, int max)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	57                   	push   %edi
    11d4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    11d5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    11d8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    11d9:	31 db                	xor    %ebx,%ebx
{
    11db:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    11de:	eb 27                	jmp    1207 <gets+0x37>
    cc = read(0, &c, 1);
    11e0:	83 ec 04             	sub    $0x4,%esp
    11e3:	6a 01                	push   $0x1
    11e5:	57                   	push   %edi
    11e6:	6a 00                	push   $0x0
    11e8:	e8 d4 01 00 00       	call   13c1 <read>
    if(cc < 1)
    11ed:	83 c4 10             	add    $0x10,%esp
    11f0:	85 c0                	test   %eax,%eax
    11f2:	7e 1d                	jle    1211 <gets+0x41>
      break;
    buf[i++] = c;
    11f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11f8:	8b 55 08             	mov    0x8(%ebp),%edx
    11fb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11ff:	3c 0a                	cmp    $0xa,%al
    1201:	74 1d                	je     1220 <gets+0x50>
    1203:	3c 0d                	cmp    $0xd,%al
    1205:	74 19                	je     1220 <gets+0x50>
  for(i=0; i+1 < max; ){
    1207:	89 de                	mov    %ebx,%esi
    1209:	83 c3 01             	add    $0x1,%ebx
    120c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    120f:	7c cf                	jl     11e0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1211:	8b 45 08             	mov    0x8(%ebp),%eax
    1214:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1218:	8d 65 f4             	lea    -0xc(%ebp),%esp
    121b:	5b                   	pop    %ebx
    121c:	5e                   	pop    %esi
    121d:	5f                   	pop    %edi
    121e:	5d                   	pop    %ebp
    121f:	c3                   	ret    
  buf[i] = '\0';
    1220:	8b 45 08             	mov    0x8(%ebp),%eax
    1223:	89 de                	mov    %ebx,%esi
    1225:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    1229:	8d 65 f4             	lea    -0xc(%ebp),%esp
    122c:	5b                   	pop    %ebx
    122d:	5e                   	pop    %esi
    122e:	5f                   	pop    %edi
    122f:	5d                   	pop    %ebp
    1230:	c3                   	ret    
    1231:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1238:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    123f:	90                   	nop

00001240 <stat>:

int
stat(const char *n, struct stat *st)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	56                   	push   %esi
    1244:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1245:	83 ec 08             	sub    $0x8,%esp
    1248:	6a 00                	push   $0x0
    124a:	ff 75 08             	push   0x8(%ebp)
    124d:	e8 97 01 00 00       	call   13e9 <open>
  if(fd < 0)
    1252:	83 c4 10             	add    $0x10,%esp
    1255:	85 c0                	test   %eax,%eax
    1257:	78 27                	js     1280 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1259:	83 ec 08             	sub    $0x8,%esp
    125c:	ff 75 0c             	push   0xc(%ebp)
    125f:	89 c3                	mov    %eax,%ebx
    1261:	50                   	push   %eax
    1262:	e8 9a 01 00 00       	call   1401 <fstat>
  close(fd);
    1267:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    126a:	89 c6                	mov    %eax,%esi
  close(fd);
    126c:	e8 60 01 00 00       	call   13d1 <close>
  return r;
    1271:	83 c4 10             	add    $0x10,%esp
}
    1274:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1277:	89 f0                	mov    %esi,%eax
    1279:	5b                   	pop    %ebx
    127a:	5e                   	pop    %esi
    127b:	5d                   	pop    %ebp
    127c:	c3                   	ret    
    127d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1280:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1285:	eb ed                	jmp    1274 <stat+0x34>
    1287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    128e:	66 90                	xchg   %ax,%ax

00001290 <atoi>:

int
atoi(const char *s)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	53                   	push   %ebx
    1294:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1297:	0f be 02             	movsbl (%edx),%eax
    129a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    129d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    12a0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    12a5:	77 1e                	ja     12c5 <atoi+0x35>
    12a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ae:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    12b0:	83 c2 01             	add    $0x1,%edx
    12b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    12b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    12ba:	0f be 02             	movsbl (%edx),%eax
    12bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
    12c0:	80 fb 09             	cmp    $0x9,%bl
    12c3:	76 eb                	jbe    12b0 <atoi+0x20>
  return n;
}
    12c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    12c8:	89 c8                	mov    %ecx,%eax
    12ca:	c9                   	leave  
    12cb:	c3                   	ret    
    12cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	57                   	push   %edi
    12d4:	8b 45 10             	mov    0x10(%ebp),%eax
    12d7:	8b 55 08             	mov    0x8(%ebp),%edx
    12da:	56                   	push   %esi
    12db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12de:	85 c0                	test   %eax,%eax
    12e0:	7e 13                	jle    12f5 <memmove+0x25>
    12e2:	01 d0                	add    %edx,%eax
  dst = vdst;
    12e4:	89 d7                	mov    %edx,%edi
    12e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ed:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12f1:	39 f8                	cmp    %edi,%eax
    12f3:	75 fb                	jne    12f0 <memmove+0x20>
  return vdst;
}
    12f5:	5e                   	pop    %esi
    12f6:	89 d0                	mov    %edx,%eax
    12f8:	5f                   	pop    %edi
    12f9:	5d                   	pop    %ebp
    12fa:	c3                   	ret    
    12fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12ff:	90                   	nop

00001300 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
    1306:	68 00 10 00 00       	push   $0x1000
    130b:	e8 60 04 00 00       	call   1770 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    1310:	50                   	push   %eax
    1311:	ff 75 10             	push   0x10(%ebp)
    1314:	ff 75 0c             	push   0xc(%ebp)
    1317:	ff 75 08             	push   0x8(%ebp)
    131a:	e8 42 01 00 00       	call   1461 <clone>
}
    131f:	c9                   	leave  
    1320:	c3                   	ret    
    1321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1328:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    132f:	90                   	nop

00001330 <lock_acquire>:

void lock_acquire(lock_thread *lock){
    1330:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1331:	b9 01 00 00 00       	mov    $0x1,%ecx
    1336:	89 e5                	mov    %esp,%ebp
    1338:	8b 55 08             	mov    0x8(%ebp),%edx
    133b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    133f:	90                   	nop
    1340:	89 c8                	mov    %ecx,%eax
    1342:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lock->locked, 1) != 0);
    1345:	85 c0                	test   %eax,%eax
    1347:	75 f7                	jne    1340 <lock_acquire+0x10>
}
    1349:	5d                   	pop    %ebp
    134a:	c3                   	ret    
    134b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    134f:	90                   	nop

00001350 <lock_release>:

void lock_release(lock_thread *lock){
    1350:	55                   	push   %ebp
    1351:	31 c0                	xor    %eax,%eax
    1353:	89 e5                	mov    %esp,%ebp
    1355:	8b 55 08             	mov    0x8(%ebp),%edx
    1358:	f0 87 02             	lock xchg %eax,(%edx)
	xchg(&lock->locked, 0);
}
    135b:	5d                   	pop    %ebp
    135c:	c3                   	ret    
    135d:	8d 76 00             	lea    0x0(%esi),%esi

00001360 <lock_init>:

int lock_init(lock_thread *lock)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	83 ec 10             	sub    $0x10,%esp
  printf(1,"12");
    1366:	68 99 18 00 00       	push   $0x1899
    136b:	6a 01                	push   $0x1
    136d:	e8 ce 01 00 00       	call   1540 <printf>
  lock->locked = 0;
    1372:	8b 45 08             	mov    0x8(%ebp),%eax
    1375:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  printf(1,"12");
    137b:	58                   	pop    %eax
    137c:	5a                   	pop    %edx
    137d:	68 99 18 00 00       	push   $0x1899
    1382:	6a 01                	push   $0x1
    1384:	e8 b7 01 00 00       	call   1540 <printf>
  return 0;
}
    1389:	31 c0                	xor    %eax,%eax
    138b:	c9                   	leave  
    138c:	c3                   	ret    
    138d:	8d 76 00             	lea    0x0(%esi),%esi

00001390 <thread_join>:



int thread_join()
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int a = join(&stackPtr);
    1396:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1399:	50                   	push   %eax
    139a:	e8 ca 00 00 00       	call   1469 <join>
  return a;
    139f:	c9                   	leave  
    13a0:	c3                   	ret    

000013a1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    13a1:	b8 01 00 00 00       	mov    $0x1,%eax
    13a6:	cd 40                	int    $0x40
    13a8:	c3                   	ret    

000013a9 <exit>:
SYSCALL(exit)
    13a9:	b8 02 00 00 00       	mov    $0x2,%eax
    13ae:	cd 40                	int    $0x40
    13b0:	c3                   	ret    

000013b1 <wait>:
SYSCALL(wait)
    13b1:	b8 03 00 00 00       	mov    $0x3,%eax
    13b6:	cd 40                	int    $0x40
    13b8:	c3                   	ret    

000013b9 <pipe>:
SYSCALL(pipe)
    13b9:	b8 04 00 00 00       	mov    $0x4,%eax
    13be:	cd 40                	int    $0x40
    13c0:	c3                   	ret    

000013c1 <read>:
SYSCALL(read)
    13c1:	b8 05 00 00 00       	mov    $0x5,%eax
    13c6:	cd 40                	int    $0x40
    13c8:	c3                   	ret    

000013c9 <write>:
SYSCALL(write)
    13c9:	b8 10 00 00 00       	mov    $0x10,%eax
    13ce:	cd 40                	int    $0x40
    13d0:	c3                   	ret    

000013d1 <close>:
SYSCALL(close)
    13d1:	b8 15 00 00 00       	mov    $0x15,%eax
    13d6:	cd 40                	int    $0x40
    13d8:	c3                   	ret    

000013d9 <kill>:
SYSCALL(kill)
    13d9:	b8 06 00 00 00       	mov    $0x6,%eax
    13de:	cd 40                	int    $0x40
    13e0:	c3                   	ret    

000013e1 <exec>:
SYSCALL(exec)
    13e1:	b8 07 00 00 00       	mov    $0x7,%eax
    13e6:	cd 40                	int    $0x40
    13e8:	c3                   	ret    

000013e9 <open>:
SYSCALL(open)
    13e9:	b8 0f 00 00 00       	mov    $0xf,%eax
    13ee:	cd 40                	int    $0x40
    13f0:	c3                   	ret    

000013f1 <mknod>:
SYSCALL(mknod)
    13f1:	b8 11 00 00 00       	mov    $0x11,%eax
    13f6:	cd 40                	int    $0x40
    13f8:	c3                   	ret    

000013f9 <unlink>:
SYSCALL(unlink)
    13f9:	b8 12 00 00 00       	mov    $0x12,%eax
    13fe:	cd 40                	int    $0x40
    1400:	c3                   	ret    

00001401 <fstat>:
SYSCALL(fstat)
    1401:	b8 08 00 00 00       	mov    $0x8,%eax
    1406:	cd 40                	int    $0x40
    1408:	c3                   	ret    

00001409 <link>:
SYSCALL(link)
    1409:	b8 13 00 00 00       	mov    $0x13,%eax
    140e:	cd 40                	int    $0x40
    1410:	c3                   	ret    

00001411 <mkdir>:
SYSCALL(mkdir)
    1411:	b8 14 00 00 00       	mov    $0x14,%eax
    1416:	cd 40                	int    $0x40
    1418:	c3                   	ret    

00001419 <chdir>:
SYSCALL(chdir)
    1419:	b8 09 00 00 00       	mov    $0x9,%eax
    141e:	cd 40                	int    $0x40
    1420:	c3                   	ret    

00001421 <dup>:
SYSCALL(dup)
    1421:	b8 0a 00 00 00       	mov    $0xa,%eax
    1426:	cd 40                	int    $0x40
    1428:	c3                   	ret    

00001429 <getpid>:
SYSCALL(getpid)
    1429:	b8 0b 00 00 00       	mov    $0xb,%eax
    142e:	cd 40                	int    $0x40
    1430:	c3                   	ret    

00001431 <sbrk>:
SYSCALL(sbrk)
    1431:	b8 0c 00 00 00       	mov    $0xc,%eax
    1436:	cd 40                	int    $0x40
    1438:	c3                   	ret    

00001439 <sleep>:
SYSCALL(sleep)
    1439:	b8 0d 00 00 00       	mov    $0xd,%eax
    143e:	cd 40                	int    $0x40
    1440:	c3                   	ret    

00001441 <uptime>:
SYSCALL(uptime)
    1441:	b8 0e 00 00 00       	mov    $0xe,%eax
    1446:	cd 40                	int    $0x40
    1448:	c3                   	ret    

00001449 <getreadcount>:
SYSCALL(getreadcount)
    1449:	b8 16 00 00 00       	mov    $0x16,%eax
    144e:	cd 40                	int    $0x40
    1450:	c3                   	ret    

00001451 <settickets>:
SYSCALL(settickets)
    1451:	b8 17 00 00 00       	mov    $0x17,%eax
    1456:	cd 40                	int    $0x40
    1458:	c3                   	ret    

00001459 <getpinfo>:
SYSCALL(getpinfo)
    1459:	b8 18 00 00 00       	mov    $0x18,%eax
    145e:	cd 40                	int    $0x40
    1460:	c3                   	ret    

00001461 <clone>:
SYSCALL(clone)
    1461:	b8 19 00 00 00       	mov    $0x19,%eax
    1466:	cd 40                	int    $0x40
    1468:	c3                   	ret    

00001469 <join>:
SYSCALL(join)
    1469:	b8 1a 00 00 00       	mov    $0x1a,%eax
    146e:	cd 40                	int    $0x40
    1470:	c3                   	ret    

00001471 <mprotect>:
SYSCALL(mprotect)
    1471:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1476:	cd 40                	int    $0x40
    1478:	c3                   	ret    

00001479 <munprotect>:
SYSCALL(munprotect)
    1479:	b8 1c 00 00 00       	mov    $0x1c,%eax
    147e:	cd 40                	int    $0x40
    1480:	c3                   	ret    
    1481:	66 90                	xchg   %ax,%ax
    1483:	66 90                	xchg   %ax,%ax
    1485:	66 90                	xchg   %ax,%ax
    1487:	66 90                	xchg   %ax,%ax
    1489:	66 90                	xchg   %ax,%ax
    148b:	66 90                	xchg   %ax,%ax
    148d:	66 90                	xchg   %ax,%ax
    148f:	90                   	nop

00001490 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1490:	55                   	push   %ebp
    1491:	89 e5                	mov    %esp,%ebp
    1493:	57                   	push   %edi
    1494:	56                   	push   %esi
    1495:	53                   	push   %ebx
    1496:	83 ec 3c             	sub    $0x3c,%esp
    1499:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    149c:	89 d1                	mov    %edx,%ecx
{
    149e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    14a1:	85 d2                	test   %edx,%edx
    14a3:	0f 89 7f 00 00 00    	jns    1528 <printint+0x98>
    14a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    14ad:	74 79                	je     1528 <printint+0x98>
    neg = 1;
    14af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    14b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    14b8:	31 db                	xor    %ebx,%ebx
    14ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
    14bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    14c0:	89 c8                	mov    %ecx,%eax
    14c2:	31 d2                	xor    %edx,%edx
    14c4:	89 cf                	mov    %ecx,%edi
    14c6:	f7 75 c4             	divl   -0x3c(%ebp)
    14c9:	0f b6 92 fc 18 00 00 	movzbl 0x18fc(%edx),%edx
    14d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    14d3:	89 d8                	mov    %ebx,%eax
    14d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    14d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    14db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    14de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    14e1:	76 dd                	jbe    14c0 <printint+0x30>
  if(neg)
    14e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    14e6:	85 c9                	test   %ecx,%ecx
    14e8:	74 0c                	je     14f6 <printint+0x66>
    buf[i++] = '-';
    14ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    14ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    14f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    14f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    14f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    14fd:	eb 07                	jmp    1506 <printint+0x76>
    14ff:	90                   	nop
    putc(fd, buf[i]);
    1500:	0f b6 13             	movzbl (%ebx),%edx
    1503:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1506:	83 ec 04             	sub    $0x4,%esp
    1509:	88 55 d7             	mov    %dl,-0x29(%ebp)
    150c:	6a 01                	push   $0x1
    150e:	56                   	push   %esi
    150f:	57                   	push   %edi
    1510:	e8 b4 fe ff ff       	call   13c9 <write>
  while(--i >= 0)
    1515:	83 c4 10             	add    $0x10,%esp
    1518:	39 de                	cmp    %ebx,%esi
    151a:	75 e4                	jne    1500 <printint+0x70>
}
    151c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    151f:	5b                   	pop    %ebx
    1520:	5e                   	pop    %esi
    1521:	5f                   	pop    %edi
    1522:	5d                   	pop    %ebp
    1523:	c3                   	ret    
    1524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1528:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    152f:	eb 87                	jmp    14b8 <printint+0x28>
    1531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1538:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    153f:	90                   	nop

00001540 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1540:	55                   	push   %ebp
    1541:	89 e5                	mov    %esp,%ebp
    1543:	57                   	push   %edi
    1544:	56                   	push   %esi
    1545:	53                   	push   %ebx
    1546:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1549:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    154c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    154f:	0f b6 13             	movzbl (%ebx),%edx
    1552:	84 d2                	test   %dl,%dl
    1554:	74 6a                	je     15c0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1556:	8d 45 10             	lea    0x10(%ebp),%eax
    1559:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    155c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    155f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1561:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1564:	eb 36                	jmp    159c <printf+0x5c>
    1566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    156d:	8d 76 00             	lea    0x0(%esi),%esi
    1570:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1573:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1578:	83 f8 25             	cmp    $0x25,%eax
    157b:	74 15                	je     1592 <printf+0x52>
  write(fd, &c, 1);
    157d:	83 ec 04             	sub    $0x4,%esp
    1580:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1583:	6a 01                	push   $0x1
    1585:	57                   	push   %edi
    1586:	56                   	push   %esi
    1587:	e8 3d fe ff ff       	call   13c9 <write>
    158c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    158f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1592:	0f b6 13             	movzbl (%ebx),%edx
    1595:	83 c3 01             	add    $0x1,%ebx
    1598:	84 d2                	test   %dl,%dl
    159a:	74 24                	je     15c0 <printf+0x80>
    c = fmt[i] & 0xff;
    159c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    159f:	85 c9                	test   %ecx,%ecx
    15a1:	74 cd                	je     1570 <printf+0x30>
      }
    } else if(state == '%'){
    15a3:	83 f9 25             	cmp    $0x25,%ecx
    15a6:	75 ea                	jne    1592 <printf+0x52>
      if(c == 'd'){
    15a8:	83 f8 25             	cmp    $0x25,%eax
    15ab:	0f 84 07 01 00 00    	je     16b8 <printf+0x178>
    15b1:	83 e8 63             	sub    $0x63,%eax
    15b4:	83 f8 15             	cmp    $0x15,%eax
    15b7:	77 17                	ja     15d0 <printf+0x90>
    15b9:	ff 24 85 a4 18 00 00 	jmp    *0x18a4(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    15c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15c3:	5b                   	pop    %ebx
    15c4:	5e                   	pop    %esi
    15c5:	5f                   	pop    %edi
    15c6:	5d                   	pop    %ebp
    15c7:	c3                   	ret    
    15c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15cf:	90                   	nop
  write(fd, &c, 1);
    15d0:	83 ec 04             	sub    $0x4,%esp
    15d3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    15d6:	6a 01                	push   $0x1
    15d8:	57                   	push   %edi
    15d9:	56                   	push   %esi
    15da:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    15de:	e8 e6 fd ff ff       	call   13c9 <write>
        putc(fd, c);
    15e3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    15e7:	83 c4 0c             	add    $0xc,%esp
    15ea:	88 55 e7             	mov    %dl,-0x19(%ebp)
    15ed:	6a 01                	push   $0x1
    15ef:	57                   	push   %edi
    15f0:	56                   	push   %esi
    15f1:	e8 d3 fd ff ff       	call   13c9 <write>
        putc(fd, c);
    15f6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15f9:	31 c9                	xor    %ecx,%ecx
    15fb:	eb 95                	jmp    1592 <printf+0x52>
    15fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1600:	83 ec 0c             	sub    $0xc,%esp
    1603:	b9 10 00 00 00       	mov    $0x10,%ecx
    1608:	6a 00                	push   $0x0
    160a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    160d:	8b 10                	mov    (%eax),%edx
    160f:	89 f0                	mov    %esi,%eax
    1611:	e8 7a fe ff ff       	call   1490 <printint>
        ap++;
    1616:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    161a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    161d:	31 c9                	xor    %ecx,%ecx
    161f:	e9 6e ff ff ff       	jmp    1592 <printf+0x52>
    1624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1628:	8b 45 d0             	mov    -0x30(%ebp),%eax
    162b:	8b 10                	mov    (%eax),%edx
        ap++;
    162d:	83 c0 04             	add    $0x4,%eax
    1630:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1633:	85 d2                	test   %edx,%edx
    1635:	0f 84 8d 00 00 00    	je     16c8 <printf+0x188>
        while(*s != 0){
    163b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    163e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1640:	84 c0                	test   %al,%al
    1642:	0f 84 4a ff ff ff    	je     1592 <printf+0x52>
    1648:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    164b:	89 d3                	mov    %edx,%ebx
    164d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1650:	83 ec 04             	sub    $0x4,%esp
          s++;
    1653:	83 c3 01             	add    $0x1,%ebx
    1656:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1659:	6a 01                	push   $0x1
    165b:	57                   	push   %edi
    165c:	56                   	push   %esi
    165d:	e8 67 fd ff ff       	call   13c9 <write>
        while(*s != 0){
    1662:	0f b6 03             	movzbl (%ebx),%eax
    1665:	83 c4 10             	add    $0x10,%esp
    1668:	84 c0                	test   %al,%al
    166a:	75 e4                	jne    1650 <printf+0x110>
      state = 0;
    166c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    166f:	31 c9                	xor    %ecx,%ecx
    1671:	e9 1c ff ff ff       	jmp    1592 <printf+0x52>
    1676:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    167d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1680:	83 ec 0c             	sub    $0xc,%esp
    1683:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1688:	6a 01                	push   $0x1
    168a:	e9 7b ff ff ff       	jmp    160a <printf+0xca>
    168f:	90                   	nop
        putc(fd, *ap);
    1690:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1693:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1696:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1698:	6a 01                	push   $0x1
    169a:	57                   	push   %edi
    169b:	56                   	push   %esi
        putc(fd, *ap);
    169c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    169f:	e8 25 fd ff ff       	call   13c9 <write>
        ap++;
    16a4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    16a8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16ab:	31 c9                	xor    %ecx,%ecx
    16ad:	e9 e0 fe ff ff       	jmp    1592 <printf+0x52>
    16b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    16b8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    16bb:	83 ec 04             	sub    $0x4,%esp
    16be:	e9 2a ff ff ff       	jmp    15ed <printf+0xad>
    16c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16c7:	90                   	nop
          s = "(null)";
    16c8:	ba 9c 18 00 00       	mov    $0x189c,%edx
        while(*s != 0){
    16cd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    16d0:	b8 28 00 00 00       	mov    $0x28,%eax
    16d5:	89 d3                	mov    %edx,%ebx
    16d7:	e9 74 ff ff ff       	jmp    1650 <printf+0x110>
    16dc:	66 90                	xchg   %ax,%ax
    16de:	66 90                	xchg   %ax,%ax

000016e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16e1:	a1 4c 1c 00 00       	mov    0x1c4c,%eax
{
    16e6:	89 e5                	mov    %esp,%ebp
    16e8:	57                   	push   %edi
    16e9:	56                   	push   %esi
    16ea:	53                   	push   %ebx
    16eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    16ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16f8:	89 c2                	mov    %eax,%edx
    16fa:	8b 00                	mov    (%eax),%eax
    16fc:	39 ca                	cmp    %ecx,%edx
    16fe:	73 30                	jae    1730 <free+0x50>
    1700:	39 c1                	cmp    %eax,%ecx
    1702:	72 04                	jb     1708 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1704:	39 c2                	cmp    %eax,%edx
    1706:	72 f0                	jb     16f8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1708:	8b 73 fc             	mov    -0x4(%ebx),%esi
    170b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    170e:	39 f8                	cmp    %edi,%eax
    1710:	74 30                	je     1742 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1712:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1715:	8b 42 04             	mov    0x4(%edx),%eax
    1718:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    171b:	39 f1                	cmp    %esi,%ecx
    171d:	74 3a                	je     1759 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    171f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1721:	5b                   	pop    %ebx
  freep = p;
    1722:	89 15 4c 1c 00 00    	mov    %edx,0x1c4c
}
    1728:	5e                   	pop    %esi
    1729:	5f                   	pop    %edi
    172a:	5d                   	pop    %ebp
    172b:	c3                   	ret    
    172c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1730:	39 c2                	cmp    %eax,%edx
    1732:	72 c4                	jb     16f8 <free+0x18>
    1734:	39 c1                	cmp    %eax,%ecx
    1736:	73 c0                	jae    16f8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1738:	8b 73 fc             	mov    -0x4(%ebx),%esi
    173b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    173e:	39 f8                	cmp    %edi,%eax
    1740:	75 d0                	jne    1712 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1742:	03 70 04             	add    0x4(%eax),%esi
    1745:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1748:	8b 02                	mov    (%edx),%eax
    174a:	8b 00                	mov    (%eax),%eax
    174c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    174f:	8b 42 04             	mov    0x4(%edx),%eax
    1752:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1755:	39 f1                	cmp    %esi,%ecx
    1757:	75 c6                	jne    171f <free+0x3f>
    p->s.size += bp->s.size;
    1759:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    175c:	89 15 4c 1c 00 00    	mov    %edx,0x1c4c
    p->s.size += bp->s.size;
    1762:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1765:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1768:	89 0a                	mov    %ecx,(%edx)
}
    176a:	5b                   	pop    %ebx
    176b:	5e                   	pop    %esi
    176c:	5f                   	pop    %edi
    176d:	5d                   	pop    %ebp
    176e:	c3                   	ret    
    176f:	90                   	nop

00001770 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1770:	55                   	push   %ebp
    1771:	89 e5                	mov    %esp,%ebp
    1773:	57                   	push   %edi
    1774:	56                   	push   %esi
    1775:	53                   	push   %ebx
    1776:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1779:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    177c:	8b 3d 4c 1c 00 00    	mov    0x1c4c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1782:	8d 70 07             	lea    0x7(%eax),%esi
    1785:	c1 ee 03             	shr    $0x3,%esi
    1788:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    178b:	85 ff                	test   %edi,%edi
    178d:	0f 84 9d 00 00 00    	je     1830 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1793:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1795:	8b 4a 04             	mov    0x4(%edx),%ecx
    1798:	39 f1                	cmp    %esi,%ecx
    179a:	73 6a                	jae    1806 <malloc+0x96>
    179c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    17a1:	39 de                	cmp    %ebx,%esi
    17a3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    17a6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    17ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    17b0:	eb 17                	jmp    17c9 <malloc+0x59>
    17b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    17ba:	8b 48 04             	mov    0x4(%eax),%ecx
    17bd:	39 f1                	cmp    %esi,%ecx
    17bf:	73 4f                	jae    1810 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    17c1:	8b 3d 4c 1c 00 00    	mov    0x1c4c,%edi
    17c7:	89 c2                	mov    %eax,%edx
    17c9:	39 d7                	cmp    %edx,%edi
    17cb:	75 eb                	jne    17b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    17cd:	83 ec 0c             	sub    $0xc,%esp
    17d0:	ff 75 e4             	push   -0x1c(%ebp)
    17d3:	e8 59 fc ff ff       	call   1431 <sbrk>
  if(p == (char*)-1)
    17d8:	83 c4 10             	add    $0x10,%esp
    17db:	83 f8 ff             	cmp    $0xffffffff,%eax
    17de:	74 1c                	je     17fc <malloc+0x8c>
  hp->s.size = nu;
    17e0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    17e3:	83 ec 0c             	sub    $0xc,%esp
    17e6:	83 c0 08             	add    $0x8,%eax
    17e9:	50                   	push   %eax
    17ea:	e8 f1 fe ff ff       	call   16e0 <free>
  return freep;
    17ef:	8b 15 4c 1c 00 00    	mov    0x1c4c,%edx
      if((p = morecore(nunits)) == 0)
    17f5:	83 c4 10             	add    $0x10,%esp
    17f8:	85 d2                	test   %edx,%edx
    17fa:	75 bc                	jne    17b8 <malloc+0x48>
        return 0;
  }
}
    17fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    17ff:	31 c0                	xor    %eax,%eax
}
    1801:	5b                   	pop    %ebx
    1802:	5e                   	pop    %esi
    1803:	5f                   	pop    %edi
    1804:	5d                   	pop    %ebp
    1805:	c3                   	ret    
    if(p->s.size >= nunits){
    1806:	89 d0                	mov    %edx,%eax
    1808:	89 fa                	mov    %edi,%edx
    180a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1810:	39 ce                	cmp    %ecx,%esi
    1812:	74 4c                	je     1860 <malloc+0xf0>
        p->s.size -= nunits;
    1814:	29 f1                	sub    %esi,%ecx
    1816:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    181c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    181f:	89 15 4c 1c 00 00    	mov    %edx,0x1c4c
}
    1825:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1828:	83 c0 08             	add    $0x8,%eax
}
    182b:	5b                   	pop    %ebx
    182c:	5e                   	pop    %esi
    182d:	5f                   	pop    %edi
    182e:	5d                   	pop    %ebp
    182f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1830:	c7 05 4c 1c 00 00 50 	movl   $0x1c50,0x1c4c
    1837:	1c 00 00 
    base.s.size = 0;
    183a:	bf 50 1c 00 00       	mov    $0x1c50,%edi
    base.s.ptr = freep = prevp = &base;
    183f:	c7 05 50 1c 00 00 50 	movl   $0x1c50,0x1c50
    1846:	1c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1849:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    184b:	c7 05 54 1c 00 00 00 	movl   $0x0,0x1c54
    1852:	00 00 00 
    if(p->s.size >= nunits){
    1855:	e9 42 ff ff ff       	jmp    179c <malloc+0x2c>
    185a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1860:	8b 08                	mov    (%eax),%ecx
    1862:	89 0a                	mov    %ecx,(%edx)
    1864:	eb b9                	jmp    181f <malloc+0xaf>
