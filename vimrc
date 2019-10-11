call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-solargraph
" Plug 'neoclide/coc-solargraph'

Plug 'tpope/vim-sensible'
Plug 'isRuslan/vim-es6'
Plug 'briancollins/vim-jst'
Plug 'noprompt/vim-yardoc'
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'w0rp/ale'
Plug 'chr4/nginx.vim'
Plug 'vim-scripts/matchit.zip'
" Plug 'valloric/matchtagalways'


Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jvanja/vim-bootstrap4-snippets'


Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'morhetz/gruvbox'
" Plug 'craigemery/vim-autotag'
" Plug 'tpope/vim-cucumber'
" Plug 'mxw/vim-jsx'
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
" Plug 'bling/vim-airline'
Plug 'ekalinin/dockerfile.vim'
"Plug 'vim-scripts/a.vim'
" Plug 'aklt/plantuml-syntax'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
" Plug 'tyru/open-browser.vim'
Plug 'udalov/kotlin-vim'
Plug 'in3d/vim-raml'

" Plug 'autozimu/LanguageClient-neovim', {
    " \ 'branch': 'next',
    " \ 'do': 'bash install.sh',
    " \ }

Plug 'tpope/vim-haml'
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

" colorscheme xoria256
" colorscheme gruvbox
" colorscheme github
" colorscheme desert256
colorscheme distinguished

" autoread updated files
set autoread
set number

" http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
set mouse=a

:nmap ,b :BufExplorer<CR>
:nmap <C-b> :Buffers<CR>

:nmap ,p :NERDTreeFind<CR>
:nmap ,P :NERDTreeClose<CR>
" :let NERDTreeQuitOnOpen=1

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
" let g:autotagTagsFile="tags"
:command CtagsUpdate :! ctags --language-force=ruby --fields=+l -f tags -R *
:command CtagsUpdateAll :! ctags --fields=+l -f tags -R lib -R app -R test -R spec -R vendor -R .bundle
" set complete-=i

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
  let g:ackprg = 'ag --vimgrep --ignore-dir node_modules/'
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

let g:fugitive_gitlab_domains = ['https://gitlab.com', 'https://gitlab.infra.b-pl.pro']

autocmd BufNewFile,BufRead *.es6 set syntax=javascript

" Some aliases for ESC
inoremap jj <esc>
inoremap jk <esc>
inoremap § <esc>

" Do not reset cursor position on each buffer switching
set nostartofline


" let g:LanguageClient_serverCommands = {
    " \ 'ruby': ['~/.rvm/gems/default/bin/solargraph', 'stdio'],
    " \ }

" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" let g:LanguageClient_loggingLevel = 'INFO'
" let g:LanguageClient_virtualTextPrefix = ''
" let g:LanguageClient_loggingFile =  expand('~/.vim/LanguageClient.log')
" let g:LanguageClient_serverStderr = expand('~/.vim/LanguageServer.log')

" Rubocop
nmap rr :ALEFix<CR>

set exrc
set secure


" ALE Lint / Fix
let g:ale_linters = {'ruby': ['standardrb'], 'javascript': ['standard']}
let g:ale_fixers = {'ruby': ['standardrb'], 'javascript': ['standard']}
let g:ale_fix_on_save = 0

let g:ruby_indent_assignment_style = 'variable'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc Config source: https://github.com/neoclide/coc.nvim
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
