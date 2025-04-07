# vimrc
.vimrc
.vim

## notes
plugins git submodules, moved to built in package manager

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

## theme
* [iceberg](https://github.com/cocopon/iceberg.vim) current theme

## plugins:
* [nerdtree](https://github.com/preservim/nerdtree.git) A tree explorer plugin for navigating the filesystem (toggle Ctrl-N)
* [vimwiki](https://github.com/vimwiki/vimwiki.git) wiki w/markdown support
* [ale](https://github.com/dense-analysis/ale.git) ale replacing syntastic
* [auto-pairs](https://github.com/jiangmiao/auto-pairs) pair up things that make sense
* [indentLine](https://github.com/Yggdroot/indentLine) displays indentation
* [tagbar](https://github.com/preservim/tagbar) outline viewer
* [vim-polyglot](https://github.com/sheerun/vim-polyglot) language packs
* [csv](https://github.com/chrisbra/csv.vim) render csv format files 
* [autocomplpop](https://github.com/vim-scripts/AutoComplPop) auto complete popup menu
