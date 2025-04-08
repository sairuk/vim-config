" @@GLOBAL SETTINGS
" encoding
scriptencoding utf-8
set encoding=utf-8

" general
set shortmess=at
set noai
set ruler

" hybrid line numbers
set number relativenumber

" disable the mouse
set mouse=a

" terminal
nmap <F9> :term<CR>
set termwinsize=12x0

" split behaviour
set splitbelow

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

" search
set incsearch  " Enable incremental search
set hlsearch   " Enable highlight search

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

" always display the status line<Down>
set laststatus=2

" swap files
set noswapfile
set dir=~/.vim/swapfiles/

" spellcheck
"set spellfile

" omnicompletion
set omnifunc=syntaxcomplete#Complete
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" :"<Up>"
inoremap <expr> <Right> pumvisible() ? "<C-y>" :"<Right>"
"inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
inoremap <expr> <Left> pumvisible() ? "<C-e>" :"<Left>"


" @@LOOK
set background=dark
set termguicolors
colorscheme iceberg
set colorcolumn=80

" @@KEYBOARD
" toggle paste mode
set pastetoggle=<F4>

"enable folding with spacebar
nnoremap <leader><space> za

" split navigation
nnoremap <C-J> <C-W><C-J> " CTRL-J 
nnoremap <C-K> <C-W><C-K> " CTRL-K
nnoremap <C-L> <C-W><C-L> " CTRL-L
nnoremap <C-H> <C-W><C-H> " CTRL-H

nnoremap <nowait><silent><leader>n :new ~/.vim/docs/vim.notes<CR>
nnoremap <nowait><silent><leader>c :new ~/.vimrc<CR>

nnoremap <nowait><silent><leader>s :set spell spelllang=en_au <CR>
nnoremap <nowait><silent><leader>p :ToggleWhiteSpace<CR>
nnoremap <nowait><silent><leader><F5> :set number relativenumber<CR>
nnoremap <nowait><silent><leader><F6> :set nonumber norelativenumber<CR>
" nnoremap <F5> :set nonumber norelativenumber number<CR>
" nnoremap <F6> :set nonumber norelativenumber relativenumber<CR>
nnoremap <nowait><silent><leader><F9> :ToggleMouseMode<CR>
" reload config
"nnoremap <nowait><silent><F12> :so %<CR>

" system clipboard ????
set clipboard=unnamed

" lowlight after 80c
" 80cols (79 really) from
" https://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
highlight OverLength ctermbg=black ctermfg=white
match OverLength /\%80v.\+/

" catch unecessary whitespace
au BufNewFile, BufRead *.c,*.h 
 \ match BadWhitespace /\s\+$/

" @@@LANGUAGES
" python
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


" web full stack
au BufNewFile, BufRead *.{js,html,css}
 \ set tabstop=4
 \ set softtabstop=4
 \ set shiftwidth=4
 \ set expandtab
 \ set autoindent
 \ match BadWhitespace /\s\+$/

" yaml
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

" markdown
au BufNewFile,BufFilePre,BufRead *.{md,markdown,mdown,mkd,mkdn,mdwn}
 \ set filetype=markdown

" bin
" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.{bin,ppf} let &bin=1
  au BufReadPost *.{bin,ppf} if &bin | %!xxd
  au BufReadPost *.{bin,ppf} set ft=xxd | endif
  au BufWritePre *.{bin,ppf} if &bin | %!xxd -r
  au BufWritePre *.{bin,ppf} endif
  au BufWritePost *.{bin,ppf} if &bin | %!xxd
  au BufWritePost *.{bin,ppf} set nomod | endif
augroup END

augroup CSV
  au! BufRead,BufNewFile *.csv,*.dat	setfiletype csv
augroup END

" @@ PACKAGES
set nocompatible

" vimwiki
filetype plugin on
syntax on
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': 'md', 'path': '~/vimwiki'}]

" vim-polyglot
let g:polyglot_disabled = ['autoindent']

" autopairs
let g:AutoPairsShortcutToggle = '<C-1>'

" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus=1                       " focus the panel when opening it
let g:tagbar_autoshowtag=1                     " highlight the active tag
let g:tagbar_position = 'botright vertical'    " vertical and place on right

" indentline
nmap <C-I> :IndentLinesToggle<CR>
let g:indentLine_setColors=0
let g:indentLine_char_list=['|', '¦', '┆', '┊']

" NERDTree -
nmap <F7> :NERDTreeToggle<CR>

let NERDTreeMinimalUI=1
let NERDTreeMinimalMenu=1
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=0
let NERDTreeWinPos="left"
let NERDTreeWinSize=31
let NERDTreeFileLines=1

" open by default
" autocmd StdinReadPre * let s:std_in=1
" open NT if no files are specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" don't open if this a saved session
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
" open on a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" close nerdtree with last file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

