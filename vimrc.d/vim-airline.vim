""" Airline """
" http://vimawesome.com/plugin/vim-airline
Plugin 'bling/vim-airline'

let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
