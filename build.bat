@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ================================
echo   DailySign 打包压缩工具（带版本号）
echo ================================
echo.

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
    set /p "VERSION=请输入版本号（格式为x.x.x）: "
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
if exist "%TEMP_DIR%" (
    echo 删除已存在的临时文件夹...
    rmdir /s /q "%TEMP_DIR%"
)

if exist "%ZIP_FILE%" (
    echo 删除已存在的压缩文件...
    del /q "%ZIP_FILE%"
)

:: 创建DailySign文件夹
echo 创建 DailySign 文件夹...
mkdir "%TEMP_DIR%"

:: 复制文件
echo 复制 data 文件夹...
xcopy /e /i /y "data" "%TEMP_DIR%\data\"

echo 复制 pack.mcmeta 文件...
copy /y "pack.mcmeta" "%TEMP_DIR%\"

:: 检查是否安装了压缩工具
set "COMPRESS_CMD="
where tar >nul 2>nul && set "COMPRESS_CMD=tar -acf "%ZIP_FILE%" "DailySign" --force-local"
where 7z >nul 2>nul && set "COMPRESS_CMD=7z a "%ZIP_FILE%" "DailySign""
where winrar >nul 2>nul && set "COMPRESS_CMD=winrar a -afzip "%ZIP_FILE%" "DailySign""

if defined COMPRESS_CMD (
    echo 正在压缩 DailySign 文件夹...
    cd /d "%SOURCE_DIR%"
    %COMPRESS_CMD%
) else (
    :: 如果没有找到压缩工具，使用PowerShell
    echo 使用 PowerShell 进行压缩...
    powershell -command "Compress-Archive -Path 'DailySign' -DestinationPath 'DailySign-%VERSION%.zip' -Force"
)

:: 清理临时文件
echo 清理临时文件...
rmdir /s /q "%TEMP_DIR%"

:: 完成提示
echo.
echo ================================
echo   操作完成！
echo   已创建压缩文件: DailySign-%VERSION%.zip
echo ================================

:: 等待用户按键
pause