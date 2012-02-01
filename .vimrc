" Modeline and Notes {{{
"   vim:foldmethod=marker:foldmarker={{{,}}}:foldlevel=0 :
"
"   my personal .vimrc by dccmx
"
" }}}

" Basics {{{
set nocompatible " explicitly get out of vi-compatible mode
set noexrc " don't use local version of .(g)vimrc, .exrc
let mapleader=","
set background=dark " we plan to use a dark background
syntax on " syntax highlighting on
color desert    
set fileencoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,ucs-bom,cp936,default
set nobackup
set nowritebackup
set noswapfile
" }}}

" General {{{
filetype plugin indent on " load filetype plugins/indent settings
set nobackup " no backup files
set backspace=indent,eol,start " make backspace a more flexible
set clipboard+=unnamed " share windows clipboard
set noeb " no error bells
set vb
set hidden " you can change buffers without saving
"set mouse=a "don't use mouse everywhere
set noerrorbells " don't make noise
set wildmenu " turn on command line completion wild style
" ignore these list file extensions
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
"set wildmode=list:longest " turn on wild mode huge list
set autowrite
" }}}

" Vim UI {{{
set cursorline " highlight current line
set incsearch " BUT do highlight as you type you search phrase
set nowrapscan 
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set nohlsearch " do not highlight searched for phrases    
function! ToggleHLSearch()
    if &hls
        set nohls
    else
        set hls
    endif
endfunction
nmap <leader>h <Esc>:call ToggleHLSearch()<CR>

set nostartofline " leave my cursor where it was
set number " turn on line numbers
set report=0 " tell us when anything is changed via :...
set ruler " Always show current positions along the bottom
set scrolloff=10 " Keep 10 lines (top/bottom) for scope
set shortmess+=I "disable startup message
set showcmd " show the command being typed
set showmatch " show matching brackets
set bsdir=buffer "set cwd to buffer dir
"set autochdir "auto change dir to cwd
function! CurDir()
    let curdir=substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction

set statusline=%F%m%r%h%w\ [CWD=%{CurDir()}]\ %{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %{SyntasticStatuslineFlag()}

if has("gui_running")

    set guifont=YaHei\ Consolas\ Hybrid
    "把gui的右边的滑动条去掉
    set guioptions-=r
    "把gui的左边的滑动条去掉
    set guioptions-=L
    set guioptions-=m
    set guioptions-=T
    autocmd GUIEnter * simalt ~x "启动时最大化窗口

endif

" }}}

" Text Formatting/Layout {{{
set completeopt=longest,menu
set complete-=i
set expandtab " no real tabs please!
set ignorecase " case insensitive by default
set nowrap " do not wrap line
set autoindent
set cindent
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set smartcase " if there are caps, go case-sensitive
set shiftwidth=2 " auto-indent amount when using cindent, >>, << and stuff like that
set softtabstop=2 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set tabstop=2 " real tabs should be 8, and they will show with  set list on
" }}}

" Folding {{{
set foldenable " Turn on folding
set foldmethod=syntax " Fold on the marker
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds 
function! SimpleFoldText() " {{{
    return getline(v:foldstart).' '
endfunction " }}}
set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)
" }}}

" Plugin Settings {{{

" TagList Settings {{{
let Tlist_Auto_Open=0 " let the tag list open automagically
let Tlist_Compact_Format = 1 " show small menu
let Tlist_Ctags_Cmd = 'ctags' " location of ctags
let Tlist_Enable_Fold_Column = 0 " do show folding tree
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
let Tlist_Sort_Type = "name" " order by 
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_WinWidth = 40 " 40 cols wide, so i can (almost always) read my functions
let Tlist_Close_On_Select=1
let Tlist_Show_One_File=1
let Tlist_GainFocus_On_ToggleOpen=1
" Language Specifics {{{
" just functions and classes please
let tlist_aspjscript_settings = 'asp;f:function;c:class' 
" just functions and subs please
let tlist_aspvbs_settings = 'asp;f:function;s:sub' 
" don't show variables in freaking php
let tlist_php_settings = 'php;c:class;d:constant;f:function' 
" just functions and classes please
let tlist_vb_settings = 'asp;f:function;c:class' 
" }}}
" }}}

" tabbar Settings {{{
let g:Tb_ForceSyntaxEnable=1
let g:Tb_MaxSize=2
let g:Tb_TabWrap=1
autocmd! BufEnter * nested call TestTabbar()
func! TestTabbar()
    if bufname("%") == "-TabBar-"
        wincmd j " 跳到下面的視窗
    endif
endfunction
" }}}

" yank ring {{{
map <leader>y :YRShow<CR>
let g:yankring_history_dir = '$HOME/.vim/'
let g:yankring_history_file = '.yankring_history'
"}}}

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

" NERD_Comment {{{
let NERDCommentWholeLinesInVMode=1
" }}}

" Ctags and cscope {{{
set tags=./tags
set tags+=$HOME/.tags/tags
set tags+=$HOME/.tags/local/tags

"cs add ./cscope.out ./
"cs add /usr/include/c++/cscope.out /usr/include/c++/
"cs add /usr/include/linux/cscope.out /usr/include/linux
"set cscopequickfix=g-,s-,c-,d-,i-,t-,e-
" }}}

" OmniCpp {{{
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_DefaultNamespaces = ["std"]
"let OmniCpp_GlobalScopeSearch = 1 " 0 or 1
"let OmniCpp_NamespaceSearch = 1 " 0 , 1 or 2
"let OmniCpp_DisplayMode = 1
"let OmniCpp_ShowScopeInAbbr = 0
"let OmniCpp_ShowPrototypeInAbbr = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
" }}}

" Grep {{{
let Grep_Skip_Files = '*.bak *~ tags cscope.*' 
let Grep_Skip_Dirs = '.git .svn' 
let Grep_Default_Options = '-i' 
" }}}

" Syntastic {{{
let g:syntastic_check_on_open=1
let g:syntastic_cpp_compiler_options=' -I../src -I./src -I./include -I../include'
" }}}

" }}}

" Mappings {{{
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
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Make Arrow Keys Useful Again {{{
map <down> <ESC>:bd<CR>
map <up> <ESC>:e noname<CR>
map <right> <ESC>:bn!<CR>
map <left> <ESC>:bp!<CR>
map <space> <ESC>:b#<CR>
map <leader>bd <ESC>:call CloseTab()<CR>
func! CloseTab()
    let s:buf_nr = bufnr("%")
    "echo s:buf_nr
    exec ":Tbbp "
    exec ":bdelete ".s:buf_nr
endfunction

nmap <leader>s :w<CR>
nmap <leader>x <Esc>:q<CR>
nmap <leader>qa :qall<CR>
" }}}

nmap <leader>a <Esc>:A!<CR>
nmap <leader>tl <Esc>:Tlist<CR>
nmap <leader>fl <Esc>:NERDTreeToggle<CR>
nmap <leader>fzf :FufFileWithFullCwd<CR>
nmap <leader>ftf :FufTaggedFile<CR>
nmap <leader>fzt :FufTag<CR>
nnoremap <silent> <F3> :Grep <CR> 
nnoremap <silent> <F4> :Grep <cword> %<CR> 
nmap <leader>el :cw<CR>
nmap <leader>en :cn<CR>
nmap <leader>ep :cp<CR>
nmap <leader>ec :cclose<CR>
nmap <leader>es :Errors<CR>
nmap <leader><space> :make<CR>

"Window Switch{{{
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
"}}}

"Remove the Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>

"Switch to current dir
map <leader>cd :cd %:p:h<CR>

"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f "%:p:h\\tags" "%:p:h"<CR>
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-F11> :!cscope -Rbkq<CR>

nmap <C-t> :colder<CR>:cc<CR>

"0 or s: Find this C symbol
"1 or g: Find this definition
"2 or d: Find functions called by this function
"3 or c: Find functions calling this function
"4 or t: Find this text string
"6 or e: Find this egrep pattern
"7 or f: Find this file
"8 or i: Find files #including this file
nmap <C-_>s :cs find s <C-r>=expand("<cword>")<CR><CR> 
nmap <C-_>d :cs find g <C-r>=expand("<cword>")<CR><CR> 
nmap <C-_>c :cs find d <C-r>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find c <C-r>=expand("<cword>")<CR><CR> 
nmap <C-_>e :cs find t <C-r>=expand("<cword>")<CR><CR> 
nmap <C-_>g :cs find e <C-r>=expand("<cword>")<CR><CR> 
nmap <C-_>f :cs find f <C-r>=expand("<cfile>")<CR><CR> 
nmap <C-_>i :cs find i ^<C-r>=expand("<cfile>")<CR>$<CR> 

" }}}

" Autocommands {{{

command! Ctagsgen !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
command! Cscopegen !cscope -Rbkq 

autocmd FileType * set formatoptions-=ro
autocmd FileType ragel set nocindent
autocmd FileType lemon set nocindent noai indentkeys=
autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4

" omnifunc settings
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Reread configuration of Vim if .vimrc is saved {{{
augroup VimConfig
    autocmd!
    autocmd BufWritePost ~/.vimrc       so ~/.vimrc
    autocmd BufWritePost vimrc          so ~/.vimrc
augroup END
" }}}
" }}}

