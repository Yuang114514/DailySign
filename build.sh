#!/bin/bash
cd "$(dirname "$0")"

if [ $# -eq 0 ]; then
    echo "错误：请提供版本号参数（格式：x.x.x）"
    echo "用法：$0 <版本号>"
    exit 1
fi

VERSION=$1

if [[ ! $VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "错误：版本号格式不正确，请使用 x.x.x 格式"
    exit 1
fi

if [ ! -d "data" ] || [ ! -f "pack.mcmeta" ]; then
    echo "错误：当前目录下未找到 data 文件夹或 pack.mcmeta 文件"
    exit 1
fi

mkdir -p DailySign

cp -r data/ pack.mcmeta DailySign/

ZIP_NAME="DailySign-$VERSION.zip"
zip -r "$ZIP_NAME" DailySign/

rm -rf DailySign

echo "打包完成！已创建 $ZIP_NAME"