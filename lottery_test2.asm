
_lottery_test2:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
	}
    }
}

int
main(int argc, char *argv[]){
    1000:	f3 0f 1e fb          	endbr32 
    1004:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1008:	83 e4 f0             	and    $0xfffffff0,%esp
    100b:	ff 71 fc             	pushl  -0x4(%ecx)
    100e:	55                   	push   %ebp
    100f:	89 e5                	mov    %esp,%ebp
    1011:	57                   	push   %edi
    1012:	56                   	push   %esi
    1013:	53                   	push   %ebx
    1014:	51                   	push   %ecx
    1015:	81 ec 48 04 00 00    	sub    $0x448,%esp
  
  int procs = argc - 1;
  if (procs != 3) {
    101b:	83 39 04             	cmpl   $0x4,(%ecx)
main(int argc, char *argv[]){
    101e:	8b 59 04             	mov    0x4(%ecx),%ebx
  if (procs != 3) {
    1021:	74 13                	je     1036 <main+0x36>
  	printf(1, "useage: lottery_test2 num1 num2 num3");
    1023:	50                   	push   %eax
    1024:	50                   	push   %eax
    1025:	68 28 1a 00 00       	push   $0x1a28
    102a:	6a 01                	push   $0x1
    102c:	e8 2f 08 00 00       	call   1860 <printf>
	exit();
    1031:	e8 97 06 00 00       	call   16cd <exit>
  }
  int numtickets[] = {atoi(argv[1]), atoi(argv[2]), atoi(argv[3])};
    1036:	83 ec 0c             	sub    $0xc,%esp
    1039:	ff 73 04             	pushl  0x4(%ebx)
    103c:	e8 cf 03 00 00       	call   1410 <atoi>
    1041:	5e                   	pop    %esi
    1042:	ff 73 08             	pushl  0x8(%ebx)
    1045:	89 c7                	mov    %eax,%edi
    1047:	e8 c4 03 00 00       	call   1410 <atoi>
    104c:	89 c6                	mov    %eax,%esi
    104e:	58                   	pop    %eax
    104f:	ff 73 0c             	pushl  0xc(%ebx)
    1052:	e8 b9 03 00 00       	call   1410 <atoi>
    1057:	89 c3                	mov    %eax,%ebx
  int pid_chds[3];

  pid_chds[0]=getpid();
    1059:	e8 ef 06 00 00       	call   174d <getpid>
  settickets(numtickets[0]);
    105e:	89 3c 24             	mov    %edi,(%esp)
  pid_chds[0]=getpid();
    1061:	89 85 c0 fb ff ff    	mov    %eax,-0x440(%ebp)
  settickets(numtickets[0]);
    1067:	e8 09 07 00 00       	call   1775 <settickets>

  int i;
  for(i=1;i<3;i++){
    pid_chds[i]=fork();
    106c:	e8 54 06 00 00       	call   16c5 <fork>
    if(pid_chds[i]==0){
    1071:	83 c4 10             	add    $0x10,%esp
    pid_chds[i]=fork();
    1074:	89 85 b8 fb ff ff    	mov    %eax,-0x448(%ebp)
    107a:	89 85 d4 fb ff ff    	mov    %eax,-0x42c(%ebp)
    if(pid_chds[i]==0){
    1080:	85 c0                	test   %eax,%eax
    1082:	0f 84 7e 01 00 00    	je     1206 <main+0x206>
      while(1) spin();
    }
    else{
      settickets(numtickets[i]);
    1088:	83 ec 0c             	sub    $0xc,%esp
    108b:	56                   	push   %esi
    108c:	e8 e4 06 00 00       	call   1775 <settickets>
    pid_chds[i]=fork();
    1091:	e8 2f 06 00 00       	call   16c5 <fork>
    if(pid_chds[i]==0){
    1096:	83 c4 10             	add    $0x10,%esp
    pid_chds[i]=fork();
    1099:	89 85 b4 fb ff ff    	mov    %eax,-0x44c(%ebp)
    109f:	89 85 d8 fb ff ff    	mov    %eax,-0x428(%ebp)
    if(pid_chds[i]==0){
    10a5:	85 c0                	test   %eax,%eax
    10a7:	0f 84 59 01 00 00    	je     1206 <main+0x206>
      settickets(numtickets[i]);
    10ad:	83 ec 0c             	sub    $0xc,%esp
    10b0:	53                   	push   %ebx
    10b1:	e8 bf 06 00 00       	call   1775 <settickets>
    
  struct pstat st;
  int time = 200;
  int ticks[3]={0,0,0};

  printf(1,"pid:%d, pid:%d, pid:%d\n",pid_chds[0],pid_chds[1],pid_chds[2]);
    10b6:	59                   	pop    %ecx
    10b7:	ff b5 b4 fb ff ff    	pushl  -0x44c(%ebp)
    10bd:	ff b5 b8 fb ff ff    	pushl  -0x448(%ebp)
    10c3:	ff b5 c0 fb ff ff    	pushl  -0x440(%ebp)
    10c9:	68 74 1a 00 00       	push   $0x1a74
    10ce:	6a 01                	push   $0x1
  int ticks[3]={0,0,0};
    10d0:	c7 85 dc fb ff ff 00 	movl   $0x0,-0x424(%ebp)
    10d7:	00 00 00 
    10da:	c7 85 e0 fb ff ff 00 	movl   $0x0,-0x420(%ebp)
    10e1:	00 00 00 
    10e4:	c7 85 e4 fb ff ff 00 	movl   $0x0,-0x41c(%ebp)
    10eb:	00 00 00 
  printf(1,"pid:%d, pid:%d, pid:%d\n",pid_chds[0],pid_chds[1],pid_chds[2]);
    10ee:	e8 6d 07 00 00       	call   1860 <printf>
  printf(1,"tickets:%d, tickets:%d, tickets:%d\n",30,20,10);
    10f3:	83 c4 14             	add    $0x14,%esp
    10f6:	6a 0a                	push   $0xa
    10f8:	6a 14                	push   $0x14
    10fa:	6a 1e                	push   $0x1e
    10fc:	68 50 1a 00 00       	push   $0x1a50
    1101:	6a 01                	push   $0x1
    1103:	e8 58 07 00 00       	call   1860 <printf>
    1108:	83 c4 20             	add    $0x20,%esp
    110b:	c7 85 bc fb ff ff c8 	movl   $0xc8,-0x444(%ebp)
    1112:	00 00 00 

  while(time--){
      if(getpinfo(&st)!=0){
    1115:	83 ec 0c             	sub    $0xc,%esp
    1118:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
    111e:	50                   	push   %eax
    111f:	e8 59 06 00 00       	call   177d <getpinfo>
    1124:	83 c4 10             	add    $0x10,%esp
    1127:	85 c0                	test   %eax,%eax
    1129:	0f 85 c4 00 00 00    	jne    11f3 <main+0x1f3>
    112f:	8d b5 dc fb ff ff    	lea    -0x424(%ebp),%esi
    1135:	8b 95 c0 fb ff ff    	mov    -0x440(%ebp),%edx
    113b:	8d bd d0 fb ff ff    	lea    -0x430(%ebp),%edi
    1141:	89 f3                	mov    %esi,%ebx
    1143:	8d 8d e8 fe ff ff    	lea    -0x118(%ebp),%ecx
      // and put it in ticks array
      int j;
      int pid;
      for(i=0;i<3;i++){
        pid=pid_chds[i];
        for(j=0;j<NPROC;j++){
    1149:	89 b5 c4 fb ff ff    	mov    %esi,-0x43c(%ebp)
    114f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    1155:	8d 76 00             	lea    0x0(%esi),%esi
	  if(st.pid[j]==pid){
    1158:	39 10                	cmp    %edx,(%eax)
    115a:	75 08                	jne    1164 <main+0x164>
      	    ticks[i]=st.ticks[j];
    115c:	8b b0 00 01 00 00    	mov    0x100(%eax),%esi
    1162:	89 33                	mov    %esi,(%ebx)
        for(j=0;j<NPROC;j++){
    1164:	83 c0 04             	add    $0x4,%eax
    1167:	39 c1                	cmp    %eax,%ecx
    1169:	75 ed                	jne    1158 <main+0x158>
    116b:	83 c3 04             	add    $0x4,%ebx
      for(i=0;i<3;i++){
    116e:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
    1174:	8b b5 c4 fb ff ff    	mov    -0x43c(%ebp),%esi
    117a:	83 c7 04             	add    $0x4,%edi
    117d:	39 c3                	cmp    %eax,%ebx
    117f:	74 07                	je     1188 <main+0x188>
    1181:	8b 17                	mov    (%edi),%edx
    1183:	eb c4                	jmp    1149 <main+0x149>
    1185:	8d 76 00             	lea    0x0(%esi),%esi
	  }
        }
      }
     
     // print their ticks
     for(i=0;i<3;i++) printf(1,"%d, ",ticks[i]); 
    1188:	83 ec 04             	sub    $0x4,%esp
    118b:	ff 36                	pushl  (%esi)
    118d:	83 c6 04             	add    $0x4,%esi
    1190:	68 a4 1a 00 00       	push   $0x1aa4
    1195:	6a 01                	push   $0x1
    1197:	e8 c4 06 00 00       	call   1860 <printf>
    119c:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
    11a2:	83 c4 10             	add    $0x10,%esp
    11a5:	39 c6                	cmp    %eax,%esi
    11a7:	75 df                	jne    1188 <main+0x188>
     printf(1,"\n");
    11a9:	83 ec 08             	sub    $0x8,%esp
    11ac:	68 8a 1a 00 00       	push   $0x1a8a
    11b1:	6a 01                	push   $0x1
    11b3:	e8 a8 06 00 00       	call   1860 <printf>
  while(time--){
    11b8:	83 c4 10             	add    $0x10,%esp
    11bb:	83 ad bc fb ff ff 01 	subl   $0x1,-0x444(%ebp)
    11c2:	0f 85 4d ff ff ff    	jne    1115 <main+0x115>
    
     spin();
  }
    
 Cleanup:
  kill(pid_chds[1]);		// kill the 2 child
    11c8:	83 ec 0c             	sub    $0xc,%esp
    11cb:	ff b5 b8 fb ff ff    	pushl  -0x448(%ebp)
    11d1:	e8 27 05 00 00       	call   16fd <kill>
  kill(pid_chds[2]);
    11d6:	58                   	pop    %eax
    11d7:	ff b5 b4 fb ff ff    	pushl  -0x44c(%ebp)
    11dd:	e8 1b 05 00 00       	call   16fd <kill>
  while(wait() > -1);		// clear their slots in process table
    11e2:	83 c4 10             	add    $0x10,%esp
    11e5:	e8 eb 04 00 00       	call   16d5 <wait>
    11ea:	85 c0                	test   %eax,%eax
    11ec:	79 f7                	jns    11e5 <main+0x1e5>
  exit();			// exit parent
    11ee:	e8 da 04 00 00       	call   16cd <exit>
        printf(1,"check failed: getpinfo\n");
    11f3:	52                   	push   %edx
    11f4:	52                   	push   %edx
    11f5:	68 8c 1a 00 00       	push   $0x1a8c
    11fa:	6a 01                	push   $0x1
    11fc:	e8 5f 06 00 00       	call   1860 <printf>
        goto Cleanup;
    1201:	83 c4 10             	add    $0x10,%esp
    1204:	eb c2                	jmp    11c8 <main+0x1c8>
  for(i = 0; i < 50; ++i)
    1206:	eb fe                	jmp    1206 <main+0x206>
    1208:	66 90                	xchg   %ax,%ax
    120a:	66 90                	xchg   %ax,%ax
    120c:	66 90                	xchg   %ax,%ax
    120e:	66 90                	xchg   %ax,%ax

00001210 <spin>:
{
    1210:	f3 0f 1e fb          	endbr32 
}
    1214:	c3                   	ret    
    1215:	66 90                	xchg   %ax,%ax
    1217:	66 90                	xchg   %ax,%ax
    1219:	66 90                	xchg   %ax,%ax
    121b:	66 90                	xchg   %ax,%ax
    121d:	66 90                	xchg   %ax,%ax
    121f:	90                   	nop

00001220 <strcpy>:
};


char*
strcpy(char *s, const char *t)
{
    1220:	f3 0f 1e fb          	endbr32 
    1224:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1225:	31 c0                	xor    %eax,%eax
{
    1227:	89 e5                	mov    %esp,%ebp
    1229:	53                   	push   %ebx
    122a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    122d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    1230:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1234:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1237:	83 c0 01             	add    $0x1,%eax
    123a:	84 d2                	test   %dl,%dl
    123c:	75 f2                	jne    1230 <strcpy+0x10>
    ;
  return os;
}
    123e:	89 c8                	mov    %ecx,%eax
    1240:	5b                   	pop    %ebx
    1241:	5d                   	pop    %ebp
    1242:	c3                   	ret    
    1243:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    124a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001250 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1250:	f3 0f 1e fb          	endbr32 
    1254:	55                   	push   %ebp
    1255:	89 e5                	mov    %esp,%ebp
    1257:	53                   	push   %ebx
    1258:	8b 4d 08             	mov    0x8(%ebp),%ecx
    125b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    125e:	0f b6 01             	movzbl (%ecx),%eax
    1261:	0f b6 1a             	movzbl (%edx),%ebx
    1264:	84 c0                	test   %al,%al
    1266:	75 19                	jne    1281 <strcmp+0x31>
    1268:	eb 26                	jmp    1290 <strcmp+0x40>
    126a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1270:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    1274:	83 c1 01             	add    $0x1,%ecx
    1277:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    127a:	0f b6 1a             	movzbl (%edx),%ebx
    127d:	84 c0                	test   %al,%al
    127f:	74 0f                	je     1290 <strcmp+0x40>
    1281:	38 d8                	cmp    %bl,%al
    1283:	74 eb                	je     1270 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1285:	29 d8                	sub    %ebx,%eax
}
    1287:	5b                   	pop    %ebx
    1288:	5d                   	pop    %ebp
    1289:	c3                   	ret    
    128a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1290:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1292:	29 d8                	sub    %ebx,%eax
}
    1294:	5b                   	pop    %ebx
    1295:	5d                   	pop    %ebp
    1296:	c3                   	ret    
    1297:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    129e:	66 90                	xchg   %ax,%ax

000012a0 <strlen>:

uint
strlen(const char *s)
{
    12a0:	f3 0f 1e fb          	endbr32 
    12a4:	55                   	push   %ebp
    12a5:	89 e5                	mov    %esp,%ebp
    12a7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    12aa:	80 3a 00             	cmpb   $0x0,(%edx)
    12ad:	74 21                	je     12d0 <strlen+0x30>
    12af:	31 c0                	xor    %eax,%eax
    12b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12b8:	83 c0 01             	add    $0x1,%eax
    12bb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    12bf:	89 c1                	mov    %eax,%ecx
    12c1:	75 f5                	jne    12b8 <strlen+0x18>
    ;
  return n;
}
    12c3:	89 c8                	mov    %ecx,%eax
    12c5:	5d                   	pop    %ebp
    12c6:	c3                   	ret    
    12c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ce:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    12d0:	31 c9                	xor    %ecx,%ecx
}
    12d2:	5d                   	pop    %ebp
    12d3:	89 c8                	mov    %ecx,%eax
    12d5:	c3                   	ret    
    12d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12dd:	8d 76 00             	lea    0x0(%esi),%esi

000012e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    12e0:	f3 0f 1e fb          	endbr32 
    12e4:	55                   	push   %ebp
    12e5:	89 e5                	mov    %esp,%ebp
    12e7:	57                   	push   %edi
    12e8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    12eb:	8b 4d 10             	mov    0x10(%ebp),%ecx
    12ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    12f1:	89 d7                	mov    %edx,%edi
    12f3:	fc                   	cld    
    12f4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    12f6:	89 d0                	mov    %edx,%eax
    12f8:	5f                   	pop    %edi
    12f9:	5d                   	pop    %ebp
    12fa:	c3                   	ret    
    12fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12ff:	90                   	nop

00001300 <strchr>:

char*
strchr(const char *s, char c)
{
    1300:	f3 0f 1e fb          	endbr32 
    1304:	55                   	push   %ebp
    1305:	89 e5                	mov    %esp,%ebp
    1307:	8b 45 08             	mov    0x8(%ebp),%eax
    130a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    130e:	0f b6 10             	movzbl (%eax),%edx
    1311:	84 d2                	test   %dl,%dl
    1313:	75 16                	jne    132b <strchr+0x2b>
    1315:	eb 21                	jmp    1338 <strchr+0x38>
    1317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    131e:	66 90                	xchg   %ax,%ax
    1320:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1324:	83 c0 01             	add    $0x1,%eax
    1327:	84 d2                	test   %dl,%dl
    1329:	74 0d                	je     1338 <strchr+0x38>
    if(*s == c)
    132b:	38 d1                	cmp    %dl,%cl
    132d:	75 f1                	jne    1320 <strchr+0x20>
      return (char*)s;
  return 0;
}
    132f:	5d                   	pop    %ebp
    1330:	c3                   	ret    
    1331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1338:	31 c0                	xor    %eax,%eax
}
    133a:	5d                   	pop    %ebp
    133b:	c3                   	ret    
    133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001340 <gets>:

char*
gets(char *buf, int max)
{
    1340:	f3 0f 1e fb          	endbr32 
    1344:	55                   	push   %ebp
    1345:	89 e5                	mov    %esp,%ebp
    1347:	57                   	push   %edi
    1348:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1349:	31 f6                	xor    %esi,%esi
{
    134b:	53                   	push   %ebx
    134c:	89 f3                	mov    %esi,%ebx
    134e:	83 ec 1c             	sub    $0x1c,%esp
    1351:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1354:	eb 33                	jmp    1389 <gets+0x49>
    1356:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    135d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1360:	83 ec 04             	sub    $0x4,%esp
    1363:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1366:	6a 01                	push   $0x1
    1368:	50                   	push   %eax
    1369:	6a 00                	push   $0x0
    136b:	e8 75 03 00 00       	call   16e5 <read>
    if(cc < 1)
    1370:	83 c4 10             	add    $0x10,%esp
    1373:	85 c0                	test   %eax,%eax
    1375:	7e 1c                	jle    1393 <gets+0x53>
      break;
    buf[i++] = c;
    1377:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    137b:	83 c7 01             	add    $0x1,%edi
    137e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1381:	3c 0a                	cmp    $0xa,%al
    1383:	74 23                	je     13a8 <gets+0x68>
    1385:	3c 0d                	cmp    $0xd,%al
    1387:	74 1f                	je     13a8 <gets+0x68>
  for(i=0; i+1 < max; ){
    1389:	83 c3 01             	add    $0x1,%ebx
    138c:	89 fe                	mov    %edi,%esi
    138e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1391:	7c cd                	jl     1360 <gets+0x20>
    1393:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1395:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1398:	c6 03 00             	movb   $0x0,(%ebx)
}
    139b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    139e:	5b                   	pop    %ebx
    139f:	5e                   	pop    %esi
    13a0:	5f                   	pop    %edi
    13a1:	5d                   	pop    %ebp
    13a2:	c3                   	ret    
    13a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13a7:	90                   	nop
    13a8:	8b 75 08             	mov    0x8(%ebp),%esi
    13ab:	8b 45 08             	mov    0x8(%ebp),%eax
    13ae:	01 de                	add    %ebx,%esi
    13b0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    13b2:	c6 03 00             	movb   $0x0,(%ebx)
}
    13b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13b8:	5b                   	pop    %ebx
    13b9:	5e                   	pop    %esi
    13ba:	5f                   	pop    %edi
    13bb:	5d                   	pop    %ebp
    13bc:	c3                   	ret    
    13bd:	8d 76 00             	lea    0x0(%esi),%esi

000013c0 <stat>:

int
stat(const char *n, struct stat *st)
{
    13c0:	f3 0f 1e fb          	endbr32 
    13c4:	55                   	push   %ebp
    13c5:	89 e5                	mov    %esp,%ebp
    13c7:	56                   	push   %esi
    13c8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    13c9:	83 ec 08             	sub    $0x8,%esp
    13cc:	6a 00                	push   $0x0
    13ce:	ff 75 08             	pushl  0x8(%ebp)
    13d1:	e8 37 03 00 00       	call   170d <open>
  if(fd < 0)
    13d6:	83 c4 10             	add    $0x10,%esp
    13d9:	85 c0                	test   %eax,%eax
    13db:	78 2b                	js     1408 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    13dd:	83 ec 08             	sub    $0x8,%esp
    13e0:	ff 75 0c             	pushl  0xc(%ebp)
    13e3:	89 c3                	mov    %eax,%ebx
    13e5:	50                   	push   %eax
    13e6:	e8 3a 03 00 00       	call   1725 <fstat>
  close(fd);
    13eb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    13ee:	89 c6                	mov    %eax,%esi
  close(fd);
    13f0:	e8 00 03 00 00       	call   16f5 <close>
  return r;
    13f5:	83 c4 10             	add    $0x10,%esp
}
    13f8:	8d 65 f8             	lea    -0x8(%ebp),%esp
    13fb:	89 f0                	mov    %esi,%eax
    13fd:	5b                   	pop    %ebx
    13fe:	5e                   	pop    %esi
    13ff:	5d                   	pop    %ebp
    1400:	c3                   	ret    
    1401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1408:	be ff ff ff ff       	mov    $0xffffffff,%esi
    140d:	eb e9                	jmp    13f8 <stat+0x38>
    140f:	90                   	nop

00001410 <atoi>:

int
atoi(const char *s)
{
    1410:	f3 0f 1e fb          	endbr32 
    1414:	55                   	push   %ebp
    1415:	89 e5                	mov    %esp,%ebp
    1417:	53                   	push   %ebx
    1418:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    141b:	0f be 02             	movsbl (%edx),%eax
    141e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1421:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1424:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1429:	77 1a                	ja     1445 <atoi+0x35>
    142b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    142f:	90                   	nop
    n = n*10 + *s++ - '0';
    1430:	83 c2 01             	add    $0x1,%edx
    1433:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1436:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    143a:	0f be 02             	movsbl (%edx),%eax
    143d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1440:	80 fb 09             	cmp    $0x9,%bl
    1443:	76 eb                	jbe    1430 <atoi+0x20>
  return n;
}
    1445:	89 c8                	mov    %ecx,%eax
    1447:	5b                   	pop    %ebx
    1448:	5d                   	pop    %ebp
    1449:	c3                   	ret    
    144a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001450 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1450:	f3 0f 1e fb          	endbr32 
    1454:	55                   	push   %ebp
    1455:	89 e5                	mov    %esp,%ebp
    1457:	57                   	push   %edi
    1458:	8b 45 10             	mov    0x10(%ebp),%eax
    145b:	8b 55 08             	mov    0x8(%ebp),%edx
    145e:	56                   	push   %esi
    145f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1462:	85 c0                	test   %eax,%eax
    1464:	7e 0f                	jle    1475 <memmove+0x25>
    1466:	01 d0                	add    %edx,%eax
  dst = vdst;
    1468:	89 d7                	mov    %edx,%edi
    146a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1470:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1471:	39 f8                	cmp    %edi,%eax
    1473:	75 fb                	jne    1470 <memmove+0x20>
  return vdst;
}
    1475:	5e                   	pop    %esi
    1476:	89 d0                	mov    %edx,%eax
    1478:	5f                   	pop    %edi
    1479:	5d                   	pop    %ebp
    147a:	c3                   	ret    
    147b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    147f:	90                   	nop

00001480 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
    1480:	f3 0f 1e fb          	endbr32 
    1484:	55                   	push   %ebp
    1485:	89 e5                	mov    %esp,%ebp
    1487:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
    148a:	8d 45 f4             	lea    -0xc(%ebp),%eax
    148d:	50                   	push   %eax
    148e:	e8 0a 03 00 00       	call   179d <join>
  
  return x;
}
    1493:	c9                   	leave  
    1494:	c3                   	ret    
    1495:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    149c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000014a0 <lock_init>:

void lock_init(struct lock_t *lk){
    14a0:	f3 0f 1e fb          	endbr32 
    14a4:	55                   	push   %ebp
    14a5:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
    14a7:	8b 45 08             	mov    0x8(%ebp),%eax
    14aa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    14b0:	5d                   	pop    %ebp
    14b1:	c3                   	ret    
    14b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000014c0 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
    14c0:	f3 0f 1e fb          	endbr32 
    14c4:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    14c5:	b9 01 00 00 00       	mov    $0x1,%ecx
    14ca:	89 e5                	mov    %esp,%ebp
    14cc:	8b 55 08             	mov    0x8(%ebp),%edx
    14cf:	90                   	nop
    14d0:	89 c8                	mov    %ecx,%eax
    14d2:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
    14d5:	85 c0                	test   %eax,%eax
    14d7:	75 f7                	jne    14d0 <lock_acquire+0x10>
}
    14d9:	5d                   	pop    %ebp
    14da:	c3                   	ret    
    14db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14df:	90                   	nop

000014e0 <lock_release>:
void lock_release(struct lock_t *lk){
    14e0:	f3 0f 1e fb          	endbr32 
    14e4:	55                   	push   %ebp
    14e5:	31 c0                	xor    %eax,%eax
    14e7:	89 e5                	mov    %esp,%ebp
    14e9:	8b 55 08             	mov    0x8(%ebp),%edx
    14ec:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
    14ef:	5d                   	pop    %ebp
    14f0:	c3                   	ret    
    14f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ff:	90                   	nop

00001500 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1500:	f3 0f 1e fb          	endbr32 
    1504:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1505:	a1 18 1e 00 00       	mov    0x1e18,%eax
{
    150a:	89 e5                	mov    %esp,%ebp
    150c:	57                   	push   %edi
    150d:	56                   	push   %esi
    150e:	53                   	push   %ebx
    150f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1512:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    1514:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1517:	39 c8                	cmp    %ecx,%eax
    1519:	73 15                	jae    1530 <free+0x30>
    151b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    151f:	90                   	nop
    1520:	39 d1                	cmp    %edx,%ecx
    1522:	72 14                	jb     1538 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1524:	39 d0                	cmp    %edx,%eax
    1526:	73 10                	jae    1538 <free+0x38>
{
    1528:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    152a:	8b 10                	mov    (%eax),%edx
    152c:	39 c8                	cmp    %ecx,%eax
    152e:	72 f0                	jb     1520 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1530:	39 d0                	cmp    %edx,%eax
    1532:	72 f4                	jb     1528 <free+0x28>
    1534:	39 d1                	cmp    %edx,%ecx
    1536:	73 f0                	jae    1528 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1538:	8b 73 fc             	mov    -0x4(%ebx),%esi
    153b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    153e:	39 fa                	cmp    %edi,%edx
    1540:	74 1e                	je     1560 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1542:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1545:	8b 50 04             	mov    0x4(%eax),%edx
    1548:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    154b:	39 f1                	cmp    %esi,%ecx
    154d:	74 28                	je     1577 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    154f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1551:	5b                   	pop    %ebx
  freep = p;
    1552:	a3 18 1e 00 00       	mov    %eax,0x1e18
}
    1557:	5e                   	pop    %esi
    1558:	5f                   	pop    %edi
    1559:	5d                   	pop    %ebp
    155a:	c3                   	ret    
    155b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    155f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1560:	03 72 04             	add    0x4(%edx),%esi
    1563:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1566:	8b 10                	mov    (%eax),%edx
    1568:	8b 12                	mov    (%edx),%edx
    156a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    156d:	8b 50 04             	mov    0x4(%eax),%edx
    1570:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1573:	39 f1                	cmp    %esi,%ecx
    1575:	75 d8                	jne    154f <free+0x4f>
    p->s.size += bp->s.size;
    1577:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    157a:	a3 18 1e 00 00       	mov    %eax,0x1e18
    p->s.size += bp->s.size;
    157f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1582:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1585:	89 10                	mov    %edx,(%eax)
}
    1587:	5b                   	pop    %ebx
    1588:	5e                   	pop    %esi
    1589:	5f                   	pop    %edi
    158a:	5d                   	pop    %ebp
    158b:	c3                   	ret    
    158c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001590 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1590:	f3 0f 1e fb          	endbr32 
    1594:	55                   	push   %ebp
    1595:	89 e5                	mov    %esp,%ebp
    1597:	57                   	push   %edi
    1598:	56                   	push   %esi
    1599:	53                   	push   %ebx
    159a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    159d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    15a0:	8b 3d 18 1e 00 00    	mov    0x1e18,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    15a6:	8d 70 07             	lea    0x7(%eax),%esi
    15a9:	c1 ee 03             	shr    $0x3,%esi
    15ac:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    15af:	85 ff                	test   %edi,%edi
    15b1:	0f 84 a9 00 00 00    	je     1660 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15b7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    15b9:	8b 48 04             	mov    0x4(%eax),%ecx
    15bc:	39 f1                	cmp    %esi,%ecx
    15be:	73 6d                	jae    162d <malloc+0x9d>
    15c0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    15c6:	bb 00 10 00 00       	mov    $0x1000,%ebx
    15cb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    15ce:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    15d5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    15d8:	eb 17                	jmp    15f1 <malloc+0x61>
    15da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15e0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    15e2:	8b 4a 04             	mov    0x4(%edx),%ecx
    15e5:	39 f1                	cmp    %esi,%ecx
    15e7:	73 4f                	jae    1638 <malloc+0xa8>
    15e9:	8b 3d 18 1e 00 00    	mov    0x1e18,%edi
    15ef:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    15f1:	39 c7                	cmp    %eax,%edi
    15f3:	75 eb                	jne    15e0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    15f5:	83 ec 0c             	sub    $0xc,%esp
    15f8:	ff 75 e4             	pushl  -0x1c(%ebp)
    15fb:	e8 55 01 00 00       	call   1755 <sbrk>
  if(p == (char*)-1)
    1600:	83 c4 10             	add    $0x10,%esp
    1603:	83 f8 ff             	cmp    $0xffffffff,%eax
    1606:	74 1b                	je     1623 <malloc+0x93>
  hp->s.size = nu;
    1608:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    160b:	83 ec 0c             	sub    $0xc,%esp
    160e:	83 c0 08             	add    $0x8,%eax
    1611:	50                   	push   %eax
    1612:	e8 e9 fe ff ff       	call   1500 <free>
  return freep;
    1617:	a1 18 1e 00 00       	mov    0x1e18,%eax
      if((p = morecore(nunits)) == 0)
    161c:	83 c4 10             	add    $0x10,%esp
    161f:	85 c0                	test   %eax,%eax
    1621:	75 bd                	jne    15e0 <malloc+0x50>
        return 0;
  }
}
    1623:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1626:	31 c0                	xor    %eax,%eax
}
    1628:	5b                   	pop    %ebx
    1629:	5e                   	pop    %esi
    162a:	5f                   	pop    %edi
    162b:	5d                   	pop    %ebp
    162c:	c3                   	ret    
    if(p->s.size >= nunits){
    162d:	89 c2                	mov    %eax,%edx
    162f:	89 f8                	mov    %edi,%eax
    1631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1638:	39 ce                	cmp    %ecx,%esi
    163a:	74 54                	je     1690 <malloc+0x100>
        p->s.size -= nunits;
    163c:	29 f1                	sub    %esi,%ecx
    163e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1641:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1644:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1647:	a3 18 1e 00 00       	mov    %eax,0x1e18
}
    164c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    164f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1652:	5b                   	pop    %ebx
    1653:	5e                   	pop    %esi
    1654:	5f                   	pop    %edi
    1655:	5d                   	pop    %ebp
    1656:	c3                   	ret    
    1657:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    165e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1660:	c7 05 18 1e 00 00 1c 	movl   $0x1e1c,0x1e18
    1667:	1e 00 00 
    base.s.size = 0;
    166a:	bf 1c 1e 00 00       	mov    $0x1e1c,%edi
    base.s.ptr = freep = prevp = &base;
    166f:	c7 05 1c 1e 00 00 1c 	movl   $0x1e1c,0x1e1c
    1676:	1e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1679:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    167b:	c7 05 20 1e 00 00 00 	movl   $0x0,0x1e20
    1682:	00 00 00 
    if(p->s.size >= nunits){
    1685:	e9 36 ff ff ff       	jmp    15c0 <malloc+0x30>
    168a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1690:	8b 0a                	mov    (%edx),%ecx
    1692:	89 08                	mov    %ecx,(%eax)
    1694:	eb b1                	jmp    1647 <malloc+0xb7>
    1696:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    169d:	8d 76 00             	lea    0x0(%esi),%esi

000016a0 <thread_create>:
{
    16a0:	f3 0f 1e fb          	endbr32 
    16a4:	55                   	push   %ebp
    16a5:	89 e5                	mov    %esp,%ebp
    16a7:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
    16aa:	68 00 10 00 00       	push   $0x1000
    16af:	e8 dc fe ff ff       	call   1590 <malloc>
return clone(start_routine,arg1,arg2,stack);
    16b4:	50                   	push   %eax
    16b5:	ff 75 10             	pushl  0x10(%ebp)
    16b8:	ff 75 0c             	pushl  0xc(%ebp)
    16bb:	ff 75 08             	pushl  0x8(%ebp)
    16be:	e8 d2 00 00 00       	call   1795 <clone>
}
    16c3:	c9                   	leave  
    16c4:	c3                   	ret    

000016c5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    16c5:	b8 01 00 00 00       	mov    $0x1,%eax
    16ca:	cd 40                	int    $0x40
    16cc:	c3                   	ret    

000016cd <exit>:
SYSCALL(exit)
    16cd:	b8 02 00 00 00       	mov    $0x2,%eax
    16d2:	cd 40                	int    $0x40
    16d4:	c3                   	ret    

000016d5 <wait>:
SYSCALL(wait)
    16d5:	b8 03 00 00 00       	mov    $0x3,%eax
    16da:	cd 40                	int    $0x40
    16dc:	c3                   	ret    

000016dd <pipe>:
SYSCALL(pipe)
    16dd:	b8 04 00 00 00       	mov    $0x4,%eax
    16e2:	cd 40                	int    $0x40
    16e4:	c3                   	ret    

000016e5 <read>:
SYSCALL(read)
    16e5:	b8 05 00 00 00       	mov    $0x5,%eax
    16ea:	cd 40                	int    $0x40
    16ec:	c3                   	ret    

000016ed <write>:
SYSCALL(write)
    16ed:	b8 10 00 00 00       	mov    $0x10,%eax
    16f2:	cd 40                	int    $0x40
    16f4:	c3                   	ret    

000016f5 <close>:
SYSCALL(close)
    16f5:	b8 15 00 00 00       	mov    $0x15,%eax
    16fa:	cd 40                	int    $0x40
    16fc:	c3                   	ret    

000016fd <kill>:
SYSCALL(kill)
    16fd:	b8 06 00 00 00       	mov    $0x6,%eax
    1702:	cd 40                	int    $0x40
    1704:	c3                   	ret    

00001705 <exec>:
SYSCALL(exec)
    1705:	b8 07 00 00 00       	mov    $0x7,%eax
    170a:	cd 40                	int    $0x40
    170c:	c3                   	ret    

0000170d <open>:
SYSCALL(open)
    170d:	b8 0f 00 00 00       	mov    $0xf,%eax
    1712:	cd 40                	int    $0x40
    1714:	c3                   	ret    

00001715 <mknod>:
SYSCALL(mknod)
    1715:	b8 11 00 00 00       	mov    $0x11,%eax
    171a:	cd 40                	int    $0x40
    171c:	c3                   	ret    

0000171d <unlink>:
SYSCALL(unlink)
    171d:	b8 12 00 00 00       	mov    $0x12,%eax
    1722:	cd 40                	int    $0x40
    1724:	c3                   	ret    

00001725 <fstat>:
SYSCALL(fstat)
    1725:	b8 08 00 00 00       	mov    $0x8,%eax
    172a:	cd 40                	int    $0x40
    172c:	c3                   	ret    

0000172d <link>:
SYSCALL(link)
    172d:	b8 13 00 00 00       	mov    $0x13,%eax
    1732:	cd 40                	int    $0x40
    1734:	c3                   	ret    

00001735 <mkdir>:
SYSCALL(mkdir)
    1735:	b8 14 00 00 00       	mov    $0x14,%eax
    173a:	cd 40                	int    $0x40
    173c:	c3                   	ret    

0000173d <chdir>:
SYSCALL(chdir)
    173d:	b8 09 00 00 00       	mov    $0x9,%eax
    1742:	cd 40                	int    $0x40
    1744:	c3                   	ret    

00001745 <dup>:
SYSCALL(dup)
    1745:	b8 0a 00 00 00       	mov    $0xa,%eax
    174a:	cd 40                	int    $0x40
    174c:	c3                   	ret    

0000174d <getpid>:
SYSCALL(getpid)
    174d:	b8 0b 00 00 00       	mov    $0xb,%eax
    1752:	cd 40                	int    $0x40
    1754:	c3                   	ret    

00001755 <sbrk>:
SYSCALL(sbrk)
    1755:	b8 0c 00 00 00       	mov    $0xc,%eax
    175a:	cd 40                	int    $0x40
    175c:	c3                   	ret    

0000175d <sleep>:
SYSCALL(sleep)
    175d:	b8 0d 00 00 00       	mov    $0xd,%eax
    1762:	cd 40                	int    $0x40
    1764:	c3                   	ret    

00001765 <uptime>:
SYSCALL(uptime)
    1765:	b8 0e 00 00 00       	mov    $0xe,%eax
    176a:	cd 40                	int    $0x40
    176c:	c3                   	ret    

0000176d <count>:
SYSCALL(count)
    176d:	b8 16 00 00 00       	mov    $0x16,%eax
    1772:	cd 40                	int    $0x40
    1774:	c3                   	ret    

00001775 <settickets>:

SYSCALL(settickets)
    1775:	b8 17 00 00 00       	mov    $0x17,%eax
    177a:	cd 40                	int    $0x40
    177c:	c3                   	ret    

0000177d <getpinfo>:
SYSCALL(getpinfo)
    177d:	b8 18 00 00 00       	mov    $0x18,%eax
    1782:	cd 40                	int    $0x40
    1784:	c3                   	ret    

00001785 <mprotect>:

SYSCALL(mprotect)
    1785:	b8 19 00 00 00       	mov    $0x19,%eax
    178a:	cd 40                	int    $0x40
    178c:	c3                   	ret    

0000178d <munprotect>:
SYSCALL(munprotect)
    178d:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1792:	cd 40                	int    $0x40
    1794:	c3                   	ret    

00001795 <clone>:

SYSCALL(clone)
    1795:	b8 1b 00 00 00       	mov    $0x1b,%eax
    179a:	cd 40                	int    $0x40
    179c:	c3                   	ret    

0000179d <join>:
SYSCALL(join)
    179d:	b8 1c 00 00 00       	mov    $0x1c,%eax
    17a2:	cd 40                	int    $0x40
    17a4:	c3                   	ret    
    17a5:	66 90                	xchg   %ax,%ax
    17a7:	66 90                	xchg   %ax,%ax
    17a9:	66 90                	xchg   %ax,%ax
    17ab:	66 90                	xchg   %ax,%ax
    17ad:	66 90                	xchg   %ax,%ax
    17af:	90                   	nop

000017b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    17b0:	55                   	push   %ebp
    17b1:	89 e5                	mov    %esp,%ebp
    17b3:	57                   	push   %edi
    17b4:	56                   	push   %esi
    17b5:	53                   	push   %ebx
    17b6:	83 ec 3c             	sub    $0x3c,%esp
    17b9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    17bc:	89 d1                	mov    %edx,%ecx
{
    17be:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    17c1:	85 d2                	test   %edx,%edx
    17c3:	0f 89 7f 00 00 00    	jns    1848 <printint+0x98>
    17c9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    17cd:	74 79                	je     1848 <printint+0x98>
    neg = 1;
    17cf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    17d6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    17d8:	31 db                	xor    %ebx,%ebx
    17da:	8d 75 d7             	lea    -0x29(%ebp),%esi
    17dd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    17e0:	89 c8                	mov    %ecx,%eax
    17e2:	31 d2                	xor    %edx,%edx
    17e4:	89 cf                	mov    %ecx,%edi
    17e6:	f7 75 c4             	divl   -0x3c(%ebp)
    17e9:	0f b6 92 b0 1a 00 00 	movzbl 0x1ab0(%edx),%edx
    17f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    17f3:	89 d8                	mov    %ebx,%eax
    17f5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    17f8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    17fb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    17fe:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1801:	76 dd                	jbe    17e0 <printint+0x30>
  if(neg)
    1803:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1806:	85 c9                	test   %ecx,%ecx
    1808:	74 0c                	je     1816 <printint+0x66>
    buf[i++] = '-';
    180a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    180f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1811:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1816:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1819:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    181d:	eb 07                	jmp    1826 <printint+0x76>
    181f:	90                   	nop
    1820:	0f b6 13             	movzbl (%ebx),%edx
    1823:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1826:	83 ec 04             	sub    $0x4,%esp
    1829:	88 55 d7             	mov    %dl,-0x29(%ebp)
    182c:	6a 01                	push   $0x1
    182e:	56                   	push   %esi
    182f:	57                   	push   %edi
    1830:	e8 b8 fe ff ff       	call   16ed <write>
  while(--i >= 0)
    1835:	83 c4 10             	add    $0x10,%esp
    1838:	39 de                	cmp    %ebx,%esi
    183a:	75 e4                	jne    1820 <printint+0x70>
    putc(fd, buf[i]);
}
    183c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    183f:	5b                   	pop    %ebx
    1840:	5e                   	pop    %esi
    1841:	5f                   	pop    %edi
    1842:	5d                   	pop    %ebp
    1843:	c3                   	ret    
    1844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1848:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    184f:	eb 87                	jmp    17d8 <printint+0x28>
    1851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1858:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    185f:	90                   	nop

00001860 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1860:	f3 0f 1e fb          	endbr32 
    1864:	55                   	push   %ebp
    1865:	89 e5                	mov    %esp,%ebp
    1867:	57                   	push   %edi
    1868:	56                   	push   %esi
    1869:	53                   	push   %ebx
    186a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    186d:	8b 75 0c             	mov    0xc(%ebp),%esi
    1870:	0f b6 1e             	movzbl (%esi),%ebx
    1873:	84 db                	test   %bl,%bl
    1875:	0f 84 b4 00 00 00    	je     192f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    187b:	8d 45 10             	lea    0x10(%ebp),%eax
    187e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1881:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1884:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1886:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1889:	eb 33                	jmp    18be <printf+0x5e>
    188b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    188f:	90                   	nop
    1890:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1893:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1898:	83 f8 25             	cmp    $0x25,%eax
    189b:	74 17                	je     18b4 <printf+0x54>
  write(fd, &c, 1);
    189d:	83 ec 04             	sub    $0x4,%esp
    18a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
    18a3:	6a 01                	push   $0x1
    18a5:	57                   	push   %edi
    18a6:	ff 75 08             	pushl  0x8(%ebp)
    18a9:	e8 3f fe ff ff       	call   16ed <write>
    18ae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    18b1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    18b4:	0f b6 1e             	movzbl (%esi),%ebx
    18b7:	83 c6 01             	add    $0x1,%esi
    18ba:	84 db                	test   %bl,%bl
    18bc:	74 71                	je     192f <printf+0xcf>
    c = fmt[i] & 0xff;
    18be:	0f be cb             	movsbl %bl,%ecx
    18c1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    18c4:	85 d2                	test   %edx,%edx
    18c6:	74 c8                	je     1890 <printf+0x30>
      }
    } else if(state == '%'){
    18c8:	83 fa 25             	cmp    $0x25,%edx
    18cb:	75 e7                	jne    18b4 <printf+0x54>
      if(c == 'd'){
    18cd:	83 f8 64             	cmp    $0x64,%eax
    18d0:	0f 84 9a 00 00 00    	je     1970 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    18d6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    18dc:	83 f9 70             	cmp    $0x70,%ecx
    18df:	74 5f                	je     1940 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    18e1:	83 f8 73             	cmp    $0x73,%eax
    18e4:	0f 84 d6 00 00 00    	je     19c0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    18ea:	83 f8 63             	cmp    $0x63,%eax
    18ed:	0f 84 8d 00 00 00    	je     1980 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    18f3:	83 f8 25             	cmp    $0x25,%eax
    18f6:	0f 84 b4 00 00 00    	je     19b0 <printf+0x150>
  write(fd, &c, 1);
    18fc:	83 ec 04             	sub    $0x4,%esp
    18ff:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1903:	6a 01                	push   $0x1
    1905:	57                   	push   %edi
    1906:	ff 75 08             	pushl  0x8(%ebp)
    1909:	e8 df fd ff ff       	call   16ed <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    190e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1911:	83 c4 0c             	add    $0xc,%esp
    1914:	6a 01                	push   $0x1
    1916:	83 c6 01             	add    $0x1,%esi
    1919:	57                   	push   %edi
    191a:	ff 75 08             	pushl  0x8(%ebp)
    191d:	e8 cb fd ff ff       	call   16ed <write>
  for(i = 0; fmt[i]; i++){
    1922:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1926:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1929:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    192b:	84 db                	test   %bl,%bl
    192d:	75 8f                	jne    18be <printf+0x5e>
    }
  }
}
    192f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1932:	5b                   	pop    %ebx
    1933:	5e                   	pop    %esi
    1934:	5f                   	pop    %edi
    1935:	5d                   	pop    %ebp
    1936:	c3                   	ret    
    1937:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    193e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1940:	83 ec 0c             	sub    $0xc,%esp
    1943:	b9 10 00 00 00       	mov    $0x10,%ecx
    1948:	6a 00                	push   $0x0
    194a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    194d:	8b 45 08             	mov    0x8(%ebp),%eax
    1950:	8b 13                	mov    (%ebx),%edx
    1952:	e8 59 fe ff ff       	call   17b0 <printint>
        ap++;
    1957:	89 d8                	mov    %ebx,%eax
    1959:	83 c4 10             	add    $0x10,%esp
      state = 0;
    195c:	31 d2                	xor    %edx,%edx
        ap++;
    195e:	83 c0 04             	add    $0x4,%eax
    1961:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1964:	e9 4b ff ff ff       	jmp    18b4 <printf+0x54>
    1969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1970:	83 ec 0c             	sub    $0xc,%esp
    1973:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1978:	6a 01                	push   $0x1
    197a:	eb ce                	jmp    194a <printf+0xea>
    197c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1980:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1983:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1986:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1988:	6a 01                	push   $0x1
        ap++;
    198a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    198d:	57                   	push   %edi
    198e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1991:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1994:	e8 54 fd ff ff       	call   16ed <write>
        ap++;
    1999:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    199c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    199f:	31 d2                	xor    %edx,%edx
    19a1:	e9 0e ff ff ff       	jmp    18b4 <printf+0x54>
    19a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    19ad:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    19b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    19b3:	83 ec 04             	sub    $0x4,%esp
    19b6:	e9 59 ff ff ff       	jmp    1914 <printf+0xb4>
    19bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    19bf:	90                   	nop
        s = (char*)*ap;
    19c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    19c3:	8b 18                	mov    (%eax),%ebx
        ap++;
    19c5:	83 c0 04             	add    $0x4,%eax
    19c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    19cb:	85 db                	test   %ebx,%ebx
    19cd:	74 17                	je     19e6 <printf+0x186>
        while(*s != 0){
    19cf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    19d2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    19d4:	84 c0                	test   %al,%al
    19d6:	0f 84 d8 fe ff ff    	je     18b4 <printf+0x54>
    19dc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    19df:	89 de                	mov    %ebx,%esi
    19e1:	8b 5d 08             	mov    0x8(%ebp),%ebx
    19e4:	eb 1a                	jmp    1a00 <printf+0x1a0>
          s = "(null)";
    19e6:	bb a9 1a 00 00       	mov    $0x1aa9,%ebx
        while(*s != 0){
    19eb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    19ee:	b8 28 00 00 00       	mov    $0x28,%eax
    19f3:	89 de                	mov    %ebx,%esi
    19f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    19f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    19ff:	90                   	nop
  write(fd, &c, 1);
    1a00:	83 ec 04             	sub    $0x4,%esp
          s++;
    1a03:	83 c6 01             	add    $0x1,%esi
    1a06:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1a09:	6a 01                	push   $0x1
    1a0b:	57                   	push   %edi
    1a0c:	53                   	push   %ebx
    1a0d:	e8 db fc ff ff       	call   16ed <write>
        while(*s != 0){
    1a12:	0f b6 06             	movzbl (%esi),%eax
    1a15:	83 c4 10             	add    $0x10,%esp
    1a18:	84 c0                	test   %al,%al
    1a1a:	75 e4                	jne    1a00 <printf+0x1a0>
    1a1c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1a1f:	31 d2                	xor    %edx,%edx
    1a21:	e9 8e fe ff ff       	jmp    18b4 <printf+0x54>
