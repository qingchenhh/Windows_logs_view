@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

mode con cols=100 lines=40
title Windows日志查询0.1 --by 清晨
color 0a

rem 参考连接：
rem https://zgao.top/logparser解析windows系统日志常用sql合集/
rem https://zone.huoxian.cn/d/868-windows
rem https://cloud.tencent.com/developer/article/2134122

rem ### 用户操作事件id ###
rem 1102-清理审计日志
rem 1105-自动备份事件日志
rem 4624-帐户已成功登录
rem 4625-帐户登录失败
rem 4634-帐户被注销包括锁屏
rem 4647-用户发起注销
rem 4648-使用显式凭据尝试登录
rem 4649-检测到重播攻击
rem 4657-修改注册表值
rem 4665-尝试创建应用程序客户端上下文。
rem 4666-应用程序尝试了一个操作
rem 4670-对象的权限已更改
rem 4672-给新登录分配特权
rem 4674-尝试对特权对象执行操作
rem 4692-尝试备份数据保护主密钥
rem 4696-主要令牌已分配给进程
rem 4697-添加服务

rem ### 计划任务事件id ###
rem 4698-已创建计划任务
rem 4699-计划任务已删除
rem 4700-已启用计划任务
rem 4701-计划任务已禁用
rem 4702-计划任务已更新
rem 4703-令牌权已经调整
rem 4704-已分配用户权限
rem 4705-用户权限已被删除
rem 4706-为域创建了新的信任
rem 4707-已删除对域的信任
rem 4709-IPsec服务已启动
rem 4710-IPsec服务已禁用
rem 4713-Kerberos策略已更改
rem 4717-系统安全访问权限已授予帐户
rem 4718-系统安全访问已从帐户中删除
rem 4719-系统审核策略已更改
rem 4720-已创建用户帐户
rem 4722-用户帐户已启用
rem 4723-尝试更改帐户的密码
rem 4724-尝试重置帐户密码
rem 4725-用户帐户已被禁用
rem 4726-用户帐户已删除
rem 4727-已创建启用安全性的全局组
rem 4728-已将成员添加到启用安全性的全局组中
rem 4729-成员已从启用安全性的全局组中删除
rem 4730-已删除启用安全性的全局组
rem 4731-已创建启用安全性的本地组
rem 4732-已将成员添加到启用安全性的本地组
rem 4733-成员已从启用安全性的本地组中删除
rem 4734-已删除已启用安全性的本地组
rem 4735-已启用安全性的本地组已更改
rem 4737-启用安全性的全局组已更改
rem 4738-用户帐户已更改
rem 4740-用户帐户已被锁定
rem 4741-已创建计算机帐户
rem 4742-计算机帐户已更改
rem 4743-计算机帐户已删除
rem 4744-已创建禁用安全性的本地组
rem 4745-已禁用安全性的本地组已更改
rem 4746-已将成员添加到已禁用安全性的本地组
rem 4747-已从安全性已禁用的本地组中删除成员
rem 4756-已将成员添加到启用安全性的通用组中
rem 4765-SID历史记录已添加到帐户中
rem 4767-用户帐户已解锁
rem 4768-请求了Kerberos身份验证票证（TGT）
rem 4769-请求了Kerberos服务票证
rem 4770-更新了Kerberos服务票证
rem 4774-已映射帐户以进行登录
rem 4775-无法映射帐户以进行登录
rem 4776-域控制器尝试验证帐户的凭据
rem 4777-域控制器无法验证帐户的凭据
rem 4778-会话重新连接到Window Station
rem 4782-密码哈希帐户被访问

rem 4794-尝试设置目录服务还原模式管理员密码
rem 4797-试图查询帐户是否存在空白密码
rem 4798-枚举了用户的本地组成员身份。
rem 4799-已枚举启用安全性的本地组成员身份
rem 4800-工作站已锁定
rem 4801-工作站已解锁
rem 4802-屏幕保护程序被调用

rem ### 域相关事件id ###
rem 4820-Kerberos票证授予票证（TGT）被拒绝，因为该设备不符合访问控制限制
rem 4821-Kerberos服务票证被拒绝，因为用户，设备或两者都不符合访问控制限制
rem 4822-NTLM身份验证失败，因为该帐户是受保护用户组的成员
rem 4823-NTLM身份验证失败，因为需要访问控制限制
rem 4825-用户被拒绝访问远程桌面。默认情况下，仅当用户是Remote Desktop Users组或Administrators组的成员时才允许用户进行连接

rem ### 5024-5037### 防火墙策略事件id
rem 4946-已对Windows防火墙例外列表进行了更改。增加了一条规则
rem 4947-已对Windows防火墙例外列表进行了更改。规则被修改了
rem 4948-已对Windows防火墙例外列表进行了更改。规则已删除
rem 5024-Windows防火墙服务已成功启动
rem 5025-Windows防火墙服务已停止


rem ### 5136-5145 ### 目录服务事件id
rem 5137-已创建目录服务对象
rem 5140-访问了网络共享对象
rem 5142-添加了网络共享对象。
rem 5145-检查网络共享对象以查看是否可以向客户端授予所需的访问权限

rem ### ------- ###
rem 5156-Windows筛选平台允许连接
rem 5157-Windows筛选平台已阻止连接


rem EXTRACT_TOKEN中String各个位置的含义：
rem 0安全IP（SID）        1账号名称         2账户域         3登录ID         4安全ID        5账户名
rem 6账户域        7登录ID        8登录类型        9登录进程        10身份验证数据包
rem 11网络账户名称        12账号GUID        13网络账户域        14数据包名        15密钥长度
rem 16进程ID        17进程路径        18源网络地址        19源端口        20模拟级别
rem 21        22        23         24 虚拟账户        25         26 提升的令牌

set /p SecurityPath=请输入Windows安全日志路径（测试本机请直接回车）：

if exist "%SecurityPath%" (
	echo.
	echo [*] 找到了Windows安全日志！
) else ( 
	echo.
	echo [*] 没有输入或找不到输入的安全日志路径，将会直接分析本系统的安全日志。
	set SecurityPath=Security
)

set "LogParser=C:\Program Files (x86)\Log Parser 2.2\LogParser.exe"

if exist "%LogParser%" (
	goto inputPluginPath
) else ( echo.
	echo [-] 没有找到LogParser程序，该脚本需要调用LogParser程序！
	echo [*] 如果没有安装LogParser，请到https://www.microsoft.com/en-us/download/details.aspx?id=24659下载安装。
	echo 请按任意键退出。
	pause >nul
	exit
)
:1
"%LogParser%" -i:EVT -o:DATAGRID "SELECT TimeGenerated AS 登录时间 , EXTRACT_TOKEN(Strings, 5, '|') AS 用户名 , EXTRACT_TOKEN(Strings, 13, '|') AS 计算机名 , EXTRACT_TOKEN(Strings, 10, '|') AS 登录类型 , EXTRACT_TOKEN(Strings, 19, '|') AS 源IP , EXTRACT_TOKEN(Strings, 17, '|') AS 请求进程ID , EXTRACT_TOKEN(Strings, 18, '|') AS 请求进程名 FROM %SecurityPath% WHERE eventid=4625 AND 登录类型 LIKE '3' OR 登录类型 LIKE '10'"
goto inputPluginPath

:2
"%LogParser%" -i:EVT -o:DATAGRID "SELECT TimeGenerated AS 登录时间 , EXTRACT_TOKEN(Strings, 5, '|') AS 用户名 , EXTRACT_TOKEN(Strings, 11, '|') AS 计算机名 , EXTRACT_TOKEN(Strings, 8, '|') AS 登录类型 , EXTRACT_TOKEN(Strings, 18, '|') AS 登录源IP , EXTRACT_TOKEN(Strings, 16, '|') AS 请求进程ID , EXTRACT_TOKEN(Strings, 17, '|') AS 请求进程名 FROM %SecurityPath% WHERE eventid=4624 AND 用户名 NOT LIKE '%$'"
goto inputPluginPath

:3
"%LogParser%" -i:EVT -o:DATAGRID "SELECT TimeGenerated AS 登录时间 , EXTRACT_TOKEN(Strings, 5, '|') AS 用户名 , EXTRACT_TOKEN(Strings, 11, '|') AS 计算机名 , EXTRACT_TOKEN(Strings, 8, '|') AS 登录类型 , EXTRACT_TOKEN(Strings, 18, '|') AS 登录源IP , EXTRACT_TOKEN(Strings, 16, '|') AS 请求进程ID , EXTRACT_TOKEN(Strings, 17, '|') AS 请求进程名 FROM %SecurityPath% where EventId in (4625;4624)"
goto inputPluginPath

:4
"%LogParser%" -i:EVT -o:datagrid "select TimeWritten AS 创建时间 ,extract_token(Strings,1,'|') as 创建者 ,extract_token(Strings,4,'|') as 计划任务名称 ,extract_token(Strings,1,'Exec>') as 执行命令 ,extract_token(Strings,1,'Enabled>') as 是否启用 from %SecurityPath% where eventid=4698"
goto inputPluginPath

:5
"%LogParser%" -i:EVT -o:datagrid "select TimeGenerated AS 删除时间 ,extract_token(Strings,1,'|') as 删除者 ,extract_token(Strings,4,'|') as 计划任务名称 from %SecurityPath% where eventid=4699"
goto inputPluginPath

:6
"%LogParser%" -i:EVT -o:datagrid "select TimeGenerated AS 创建时间 ,extract_token(Strings,0,'|') as 被创建用户名 ,extract_token(Strings,4,'|') as 创建者 from %SecurityPath% where eventid=4720"
goto inputPluginPath

:7
"%LogParser%" -i:EVT -o:datagrid "select TimeGenerated AS 删除时间 ,extract_token(Strings,0,'|') as 被删除用户名 ,extract_token(Strings,4,'|') as 删除者 from %SecurityPath% where eventid=4726"
goto inputPluginPath

:8
"%LogParser%" -i:EVT -o:datagrid "select TimeGenerated AS 操作时间 ,extract_token(Strings,0,'|') as 被变更用户名 ,extract_token(Strings,2,'|') as 变更组 ,extract_token(Strings,6,'|') as 操作者 from %SecurityPath% where eventid=4732"
goto inputPluginPath

:9
"%LogParser%" -i:EVT -o:DATAGRID "SELECT TimeGenerated AS 时间, EXTRACT_TOKEN(Strings, 1, '|') AS 用户名 , EXTRACT_TOKEN(Strings, 4, '|') AS 进程pid , EXTRACT_TOKEN(Strings, 5, '|') AS 进程名 , EXTRACT_TOKEN(Strings, 7, '|') AS 父进程ppid , EXTRACT_TOKEN(Strings, 13, '|') AS 父进程名 , EXTRACT_TOKEN(Strings, 8, '|') AS 命令行 FROM %SecurityPath% WHERE EventID = 4688"
goto inputPluginPath

:10
"%LogParser%" -i:EVT  -o:datagrid "select TimeGenerated AS 时间,extract_token(Strings,1,'|') As 应用程序名  ,extract_token(Strings,0,'|') as 进程id  ,extract_token(Strings,2,'|') as 方向  ,extract_token(Strings,3,'|') as 源IP  ,extract_token(Strings,4,'|') as 源端口  ,extract_token(Strings,5,'|') as 目的IP  ,extract_token(Strings,6,'|') as 目的端口  ,extract_token(Strings,7,'|') as 协议号 from %SecurityPath% where eventid=5156 and 方向='%%%%14593'"
goto inputPluginPath

:11
"%LogParser%" -i:EVT  -o:datagrid "select TimeGenerated AS 时间,extract_token(Strings,1,'|') As 应用程序名  ,extract_token(Strings,0,'|') as 进程id  ,extract_token(Strings,2,'|') as 方向  ,extract_token(Strings,3,'|') as 源IP  ,extract_token(Strings,4,'|') as 源端口  ,extract_token(Strings,5,'|') as 目的IP  ,extract_token(Strings,6,'|') as 目的端口  ,extract_token(Strings,7,'|') as 协议号 from %SecurityPath% where eventid=5156 and 方向='%%%%14592'"
goto inputPluginPath

:12
"%LogParser%" -i:evt -o:datagrid "SELECT TimeGenerated AS 登录时间, EXTRACT_TOKEN(Strings, -2, '|') AS 进程pid, EXTRACT_TOKEN(Strings, 1, '|') AS 帐户名称, EXTRACT_TOKEN(Strings, 2, '|') AS 帐户域, EXTRACT_TOKEN(Strings, -3, '|') AS 特权名称, EXTRACT_TOKEN(Strings, -1, '|') AS 进程名 FROM %SecurityPath% WHERE EventID=4673"
goto inputPluginPath

:13
"%LogParser%" -i:evt -o:datagrid "SELECT TimeGenerated AS 登录时间, EXTRACT_TOKEN(Strings, -2, '|') AS 进程pid, EXTRACT_TOKEN(Strings, 1, '|') AS 帐户名称, EXTRACT_TOKEN(Strings, 2, '|') AS 帐户域, EXTRACT_TOKEN(Strings, 5, '|') AS 对象类型, EXTRACT_TOKEN(Strings, 6, '|') AS 对象名称, EXTRACT_TOKEN(Strings, -3, '|') AS 特权名称, EXTRACT_TOKEN(Strings, -1, '|') AS 进程名 FROM %SecurityPath% WHERE EventID=4674"
goto inputPluginPath

:inputPluginPath
echo.
echo ----------------------------------------------------------------------
echo 1. 查看登录失败日志。                      2. 查看登录登录成功日志。
echo 3. 查看远程登录记录。                      4. 查看创建计划任务日志。
echo 5. 查看删除计划任务日志。                  6. 查看用户创建日志。
echo 7. 查看用户删除日志。                      8. 查看用户属组变更。
echo 9. 查看创建新进程日志。                    10. 查看外对内网络连接日志。
echo 11. 查看内对外网络连接日志。               12. 查看调用特权服务日志。
echo 13. 查看尝试对特权对象执行操作日志。         
echo ----------------------------------------------------------------------
echo.
set /p xuanze=请输您的选择：
goto %xuanze%

:tuichu
echo.
echo 请按任意键退出。
pause >nul