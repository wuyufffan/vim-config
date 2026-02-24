# vim-config

个人 Vim 配置文件，包含 gruvbox 主题和 JKLI 键位布局。

## 特性

- 🎨 Gruvbox 配色主题
- ⌨️ JKLI 键位布局（Vim 风格方向键）
- 🔌 vim-plug 插件管理器
- ⚡ 针对编码优化

## 安装

### 独立安装

```bash
git clone https://github.com/wuyufffan/vim-config.git
cd vim-config
./install.sh
```

### 作为 my_linux_config 的一部分安装

```bash
cd ~/my_linux_config
./install.sh --with-vim
```

## JKLI 键位布局

| 按键 | 功能 | 说明 |
|------|------|------|
| `j` | 向左 (←) | 原 `h` 键 |
| `k` | 向下 (↓) | 原 `j` 键 |
| `i` | 向上 (↑) | 原 `k` 键 |
| `h` | 插入模式 | 原 `i` 键 |
| `J` | 向左移动 5 个字符 | 快速移动 |
| `K` | 向下移动 7 行 | 快速移动 |
| `I` | 向上移动 7 行 | 快速移动 |
| `L` | 向右移动 5 个字符 | 快速移动 |
| `Y` | 行首 | 快速定位 |
| `U` | 行尾 | 快速定位 |
| `H` | 在行首插入 | 快速插入 |
| `S` | 保存文件 | `:w` |
| `Q` | 保存并退出 | `:wq!` |
| `q` | 强制退出 | `:q!` |
| `;` | 进入命令模式 | 原 `:` |

## 基础设置

- 开启语法高亮
- 显示行号
- 显示光标位置
- 高亮搜索结果
- 实时搜索
- 自动缩进
- Tab = 4 空格
- 编码 UTF-8
- 开启鼠标支持
- 总是显示状态栏

## 结构

```
vim-config/
├── .vimrc           # 主配置文件
├── install.sh       # 安装脚本
└── README.md        # 本文档
```

## 许可证

MIT License
