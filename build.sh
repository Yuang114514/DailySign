#!/bin/bash
cd "$(dirname "$0")"
# 检查是否提供了版本号参数
if [ $# -eq 0 ]; then
    echo "错误：请提供版本号参数（格式：x.x.x）"
    echo "用法：$0 <版本号>"
    exit 1
fi

VERSION=$1

# 验证版本号格式（简单验证：至少包含两个点）
if [[ ! $VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "错误：版本号格式不正确，请使用 x.x.x 格式"
    exit 1
fi

# 检查必要文件和目录是否存在
if [ ! -d "data" ] || [ ! -f "pack.mcmeta" ]; then
    echo "错误：当前目录下未找到 data 文件夹或 pack.mcmeta 文件"
    exit 1
fi

# 创建目标目录
mkdir -p DailySign

# 复制文件
cp -r data/ pack.mcmeta DailySign/

# 压缩文件夹，文件名包含版本号
ZIP_NAME="DailySign-$VERSION.zip"
zip -r "$ZIP_NAME" DailySign/

# 清理临时文件
rm -rf DailySign

echo "打包完成！已创建 $ZIP_NAME"