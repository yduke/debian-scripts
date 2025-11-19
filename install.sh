#!/bin/bash

# ================================
# Debian Scripts Installer
# 安装 update 命令至 /usr/local/bin
# ================================

UPDATE_URL="https://raw.githubusercontent.com/yduke/debian-scripts/main/update"

TARGET="/usr/local/bin/update"

# 检查是否为 root
if [ "$EUID" -ne 0 ]; then
    echo "需要 root 权限，正在使用 sudo..."
    exec sudo bash "$0" "$@"
fi

echo "=============================="
echo "   安装 update 系统维护工具"
echo "=============================="
echo

# 检查 curl
if ! command -v curl >/dev/null 2>&1; then
    echo "未检测到 curl，正在安装..."
    apt update -y && apt install -y curl
fi

# 创建目录（如不存在）
mkdir -p /usr/local/bin

echo "下载 update 脚本..."
curl -fsSL "$UPDATE_URL" -o "$TARGET"

if [ $? -ne 0 ]; then
    echo "错误：无法下载 update 脚本，请检查 URL 是否正确。"
    exit 1
fi

# 赋予执行权限
chmod +x "$TARGET"

echo
echo "==============================================="
echo " 安装完成！现在可以直接运行："
echo
echo " update"
echo
echo " 脚本位置：$TARGET"
echo "==============================================="
