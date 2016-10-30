execute pathogen#infect()
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

"indent settings
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

set nofoldenable    " disable folding

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set rtp+=$GOROOT/misc/vim

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

" highlight search results
set hlsearch
nmap ,n :nohlsearch<cr>

"Save file after focus lost
:au FocusLost * :wa
:au BufLeave * :wa
set autowriteall
" TODO: autowrite on exit from editing mode
set hidden " do not lose undo history when switching

" Open all buffers in tabs
:map ,sb :tab sball<CR>

" Tab navigation
:nmap 11 1gt
:nmap 22 2gt
:nmap 33 3gt
:nmap 44 4gt
:nmap 55 5gt
:nmap 66 6gt
:nmap 77 7gt
:nmap 88 8gt
:nmap 99 9gt

" remove menu
set guioptions-=T

colorscheme railscasts

if has("gui_running")
  set guifont=Ubuntu\ Mono\ 15
endif

" autoread updatred files
set autoread

set number

" sudo apt-get install ncurses-term
if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
  set mouse=i
else    
endif 


" highlight long lines
:nmap ,wh :match ErrorMsg '\%>79v.\+'<CR>
" remove highlight
:nmap ,WH :match ErrorMsg ''<CR>

:nmap ,b :BufExplorer<CR>

" Search file
:nmap ,f :e **/*

" Open current file dir
function! FindFile(path, file)
  execute ":e ".a:path
  execute ":0"
  execute "/^".a:file
endfunction
":nmap ,p :call FindFile(expand("%:p:h"), expand("%:t"))<CR>
:nmap ,p :NERDTreeFind<CR>
:nmap ,P :NERDTreeClose<CR>

:nmap ,s /\s\+$

" No auto reloading
" If you don't like automatic reloading because it slows Vim down or causes
" problems you can add the following line to your vimrc script:
let g:reload_on_write = 0

" No session autload
let g:session_autoload = 'no'

" TODO: ignore .git
function! OpenRecent()
  for i in split(system("list_new_files"))
    execute ":e ".i
  endfor
endfunction
:nmap ,r :call OpenRecent()<CR>


" Dictionaries
autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict
autocmd FileType html set dictionary=~/.vim/dict/html.dict
autocmd FileType css set dictionary=~/.vim/dict/css.dict
autocmd FileType ruby set dictionary=~/.vim/dict/ruby.dict

if version >= 700
  set history=64
  set undolevels=128
  set undodir=~/.vim_undo/
  set undofile
  set undolevels=1000
  set undoreload=10000
endif

function ModeChange()
  if getline(1) =~ "^#!"
    if getline(1) =~ "bin/"
      silent !chmod a+x <afile>
    endif
  endif
endfunction
au BufWritePost * call ModeChange()


nmap <F8> :TagbarToggle<CR>

" Return to last edit position when opening files (You want this!)
 autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

:nmap <C-p> :FZF<CR>

set backspace=indent,eol,start

" :nmap  !ripper-tags -R --exclude=vendor
set ruler

:command A :OpenAlternate

" Run test
:nmap <C-t> :VroomRunNearestTest<CR>
:nmap ,t :VroomRunLastTest<CR>
:let g:vroom_use_spring = 1
:command SpringOn :let g:vroom_use_spring = 1
:command SpringOff :let g:vroom_use_spring = 0

:command GemTagsInstall :! gem install gem-ctags; gem ctags
set tags=./tags,tags
:command CtagsUpdate :! ctags -f tags -R lib -R app 
