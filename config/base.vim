" performance
set lazyredraw
set ttyfast


if has('python3')
  silent! python3 1
endif

set path+=**
set wildmenu

set ruler

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=3

set magic

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set t_Co=256

" no swap files
"set nobackup
"set nowritebackup
set noswapfile

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

set incsearch   "find the next match as we type the search

set wrap
set linebreak   "wrap lines at convenient points
set showbreak=+++

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

"indent settings
set autoindent
set expandtab
set shiftwidth=2
set smarttab
set softtabstop=2
set tabstop=2


"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" set rtp+=$GOROOT/misc/vim

"load ftplugins and indent files
filetype plugin on
filetype indent on

" highlight search results
set hlsearch


" autoread updated files
set number

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set signcolumn=yes



" Do not reset cursor position on each buffer switching
set nostartofline




set exrc
set secure

set autowriteall
set hidden " do not lose undo history when switching

" http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
set mouse=a

set cursorline
