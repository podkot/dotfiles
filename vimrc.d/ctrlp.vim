""" CtrlP """
" http://vimawesome.com/plugin/ctrlp-vim-everything-has-changed
Plugin 'ctrlpvim/ctrlp.vim'

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
"let g:ctrlp_cmd = 'CtrlPMixed'          " search anything (in files, buffers and MRU files at the same time.)
"let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'wa'    " search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_max_height = 15             " maxiumum height of match window
"let g:ctrlp_switch_buffer = 'et'        " jump to a file if it's open already
let g:ctrlp_use_caching = 1             " enable caching
let g:ctrlp_clear_cache_on_exit=0       " speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250              " number of recently opened files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Open ctrlp with ctrl+p
let g:ctrlp_map = '<C-p>'

function! CtrlP_OpenAtCenter(...)
  " find free window
  for n in range(0, bufnr('$'))
    if buflisted(n)
      exe bufwinnr(n) . 'wincmd w'
      break
    endif
  endfor
  call call('ctrlp#acceptfile', a:000)
endfunction

let g:ctrlp_open_func = {
\  'arg_type': 'dict',
\  'files': 'CtrlP_OpenAtCenter',
\}
