" php
" http://vimawesome.com/plugin/php-vim-shouldve-said-no
Plugin 'stanangeloff/php.vim'

" phpdoc highlighter
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
