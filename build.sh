#!/bin/bash

# 脚本名称: pack_and_compress.sh
# 功能: 打包data文件夹和pack.mcmeta到DailySign目录并压缩

# 设置变量
SOURCE_FILES=("data" "pack.mcmeta")
TARGET_DIR="DailySign"
ARCHIVE_NAME="DailySign.zip"

# 检查必要文件是否存在
for file in "${SOURCE_FILES[@]}"; do
    if [ ! -e "$file" ]; then
        echo "错误: 文件或目录 '$file' 不存在!"
        exit 1
    fi
done

# 创建目标目录（如果不存在）
if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
    echo "创建目录: $TARGET_DIR"
fi

# 清空目标目录（如果已有内容）
echo "清空目标目录..."
rm -rf "${TARGET_DIR:?}/"*

# 复制文件到目标目录
echo "复制文件到 ${TARGET_DIR}..."
for file in "${SOURCE_FILES[@]}"; do
    cp -r "$file" "$TARGET_DIR/"
    echo "已复制: $file"
done

# 压缩目录
echo "正在压缩 ${TARGET_DIR} 为 ${ARCHIVE_NAME}..."
if command -v zip &> /dev/null; then
    zip -r "$ARCHIVE_NAME" "$TARGET_DIR"
    echo "压缩完成! 创建了 ${ARCHIVE_NAME}"
else
    echo "错误: 未找到 zip 命令，请安装 zip 工具"
    exit 1
fi

# 可选: 删除临时目录（取消注释以下行来启用）
# echo "清理临时文件..."
# rm -rf "$TARGET_DIR"

echo "操作完成!"