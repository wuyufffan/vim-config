"""
测试 install.sh 安装脚本基本行为
"""
import os
import subprocess
from pathlib import Path

INSTALL_SH = Path(__file__).resolve().parents[1] / "install.sh"


def _run(args: list, env: dict = None) -> subprocess.CompletedProcess:
    return subprocess.run(
        ["bash", str(INSTALL_SH)] + args,
        cwd=INSTALL_SH.parent,
        capture_output=True,
        text=True,
        env={**os.environ, **(env or {})},
    )


def test_install_sh_exists():
    """install.sh 应存在且可执行"""
    assert INSTALL_SH.exists()
    assert os.access(INSTALL_SH, os.X_OK)


def test_install_creates_vimrc_symlink(tmp_path):
    """安装后 ~/.vimrc 应为指向仓库 .vimrc 的符号链接"""
    env = {**os.environ, "HOME": str(tmp_path)}
    result = _run([], env=env)
    assert result.returncode == 0, f"install.sh 失败:\n{result.stderr}"
    vimrc = tmp_path / ".vimrc"
    assert vimrc.is_symlink(), "~/.vimrc 应为符号链接"
    assert vimrc.resolve() == (INSTALL_SH.parent / ".vimrc").resolve()


def test_install_creates_vim_dir(tmp_path):
    """安装后 ~/.vim 目录应存在"""
    env = {**os.environ, "HOME": str(tmp_path)}
    _run([], env=env)
    assert (tmp_path / ".vim").is_dir(), "~/.vim 目录应被创建"


def test_install_backs_up_existing_vimrc(tmp_path):
    """存在旧 .vimrc 时应创建备份"""
    existing = tmp_path / ".vimrc"
    existing.write_text("old config")
    env = {**os.environ, "HOME": str(tmp_path)}
    result = _run([], env=env)
    assert result.returncode == 0
    # 备份目录 .config_backup_* 应存在
    backups = list(tmp_path.glob(".config_backup_*"))
    assert len(backups) > 0, "应创建备份目录"
    backup_vimrc = backups[0] / ".vimrc"
    assert backup_vimrc.exists(), "旧 .vimrc 应被备份"


def test_install_succeeds_without_existing_vimrc(tmp_path):
    """~/.vimrc 不存在时安装应正常完成"""
    env = {**os.environ, "HOME": str(tmp_path)}
    result = _run([], env=env)
    assert result.returncode == 0
    # 无备份目录
    backups = list(tmp_path.glob(".config_backup_*"))
    assert len(backups) == 0, "无旧文件时不应创建备份"
