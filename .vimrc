" ====================================================================
" Vim 配置文件 - vim-config
" my_linux_config 生态系统的一部分
" https://github.com/wuyufffan/vim-config
" ====================================================================

" ====================================================================
" 1. 插件管理 (vim-plug)
" ====================================================================
" 自动安装 vim-plug（如果尚未安装）
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" 主题插件
Plug 'morhetz/gruvbox'

call plug#end()

" ====================================================================
" 2. 基础设置
" ====================================================================
syntax on                   " 开启语法高亮
set number                  " 显示行号
set ruler                   " 显示光标位置
set hlsearch                " 高亮搜索结果
set incsearch               " 实时搜索
set autoindent              " 自动缩进
set tabstop=4               " Tab 等于 4 个空格
set shiftwidth=4            " 缩进宽度为 4
set expandtab               " Tab 转换为空格
set backspace=indent,eol,start " 增强退格键功能
set encoding=utf-8          " 设置编码为 UTF-8
set fileencodings=utf-8,gbk,latin1 " 文件编码检测顺序
set mouse=a                 " 开启鼠标支持
set laststatus=2            " 总是显示状态栏

" 主题设置（带容错处理，防止首次启动插件未安装时报错）
set background=dark
try
    colorscheme gruvbox
catch
    colorscheme default
endtry

" ====================================================================
" 3. 键位映射（JKLI 布局）
" ====================================================================

" --- 禁用方向键（强制使用快捷键） ---
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" --- 保存与退出 ---
noremap S :w<CR>        " S 保存文件
noremap Q :wq!<CR>      " Q 保存并退出
noremap q :q!<CR>        " q 强制退出（不保存）

" --- JKLI 核心移动（魔改版） ---
" j -> 向左（原 h）
" k -> 向下（原 j）
" i -> 向上（原 k）
" h -> 插入（原 i）
noremap j h
noremap k j
noremap i k
noremap h i

" --- 快速移动 ---
noremap I 7k            " I 向上移动 7 行
noremap K 7j            " K 向下移动 7 行
noremap J 5h            " J 向左移动 5 个字符
noremap L 5l            " L 向右移动 5 个字符

" --- 行首行尾与插入 ---
noremap Y 0             " Y 跳到行首
noremap U $             " U 跳到行尾
noremap H I             " H 在行首插入

" --- 命令模式映射 ---
noremap ; :             " 分号进入命令模式

" --- 工具键 ---
" <leader> + 回车 取消高亮（默认 leader 为 \）
noremap <LEADER><CR> :nohlsearch<CR>
