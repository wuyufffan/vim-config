# vim-config

个人 Vim 配置仓库，提供主题、键位与基础编辑体验优化。

## 仓库定位

- 维护独立的 `.vimrc` 与安装脚本。
- 默认采用 `gruvbox` 风格与 JKLI 键位布局。
- 适合终端开发场景的最小可用 Vim 配置。

## 安装

### 独立安装

```bash
git clone https://github.com/wuyufffan/vim-config.git
cd vim-config
./install.sh
```

### 通过主仓安装

```bash
cd ~/my_linux_config
make install C=vim
```

## JKLI 键位（核心映射）

- `j/k/i/l`：替代传统方向移动习惯
- `h`：进入插入模式
- `;`：进入命令行模式
- `S`：保存，`Q`：保存退出，`q`：强制退出

完整映射以仓库内 `.vimrc` 为准。

## 默认编辑设置

- 语法高亮、行号、状态栏
- 搜索高亮与增量搜索
- 自动缩进、UTF-8、鼠标支持

## 许可证

MIT
