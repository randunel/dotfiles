" .vim
" |-- vimrc
" |-- autoload
" |   |-- pathogen.vim
" |-- bundle
"     |-- indentLine
"     |-- jshint2.vim
"     |-- syntastic
"     |-- vim-javascript
"     |-- youcompleteme
"     |-- rust.vim
"
execute pathogen#infect()
syntax on
filetype plugin indent on

set number

" Switch buffer without having to save
set hidden

set hlsearch
set incsearch

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set noswapfile
set nowritebackup
set nocompatible

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
:autocmd InsertLeave * redraw!

set list
set listchars=tab:>-,

set showcmd

"Restore cursor to file position in previous session
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction
augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

"let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']

set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey guibg=lightgrey

let g:indentLine_char = 'ˌ'

imap jj <ESC>:w<CR>

set so=2

set backspace=indent,eol,start

let g:ycm_autoclose_preview_window_after_insertion=1

autocmd BufNewFile,BufRead *.ejs setlocal shiftwidth=2 tabstop=2

