call pathogen#infect()
if has("statusline")
	set laststatus=2
	set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif
set t_Co=256
"let g:zenburn_alternate_Visual = 1
"let g:zenburn_high_Contrast = 1
colorscheme zenburn

set ts=4
set sw=4

" Same position cursor
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ let b:doopenfold = 1 |
    \ endif
    " Need to postpone using "zv" until after reading the modelines.
    autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \ unlet b:doopenfold |
    \ exe "normal zv" |
    \ endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
endif

filetype plugin on

set showmatch       " Show matching brackets.
set viminfo='20,\"50    " read/write a .viminfo file, don't store more than
						" 50 lines of registers
set textwidth=79    " Wrap lines by default at 78 characters
set backspace=indent,eol,start  " more powerful backspacing
set autoindent      " always set autoindenting on
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set tabstop=4
set softtabstop=4 " makes the spaces feel like real tabs
set shiftwidth=4
set notitle
set modeline
set nohlsearch

syntax on


"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

let mapleader = "\<Space>"

nmap <F8> :TagbarToggle<CR>
"nmap <silent><Leader>t <Esc>:TagbarToggle<CR>

nnoremap <Leader>w :w<CR>

" Pytest
au FileType python nnoremap <silent><Leader>s <Esc>:Pytest next<CR>
au FileType python nnoremap <silent><Leader>f <Esc>:Pytest file looponfail<CR>
au FileType python nnoremap <silent><Leader>c <Esc>:Pytest class<CR>
au FileType python nnoremap <silent><Leader>m <Esc>:Pytest method<CR>
au FileType python nnoremap <silent><Leader>p <Esc>:Pytest project<CR>

let python_highlight_all=1

" jedi-vim
let g:jedi#popup_on_dot = 0

"nerdtree
nmap <F7> :NERDTreeToggle<CR>
nmap <silent><Leader>n <Esc>:NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
"autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pep8']

let g:airline_theme='zenburn'
let g:airline_powerline_fonts = 1


py <<EOF
import sys
import os
homedir = os.environ["HOME"]
sys.path.insert(0, os.path.join(homedir, ".vim/rope/"))
sys.path.insert(0, os.path.join(homedir, ".vim/ropemode/"))
sys.path.insert(0, os.path.join(homedir, ".vim/bundle/ropevim"))
EOF
