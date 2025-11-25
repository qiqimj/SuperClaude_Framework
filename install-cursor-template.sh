#!/bin/bash
# Cursor 模板一键安装脚本

set -e

# 颜色输出
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Cursor 模板安装工具 ===${NC}\n"

# 获取目标目录
if [ -z "$1" ]; then
    echo -e "${RED}错误: 请指定目标项目目录${NC}"
    echo ""
    echo "用法:"
    echo "  $0 /path/to/your-project"
    echo ""
    echo "示例:"
    echo "  $0 ~/projects/my-app"
    echo "  $0 ."
    exit 1
fi

TARGET_DIR="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 检查目标目录
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${RED}错误: 目录不存在: $TARGET_DIR${NC}"
    exit 1
fi

# 转换为绝对路径
TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"

echo -e "${GREEN}✓${NC} 目标目录: $TARGET_DIR"

# 检查是否已存在 .cursorrules
if [ -f "$TARGET_DIR/.cursorrules" ]; then
    echo -e "${RED}⚠${NC}  检测到已存在 .cursorrules 文件"
    read -p "是否覆盖? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "取消安装"
        exit 0
    fi
    mv "$TARGET_DIR/.cursorrules" "$TARGET_DIR/.cursorrules.backup"
    echo -e "${GREEN}✓${NC} 已备份为 .cursorrules.backup"
fi

# 复制模板
cp "$SCRIPT_DIR/.cursorrules.template" "$TARGET_DIR/.cursorrules"

echo -e "${GREEN}✓${NC} 已复制模板到 $TARGET_DIR/.cursorrules"
echo ""
echo -e "${BLUE}下一步:${NC}"
echo "1. 用编辑器打开: $TARGET_DIR/.cursorrules"
echo "2. 搜索 [CUSTOMIZE] 并填写你的项目信息"
echo "3. 保存文件"
echo ""
echo -e "${GREEN}完成！Cursor 会自动读取 .cursorrules 文件${NC}"
