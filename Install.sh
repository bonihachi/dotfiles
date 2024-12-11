#!/usr/bin/sh

# --------------------------------------
# dotfilesのシンボリックリンクを作成する
# 引数: なし
# 戻値: なし
# 備考: なし
# --------------------------------------

SCRIPT_DIR_PATH=$(cd $(dirname $0);pwd)

ln -fns ${SCRIPT_DIR_PATH}/.config/nvim ~/.config/nvim
ln -fns ${SCRIPT_DIR_PATH}/.config/fish ~/.config/fish
ln -fns ${SCRIPT_DIR_PATH}/.config/foot ~/.config/foot
ln -fns ${SCRIPT_DIR_PATH}/.config/alacritty ~/.config/alacritty
# ln -fns ${SCRIPT_DIR_PATH}/.tmux.conf ~/.tmux.conf
ln -fns ${SCRIPT_DIR_PATH}/.config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json
