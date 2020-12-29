# nvim
How to setup [Neovim](https://neovim.io/)

## Setup

Clone repository:
```
git clone git@github.com:owodunni/nvim.git ~/.config/nvim
```

Symbolic link init.vim to ~/.config/init.vim

### Windows
Getting started on [Windows](https://jdhao.github.io/2018/11/15/neovim_configuration_windows/)


## Tutorials

Great nvim [tutorials.](https://www.gilesorr.com/blog/vim-tips-intro.html)

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

## Golang
I followed the following guide to setup [Golang](https://medium.com/@goelankit/setting-up-neovim-for-golang-on-ubuntu-18-04-aa3cc2f088f7) with some modifications.

For Go I also set up [delve](https://github.com/derekparker/delve/blob/master/Documentation/cli/README.md)
as debugger.

## fzf + ripgrep
FzF and ripgrep promise increased productivity.

Articles
* [How FZF abd repgrep improved my workflow](https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861)
* [Optimizing your workflow with fzf and ripgrep](https://dev.to/hayden/optimizing-your-workflow-with-fzf-ripgrep-2eai)
* [ripgrep + FZF + vim = super vim](https://praveendhawan.hashnode.dev/ripgrep-fzf-vim-super-vim-473e8607ff90)

Install:
* [fzf](https://github.com/junegunn/fzf)
* [ripgrep](https://github.com/BurntSushi)
*
# Vim cheat sheet

## Moving in file:
* `<c-o>` and `<c-i>` moves back and forward from once you came. Usefull after searching.

## Search and replace:

To change every occurrence of a character string between two lines, type
~~~ cmd
     :#,#s/old/new/g
~~~
where #,# are the line numbers of the range of lines where the substitution is to be done.

Type
~~~ cmd
    :%s/old/new/g
~~~
to change every occurrence in the whole file.

Type
~~~ cmd
    :%s/old/new/gc
~~~
to find every occurrence in the whole file, with a prompt whether to substitute or not.

## External command

To execute a external command
```
:!cmd
```

To execute a external command and paste the result in current doc:
```
:r !cmd
```
