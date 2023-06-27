# Opt 05 - Vim Modifications
If you love Vim and would rather use that over VSCode, here are some modifications that you might be interested in. 

## Syntax Highlighting With Vim Polyglot:
Without some type of syntax highlighting, file displayed in Vim will simply be all white text. This can be stressful on the eyes. 

One way to alleviate this is to use vim-polyglot.
vim-polyglot: https://github.com/sheerun/vim-polyglot

It requires Vim Plug:

https://github.com/junegunn/vim-plug

So we will need to install plug, install vim-polyglot, and configure it for Vim.

> Note: The directions below assume that Vim has not been configured at all. If you already have Vim configured. you may not need all of the directions listed.

1. Install Plug
https://github.com/junegunn/vim-plug
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

2. Install vim-polyglot by modifying .vimrc

If you don't have a .vimrc file, create one in your home directory:

```bash
set nocompatible

call plug#begin()

Plug 'sheerun/vim-polyglot'

call plug#end()
```

3. Install the plugin within Vim
`:PlugInstall vim-polyglot`

4. Reload the .vimrc file
`:vs ~/.vimrc`

## Syntax Highlighting With HashiVim:
https://github.com/hashivim

For example, vim-vaultproject or vim-hashicorp-tools (which has multiple HashiVim tools combined)

You can install these as typical Vim packages or with vim-pathogen: https://github.com/tpope/vim-pathogen

## More Vim modifications.

You might also wish to add the following to your .vimrc file:

`set number` adds line numbers to files opened with Vim.

`:color <colorscheme>` replace colorscheme with your favorite color, for example: desert, ron, zellner, etc. For a list of colorschemes, do the following:

In Vim, type `:color` then <kbd>Space</kbd> followed by <kbd>Ctrl+D</kdb>

