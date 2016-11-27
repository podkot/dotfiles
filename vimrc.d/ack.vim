""" Ack """
" https://github.com/mileszs/ack.vim
" requires ag binary & http://beyondgrep.com/install/
Plugin 'mileszs/ack.vim'

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

nnoremap <C-F> :Ack<space>
inoremap <C-F> <esc>:Ack<space>
