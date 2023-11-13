@echo off
cd /d %~dp0
mode 95,30
chcp 65001
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
setlocal EnableDelayedExpansion
:Preparing
cls
Title Nguyen Hoang Long Installer - Preparing
echo.
echo.
echo.              [92m███████╗[96m██╗  ██╗[93m██╗   ██╗[94m██╗   ██╗[90m██╗   ██╗[40;31m███╗   ███╗[91m███████╗
echo.              [92m██╔════╝[96m██║ ██╔╝[93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m████╗ ████║[91m██╔════╝
echo.              [92m███████╗[96m█████╔╝ [93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m██╔████╔██║[91m███████╗
echo.              [92m╚════██║[96m██╔═██╗ [93m╚██╗ ██╔╝[94m██║   ██║[90m╚██╗ ██╔╝[40;31m██║╚██╔╝██║[91m╚════██║
echo.              [92m███████║[96m██║  ██╗[93m ╚████╔╝ [94m╚██████╔╝[90m ╚████╔╝ [40;31m██║ ╚═╝ ██║[91m███████║
echo.              [92m╚══════╝[96m╚═╝  ╚═╝[93m  ╚═══╝   [94m╚═════╝ [90m  ╚═══╝  [40;31m╚═╝     ╚═╝[91m╚══════╝
echo.
echo [93m                         Suron Emulator Lite Offline Installer
echo                                  Made by Nguyen Hoang Long
timeout 1 >nul
echo. [97mChecking Emulator...
echo.
timeout 2 /nobreak >nul
echo  [94mEmulator: BlueStacks 
echo.
timeout 1 >nul
echo. [97mChecking Version Emulator...
echo.
timeout 2 /nobreak >nul
echo  [92mVersion: 4.xx

timeout 1 /nobreak >nul
set "_spc=                       "
set "_bar=■■■■■■■■■■■■■■■■■■■■■■■" 
set "_msg=  Preparing"
<con: echo [95m 
echo.  Loading Setup ^& BlueStacksInstall
for /f %%a in ('copy/Z "%~dpf0" nul')do for /f skip^=1 %%b in ('echo;prompt;$H^|cmd')do set "BS=%%b" & set "CR=%%a"
for /l %%L in (1 1 23)do <con: set/p "'=!CR!!BS!!CR!!_msg! [!_bar:~0,%%~L!!BS!!_spc:~%%L!]"<nul & >nul timeout.exe 1 /nobreak 

set BS="%ProgramFiles%\BlueStacks\HD-Player.exe"
set diskpart=".\DiskPart.txt"
if not exist "HD-Nougat32Image.bin" goto PreparingError
if not exist ".\DiskPart.txt" goto PreparingError
if exist %BS% goto BS_INSTALLED
goto :HomeInstalled

:PreparingError
cls
Title Nguyen Hoang Long Installer - Missing files
echo.
echo.
echo.              [92m███████╗[96m██╗  ██╗[93m██╗   ██╗[94m██╗   ██╗[90m██╗   ██╗[40;31m███╗   ███╗[91m███████╗
echo.              [92m██╔════╝[96m██║ ██╔╝[93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m████╗ ████║[91m██╔════╝
echo.              [92m███████╗[96m█████╔╝ [93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m██╔████╔██║[91m███████╗
echo.              [92m╚════██║[96m██╔═██╗ [93m╚██╗ ██╔╝[94m██║   ██║[90m╚██╗ ██╔╝[40;31m██║╚██╔╝██║[91m╚════██║
echo.              [92m███████║[96m██║  ██╗[93m ╚████╔╝ [94m╚██████╔╝[90m ╚████╔╝ [40;31m██║ ╚═╝ ██║[91m███████║
echo.              [92m╚══════╝[96m╚═╝  ╚═╝[93m  ╚═══╝   [94m╚═════╝ [90m  ╚═══╝  [40;31m╚═╝     ╚═╝[91m╚══════╝
echo.
echo [93m                         Suron Emulator Lite Offline Installer
echo                                  Made by Nguyen Hoang Long
echo.
echo.  [94mEmulator: BlueStacks
echo.
echo.  [92mVersion: 4.xx
echo. 
echo   [91mMissing File , Please Download Again From Nguyen Hoang Long
echo.
echo   [40;35m [ [40;32m1[40;35m ] [40;36m Continue Installer
echo. 
echo   [40;35m [ [40;32m2[40;35m ] [40;36m Quit Installer
echo.
choice /c:12 /n /m "%DEL%  Enter To Choose : "
set choice=%errorlevel%
if "%choice%"=="1" goto :BlueStacksInstaller
if "%choice%"=="2" goto :Quit


:BlueStacksInstaller
cls
Title Nguyen Hoang Long Installer - BlueStacks BS Unstaller Check
echo.
echo.
echo.              [92m███████╗[96m██╗  ██╗[93m██╗   ██╗[94m██╗   ██╗[90m██╗   ██╗[40;31m███╗   ███╗[91m███████╗
echo.              [92m██╔════╝[96m██║ ██╔╝[93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m████╗ ████║[91m██╔════╝
echo.              [92m███████╗[96m█████╔╝ [93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m██╔████╔██║[91m███████╗
echo.              [92m╚════██║[96m██╔═██╗ [93m╚██╗ ██╔╝[94m██║   ██║[90m╚██╗ ██╔╝[40;31m██║╚██╔╝██║[91m╚════██║
echo.              [92m███████║[96m██║  ██╗[93m ╚████╔╝ [94m╚██████╔╝[90m ╚████╔╝ [40;31m██║ ╚═╝ ██║[91m███████║
echo.              [92m╚══════╝[96m╚═╝  ╚═╝[93m  ╚═══╝   [94m╚═════╝ [90m  ╚═══╝  [40;31m╚═╝     ╚═╝[91m╚══════╝
echo.
echo [93m                         Suron Emulator Lite Offline Installer
echo                                  Made by Nguyen Hoang Long
echo.
echo.  [94mEmulator: BlueStacks
echo.
echo.  [92mVersion: 4.xx
echo.
echo.  [40;31mNotification !
echo.  Please Uninstall BlueStacks 4 To Continue Installing.
echo.
echo.  [40;35m [ [40;32m1[40;35m ] [40;36m Deleted ^& Continue Installer 
echo.
choice /c:1 /n /m "%DEL%  Enter To Choose : "
set choice=%errorlevel%
if "%choice%"=="1" goto :HomeInstalled

:HomeInstalled
cls
Title Nguyen Hoang Long Installer
echo.
echo.
echo.              [92m███████╗[96m██╗  ██╗[93m██╗   ██╗[94m██╗   ██╗[90m██╗   ██╗[40;31m███╗   ███╗[91m███████╗
echo.              [92m██╔════╝[96m██║ ██╔╝[93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m████╗ ████║[91m██╔════╝
echo.              [92m███████╗[96m█████╔╝ [93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m██╔████╔██║[91m███████╗
echo.              [92m╚════██║[96m██╔═██╗ [93m╚██╗ ██╔╝[94m██║   ██║[90m╚██╗ ██╔╝[40;31m██║╚██╔╝██║[91m╚════██║
echo.              [92m███████║[96m██║  ██╗[93m ╚████╔╝ [94m╚██████╔╝[90m ╚████╔╝ [40;31m██║ ╚═╝ ██║[91m███████║
echo.              [92m╚══════╝[96m╚═╝  ╚═╝[93m  ╚═══╝   [94m╚═════╝ [90m  ╚═══╝  [40;31m╚═╝     ╚═╝[91m╚══════╝
echo.
echo [93m                         Suron Emulator Lite Offline Installer
echo                                  Made by Nguyen Hoang Long
echo.
echo.  [94mEmulator: BlueStacks
echo.
echo.  [92mVersion: 4.xx
echo.
echo.  [40;35m [ [40;32m1[40;35m ] [40;36m Install BlueStacks 4
echo.
echo.  [40;35m [ [40;32m2[40;35m ] [40;36m Quit Install 
echo.
choice /c:12 /n /m "%DEL%  Enter To Choose : "
set choice=%errorlevel%
if "%choice%"=="1" goto :Setup_Wizard
if "%choice%"=="2" goto :Quit


:Setup_Wizard
cls
Title Nguyen Hoang Long Installer
echo.
echo.
echo.              [92m███████╗[96m██╗  ██╗[93m██╗   ██╗[94m██╗   ██╗[90m██╗   ██╗[40;31m███╗   ███╗[91m███████╗
echo.              [92m██╔════╝[96m██║ ██╔╝[93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m████╗ ████║[91m██╔════╝
echo.              [92m███████╗[96m█████╔╝ [93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m██╔████╔██║[91m███████╗
echo.              [92m╚════██║[96m██╔═██╗ [93m╚██╗ ██╔╝[94m██║   ██║[90m╚██╗ ██╔╝[40;31m██║╚██╔╝██║[91m╚════██║
echo.              [92m███████║[96m██║  ██╗[93m ╚████╔╝ [94m╚██████╔╝[90m ╚████╔╝ [40;31m██║ ╚═╝ ██║[91m███████║
echo.              [92m╚══════╝[96m╚═╝  ╚═╝[93m  ╚═══╝   [94m╚═════╝ [90m  ╚═══╝  [40;31m╚═╝     ╚═╝[91m╚══════╝
echo.
echo [93m                         Suron Emulator Lite Offline Installer
echo                                  Made by Nguyen Hoang Long
echo.
echo.  [94mEmulator: BlueStacks
echo.
echo.  [92mVersion: 4.xx
echo.
DiskPart /s %diskpart%
echo.  Enter The Drive You Want To Install To And Press Enter 
set /p drive=  Drive : 
if not exist %drive%:\ goto DriveError
Set PDDIR=%drive%:
goto Install

:Install
cls
Title Nguyen Hoang Long Installer - Installing...
echo.
echo.
echo.              [92m███████╗[96m██╗  ██╗[93m██╗   ██╗[94m██╗   ██╗[90m██╗   ██╗[40;31m███╗   ███╗[91m███████╗
echo.              [92m██╔════╝[96m██║ ██╔╝[93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m████╗ ████║[91m██╔════╝
echo.              [92m███████╗[96m█████╔╝ [93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m██╔████╔██║[91m███████╗
echo.              [92m╚════██║[96m██╔═██╗ [93m╚██╗ ██╔╝[94m██║   ██║[90m╚██╗ ██╔╝[40;31m██║╚██╔╝██║[91m╚════██║
echo.              [92m███████║[96m██║  ██╗[93m ╚████╔╝ [94m╚██████╔╝[90m ╚████╔╝ [40;31m██║ ╚═╝ ██║[91m███████║
echo.              [92m╚══════╝[96m╚═╝  ╚═╝[93m  ╚═══╝   [94m╚═════╝ [90m  ╚═══╝  [40;31m╚═╝     ╚═╝[91m╚══════╝
echo.
echo [93m                         Suron Emulator Lite Offline Installer
echo                                  Made by Nguyen Hoang Long
echo.
echo.  [94mEmulator: BlueStacks
echo.
echo.  [92mVersion: 4.xx
echo. 
echo.  [91mInstalling BlueStacks 4.xx...
echo.  [93mThe Process May Take A Few Minutes !
Bootstrapper.exe -pddir="%PDDIR%\BlueStacks" 

:pending
cls
Title Nguyen Hoang Long Installer - Installing...
echo.
echo.
echo.              [92m███████╗[96m██╗  ██╗[93m██╗   ██╗[94m██╗   ██╗[90m██╗   ██╗[40;31m███╗   ███╗[91m███████╗
echo.              [92m██╔════╝[96m██║ ██╔╝[93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m████╗ ████║[91m██╔════╝
echo.              [92m███████╗[96m█████╔╝ [93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m██╔████╔██║[91m███████╗
echo.              [92m╚════██║[96m██╔═██╗ [93m╚██╗ ██╔╝[94m██║   ██║[90m╚██╗ ██╔╝[40;31m██║╚██╔╝██║[91m╚════██║
echo.              [92m███████║[96m██║  ██╗[93m ╚████╔╝ [94m╚██████╔╝[90m ╚████╔╝ [40;31m██║ ╚═╝ ██║[91m███████║
echo.              [92m╚══════╝[96m╚═╝  ╚═╝[93m  ╚═══╝   [94m╚═════╝ [90m  ╚═══╝  [40;31m╚═╝     ╚═╝[91m╚══════╝
echo.
echo [93m                         Suron Emulator Lite Offline Installer
echo                                  Made by Nguyen Hoang Long
echo.
echo.  [94mEmulator: BlueStacks
echo.
echo.  [92mVersion: 4.xx
echo. 
echo.  [91mInstalling BlueStacks 4...
echo.  [93mThe Process May Take A Few Minutes !
if not exist %BS% goto install_fail
%BS% --instance Nougat32
goto :smooth

:install_fail
cls
Title Nguyen Hoang Long Installer - Install Fail
echo.
echo.
echo.              [92m███████╗[96m██╗  ██╗[93m██╗   ██╗[94m██╗   ██╗[90m██╗   ██╗[40;31m███╗   ███╗[91m███████╗
echo.              [92m██╔════╝[96m██║ ██╔╝[93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m████╗ ████║[91m██╔════╝
echo.              [92m███████╗[96m█████╔╝ [93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m██╔████╔██║[91m███████╗
echo.              [92m╚════██║[96m██╔═██╗ [93m╚██╗ ██╔╝[94m██║   ██║[90m╚██╗ ██╔╝[40;31m██║╚██╔╝██║[91m╚════██║
echo.              [92m███████║[96m██║  ██╗[93m ╚████╔╝ [94m╚██████╔╝[90m ╚████╔╝ [40;31m██║ ╚═╝ ██║[91m███████║
echo.              [92m╚══════╝[96m╚═╝  ╚═╝[93m  ╚═══╝   [94m╚═════╝ [90m  ╚═══╝  [40;31m╚═╝     ╚═╝[91m╚══════╝
echo.
echo [93m                         Suron Emulator Lite Offline Installer
echo                                  Made by Nguyen Hoang Long
echo.
echo.  [94mEmulator: BlueStacks
echo.
echo.  [92mVersion: 4.xx
echo. 
echo.  [91mFail Install 
echo.  [97mPress Any Key To Exit 
pause>nul
goto Quit


:DriveError
cls
Title Nguyen Hoang Long Installer
echo.
echo.
echo.              [92m███████╗[96m██╗  ██╗[93m██╗   ██╗[94m██╗   ██╗[90m██╗   ██╗[40;31m███╗   ███╗[91m███████╗
echo.              [92m██╔════╝[96m██║ ██╔╝[93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m████╗ ████║[91m██╔════╝
echo.              [92m███████╗[96m█████╔╝ [93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m██╔████╔██║[91m███████╗
echo.              [92m╚════██║[96m██╔═██╗ [93m╚██╗ ██╔╝[94m██║   ██║[90m╚██╗ ██╔╝[40;31m██║╚██╔╝██║[91m╚════██║
echo.              [92m███████║[96m██║  ██╗[93m ╚████╔╝ [94m╚██████╔╝[90m ╚████╔╝ [40;31m██║ ╚═╝ ██║[91m███████║
echo.              [92m╚══════╝[96m╚═╝  ╚═╝[93m  ╚═══╝   [94m╚═════╝ [90m  ╚═══╝  [40;31m╚═╝     ╚═╝[91m╚══════╝
echo.
echo [93m                         Suron Emulator Lite Offline Installer
echo                                  Made by Nguyen Hoang Long
echo.
echo.  [94mEmulator: BlueStacks
echo.
echo.  [92mVersion: 4.xx
echo.
echo.  [94mThe Drive You Entered Does Not Exist.
echo.  [97mChoose :
echo.  [40;35m [ [40;32m1[40;35m ] [40;36m Re-enter the Drive
echo.
echo.  [40;35m [ [40;32m2[40;35m ] [40;36m Pause Installer
echo.
choice /c:12 /n /m "%DEL%  Enter To Choose : "
set choice=%errorlevel%
if "%choice%"=="1" goto :Setup_Wizard
if "%choice%"=="2" goto :Quit


:smooth
@echo off
mode 95,30
chcp 65001
Title Nguyen Hoang Long Installer - Smooth Emulator
cls
echo.
echo.
echo.              [92m███████╗[96m██╗  ██╗[93m██╗   ██╗[94m██╗   ██╗[90m██╗   ██╗[40;31m███╗   ███╗[91m███████╗
echo.              [92m██╔════╝[96m██║ ██╔╝[93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m████╗ ████║[91m██╔════╝
echo.              [92m███████╗[96m█████╔╝ [93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m██╔████╔██║[91m███████╗
echo.              [92m╚════██║[96m██╔═██╗ [93m╚██╗ ██╔╝[94m██║   ██║[90m╚██╗ ██╔╝[40;31m██║╚██╔╝██║[91m╚════██║
echo.              [92m███████║[96m██║  ██╗[93m ╚████╔╝ [94m╚██████╔╝[90m ╚████╔╝ [40;31m██║ ╚═╝ ██║[91m███████║
echo.              [92m╚══════╝[96m╚═╝  ╚═╝[93m  ╚═══╝   [94m╚═════╝ [90m  ╚═══╝  [40;31m╚═╝     ╚═╝[91m╚══════╝
echo.
echo [93m                         Suron Emulator Lite Offline Installer
echo                                  Made by Nguyen Hoang Long
echo.
echo    [94mEmulator: BlueStacks
echo.
echo.   [92mVersion: 4.xx
echo.
echo.   [40;32mSmooth Emulator                           
echo       Chọn Chức Năng Smooth Bạn Cần:              
echo.
echo.     [40;35m [ [40;32m1[40;35m ] [40;36m BCDEdit 
echo.
echo.     [40;35m [ [40;32m2[40;35m ] [40;36m Auto Set High BLueStacks     
echo.
echo      [40;35m [ [40;32m3[40;35m ] [40;36m Complete Task
echo.    
choice /c:123 /n /m "%DEL%  Enter Your Choice : "
set choice=%errorlevel%
if %choice%==3 goto Quit
if %choice%==2 goto AutoHigh
if %choice%==1 goto BCDEDit
goto :smooth


:BCDEDit
cls
bcdedit /set avoidlowmemory 0x8000000
bcdedit /set nolowmem Yes
bcdedit /set vsmlaunchtype Off
bcdedit /set vm No
bcdedit /set usephysicaldestination No
bcdedit /set forcefipscrypto No
bcdedit /set perfmem 0 
bcdedit /set noumex Yes
bcdedit /set groupaware off 
bcdedit /set configaccesspolicy Default
bcdedit /set MSI Default
bcdedit /set usephysicaldestination No
bcdedit /set usefirmwarepcisettings No
bcdedit /set linearaddress57 OptOut
bcdedit /set increaseuserva 268435328
bcdedit /set hypervisorlaunchtype off
bcdedit /set ems no
bcdedit /set sos off
bcdedit /set disableelamdrivers yes
bcdedit /set pae ForceDisable
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
bcdedit /set tscsyncpolicy Legacy
bcdedit /set tpmbootentropy ForceDisable
bcdedit /set hypervisorlaunchtype off
bcdedit /set quietboot yes
bcdedit /timeout 0
bcdedit /set allowedinmemorysettings 0x0
bcdedit /set isolatedcontext No
bcdedit /set nx alwaysoff
bcdedit /set bootux disabled
bcdedit /set bootmenupolicy legacy
bcdedit /set x2apicpolicy enable
bcdedit /set uselegacyapicmode no
bcdedit /deletevalue useplatformclock
bcdedit /set debug No
bcdedit /set ems No
bcdedit /set bootems No 
bcdedit /set integrityservices disable
bcdedit /set bootlog no
bcdedit /event off
bcdedit /bootdebug off
bcdedit /set firstmegabytepolicy UseAll
bcdedit /set {globalsettings} custom:16000067 true
bcdedit /set {globalsettings} custom:16000069 true
bcdedit /set {globalsettings} custom:16000068 true 
goto :smooth


:AutoHigh
cls
echo High Cpu Gpu File Bluestacks.exe 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Bluestacks.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "Bluestacks.exe" /t Reg_SZ /d "GpuPreference=2;" /f
echo High Cpu Gpu File HD Player.exe 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "HD-Player.exe" /t Reg_SZ /d "GpuPreference=2;" /f
echo High Cpu Gpu File HD Agent.exe 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Agent.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "HD-Agent.exe" /t Reg_SZ /d "GpuPreference=2;" /f
echo High Cpu Gpu File BstkSVC.exe.exe 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BstkSVC.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "Bluestacks.exe" /t Reg_SZ /d "GpuPreference=2;" /f
echo High Cpu Gpu File HD Adb.exe 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Adb.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "HD-Adb.exe" /t Reg_SZ /d "GpuPreference=2;" /f
echo High Cpu Gpu File HD-ApkHandler.exe 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-ApkHandler\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "HD-ApkHandler" /t Reg_SZ /d "GpuPreference=2;" /f
echo High Cpu File HD-CheckCpu.exe 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-CheckCpu.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
echo High Gpu File HD ForceGPU.exe
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "HD-ForceGPU.exe" /t Reg_SZ /d "GpuPreference=2;" /f
echo High Cpu Gpu File HD GLCheck.exe
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-GLCheck.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "HD-GLCheck.exe" /t Reg_SZ /d "GpuPreference=2;" /f
echo High Cpu Gpu File HD RunApp.exe
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-RunApp.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "HD-RunApp.exe" /t Reg_SZ /d "GpuPreference=2;" /f
cls
goto :smooth


:Quit
Title Nguyen Hoang Long Installer - Quit 
cls
echo.
echo.
echo.              [92m███████╗[96m██╗  ██╗[93m██╗   ██╗[94m██╗   ██╗[90m██╗   ██╗[40;31m███╗   ███╗[91m███████╗
echo.              [92m██╔════╝[96m██║ ██╔╝[93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m████╗ ████║[91m██╔════╝
echo.              [92m███████╗[96m█████╔╝ [93m██║   ██║[94m██║   ██║[90m██║   ██║[40;31m██╔████╔██║[91m███████╗
echo.              [92m╚════██║[96m██╔═██╗ [93m╚██╗ ██╔╝[94m██║   ██║[90m╚██╗ ██╔╝[40;31m██║╚██╔╝██║[91m╚════██║
echo.              [92m███████║[96m██║  ██╗[93m ╚████╔╝ [94m╚██████╔╝[90m ╚████╔╝ [40;31m██║ ╚═╝ ██║[91m███████║
echo.              [92m╚══════╝[96m╚═╝  ╚═╝[93m  ╚═══╝   [94m╚═════╝ [90m  ╚═══╝  [40;31m╚═╝     ╚═╝[91m╚══════╝
echo.
echo [93m                         Suron Emulator Lite Offline Installer
echo                                  Made by Nguyen Hoang Long
echo.
echo    [94mEmulator: BlueStacks
echo.
echo    [92mVersion: 4.xx
echo.
echo [90mCảm Ơn Bạn Đã Tin Tưởng Trải Nghiệm Và Sử Dụng Giả Lập ( Mod ) Của Nguyen Hoang Long
echo Chương Trình Sẽ Thoát Sau Vài Giây Nữa...
echo Vui Lòng Không Tự Ý Tắt Chương Trình Khi Chưa Tự Tắt!.
echo.
Timeout 5 /nobreak >nul
Del * /s /q
Exit /b