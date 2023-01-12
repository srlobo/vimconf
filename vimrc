let g:pathogen_disabled = []
if v:version < '703'
	call add(g:pathogen_disabled, 'unite.vim')

endif
if !has('python')
	call add(g:pathogen_disabled, 'jedi-vim')
endif

call pathogen#infect()
if has("statusline")
	set laststatus=2
	set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif
set t_Co=256
"let g:zenburn_alternate_Visual = 1
"let g:zenburn_high_Contrast = 1
colorscheme zenburn
"set background=light
"colorscheme PaperColor
"colorscheme github

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

" Indentación en JS/TS
" set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
"
autocmd FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType typescript set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

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
au FileType python set textwidth=79

let python_highlight_all=1

" jedi-vim
let g:jedi#popup_on_dot = 0

"nerdtree
nmap <F7> :NERDTreeToggle<CR>
nmap <silent><Leader>n <Esc>:NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
"autocmd VimEnter * wincmd p
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" autocmd VimEnter * NERDTree | wincmd p

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_python_checkers = ['pep8', 'flake8', 'pyflakes', 'pycodestyle']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_dockerfile_checkers = ['hadolint']
let g:syntastic_dockerfile_hadolint_args = '--no-color'
let g:syntastic_sh_shellcheck_args = '-x'

let g:airline_theme='zenburn'
let g:airline_powerline_fonts = 1


if has('python')
py <<EOF
import sys
import os
homedir = os.environ["HOME"]
sys.path.insert(0, os.path.join(homedir, ".vim/rope/"))
sys.path.insert(0, os.path.join(homedir, ".vim/ropemode/"))
sys.path.insert(0, os.path.join(homedir, ".vim/bundle/ropevim"))
EOF
endif

set wildmenu
set wildmode=full
source $VIMRUNTIME/menu.vim
set wildcharm=<C-Z>
map <silent><leader>m <ESC>:emenu <C-Z>

autocmd FileType java setlocal omnifunc=javacomplete#Complete
" autocmd FileType yaddml setlocal ts=2 sts=2 sw=2 expandtab
augroup yaml_fix
	autocmd!
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
augroup END
autocmd BufNewFile,BufRead .releaserc set filetype=json

" Indent char
let g:indentLine_char = '⦙'

" Start with all unfolded
set foldlevelstart=20

" ilya suggestion:
highlight nonascii guibg=DarkGreen ctermbg=DarkGreen term=standout
au BufRead * syntax match nonascii "[^\u0000-\u007F]"
match nonascii / / " (CTRL+V x a 0)

function DeleteRedundantSpaces()
	let cline = line(".")
	let ccol = col(".")
	silent! %s/\s\+$//g
	call cursor(cline, ccol)
endfunction
au BufWrite * call DeleteRedundantSpaces()

let g:vim_json_syntax_conceal = 0
let g:indentLine_setConceal = 1

" Go syntax highlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" disable all linters as that is taken care of by coc.nvim
" let g:go_diagnostics_enabled = 0
" let g:go_metalinter_enabled = []
let g:go_metalinter_autosave = 1

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

autocmd FileType go set noexpandtab nosmarttab
autocmd FileType json set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

" yamlpath
let g:yamlpath_sep = "."
let g:yamlpath_auto = 1
