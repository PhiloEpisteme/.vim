""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen settings                                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
execute pathogen#helptags()

filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Tabbing
let mapleader = "," "Sets the leader to , instead of \
set smartindent
set tabstop=4 " Sets tabs to 4 spaces
set shiftwidth=4 " < and > indent/unindent 4 spaces
set smarttab " Uset 'shiftwidth' setting at start of lines
set expandtab " Inserts four spaces with the tab key
set softtabstop=4 " Treats four spaces as one tab
set autoindent
set backspace=indent,eol,start " Treat backspace like in most editors

""" General options
syntax enable " enable syntax coloring
set shell=/bin/bash
set diffopt=vertical
set ruler " Always show curent position
set number " Turn on line numbers
set vb t_vb= " Flash screen in place of beeps
set showmatch " Show matching brackets
set nobackup " Don't make backup files
set noswapfile " Don't make .swp files

""" Searching
set incsearch " Search as you type
set hlsearch "Highlight search term in text
set ignorecase " All lowercase strings are case insensitive, but if one
set smartcase " character is upper-case, it's case sensitive

" Press Space to turn off highlighting
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Press F4 to toggle highlighting and show current value
:noremap <F4> :set hlsearch! hlsearch?<CR>

""" Status Line
set statusline=[%F]%=%l/%L(%p%%)\ %c(%b\|%B)
set laststatus=2
"
""" .vimrc
" Automatically resource the .vimrc after changes
autocmd! bufwritepost .vimrc source %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim colors solarized                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark " Set solarized setting to light/dark
colorscheme solarized


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Relative Line Number Settings                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set linenumber style toggle
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

function! NoNumber()
    if(&relativenumber == 1)
        set norelativenumber
    endif
    if(&number == 1)
        set nonumber
    else
        set number
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
nnoremap <C-c> :call NoNumber()<cr>

" Set linenumber style based on whether vim is in focus
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" Set linenumber style based on insert or normal mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
"""""
" Credit for the above section belongs to Jeff Kreeftmeijer and his post at
" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
"""""
