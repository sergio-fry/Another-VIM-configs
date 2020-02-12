source ~/.vim/config/plugins.vim
source ~/.vim/config/base.vim
source ~/.vim/config/fzf.vim
source ~/.vim/config/helpers.vim

:let mapleader = "."

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif



nmap ,n :nohlsearch<cr>

"Save file after focus lost
:au FocusLost * :wa
:au BufLeave * :wa

" remove menu
set guioptions-=T

" colorscheme xoria256
" colorscheme gruvbox
" colorscheme github
" colorscheme desert256
colorscheme distinguished
set background=dark

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

:command SpringOff let test#ruby#use_spring_binstub = 0
:command SpringOn let test#ruby#use_spring_binstub = 1
let g:test#java#runner = 'gradletest'

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> ,t :TestNearest<CR>
nmap <silent> ,T :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
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
" :command CtagsUpdate :! ctags --language-force=ruby --fields=+l -f tags -R *
" :command CtagsUpdateAll :! ctags --fields=+l -f tags -R lib -R app -R test -R spec -R vendor -R .bundle
" set complete-=i
set notagbsearch " avoid E432: Tags file not sorted Error

" GitGutter config
let g:gitgutter_signs = 1
"let g:gitgutter_sign_column_always = 1

let g:gitgutter_highlight_lines = 0
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)

nmap <c-n> :cnext<CR>


" let g:openbrowser_search_engines = {
      " \   'jira': 'https://devprg.atlassian.net/browse/{query}',
      " \}


if executable('ag')
  " let g:ackprg = 'ag --vimgrep --ignore-dir node_modules/  --ignore-dir tmp/'
  let g:ackprg = 'ag --vimgrep'
endif
" let g:ackpreview = 1 " live preview
" let g:ack_use_dispatch = 1 " speedup

" Find current word in files
nmap <C-k> :Ack! "<cword>"<CR>


" Russian
"set keymap=russian-jcukenwin
" set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" set iminsert=0
" set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

nmap gc :Commentary<CR>
" nmap пс :Commentary<CR>


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:fugitive_gitlab_domains = ['https://gitlab.com', 'https://gitlab.infra.b-pl.pro']

autocmd BufNewFile,BufRead *.es6 set syntax=javascript


" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT


" Rubocop
nmap rr :ALEFix<CR>


" ALE Lint / Fix
let g:ale_linters = {'ruby': ['standardrb'], 'javascript': ['standard']}
let g:ale_fixers = {'ruby': ['standardrb'], 'javascript': ['standard']}
let g:ale_fix_on_save = 0

" let g:ruby_indent_assignment_style = 'variable'



let g:vim_markdown_folding_disabled = 1


" magic speed up
" https://github.com/joshukraine/dotfiles/blob/master/vim-performance.md
"
" Vim includes two regexp engines:

" An old, backtracking engine that supports everything.
" A new, NFA engine that works much faster on some patterns, possibly slower on some patterns.
set re=1


