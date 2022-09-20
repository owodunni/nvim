# README
How to setup [Neovim](https://neovim.io/)

## Setup
My nvim config is based on the following tutorial series [Neovim from scratch](https://youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)

Clone repository:
```
git clone git@github.com:owodunni/nvim.git ~/.config/nvim
```

Install packages:

```
sudo pacman -S --needed - < pkglist.txt
```

### LSP

*Javascript*
Install the following

```
npm i -g prettier eslint eslint-plugin-vue yaml-language-server tree-sitter-phpdoc neovim vls
```

```
pip install flake8 black
```

To find LSP servers for different languages run `:LSPInstallInfo` also look at [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

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

## Popupmenu

The popup menu is useful for autocompletions.

Here are some useful shortcuts:

```
Ctrl+N/Ctrl+P - open popup menu and cycle through menu
```

```
Ctrl+Y/Ctrl+E - accept/cancel menu
```

[More info](https://newbedev.com/select-an-item-in-vim-autocomplete-list-without-inserting-line-break)
