# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## ⚡️ Requirements

- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional)_**
- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)

## 🚀 Installation

- Make a backup of your current Neovim files:

  **Linux/Mac OS:**
  ```sh
  mv ~/.config/nvim ~/.config/nvim.bak
  mv ~/.local/share/nvim ~/.local/share/nvim.bak
  ```

  **Windows:**
  ```sh
  mv $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
  mv $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
  ```

- Clone the repo

  **Linux/Mac OS**
  ```sh
  git clone https://github.com/Guilherme-Santos08/lazy-dzscript-vim ~/.config/nvim
  ```

  **Windows:**
  ```sh
  git clone https://github.com/Guilherme-Santos08/lazy-dzscript-vim $env:LOCALAPPDATA\nvim
  ```