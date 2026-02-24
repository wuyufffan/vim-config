" ====================================================================
" Vim Configuration - vim-config
" Part of my_linux_config ecosystem
" https://github.com/wuyufffan/vim-config
" ====================================================================

" ====================================================================
" 1. 插件管理 (Plugins)
" ====================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" 主题
Plug 'morhetz/gruvbox'

call plug#end()

" ====================================================================
" 2. 基础设置 (Basic Settings)
" ====================================================================
syntax on
set number
set ruler
set hlsearch
set incsearch
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set encoding=utf-8
set fileencodings=utf-8,gbk,latin1
set mouse=a
set laststatus=2

" 主题设置
set background=dark
try
    colorscheme gruvbox
catch
    colorscheme default
endtry

" ====================================================================
" 3. 键位映射 (Keymaps - JKLI 布局)
" ====================================================================

" 禁用方向键
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" 保存与退出
noremap S :w<CR>
noremap Q :wq!<CR>
noremap q :q!<CR>

" JKLI 核心移动
noremap j h
noremap k j
noremap i k
noremap h i

" 快速移动
noremap I 7k
noremap K 7j
noremap J 5h
noremap L 5l

" 行首行尾与插入
noremap Y 0
noremap U $
noremap H I

" 命令模式映射
noremap ; :

" 取消高亮
noremap <LEADER><CR> :nohlsearch<CR>
