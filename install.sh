#!/bin/bash
#
# vim-config Installation Script
#

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check Vim version
print_info "Checking Vim version..."
if ! command -v vim &> /dev/null; then
    print_error "Vim is not installed"
    exit 1
fi

VIM_VERSION=$(vim --version | head -1 | grep -oP '\d+\.\d+' | head -1)
print_success "Vim version: $VIM_VERSION"

# Backup existing .vimrc if exists
if [ -f "$HOME/.vimrc" ]; then
    print_info "Backing up existing .vimrc to $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    cp "$HOME/.vimrc" "$BACKUP_DIR/"
    print_success "Backup created"
fi

# Create symlink
print_info "Creating symlink for .vimrc"
ln -sf "$REPO_DIR/.vimrc" "$HOME/.vimrc"
print_success ".vimrc linked"

# Create .vim directory
mkdir -p "$HOME/.vim"

echo ""
echo "=================================================="
echo -e "${GREEN}✅ vim-config installed successfully${NC}"
echo "=================================================="
echo ""
echo "Next steps:"
echo "  1. Open Vim: vim"
echo "  2. Install plugins: :PlugInstall"
echo ""
echo "Backup saved to: $BACKUP_DIR"
