# Docker on Windows 10
- 2018/05/11
- 18.03.1-ce
- [相關解法 - 找這個回覆 kleskowy commented on 17 Nov 2017](https://github.com/docker/for-win/issues/324)
- [安裝 Docker for Windows 10](https://docs.docker.com/docker-for-windows/install/)

> 5/11, 不知道為什麼你他媽的一直灌不起來, 錯誤訊息也看不懂, 所以先記錄下來

```
Unable to create: 執行中的命令已停止，因為喜好設定變數 "ErrorActionPreference" 或一般參數設定為 Stop: Hyper-V 找不到名為 "DockerNAT" 的虛擬交換器。
位於 New-Switch，<無檔案>: 第 117 行
位於 <ScriptBlock>，<無檔案>: 第 394 行
   於 Docker.Core.Pipe.NamedPipeClient.Send(String action, Object[] parameters) 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Core\pipe\NamedPipeClient.cs: 行 36
   於 Docker.Actions.DoStart(SynchronizationContext syncCtx, Boolean showWelcomeWindow, Boolean executeAfterStartCleanup) 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Windows\Actions.cs: 行 67
   於 Docker.Actions.<>c__DisplayClass14_0.<Start>b__0() 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Windows\Actions.cs: 行 51
   於 Docker.WPF.TaskQueue.<>c__DisplayClass19_0.<.ctor>b__1() 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.WPF\TaskQueue.cs: 行 59
```

> 5/11, 最後幾行的 Log file 長這樣
```
[15:33:28.260][NamedPipeServer][Info   ] TryGetVhdxSize()
[15:33:28.260][PowerShell     ][Info   ] Run script 'Get-VHD –Path "" | select -ExpandProperty Size'...
[15:33:28.262][NamedPipeServer][Info   ] TryGetVhdxSize done in 00:00:00.0019983.
[15:33:49.693][NamedPipeServer][Error  ] Unable to execute Start: Unable to create: 執行中的命令已停止，因為喜好設定變數 "ErrorActionPreference" 或一般參數設定為 Stop: Hyper-V 找不到名為 "DockerNAT" 的虛擬交換器。
位於 New-Switch，<無檔案>: 第 117 行
位於 <ScriptBlock>，<無檔案>: 第 394 行    於 Docker.Backend.HyperV.RunScript(String action, Dictionary`2 parameters) 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Backend\HyperV.cs: 行 183
   於 Docker.Backend.ContainerEngine.Linux.Start(Settings settings, String daemonOptions) 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Backend\ContainerEngine\Linux.cs: 行 111
[15:33:50.227][NamedPipeClient][Error  ] Unable to send Start: Unable to create: 執行中的命令已停止，因為喜好設定變數 "ErrorActionPreference" 或一般參數設定為 Stop: Hyper-V 找不到名為 "DockerNAT" 的虛擬交換器。
位於 New-Switch，<無檔案>: 第 117 行
位於 <ScriptBlock>，<無檔案>: 第 394 行
[15:33:50.251][Notifications  ][Error  ] Unable to create: 執行中的命令已停止，因為喜好設定變數 "ErrorActionPreference" 或一般參數設定為 Stop: Hyper-V 找不到名為 "DockerNAT" 的虛擬交換器。
位於 New-Switch，<無檔案>: 第 117 行
位於 <ScriptBlock>，<無檔案>: 第 394 行
[15:35:09.808][ErrorReportWindow][Info   ] Open logs
```

> 5/11, 辛苦的弄了半個小時, 其實我真的沒動到什麼, 只是用 `系統管理員權限` 去開啟 `Hyper-V` 及 `Docker`, 然後忘了在什麼條件底下, 原本 **虛擬交換器管理員** 只有一個「預設切換」, 但偶然間出現 「DockerNAT」, 重開後又消失了!! 然後 Docker就成功啟動了... (幹!!  沙小...).  只是 `Docker`啟動成功後, 在開啟 `Hyper-V`, 就看不到 「DockerNAT」了.

> 5/14, 就在幾天後, 我又執行 Docker > Switch to Windows Containers..., 不一會兒又爆錯了
```
Unable to create: 執行中的命令已停止，因為喜好設定變數 "ErrorActionPreference" 或一般參數設定為 Stop: Hyper-V 找不到名為 "DockerNAT" 的虛擬交換器。
位於 New-Switch，<無檔案>: 第 117 行
位於 <ScriptBlock>，<無檔案>: 第 394 行
   於 Docker.Core.Pipe.NamedPipeClient.Send(String action, Object[] parameters) 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Core\pipe\NamedPipeClient.cs: 行 36
   於 Docker.Actions.<>c__DisplayClass23_0.<SwitchDaemon>b__0() 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Windows\Actions.cs: 行 262
   於 Docker.WPF.TaskQueue.<>c__DisplayClass19_0.<.ctor>b__1() 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.WPF\TaskQueue.cs: 行 59
```

> 5/14, 點選還原回原始設定後, 錯誤訊息又不太一樣...orz
```
Unable to create: 執行中的命令已停止，因為喜好設定變數 "ErrorActionPreference" 或一般參數設定為 Stop: Hyper-V 找不到名為 "DockerNAT" 的虛擬交換器。
位於 New-Switch，<無檔案>: 第 117 行
位於 <ScriptBlock>，<無檔案>: 第 394 行
   於 Docker.Core.Pipe.NamedPipeClient.Send(String action, Object[] parameters) 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Core\pipe\NamedPipeClient.cs: 行 36
   於 Docker.Actions.DoStart(SynchronizationContext syncCtx, Boolean showWelcomeWindow, Boolean executeAfterStartCleanup) 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Windows\Actions.cs: 行 67
   於 Docker.Actions.<>c__DisplayClass16_0.<ResetToDefault>b__0() 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Windows\Actions.cs: 行 124
   於 Docker.WPF.TaskQueue.<>c__DisplayClass19_0.<.ctor>b__1() 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.WPF\TaskQueue.cs: 行 59
```

> 5/15, 開機後又無法正常啟動...

```
Docker for Windows service is not running
   於 Docker.WPF.BackendClient.CheckService() 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.WPF\BackendClient.cs: 行 356
   於 Docker.WPF.BackendClient.SendMessage(String action, Object[] parameters) 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.WPF\BackendClient.cs: 行 167
   於 Docker.Actions.DoStart(SynchronizationContext syncCtx, Boolean showWelcomeWindow, Boolean executeAfterStartCleanup) 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Windows\Actions.cs: 行 67
   於 Docker.Actions.<>c__DisplayClass14_0.<Start>b__0() 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Windows\Actions.cs: 行 51
   於 Docker.WPF.TaskQueue.<>c__DisplayClass19_0.<.ctor>b__1() 於 C:\gopath\src\github.com\docker\pinata\win\src\Docker.WPF\TaskQueue.cs: 行 59
```


> 安裝完 Docker on Windows後, 使用 Hyper-V (而非VirtualBox), 看似正常安裝了, 但是 Hyper-V裏頭, 卻沒有 `MobyLinuxVM`, *Virtual Switch Manager*裏頭, 也沒有 `DockerNAT`. 估計是這邊不曉得哪裡有問題, 因而 docker一直無法正常運作. 2018/05/21


## Issue
- [Security warning appearing when building a Docker image from Windows against a non-Windows Docker host](https://github.com/moby/moby/issues/20397)

> Build Image from Dockerfile之後, 會看到 `Successfully tagged mt:latestSECURITY WARNING: You are building a Docker image from Windows against a non-Windows Docker host. All files and directories added to build context will have '-rwxr-xr-x' permissions. It is recommended to double check and reset permissions for sensitive files and directories.`. 這是因為 Windows裏頭, 並不存在 *executable*, 所以這些訊息都會經由 stdout 輸出, 並且無法透過設定將它關閉提醒(17.04版以前, 此為 stderr).