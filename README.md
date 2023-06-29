Elliot's personal vim config

## Usage

1. Clone

```shell
git clone --recursive https://github.com/Eliot00/ElliotVim ~/.vim
```

2. Install language server

Open vim and use `:CocInstall coc-pyright`, see detail in [coc.nvim](https://github.com/neoclide/coc.nvim)

## Plugin Manage(Native way)

### Add plugins

Use `git submodule`, like `git submodule add https://github.com/zivyangll/git-blame.vim packe/plugins/start/git-blame`

### Update plugins

Update plugins is just a case of updating git submodule:

```shell
git submodule update --recursive --remote
```

### Delete Plugins

Removing a package is just a case of removing the git submodule.

```shell
git submodule deinit pack/plugins/start/vim-airline
git rm pack/plugins/start/vim-airline
rm -rf .git/modules/pack/plugins/start/vim-airline
```

