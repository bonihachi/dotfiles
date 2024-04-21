# dotfiles

## About

Out of the box configurations for the following applications:  
- Alacritty
- Neovim
- fish
- tmux
- Visual Studio Code

## Installation

### Linux/Mac

```bash
$ cd dotfiles
$ ./Install.sh
```

### Windows

```cmd
> cd dotfiles
> mklink %USERPROFILE%/AppData/Local/nvim .config/nvim
> mklink %USERPROFILE%/AppData/Roaming/Code/User/keybindings.json .config/Code/User/keybindings
```