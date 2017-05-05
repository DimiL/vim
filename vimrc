" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'easymotion/vim-easymotion'

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'tpope/vim-fugitive'

Plugin 'vim-scripts/FuzzyFinder'

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'skywind3000/asyncrun.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.


" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nu
set cursorline
set ai
set formatoptions+=r
set expandtab
set tabstop=2
set shiftwidth=2
set hlsearch

inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i
inoremap {<CR> {<CR>}<Esc>ko
imap <C-D> <C-O>x

set ls=2
set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
highlight StatusLine term=bold,reverse cterm=bold,reverse

" Highlight trailing white space "
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted

set ignorecase
set smartcase

set nois
set pastetoggle=<F3>

" Dimi's hot key
" (Change leader key to space)
let mapleader = "\<Space>"

" (Quick Save)
" But ctrl-s is flow control, so to make this work
" Need to disable it in bashrc
" vim()
" {
"     # osx users, use stty -g
"     local STTYOPTS="$(stty --save)"
"     stty stop '' -ixoff
"     command vim "$@"
"     stty "$STTYOPTS"
" }
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>

" (Move/Action in Tab/Window)
" (Split window)
nmap <C-j> :bot new<CR>
nmap <C-k> :new<CR>
nmap <C-l> :rightb vnew<CR>
nmap <C-h> :vnew<CR>

" (New/Move tab)
nmap <S-tab>   :tabnext<CR>
nmap <S-t>     :tabnew<CR>
imap <S-tab>   <Esc>:tabnext<CR>i
" this affect t"
""inoremap <S-t>     <Esc>:tabnew<CR>

nmap <S-c> :q!<CR>
nmap <S-j> <C-w>j
nmap <S-k> <C-w>k
nmap <S-l> <C-w>l
nmap <S-h> <C-w>h

" [Plugin] YouCompleteMe key mapping
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" (Disable syntax check)
let g:ycm_show_diagnostics_ui = 0

" (Disable preview window)"
let g:ycm_autoclose_preview_window_after_completion = 1

" [Plugin] easymotion key mapping "
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" (Use this for usual move)
nmap s <Plug>(easymotion-overwin-f)

" Move to line
" (Use this for line movement)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Move to word
" (Use this in Visual Mode)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Search
" (With this search we can use TAB)
map  <Leader>s <Plug>(easymotion-sn)
omap <Leader>s <Plug>(easymotion-tn)

"[Plugin] NerdTree key mapping "
map <F2> :NERDTreeTabsToggle<CR>

" Ignore files
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

"[Plugin] FuzzyFinder key mapping "
map ff <ESC>:FufFile<CR>

"Map function key
map <F3> :tabdo e<CR>
map <F4> :tabdo w<CR>

"[Firefox]This is for firefox only
"Create only 1 quickfix window in the end of tab
map <F5> :tabdo ccl<CR>:$tabnew<CR>:AsyncRun make<CR>:q<CR>

augroup vimrc
  autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END

augroup QuickfixStatus
	au! BufWinEnter quickfix setlocal
		\ statusline=%t\ [%{g:asyncrun_status}]\ %{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P
augroup END
