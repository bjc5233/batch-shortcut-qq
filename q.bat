@echo off
::����
::  q.batִ����ת��ĳһ�ۿۺ��ѽ���, ����������Ϣ, �������а�, Ȼ�������������ճ��
::  �����Ϊtop��A��˾
::  ����Ϊ��ʱ����key�ı�
::  �Ҳ�����Ӧ�Ľ���ʱ, ����ݵ�ǰ����key��key�ı������ַ������ƶȱȽ�, �ṩ����
set guessKeyFile=qKey.txt
if "%1"=="" (
    (for /f "tokens=1-4 delims== " %%i in (%~f0) do if "%%i %%j %%k"=="if /i %%1" echo %%l)>%guessKeyFile%	
    exit
)
if not "%2"=="" set /p"=%2"<nul|clip






::========================= top =========================
if /i %1==bjc call :tencent 692008411
if /i %1==bao call :tencent �Լ� 692008411
::========================= top =========================



::========================= xx��˾ =========================
if /i %1==friend1 call :tencent 123456
if /i %1==friend2 call :tencent ����2 654321
::========================= �ڿ⹫˾ =========================




::========================= Ⱥ�� =========================
::��QQ�ͻ��˵�ָ��Ⱥ���ʼ�ѡ�����������ݷ�ʽ
if /i %1==qun call :lnk "C:\path\bat\qun.lnk"
::========================= Ⱥ�� =========================








::========================= ���� =========================
:guessKey
start "" tool_guessKey.bat "%~1" "%guessKeyFile%" %0
exit

:404
mode 30,7& title go& call load.bat _parseShowBlockNum2
set numStr=404& set numStrPrefix=  
echo.
(%_call% ("numStr numStrPrefix") %_parseShowBlockNum2%)
timeout 2 >nul& exit


:tencent
echo %1 %2
if /i "%2"=="" (start "" "tencent://message/?uin=%1") else (start "" "tencent://message/?uin=%2")
call :paste
exit

:lnk
echo %1 %2
if /i "%~2"=="" (start "" %1) else (start "" %2)
call :paste
exit


:paste
sleep 1000
start ճ��.vbs
goto :EOF
::========================= ���� =========================