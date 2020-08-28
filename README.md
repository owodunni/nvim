# nvim

## Setup

Clone repository:
```
git clone git@github.com:owodunni/nvim.git ~/.config/nvim
```

Symbolic link init.vim to ~/.config/init.vim

### Windows
Getting started on [Windows](https://jdhao.github.io/2018/11/15/neovim_configuration_windows/)

## Plugins

Install [vim-plug](https://github.com/junegunn/vim-plug):
```
 curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install plugins:
```
:PlugInstall
:UpdateRemotePlugins
:q!
```

## Python
I followed the following guide for setting up [Python.](https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/)

* <leader>d: go to definition
* K: check documentation of class or method
* <leader>n: show the usage of a name in current file
* <leader>r: rename a name
