
" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages itself
Plugin 'VundleVim/Vundle.vim'

Plugin 'fatih/vim-go'

Plugin 'altercation/vim-colors-solarized'

call vundle#end()

" Disable visual/audible bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set autoindent
set cindent

" Global tab settings
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

set number

" Config required for YCM
let g:ycm_autoclose_preview_window_after_insertion = 1

" Statusline setup
set laststatus=2
set statusline=%t
set statusline+=\ %{&ff}
set statusline+=\ %h
set statusline+=%m
set statusline+=%r
set statusline+=\ %y
set statusline+=%=
set statusline+=%c,
set statusline+=%l/%L
" Old Statusline
" set statusline=%f\ \ FileType:%y\ \ %l,%c
" set laststatus=2

" Read file when changed
set autoread

" Line numbers
set relativenumber
set number
set numberwidth=4

" Set solarized colors
syntax enable
set background=dark
colorscheme solarized

" Go stuff
autocmd FileType go setlocal tabstop=2
autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal softtabstop=2
autocmd FileType go setlocal shiftwidth=2

filetype plugin indent on
filetype on
filetype plugin on

