" Pathogen Settings
execute pathogen#infect()
syntax on

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"set expandtab "Enable this if you want tabs to be spaces instead of <TAB>
set number "Show line numbers
set showcmd "Show command at bottom bar
set cursorline "highlight current line
set nocompatible "vImproved only
filetype indent on "load filetype-specific indent files
set wildmenu "visual autocomplete for command menu
set lazyredraw "redraw only when necessary
set showmatch "highlight matching [{()}]
set incsearch "show search results as you type
set hlsearch "highlight search matches
set ignorecase "ignore case when searching
set smartcase 
" map \q to clear highlight matches
nmap \q :nohlsearch<CR>
set foldenable "enable folding
set foldlevelstart=10 "open most folds by default
set foldnestmax=10 "10 nested fold max
"toggle open/close folds
nnoremap <space> za
set foldmethod=indent "fold based on indent level

syntax enable
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

" move by visual line, not actual line
nmap j gj
nmap k gk

"map begin/end of line movement to keys similar to bash
nnoremap <C-a> ^
nnoremap <C-e> $
"remove default mappings for same
nnoremap $ <nop>
nnoremap ^ <nop>

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

"Syntastic Options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wg = 0

let g:instant_markdown_slow = 1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

map <C-n> :NERDTreeToggle<CR>

set colorcolumn=80 "Set red line at column 80 for reference

"Custom backup settings for locations and names of files
set backup
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
