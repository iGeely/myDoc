set tags=tags;
set expandtab      " Use spaces instead of tabs
set softtabstop=4   " backspace
set shiftwidth=4    " indent width

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

set bs=2		   " allow backspacing over everything in insert mode
set backspace=2
set showmatch      " always set showmatch on
"set backup		   " keep a backup file (defaults to .filename~)
set viminfo='20,\"50  " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50     " keep 50 lines of command line history
set ruler          " show the cursor position all the time
set number
set ts=2
set wrap
set autoindent


set cursorcolumn
"set cursorline
set nocompatible 
set backspace=indent,eol,start
syntax enable
syntax on

set guifont=Monospace\ 14
"set showcmd

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <F5> :w<cr>:!python %<cr>
"remember last update or view postion"
 " Only do this part when compiled with support for autocommands 
 if has("autocmd")
 " In text files, always limit the width of text to 78 characters 
 autocmd BufRead *.txt set tw=78
 " When editing a file, always jump to the last cursor position 
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
 \ endif 
 endif



if has("autocmd")
    autocmd BufNewFile,BufRead Makefile set noexpandtab " Makefiles ensure that we don't expand tabs since tabs are special
endif


"
" lhs comments -- select a range then hit ,# to insert hash comments
" or ,/ for // comments, or ,c to clear comments.
map ,# :s/^/#/<CR> <Esc>:nohlsearch <CR>
map ,/ :s/^/\/\//<CR> <Esc>:nohlsearch <CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR> <Esc>:nohlsearch<CR>

" wrapping comments -- select a range then hit ,* to put  /* */ around
" selection, or ,d to clear them
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR> <Esc>:nohlsearch<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR> <Esc>:nohlsearch<CR>

" to clear hlsearch -- hit ,h to clear highlighting from last search
map ,h :nohlsearch <CR>


set completeopt=longest,menu    "VimIDE(VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"let g:ycm_server_python_interpreter='/home/guash/tmp/python2.7/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1

let g:ycm_server_keep_logfiles = 1 
let g:ycm_server_log_level = 'debug'

let g:ycm_cache_omnifunc = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_of_chars_for_completion= 2
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>


"set nocompatible
filetype on 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-powerline'
"Plugin 'python-mode/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'Solarized'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on


"set tags=/var/dz_resource/ineedle/soft/tags
set tags=tags;
set autochdir

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if &t_Co > 2 || has("gui_running")
"  syntax on
"  set hlsearch
"endif

if has("gui_running")
    set lines=55 columns=108
    winpos 235 235
    colorscheme evening
    colorscheme solarized
    set background=dark
endif

