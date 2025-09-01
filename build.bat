@echo off
setlocal enabledelayedexpansion

:: 检查必要的文件是否存在
if not exist "data" (
    echo 错误：未找到 data 文件夹！
    pause
    exit /b 1
)

if not exist "pack.mcmeta" (
    echo 错误：未找到 pack.mcmeta 文件！
    pause
    exit /b 1
)

:: 获取版本号参数
set "VERSION=%1"
if "%VERSION%"=="" (
    echo 错误：请提供版本号参数（格式为x.x.x）
    pause
    exit /b 1
)

:: 验证版本号格式
echo %VERSION% | findstr /r "^[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$" >nul
if errorlevel 1 (
    echo 错误：版本号格式不正确，请使用x.x.x格式！
    pause
    exit /b 1
)

:: 设置变量
set "SOURCE_DIR=%~dp0"
set "TEMP_DIR=%SOURCE_DIR%DailySign"
set "ZIP_FILE=%SOURCE_DIR%DailySign-%VERSION%.zip"

:: 删除可能已存在的临时文件和压缩文件
if exist "%TEMP_DIR%" rmdir /s /q "%TEMP_DIR%"
if exist "%ZIP_FILE%" del /q "%ZIP_FILE%"

:: 创建DailySign文件夹并复制文件
mkdir "%TEMP_DIR%"
xcopy /e /i /q /y "data" "%TEMP_DIR%\data\"
copy /y "pack.mcmeta" "%TEMP_DIR%\" >nul

:: 使用PowerShell进行压缩
powershell -command "Compress-Archive -Path 'DailySign' -DestinationPath 'DailySign-%VERSION%.zip' -Force" >nul

:: 清理临时文件
rmdir /s /q "%TEMP_DIR%"

echo 成功创建压缩文件: DailySign-%VERSION%.zip