set shortmess=at
set noai
set number

" disable the mouse
set mouse=

" enable syntax highlighting
let python_highlight_all=1
syntax enable

" enable folding
set foldmethod=indent
set foldnestmax=3
set foldlevel=99

"enable folding with spacebar
nnoremap <space> za

" split navigation
nnoremap <C-J> <C-W><C-J> " CTRL-J
nnoremap <C-K> <C-W><C-K> " CTRL-K
nnoremap <C-L> <C-W><C-L> " CTRL-L
nnoremap <C-H> <C-W><C-H> " CTRL-H

" system clipboard
set clipboard=unnamed

" PEP8 conformance
au BufNewFile, BufRead *.py
 \ set tabstop=4
 \ set softtabstop=4
 \ set shiftwidth=4
 \ set textwidth=79
 \ set expandtab
 \ set autoindent
 \ set fileformat=unix

" full stack
au BufNewFile, BufRead *.js, *.html, *.css
 \ set tabstop=2
 \ set softtabstop=2
 \ set shiftwidth=2

" catch unecessary whitespace
au BufNewFile, BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" encodings
set encoding=utf-8

" toggle paste mode
set pastetoggle=<F3>

" VUNDLE
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



