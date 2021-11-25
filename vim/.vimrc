set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'preservim/nerdtree'

call vundle#end()
filetype plugin indent on

" general settings
syntax on
set number
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set hlsearch
set ruler
set title
set backspace=indent,eol,start
set confirm
set history=50
colorscheme elflord

" binds

" Tab control
noremap <C-k> :tabr<cr>
noremap <C-j> :tabl<cr>
noremap <C-h> :tabp<cr>
noremap <C-l> :tabn<cr>

" Compile/run
noremap <F5> :w<cr>:!make<cr>
noremap <F6> :w<cr>:!cargo run<cr>

" NERDTree
noremap <C-n> :NERDTreeToggle<cr>
