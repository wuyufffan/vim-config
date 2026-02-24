# vim-config

Personal Vim configuration with gruvbox theme and JKLI keymap layout.

## Features

- 🎨 Gruvbox color scheme
- ⌨️ JKLI keymap layout (vim-style arrow keys)
- 🔌 vim-plug plugin manager
- ⚡ Optimized for coding

## Installation

### Standalone Installation

```bash
git clone https://github.com/wuyufffan/vim-config.git
cd vim-config
./install.sh
```

### As Part of my_linux_config

```bash
cd ~/my_linux_config
./install.sh --with-vim
```

## JKLI Keymap Layout

| Key | Action |
|-----|--------|
| `j` | Left (←) |
| `k` | Down (↓) |
| `i` | Up (↑) |
| `h` | Insert mode |
| `J` | 5 chars left |
| `K` | 7 lines down |
| `I` | 7 lines up |
| `L` | 5 chars right |
| `Y` | Line start |
| `U` | Line end |
| `H` | Insert at line start |
| `S` | Save |
| `Q` | Save and quit |
| `q` | Force quit |
| `;` | Command mode |

## Structure

```
vim-config/
├── .vimrc            # Main configuration
├── install.sh        # Installation script
└── README.md         # This file
```

## License

MIT License
