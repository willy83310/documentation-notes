# CentOS7

安裝的 iso說明: 自從 CentOS7開始, `版本命名依據` 就跟 `發表日` 有關
    「CentOS-7-x86_64-Everything-1503-01.iso」
    CentOS-7 表示 7.x版
    x86_64 為 64位原
    Everything 為 包山包海的版本
    1503 表示此版本在 2015/03 發表
    01.iso 為 CentOS7.1版


## 我的電腦環境如下
```sh
$ uname -a
Linux tonynb 3.10.0-514.el7.x86_64 #1 SMP Tue Nov 22 16:42:41 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux

$ hostnamectl
   Static hostname: tonynb
         Icon name: computer-laptop
           Chassis: laptop
        Machine ID: 6e935c5d22124158bd0a6ebf9e086b24
           Boot ID: 3262e51d23a9478dbc268f562556a74c
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-514.el7.x86_64
      Architecture: x86-64

$ cat /etc/centos-release
CentOS Linux release 7.3.1611 (Core)

$ rpm --query centos-release
centos-release-7-3.1611.el7.centos.x86_64
```


## 不負責任地說一下這裡頭的東西
File Name            | Description
-------------------- | ------------------------------------------
installCentOS7.md    | 安裝一大堆有的沒的的說明
linux.md             | Linux`指令`及`概念`
hadoopNote.md        | Hadoop (新手誤入) (還沒認真開始寫)
vim.md               | 神之編輯器~~
iCentOS7.sh          | 因為很常重灌... 所以把安裝指令寫成腳本
bird.md              | 沒啥用...
other/installCentOS6 | 好久以前寫的...
other/ubuntu16.04.md | 好久以前寫的...
(陸續維護中...)



## 習慣
程式碼區塊, `$#` 表示, 是使用 `root` 在作指令操作


## 一堆專有名詞

Berkeley Software Distribution(BSD)

Network File System (NFS)