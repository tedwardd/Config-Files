let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swap|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
" Pathogen Settings
execute pathogen#infect()
syntax on
filetype plugin indent on

set tabstop=4
set shiftwidth=4
"set expandtab
set nu
syntax enable
filetype indent on
set ai
set ic
set lbr
"colorscheme delek
if has ('gui_running')
    set background=light
else
    set background=dark
endif
"colorscheme solarized
map! ,e <emphasis>
map! ,p <para>
map <F3> v/><CR>y

" Customizations from statico.github.com/vim.html
nmap j gj
nmap k gk
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>
nmap <C-e> :e#<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
nmap ; :CtrlPBuffer<CR>
nmap \e :NERDTreeToggle<CR>

" Resize current buffer by +/-5
nnoremap <C-left> :vertical resize -5<CR>
nnoremap <C-down> :resize +5<CR>
nnoremap <C-up> :resize -5<CR>
nnoremap <C-right> :vertical resize +5<CR>

" Moving around buffers
" Vertically
map <C-J> <C-w>j<C-w>_
map <C-K> <C-w>k<C-w>_
" Horizontally
map <C-H> <C-w>h<C-w>_
map <C-L> <C-w>l<C-w>_

" FIX 256 COLOR ISSUE
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
endif
