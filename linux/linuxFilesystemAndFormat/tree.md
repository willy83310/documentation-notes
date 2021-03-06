# Linux 目錄配置 與 目錄管理 
- 2018/05/27

## 主要目錄
Linux各大 dictribution都有自己的文件存放位置, 但幾乎都遵照 `Filesystem Hierarchy Standard (FHS)` 的標準在走, FHS 重點在於規範 `每個特定的目錄下應該要放置什麼樣子的資料`, 他只規範了 3 類, 分別是「/」、「/usr」、「/var」

.        | sharable                       | unsharable
-------- | ------------------------------ | ---------------
static   | /usr <br> /opt                 | /etc <br> /boot
variable | /var/mail <br> /var/spool/news | /var/run <br> /var/lock

```sh
/                                     # 與開機系統有關
/bin/                                 # 可執行檔; (os7後, 連結至 /usr/bin/)
/boot/                                # 開機時使用的核心檔案目錄.
     /grub2/                                  # 開機設定檔相關
/dev/                                 # 系統設備目錄
    /hda/                                     # IDE硬碟
    /sd1/                                     # SCSI硬碟
    /cdrom/                                   # 光碟機
    /fd0/                                     # 軟碟機
    /lp0/                                     # 印表機
/etc/                                 # 系統設定檔. ex: inittab, resolv.conf, fstab, rc.d
    /crontab                                  # 排程工作
    /fstab                                    # mount設定檔 (開機時 會依照此設定來作自動掛載; 每次使用 mount時, 預設也會動態更新此檔案)
    /hosts                                    # ip與 dns對照
    /init.d/                                  # CentOS6(含)以前, 所有的服務啟動腳本都在這
    /locale.conf                              # 系統預設語系定義檔 (一開始安裝就決定了!)
    /localtime/                               # 系統時間
    /inittab                                  # (舊有的 xwindow服務, os7以後, 已經被 ooo.target 所取代)
    /issue                                    # 查看進站歡迎訊息(自己看得爽而已)
    /opt/                                     # 第三方協作軟體 /opt/ 的相關設定檔
    /passwd                                   # id 與 使用者帳號(User ID, UID) && 群組(Group ID, GID) 資訊
    /sudoers                                  # 定義特定使用者集群組可作的 sudo權限
    /systemd/                                 # 軟體的啟動腳本
    /sysconfig/network-scripts/                       # CentOS 的網路設定資料放在這~
/home/                                        # 家目錄
/lib/                                 # 系統的共用函式庫檔案 (連結至 /usr/lib/)
/lib64/                               # 
    /modules/                                 # 可抽換式的核心相關模組(驅動程式); 不同版本的核心模組
/media/                               # 移動式磁碟or光碟 掛載目錄 (可移除的裝置)
/mnt/                                 # "暫時性" 檔案系統 掛載目錄; 現在許多裝置都移到 /media/ 了, 所以暫時的, 依舊放這
/opt/                                 # 非 Linux預設安裝的外來軟體 (第三方協作軟體)
/proc/                                # 虛擬檔案系統(virtual filesystem), 東西都存在於 memory, 不占用 disk; 行程資訊目錄
/run/                                 # 系統開機後所產生的各項資訊 (可用記憶體來模擬); 某些服務or程式啟動後, 他們的 pid 會放在這 ; 系統關機 or 重啟後, 東西就會不見
    /lock/                                    # 某些裝置或檔案, 一次只能一人使用, 使用中會上鎖.
/sbin/                                # 系統管理員 用的 工具or指令or執行檔; (連結至 /usr/sbin/)
/srv/                                 # 網路服務的一些東西 (如果不打算提供給外部網路存取的話, 建議放在 /var/lib/ )
/sys/                                 # 虛擬檔案系統(virtual filesystem), 東西都存在於 memory, 不占用 disk; 紀錄核心與系統硬體資訊
/tmp/                                 # 重開機後會清除
/usr/                                 # (unix software resource) Linux系統安裝過程中必要的 packages (軟體安裝/執行相關); 系統剛裝完, 這裡最占空間 ; Windows 的「program files」 啦
    /bin/                                     # 一般使用者 用的 工具or指令or執行檔; 
    /games/                                   # 與遊戲相關
    /include/                                 # c++ 的 header 與 include 放置處; 使用 tarball 方式安裝軟體時, 會用到裡面超多東西
    /lib/                                     # 系統的共用函式庫檔案
        /locale/                                      # 存放語系檔
    /libexec/                                 # 大部分的 X window 的操作指令都放這. (不被使用這慣用的執行檔or腳本)
    /local/                                   # sys admin 在本機自行安裝的軟體, 建議放這邊
          /sbin/                                      # 本機自行安裝的軟體所產生的系統執行檔(system binary), ex: fdisk, fsck, ifconfig, mkfs 等
    /sbin/                                    # 系統專用的 工具/指令/執行檔, ex: 某些伺服器軟體程式的東西
    /share/                                   # 唯讀架構的資料檔案; 共享文件; 幾乎都是文字檔
          /doc                                        # 系統文件 (安裝軟體時, 會一起安裝的說明文件) && 獨立說明文件
          /man                                        # 線上操作手冊
          /zoneinfo                                   # 時區檔案
    /src/                                     # 一般原始碼 建議放這.
    /src/linux/                                       # 核心原始碼 建議放這
/var/                                 # 登錄檔, 程序檔案, MySQL資料庫檔案, Cache, 印表機, ... (與系統運作過程有關); 系統開始運作後, 這會慢慢變大;
    /cache/                                   # 系統運作過程的快取
    /log/                                     # 登入檔放置的目錄. 比較重要的有: /var/log/messages, /var/log/wtmp (紀錄登入者資訊)
        /dmesg                                        # 開機時偵測硬體與啟動服務的紀錄
        /messages                                     # 開機紀錄
        /secure                                       # 安全紀錄
    /lib/                                     # 程式運作過程所需用到的 資料檔案 放置的目錄. ex: MySQL DB 放在 /var/lib/mysql/; rpm DB 放在 /var/lib/rpm/
        /mysql/                                       # mysql資料庫的資料儲存位置
    /mail/                                    # 個人電子郵件信箱的目錄. 這目錄也被放置到 /var/spool/mail/, 與之互為連結
    /lock/                                    # 某些裝置或檔案, 一次只能一人使用, 使用中會上鎖. (連結至 /run/lock/)
    /run/                                     # 早期 系統開機後所產生的各項資訊. (連結至 /run/)
    /spool/                                   # 通常用來放 佇列(排隊等待其他程式來使用)資料(理解成 快取目錄). ex: 系統收到新信, 會放到 /var/spool/mail/ , 但使用者收下信件後, 會從此刪除
          /cron/                                      # 工作排成資料
          /mail/                                      # 系通收到新信, 會放到這; 等待寄出的 email
          /mqueue/                                    # 信件寄不出去, 會塞到這
          /news/                                      # 新聞群組
```

