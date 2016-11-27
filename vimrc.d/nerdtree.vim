""" NERDTree """

" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" http://vimawesome.com/plugin/vim-nerdtree-tabs
Plugin 'jistr/vim-nerdtree-tabs'

"Open sidebar with ctrl+k
map <C-k> :NERDTreeTabsToggle<CR>


" http://vimawesome.com/plugin/nerdtree-git-plugin
Plugin 'xuyuanp/nerdtree-git-plugin'
