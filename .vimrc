" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line 
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map leader key to space
let mapleader = "\<Space>"

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" The default setting of 'laststatus' is for the statusline to not appear until a split is created.
" If you want it to appear all the time, add the following to your vimrc
set laststatus=2

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" One particularly useful setting is hidden. Its name isn’t too descriptive,
" though. It hides buffers instead of closing them. This means that you can
" have unwritten changes to a file and open a new file using :e, without being
" forced to write or undo your changes first. Also, undo buffers and marks are
" preserved while the buffer is open. This is an absolute must-have.
set hidden

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'klen/python-mode'
Plugin 'vim-scripts/indentpython.vim'
" File Browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Syntax Checking/Highlighting
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
" Color Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" Git Integration
Plugin 'tpope/vim-fugitive'
" The best plugin for Python auto-complete
Bundle 'Valloric/YouCompleteMe'
" Lean & mean status/tabline for vim that's light as air.
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Pyenv requieres jedi-vim
Plugin 'davidhalter/jedi-vim'
Plugin 'lambdalisue/vim-pyenv'
" Latex
Plugin 'gerw/vim-latex-suite'
" EditorConfig helps developers define and maintain consistent coding styles
" between different editors and IDEs
Plugin 'editorconfig/editorconfig-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" add a bit of logic to define which scheme to use based upon the VIM mode
if has('gui_running')
  set background=dark
  colorscheme solarized
endif

" Keyboard mapping
noremap <F2> :set invnumber<CR>
noremap <F3> :NERDTreeToggle<CR>
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" C
au BufRead,BufNewFile *.c,*.h set expandtab
au BufRead,BufNewFile *.c,*.h set tabstop=4
au BufRead,BufNewFile *.c,*.h set shiftwidth=4
au BufRead,BufNewFile *.c,*.h set autoindent
au BufRead,BufNewFile *.c,*.h match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.c,*.h match BadWhitespace /\s\+$/
au         BufNewFile *.c,*.h set fileformat=unix
au BufRead,BufNewFile *.c,*.h let b:comment_leader = '/* '

" Python, PEP-008
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw set textwidth=119
au BufRead,BufNewFile *.py,*.pyw set tabstop=4
au BufRead,BufNewFile *.py,*.pyw set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set autoindent
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
au         BufNewFile *.py,*.pyw set fileformat=unix
au BufRead,BufNewFile *.py,*.pyw let b:comment_leader = '#'

" Makefile
au BufRead,BufNewFile Makefile* set noexpandtab

let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Python-mode configuration
" instead of Rope we use jedi-vim
let g:pymode_rope = 0
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
" don't use linter, we use syntastic for that
let g:pymode_lint_write = 0
let g:pymode_lint_signs = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args="--ignore=E501 --max-line-length=120"
" don't put icons on the sign column (it hides the vcs status icons of signify)
" let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
nnoremap <silent> <F5> :SyntasticCheck<CR> 

let g:jedi#show_call_signatures = 2
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures_delay = 0

if jedi#init_python()
    function! s:jedi_auto_force_py_version() abort
        let major_version = pyenv#python#get_internal_major_version()
        call jedi#force_py_version(major_version)
    endfunction
    augroup vim-pyenv-custom-augroup
        au! *
        au User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
        au User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
    augroup END
endif
