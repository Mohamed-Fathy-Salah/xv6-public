
_pro_test4:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
      if (sign)
            ret *= -1;
      return ret;
}
int abs(int x) { return x < 0 ? -x : x; }
int main(int argc, char *argv[]){
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
    1015:	83 ec 08             	sub    $0x8,%esp
      if (argc != 3){
    1018:	83 39 03             	cmpl   $0x3,(%ecx)
int main(int argc, char *argv[]){
    101b:	8b 59 04             	mov    0x4(%ecx),%ebx
      if (argc != 3){
    101e:	74 13                	je     1033 <main+0x33>
            printf(1, "enter the parameters of the test\npro_test4 offset len\nex: pro_test4 0 4\n");
    1020:	51                   	push   %ecx
    1021:	51                   	push   %ecx
    1022:	68 24 1a 00 00       	push   $0x1a24
    1027:	6a 01                	push   $0x1
    1029:	e8 c2 07 00 00       	call   17f0 <printf>
            exit();
    102e:	e8 2a 06 00 00       	call   165d <exit>
      }

      int offset = toInt(argv[1]);
    1033:	83 ec 0c             	sub    $0xc,%esp
    1036:	ff 73 04             	pushl  0x4(%ebx)
    1039:	e8 c2 00 00 00       	call   1100 <toInt>
    103e:	89 c6                	mov    %eax,%esi
      int len = toInt(argv[2]);
    1040:	58                   	pop    %eax
    1041:	ff 73 08             	pushl  0x8(%ebx)
    1044:	e8 b7 00 00 00       	call   1100 <toInt>

      char *start = sbrk(0);
    1049:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      int len = toInt(argv[2]);
    1050:	89 c3                	mov    %eax,%ebx
      char *start = sbrk(0);
    1052:	e8 8e 06 00 00       	call   16e5 <sbrk>
int abs(int x) { return x < 0 ? -x : x; }
    1057:	89 da                	mov    %ebx,%edx
    1059:	c1 fa 1f             	sar    $0x1f,%edx
      char *start = sbrk(0);
    105c:	89 c7                	mov    %eax,%edi
int abs(int x) { return x < 0 ? -x : x; }
    105e:	89 d0                	mov    %edx,%eax
      sbrk(PGSIZE * abs(len)); // to show the error that will happent if we passed neg len

      int x = mprotect(start + offset, len);
    1060:	01 fe                	add    %edi,%esi
int abs(int x) { return x < 0 ? -x : x; }
    1062:	31 d8                	xor    %ebx,%eax
    1064:	29 d0                	sub    %edx,%eax
      sbrk(PGSIZE * abs(len)); // to show the error that will happent if we passed neg len
    1066:	c1 e0 0c             	shl    $0xc,%eax
    1069:	89 04 24             	mov    %eax,(%esp)
    106c:	e8 74 06 00 00       	call   16e5 <sbrk>
      int x = mprotect(start + offset, len);
    1071:	58                   	pop    %eax
    1072:	5a                   	pop    %edx
    1073:	53                   	push   %ebx
    1074:	56                   	push   %esi
    1075:	e8 9b 06 00 00       	call   1715 <mprotect>

      if (x == 0)
    107a:	83 c4 10             	add    $0x10,%esp
    107d:	85 c0                	test   %eax,%eax
    107f:	74 1a                	je     109b <main+0x9b>
            printf(1, "protection succeded i will trap after changing the value\n");
      else 
            printf(1, "protection failed\n");
    1081:	56                   	push   %esi
    1082:	56                   	push   %esi
    1083:	68 d5 19 00 00       	push   $0x19d5
    1088:	6a 01                	push   $0x1
    108a:	e8 61 07 00 00       	call   17f0 <printf>
    108f:	83 c4 10             	add    $0x10,%esp

      if(len){
    1092:	85 db                	test   %ebx,%ebx
    1094:	75 18                	jne    10ae <main+0xae>
            printf(1,"val = %d\n",*start);
            *start = 5;
            printf(1, "the value has been changed!\n");
            printf(1,"val = %d\n",*start);
      }
      exit();
    1096:	e8 c2 05 00 00       	call   165d <exit>
            printf(1, "protection succeded i will trap after changing the value\n");
    109b:	50                   	push   %eax
    109c:	50                   	push   %eax
    109d:	68 70 1a 00 00       	push   $0x1a70
    10a2:	6a 01                	push   $0x1
    10a4:	e8 47 07 00 00       	call   17f0 <printf>
    10a9:	83 c4 10             	add    $0x10,%esp
    10ac:	eb e4                	jmp    1092 <main+0x92>
            printf(1, "changing the value\n");
    10ae:	50                   	push   %eax
    10af:	50                   	push   %eax
    10b0:	68 e8 19 00 00       	push   $0x19e8
    10b5:	6a 01                	push   $0x1
    10b7:	e8 34 07 00 00       	call   17f0 <printf>
            printf(1,"val = %d\n",*start);
    10bc:	0f be 07             	movsbl (%edi),%eax
    10bf:	83 c4 0c             	add    $0xc,%esp
    10c2:	50                   	push   %eax
    10c3:	68 fc 19 00 00       	push   $0x19fc
    10c8:	6a 01                	push   $0x1
    10ca:	e8 21 07 00 00       	call   17f0 <printf>
            *start = 5;
    10cf:	c6 07 05             	movb   $0x5,(%edi)
            printf(1, "the value has been changed!\n");
    10d2:	5a                   	pop    %edx
    10d3:	59                   	pop    %ecx
    10d4:	68 06 1a 00 00       	push   $0x1a06
    10d9:	6a 01                	push   $0x1
    10db:	e8 10 07 00 00       	call   17f0 <printf>
            printf(1,"val = %d\n",*start);
    10e0:	0f be 07             	movsbl (%edi),%eax
    10e3:	83 c4 0c             	add    $0xc,%esp
    10e6:	50                   	push   %eax
    10e7:	68 fc 19 00 00       	push   $0x19fc
    10ec:	6a 01                	push   $0x1
    10ee:	e8 fd 06 00 00       	call   17f0 <printf>
    10f3:	83 c4 10             	add    $0x10,%esp
    10f6:	eb 9e                	jmp    1096 <main+0x96>
    10f8:	66 90                	xchg   %ax,%ax
    10fa:	66 90                	xchg   %ax,%ax
    10fc:	66 90                	xchg   %ax,%ax
    10fe:	66 90                	xchg   %ax,%ax

00001100 <toInt>:
int toInt(char *s){
    1100:	f3 0f 1e fb          	endbr32 
    1104:	55                   	push   %ebp
    1105:	89 e5                	mov    %esp,%ebp
    1107:	56                   	push   %esi
    1108:	53                   	push   %ebx
    1109:	8b 5d 08             	mov    0x8(%ebp),%ebx
      if (*s == '-'){
    110c:	0f be 03             	movsbl (%ebx),%eax
    110f:	3c 2d                	cmp    $0x2d,%al
    1111:	74 65                	je     1178 <toInt+0x78>
      int sign = 0;
    1113:	31 f6                	xor    %esi,%esi
      while (*s){
    1115:	84 c0                	test   %al,%al
    1117:	74 73                	je     118c <toInt+0x8c>
      int sign = 0;
    1119:	31 d2                	xor    %edx,%edx
    111b:	eb 14                	jmp    1131 <toInt+0x31>
    111d:	8d 76 00             	lea    0x0(%esi),%esi
            ret = ret * 10 + (*s - '0');
    1120:	8d 14 92             	lea    (%edx,%edx,4),%edx
            s++;
    1123:	83 c3 01             	add    $0x1,%ebx
            ret = ret * 10 + (*s - '0');
    1126:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
      while (*s){
    112a:	0f be 03             	movsbl (%ebx),%eax
    112d:	84 c0                	test   %al,%al
    112f:	74 2f                	je     1160 <toInt+0x60>
            if (*s > '9' || *s < '0'){
    1131:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1134:	80 f9 09             	cmp    $0x9,%cl
    1137:	76 e7                	jbe    1120 <toInt+0x20>
                  printf(1, "parameters are numbers only\n");
    1139:	83 ec 08             	sub    $0x8,%esp
    113c:	68 b8 19 00 00       	push   $0x19b8
    1141:	6a 01                	push   $0x1
    1143:	e8 a8 06 00 00       	call   17f0 <printf>
    1148:	83 c4 10             	add    $0x10,%esp
    114b:	ba ff ff ff ff       	mov    $0xffffffff,%edx
}
    1150:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1153:	89 d0                	mov    %edx,%eax
    1155:	5b                   	pop    %ebx
    1156:	5e                   	pop    %esi
    1157:	5d                   	pop    %ebp
    1158:	c3                   	ret    
    1159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if (sign)
    1160:	89 d0                	mov    %edx,%eax
    1162:	f7 d8                	neg    %eax
    1164:	85 f6                	test   %esi,%esi
    1166:	0f 45 d0             	cmovne %eax,%edx
}
    1169:	8d 65 f8             	lea    -0x8(%ebp),%esp
    116c:	5b                   	pop    %ebx
    116d:	5e                   	pop    %esi
    116e:	89 d0                	mov    %edx,%eax
    1170:	5d                   	pop    %ebp
    1171:	c3                   	ret    
    1172:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      while (*s){
    1178:	0f be 43 01          	movsbl 0x1(%ebx),%eax
            s++;
    117c:	8d 53 01             	lea    0x1(%ebx),%edx
      while (*s){
    117f:	84 c0                	test   %al,%al
    1181:	74 09                	je     118c <toInt+0x8c>
            s++;
    1183:	89 d3                	mov    %edx,%ebx
            sign = 1;
    1185:	be 01 00 00 00       	mov    $0x1,%esi
    118a:	eb 8d                	jmp    1119 <toInt+0x19>
      while (*s){
    118c:	31 d2                	xor    %edx,%edx
            ret *= -1;
    118e:	eb c0                	jmp    1150 <toInt+0x50>

00001190 <abs>:
int abs(int x) { return x < 0 ? -x : x; }
    1190:	f3 0f 1e fb          	endbr32 
    1194:	55                   	push   %ebp
    1195:	89 e5                	mov    %esp,%ebp
    1197:	8b 45 08             	mov    0x8(%ebp),%eax
    119a:	5d                   	pop    %ebp
    119b:	99                   	cltd   
    119c:	31 d0                	xor    %edx,%eax
    119e:	29 d0                	sub    %edx,%eax
    11a0:	c3                   	ret    
    11a1:	66 90                	xchg   %ax,%ax
    11a3:	66 90                	xchg   %ax,%ax
    11a5:	66 90                	xchg   %ax,%ax
    11a7:	66 90                	xchg   %ax,%ax
    11a9:	66 90                	xchg   %ax,%ax
    11ab:	66 90                	xchg   %ax,%ax
    11ad:	66 90                	xchg   %ax,%ax
    11af:	90                   	nop

000011b0 <strcpy>:
};


char*
strcpy(char *s, const char *t)
{
    11b0:	f3 0f 1e fb          	endbr32 
    11b4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    11b5:	31 c0                	xor    %eax,%eax
{
    11b7:	89 e5                	mov    %esp,%ebp
    11b9:	53                   	push   %ebx
    11ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11bd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    11c0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    11c4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    11c7:	83 c0 01             	add    $0x1,%eax
    11ca:	84 d2                	test   %dl,%dl
    11cc:	75 f2                	jne    11c0 <strcpy+0x10>
    ;
  return os;
}
    11ce:	89 c8                	mov    %ecx,%eax
    11d0:	5b                   	pop    %ebx
    11d1:	5d                   	pop    %ebp
    11d2:	c3                   	ret    
    11d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000011e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    11e0:	f3 0f 1e fb          	endbr32 
    11e4:	55                   	push   %ebp
    11e5:	89 e5                	mov    %esp,%ebp
    11e7:	53                   	push   %ebx
    11e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11eb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    11ee:	0f b6 01             	movzbl (%ecx),%eax
    11f1:	0f b6 1a             	movzbl (%edx),%ebx
    11f4:	84 c0                	test   %al,%al
    11f6:	75 19                	jne    1211 <strcmp+0x31>
    11f8:	eb 26                	jmp    1220 <strcmp+0x40>
    11fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1200:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    1204:	83 c1 01             	add    $0x1,%ecx
    1207:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    120a:	0f b6 1a             	movzbl (%edx),%ebx
    120d:	84 c0                	test   %al,%al
    120f:	74 0f                	je     1220 <strcmp+0x40>
    1211:	38 d8                	cmp    %bl,%al
    1213:	74 eb                	je     1200 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1215:	29 d8                	sub    %ebx,%eax
}
    1217:	5b                   	pop    %ebx
    1218:	5d                   	pop    %ebp
    1219:	c3                   	ret    
    121a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1220:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1222:	29 d8                	sub    %ebx,%eax
}
    1224:	5b                   	pop    %ebx
    1225:	5d                   	pop    %ebp
    1226:	c3                   	ret    
    1227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    122e:	66 90                	xchg   %ax,%ax

00001230 <strlen>:

uint
strlen(const char *s)
{
    1230:	f3 0f 1e fb          	endbr32 
    1234:	55                   	push   %ebp
    1235:	89 e5                	mov    %esp,%ebp
    1237:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    123a:	80 3a 00             	cmpb   $0x0,(%edx)
    123d:	74 21                	je     1260 <strlen+0x30>
    123f:	31 c0                	xor    %eax,%eax
    1241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1248:	83 c0 01             	add    $0x1,%eax
    124b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    124f:	89 c1                	mov    %eax,%ecx
    1251:	75 f5                	jne    1248 <strlen+0x18>
    ;
  return n;
}
    1253:	89 c8                	mov    %ecx,%eax
    1255:	5d                   	pop    %ebp
    1256:	c3                   	ret    
    1257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    125e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    1260:	31 c9                	xor    %ecx,%ecx
}
    1262:	5d                   	pop    %ebp
    1263:	89 c8                	mov    %ecx,%eax
    1265:	c3                   	ret    
    1266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    126d:	8d 76 00             	lea    0x0(%esi),%esi

00001270 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1270:	f3 0f 1e fb          	endbr32 
    1274:	55                   	push   %ebp
    1275:	89 e5                	mov    %esp,%ebp
    1277:	57                   	push   %edi
    1278:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    127b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    127e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1281:	89 d7                	mov    %edx,%edi
    1283:	fc                   	cld    
    1284:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1286:	89 d0                	mov    %edx,%eax
    1288:	5f                   	pop    %edi
    1289:	5d                   	pop    %ebp
    128a:	c3                   	ret    
    128b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    128f:	90                   	nop

00001290 <strchr>:

char*
strchr(const char *s, char c)
{
    1290:	f3 0f 1e fb          	endbr32 
    1294:	55                   	push   %ebp
    1295:	89 e5                	mov    %esp,%ebp
    1297:	8b 45 08             	mov    0x8(%ebp),%eax
    129a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    129e:	0f b6 10             	movzbl (%eax),%edx
    12a1:	84 d2                	test   %dl,%dl
    12a3:	75 16                	jne    12bb <strchr+0x2b>
    12a5:	eb 21                	jmp    12c8 <strchr+0x38>
    12a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ae:	66 90                	xchg   %ax,%ax
    12b0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    12b4:	83 c0 01             	add    $0x1,%eax
    12b7:	84 d2                	test   %dl,%dl
    12b9:	74 0d                	je     12c8 <strchr+0x38>
    if(*s == c)
    12bb:	38 d1                	cmp    %dl,%cl
    12bd:	75 f1                	jne    12b0 <strchr+0x20>
      return (char*)s;
  return 0;
}
    12bf:	5d                   	pop    %ebp
    12c0:	c3                   	ret    
    12c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    12c8:	31 c0                	xor    %eax,%eax
}
    12ca:	5d                   	pop    %ebp
    12cb:	c3                   	ret    
    12cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012d0 <gets>:

char*
gets(char *buf, int max)
{
    12d0:	f3 0f 1e fb          	endbr32 
    12d4:	55                   	push   %ebp
    12d5:	89 e5                	mov    %esp,%ebp
    12d7:	57                   	push   %edi
    12d8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12d9:	31 f6                	xor    %esi,%esi
{
    12db:	53                   	push   %ebx
    12dc:	89 f3                	mov    %esi,%ebx
    12de:	83 ec 1c             	sub    $0x1c,%esp
    12e1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    12e4:	eb 33                	jmp    1319 <gets+0x49>
    12e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ed:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    12f0:	83 ec 04             	sub    $0x4,%esp
    12f3:	8d 45 e7             	lea    -0x19(%ebp),%eax
    12f6:	6a 01                	push   $0x1
    12f8:	50                   	push   %eax
    12f9:	6a 00                	push   $0x0
    12fb:	e8 75 03 00 00       	call   1675 <read>
    if(cc < 1)
    1300:	83 c4 10             	add    $0x10,%esp
    1303:	85 c0                	test   %eax,%eax
    1305:	7e 1c                	jle    1323 <gets+0x53>
      break;
    buf[i++] = c;
    1307:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    130b:	83 c7 01             	add    $0x1,%edi
    130e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1311:	3c 0a                	cmp    $0xa,%al
    1313:	74 23                	je     1338 <gets+0x68>
    1315:	3c 0d                	cmp    $0xd,%al
    1317:	74 1f                	je     1338 <gets+0x68>
  for(i=0; i+1 < max; ){
    1319:	83 c3 01             	add    $0x1,%ebx
    131c:	89 fe                	mov    %edi,%esi
    131e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1321:	7c cd                	jl     12f0 <gets+0x20>
    1323:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1325:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1328:	c6 03 00             	movb   $0x0,(%ebx)
}
    132b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    132e:	5b                   	pop    %ebx
    132f:	5e                   	pop    %esi
    1330:	5f                   	pop    %edi
    1331:	5d                   	pop    %ebp
    1332:	c3                   	ret    
    1333:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1337:	90                   	nop
    1338:	8b 75 08             	mov    0x8(%ebp),%esi
    133b:	8b 45 08             	mov    0x8(%ebp),%eax
    133e:	01 de                	add    %ebx,%esi
    1340:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1342:	c6 03 00             	movb   $0x0,(%ebx)
}
    1345:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1348:	5b                   	pop    %ebx
    1349:	5e                   	pop    %esi
    134a:	5f                   	pop    %edi
    134b:	5d                   	pop    %ebp
    134c:	c3                   	ret    
    134d:	8d 76 00             	lea    0x0(%esi),%esi

00001350 <stat>:

int
stat(const char *n, struct stat *st)
{
    1350:	f3 0f 1e fb          	endbr32 
    1354:	55                   	push   %ebp
    1355:	89 e5                	mov    %esp,%ebp
    1357:	56                   	push   %esi
    1358:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1359:	83 ec 08             	sub    $0x8,%esp
    135c:	6a 00                	push   $0x0
    135e:	ff 75 08             	pushl  0x8(%ebp)
    1361:	e8 37 03 00 00       	call   169d <open>
  if(fd < 0)
    1366:	83 c4 10             	add    $0x10,%esp
    1369:	85 c0                	test   %eax,%eax
    136b:	78 2b                	js     1398 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    136d:	83 ec 08             	sub    $0x8,%esp
    1370:	ff 75 0c             	pushl  0xc(%ebp)
    1373:	89 c3                	mov    %eax,%ebx
    1375:	50                   	push   %eax
    1376:	e8 3a 03 00 00       	call   16b5 <fstat>
  close(fd);
    137b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    137e:	89 c6                	mov    %eax,%esi
  close(fd);
    1380:	e8 00 03 00 00       	call   1685 <close>
  return r;
    1385:	83 c4 10             	add    $0x10,%esp
}
    1388:	8d 65 f8             	lea    -0x8(%ebp),%esp
    138b:	89 f0                	mov    %esi,%eax
    138d:	5b                   	pop    %ebx
    138e:	5e                   	pop    %esi
    138f:	5d                   	pop    %ebp
    1390:	c3                   	ret    
    1391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1398:	be ff ff ff ff       	mov    $0xffffffff,%esi
    139d:	eb e9                	jmp    1388 <stat+0x38>
    139f:	90                   	nop

000013a0 <atoi>:

int
atoi(const char *s)
{
    13a0:	f3 0f 1e fb          	endbr32 
    13a4:	55                   	push   %ebp
    13a5:	89 e5                	mov    %esp,%ebp
    13a7:	53                   	push   %ebx
    13a8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    13ab:	0f be 02             	movsbl (%edx),%eax
    13ae:	8d 48 d0             	lea    -0x30(%eax),%ecx
    13b1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    13b4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    13b9:	77 1a                	ja     13d5 <atoi+0x35>
    13bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13bf:	90                   	nop
    n = n*10 + *s++ - '0';
    13c0:	83 c2 01             	add    $0x1,%edx
    13c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    13c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    13ca:	0f be 02             	movsbl (%edx),%eax
    13cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
    13d0:	80 fb 09             	cmp    $0x9,%bl
    13d3:	76 eb                	jbe    13c0 <atoi+0x20>
  return n;
}
    13d5:	89 c8                	mov    %ecx,%eax
    13d7:	5b                   	pop    %ebx
    13d8:	5d                   	pop    %ebp
    13d9:	c3                   	ret    
    13da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000013e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    13e0:	f3 0f 1e fb          	endbr32 
    13e4:	55                   	push   %ebp
    13e5:	89 e5                	mov    %esp,%ebp
    13e7:	57                   	push   %edi
    13e8:	8b 45 10             	mov    0x10(%ebp),%eax
    13eb:	8b 55 08             	mov    0x8(%ebp),%edx
    13ee:	56                   	push   %esi
    13ef:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    13f2:	85 c0                	test   %eax,%eax
    13f4:	7e 0f                	jle    1405 <memmove+0x25>
    13f6:	01 d0                	add    %edx,%eax
  dst = vdst;
    13f8:	89 d7                	mov    %edx,%edi
    13fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1400:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1401:	39 f8                	cmp    %edi,%eax
    1403:	75 fb                	jne    1400 <memmove+0x20>
  return vdst;
}
    1405:	5e                   	pop    %esi
    1406:	89 d0                	mov    %edx,%eax
    1408:	5f                   	pop    %edi
    1409:	5d                   	pop    %ebp
    140a:	c3                   	ret    
    140b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    140f:	90                   	nop

00001410 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
    1410:	f3 0f 1e fb          	endbr32 
    1414:	55                   	push   %ebp
    1415:	89 e5                	mov    %esp,%ebp
    1417:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
    141a:	8d 45 f4             	lea    -0xc(%ebp),%eax
    141d:	50                   	push   %eax
    141e:	e8 0a 03 00 00       	call   172d <join>
  
  return x;
}
    1423:	c9                   	leave  
    1424:	c3                   	ret    
    1425:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    142c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001430 <lock_init>:

void lock_init(struct lock_t *lk){
    1430:	f3 0f 1e fb          	endbr32 
    1434:	55                   	push   %ebp
    1435:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
    1437:	8b 45 08             	mov    0x8(%ebp),%eax
    143a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1440:	5d                   	pop    %ebp
    1441:	c3                   	ret    
    1442:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001450 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
    1450:	f3 0f 1e fb          	endbr32 
    1454:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1455:	b9 01 00 00 00       	mov    $0x1,%ecx
    145a:	89 e5                	mov    %esp,%ebp
    145c:	8b 55 08             	mov    0x8(%ebp),%edx
    145f:	90                   	nop
    1460:	89 c8                	mov    %ecx,%eax
    1462:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
    1465:	85 c0                	test   %eax,%eax
    1467:	75 f7                	jne    1460 <lock_acquire+0x10>
}
    1469:	5d                   	pop    %ebp
    146a:	c3                   	ret    
    146b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    146f:	90                   	nop

00001470 <lock_release>:
void lock_release(struct lock_t *lk){
    1470:	f3 0f 1e fb          	endbr32 
    1474:	55                   	push   %ebp
    1475:	31 c0                	xor    %eax,%eax
    1477:	89 e5                	mov    %esp,%ebp
    1479:	8b 55 08             	mov    0x8(%ebp),%edx
    147c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
    147f:	5d                   	pop    %ebp
    1480:	c3                   	ret    
    1481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1488:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    148f:	90                   	nop

00001490 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1490:	f3 0f 1e fb          	endbr32 
    1494:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1495:	a1 60 1e 00 00       	mov    0x1e60,%eax
{
    149a:	89 e5                	mov    %esp,%ebp
    149c:	57                   	push   %edi
    149d:	56                   	push   %esi
    149e:	53                   	push   %ebx
    149f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    14a2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    14a4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14a7:	39 c8                	cmp    %ecx,%eax
    14a9:	73 15                	jae    14c0 <free+0x30>
    14ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14af:	90                   	nop
    14b0:	39 d1                	cmp    %edx,%ecx
    14b2:	72 14                	jb     14c8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    14b4:	39 d0                	cmp    %edx,%eax
    14b6:	73 10                	jae    14c8 <free+0x38>
{
    14b8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14ba:	8b 10                	mov    (%eax),%edx
    14bc:	39 c8                	cmp    %ecx,%eax
    14be:	72 f0                	jb     14b0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    14c0:	39 d0                	cmp    %edx,%eax
    14c2:	72 f4                	jb     14b8 <free+0x28>
    14c4:	39 d1                	cmp    %edx,%ecx
    14c6:	73 f0                	jae    14b8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    14c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    14cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    14ce:	39 fa                	cmp    %edi,%edx
    14d0:	74 1e                	je     14f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    14d2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    14d5:	8b 50 04             	mov    0x4(%eax),%edx
    14d8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    14db:	39 f1                	cmp    %esi,%ecx
    14dd:	74 28                	je     1507 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    14df:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    14e1:	5b                   	pop    %ebx
  freep = p;
    14e2:	a3 60 1e 00 00       	mov    %eax,0x1e60
}
    14e7:	5e                   	pop    %esi
    14e8:	5f                   	pop    %edi
    14e9:	5d                   	pop    %ebp
    14ea:	c3                   	ret    
    14eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14ef:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    14f0:	03 72 04             	add    0x4(%edx),%esi
    14f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    14f6:	8b 10                	mov    (%eax),%edx
    14f8:	8b 12                	mov    (%edx),%edx
    14fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    14fd:	8b 50 04             	mov    0x4(%eax),%edx
    1500:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1503:	39 f1                	cmp    %esi,%ecx
    1505:	75 d8                	jne    14df <free+0x4f>
    p->s.size += bp->s.size;
    1507:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    150a:	a3 60 1e 00 00       	mov    %eax,0x1e60
    p->s.size += bp->s.size;
    150f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1512:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1515:	89 10                	mov    %edx,(%eax)
}
    1517:	5b                   	pop    %ebx
    1518:	5e                   	pop    %esi
    1519:	5f                   	pop    %edi
    151a:	5d                   	pop    %ebp
    151b:	c3                   	ret    
    151c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001520 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1520:	f3 0f 1e fb          	endbr32 
    1524:	55                   	push   %ebp
    1525:	89 e5                	mov    %esp,%ebp
    1527:	57                   	push   %edi
    1528:	56                   	push   %esi
    1529:	53                   	push   %ebx
    152a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    152d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1530:	8b 3d 60 1e 00 00    	mov    0x1e60,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1536:	8d 70 07             	lea    0x7(%eax),%esi
    1539:	c1 ee 03             	shr    $0x3,%esi
    153c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    153f:	85 ff                	test   %edi,%edi
    1541:	0f 84 a9 00 00 00    	je     15f0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1547:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1549:	8b 48 04             	mov    0x4(%eax),%ecx
    154c:	39 f1                	cmp    %esi,%ecx
    154e:	73 6d                	jae    15bd <malloc+0x9d>
    1550:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1556:	bb 00 10 00 00       	mov    $0x1000,%ebx
    155b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    155e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1565:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1568:	eb 17                	jmp    1581 <malloc+0x61>
    156a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1570:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1572:	8b 4a 04             	mov    0x4(%edx),%ecx
    1575:	39 f1                	cmp    %esi,%ecx
    1577:	73 4f                	jae    15c8 <malloc+0xa8>
    1579:	8b 3d 60 1e 00 00    	mov    0x1e60,%edi
    157f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1581:	39 c7                	cmp    %eax,%edi
    1583:	75 eb                	jne    1570 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1585:	83 ec 0c             	sub    $0xc,%esp
    1588:	ff 75 e4             	pushl  -0x1c(%ebp)
    158b:	e8 55 01 00 00       	call   16e5 <sbrk>
  if(p == (char*)-1)
    1590:	83 c4 10             	add    $0x10,%esp
    1593:	83 f8 ff             	cmp    $0xffffffff,%eax
    1596:	74 1b                	je     15b3 <malloc+0x93>
  hp->s.size = nu;
    1598:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    159b:	83 ec 0c             	sub    $0xc,%esp
    159e:	83 c0 08             	add    $0x8,%eax
    15a1:	50                   	push   %eax
    15a2:	e8 e9 fe ff ff       	call   1490 <free>
  return freep;
    15a7:	a1 60 1e 00 00       	mov    0x1e60,%eax
      if((p = morecore(nunits)) == 0)
    15ac:	83 c4 10             	add    $0x10,%esp
    15af:	85 c0                	test   %eax,%eax
    15b1:	75 bd                	jne    1570 <malloc+0x50>
        return 0;
  }
}
    15b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    15b6:	31 c0                	xor    %eax,%eax
}
    15b8:	5b                   	pop    %ebx
    15b9:	5e                   	pop    %esi
    15ba:	5f                   	pop    %edi
    15bb:	5d                   	pop    %ebp
    15bc:	c3                   	ret    
    if(p->s.size >= nunits){
    15bd:	89 c2                	mov    %eax,%edx
    15bf:	89 f8                	mov    %edi,%eax
    15c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    15c8:	39 ce                	cmp    %ecx,%esi
    15ca:	74 54                	je     1620 <malloc+0x100>
        p->s.size -= nunits;
    15cc:	29 f1                	sub    %esi,%ecx
    15ce:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    15d1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    15d4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    15d7:	a3 60 1e 00 00       	mov    %eax,0x1e60
}
    15dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    15df:	8d 42 08             	lea    0x8(%edx),%eax
}
    15e2:	5b                   	pop    %ebx
    15e3:	5e                   	pop    %esi
    15e4:	5f                   	pop    %edi
    15e5:	5d                   	pop    %ebp
    15e6:	c3                   	ret    
    15e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15ee:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    15f0:	c7 05 60 1e 00 00 64 	movl   $0x1e64,0x1e60
    15f7:	1e 00 00 
    base.s.size = 0;
    15fa:	bf 64 1e 00 00       	mov    $0x1e64,%edi
    base.s.ptr = freep = prevp = &base;
    15ff:	c7 05 64 1e 00 00 64 	movl   $0x1e64,0x1e64
    1606:	1e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1609:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    160b:	c7 05 68 1e 00 00 00 	movl   $0x0,0x1e68
    1612:	00 00 00 
    if(p->s.size >= nunits){
    1615:	e9 36 ff ff ff       	jmp    1550 <malloc+0x30>
    161a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1620:	8b 0a                	mov    (%edx),%ecx
    1622:	89 08                	mov    %ecx,(%eax)
    1624:	eb b1                	jmp    15d7 <malloc+0xb7>
    1626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    162d:	8d 76 00             	lea    0x0(%esi),%esi

00001630 <thread_create>:
{
    1630:	f3 0f 1e fb          	endbr32 
    1634:	55                   	push   %ebp
    1635:	89 e5                	mov    %esp,%ebp
    1637:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
    163a:	68 00 10 00 00       	push   $0x1000
    163f:	e8 dc fe ff ff       	call   1520 <malloc>
return clone(start_routine,arg1,arg2,stack);
    1644:	50                   	push   %eax
    1645:	ff 75 10             	pushl  0x10(%ebp)
    1648:	ff 75 0c             	pushl  0xc(%ebp)
    164b:	ff 75 08             	pushl  0x8(%ebp)
    164e:	e8 d2 00 00 00       	call   1725 <clone>
}
    1653:	c9                   	leave  
    1654:	c3                   	ret    

00001655 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1655:	b8 01 00 00 00       	mov    $0x1,%eax
    165a:	cd 40                	int    $0x40
    165c:	c3                   	ret    

0000165d <exit>:
SYSCALL(exit)
    165d:	b8 02 00 00 00       	mov    $0x2,%eax
    1662:	cd 40                	int    $0x40
    1664:	c3                   	ret    

00001665 <wait>:
SYSCALL(wait)
    1665:	b8 03 00 00 00       	mov    $0x3,%eax
    166a:	cd 40                	int    $0x40
    166c:	c3                   	ret    

0000166d <pipe>:
SYSCALL(pipe)
    166d:	b8 04 00 00 00       	mov    $0x4,%eax
    1672:	cd 40                	int    $0x40
    1674:	c3                   	ret    

00001675 <read>:
SYSCALL(read)
    1675:	b8 05 00 00 00       	mov    $0x5,%eax
    167a:	cd 40                	int    $0x40
    167c:	c3                   	ret    

0000167d <write>:
SYSCALL(write)
    167d:	b8 10 00 00 00       	mov    $0x10,%eax
    1682:	cd 40                	int    $0x40
    1684:	c3                   	ret    

00001685 <close>:
SYSCALL(close)
    1685:	b8 15 00 00 00       	mov    $0x15,%eax
    168a:	cd 40                	int    $0x40
    168c:	c3                   	ret    

0000168d <kill>:
SYSCALL(kill)
    168d:	b8 06 00 00 00       	mov    $0x6,%eax
    1692:	cd 40                	int    $0x40
    1694:	c3                   	ret    

00001695 <exec>:
SYSCALL(exec)
    1695:	b8 07 00 00 00       	mov    $0x7,%eax
    169a:	cd 40                	int    $0x40
    169c:	c3                   	ret    

0000169d <open>:
SYSCALL(open)
    169d:	b8 0f 00 00 00       	mov    $0xf,%eax
    16a2:	cd 40                	int    $0x40
    16a4:	c3                   	ret    

000016a5 <mknod>:
SYSCALL(mknod)
    16a5:	b8 11 00 00 00       	mov    $0x11,%eax
    16aa:	cd 40                	int    $0x40
    16ac:	c3                   	ret    

000016ad <unlink>:
SYSCALL(unlink)
    16ad:	b8 12 00 00 00       	mov    $0x12,%eax
    16b2:	cd 40                	int    $0x40
    16b4:	c3                   	ret    

000016b5 <fstat>:
SYSCALL(fstat)
    16b5:	b8 08 00 00 00       	mov    $0x8,%eax
    16ba:	cd 40                	int    $0x40
    16bc:	c3                   	ret    

000016bd <link>:
SYSCALL(link)
    16bd:	b8 13 00 00 00       	mov    $0x13,%eax
    16c2:	cd 40                	int    $0x40
    16c4:	c3                   	ret    

000016c5 <mkdir>:
SYSCALL(mkdir)
    16c5:	b8 14 00 00 00       	mov    $0x14,%eax
    16ca:	cd 40                	int    $0x40
    16cc:	c3                   	ret    

000016cd <chdir>:
SYSCALL(chdir)
    16cd:	b8 09 00 00 00       	mov    $0x9,%eax
    16d2:	cd 40                	int    $0x40
    16d4:	c3                   	ret    

000016d5 <dup>:
SYSCALL(dup)
    16d5:	b8 0a 00 00 00       	mov    $0xa,%eax
    16da:	cd 40                	int    $0x40
    16dc:	c3                   	ret    

000016dd <getpid>:
SYSCALL(getpid)
    16dd:	b8 0b 00 00 00       	mov    $0xb,%eax
    16e2:	cd 40                	int    $0x40
    16e4:	c3                   	ret    

000016e5 <sbrk>:
SYSCALL(sbrk)
    16e5:	b8 0c 00 00 00       	mov    $0xc,%eax
    16ea:	cd 40                	int    $0x40
    16ec:	c3                   	ret    

000016ed <sleep>:
SYSCALL(sleep)
    16ed:	b8 0d 00 00 00       	mov    $0xd,%eax
    16f2:	cd 40                	int    $0x40
    16f4:	c3                   	ret    

000016f5 <uptime>:
SYSCALL(uptime)
    16f5:	b8 0e 00 00 00       	mov    $0xe,%eax
    16fa:	cd 40                	int    $0x40
    16fc:	c3                   	ret    

000016fd <count>:
SYSCALL(count)
    16fd:	b8 16 00 00 00       	mov    $0x16,%eax
    1702:	cd 40                	int    $0x40
    1704:	c3                   	ret    

00001705 <settickets>:

SYSCALL(settickets)
    1705:	b8 17 00 00 00       	mov    $0x17,%eax
    170a:	cd 40                	int    $0x40
    170c:	c3                   	ret    

0000170d <getpinfo>:
SYSCALL(getpinfo)
    170d:	b8 18 00 00 00       	mov    $0x18,%eax
    1712:	cd 40                	int    $0x40
    1714:	c3                   	ret    

00001715 <mprotect>:

SYSCALL(mprotect)
    1715:	b8 19 00 00 00       	mov    $0x19,%eax
    171a:	cd 40                	int    $0x40
    171c:	c3                   	ret    

0000171d <munprotect>:
SYSCALL(munprotect)
    171d:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1722:	cd 40                	int    $0x40
    1724:	c3                   	ret    

00001725 <clone>:

SYSCALL(clone)
    1725:	b8 1b 00 00 00       	mov    $0x1b,%eax
    172a:	cd 40                	int    $0x40
    172c:	c3                   	ret    

0000172d <join>:
SYSCALL(join)
    172d:	b8 1c 00 00 00       	mov    $0x1c,%eax
    1732:	cd 40                	int    $0x40
    1734:	c3                   	ret    
    1735:	66 90                	xchg   %ax,%ax
    1737:	66 90                	xchg   %ax,%ax
    1739:	66 90                	xchg   %ax,%ax
    173b:	66 90                	xchg   %ax,%ax
    173d:	66 90                	xchg   %ax,%ax
    173f:	90                   	nop

00001740 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1740:	55                   	push   %ebp
    1741:	89 e5                	mov    %esp,%ebp
    1743:	57                   	push   %edi
    1744:	56                   	push   %esi
    1745:	53                   	push   %ebx
    1746:	83 ec 3c             	sub    $0x3c,%esp
    1749:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    174c:	89 d1                	mov    %edx,%ecx
{
    174e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1751:	85 d2                	test   %edx,%edx
    1753:	0f 89 7f 00 00 00    	jns    17d8 <printint+0x98>
    1759:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    175d:	74 79                	je     17d8 <printint+0x98>
    neg = 1;
    175f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1766:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1768:	31 db                	xor    %ebx,%ebx
    176a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    176d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1770:	89 c8                	mov    %ecx,%eax
    1772:	31 d2                	xor    %edx,%edx
    1774:	89 cf                	mov    %ecx,%edi
    1776:	f7 75 c4             	divl   -0x3c(%ebp)
    1779:	0f b6 92 b4 1a 00 00 	movzbl 0x1ab4(%edx),%edx
    1780:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1783:	89 d8                	mov    %ebx,%eax
    1785:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1788:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    178b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    178e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1791:	76 dd                	jbe    1770 <printint+0x30>
  if(neg)
    1793:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1796:	85 c9                	test   %ecx,%ecx
    1798:	74 0c                	je     17a6 <printint+0x66>
    buf[i++] = '-';
    179a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    179f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    17a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    17a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    17a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    17ad:	eb 07                	jmp    17b6 <printint+0x76>
    17af:	90                   	nop
    17b0:	0f b6 13             	movzbl (%ebx),%edx
    17b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    17b6:	83 ec 04             	sub    $0x4,%esp
    17b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    17bc:	6a 01                	push   $0x1
    17be:	56                   	push   %esi
    17bf:	57                   	push   %edi
    17c0:	e8 b8 fe ff ff       	call   167d <write>
  while(--i >= 0)
    17c5:	83 c4 10             	add    $0x10,%esp
    17c8:	39 de                	cmp    %ebx,%esi
    17ca:	75 e4                	jne    17b0 <printint+0x70>
    putc(fd, buf[i]);
}
    17cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17cf:	5b                   	pop    %ebx
    17d0:	5e                   	pop    %esi
    17d1:	5f                   	pop    %edi
    17d2:	5d                   	pop    %ebp
    17d3:	c3                   	ret    
    17d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    17d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    17df:	eb 87                	jmp    1768 <printint+0x28>
    17e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17ef:	90                   	nop

000017f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    17f0:	f3 0f 1e fb          	endbr32 
    17f4:	55                   	push   %ebp
    17f5:	89 e5                	mov    %esp,%ebp
    17f7:	57                   	push   %edi
    17f8:	56                   	push   %esi
    17f9:	53                   	push   %ebx
    17fa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    17fd:	8b 75 0c             	mov    0xc(%ebp),%esi
    1800:	0f b6 1e             	movzbl (%esi),%ebx
    1803:	84 db                	test   %bl,%bl
    1805:	0f 84 b4 00 00 00    	je     18bf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    180b:	8d 45 10             	lea    0x10(%ebp),%eax
    180e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1811:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1814:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1816:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1819:	eb 33                	jmp    184e <printf+0x5e>
    181b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    181f:	90                   	nop
    1820:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1823:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1828:	83 f8 25             	cmp    $0x25,%eax
    182b:	74 17                	je     1844 <printf+0x54>
  write(fd, &c, 1);
    182d:	83 ec 04             	sub    $0x4,%esp
    1830:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1833:	6a 01                	push   $0x1
    1835:	57                   	push   %edi
    1836:	ff 75 08             	pushl  0x8(%ebp)
    1839:	e8 3f fe ff ff       	call   167d <write>
    183e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1841:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1844:	0f b6 1e             	movzbl (%esi),%ebx
    1847:	83 c6 01             	add    $0x1,%esi
    184a:	84 db                	test   %bl,%bl
    184c:	74 71                	je     18bf <printf+0xcf>
    c = fmt[i] & 0xff;
    184e:	0f be cb             	movsbl %bl,%ecx
    1851:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1854:	85 d2                	test   %edx,%edx
    1856:	74 c8                	je     1820 <printf+0x30>
      }
    } else if(state == '%'){
    1858:	83 fa 25             	cmp    $0x25,%edx
    185b:	75 e7                	jne    1844 <printf+0x54>
      if(c == 'd'){
    185d:	83 f8 64             	cmp    $0x64,%eax
    1860:	0f 84 9a 00 00 00    	je     1900 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1866:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    186c:	83 f9 70             	cmp    $0x70,%ecx
    186f:	74 5f                	je     18d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1871:	83 f8 73             	cmp    $0x73,%eax
    1874:	0f 84 d6 00 00 00    	je     1950 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    187a:	83 f8 63             	cmp    $0x63,%eax
    187d:	0f 84 8d 00 00 00    	je     1910 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1883:	83 f8 25             	cmp    $0x25,%eax
    1886:	0f 84 b4 00 00 00    	je     1940 <printf+0x150>
  write(fd, &c, 1);
    188c:	83 ec 04             	sub    $0x4,%esp
    188f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1893:	6a 01                	push   $0x1
    1895:	57                   	push   %edi
    1896:	ff 75 08             	pushl  0x8(%ebp)
    1899:	e8 df fd ff ff       	call   167d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    189e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    18a1:	83 c4 0c             	add    $0xc,%esp
    18a4:	6a 01                	push   $0x1
    18a6:	83 c6 01             	add    $0x1,%esi
    18a9:	57                   	push   %edi
    18aa:	ff 75 08             	pushl  0x8(%ebp)
    18ad:	e8 cb fd ff ff       	call   167d <write>
  for(i = 0; fmt[i]; i++){
    18b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    18b6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    18b9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    18bb:	84 db                	test   %bl,%bl
    18bd:	75 8f                	jne    184e <printf+0x5e>
    }
  }
}
    18bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    18c2:	5b                   	pop    %ebx
    18c3:	5e                   	pop    %esi
    18c4:	5f                   	pop    %edi
    18c5:	5d                   	pop    %ebp
    18c6:	c3                   	ret    
    18c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    18ce:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    18d0:	83 ec 0c             	sub    $0xc,%esp
    18d3:	b9 10 00 00 00       	mov    $0x10,%ecx
    18d8:	6a 00                	push   $0x0
    18da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    18dd:	8b 45 08             	mov    0x8(%ebp),%eax
    18e0:	8b 13                	mov    (%ebx),%edx
    18e2:	e8 59 fe ff ff       	call   1740 <printint>
        ap++;
    18e7:	89 d8                	mov    %ebx,%eax
    18e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    18ec:	31 d2                	xor    %edx,%edx
        ap++;
    18ee:	83 c0 04             	add    $0x4,%eax
    18f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    18f4:	e9 4b ff ff ff       	jmp    1844 <printf+0x54>
    18f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1900:	83 ec 0c             	sub    $0xc,%esp
    1903:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1908:	6a 01                	push   $0x1
    190a:	eb ce                	jmp    18da <printf+0xea>
    190c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1910:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1913:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1916:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1918:	6a 01                	push   $0x1
        ap++;
    191a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    191d:	57                   	push   %edi
    191e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1921:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1924:	e8 54 fd ff ff       	call   167d <write>
        ap++;
    1929:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    192c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    192f:	31 d2                	xor    %edx,%edx
    1931:	e9 0e ff ff ff       	jmp    1844 <printf+0x54>
    1936:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    193d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1940:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1943:	83 ec 04             	sub    $0x4,%esp
    1946:	e9 59 ff ff ff       	jmp    18a4 <printf+0xb4>
    194b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    194f:	90                   	nop
        s = (char*)*ap;
    1950:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1953:	8b 18                	mov    (%eax),%ebx
        ap++;
    1955:	83 c0 04             	add    $0x4,%eax
    1958:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    195b:	85 db                	test   %ebx,%ebx
    195d:	74 17                	je     1976 <printf+0x186>
        while(*s != 0){
    195f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1962:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1964:	84 c0                	test   %al,%al
    1966:	0f 84 d8 fe ff ff    	je     1844 <printf+0x54>
    196c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    196f:	89 de                	mov    %ebx,%esi
    1971:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1974:	eb 1a                	jmp    1990 <printf+0x1a0>
          s = "(null)";
    1976:	bb aa 1a 00 00       	mov    $0x1aaa,%ebx
        while(*s != 0){
    197b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    197e:	b8 28 00 00 00       	mov    $0x28,%eax
    1983:	89 de                	mov    %ebx,%esi
    1985:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1988:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    198f:	90                   	nop
  write(fd, &c, 1);
    1990:	83 ec 04             	sub    $0x4,%esp
          s++;
    1993:	83 c6 01             	add    $0x1,%esi
    1996:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1999:	6a 01                	push   $0x1
    199b:	57                   	push   %edi
    199c:	53                   	push   %ebx
    199d:	e8 db fc ff ff       	call   167d <write>
        while(*s != 0){
    19a2:	0f b6 06             	movzbl (%esi),%eax
    19a5:	83 c4 10             	add    $0x10,%esp
    19a8:	84 c0                	test   %al,%al
    19aa:	75 e4                	jne    1990 <printf+0x1a0>
    19ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    19af:	31 d2                	xor    %edx,%edx
    19b1:	e9 8e fe ff ff       	jmp    1844 <printf+0x54>
