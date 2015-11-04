set nocompatible                               " disable vi mode
filetype off                                   " required!

let mapleader=","

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdcommenter'
nmap <C-_> <leader>c<space> nmap gcc <C-_>
vmap <C-_> <leader>c<space> gv
vmap gc <C-_>

"Plugin 'ervandew/supertab'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '/home/mesteno/.vim/ycm_extra_conf.py'
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_min_num_of_chars_for_completion = 1
let g:syntastic_always_populate_loc_list = 1

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

Plugin 'Valloric/ListToggle'

"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<c-j>'
""let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<c-h>'

Plugin 'honza/vim-snippets'

"Plugin 'sickill/vim-monokai'
"Plugin 'jaromero/vim-monokai-refined'
"Plugin 'lsdr/monokai'
Plugin 'crusoexia/vim-monokai'

Plugin 'ap/vim-css-color'

Plugin 'tpope/vim-fugitive'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0

Plugin 'pangloss/vim-javascript'

Plugin 'easymotion/vim-easymotion'
map f <Plug>(easymotion-s)
map s <Plug>(easymotion-s2)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

Plugin 'godlygeek/tabular'
nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t= :Tabularize /=<CR>
nmap <leader>t: :Tabularize /:\zs<CR>
vmap <leader>t: :Tabularize /:\zs<CR>

Plugin 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

Plugin 'groenewege/vim-less'

Plugin 'fatih/vim-go'

"Plugin 'scrooloose/nerdtree'

Plugin 'Shougo/unite.vim'

Plugin 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1

Plugin 'tony/tmux-config'

"Plugin 'Raimondi/delimitMate'

"Plugin 'jiangmiao/auto-pairs'

"Plugin 'vim-scripts/let-modeline.vim'

Plugin 'lervag/vimtex'
"let g:vimtex_latexmk_build_dir = '../build'

"Plugin 'LaTeX-Box-Team/LaTeX-Box'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-repeat'

Plugin 'lyokha/vim-xkbswitch'
let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']

Plugin 'tpope/vim-eunuch'

Plugin 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"Plugin 'rking/ag.vim'

Plugin 'itchyny/lightline.vim'

Plugin 'tpope/vim-abolish'

Plugin 'hynek/vim-python-pep8-indent'

Plugin 'sheerun/vim-polyglot'

Plugin 'nginx.vim'

Plugin 'junegunn/goyo.vim'

call vundle#end()            " required


" Appearence
set background=dark
if $TERM == 'xterm-256color'
endif

" Basic settings
set viminfo='1000,f1,:1000,/1000,n~/.vim-tmp/viminfo
set noswapfile
"set backup
"set backupdir=~/.vim-tmp,/var/tmp,/tmp
"set backupskip=/tmp/*
"set directory=~/.vim-tmp,/var/tmp,/tmp
"set writebackup
set nobackup
set nowb
set showcmd
set lazyredraw
set noerrorbells
set visualbell t_vb=
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif
set modeline
set sidescroll=5
set sidescrolloff=5
set showmatch " check braces
set history=1000
set undolevels=1000
set ttyfast
set colorcolumn=80
set nopaste
set autoread " Set to auto read when a file is changed from the outside
set hidden
set winminheight=1
set cursorline
set wildmenu " Visualize complete menu in command mode
set wildignore=*.o,*~,*.pyc
set list listchars=tab:\ \ ,trail:·
colorscheme monokai


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


" Linebreak on 170 characters
set lbr
set tw=170
set wrap "Wrap lines


" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif


" Highliting
syntax on
filetype plugin on
filetype plugin indent on


" Encodings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r
set ffs=unix,dos,mac


"Indentation
set smartindent
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set cindent
autocmd FileType c,cpp,php setlocal cinoptions=(0,u0,U0,l1,t0,W4


" Configure backspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=<,>,h,l


" Set 7 lines to the cursor - when moving vertically using j/k
set so=7


" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif


" Height of the command bar
set cmdheight=1


" " In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"    set mouse=a
" endif


" Убрать автодобавление комментария при переходе на новую строку после
" однострочного комментария
autocmd FileType vim setlocal comments-=:\" comments+=f:\"
autocmd FileType c,cpp,php setlocal comments-=:// comments+=f://


" Search settings
set smartcase
set hlsearch
set incsearch
set magic


" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2


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


" " Foldings
" set foldenable
" set foldlevelstart=10   " open most folds by default
" set foldnestmax=10      " 10 nested fold max
" set foldmethod=indent   " fold based on indent level
" set foldcolumn=1


set spelllang=ru_yo,en_us


augroup WrapLineInTeXFile
    autocmd!
    autocmd FileType tex setlocal textwidth=120
augroup END


" Remove trailing spaces on save
" autocmd BufWritePre * :%s/\s\+$//e
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre *.php,*.py,*.js,*.hs,*.java,*.c,*.cpp,*.md :call <SID>StripTrailingWhitespaces()

set clipboard=unnamedplus


" Abbreviations
abbr рассчет расчет
abbr recieve receive
abbr acept accept
abbr inclde include
iabbrev /** /**************************************************************************


au BufRead /tmp/mutt-* set tw=72

set grepprg=grep\ -nH\ $*


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle spell checking
map <leader>ss :setlocal spell!<cr>


" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" Mappings

imap <F2> <Esc>:set<Space>nu!<CR>a
nmap <F2> :set<Space>nu!<CR>

set pastetoggle=<F3>

imap <F6> <Esc>:tabprev <CR>i
map  <F6> :tabprev <CR>

imap <F7> <Esc>:tabnext <CR>i
map  <F7> :tabnext <CR>

nmap <F10> :q<Enter>

nmap <F8> :nohlsearch<CR>
imap <F8> <Esc>:nohlsearch<CR>a

map j gj
map k gk

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

map <leader>a ggVG

" Fast saving
nmap <leader>w :w!<cr>

"imap ;; <esc>

" Reload .vimrc
map <silent> <leader>v :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'Source completed'"<CR>

" ROT13
map <F12> ggVGg?

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>

imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>

map <leader>y "+y

map <leader>p :bp<cr>
map <leader>n :bn<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

nnoremap gV `[v`]

" Remap VIM 0 to first non-blank character
map 0 ^

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
imap <F11> 

