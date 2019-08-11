execute pathogen#infect()

syntax on
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4

set expandtab
set nu

let g:netrw_banner=0
" netrw auto-focus current file
" https://stackoverflow.com/a/29457190
function! SearchNetrw(fname)
    if ! search('\V\^' . a:fname . '\$')
        call search('^' . substitute(a:fname, '\w\zs.*', '', '') . '.*\/\@<!$')
    endif
endfunction

autocmd VimEnter * com! -nargs=* -bar -bang -count=0 -complete=dir Explore execute "call netrw#Explore(<count>,0,0+<bang>0,<q-args>)" . ' | call SearchNetrw(' . string(expand('%:t')) . ')'