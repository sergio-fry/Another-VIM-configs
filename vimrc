call plug#begin()
Plug 'isRuslan/vim-es6'

Plug 'w0rp/ale'
Plug 'chr4/nginx.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'valloric/matchtagalways'


Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jvanja/vim-bootstrap4-snippets'


Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'morhetz/gruvbox'
" Plug 'craigemery/vim-autotag'
Plug 'tpope/vim-cucumber'
Plug 'mxw/vim-jsx'
"Plug 'python-mode/python-mode', { 'branch': 'develop' }
" Plug 'valloric/youcompleteme'
Plug 'slim-template/vim-slim'
Plug 'mechatroner/rainbow_csv'
Plug 'will133/vim-dirdiff'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'mileszs/ack.vim'
Plug 'jlanzarotta/bufexplorer'

"Plug 'junegunn/fzf'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdtree'
Plug 'kana/vim-textobj-user'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-bundler'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'ekalinin/dockerfile.vim'
"Plug 'vim-scripts/a.vim'
Plug 'aklt/plantuml-syntax'
"Plug 'junegunn/goyo.vim'
"Plug 'amix/vim-zenroom2'
Plug 'tyru/open-browser.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'udalov/kotlin-vim'
Plug 'in3d/vim-raml'
Plug 'tpope/vim-sensible'
call plug#end()
set lazyredraw
set ttyfast

" brew tap uptech/homebrew-oss
" brew install uptech/oss/alt

" nnoremap z] :Ycm GoTo<CR>

if has('python3')
  silent! python3 1
endif


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
set softtabstop=2


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

"colorscheme xoria256
colorscheme gruvbox

" autoread updated files
set autoread
set number

" http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
set mouse=a

:nmap ,b :BufExplorer<CR>
:nmap <C-b> :Buffers<CR>

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
nmap <C-k> :Ack! "<cword>"<CR>

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
:nmap <leader>. :A<CR>

" Run test
let test#ruby#bundle_exec = 1
let test#ruby#use_spring_binstub = 1

" let test#ruby#rspec = 'bundle exec rspec'
" let test#ruby#cucumber#executable = 'bundle exec cucumber'
"
" function! EnableSpring()
"   let test#ruby#rspec = 'bundle exec spring rspec'
"   let test#ruby#cucumber#executable = 'bundle exec spring cucumber'
" endfunction

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> ,t :TestNearest<CR>
nmap <silent> ,T :TestFile<CR>
" nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> <C-t> :TestLast<CR>
" nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g




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
"let g:gitgutter_sign_column_always = 1
set signcolumn=yes

let g:gitgutter_highlight_lines = 0
nmap ]g <Plug>GitGutterNextHunk
nmap [g <Plug>GitGutterPrevHunk



let g:openbrowser_search_engines = {
      \   'jira': 'https://devprg.atlassian.net/browse/{query}',
      \}


if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" let g:ackpreview = 1 " live preview
" let g:ack_use_dispatch = 1 " speedup


" Russian
"set keymap=russian-jcukenwin
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

nmap gc :Commentary<CR>
nmap пс :Commentary<CR>


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:fugitive_gitlab_domains = ['https://gitlab.com', 'https://git.stdev.ru']
