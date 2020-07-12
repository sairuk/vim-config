# vimrc
.vimrc
.vim

## notes
vundle bundles are now git submodules, vindle included as a submodule for future functionality

## install

1. clone the repo

git 1.7
```
git clone https://github.com/sairuk/vim-config.git
git submodule init
git submodule update
```

git 2.x
```
git clone --recurse-submodules https://github.com/sairuk/vim-config.git
```

2. symlink <git_repo_path>.vim to ~/.vim
3. symlink <git_repo_path>.vimrc to ~/.vimrc
