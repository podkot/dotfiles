""" TComment """
" http://vimawesome.com/plugin/tcomment
Plugin 'tomtom/tcomment_vim'

let g:tcomment#replacements_xml={}      " Disable tComment to escape some entities

" Comment lines with <Leader>+/
noremap <Leader>/ :TComment<cr>
inoremap <Leader>/ <Esc>:TComment<cr>i
vnoremap <Leader>/ :TCommentBlock<cr>gv
