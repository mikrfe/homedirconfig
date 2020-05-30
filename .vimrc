" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim
set t_Co=256
let base16colorspace=256

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

set nocompatible              " be iMproved, required
filetype off                  " required

set backspace=indent,eol,start

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'sudo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'cburroughs/pep8.py'
"Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/netrw.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jamessan/vim-gnupg'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'lpenz/vimcommander'
Plugin 'vimcat'
Plugin 'fmoralesc/vim-pinpoint'
" Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'vim-jp/vim-go-extra'
Plugin 'ledger/vim-ledger'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'wannesm/wmgraphviz.vim'
"Plugin 'garyburd/go-explorer'
"Plugin 'rjohnsondev/vim-compiler-go'
Plugin 'peterhoeg/vim-qml'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Chiel92/vim-autoformat'
Plugin 'klen/python-mode'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'Konfekt/FastFold'
Plugin 'ludovicchabant/vim-lawrencium'

Plugin 'Blackrush/vim-gocode'

"Plugin 'sourcegraph/sourcegraph-vim'

Plugin 'dart-lang/dart-vim-plugin'

Plugin 'Shougo/vimproc.vim'
Plugin 'jceb/vim-hier'
Plugin 'dannyob/quickfixstatus'
Plugin 'miyakogi/vim-dartanalyzer'

Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

Plugin 'jceb/vim-orgmode'

Plugin 'vim-scripts/SyntaxRange'
Plugin 'mattn/calendar-vim'
Plugin 'vim-scripts/NrrwRgn'
Plugin 'tpope/vim-speeddating'
Plugin 'vim-scripts/taglist.vim'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/utl.vim'

Plugin 'zxqfl/tabnine-vim'

let g:SOURCEGRAPH_AUTO = "false"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:hier_enabled = 1

let g:formatdef_htmlbeautify = "'html-beautify -f - -t'"
let g:formatdef_cssbeautify = "'css-beautify -f - -t'"

let g:pymode_rope = 0

let g:syntastic_python_pyflakes_exe = 'python3 -m pyflakes'

set laststatus=2
syntax on
"set cursorline
set showmatch
let python_highlight_all = 1
let g:tex_flavor='latex'
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
if has('gui_running')
	"set guifont=Inconsolata\ 13 
	"set guifont=-xos4-terminus-medium-r-normal--12-120-72-72-c-60-iso10646-1
	set guifont=xos4\ Terminus\ 8
	"Input\ Mono\ 13
	set ghr=0
endif

"set list

au FileType dart set tabstop=2 shiftwidth=2 expandtab

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'


" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python =
	\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
	" alternative pattern: '\h\w*\|[^. \t]\.\w*'
let g:jedi#popup_select_first = 0

let g:jedi#force_py_version = 2

"autocmd FileType go setlocal omnifunc=go#complete#Complete

" Go related mappings
 au FileType go nmap <Leader>i <Plug>(go-info)
 au FileType go nmap <Leader>gd <Plug>(go-doc)
 au FileType go nmap <Leader>r <Plug>(go-run)
 au FileType go nmap <Leader>b <Plug>(go-build)
 au FileType go nmap <Leader>t <Plug>(go-test)
 au FileType go nmap gd <Plug>(go-def-tab)

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline_theme             = 'powerlineish'
let g:airline#extensions#branch#enabled     = 1
let g:airline#extensions#syntastic#enabled  = 1
" vim-powerline symbols
let g:airline_powerline_fonts = 0
"let g:airline_left_sep          = '⮀'
"let g:airline_left_alt_sep      = '⮁'
"let g:airline_left_sep      = '⮁'
"let g:airline_right_sep         = '⮂'
"let g:airline_right_alt_sep     = '⮃'
"let g:airline_right_sep     = '⮃'
"let g:airline#extensions#branch#prefix     = '⭠'
"let g:airline#extensions#readonly#symbol   = '⭤'
"let g:airline#extensions#linecolumn#prefix = '⭡'
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

nnoremap <F5> :GundoToggle<CR>
let g:gundo_right = 1
let g:pep8_map='F6'

"let maplocalleader = "\\"
"let mapleader = "\\"

colorscheme elflord

hi Folded guibg=#454545
hi Folded ctermbg=240

map <F10> :set wrap!<LF>  " toggle wrapping
set nowrap  " disable line wrapping
set mouse=a  " enable mouse support in console
set number  " show line numbers

let g:pandoc#spell#default_langs = ['pl', 'en']

"let g:promptline_theme = 'powerlineclone'
"let g:promptline_preset = {
"	\'a': [ promptline#slices#host(), promptline#slices#user() ],
"	\'b': [ promptline#slices#cwd() ],
"	\'y' : [ promptline#slices#vcs_branch({'hg': 1,'svn': 0,'fossil': 0}) ],
"	\'z' : [ promptline#slices#python_virtualenv() ],
"	\'warn' : [ promptline#slices#last_exit_code(), promptline#slices#battery() ]}
