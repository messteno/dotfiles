set nocompatible                               " disable vi mode
filetype off                                   " required!


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'ervandew/supertab'
Bundle 'ap/vim-css-color'
Bundle 'groenewege/vim-less'

" Grep in vim with :Ack command
Bundle 'mileszs/ack.vim'
let g:ackprg="/usr/bin/vendor_perl/ack -H --nocolor --nogroup --column"

Bundle 'flazz/vim-colorschemes'

Bundle 'junegunn/vim-easy-align'
vmap <Enter> <Plug>(EasyAlign)

Bundle 'vim-scripts/tComment'

" Braces auto close
Bundle 'Raimondi/delimitMate'

Bundle 'majutsushi/tagbar'
let g:tagbar_usearrows = 1
nnoremap <leader>q :TagbarToggle<CR>


" Appearence
set background=dark
if $TERM == 'xterm-256color'
endif

" Basic settings
set viminfo='1000,f1,:1000,/1000
set noswapfile
set nobackup
set showcmd
set lazyredraw
set noerrorbells
set visualbell t_vb=
set modeline
set sidescroll=5
set sidescrolloff=5
set showmatch " check braces
set history=1000
set undolevels=100
set ttyfast
set colorcolumn=80
set nopaste
set autoread " Set to auto read when a file is changed from the outside
set hidden
set winminheight=1
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


" Highliting
syntax on
filetype plugin on
filetype plugin indent on


" Encodings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r


"Indentation
set smartindent
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set cindent
set backspace=indent,eol,start
set whichwrap+=<,>,h,l


" Убрать автодобавление комментария при переходе на новую строку после
" однострочного комментария
autocmd FileType vim setlocal comments-=:\" comments+=f:\"
autocmd FileType c,cpp,php setlocal comments-=:// comments+=f://


" Search settings
set smartcase
set hlsearch
set incsearch
set magic


" Status line settings
set ruler " отображать текущее положение
set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P                        " percentage of file


" Mappings
imap <F2> <Esc>:set<Space>nu!<CR>a
nmap <F2> :set<Space>nu!<CR>

set pastetoggle=<F3>

imap <F6> <Esc>:tabprev <CR>i
map  <F6> :tabprev <CR>

imap <F7> <Esc>:tabnext <CR>i
map  <F7> :tabnext <CR>

nmap <F10> :q<Enter>

map <C-c> "*yy
imap <C-c> <Esc>"*yya
vmap <C-c> "*y

map <C-v> "*p
imap <C-v> <Esc>"*pa

map <C-x> "*ddk
vmap <C-x> "*d

nmap <F8> :nohlsearch<CR>
imap <F8> <Esc>:nohlsearch<CR>a

map j gj
map k gk

map <Leader>a ggVG


" Abbreviations
abbr acept accept
abbr inclde include
iabbrev /** /**************************************************************************

au BufRead /tmp/mutt-* set tw=72

colorscheme molokai

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"


" Reload .vimrc
map <silent> <leader>v :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'Source completed'"<CR>


" Remove trailing spaces on save
"autocmd BufWritePre * :%s/\s\+$//e


" ROT13
map <F12> ggVGg?

