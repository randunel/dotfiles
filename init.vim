" autoload/
"   plug.vim // curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" To install, run :PlugInstall
call plug#begin('~/.config/nvim/plugged')

Plug 'neomake/neomake'
Plug 'mhartington/nvim-typescript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'for': ['typescript', 'tsx'], 'do': ':!install.sh \| UpdateRemotePlugins'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } " required npm install -g tern
Plug 'racer-rust/vim-racer'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'

call plug#end()

let g:neomake_javascript_maker = ['eslint']
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost,BufEnter * Neomake

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

imap jj <ESC>:w<CR>

set number

" Switch buffer without having to save
set hidden

set noswapfile

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

set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey guibg=lightgrey

highlight Search cterm=NONE ctermfg=black ctermbg=yellow

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
:autocmd InsertLeave * redraw!

autocmd BufNewFile,BufRead *.ejs setlocal shiftwidth=2 tabstop=2

set undodir=~/.config/nvim/undodir
set undofile

" Autocomplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_buffer_path = 1
let g:deoplete#file#enable_buffer_path = 1
" Tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd CompleteDone * pclose!

let g:indentLine_enabled = 1
let g:indentLine_char = 'ˌ'

" scroll when fewer than 2 lines left around the cursor
set so=2
