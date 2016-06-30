filetype off
syntax enable
set number
set background=dark
let base16colorspace=256

call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'Rip-Rip/clang_complete'
Plug 'racer-rust/vim-racer'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'Raimondi/delimitMate'
" Plug 'flowtype/vim-flow'
" Plug 'steelsojka/deoplete-flow'
Plug 'honza/vim-snippets'
Plug 'neomake/neomake'
call plug#end()

colorscheme base16-chalk

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
let g:python_host_prog = '/usr/local/bin/python' 
let g:python3_host_prog = '/usr/local/bin/python3' 
let g:deoplete#enable_at_startup = 1
let deoplete#sources#jedi#show_docstring = 1
inoremap <expr><C-space> neocomplete#start_manual_complete()
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd! BufWritePost * Neomake
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 1

set encoding=utf-8
set termencoding=utf-8
set clipboard=unnamed

"let g:flow#autoclose = 1

let g:user_emmet_install_global = 0
autocmd FileType html,css,htmljinja EmmetInstall

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
