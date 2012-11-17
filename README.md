# Velocity for Vim

Velocity bundle for vim.


## Feature

1. full syntax support
2. great indent support (by [shepherdwind](https://github.com/shepherdwind))

## Installation

### Install with [Vundle](https://github.com/gmarik/vundle)

If you are not using vundle, you really should have a try.
Edit your vimrc:

    Bundle "lepture/vim-velocity"

And install it:

    :so ~/.vimrc
    :BundleInstall


### Install with [pathogen](https://github.com/tpope/vim-pathogen)

If you prefer tpope's pathogen, that's ok. Just clone it:

    cd ~/.vim/bundle
    git clone https://github.com/lepture/vim-velocity.git


## Configuration

No configuration is needed, if you are using vim 7.2+, it will detect if
a html file is a velocity template.

But if you want to ensure it works well, you can edit your vimrc:

```vim
au BufNewFile,BufRead *.vm,*.html,*.htm,*.shtml,*.stm set ft=velocity
```


## Bug report

Report a bug on [GitHub Issues](https://github.com/lepture/vim-velocity/issues).
