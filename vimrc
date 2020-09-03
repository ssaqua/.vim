execute pathogen#infect()

syntax on
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4

set expandtab
set nu

colorscheme darcula
hi! link ALEError Error
hi! link ALEWarning CodeWarning
hi! link ALEInfo CodeInfo
hi! link ALEErrorSign ErrorSign
hi! link ALEWarningSign WarningSign
hi! link ALEInfoSign InfoSign

set splitbelow
nnoremap - :terminal ++rows=20<CR>

let g:netrw_banner=0
" netrw auto-focus current file
" https://stackoverflow.com/a/29457190
function! SearchNetrw(fname)
    if ! search('\V\^' . a:fname . '\$')
        call search('^' . substitute(a:fname, '\w\zs.*', '', '') . '.*\/\@<!$')
    endif
endfunction

autocmd VimEnter * com! -nargs=* -bar -bang -count=0 -complete=dir Explore execute "call netrw#Explore(<count>,0,0+<bang>0,<q-args>)" . ' | call SearchNetrw(' . string(expand('%:t')) . ')'

" NERDTree configuration
let NERDTreeQuitOnOpen=1

function! NERDTreeToggleFind()
    if g:NERDTree.IsOpen()
        execute ':NERDTreeClose'
    else
        execute ':NERDTreeFind'
    endif
endfunction

map <silent> <C-n> :call NERDTreeToggleFind()<CR>

" https://github.com/ggreer/the_silver_searcher
let g:ackprg = 'ag --vimgrep'

" linting with vim-airline and ale
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {'ruby': ['rubocop']}
