""" Delimit Mate """
" http://vimawesome.com/plugin/delimitmate
Plugin 'raimondi/delimitmate'

"create line break when pressing enter
let g:delimitMate_expand_cr = 1 " включить отступы по нажатию на enter
let g:delimitMate_expand_space = 1 " включить отступы по нажатию на пробел

" для html, необходимо дописать >:<, чтобы выставлялись правильные отступы
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>,>:<"
