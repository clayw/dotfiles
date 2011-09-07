" Use Vim settings instead of Vi
set nocompatible
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set autoindent
" keep 50 lines of command line history
set history=50
" show the cursor position all the time
set ruler
" display incomplete commands
set showcmd
" do incremental searching
set incsearch
" do highlight of matches in search
set hlsearch
" Don't use Ex mode, use Q for formatting
map Q gq
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  "autocmd BufReadPost *
   " \ if line("'\"") > 0 &mp;&mp; line("'\"") <= line("$") |
    "\   exe "normal g`\"" |
    "\ endif

endif " has("autocmd")

" enabling colors
set term=builtin_ansi
syntax on

" tab complete ignores listed extensions
set wildignore=*.o,*.class

" cancel visualbell
set vb t_vb=

" map j to gj and k to gk, so line navigation ignores line wrap
nmap j gj
nmap k gk

set number
set tabstop=4
set shiftwidth=4
set expandtab

"ad-hoc filetypes that may not be recognized by vim on older dev box"
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd BufNewFile,BufRead *.hsc set filetype=haskell
augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
  au BufNewFile,BufRead *.scala set filetype=scala syntax=scala
augroup END 

"best theme"
colorscheme delek

"typos"
map :W :w
map :Wq :wq
