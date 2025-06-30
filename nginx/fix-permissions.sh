#!/bin/sh
WATCH_DIR="/usr/share/nginx/html"
echo "🔧 自动修复文件权限中..."

while true; do
  # 修复所有目录为 777（可进入）
  find "$WATCH_DIR" -type d ! -perm 777 -exec chmod 777 {} \;
  # 修复所有文件为 644（可访问）
  find "$WATCH_DIR" -type f ! -perm 644 -exec chmod 644 {} \;
  sleep 3
done
