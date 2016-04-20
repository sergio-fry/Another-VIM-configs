execute pathogen#infect()
set t_Co=256
set tags=./tags,tags,~/.rvm/tags,../tags

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

" Tab navigation
:map <A-1> 1gt
:map <A-2> 2gt
:map <A-3> 3gt
:map <A-4> 4gt
:map <A-5> 5gt
:map <A-6> 6gt
:map <A-7> 7gt
:map <A-8> 8gt
:map <A-9> 9gt
:map ,sb :tab sball<CR>

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

" most Recent files
le g:fuf_modesDisable = []
":nmap ,r :FufMruFile<CR>
" find Buffer
:nmap ,b :BufExplorer<CR>
":nmap ,b :ls<CR>

" Search file
:nmap ,f :e **/*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
""nmap ,/ :call NERDComment(0, "invert")<CR>
"vmap ,/ :call NERDComment(0, "invert")<CR>

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


" rspec mappings
map ,t :call RunCurrentSpecFile()<CR>
map ,l :call RunNearestSpec()<CR>
map ,y :call RunLastSpec()<CR>

function! RunCurrentSpecFile()
  if InSpecFile()
    let l:command = "bundle exec spec " . @% 
    call SetLastSpecCommand(l:command)
    call RunSpecs(l:command)
  endif
endfunction

function! RunNearestSpec()
  if InSpecFile()
    let l:command = "bundle exec spec " . @% . ":" . line(".")
    call SetLastSpecCommand(l:command)
    call RunSpecs(l:command)
  endif
endfunction

function! RunLastSpec()
  if exists("t:last_spec_command")
    call RunSpecs(t:last_spec_command)
  endif
endfunction

function! InSpecFile()
  return match(expand("%"), "_spec.rb$") != -1
endfunction

function! SetLastSpecCommand(command)
  let t:last_spec_command = a:command
endfunction

function! RunSpecs(command)
  execute ":w\|!clear && echo " . a:command . " && echo && " . a:command
endfunction


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


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

set backspace=indent,eol,start
