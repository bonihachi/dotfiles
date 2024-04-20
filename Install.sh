#!/usr/bin/sh

# --------------------------------------
# dotfilesのシンボリックリンクを作成する
# 引数: なし
# 戻値: なし
# 備考: なし
# --------------------------------------

SCRIPT_DIR_PATH=$(cd $(dirname $0);pwd)

ln -fs ${SCRIPT_DIR_PATH}/.config/nvim ~/.config/nvim
ln -fs ${SCRIPT_DIR_PATH}/.config/fish ~/.config/fish
ln -fs ${SCRIPT_DIR_PATH}/.config/alacritty ~/.config/alacritty
ln -fs ${SCRIPT_DIR_PATH}/.tmux.conf ~/.tmux.conf
