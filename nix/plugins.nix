{ pkgs, ... }:

let
  fern-git-status = pkgs.vimUtils.buildVimPlugin {
    name = "fern-git-status";
    src = pkgs.fetchFromGitHub {
      owner = "lambdalisue";
      repo = "fern-git-status.vim";
      rev = "151336335d3b6975153dad77e60049ca7111da8e";
      sha256 = "9N+T/MB+4hKcxoKRwY8F7iwmTsMtNmHCHiVZfcsADcc=";
    };
  };
  fern-hijack = pkgs.vimUtils.buildVimPlugin {
    name = "fern-hijack";
    src = pkgs.fetchFromGitHub {
      owner = "lambdalisue";
      repo = "fern-hijack.vim";
      rev = "5989a1ac6ddffd0fe49631826b6743b129992b32";
      sha256 = "zvTTdkyywBl0U3DdZnzIXunFTZR9eRL3fJFWjAbb7JI=";
    };
  };
  fern-renderer-nerdfont = pkgs.vimUtils.buildVimPlugin {
    name = "fern-renderer-nerdfont";
    src = pkgs.fetchFromGitHub {
      owner = "lambdalisue";
      repo = "fern-renderer-nerdfont.vim";
      rev = "1e90a78ab5510fbcedc85abeb9a251d978726935";
      sha256 = "foX/RguLMKVs0TvBcnfH9m3hkDQmfokzuESrb4iUmw8=";
    };
  };
  nerdfont = pkgs.vimUtils.buildVimPlugin {
    name = "nerdfont";
    src = pkgs.fetchFromGitHub {
      owner = "lambdalisue";
      repo = "nerdfont.vim";
      rev = "b7dec1f9798470abf9ef877d01e4415d72f792be";
      sha256 = "NYonYP54PVUwHbU+Q/D7MqhVh+IB0B17KaHtkg19PaI=";
    };
  };
  qline = pkgs.vimUtils.buildVimPlugin {
    name = "qline";
    src = pkgs.fetchFromGitHub {
      owner = "Bakudankun";
      repo = "qline.vim";
      rev = "7845c8456bb35ee83a11089f03ce52a17ced3fca";
      sha256 = "1a/b7Ccovbb9YULO7foMFn0n9taiFlcvk7yT31XZrVw=";
    };
  };
in
with pkgs.vimPlugins; [
  LeaderF
  asyncrun-vim
  asynctasks-vim
  coc-css
  coc-html
  coc-json
  coc-nvim
  coc-pyright
  coc-rust-analyzer
  coc-tsserver
  fern-git-status
  fern-hijack
  fern-renderer-nerdfont
  fern-vim
  nerdfont
  nightfox-nvim
  qline
  vim-fugitive
  vim-gitgutter
  vim-polyglot
  vim-surround
  vim9-stargate
]
