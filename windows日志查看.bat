@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

mode con cols=100 lines=40
title Windows��־��ѯ0.1 --by �峿
color 0a

rem �ο����ӣ�
rem https://zgao.top/logparser����windowsϵͳ��־����sql�ϼ�/
rem https://zone.huoxian.cn/d/868-windows
rem https://cloud.tencent.com/developer/article/2134122

rem ### �û������¼�id ###
rem 1102-���������־
rem 1105-�Զ������¼���־
rem 4624-�ʻ��ѳɹ���¼
rem 4625-�ʻ���¼ʧ��
rem 4634-�ʻ���ע����������
rem 4647-�û�����ע��
rem 4648-ʹ����ʽƾ�ݳ��Ե�¼
rem 4649-��⵽�ز�����
rem 4657-�޸�ע���ֵ
rem 4665-���Դ���Ӧ�ó���ͻ��������ġ�
rem 4666-Ӧ�ó�������һ������
rem 4670-�����Ȩ���Ѹ���
rem 4672-���µ�¼������Ȩ
rem 4674-���Զ���Ȩ����ִ�в���
rem 4692-���Ա������ݱ�������Կ
rem 4696-��Ҫ�����ѷ��������
rem 4697-��ӷ���

rem ### �ƻ������¼�id ###
rem 4698-�Ѵ����ƻ�����
rem 4699-�ƻ�������ɾ��
rem 4700-�����üƻ�����
rem 4701-�ƻ������ѽ���
rem 4702-�ƻ������Ѹ���
rem 4703-����Ȩ�Ѿ�����
rem 4704-�ѷ����û�Ȩ��
rem 4705-�û�Ȩ���ѱ�ɾ��
rem 4706-Ϊ�򴴽����µ�����
rem 4707-��ɾ�����������
rem 4709-IPsec����������
rem 4710-IPsec�����ѽ���
rem 4713-Kerberos�����Ѹ���
rem 4717-ϵͳ��ȫ����Ȩ���������ʻ�
rem 4718-ϵͳ��ȫ�����Ѵ��ʻ���ɾ��
rem 4719-ϵͳ��˲����Ѹ���
rem 4720-�Ѵ����û��ʻ�
rem 4722-�û��ʻ�������
rem 4723-���Ը����ʻ�������
rem 4724-���������ʻ�����
rem 4725-�û��ʻ��ѱ�����
rem 4726-�û��ʻ���ɾ��
rem 4727-�Ѵ������ð�ȫ�Ե�ȫ����
rem 4728-�ѽ���Ա��ӵ����ð�ȫ�Ե�ȫ������
rem 4729-��Ա�Ѵ����ð�ȫ�Ե�ȫ������ɾ��
rem 4730-��ɾ�����ð�ȫ�Ե�ȫ����
rem 4731-�Ѵ������ð�ȫ�Եı�����
rem 4732-�ѽ���Ա��ӵ����ð�ȫ�Եı�����
rem 4733-��Ա�Ѵ����ð�ȫ�Եı�������ɾ��
rem 4734-��ɾ�������ð�ȫ�Եı�����
rem 4735-�����ð�ȫ�Եı������Ѹ���
rem 4737-���ð�ȫ�Ե�ȫ�����Ѹ���
rem 4738-�û��ʻ��Ѹ���
rem 4740-�û��ʻ��ѱ�����
rem 4741-�Ѵ���������ʻ�
rem 4742-������ʻ��Ѹ���
rem 4743-������ʻ���ɾ��
rem 4744-�Ѵ������ð�ȫ�Եı�����
rem 4745-�ѽ��ð�ȫ�Եı������Ѹ���
rem 4746-�ѽ���Ա��ӵ��ѽ��ð�ȫ�Եı�����
rem 4747-�ѴӰ�ȫ���ѽ��õı�������ɾ����Ա
rem 4756-�ѽ���Ա��ӵ����ð�ȫ�Ե�ͨ������
rem 4765-SID��ʷ��¼����ӵ��ʻ���
rem 4767-�û��ʻ��ѽ���
rem 4768-������Kerberos�����֤Ʊ֤��TGT��
rem 4769-������Kerberos����Ʊ֤
rem 4770-������Kerberos����Ʊ֤
rem 4774-��ӳ���ʻ��Խ��е�¼
rem 4775-�޷�ӳ���ʻ��Խ��е�¼
rem 4776-�������������֤�ʻ���ƾ��
rem 4777-��������޷���֤�ʻ���ƾ��
rem 4778-�Ự�������ӵ�Window Station
rem 4782-�����ϣ�ʻ�������

rem 4794-��������Ŀ¼����ԭģʽ����Ա����
rem 4797-��ͼ��ѯ�ʻ��Ƿ���ڿհ�����
rem 4798-ö�����û��ı������Ա��ݡ�
rem 4799-��ö�����ð�ȫ�Եı������Ա���
rem 4800-����վ������
rem 4801-����վ�ѽ���
rem 4802-��Ļ�������򱻵���

rem ### ������¼�id ###
rem 4820-KerberosƱ֤����Ʊ֤��TGT�����ܾ�����Ϊ���豸�����Ϸ��ʿ�������
rem 4821-Kerberos����Ʊ֤���ܾ�����Ϊ�û����豸�����߶������Ϸ��ʿ�������
rem 4822-NTLM�����֤ʧ�ܣ���Ϊ���ʻ����ܱ����û���ĳ�Ա
rem 4823-NTLM�����֤ʧ�ܣ���Ϊ��Ҫ���ʿ�������
rem 4825-�û����ܾ�����Զ�����档Ĭ������£������û���Remote Desktop Users���Administrators��ĳ�Աʱ�������û���������

rem ### 5024-5037### ����ǽ�����¼�id
rem 4946-�Ѷ�Windows����ǽ�����б�����˸��ġ�������һ������
rem 4947-�Ѷ�Windows����ǽ�����б�����˸��ġ������޸���
rem 4948-�Ѷ�Windows����ǽ�����б�����˸��ġ�������ɾ��
rem 5024-Windows����ǽ�����ѳɹ�����
rem 5025-Windows����ǽ������ֹͣ


rem ### 5136-5145 ### Ŀ¼�����¼�id
rem 5137-�Ѵ���Ŀ¼�������
rem 5140-���������繲�����
rem 5142-��������繲�����
rem 5145-������繲������Բ鿴�Ƿ������ͻ�����������ķ���Ȩ��

rem ### ------- ###
rem 5156-Windowsɸѡƽ̨��������
rem 5157-Windowsɸѡƽ̨����ֹ����


rem EXTRACT_TOKEN��String����λ�õĺ��壺
rem 0��ȫIP��SID��        1�˺�����         2�˻���         3��¼ID         4��ȫID        5�˻���
rem 6�˻���        7��¼ID        8��¼����        9��¼����        10�����֤���ݰ�
rem 11�����˻�����        12�˺�GUID        13�����˻���        14���ݰ���        15��Կ����
rem 16����ID        17����·��        18Դ�����ַ        19Դ�˿�        20ģ�⼶��
rem 21        22        23         24 �����˻�        25         26 ����������

set /p SecurityPath=������Windows��ȫ��־·�������Ա�����ֱ�ӻس�����

if exist "%SecurityPath%" (
	echo.
	echo [*] �ҵ���Windows��ȫ��־��
) else ( 
	echo.
	echo [*] û��������Ҳ�������İ�ȫ��־·��������ֱ�ӷ�����ϵͳ�İ�ȫ��־��
	set SecurityPath=Security
)

set "LogParser=C:\Program Files (x86)\Log Parser 2.2\LogParser.exe"

if exist "%LogParser%" (
	goto inputPluginPath
) else ( echo.
	echo [-] û���ҵ�LogParser���򣬸ýű���Ҫ����LogParser����
	echo [*] ���û�а�װLogParser���뵽https://www.microsoft.com/en-us/download/details.aspx?id=24659���ذ�װ��
	echo �밴������˳���
	pause >nul
	exit
)
:1
"%LogParser%" -i:EVT -o:DATAGRID "SELECT TimeGenerated AS ��¼ʱ�� , EXTRACT_TOKEN(Strings, 5, '|') AS �û��� , EXTRACT_TOKEN(Strings, 13, '|') AS ������� , EXTRACT_TOKEN(Strings, 10, '|') AS ��¼���� , EXTRACT_TOKEN(Strings, 19, '|') AS ԴIP , EXTRACT_TOKEN(Strings, 17, '|') AS �������ID , EXTRACT_TOKEN(Strings, 18, '|') AS ��������� FROM %SecurityPath% WHERE eventid=4625 AND ��¼���� LIKE '3' OR ��¼���� LIKE '10'"
goto inputPluginPath

:2
"%LogParser%" -i:EVT -o:DATAGRID "SELECT TimeGenerated AS ��¼ʱ�� , EXTRACT_TOKEN(Strings, 5, '|') AS �û��� , EXTRACT_TOKEN(Strings, 11, '|') AS ������� , EXTRACT_TOKEN(Strings, 8, '|') AS ��¼���� , EXTRACT_TOKEN(Strings, 18, '|') AS ��¼ԴIP , EXTRACT_TOKEN(Strings, 16, '|') AS �������ID , EXTRACT_TOKEN(Strings, 17, '|') AS ��������� FROM %SecurityPath% WHERE eventid=4624 AND �û��� NOT LIKE '%$'"
goto inputPluginPath

:3
"%LogParser%" -i:EVT -o:DATAGRID "SELECT TimeGenerated AS ��¼ʱ�� , EXTRACT_TOKEN(Strings, 5, '|') AS �û��� , EXTRACT_TOKEN(Strings, 11, '|') AS ������� , EXTRACT_TOKEN(Strings, 8, '|') AS ��¼���� , EXTRACT_TOKEN(Strings, 18, '|') AS ��¼ԴIP , EXTRACT_TOKEN(Strings, 16, '|') AS �������ID , EXTRACT_TOKEN(Strings, 17, '|') AS ��������� FROM %SecurityPath% where EventId in (4625;4624)"
goto inputPluginPath

:4
"%LogParser%" -i:EVT -o:datagrid "select TimeWritten AS ����ʱ�� ,extract_token(Strings,1,'|') as ������ ,extract_token(Strings,4,'|') as �ƻ��������� ,extract_token(Strings,1,'Exec>') as ִ������ ,extract_token(Strings,1,'Enabled>') as �Ƿ����� from %SecurityPath% where eventid=4698"
goto inputPluginPath

:5
"%LogParser%" -i:EVT -o:datagrid "select TimeGenerated AS ɾ��ʱ�� ,extract_token(Strings,1,'|') as ɾ���� ,extract_token(Strings,4,'|') as �ƻ��������� from %SecurityPath% where eventid=4699"
goto inputPluginPath

:6
"%LogParser%" -i:EVT -o:datagrid "select TimeGenerated AS ����ʱ�� ,extract_token(Strings,0,'|') as �������û��� ,extract_token(Strings,4,'|') as ������ from %SecurityPath% where eventid=4720"
goto inputPluginPath

:7
"%LogParser%" -i:EVT -o:datagrid "select TimeGenerated AS ɾ��ʱ�� ,extract_token(Strings,0,'|') as ��ɾ���û��� ,extract_token(Strings,4,'|') as ɾ���� from %SecurityPath% where eventid=4726"
goto inputPluginPath

:8
"%LogParser%" -i:EVT -o:datagrid "select TimeGenerated AS ����ʱ�� ,extract_token(Strings,0,'|') as ������û��� ,extract_token(Strings,2,'|') as ����� ,extract_token(Strings,6,'|') as ������ from %SecurityPath% where eventid=4732"
goto inputPluginPath

:9
"%LogParser%" -i:EVT -o:DATAGRID "SELECT TimeGenerated AS ʱ��, EXTRACT_TOKEN(Strings, 1, '|') AS �û��� , EXTRACT_TOKEN(Strings, 4, '|') AS ����pid , EXTRACT_TOKEN(Strings, 5, '|') AS ������ , EXTRACT_TOKEN(Strings, 7, '|') AS ������ppid , EXTRACT_TOKEN(Strings, 13, '|') AS �������� , EXTRACT_TOKEN(Strings, 8, '|') AS ������ FROM %SecurityPath% WHERE EventID = 4688"
goto inputPluginPath

:10
"%LogParser%" -i:EVT  -o:datagrid "select TimeGenerated AS ʱ��,extract_token(Strings,1,'|') As Ӧ�ó�����  ,extract_token(Strings,0,'|') as ����id  ,extract_token(Strings,2,'|') as ����  ,extract_token(Strings,3,'|') as ԴIP  ,extract_token(Strings,4,'|') as Դ�˿�  ,extract_token(Strings,5,'|') as Ŀ��IP  ,extract_token(Strings,6,'|') as Ŀ�Ķ˿�  ,extract_token(Strings,7,'|') as Э��� from %SecurityPath% where eventid=5156 and ����='%%%%14593'"
goto inputPluginPath

:11
"%LogParser%" -i:EVT  -o:datagrid "select TimeGenerated AS ʱ��,extract_token(Strings,1,'|') As Ӧ�ó�����  ,extract_token(Strings,0,'|') as ����id  ,extract_token(Strings,2,'|') as ����  ,extract_token(Strings,3,'|') as ԴIP  ,extract_token(Strings,4,'|') as Դ�˿�  ,extract_token(Strings,5,'|') as Ŀ��IP  ,extract_token(Strings,6,'|') as Ŀ�Ķ˿�  ,extract_token(Strings,7,'|') as Э��� from %SecurityPath% where eventid=5156 and ����='%%%%14592'"
goto inputPluginPath

:12
"%LogParser%" -i:evt -o:datagrid "SELECT TimeGenerated AS ��¼ʱ��, EXTRACT_TOKEN(Strings, -2, '|') AS ����pid, EXTRACT_TOKEN(Strings, 1, '|') AS �ʻ�����, EXTRACT_TOKEN(Strings, 2, '|') AS �ʻ���, EXTRACT_TOKEN(Strings, -3, '|') AS ��Ȩ����, EXTRACT_TOKEN(Strings, -1, '|') AS ������ FROM %SecurityPath% WHERE EventID=4673"
goto inputPluginPath

:13
"%LogParser%" -i:evt -o:datagrid "SELECT TimeGenerated AS ��¼ʱ��, EXTRACT_TOKEN(Strings, -2, '|') AS ����pid, EXTRACT_TOKEN(Strings, 1, '|') AS �ʻ�����, EXTRACT_TOKEN(Strings, 2, '|') AS �ʻ���, EXTRACT_TOKEN(Strings, 5, '|') AS ��������, EXTRACT_TOKEN(Strings, 6, '|') AS ��������, EXTRACT_TOKEN(Strings, -3, '|') AS ��Ȩ����, EXTRACT_TOKEN(Strings, -1, '|') AS ������ FROM %SecurityPath% WHERE EventID=4674"
goto inputPluginPath

:inputPluginPath
echo.
echo ----------------------------------------------------------------------
echo 1. �鿴��¼ʧ����־��                      2. �鿴��¼��¼�ɹ���־��
echo 3. �鿴Զ�̵�¼��¼��                      4. �鿴�����ƻ�������־��
echo 5. �鿴ɾ���ƻ�������־��                  6. �鿴�û�������־��
echo 7. �鿴�û�ɾ����־��                      8. �鿴�û���������
echo 9. �鿴�����½�����־��                    10. �鿴���������������־��
echo 11. �鿴�ڶ�������������־��               12. �鿴������Ȩ������־��
echo 13. �鿴���Զ���Ȩ����ִ�в�����־��         
echo ----------------------------------------------------------------------
echo.
set /p xuanze=��������ѡ��
goto %xuanze%

:tuichu
echo.
echo �밴������˳���
pause >nul