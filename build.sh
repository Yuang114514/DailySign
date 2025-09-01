#!/bin/bash
cd "$(dirname "$0")"

if [ $# -eq 0 ]; then
    echo "没版本号"
    exit 1
fi

VERSION=$1

if [[ ! $VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "版本号格式不正确"
    exit 1
fi

if [ ! -d "data" ] || [ ! -f "pack.mcmeta" ]; then
    echo "没data或pack.mcmeta"
    exit 1
fi

mkdir -p DailySign

cp -r data/ pack.mcmeta DailySign/

ZIP_NAME="DailySign-$VERSION.zip"
zip -r "$ZIP_NAME" DailySign/

rm -rf DailySign

echo "打包完成！已创建 $ZIP_NAME"