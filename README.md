Elliot's personal vim config

## Usage

1. Clone

```shell
git clone --recursive https://github.com/Eliot00/ElliotVim ~/.vim
ln -s ~/.vim/init.vim ~/.vimrc
```

2. Create swap folder

```shell
cd ~
mkdir .vimswap
```

If you don't want this, just delete `set directory=$HOME/.vimswap//` in init.vim.

3. Install language server

Open vim and use `:CocInstall coc-pyright`, see detail in [coc.nvim](https://github.com/neoclide/coc.nvim)

