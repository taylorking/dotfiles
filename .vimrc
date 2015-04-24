set nocompatible
"filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Using Vundle:
" https://github.com/gmarik/Vundle.vim

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sickill/vim-monokai'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'whatyouhide/vim-gotham' 
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on

let NERDTreeDirArrows=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='gotham256'
let g:airline_powerline_fonts=1

syntax enable
colorscheme gotham256
set encoding=utf-8

set title
set showcmd
set cursorline
set showmode          " Tell you if you're in insert mode
set ruler             " Show the cursor position all the time
"set relativenumber    " turns on relative line numbering
set number            " add line number for current line
set scrolloff=3
set wildmenu
set ttyfast
set splitbelow
set splitright
set tabstop=2         " Set the tabstop to 4 spaces
set shiftwidth=2      " Shiftwidth should match tabstop
set softtabstop=2     " backspace tabs
set expandtab         " Convert tabs to <tabstop> number of spaces
set backspace=2       " makes backspace work like you expect
set autoindent
set smartindent
set ignorecase
set smarttab
set laststatus=2
set showmatch         " Show matching [] () {} etc...
set nohlsearch        " Don't highlight strings you're searching for
set smartcase
set incsearch
set formatoptions+=ro " Insert leading comment characters on newline
set lazyredraw

"set undodir=~/.vim/undo
"`set undofile

set backup                 " keep a backup file
set backupdir=/u/css/kingtb/.tmp " put it here
set dir=/u/css/kingtb/.tmp       " put swap files here


" behave yourself
nnoremap Y y$

noremap j gj
noremap k gk

" moving around splits
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" moving between tabs
nmap <C-l> gt
nmap <C-h> gT

" :T <filename> opens file in new tab
command! -complete=file -nargs=1 T tabedit <args>

command! Json %!python -m json.tool

" Strip trailing whitespace (\ss) (strip spaces)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Make vim turn *off* expandtab for files named Makefile or makefile
" We need the tab literal
autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab
autocmd BufNewFile,BufRead *\.md set noexpandtab

" Nerdtree
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Fugitive
map <Leader>gb :Gblame<CR>
map <Leader>gs :Gstatus<CR>

" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Nov-13 16:17):
filetype plugin on
" Change the <LocalLeader> key:
let maplocalleader = ","
" Use Ctrl+Space to do omnicompletion:
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
" Press the space bar to send lines (in Normal mode) and selections to R:
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" Force Vim to use 256 colors if running in a capable terminal emulator:
if &term =~ "xterm" || &term =~ "256" || $DISPLAY != "" || $HAS_256_COLORS == "yes"
    set t_Co=256
endif
