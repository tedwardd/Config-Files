" Old Pathogen Settings
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/denite.nvim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'rodjek/vim-puppet'
Plugin 'vim-syntastic/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/TagHighlight'
Plugin 'fatih/vim-go'
Plugin 'suan/vim-instant-markdown'
Plugin 'elzr/vim-json'
Plugin 'xolox/vim-misc'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
"Plugin 'Shougo/deoplete.nvim'
"Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()
filetype indent on "load filetype-specific indent files
filetype plugin on

syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"set expandtab "Enable this if you want tabs to be spaces instead of <TAB>
set number "Show line numbers
set showcmd "Show command at bottom bar
set cursorline "highlight current line
highlight LineNr term=bold cterm=NONE ctermfg=white ctermbg=black
highlight CursorLine term=bold cterm=NONE ctermbg=236 ctermfg=NONE
set cursorcolumn!
"highlight CursorColumn term=NONE ctermbg=236 ctermfg=NONE guibg=#404040

"set nocompatible "vImproved only
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
set backspace=indent,eol,start

syntax enable
set ai
set ic
set lbr
colorscheme delek
if has ('gui_running')
    set background=light
else
    set background=dark
endif
"colorscheme atom-dark-256
map! ,e <emphasis>
map! ,p <para>
map <F3> v/><CR>y

" move by visual line, not actual line
nmap j gj
nmap k gk

"map begin/end of line movement to keys similar to bash
"nnoremap <C-a> ^
"nnoremap <C-e> $
"remove default mappings for same
"nnoremap $ <nop>
"nnoremap ^ <nop>

nmap <C-e> :e#<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
" nmap ; :CtrlPBuffer<CR>
"nmap \e :NERDTreeToggle<CR>

" Resize current buffer by +/-5
nnoremap <C-left> :vertical resize -5<CR>
nnoremap <C-down> :resize +5<CR>
nnoremap <C-up> :resize -5<CR>
nnoremap <C-right> :vertical resize +5<CR>

" Moving around buffers
" Vertically
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_
" Horizontally
nnoremap <C-h> <C-w>h<C-w>_
nnoremap <C-l> <C-w>l<C-w>_

" FIX 256 COLOR ISSUE
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
endif

"Syntastic Options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wg = 0

"Status Line Settings
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 


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
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set colorcolumn=81 "Set red line at column 80 for reference

"https://docs.puppetlabs.com/guides/style_guide.html#spacing-indentation-and-whitespace
"au BufRead,BufNewFile *.pp set colorcolumn=140

"Custom backup settings for locations and names of files
set backup
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

let g:ycm_path_to_python_interpreter = '/Users/twood/.pyenv/shims/python'

let g:puppet_align_hashes = 1

"let mapleader=','
"map <leader>- :Tabu /=><CR>

set clipboard=unnamed

:let g:notes_directories = ['~/Notes']
:let g:notes_suffix = '.mdown'
:let g:notes_unicode_enabled = 1
:let g:notes_conceal_url = 0

let g:syntastic_mode_map = { 
    \ "mode": "passive",
    \ "active_filetypes": ["python", "sh", "php", "markdown", "erb", "ruby", "puppet"] }

let g:python_host_prog = '/Users/twood/.pyenv/shims/python'

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType puppet setlocal shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=140
autocmd FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Set some variables that are handy to have
let Date=system("date +\%F")
let gitdir=system("git rev-parse --show-toplevel | tr -d '\n'")
command Date :put =Date
command Lint :exe ':! ' . gitdir . '/script/lint'
map <C-M-l> :exe ':! ' . gitdir . '/script/lint' <CR>

set spell
set spell spelllang=en_us
" zg to add word to word list
" zw to reverse
" sug to remove word fro mword list
" z= to get list of possibilities
set spellfile=~/.vim/spellfile.add
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 cterm=underline
highlight clear SpellCap
highlight SpellCap term=standout ctermfg=1 cterm=underline
highlight clear SpellRare
highlight SpellRare term=standout ctermfg=1 cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=standout ctermfg=1 cterm=underline
:hi CursorColumn ctermfg=White ctermbg=236 cterm=bold
