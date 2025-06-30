#!/bin/sh

set -e

# 所有需要下载的文件及其 URL
FILES=(
  "docker-compose.yml"
  "Dockerfile"
  "entrypoint.sh"
  "fix-permissions.sh"
  "nginx.conf"
  "start.sh"
)

BASE_URL="https://getindex.netlify.app/nginx"

# 下载所有文件
for file in "${FILES[@]}"; do
  echo "正在下载 $file ..."
  wget -q --show-progress "${BASE_URL}/${file}" -O "$file"
done

# 检查所有文件是否存在且非空
for file in "${FILES[@]}"; do
  if [ ! -s "$file" ]; then
    echo "❌ 文件 $file 下载失败或为空！"
    exit 1
  fi
done

# 如果全部成功，执行你的逻辑
do_start() {
  echo "✅ 所有文件下载成功，开始部署本地nginx文件服务器..."
  sh start.sh
}

do_start
