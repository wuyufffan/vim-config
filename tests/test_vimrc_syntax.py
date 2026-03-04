"""
测试 .vimrc 语法合法性及关键配置项存在性
"""
from pathlib import Path

VIMRC = Path(__file__).resolve().parents[1] / ".vimrc"


def test_vimrc_file_exists():
    """.vimrc 文件应存在"""
    assert VIMRC.exists(), ".vimrc 文件不存在"


def test_vimrc_balanced_blocks():
    """验证 .vimrc 中的块结构（if/endif、function 等）成对出现"""
    content = VIMRC.read_text()
    lines = content.splitlines()

    pairs = [
        ("if ", "endif"),
        ("function", "endfunction"),
        ("try", "endtry"),
    ]
    for open_kw, close_kw in pairs:
        opens = sum(1 for l in lines if l.strip().lower().startswith(open_kw))
        closes = sum(1 for l in lines if l.strip().lower().startswith(close_kw))
        assert opens == closes, (
            f".vimrc 块不平衡 {open_kw}/{close_kw}: {opens} 开 vs {closes} 闭"
        )


def test_vimrc_contains_jkli_keymaps():
    """.vimrc 应包含 JKLI 键位映射（j=左 k=下 i=上 h=插入 l=右保持默认）"""
    content = VIMRC.read_text()
    assert "noremap j h" in content, "缺少 j→左 键映射"
    assert "noremap k j" in content, "缺少 k→下 键映射"
    assert "noremap i k" in content, "缺少 i→上 键映射"
    assert "noremap h i" in content, "缺少 h→插入 键映射"


def test_vimrc_sets_basic_options():
    """.vimrc 应包含基础编辑选项"""
    content = VIMRC.read_text()
    assert "set number" in content or "set nu" in content, "缺少行号设置"
    assert "set tabstop" in content or "set ts=" in content, "缺少 tabstop 设置"


def test_vimrc_has_plugin_section():
    """.vimrc 应包含 vim-plug 插件配置段"""
    content = VIMRC.read_text()
    assert "plug#begin" in content, "缺少 vim-plug 插件段"
