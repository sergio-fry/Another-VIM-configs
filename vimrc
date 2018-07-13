call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf'
Plug 'scrooloose/nerdtree'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'ekalinin/dockerfile.vim'
call plug#end()


set path+=**
set wildmenu

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

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"indent settings
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

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

" remove menu
set guioptions-=T

colorscheme xoria256

" autoread updated files
set autoread
set number

" sudo apt-get install ncurses-term
if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
  set mouse=i
else    
endif 

:nmap ,b :BufExplorer<CR>

:nmap ,p :NERDTreeFind<CR>
:nmap ,P :NERDTreeClose<CR>

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


" Fuzzy file search
:nmap <C-p> :FZF<CR>

" Find current word in files
nmap <C-k> :Ack "<cword>"<CR>

set backspace=indent,eol,start


" Run a given vim command on the results of alt from a given path.
" See usage below.
function! OpenAlternate(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

:command A :call OpenAlternate(expand('%'), ':e')

" Run test
:nmap ,T :VroomRunTestFile<CR>
:nmap ,t :VroomRunNearestTest<CR>
:nmap <C-t> :VroomRunLastTest<CR>
:let g:vroom_use_spring = 1
:command SpringOn :let g:vroom_use_spring = 1
:command SpringOff :let g:vroom_use_spring = 0


" TODO
"
" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
" set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back

" set tags=./tags,tags
:command CtagsUpdate :! ctags --language-force=ruby --fields=+l -f tags -R *
:command CtagsUpdateAll :! ctags --fields=+l -f tags -R lib -R app -R test -R spec -R vendor -R .bundle
set complete-=i

" GitGutter config
let g:gitgutter_signs = 1
let g:gitgutter_sign_column_always = 1
let g:gitgutter_highlight_lines = 0
nmap ]g <Plug>GitGutterNextHunk
nmap [g <Plug>GitGutterPrevHunk


