@echo off& call lib\load.bat _parseASCIIStr _strlen2 _getLF& call lib\loadE.bat CurS& call lib\loadJ.bat StrDistanceFile& setlocal enabledelayedexpansion
%CurS% /crv 0
::判断当前输入与哪个key相似度最高, 并快速打开
::    %1: key
::    %2: keyFile
::    %3: reOpenBat
if not exist %~2 exit
for /f "delims=" %%i in ('%StrDistanceFile% "%~1" "%~2"') do (
	if "%%i" EQU "" (goto :404) else (set key=%%i& title do you mean [%%i]?)
)

set /a screenHeight=0, screenWidth=60& set key2=!key! ?& set drawStr=!LF!!LF!
(%_call% ("key2 asciiKey asciiKeyHeight") %_parseASCIIStr%)
for /l %%i in (1,1,!asciiKeyHeight!) do (
	set tempStr=!asciiKey_%%i!
	(%_call% ("tempStr tempLen") %_strlen2%)
	if !tempLen! GTR !screenWidth! set screenWidth=!tempLen!
	set drawStr=!drawStr!    !tempStr!!LF!
)
set /a screenWidth+=8, screenHeight=asciiKeyHeight+5
mode !screenWidth!,!screenHeight!
echo !drawStr!& pause>nul& start /min "" %3 !key!& exit




:404
mode 30,7& title get
set numStr=404& set numStrPrefix=  
echo.
(%_call% ("numStr numStrPrefix") %_parseShowBlockNum2%)
timeout 2 >nul& exit