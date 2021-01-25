
_thread_test2:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
}


int
main(int argc, char *argv[])
{
    1000:	f3 0f 1e fb          	endbr32 
    1004:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1008:	83 e4 f0             	and    $0xfffffff0,%esp
    100b:	ff 71 fc             	pushl  -0x4(%ecx)
    100e:	55                   	push   %ebp
    100f:	89 e5                	mov    %esp,%ebp
    1011:	51                   	push   %ecx
    1012:	83 ec 1c             	sub    $0x1c,%esp
  
  int x=3,y=4;
    1015:	c7 45 f0 03 00 00 00 	movl   $0x3,-0x10(%ebp)
  printf(1, "RUNNING..\n");
    101c:	68 3a 1a 00 00       	push   $0x1a3a
    1021:	6a 01                	push   $0x1
  int x=3,y=4;
    1023:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
  printf(1, "RUNNING..\n");
    102a:	e8 d1 07 00 00       	call   1800 <printf>
  thread_create(&f,&x,&y);
    102f:	83 c4 0c             	add    $0xc,%esp
    1032:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1035:	50                   	push   %eax
    1036:	8d 45 f0             	lea    -0x10(%ebp),%eax
    1039:	50                   	push   %eax
    103a:	68 30 11 00 00       	push   $0x1130
    103f:	e8 fc 05 00 00       	call   1640 <thread_create>
  thread_join();
    1044:	e8 d7 03 00 00       	call   1420 <thread_join>
  printf(1, "FINISHING .\n");
    1049:	58                   	pop    %eax
    104a:	5a                   	pop    %edx
    104b:	68 45 1a 00 00       	push   $0x1a45
    1050:	6a 01                	push   $0x1
    1052:	e8 a9 07 00 00       	call   1800 <printf>
  exit();
    1057:	e8 11 06 00 00       	call   166d <exit>
    105c:	66 90                	xchg   %ax,%ax
    105e:	66 90                	xchg   %ax,%ax

00001060 <s>:
void s(void* v1,void* v2){
    1060:	f3 0f 1e fb          	endbr32 
    1064:	55                   	push   %ebp
    1065:	89 e5                	mov    %esp,%ebp
    1067:	83 ec 10             	sub    $0x10,%esp
printf(1,"1st thread'c child2 \n");
    106a:	68 c8 19 00 00       	push   $0x19c8
    106f:	6a 01                	push   $0x1
    1071:	e8 8a 07 00 00       	call   1800 <printf>
printf(1,"%d + %d is : %d \n",*(int*)v1, *(int*)v2,*(int*)v1 + *(int*)v2 );
    1076:	8b 45 08             	mov    0x8(%ebp),%eax
    1079:	8b 55 0c             	mov    0xc(%ebp),%edx
    107c:	8b 00                	mov    (%eax),%eax
    107e:	8b 12                	mov    (%edx),%edx
    1080:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
    1083:	89 0c 24             	mov    %ecx,(%esp)
    1086:	52                   	push   %edx
    1087:	50                   	push   %eax
    1088:	68 de 19 00 00       	push   $0x19de
    108d:	6a 01                	push   $0x1
    108f:	e8 6c 07 00 00       	call   1800 <printf>
exit();
    1094:	83 c4 20             	add    $0x20,%esp
    1097:	e8 d1 05 00 00       	call   166d <exit>
    109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010a0 <p>:
void p(void* argm1,void* argm2){
    10a0:	f3 0f 1e fb          	endbr32 
    10a4:	55                   	push   %ebp
    10a5:	89 e5                	mov    %esp,%ebp
    10a7:	57                   	push   %edi
    10a8:	56                   	push   %esi
    10a9:	53                   	push   %ebx
    10aa:	83 ec 14             	sub    $0x14,%esp
    10ad:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    10b0:	8b 75 08             	mov    0x8(%ebp),%esi
printf(1,"1st thread'c child1 \n");
    10b3:	68 f0 19 00 00       	push   $0x19f0
    10b8:	6a 01                	push   $0x1
    10ba:	e8 41 07 00 00       	call   1800 <printf>
printf(1,"%d power %d is ",*(int*)argm1,*(int*)argm2);
    10bf:	ff 33                	pushl  (%ebx)
    10c1:	ff 36                	pushl  (%esi)
    10c3:	68 06 1a 00 00       	push   $0x1a06
    10c8:	6a 01                	push   $0x1
    10ca:	e8 31 07 00 00       	call   1800 <printf>
for(i=0; i< *(int*) argm2; i++){
    10cf:	8b 0b                	mov    (%ebx),%ecx
    10d1:	83 c4 20             	add    $0x20,%esp
    10d4:	85 c9                	test   %ecx,%ecx
    10d6:	7e 43                	jle    111b <p+0x7b>
 res = (*(int*) argm1 ) * res;
    10d8:	8b 3e                	mov    (%esi),%edi
int i , res =1;
    10da:	ba 01 00 00 00       	mov    $0x1,%edx
for(i=0; i< *(int*) argm2; i++){
    10df:	31 c0                	xor    %eax,%eax
    10e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10e8:	83 c0 01             	add    $0x1,%eax
 res = (*(int*) argm1 ) * res;
    10eb:	0f af d7             	imul   %edi,%edx
for(i=0; i< *(int*) argm2; i++){
    10ee:	39 c8                	cmp    %ecx,%eax
    10f0:	75 f6                	jne    10e8 <p+0x48>
printf(1, ": %d\n",res);
    10f2:	83 ec 04             	sub    $0x4,%esp
    10f5:	52                   	push   %edx
    10f6:	68 16 1a 00 00       	push   $0x1a16
    10fb:	6a 01                	push   $0x1
    10fd:	e8 fe 06 00 00       	call   1800 <printf>
thread_create(&s,argm1,argm2);
    1102:	83 c4 0c             	add    $0xc,%esp
    1105:	53                   	push   %ebx
    1106:	56                   	push   %esi
    1107:	68 60 10 00 00       	push   $0x1060
    110c:	e8 2f 05 00 00       	call   1640 <thread_create>
thread_join();
    1111:	e8 0a 03 00 00       	call   1420 <thread_join>
exit();
    1116:	e8 52 05 00 00       	call   166d <exit>
int i , res =1;
    111b:	ba 01 00 00 00       	mov    $0x1,%edx
    1120:	eb d0                	jmp    10f2 <p+0x52>
    1122:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001130 <f>:
void f(void* arg1,void* arg2){
    1130:	f3 0f 1e fb          	endbr32 
    1134:	55                   	push   %ebp
    1135:	89 e5                	mov    %esp,%ebp
    1137:	53                   	push   %ebx
    1138:	83 ec 0c             	sub    $0xc,%esp
    113b:	8b 5d 08             	mov    0x8(%ebp),%ebx
printf(1,"1st thread \n");
    113e:	68 1c 1a 00 00       	push   $0x1a1c
    1143:	6a 01                	push   $0x1
    1145:	e8 b6 06 00 00       	call   1800 <printf>
printf(1,"%d factorial is ",*(int*)arg1);
    114a:	83 c4 0c             	add    $0xc,%esp
    114d:	ff 33                	pushl  (%ebx)
    114f:	68 29 1a 00 00       	push   $0x1a29
    1154:	6a 01                	push   $0x1
    1156:	e8 a5 06 00 00       	call   1800 <printf>
for(i=1; i<= *(int*) arg1; i++){
    115b:	8b 0b                	mov    (%ebx),%ecx
    115d:	83 c4 10             	add    $0x10,%esp
    1160:	85 c9                	test   %ecx,%ecx
    1162:	7e 49                	jle    11ad <f+0x7d>
    1164:	83 c1 01             	add    $0x1,%ecx
int i , res =1;
    1167:	ba 01 00 00 00       	mov    $0x1,%edx
for(i=1; i<= *(int*) arg1; i++){
    116c:	b8 01 00 00 00       	mov    $0x1,%eax
    1171:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 res = res *i;
    1178:	0f af d0             	imul   %eax,%edx
for(i=1; i<= *(int*) arg1; i++){
    117b:	83 c0 01             	add    $0x1,%eax
    117e:	39 c1                	cmp    %eax,%ecx
    1180:	75 f6                	jne    1178 <f+0x48>
printf(1, ": %d\n",res);
    1182:	83 ec 04             	sub    $0x4,%esp
    1185:	52                   	push   %edx
    1186:	68 16 1a 00 00       	push   $0x1a16
    118b:	6a 01                	push   $0x1
    118d:	e8 6e 06 00 00       	call   1800 <printf>
  thread_create(&p,arg1,arg2);
    1192:	83 c4 0c             	add    $0xc,%esp
    1195:	ff 75 0c             	pushl  0xc(%ebp)
    1198:	53                   	push   %ebx
    1199:	68 a0 10 00 00       	push   $0x10a0
    119e:	e8 9d 04 00 00       	call   1640 <thread_create>
  thread_join();
    11a3:	e8 78 02 00 00       	call   1420 <thread_join>
exit();
    11a8:	e8 c0 04 00 00       	call   166d <exit>
int i , res =1;
    11ad:	ba 01 00 00 00       	mov    $0x1,%edx
    11b2:	eb ce                	jmp    1182 <f+0x52>
    11b4:	66 90                	xchg   %ax,%ax
    11b6:	66 90                	xchg   %ax,%ax
    11b8:	66 90                	xchg   %ax,%ax
    11ba:	66 90                	xchg   %ax,%ax
    11bc:	66 90                	xchg   %ax,%ax
    11be:	66 90                	xchg   %ax,%ax

000011c0 <strcpy>:
};


char*
strcpy(char *s, const char *t)
{
    11c0:	f3 0f 1e fb          	endbr32 
    11c4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    11c5:	31 c0                	xor    %eax,%eax
{
    11c7:	89 e5                	mov    %esp,%ebp
    11c9:	53                   	push   %ebx
    11ca:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11cd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    11d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    11d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    11d7:	83 c0 01             	add    $0x1,%eax
    11da:	84 d2                	test   %dl,%dl
    11dc:	75 f2                	jne    11d0 <strcpy+0x10>
    ;
  return os;
}
    11de:	89 c8                	mov    %ecx,%eax
    11e0:	5b                   	pop    %ebx
    11e1:	5d                   	pop    %ebp
    11e2:	c3                   	ret    
    11e3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000011f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    11f0:	f3 0f 1e fb          	endbr32 
    11f4:	55                   	push   %ebp
    11f5:	89 e5                	mov    %esp,%ebp
    11f7:	53                   	push   %ebx
    11f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11fb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    11fe:	0f b6 01             	movzbl (%ecx),%eax
    1201:	0f b6 1a             	movzbl (%edx),%ebx
    1204:	84 c0                	test   %al,%al
    1206:	75 19                	jne    1221 <strcmp+0x31>
    1208:	eb 26                	jmp    1230 <strcmp+0x40>
    120a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1210:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    1214:	83 c1 01             	add    $0x1,%ecx
    1217:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    121a:	0f b6 1a             	movzbl (%edx),%ebx
    121d:	84 c0                	test   %al,%al
    121f:	74 0f                	je     1230 <strcmp+0x40>
    1221:	38 d8                	cmp    %bl,%al
    1223:	74 eb                	je     1210 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1225:	29 d8                	sub    %ebx,%eax
}
    1227:	5b                   	pop    %ebx
    1228:	5d                   	pop    %ebp
    1229:	c3                   	ret    
    122a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1230:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1232:	29 d8                	sub    %ebx,%eax
}
    1234:	5b                   	pop    %ebx
    1235:	5d                   	pop    %ebp
    1236:	c3                   	ret    
    1237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    123e:	66 90                	xchg   %ax,%ax

00001240 <strlen>:

uint
strlen(const char *s)
{
    1240:	f3 0f 1e fb          	endbr32 
    1244:	55                   	push   %ebp
    1245:	89 e5                	mov    %esp,%ebp
    1247:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    124a:	80 3a 00             	cmpb   $0x0,(%edx)
    124d:	74 21                	je     1270 <strlen+0x30>
    124f:	31 c0                	xor    %eax,%eax
    1251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1258:	83 c0 01             	add    $0x1,%eax
    125b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    125f:	89 c1                	mov    %eax,%ecx
    1261:	75 f5                	jne    1258 <strlen+0x18>
    ;
  return n;
}
    1263:	89 c8                	mov    %ecx,%eax
    1265:	5d                   	pop    %ebp
    1266:	c3                   	ret    
    1267:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    126e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    1270:	31 c9                	xor    %ecx,%ecx
}
    1272:	5d                   	pop    %ebp
    1273:	89 c8                	mov    %ecx,%eax
    1275:	c3                   	ret    
    1276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    127d:	8d 76 00             	lea    0x0(%esi),%esi

00001280 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1280:	f3 0f 1e fb          	endbr32 
    1284:	55                   	push   %ebp
    1285:	89 e5                	mov    %esp,%ebp
    1287:	57                   	push   %edi
    1288:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    128b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    128e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1291:	89 d7                	mov    %edx,%edi
    1293:	fc                   	cld    
    1294:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1296:	89 d0                	mov    %edx,%eax
    1298:	5f                   	pop    %edi
    1299:	5d                   	pop    %ebp
    129a:	c3                   	ret    
    129b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    129f:	90                   	nop

000012a0 <strchr>:

char*
strchr(const char *s, char c)
{
    12a0:	f3 0f 1e fb          	endbr32 
    12a4:	55                   	push   %ebp
    12a5:	89 e5                	mov    %esp,%ebp
    12a7:	8b 45 08             	mov    0x8(%ebp),%eax
    12aa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    12ae:	0f b6 10             	movzbl (%eax),%edx
    12b1:	84 d2                	test   %dl,%dl
    12b3:	75 16                	jne    12cb <strchr+0x2b>
    12b5:	eb 21                	jmp    12d8 <strchr+0x38>
    12b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12be:	66 90                	xchg   %ax,%ax
    12c0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    12c4:	83 c0 01             	add    $0x1,%eax
    12c7:	84 d2                	test   %dl,%dl
    12c9:	74 0d                	je     12d8 <strchr+0x38>
    if(*s == c)
    12cb:	38 d1                	cmp    %dl,%cl
    12cd:	75 f1                	jne    12c0 <strchr+0x20>
      return (char*)s;
  return 0;
}
    12cf:	5d                   	pop    %ebp
    12d0:	c3                   	ret    
    12d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    12d8:	31 c0                	xor    %eax,%eax
}
    12da:	5d                   	pop    %ebp
    12db:	c3                   	ret    
    12dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012e0 <gets>:

char*
gets(char *buf, int max)
{
    12e0:	f3 0f 1e fb          	endbr32 
    12e4:	55                   	push   %ebp
    12e5:	89 e5                	mov    %esp,%ebp
    12e7:	57                   	push   %edi
    12e8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12e9:	31 f6                	xor    %esi,%esi
{
    12eb:	53                   	push   %ebx
    12ec:	89 f3                	mov    %esi,%ebx
    12ee:	83 ec 1c             	sub    $0x1c,%esp
    12f1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    12f4:	eb 33                	jmp    1329 <gets+0x49>
    12f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12fd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1300:	83 ec 04             	sub    $0x4,%esp
    1303:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1306:	6a 01                	push   $0x1
    1308:	50                   	push   %eax
    1309:	6a 00                	push   $0x0
    130b:	e8 75 03 00 00       	call   1685 <read>
    if(cc < 1)
    1310:	83 c4 10             	add    $0x10,%esp
    1313:	85 c0                	test   %eax,%eax
    1315:	7e 1c                	jle    1333 <gets+0x53>
      break;
    buf[i++] = c;
    1317:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    131b:	83 c7 01             	add    $0x1,%edi
    131e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1321:	3c 0a                	cmp    $0xa,%al
    1323:	74 23                	je     1348 <gets+0x68>
    1325:	3c 0d                	cmp    $0xd,%al
    1327:	74 1f                	je     1348 <gets+0x68>
  for(i=0; i+1 < max; ){
    1329:	83 c3 01             	add    $0x1,%ebx
    132c:	89 fe                	mov    %edi,%esi
    132e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1331:	7c cd                	jl     1300 <gets+0x20>
    1333:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1335:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1338:	c6 03 00             	movb   $0x0,(%ebx)
}
    133b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    133e:	5b                   	pop    %ebx
    133f:	5e                   	pop    %esi
    1340:	5f                   	pop    %edi
    1341:	5d                   	pop    %ebp
    1342:	c3                   	ret    
    1343:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1347:	90                   	nop
    1348:	8b 75 08             	mov    0x8(%ebp),%esi
    134b:	8b 45 08             	mov    0x8(%ebp),%eax
    134e:	01 de                	add    %ebx,%esi
    1350:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1352:	c6 03 00             	movb   $0x0,(%ebx)
}
    1355:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1358:	5b                   	pop    %ebx
    1359:	5e                   	pop    %esi
    135a:	5f                   	pop    %edi
    135b:	5d                   	pop    %ebp
    135c:	c3                   	ret    
    135d:	8d 76 00             	lea    0x0(%esi),%esi

00001360 <stat>:

int
stat(const char *n, struct stat *st)
{
    1360:	f3 0f 1e fb          	endbr32 
    1364:	55                   	push   %ebp
    1365:	89 e5                	mov    %esp,%ebp
    1367:	56                   	push   %esi
    1368:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1369:	83 ec 08             	sub    $0x8,%esp
    136c:	6a 00                	push   $0x0
    136e:	ff 75 08             	pushl  0x8(%ebp)
    1371:	e8 37 03 00 00       	call   16ad <open>
  if(fd < 0)
    1376:	83 c4 10             	add    $0x10,%esp
    1379:	85 c0                	test   %eax,%eax
    137b:	78 2b                	js     13a8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    137d:	83 ec 08             	sub    $0x8,%esp
    1380:	ff 75 0c             	pushl  0xc(%ebp)
    1383:	89 c3                	mov    %eax,%ebx
    1385:	50                   	push   %eax
    1386:	e8 3a 03 00 00       	call   16c5 <fstat>
  close(fd);
    138b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    138e:	89 c6                	mov    %eax,%esi
  close(fd);
    1390:	e8 00 03 00 00       	call   1695 <close>
  return r;
    1395:	83 c4 10             	add    $0x10,%esp
}
    1398:	8d 65 f8             	lea    -0x8(%ebp),%esp
    139b:	89 f0                	mov    %esi,%eax
    139d:	5b                   	pop    %ebx
    139e:	5e                   	pop    %esi
    139f:	5d                   	pop    %ebp
    13a0:	c3                   	ret    
    13a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    13a8:	be ff ff ff ff       	mov    $0xffffffff,%esi
    13ad:	eb e9                	jmp    1398 <stat+0x38>
    13af:	90                   	nop

000013b0 <atoi>:

int
atoi(const char *s)
{
    13b0:	f3 0f 1e fb          	endbr32 
    13b4:	55                   	push   %ebp
    13b5:	89 e5                	mov    %esp,%ebp
    13b7:	53                   	push   %ebx
    13b8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    13bb:	0f be 02             	movsbl (%edx),%eax
    13be:	8d 48 d0             	lea    -0x30(%eax),%ecx
    13c1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    13c4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    13c9:	77 1a                	ja     13e5 <atoi+0x35>
    13cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13cf:	90                   	nop
    n = n*10 + *s++ - '0';
    13d0:	83 c2 01             	add    $0x1,%edx
    13d3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    13d6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    13da:	0f be 02             	movsbl (%edx),%eax
    13dd:	8d 58 d0             	lea    -0x30(%eax),%ebx
    13e0:	80 fb 09             	cmp    $0x9,%bl
    13e3:	76 eb                	jbe    13d0 <atoi+0x20>
  return n;
}
    13e5:	89 c8                	mov    %ecx,%eax
    13e7:	5b                   	pop    %ebx
    13e8:	5d                   	pop    %ebp
    13e9:	c3                   	ret    
    13ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000013f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    13f0:	f3 0f 1e fb          	endbr32 
    13f4:	55                   	push   %ebp
    13f5:	89 e5                	mov    %esp,%ebp
    13f7:	57                   	push   %edi
    13f8:	8b 45 10             	mov    0x10(%ebp),%eax
    13fb:	8b 55 08             	mov    0x8(%ebp),%edx
    13fe:	56                   	push   %esi
    13ff:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1402:	85 c0                	test   %eax,%eax
    1404:	7e 0f                	jle    1415 <memmove+0x25>
    1406:	01 d0                	add    %edx,%eax
  dst = vdst;
    1408:	89 d7                	mov    %edx,%edi
    140a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1410:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1411:	39 f8                	cmp    %edi,%eax
    1413:	75 fb                	jne    1410 <memmove+0x20>
  return vdst;
}
    1415:	5e                   	pop    %esi
    1416:	89 d0                	mov    %edx,%eax
    1418:	5f                   	pop    %edi
    1419:	5d                   	pop    %ebp
    141a:	c3                   	ret    
    141b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    141f:	90                   	nop

00001420 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
    1420:	f3 0f 1e fb          	endbr32 
    1424:	55                   	push   %ebp
    1425:	89 e5                	mov    %esp,%ebp
    1427:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
    142a:	8d 45 f4             	lea    -0xc(%ebp),%eax
    142d:	50                   	push   %eax
    142e:	e8 0a 03 00 00       	call   173d <join>
  
  return x;
}
    1433:	c9                   	leave  
    1434:	c3                   	ret    
    1435:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    143c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001440 <lock_init>:

void lock_init(struct lock_t *lk){
    1440:	f3 0f 1e fb          	endbr32 
    1444:	55                   	push   %ebp
    1445:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
    1447:	8b 45 08             	mov    0x8(%ebp),%eax
    144a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1450:	5d                   	pop    %ebp
    1451:	c3                   	ret    
    1452:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001460 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
    1460:	f3 0f 1e fb          	endbr32 
    1464:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1465:	b9 01 00 00 00       	mov    $0x1,%ecx
    146a:	89 e5                	mov    %esp,%ebp
    146c:	8b 55 08             	mov    0x8(%ebp),%edx
    146f:	90                   	nop
    1470:	89 c8                	mov    %ecx,%eax
    1472:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
    1475:	85 c0                	test   %eax,%eax
    1477:	75 f7                	jne    1470 <lock_acquire+0x10>
}
    1479:	5d                   	pop    %ebp
    147a:	c3                   	ret    
    147b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    147f:	90                   	nop

00001480 <lock_release>:
void lock_release(struct lock_t *lk){
    1480:	f3 0f 1e fb          	endbr32 
    1484:	55                   	push   %ebp
    1485:	31 c0                	xor    %eax,%eax
    1487:	89 e5                	mov    %esp,%ebp
    1489:	8b 55 08             	mov    0x8(%ebp),%edx
    148c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
    148f:	5d                   	pop    %ebp
    1490:	c3                   	ret    
    1491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    149f:	90                   	nop

000014a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    14a0:	f3 0f 1e fb          	endbr32 
    14a4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14a5:	a1 fc 1d 00 00       	mov    0x1dfc,%eax
{
    14aa:	89 e5                	mov    %esp,%ebp
    14ac:	57                   	push   %edi
    14ad:	56                   	push   %esi
    14ae:	53                   	push   %ebx
    14af:	8b 5d 08             	mov    0x8(%ebp),%ebx
    14b2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    14b4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14b7:	39 c8                	cmp    %ecx,%eax
    14b9:	73 15                	jae    14d0 <free+0x30>
    14bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14bf:	90                   	nop
    14c0:	39 d1                	cmp    %edx,%ecx
    14c2:	72 14                	jb     14d8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    14c4:	39 d0                	cmp    %edx,%eax
    14c6:	73 10                	jae    14d8 <free+0x38>
{
    14c8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14ca:	8b 10                	mov    (%eax),%edx
    14cc:	39 c8                	cmp    %ecx,%eax
    14ce:	72 f0                	jb     14c0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    14d0:	39 d0                	cmp    %edx,%eax
    14d2:	72 f4                	jb     14c8 <free+0x28>
    14d4:	39 d1                	cmp    %edx,%ecx
    14d6:	73 f0                	jae    14c8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    14d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    14db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    14de:	39 fa                	cmp    %edi,%edx
    14e0:	74 1e                	je     1500 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    14e2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    14e5:	8b 50 04             	mov    0x4(%eax),%edx
    14e8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    14eb:	39 f1                	cmp    %esi,%ecx
    14ed:	74 28                	je     1517 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    14ef:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    14f1:	5b                   	pop    %ebx
  freep = p;
    14f2:	a3 fc 1d 00 00       	mov    %eax,0x1dfc
}
    14f7:	5e                   	pop    %esi
    14f8:	5f                   	pop    %edi
    14f9:	5d                   	pop    %ebp
    14fa:	c3                   	ret    
    14fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14ff:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1500:	03 72 04             	add    0x4(%edx),%esi
    1503:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1506:	8b 10                	mov    (%eax),%edx
    1508:	8b 12                	mov    (%edx),%edx
    150a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    150d:	8b 50 04             	mov    0x4(%eax),%edx
    1510:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1513:	39 f1                	cmp    %esi,%ecx
    1515:	75 d8                	jne    14ef <free+0x4f>
    p->s.size += bp->s.size;
    1517:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    151a:	a3 fc 1d 00 00       	mov    %eax,0x1dfc
    p->s.size += bp->s.size;
    151f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1522:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1525:	89 10                	mov    %edx,(%eax)
}
    1527:	5b                   	pop    %ebx
    1528:	5e                   	pop    %esi
    1529:	5f                   	pop    %edi
    152a:	5d                   	pop    %ebp
    152b:	c3                   	ret    
    152c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001530 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1530:	f3 0f 1e fb          	endbr32 
    1534:	55                   	push   %ebp
    1535:	89 e5                	mov    %esp,%ebp
    1537:	57                   	push   %edi
    1538:	56                   	push   %esi
    1539:	53                   	push   %ebx
    153a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    153d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1540:	8b 3d fc 1d 00 00    	mov    0x1dfc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1546:	8d 70 07             	lea    0x7(%eax),%esi
    1549:	c1 ee 03             	shr    $0x3,%esi
    154c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    154f:	85 ff                	test   %edi,%edi
    1551:	0f 84 a9 00 00 00    	je     1600 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1557:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1559:	8b 48 04             	mov    0x4(%eax),%ecx
    155c:	39 f1                	cmp    %esi,%ecx
    155e:	73 6d                	jae    15cd <malloc+0x9d>
    1560:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1566:	bb 00 10 00 00       	mov    $0x1000,%ebx
    156b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    156e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1575:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1578:	eb 17                	jmp    1591 <malloc+0x61>
    157a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1580:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1582:	8b 4a 04             	mov    0x4(%edx),%ecx
    1585:	39 f1                	cmp    %esi,%ecx
    1587:	73 4f                	jae    15d8 <malloc+0xa8>
    1589:	8b 3d fc 1d 00 00    	mov    0x1dfc,%edi
    158f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1591:	39 c7                	cmp    %eax,%edi
    1593:	75 eb                	jne    1580 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1595:	83 ec 0c             	sub    $0xc,%esp
    1598:	ff 75 e4             	pushl  -0x1c(%ebp)
    159b:	e8 55 01 00 00       	call   16f5 <sbrk>
  if(p == (char*)-1)
    15a0:	83 c4 10             	add    $0x10,%esp
    15a3:	83 f8 ff             	cmp    $0xffffffff,%eax
    15a6:	74 1b                	je     15c3 <malloc+0x93>
  hp->s.size = nu;
    15a8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    15ab:	83 ec 0c             	sub    $0xc,%esp
    15ae:	83 c0 08             	add    $0x8,%eax
    15b1:	50                   	push   %eax
    15b2:	e8 e9 fe ff ff       	call   14a0 <free>
  return freep;
    15b7:	a1 fc 1d 00 00       	mov    0x1dfc,%eax
      if((p = morecore(nunits)) == 0)
    15bc:	83 c4 10             	add    $0x10,%esp
    15bf:	85 c0                	test   %eax,%eax
    15c1:	75 bd                	jne    1580 <malloc+0x50>
        return 0;
  }
}
    15c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    15c6:	31 c0                	xor    %eax,%eax
}
    15c8:	5b                   	pop    %ebx
    15c9:	5e                   	pop    %esi
    15ca:	5f                   	pop    %edi
    15cb:	5d                   	pop    %ebp
    15cc:	c3                   	ret    
    if(p->s.size >= nunits){
    15cd:	89 c2                	mov    %eax,%edx
    15cf:	89 f8                	mov    %edi,%eax
    15d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    15d8:	39 ce                	cmp    %ecx,%esi
    15da:	74 54                	je     1630 <malloc+0x100>
        p->s.size -= nunits;
    15dc:	29 f1                	sub    %esi,%ecx
    15de:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    15e1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    15e4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    15e7:	a3 fc 1d 00 00       	mov    %eax,0x1dfc
}
    15ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    15ef:	8d 42 08             	lea    0x8(%edx),%eax
}
    15f2:	5b                   	pop    %ebx
    15f3:	5e                   	pop    %esi
    15f4:	5f                   	pop    %edi
    15f5:	5d                   	pop    %ebp
    15f6:	c3                   	ret    
    15f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15fe:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1600:	c7 05 fc 1d 00 00 00 	movl   $0x1e00,0x1dfc
    1607:	1e 00 00 
    base.s.size = 0;
    160a:	bf 00 1e 00 00       	mov    $0x1e00,%edi
    base.s.ptr = freep = prevp = &base;
    160f:	c7 05 00 1e 00 00 00 	movl   $0x1e00,0x1e00
    1616:	1e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1619:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    161b:	c7 05 04 1e 00 00 00 	movl   $0x0,0x1e04
    1622:	00 00 00 
    if(p->s.size >= nunits){
    1625:	e9 36 ff ff ff       	jmp    1560 <malloc+0x30>
    162a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1630:	8b 0a                	mov    (%edx),%ecx
    1632:	89 08                	mov    %ecx,(%eax)
    1634:	eb b1                	jmp    15e7 <malloc+0xb7>
    1636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    163d:	8d 76 00             	lea    0x0(%esi),%esi

00001640 <thread_create>:
{
    1640:	f3 0f 1e fb          	endbr32 
    1644:	55                   	push   %ebp
    1645:	89 e5                	mov    %esp,%ebp
    1647:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
    164a:	68 00 10 00 00       	push   $0x1000
    164f:	e8 dc fe ff ff       	call   1530 <malloc>
return clone(start_routine,arg1,arg2,stack);
    1654:	50                   	push   %eax
    1655:	ff 75 10             	pushl  0x10(%ebp)
    1658:	ff 75 0c             	pushl  0xc(%ebp)
    165b:	ff 75 08             	pushl  0x8(%ebp)
    165e:	e8 d2 00 00 00       	call   1735 <clone>
}
    1663:	c9                   	leave  
    1664:	c3                   	ret    

00001665 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1665:	b8 01 00 00 00       	mov    $0x1,%eax
    166a:	cd 40                	int    $0x40
    166c:	c3                   	ret    

0000166d <exit>:
SYSCALL(exit)
    166d:	b8 02 00 00 00       	mov    $0x2,%eax
    1672:	cd 40                	int    $0x40
    1674:	c3                   	ret    

00001675 <wait>:
SYSCALL(wait)
    1675:	b8 03 00 00 00       	mov    $0x3,%eax
    167a:	cd 40                	int    $0x40
    167c:	c3                   	ret    

0000167d <pipe>:
SYSCALL(pipe)
    167d:	b8 04 00 00 00       	mov    $0x4,%eax
    1682:	cd 40                	int    $0x40
    1684:	c3                   	ret    

00001685 <read>:
SYSCALL(read)
    1685:	b8 05 00 00 00       	mov    $0x5,%eax
    168a:	cd 40                	int    $0x40
    168c:	c3                   	ret    

0000168d <write>:
SYSCALL(write)
    168d:	b8 10 00 00 00       	mov    $0x10,%eax
    1692:	cd 40                	int    $0x40
    1694:	c3                   	ret    

00001695 <close>:
SYSCALL(close)
    1695:	b8 15 00 00 00       	mov    $0x15,%eax
    169a:	cd 40                	int    $0x40
    169c:	c3                   	ret    

0000169d <kill>:
SYSCALL(kill)
    169d:	b8 06 00 00 00       	mov    $0x6,%eax
    16a2:	cd 40                	int    $0x40
    16a4:	c3                   	ret    

000016a5 <exec>:
SYSCALL(exec)
    16a5:	b8 07 00 00 00       	mov    $0x7,%eax
    16aa:	cd 40                	int    $0x40
    16ac:	c3                   	ret    

000016ad <open>:
SYSCALL(open)
    16ad:	b8 0f 00 00 00       	mov    $0xf,%eax
    16b2:	cd 40                	int    $0x40
    16b4:	c3                   	ret    

000016b5 <mknod>:
SYSCALL(mknod)
    16b5:	b8 11 00 00 00       	mov    $0x11,%eax
    16ba:	cd 40                	int    $0x40
    16bc:	c3                   	ret    

000016bd <unlink>:
SYSCALL(unlink)
    16bd:	b8 12 00 00 00       	mov    $0x12,%eax
    16c2:	cd 40                	int    $0x40
    16c4:	c3                   	ret    

000016c5 <fstat>:
SYSCALL(fstat)
    16c5:	b8 08 00 00 00       	mov    $0x8,%eax
    16ca:	cd 40                	int    $0x40
    16cc:	c3                   	ret    

000016cd <link>:
SYSCALL(link)
    16cd:	b8 13 00 00 00       	mov    $0x13,%eax
    16d2:	cd 40                	int    $0x40
    16d4:	c3                   	ret    

000016d5 <mkdir>:
SYSCALL(mkdir)
    16d5:	b8 14 00 00 00       	mov    $0x14,%eax
    16da:	cd 40                	int    $0x40
    16dc:	c3                   	ret    

000016dd <chdir>:
SYSCALL(chdir)
    16dd:	b8 09 00 00 00       	mov    $0x9,%eax
    16e2:	cd 40                	int    $0x40
    16e4:	c3                   	ret    

000016e5 <dup>:
SYSCALL(dup)
    16e5:	b8 0a 00 00 00       	mov    $0xa,%eax
    16ea:	cd 40                	int    $0x40
    16ec:	c3                   	ret    

000016ed <getpid>:
SYSCALL(getpid)
    16ed:	b8 0b 00 00 00       	mov    $0xb,%eax
    16f2:	cd 40                	int    $0x40
    16f4:	c3                   	ret    

000016f5 <sbrk>:
SYSCALL(sbrk)
    16f5:	b8 0c 00 00 00       	mov    $0xc,%eax
    16fa:	cd 40                	int    $0x40
    16fc:	c3                   	ret    

000016fd <sleep>:
SYSCALL(sleep)
    16fd:	b8 0d 00 00 00       	mov    $0xd,%eax
    1702:	cd 40                	int    $0x40
    1704:	c3                   	ret    

00001705 <uptime>:
SYSCALL(uptime)
    1705:	b8 0e 00 00 00       	mov    $0xe,%eax
    170a:	cd 40                	int    $0x40
    170c:	c3                   	ret    

0000170d <count>:
SYSCALL(count)
    170d:	b8 16 00 00 00       	mov    $0x16,%eax
    1712:	cd 40                	int    $0x40
    1714:	c3                   	ret    

00001715 <settickets>:

SYSCALL(settickets)
    1715:	b8 17 00 00 00       	mov    $0x17,%eax
    171a:	cd 40                	int    $0x40
    171c:	c3                   	ret    

0000171d <getpinfo>:
SYSCALL(getpinfo)
    171d:	b8 18 00 00 00       	mov    $0x18,%eax
    1722:	cd 40                	int    $0x40
    1724:	c3                   	ret    

00001725 <mprotect>:

SYSCALL(mprotect)
    1725:	b8 19 00 00 00       	mov    $0x19,%eax
    172a:	cd 40                	int    $0x40
    172c:	c3                   	ret    

0000172d <munprotect>:
SYSCALL(munprotect)
    172d:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1732:	cd 40                	int    $0x40
    1734:	c3                   	ret    

00001735 <clone>:

SYSCALL(clone)
    1735:	b8 1b 00 00 00       	mov    $0x1b,%eax
    173a:	cd 40                	int    $0x40
    173c:	c3                   	ret    

0000173d <join>:
SYSCALL(join)
    173d:	b8 1c 00 00 00       	mov    $0x1c,%eax
    1742:	cd 40                	int    $0x40
    1744:	c3                   	ret    
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
    1789:	0f b6 92 5c 1a 00 00 	movzbl 0x1a5c(%edx),%edx
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
    17c0:	0f b6 13             	movzbl (%ebx),%edx
    17c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    17c6:	83 ec 04             	sub    $0x4,%esp
    17c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    17cc:	6a 01                	push   $0x1
    17ce:	56                   	push   %esi
    17cf:	57                   	push   %edi
    17d0:	e8 b8 fe ff ff       	call   168d <write>
  while(--i >= 0)
    17d5:	83 c4 10             	add    $0x10,%esp
    17d8:	39 de                	cmp    %ebx,%esi
    17da:	75 e4                	jne    17c0 <printint+0x70>
    putc(fd, buf[i]);
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
    1800:	f3 0f 1e fb          	endbr32 
    1804:	55                   	push   %ebp
    1805:	89 e5                	mov    %esp,%ebp
    1807:	57                   	push   %edi
    1808:	56                   	push   %esi
    1809:	53                   	push   %ebx
    180a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    180d:	8b 75 0c             	mov    0xc(%ebp),%esi
    1810:	0f b6 1e             	movzbl (%esi),%ebx
    1813:	84 db                	test   %bl,%bl
    1815:	0f 84 b4 00 00 00    	je     18cf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    181b:	8d 45 10             	lea    0x10(%ebp),%eax
    181e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1821:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1824:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1826:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1829:	eb 33                	jmp    185e <printf+0x5e>
    182b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    182f:	90                   	nop
    1830:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1833:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1838:	83 f8 25             	cmp    $0x25,%eax
    183b:	74 17                	je     1854 <printf+0x54>
  write(fd, &c, 1);
    183d:	83 ec 04             	sub    $0x4,%esp
    1840:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1843:	6a 01                	push   $0x1
    1845:	57                   	push   %edi
    1846:	ff 75 08             	pushl  0x8(%ebp)
    1849:	e8 3f fe ff ff       	call   168d <write>
    184e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1851:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1854:	0f b6 1e             	movzbl (%esi),%ebx
    1857:	83 c6 01             	add    $0x1,%esi
    185a:	84 db                	test   %bl,%bl
    185c:	74 71                	je     18cf <printf+0xcf>
    c = fmt[i] & 0xff;
    185e:	0f be cb             	movsbl %bl,%ecx
    1861:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1864:	85 d2                	test   %edx,%edx
    1866:	74 c8                	je     1830 <printf+0x30>
      }
    } else if(state == '%'){
    1868:	83 fa 25             	cmp    $0x25,%edx
    186b:	75 e7                	jne    1854 <printf+0x54>
      if(c == 'd'){
    186d:	83 f8 64             	cmp    $0x64,%eax
    1870:	0f 84 9a 00 00 00    	je     1910 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1876:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    187c:	83 f9 70             	cmp    $0x70,%ecx
    187f:	74 5f                	je     18e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1881:	83 f8 73             	cmp    $0x73,%eax
    1884:	0f 84 d6 00 00 00    	je     1960 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    188a:	83 f8 63             	cmp    $0x63,%eax
    188d:	0f 84 8d 00 00 00    	je     1920 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1893:	83 f8 25             	cmp    $0x25,%eax
    1896:	0f 84 b4 00 00 00    	je     1950 <printf+0x150>
  write(fd, &c, 1);
    189c:	83 ec 04             	sub    $0x4,%esp
    189f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    18a3:	6a 01                	push   $0x1
    18a5:	57                   	push   %edi
    18a6:	ff 75 08             	pushl  0x8(%ebp)
    18a9:	e8 df fd ff ff       	call   168d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    18ae:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    18b1:	83 c4 0c             	add    $0xc,%esp
    18b4:	6a 01                	push   $0x1
    18b6:	83 c6 01             	add    $0x1,%esi
    18b9:	57                   	push   %edi
    18ba:	ff 75 08             	pushl  0x8(%ebp)
    18bd:	e8 cb fd ff ff       	call   168d <write>
  for(i = 0; fmt[i]; i++){
    18c2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    18c6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    18c9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    18cb:	84 db                	test   %bl,%bl
    18cd:	75 8f                	jne    185e <printf+0x5e>
    }
  }
}
    18cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    18d2:	5b                   	pop    %ebx
    18d3:	5e                   	pop    %esi
    18d4:	5f                   	pop    %edi
    18d5:	5d                   	pop    %ebp
    18d6:	c3                   	ret    
    18d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    18de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    18e0:	83 ec 0c             	sub    $0xc,%esp
    18e3:	b9 10 00 00 00       	mov    $0x10,%ecx
    18e8:	6a 00                	push   $0x0
    18ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    18ed:	8b 45 08             	mov    0x8(%ebp),%eax
    18f0:	8b 13                	mov    (%ebx),%edx
    18f2:	e8 59 fe ff ff       	call   1750 <printint>
        ap++;
    18f7:	89 d8                	mov    %ebx,%eax
    18f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    18fc:	31 d2                	xor    %edx,%edx
        ap++;
    18fe:	83 c0 04             	add    $0x4,%eax
    1901:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1904:	e9 4b ff ff ff       	jmp    1854 <printf+0x54>
    1909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1910:	83 ec 0c             	sub    $0xc,%esp
    1913:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1918:	6a 01                	push   $0x1
    191a:	eb ce                	jmp    18ea <printf+0xea>
    191c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1920:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1923:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1926:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1928:	6a 01                	push   $0x1
        ap++;
    192a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    192d:	57                   	push   %edi
    192e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1931:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1934:	e8 54 fd ff ff       	call   168d <write>
        ap++;
    1939:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    193c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    193f:	31 d2                	xor    %edx,%edx
    1941:	e9 0e ff ff ff       	jmp    1854 <printf+0x54>
    1946:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    194d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1950:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1953:	83 ec 04             	sub    $0x4,%esp
    1956:	e9 59 ff ff ff       	jmp    18b4 <printf+0xb4>
    195b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    195f:	90                   	nop
        s = (char*)*ap;
    1960:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1963:	8b 18                	mov    (%eax),%ebx
        ap++;
    1965:	83 c0 04             	add    $0x4,%eax
    1968:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    196b:	85 db                	test   %ebx,%ebx
    196d:	74 17                	je     1986 <printf+0x186>
        while(*s != 0){
    196f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1972:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1974:	84 c0                	test   %al,%al
    1976:	0f 84 d8 fe ff ff    	je     1854 <printf+0x54>
    197c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    197f:	89 de                	mov    %ebx,%esi
    1981:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1984:	eb 1a                	jmp    19a0 <printf+0x1a0>
          s = "(null)";
    1986:	bb 52 1a 00 00       	mov    $0x1a52,%ebx
        while(*s != 0){
    198b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    198e:	b8 28 00 00 00       	mov    $0x28,%eax
    1993:	89 de                	mov    %ebx,%esi
    1995:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1998:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    199f:	90                   	nop
  write(fd, &c, 1);
    19a0:	83 ec 04             	sub    $0x4,%esp
          s++;
    19a3:	83 c6 01             	add    $0x1,%esi
    19a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    19a9:	6a 01                	push   $0x1
    19ab:	57                   	push   %edi
    19ac:	53                   	push   %ebx
    19ad:	e8 db fc ff ff       	call   168d <write>
        while(*s != 0){
    19b2:	0f b6 06             	movzbl (%esi),%eax
    19b5:	83 c4 10             	add    $0x10,%esp
    19b8:	84 c0                	test   %al,%al
    19ba:	75 e4                	jne    19a0 <printf+0x1a0>
    19bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    19bf:	31 d2                	xor    %edx,%edx
    19c1:	e9 8e fe ff ff       	jmp    1854 <printf+0x54>
