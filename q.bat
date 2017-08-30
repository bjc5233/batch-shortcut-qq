@echo off
::介绍
::  q.bat执行跳转到某一扣扣好友界面, 包含附属消息, 会加入剪切板, 然后尝试在聊天界面粘贴
::  大类分为top、A公司
::  输入为空时更新key文本
::  找不到对应的界面时, 会根据当前输入key和key文本进行字符串相似度比较, 提供建议
set guessKeyFile=lib\qKey.txt
if "%1"=="" (
    (for /f "tokens=1-4 delims== " %%i in (%~f0) do if "%%i %%j %%k"=="if /i %%1" echo %%l)>%guessKeyFile%	
    exit
)
if not "%2"=="" set /p"=%2"<nul|clip






::========================= top =========================
if /i %1==bjc call :tencent 692008411
if /i %1==bao call :tencent 自己 692008411
::========================= top =========================



::========================= xx公司 =========================
if /i %1==friend1 call :tencent 123456
if /i %1==friend2 call :tencent 朋友2 654321
::========================= 亿库公司 =========================




::========================= 群组 =========================
::在QQ客户端的指定群，邮件选择生成桌面快捷方式
if /i %1==qun call :lnk "C:\path\bat\qun.lnk"
::========================= 群组 =========================








::========================= 公共 =========================
:guessKey
start "" tool_guessKey.bat "%~1" "%guessKeyFile%" %0
exit

:404
mode 30,7& title go& call lib\load.bat _parseShowBlockNum2
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
start 粘贴.vbs
goto :EOF
::========================= 公共 =========================