set guifont=Consolas
"""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""
let mapleader=","

set incsearch
set ignorecase
set smartcase
set nohlsearch

function ToggleHLSearch()
	if &hls
		set nohls
	else
		set hls
	endif
endfunction
nmap <leader>h <Esc>:call ToggleHLSearch()<CR>

nmap <leader>a <Esc>:A!<CR>
nnoremap <silent> <F3> :Grep<CR> 
set number
set scrolloff=5
autocmd FileType * set fo-=ro
syntax on 
color desert
set bg=dark

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
set laststatus=2
function! CurDir()
	let curdir=substitute(getcwd(), '/home/dccmx/', "~/", "g")
	return curdir
endfunction
set statusline=%F%m%r%h%w\ [CWD=%{CurDir()}]\ %{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

set cursorline

set showcmd
set lazyredraw
set nobackup
set autowrite

map <F9> <ESC>:call CloseTab()<CR>
func! CloseTab()
	let s:buf_nr = bufnr("%")
	echo s:buf_nr
	exec ":Tbbp "
	exec ":bdelete ".s:buf_nr
endfunction

nmap <leader>qw :cw<CR>
nmap <leader>qn :cn<CR>
nmap <leader>qp :cp<CR>
nmap <leader>qc :cclose<CR>
nmap <leader>s :w<CR>
nmap <leader>x <Esc>:q<CR>
nmap <leader>qa :qall<CR>
nmap <leader><space> :make<CR>
""""""""""""""""""""""""""""
"indent
""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set nowrap

""""""""""""""""""""""""""""
"fold
""""""""""""""""""""""""""""
set foldmethod=syntax 
set foldlevel=100 "启动vim时不要自动折叠代码

"yank ring
map <leader>y :YRShow<CR>
let g:yankring_history_dir = '$HOME/.vim/'
let g:yankring_history_file = '.yankring_history'

""""""""""""""""""""""""""""
"no hint of donation
""""""""""""""""""""""""""""
set shortmess+=I "disable startup message

filetype plugin indent on
set completeopt=longest,menu

""""""""""""""""""""""""""""
"tabbar
""""""""""""""""""""""""""""
let g:Tb_ForceSyntaxEnable=1
let g:Tb_MaxSize=2
let g:Tb_TabWrap=1
map <C-F4> <ESC>:call CloseTab()<CR>
func! CloseTab()
	let s:buf_nr = bufnr("%")
	echo s:buf_nr
	exec ":Tbbp "
	exec ":bdelete ".s:buf_nr
endfunction
autocmd! BufEnter * nested call Test()
func! Test()
	if bufname("%") == "-TabBar-"
		wincmd j " 跳到下面的視窗
	endif
endfunction

""""""""""""""""""""""""""""
"Buffer Switch 
""""""""""""""""""""""""""""
map <right> :bn!<CR>
map <left> :bp!<CR>
map <space> :b#<CR>
map <leader>bd :bd<CR>

""""""""""""""""""""""""""""
"Window Switch
""""""""""""""""""""""""""""
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

"Switch to current dir
map <leader>cd :cd %:p:h<CR>

""""""""""""""""""""""""""""
"NERD tree
""""""""""""""""""""""""""""
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=1
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=31
let NERDTreeHighlightCursorline=1
let NERDTreeWinPos="right"
nmap <leader>f :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""
"ctags
""""""""""""""""""""""""""""""""""""
set tags=./tags,tags,../tags,../../tags
cs add ./cscope.out ./
set tags+=/usr/include/c++/tags
cs add usr/include/c++/cscope.out /usr/include/c++
set tags+=/usr/include/linux/tags
cs add /usr/include/linux/cscope.out /usr/include/linux
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f "%:p:h\\tags" "%:p:h"<CR>
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F11> :!cscope -Rbkq<CR>
"智能补全ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
"let OmniCpp_DefaultNamespaces = ["std"]
"let OmniCpp_GlobalScopeSearch = 1 " 0 or 1
"let OmniCpp_NamespaceSearch = 1 " 0 , 1 or 2
"let OmniCpp_DisplayMode = 1
"let OmniCpp_ShowScopeInAbbr = 0
"let OmniCpp_ShowPrototypeInAbbr = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1

""""""""""""""""""""""""""""
"TagList
""""""""""""""""""""""""""""
let Tlist_Use_Right_Window=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_WinWidth=40
let Tlist_Show_One_File=1
let Tlist_Close_On_Select=1
let Tlist_Close_On_Select=1 
let Tlist_Sort_Type="name"
nmap <leader>t :Tlist<CR>

""""""""""""""""""""""""""""
"cscope 
""""""""""""""""""""""""""""
set cscopequickfix=g-,s-,c-,d-,i-,t-,e-
nmap <C-t> :colder<CR>:cc<CR>

nmap <C-_>s :cs find s <C-r>=expand("<cword>")<CR><CR> 
nmap <C-_>g :cs find g <C-r>=expand("<cword>")<CR><CR> 
nmap <C-_>c :cs find c <C-r>=expand("<cword>")<CR><CR> 
nmap <C-_>t :cs find t <C-r>=expand("<cword>")<CR><CR> 
nmap <C-_>e :cs find e <C-r>=expand("<cword>")<CR><CR> 
nmap <C-_>f :cs find f <C-r>=expand("<cfile>")<CR><CR> 
nmap <C-_>i :cs find i ^<C-r>=expand("<cfile>")<CR>$<CR> 
nmap <C-_>d :cs find d <C-r>=expand("<cword>")<CR><CR>

"Remove the Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm10gt 
