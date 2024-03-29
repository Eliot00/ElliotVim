{ pkgs, ... }:

{
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
      rev = "2cb5dcfc10bf40e04b5946561cad80bad0ebebed";
      sha256 = "hvrvnCdpG6wI1yHHhQfXwEqwVbojZMqNPEM+qdPAI6I=";
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
  LeaderF = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LeaderF";
    version = "2023-07-11";
    src = pkgs.fetchFromGitHub {
      owner = "Yggdroot";
      repo = "LeaderF";
      rev = "49af82180b22c3c2ff8d9d1e82a7ab1486cd052b";
      sha256 = "zUWSwgbAvzlL/nGfEjLAQ9BtxWITBxtu17e2vqUfmJI=";
    };
    meta.homepage = "https://github.com/Yggdroot/LeaderF/";
  };
}
