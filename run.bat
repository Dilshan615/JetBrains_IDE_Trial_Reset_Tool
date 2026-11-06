@echo off
setlocal enabledelayedexpansion
title JetBrains IDE Selection Tool - by manja

:MENU
cls
echo ======================================================
echo           JetBrains Trial Reset Tool
echo                 Created by: manja
echo ======================================================
echo  [1] WebStorm
echo  [2] IntelliJ IDEA
echo  [3] CLion
echo  [4] Rider
echo  [5] GoLand
echo  [6] PhpStorm
echo  [7] PyCharm
echo  [8] Resharper
echo  [9] ALL (Reset all installed IDEs)
echo  [0] Exit
echo ======================================================
echo  [Tool by manja]
set /p choice="Enter your choice (0-9): "

if "%choice%"=="1" set "TARGET=WebStorm" & goto RUN_SINGLE
if "%choice%"=="2" set "TARGET=IntelliJ" & goto RUN_SINGLE
if "%choice%"=="3" set "TARGET=CLion" & goto RUN_SINGLE
if "%choice%"=="4" set "TARGET=Rider" & goto RUN_SINGLE
if "%choice%"=="5" set "TARGET=GoLand" & goto RUN_SINGLE
if "%choice%"=="6" set "TARGET=PhpStorm" & goto RUN_SINGLE
if "%choice%"=="7" set "TARGET=PyCharm" & goto RUN_SINGLE
if "%choice%"=="8" set "TARGET=Resharper" & goto RUN_SINGLE
if "%choice%"=="9" goto RUN_ALL
if "%choice%"=="0" exit
echo Invalid choice! Please try again...
timeout /t 2 >nul
goto MENU

:RUN_SINGLE
echo.
echo Processing for [%TARGET%]...
set "FOUND=0"
for /d %%a in ("%APPDATA%\JetBrains\%TARGET%*") do (
    set "FOUND=1"
    echo Cleaning: %%a
    if exist "%%a\eval" rd /s /q "%%a\eval"
    if exist "%%a\options\other.xml" (
        findstr /v /i "evlsprt" "%%a\options\other.xml" > "%%a\options\other1.xml"
        del /q "%%a\options\other.xml"
        ren "%%a\options\other1.xml" other.xml
    )
)
if "!FOUND!"=="0" (
    echo [!] No configuration folder found for %TARGET% in %APPDATA%\JetBrains.
) else (
    echo [OK] %TARGET% reset completed successfully!
)
goto FINISH

:RUN_ALL
echo.
echo Processing all JetBrains IDEs...
for %%I in ("WebStorm", "IntelliJ", "CLion", "Rider", "GoLand", "PhpStorm", "Resharper", "PyCharm") do (
    for /d %%a in ("%APPDATA%\JetBrains\%%~I*") do (
        echo Cleaning: %%a
        if exist "%%a\eval" rd /s /q "%%a\eval"
        if exist "%%a\options\other.xml" (
            findstr /v /i "evlsprt" "%%a\options\other.xml" > "%%a\options\other1.xml"
            del /q "%%a\options\other.xml"
            ren "%%a\options\other1.xml" other.xml
        )
    )
)
echo [OK] All IDEs processed successfully!
goto FINISH

:FINISH
echo.
reg delete "HKEY_CURRENT_USER\Software\JavaSoft" /f >nul 2>&1
echo Registry entries cleaned.
echo.
echo ======================================================
echo         Thank you for using this tool! - manja
echo ======================================================
echo.
pause
goto MENU