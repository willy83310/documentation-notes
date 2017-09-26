# Linux相關指令

=======================================================================
## ps相關指令
僅列出與自己相關的bash相關程序
$ ps
  PID TTY          TIME CMD
 9342 pts/2    00:00:00 bash
11937 pts/2    00:00:00 ps

列出詳細資訊
$ ps -l
F S   UID   PID  PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
0 S  1000  9342  7534  0  80   0 - 29176 wait   pts/2    00:00:00 bash
0 R  1000 11944  9342  0  80   0 - 37232 -      pts/2    00:00:00 ps

列出所有系統運作的程序
$ ps aux
（超多～～～）

=======================================================================
## top
$ top -d 10	每隔10秒更新一次(預設5秒更新一次)
內容大致如下（上半部：系統資訊,下半部：Process資訊)
------------------------------------
top - 00:47:02 up  3:01,  4 users,  load average: 0.16, 0.22, 0.29
Tasks: 223 total,   1 running, 222 sleeping,   0 stopped,   0 zombie
%Cpu(s):  1.3 us,  1.5 sy,  0.0 ni, 97.1 id,  0.1 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  3779536 total,   998684 free,   955476 used,  1825376 buff/cache
KiB Swap:  8384508 total,  8384508 free,        0 used.  2370688 avail Mem
  
PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND 
2388 root      20   0  334212  50228  39312 S   2.7  1.3   1:17.29 Xorg 
7534 tony      20   0  749800  33044  16568 S   1.7  0.9   1:12.52 gnome-terminal- 
2541 mongod    20   0 2238880 172288 136248 S   1.0  4.6   1:59.48 mongod
3608 tony      20   0 1994380 174520  42976 S   1.0  4.6   2:21.73 gnome-shell  
------------------------------------
top後,可執行下列互動
h		Help
P		依據CPU使用時間排序
M		依據記憶體使用量排序
T		依據執行時間排序
N		依據PID大小排序
u		只列出該帳號的程序
k		刪除
d		更新秒數
q		離開


=======================================================================
## CentOS7服務相關指令
啟動與關閉<service>
$ systemctl start <service>
$ systemctl stop <service>
$ systemctl restart <service>

重新開機後生效<service>
$ systemctl enable <service>
$ systemctl disable <service>

=======================================================================
## kill 殺程序
$ xkill			點選視窗後,就可以把相關程序殺掉

=======================================================================
## 壓縮/解壓縮(這部份還不確定, 待確認08/13)
  ### zip
	壓縮
	$ zip -er F.zip f1 f2 ... 來替代
	(下一行再輸入密碼)

	解壓縮
	$ unzip -P F.zip

=======================================================================
## find相關
https://blog.gtwang.org/linux/unix-linux-find-command-examples/

$find . -iname xx.txt
在目前dir底下,忽略大小寫找出所有xx.txt

$ find . -type f ! -perm 777
-perm:指定檔案權限

$ find . -perm /u=r
列出唯獨的檔案

$ find . -perm /a=x
列出可執行的檔案

$ find . -type d -name xx
d:目錄
p:具名的pipe(FIFO)
f:一般檔案
l:連結檔
s:socket檔案


=======================================================================