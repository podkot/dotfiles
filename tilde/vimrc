let mapleader = '\'
let vimsettings = '~/dotfiles/vimrc.d'

set nocompatible
filetype off

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
"...All your other bundles...
if iCanHazVundle == 0
    Vundle 'VundleVim/Vundle.vim'
    :VundleInstall
endif
" Setting up Vundle - the vim plugin bundler end


for fpath in split(globpath(vimsettings, '*.vim'), '\n')
  exe 'source' fpath
endfor

call vundle#end()

if iCanHazVundle == 0
    :PluginInstall
endif


""""""""
if has('autocmd')
    filetype plugin indent on

    " Auto change the directory to the current file I'm working on
    autocmd BufEnter * lcd %:p:h
endif

if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


silent! colorscheme Monokai

" Use :help 'option' to see the documentation for the given option.
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set incsearch

set laststatus=2
set ruler
set showcmd
set wildmenu

set autoread

set encoding=utf-8
set fileencodings=utf-8,cp1251
set tabstop=4 shiftwidth=4 expandtab
set listchars=tab:▒░,trail:▓
set list

set number
set hlsearch
set ignorecase
set smartcase

" do not history when leavy buffer
set hidden

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

set completeopt=menuone,longest,preview



" Don't use Ex mode
nnoremap Q <nop>

" exit insert mode
inoremap <C-c> <Esc>

nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-w>q  :tabclose<CR>
inoremap <C-w>q  <Esc>:tabclose<CR>i

noremap  <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <Esc>:update<CR>

noremap  <C-s>q :update<CR>:quit<CR>
vnoremap <C-s>q <C-C>:update<CR>:quit<CR>
inoremap <C-s>q <Esc>:update<CR>:quit<CR>

noremap  <C-a>q :quit!<CR>
vnoremap <C-a>q <C-C>:quit!<CR>
inoremap <C-a>q <Esc>:quit!<CR>

noremap  <C-a>a :qa!<CR>
vnoremap <C-a>a <C-C>:qa!<CR>
inoremap <C-a>a <Esc>:qa!<CR>

" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <

" Paste from clipboard when in insert mode.
imap <C-V> <ESC>"+gpa
" Paste from clipboard when in visual mode. (Replace whatever is selected in visual mode.)
vmap <C-V> "+gp
" Copy selection to clipboard when in visual mode.
vmap <C-C> "+y

" 'paste' prevents autoindent on pasted text
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>



" this machine config
if filereadable(expand("~/.vimrc_local"))
  source ~/.vimrc_local
endif
