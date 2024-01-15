# nvim
Neovim configuration

## Installation

If you don't have Packer installed, run the command below to install it.

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

```bash
git clone https://github.com/bonihachi/nvim
```

### Linux

Create a symbolic link to the local repository, named nvim, in ~/.config/nvim (Linux) or ~/AppData/Local (Windows)

```bash
ln -s ~/path/to/nvim/repository ~/.config/nvim
```

### Windows

```powershell
New-Item -Value ~/path/to/nvim/repository -Path ~/AppData/Local -Name nvim -ItemType SymbolicLink
```

Make sure to have the following packages to have telescope work properly:

```powershell
choco install fd
choco isntall ripgrep
```

## Coc Dependencies

If you want to use `coc-rust-analyzer`, if should have installed rust-analyzer using the command below.

### Via rustup

```zsh
rustup component add rust-analyzer
```

### Binary

If you have a binary, you can specify the location in `coc-settings.json`

```json
{
  "rust-analyzer.serverPath": "/path/to/rust-analyzer",
}
```
