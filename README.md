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

## plugins:
* [Nerdtree](https://www.vim.org/scripts/script.php?script_id=1658) A tree explorer plugin for navigating the filesystem (toggle Ctrl-N)
* [Syntastic](https://www.vim.org/scripts/script.php?script_id=2736) Automatic syntax checking (always)
* [Flake8](https://www.vim.org/scripts/script.php?script_id=3927) vim-flake8 is a Vim plugin that runs the currently open file through Flake8. (always)
* [Fugitive](https://www.vim.org/scripts/script.php?script_id=2975) A Git wrapper so awesome, it should be illegal (G: arbitrary git commands)
* [Ansible](https://www.vim.org/scripts/script.php?script_id=5246) Syntax highlighting Ansible's common filetypes