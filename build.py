import os
import shutil
import zipfile
from pathlib import Path
#by deepseek
def create_daily_sign():
    # 获取当前工作目录
    current_dir = Path.cwd()
    
    # 定义相关文件和文件夹路径
    data_dir = current_dir / "data"
    pack_file = current_dir / "pack.mcmeta"
    daily_sign_dir = current_dir / "DailySign"
    zip_file = current_dir / "DailySign.zip"
    
    # 检查必要的文件和文件夹是否存在
    if not data_dir.exists() or not data_dir.is_dir():
        print("错误: 未找到 data 文件夹")
        return False
        
    if not pack_file.exists() or not pack_file.is_file():
        print("错误: 未找到 pack.mcmeta 文件")
        return False
    
    # 如果DailySign文件夹已存在，先删除它
    if daily_sign_dir.exists():
        print("发现已存在的 DailySign 文件夹，正在删除...")
        shutil.rmtree(daily_sign_dir)
    
    # 创建DailySign文件夹
    try:
        daily_sign_dir.mkdir()
        print("创建 DailySign 文件夹成功")
    except Exception as e:
        print(f"创建 DailySign 文件夹失败: {e}")
        return False
    
    # 复制data文件夹到DailySign中
    try:
        shutil.copytree(data_dir, daily_sign_dir / "data")
        print("复制 data 文件夹成功")
    except Exception as e:
        print(f"复制 data 文件夹失败: {e}")
        return False
    
    # 复制pack.mcmeta文件到DailySign中
    try:
        shutil.copy2(pack_file, daily_sign_dir / "pack.mcmeta")
        print("复制 pack.mcmeta 文件成功")
    except Exception as e:
        print(f"复制 pack.mcmeta 文件失败: {e}")
        return False
    
    # 如果已存在同名的zip文件，先删除它
    if zip_file.exists():
        try:
            zip_file.unlink()
            print("删除已存在的 DailySign.zip 文件")
        except Exception as e:
            print(f"删除已存在的 DailySign.zip 文件失败: {e}")
            return False
    
    # 创建zip压缩文件
    try:
        with zipfile.ZipFile(zip_file, 'w', zipfile.ZIP_DEFLATED) as zipf:
            for root, dirs, files in os.walk(daily_sign_dir):
                for file in files:
                    file_path = os.path.join(root, file)
                    # 在zip文件中创建相对路径
                    arcname = os.path.relpath(file_path, current_dir)
                    zipf.write(file_path, arcname)
        print("创建 DailySign.zip 压缩文件成功")
    except Exception as e:
        print(f"创建压缩文件失败: {e}")
        return False
    
    # 清理：删除DailySign文件夹（可选，取消注释下一行来启用）
    shutil.rmtree(daily_sign_dir)
    print("清理临时文件完成")
    
    print("操作完成！")
    return True

if __name__ == "__main__":
    create_daily_sign()