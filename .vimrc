" Modeline and Notes {{{
"   vim:foldmethod=marker:foldmarker={{{,}}}:foldlevel=0 :
"
"   my personal .vimrc by dccmx
"
" }}}

" Vundle {{{
set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" my plugins
Plugin 'FSwitch'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'

Plugin 'scratch.vim'
Plugin 'DrawIt'

Plugin 'junegunn/vim-easy-align'
Plugin 'bronson/vim-visual-star-search'

Plugin 'fsouza/go.vim'
Plugin 'dccmx/google-style.vim'
Plugin 'scrooloose/syntastic'

Plugin 'elzr/vim-json'
Plugin 'jnwhiteh/vim-golang'
Plugin 'dccmx/vim-lemon-syntax'
Plugin 'dccmx/nginx.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'rodjek/vim-puppet'
Plugin 'garyharan/vim-proto'
Plugin 'msteinert/vim-ragel'
Plugin 'fisadev/vim-isort'
Plugin 'shmay/vim-yaml'
Plugin 'tfnico/vim-gradle'
Plugin 'othree/html5.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'derekwyatt/vim-sbt'

Plugin 'Yggdroot/indentLine'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'matchit.zip'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'

Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()         " required
filetype plugin indent on " required!
" }}}

" Basics {{{
let mapleader=","
set noexrc                                       " don't use local version of .(g)vimrc, .exrc
let mapleader=","
set background=dark
syntax on
color desert
set fileencoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,ucs-bom,cp936,default
set nobackup
set nowritebackup
set noswapfile
set history=1000                                 " remember more commands and search history
set undolevels=1000                              " use many muchos levels of undo
" }}}

" Folding {{{
set foldenable                                   " Turn on folding
set foldmethod=indent
set foldnestmax=10                               "deepest fold is 10 levels
set foldlevel=100                                " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
function! SimpleFoldText()                       " {{{
  return getline(v:foldstart).' '
endfunction " }}}
set foldtext=SimpleFoldText()                    " Custom fold text function (cleaner than default)
" }}}

" General {{{
set undofile                                     " keep a persistent backup file
set undodir=~/.undo
set nobackup                                     " no backup files
set backspace=indent,eol,start                   " make backspace a more flexible
set clipboard+=unnamed                           " share windows clipboard
set visualbell                                   " don't beep
set noerrorbells                                 " don't beep
set hidden                                       " you can change buffers without saving

set wildmenu                                     " turn on command line completion wild style
set wildmode=full

" ignore these list file extensions
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp

set autowrite
set autoread
" set ttyfast
" }}}

" Vim UI {{{
" use perl/python style regex
nnoremap /        /\v
vnoremap /        /\v
set cursorline    " highlight current line
set nowrapscan
set laststatus=2  " always show the status line
set lazyredraw    " do not redraw while running macros
set nohlsearch    " do not highlight searched for phrases
set incsearch     " BUT do highlight as you type you search phrase
function! ToggleHLSearch()
  if &hls
    set nohls
  else
    set hls
  endif
endfunction
nmap <leader>h    <Esc>:call ToggleHLSearch()<CR>

set nostartofline " leave my cursor where it was
set number        " turn on line numbers
set report=0      " tell us when anything is changed via :...
set ruler         " Always show current positions along the bottom
set scrolloff=10  " Keep 10 lines (top/bottom) for scope
set shortmess+=I  "disable startup message
set showcmd       " show the command being typed
set showmatch     " show matching brackets
set bsdir=buffer  "set cwd to buffer dir
function! CurDir()
  let curdir=substitute(getcwd(), $HOME, "~", "g")
  return curdir
endfunction

if has("gui_running")
  set guifont=Monaco\ for\ Powerline:h13
  set guioptions-=r " 把gui的右边的滑动条去掉
  set guioptions-=L " 把gui的左边的滑动条去掉
  set guioptions-=m
  set guioptions-=T
endif

" }}}

" Text Formatting/Layout {{{
set completeopt=longest,menu
set complete-=i
set expandtab     " no real tabs please!
set ignorecase    " case insensitive by default
set nowrap        " do not wrap line
set autoindent
set cindent
set shiftround    " when at 3 spaces, and I hit > ... go to 4, not 5
set smartcase     " if there are caps, go case-sensitive
set shiftwidth=2  " auto-indent amount when using cindent, >>, << and stuff like that
set softtabstop=2 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set tabstop=2     " real tabs should be 8, and they will show with  set list on
" this makes sure that shell scripts are highlighted
" as bash scripts and not sh scripts
let g:is_posix=1
" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#
" }}}

" Plugin Settings {{{

" minibufexpl {{{
let g:miniBufExplorerHideWhenDiff=1
" }}}

" git gutter {{{
let g:gitgutter_enabled=0
" }}}

" Airline Settings {{{
set ttimeoutlen=50
let g:airline_powerline_fonts=1
" }}}

" TagBar Settings {{{
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
" }}}

" VimShell Settings {{{
let g:vimshell_prompt=substitute('CWD$ ', 'CWD', CurDir(), 'g')
" }}}

" MiniBufExplorer Settings {{{
let g:miniBufExplorerHideWhenDiff=1
let g:miniBufExplShowBufNumbers=0
autocmd! BufEnter * nested call TestMiniBufExplorer()
func! TestMiniBufExplorer()
  if bufname("%") == "-MiniBufExplorer-"
    wincmd j " 跳到下面的窗口
  endif
endfunction
" }}}

" NERD Tree {{{
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$HOME.'/.vim/.NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=1
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=40
let NERDTreeHighlightCursorline=1
let NERDTreeWinPos="right"
" }}}

" Syntastic {{{
let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol='‼'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_warning_symbol='!'

let g:syntastic_check_on_open=1

let g:syntastic_c_check_header=1
let g:syntastic_c_auto_refresh_includes=1
let g:syntastic_c_include_dirs=[ 'include', '../include', 'lib', '../lib', 'src', '../src', '../deps', '../../deps', '.', '..', '../..', '../../..', '../../../..', '../../../../..']
let g:syntastic_c_compiler_options=' -D_GNU_SOURCE -std=c99'

let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_auto_refresh_includes=1
let g:syntastic_cpp_include_dirs=[ 'include', '../include', 'lib', '../lib', 'src', '../src', '../deps', '../../deps', '.', '..', '../..', '../../..', '../../../..', '../../../../..']
let g:syntastic_cpp_compiler_options=' -D_GNU_SOURCE'

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'

let g:syntastic_mode_map={ 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['java'] }
" }}}

" YouCompleteMe {{{
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" }}}

" ack.vim {{{
if executable('ag')
  let g:ackprg="ag --nocolor --nogroup --column"
elseif executable('ack-grep')
  let g:ackprg="ack-grep --nocolor --nogroup --column"
elseif executable('ack')
  let g:ackprg="ack --nocolor --nogroup --column"
endif
" }}}

" identLine {{{
let g:indentLine_color_term=239
let g:indentLine_color_tty=239
let g:indentLine_color_gui='#808080'
let g:indentLine_char='¦'
" }}}

" }}}

" Mappings {{{
" save me from SHIFT
nnoremap ; :

nmap s <Plug>(easymotion-s)
nmap sn <Plug>(easymotion-sn)

vnoremap <silent> <Enter> :EasyAlign<cr>

set pastetoggle=<F2>

cmap w!! w !sudo tee % >/dev/null

if has("mac")
  nmap <D-1> :b1<CR>
  nmap <D-2> :b2<CR>
  nmap <D-3> :b3<CR>
  nmap <D-4> :b4<CR>
  nmap <D-5> :b5<CR>
  nmap <D-6> :b6<CR>
  nmap <D-7> :b7<CR>
  nmap <D-8> :b8<CR>
  nmap <D-9> :b9<CR>
  nmap <D-0> :b10<CR>
endif

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_regg@"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Make Arrow Keys Useful Again {{{
map <down> <ESC>:bd<CR>
map <up> <ESC>:Scratch<CR>
map <right> <ESC>:MBEbn<CR>
map <left> <ESC>:MBEbp<CR>
map <space> <ESC>:b#<CR>
map <leader>bd <ESC>:call CloseTab()<CR>
func! CloseTab()
  let s:buf_nrgbufnr("%")
  "echo s:buf_nr
  exec ":Tbbp "
  exec ":bdelete ".s:buf_nr
endfunction

nmap <leader>s :w<CR>
nmap <leader>x <Esc>:q<CR>
nmap <leader>qa :qall<CR>
" }}}

nmap <F3> :Ack <CR>
nmap <F4> :Ack <cword> %<CR>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
nmap <C-i> :Isort<cr>
nnoremap <leader>a :Ack
nmap <leader>H <Esc>:A!<CR>
nmap <leader>f :CtrlP<cr>
nmap <leader>git :Gitv<cr>
nmap git :Gitv!<cr>
nmap <leader>gf <Esc>:GoFmt<CR>
nmap <leader>gg :GitGutterToggle<CR>
nmap <leader>tl <Esc>:TagbarToggle<CR>
nmap <leader>fl <Esc>:NERDTreeToggle<CR>
nmap <leader>el :cw<CR>
nmap <leader>se :Errors<CR><C-j>
nmap en :cn<CR>
nmap ep :cp<CR>
nmap ec :cclose<CR>
nmap es :Errors<CR>
nmap <leader><space> :make<CR>

nmap gn <Plug>GitGutterNextHunk
nmap gp <Plug>GitGutterPrevHunk

"Window Switch {{{
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
" }}}

"Remove the Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>

"Switch to current dir
map <leader>cd :cd %:p:h<CR>

" }}}

" Autocommands {{{
autocmd FileType *      set formatoptions-=ro
autocmd FileType ragel  set nocindent
autocmd FileType lemon  set nocindent noai indentkeys=
autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType go     set makeprg=go\ build

" omnifunc settings
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
autocmd BufWritePre *.go Fmt

" save when losing focus
autocmd FocusLost * :wa

if has('win32') || has('win64')
  autocmd GUIEnter * simalt ~x "启动时最大化窗口
endif


" Reread configuration of Vim if .vimrc is saved {{{
augroup VimConfig
  autocmd!
  autocmd BufWritePost ~/.vimrc       so ~/.vimrc
  autocmd BufWritePost vimrc          so ~/.vimrc
augroup END
" }}}

" }}}
