" ### GLOBAL SETTINGS" ########################################################
" #
" encoding
scriptencoding utf-8
set encoding=utf-8

" general
set shortmess=at
set noai
set number
set ruler

" disable the mouse
set mouse=

" defaults
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
"set autoindent

" enable folding
set foldmethod=indent
set foldnestmax=3
set foldlevel=99

" encodings
set encoding=utf-8

" allow syntax highlighting
syntax enable

" whitespace chars
" centos7 vim kicks up a stink about listchars is unknown whereas its happy
" with the shorthand so we'll run with that for everything and patch-7.4.x 
" doesn't work for >= 7.4?
if ("patch-7.4.710")
  set lcs=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
else
  set lcs=eol:¬,tab:>·,trail:~,extends:>,precedes:<
endif

" wasn't active for v8.2 so activate the line, be nice if we could alias this
if (v:version > 704)
  set lcs=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
endif

" disable no printable char display, toggle with ctrl-p
set nolist

" always display the status line
set laststatus=2

" swap files
set swapfile
set dir=~/.vim/swapfiles/

" ### LOOK ###################################################################
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" disabled see: https://github.com/altercation/vim-colors-solarized/issues/218
"colorscheme solarized8

" ### KEYBOARD ###############################################################
" #
" toggle paste mode
set pastetoggle=<F3>

"enable folding with spacebar
nnoremap <space> za

" split navigation
nnoremap <C-J> <C-W><C-J> " CTRL-J
nnoremap <C-K> <C-W><C-K> " CTRL-K
nnoremap <C-L> <C-W><C-L> " CTRL-L
nnoremap <C-H> <C-W><C-H> " CTRL-H

nnoremap <C-G> :hsplit ~/.vim/docs/vim-cheat-sheet<CR>
nnoremap <C-P> :set list!<CR>

" system clipboard
set clipboard=unnamed

" lowlight after 80c
" 80cols (79 really) from
" https://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
highlight OverLength ctermbg=black ctermfg=darkgrey guibg=#592929
match OverLength /\%80v.\+/

" catch unecessary whitespace
au BufNewFile, BufRead *.c,*.h 
 \ match BadWhitespace /\s\+$/

" ### PYTHON #################################################################
" #
" enable syntax highlighting
let python_highlight_all=1

" PEP8 conformance
au BufNewFile, BufRead *.{py,pyw}
 \ set filetype=py
 \ set tabstop=4
 \ set softtabstop=4
 \ set shiftwidth=4
 \ set textwidth=79
 \ set expandtab
 \ set autoindent
 \ set fileformat=unix
 \ match BadWhitespace /\s\+$/


" ### WEB ####################################################################
" #
" full stack
au BufNewFile, BufRead *.{js,html,css}
 \ set tabstop=2
 \ set softtabstop=2
 \ set shiftwidth=2
 \ set expandtab
 \ set autoindent
 \ match BadWhitespace /\s\+$/


" ### YAML ###################################################################
" #
"
au BufNewFile, BufRead *.{yml,yaml} 
 \ set filetype=yaml 
 \ set tabstop=2
 \ set softtabstop=2
 \ set shiftwidth=2
 \ set expandtab
 \ set autoindent
 \ set fileformat=unix
 \ set foldmethod=indent
 \ match BadWhitespace /\s\+$/

" ### MARKDOWN ###############################################################
" #

au BufNewFile,BufFilePre,BufRead *.{md,markdown,mdown,mkd,mkdn,mdwn}
 \ set filetype=markdown


" ### VUNDLE #################################################################
" #
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'preservim/nerdtree'            " https://catonmat.net/vim-plugins-nerdtree-vim
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'pearofducks/ansible-vim'       " https://github.com/pearofducks/ansible-vim 
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ### PLUGINS" ################################################################
" #
" ## NERDTree - 
" open by default
" autocmd StdinReadPre * let s:std_in=1
" open NT if no files are specified
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" don't open if this a saved session
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
" open on a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" close nerdtree with last file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open with ctrl-n
map <C-n> :NERDTreeToggle<CR>
