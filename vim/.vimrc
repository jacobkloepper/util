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
map <C-k> :tabr<cr>
map <C-j> :tabl<cr>
map <C-h> :tabp<cr>
map <C-l> :tabn<cr>
map <F5> :w<cr>:!make<cr>
map <F6> :w<cr>:!cargo run<cr>
