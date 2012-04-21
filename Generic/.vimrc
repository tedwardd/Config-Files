set nocompatible
syntax on
filetype plugin indent on
set history=1000
set autoread
set ruler
set cmdheight=2
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw
set magic
set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable

set nobackup
set noswapfile

set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500
set ai
set si
set wrap


""""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH --------------------------------
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
