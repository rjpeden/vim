" This must be first, because it changes the other options as a side effect
set nocompatible

" GUI settings
"" Remove toolbar, menu, scroll bars
"" Set font/font size
"" Set colors
if has("gui_running")
	set guioptions-=m "Remove menu bar
	set guioptions-=T "Remove toolbar
	set guioptions-=r "Remove right-hand scroll bar
	set guioptions-=L "Remove left-hand scroll bar

	set guifont=Anonymous\ Pro:h14

	colorscheme kolor
endif

" Vundle
"" Set runtime path to include Vundle
if has('win32') || has('win64')
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim
    let vundlepath='$HOME/vimfiles/bundle'
else
    set rtp+=$HOME/.vim/bundle/Vundle.vim
    let vundlepath='$HOME/.vim/bundle'
endif

call vundle#rc(vundlepath)
call vundle#begin() 		"Required

"" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"" Other Bundles
Plugin 'Bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'othree/html5.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'pangloss/vim-javascript'

"" All other Plugins must be added before following line
call vundle#end()			"Required

filetype plugin indent on	"Required

" Change Vim behavior
"" General
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set title
set ruler
set fileformat=unix

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" History
set history=500
set undolevels=500

"" Command line completion
set wildmenu
set wildmode=list:longest,full
set wildignore=*.swp,*.bak,*.pyc,*.class

"" Don't use keyboard beep for errors
set visualbell
set noerrorbells

" No backup/swap files
set nobackup
set noswapfile

set fileformat=unix

" Remap vim keys
"" Remap escape key for insert modes
inoremap jk <esc>
inoremap <esc> <nop>
"" Remap escape key for visual modes
vnoremap jk <esc>
vnoremap <esc> <nop>

"" Change mapleader from \ to ,
let mapleader=","

"" Open netrw file explorer window
nnoremap <leader>e :topleft vsplit .<CR>

"" Change open file's working directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"" File shortcuts
nnoremap <leader>w :w<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>x :q!<CR>

"" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Editing shortcuts
"" Delete line under cursor
nnoremap <leader>d dd

" EDI
" Special Editing Shortcuts
"" Replace end of segment character with end of segment/line feed
"" for easier viewing
nnoremap <silent> <leader>er :call ChangeSegChar()<CR>

" Navigation
"" Disable arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"" Disable arrow keys in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"" Disable arrow keys in visual mode
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Close current window
nnoremap <c-c> <c-w>c
"" Open new window
nnoremap <c-n> <c-w>n

"" File shortcuts
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :wq<CR>
nnoremap <silent> <leader>x :q!<CR>

"" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

""" Coding
" Syntax
syntax on
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

" Whitespace/indenting
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set list listchars=tab:\ \ ,trail:-
set shiftround

" PEP 8 Compliant settings for Python
autocmd FileType python set textwidth=79

" Folding
set foldmethod=indent

"" Fold/Unfold
nnoremap <leader>a za

" Functions
"" EDI
""" Replace segment character with segment character/line feed
function! ChangeSegChar()
  %s/\~/\~\r/ge
endfunction

" Autogroups
"" Reload vimrc after modification
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Autocommands
"" Delete all whitespace at end of line
autocmd BufWritePre * :%s/\s\+$//e
