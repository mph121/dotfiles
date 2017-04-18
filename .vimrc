set nocompatible
filetype off

set swapfile
set dir=/tmp/nvim/swapdir

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
" Plugin 'valloric/youcompleteme'
Plugin 'easymotion/vim-easymotion'
" Plugin 'ervandew/supertab'
Plugin 'raimondi/delimitmate'
Plugin 'yggdroot/indentline'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'xuhdev/singlecompile'
Plugin 'rosenfeld/conque-term'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()

" Startup nerdtree on start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

" Close from nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Key to toggle nerdtree
silent! nmap <C-i> :NERDTreeToggle<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

let g:syntastic_java_checkers=['checkstyle', 'javac']
let g:syntastic_java_checkstyle_classpath="/home/njord/Documents/checkstyle-7.6.1-all.jar"
let g:syntastic_java_checkstyle_conf_file="/home/njord/Documents/sun_checks.xml"

" Easymotion
map <C-s> <Plug>(easymotion-j)

" Number Toggle
let g:NumberToggleTrigger="<F2>"
set number
highlight LineNr ctermfg=blue
hi CursorLineNr ctermfg=darkgreen 

" Compile Run
" <F10> :ConqueTermTab javac %:t && java %:t:r<CR>

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
