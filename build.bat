@echo off
setlocal enabledelayedexpansion

if not exist "data" (
    echo 没data
    pause
    exit /b 1
)

if not exist "pack.mcmeta" (
    echo 没pack.mcmeta
    pause
    exit /b 1
)

set "VERSION=%1"
if "%VERSION%"=="" (
    echo 没版本号参数
    pause
    exit /b 1
)

echo %VERSION% | findstr /r "^[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$" >nul
if errorlevel 1 (
    echo 版本号格式不正确
    pause
    exit /b 1
)

set "SOURCE_DIR=%~dp0"
set "TEMP_DIR=%SOURCE_DIR%DailySign"
set "ZIP_FILE=%SOURCE_DIR%DailySign-%VERSION%.zip"

if exist "%TEMP_DIR%" rmdir /s /q "%TEMP_DIR%"
if exist "%ZIP_FILE%" del /q "%ZIP_FILE%"

mkdir "%TEMP_DIR%"
xcopy /e /i /q /y "data" "%TEMP_DIR%\data\"
copy /y "pack.mcmeta" "%TEMP_DIR%\" >nul

powershell -command "Compress-Archive -Path 'DailySign' -DestinationPath 'DailySign-%VERSION%.zip' -Force" >nul

rmdir /s /q "%TEMP_DIR%"

echo 压缩成功: DailySign-%VERSION%.zip