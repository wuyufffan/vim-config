#!/bin/bash
#
# vim-config 安装脚本
#

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

print_info() {
    echo -e "${BLUE}[信息]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[成功]${NC} $1"
}

print_error() {
    echo -e "${RED}[错误]${NC} $1"
}

# 检查 Vim 版本
print_info "检查 Vim 版本..."
if ! command -v vim &> /dev/null; then
    print_error "Vim 未安装"
    exit 1
fi

VIM_VERSION=$(vim --version | head -1 | grep -oP '\d+\.\d+' | head -1)
print_success "Vim 版本: $VIM_VERSION"

# 备份现有的 .vimrc（如果存在）
if [ -f "$HOME/.vimrc" ]; then
    print_info "备份现有的 .vimrc 到 $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    cp "$HOME/.vimrc" "$BACKUP_DIR/"
    print_success "备份已创建"
fi

# 创建软链接
print_info "创建 .vimrc 软链接"
ln -sf "$REPO_DIR/.vimrc" "$HOME/.vimrc"
print_success ".vimrc 链接已创建"

# 创建 .vim 目录
mkdir -p "$HOME/.vim"

echo ""
echo "=================================================="
echo -e "${GREEN}✅ vim-config 安装成功${NC}"
echo "=================================================="
echo ""
echo "后续步骤："
echo "  1. 打开 Vim: vim"
echo "  2. 安装插件: :PlugInstall"
echo ""
echo "备份保存在：$BACKUP_DIR"
