" Should be on very top
execute pathogen#infect()

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
" nmap ,n :nohlsearch<cr>

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

" Search file
:nmap ,f :e **/*

:nmap ,p :NERDTreeFind<CR>
:nmap ,P :NERDTreeClose<CR>

" No auto reloading
" If you don't like automatic reloading because it slows Vim down or causes
" problems you can add the following line to your vimrc script:
" let g:reload_on_write = 0

" No session autload
" let g:session_autoload = 'no'

"function! OpenRecent()
"  for i in split(system("list_new_files"))
"    execute ":e ".i
"  endfor
"endfunction
":nmap ,r :call OpenRecent()<CR>


" Dictionaries
"autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict
"autocmd FileType html set dictionary=~/.vim/dict/html.dict
"autocmd FileType css set dictionary=~/.vim/dict/css.dict
"autocmd FileType ruby set dictionary=~/.vim/dict/ruby.dict

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

" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif

:nmap <C-p> :FZF<CR>

set backspace=indent,eol,start

"set ruler

:command A :OpenAlternate

" Run test
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

:command CtagsGemsUpdate :! gem install gem-ctags; gem ctags
set tags=./tags,tags
:command CtagsUpdate :! ctags --fields=+l -f tags -R lib -R app -R tests -R specs -R vendor


" FILE BROWSING:
"
" Tweaks for browsing
"let g:netrw_banner=0        " disable annoying banner
"let g:netrw_browse_split=4  " open in prior window
" let g:netrw_altv=1          " open splits to the right
"let g:netrw_liststyle=3     " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'



" SNIPPETS:
"
" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
