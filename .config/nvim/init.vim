set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dense-analysis/ale'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()
filetype plugin indent on

set laststatus=2
syntax on
colorscheme elflord

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

set nowrap
set mouse=a
set number

call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

set omnifunc=ale#completion#OmniFunc
