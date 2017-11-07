set nocompatible              " be iMproved, required
filetype off                  " required

" VUNDLE SETUP START
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'vim-airline/vim-airline'
Plugin 'itchyny/lightline.vim'

Plugin 'nelstrom/vim-markdown-folding'

Plugin 'matze/vim-tex-fold'
" Plugin 'lervag/vimtex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" VUNDLE SETUP END

filetype plugin indent on    " required

set encoding=utf-8

" Line number shenanigans
set number
set relativenumber
set cursorline
autocmd BufWinEnter * if getfsize(expand(@%)) < 10000 | set cursorcolumn | set cursorline | else | set nocursorcolumn | set nocursorline | endif

" Set nummbers on losing and gaining window focus
" DOES NOT CURRENTLY WORK WITH GNOME-TERMINAL
"autocmd FocusLost * set nonumber
"autocmd FocusGained * set relativenumber

" Set relative number on and off on insert
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

syntax on

" COLORSCHEME SPECIFIC OPTIONS
colorscheme swagdino
hi Normal guifg=#C6C6C6 ctermfg=253 ctermbg=NONE cterm=NONE
hi Comment guifg=#875F00 guibg=NONE guisp=NONE gui=italic ctermfg=94 ctermbg=NONE cterm=italic
set t_ZH=[3m
set t_ZR=[23m

" Tab length
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

" Set the color column
"set colorcolumn=80

set laststatus=2
set statusline=%f\ =\ Filetype:\ %y

set showmatch
set mouse=a

set list
if has('multi_byte') && &encoding ==# 'utf-8'
	let &listchars = 'tab:▸·,trail:·,eol:¬,extends:❯,precedes:❮,nbsp:±'
else
	let &listchars = 'tab:> ,trail:.,eol:|,extends:>,precedes:<,nbsp%'
endif
" UNICODE for symbols:
" ▶▷▸▹►▻ (The right small triangle) U+25B5 through U+25BB
" ❪❫❬❭❮❯❰❱ (Angled brackets) U+276A through U+2772
" · (The middle dot) U+00B7
" ¬ (The not symbol) U+00AC

" Syntax for odd file types
autocmd BufNewFile,BufRead *.source set filetype=fortran
autocmd BufNewFile,BufRead *.sage set filetype=python

" Turn off line cursor and turn on spell check, linebreak for some files
autocmd BufEnter *.md setlocal spell spelllang=en linebreak nocursorline nocursorcolumn
autocmd BufEnter *.tex setlocal linebreak nocursorline nocursorcolumn

" Autocomplete pairing of braces and parentheses
"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}
"inoremap (      ()<Left>
"inoremap (<CR>  (<CR>)<Esc>0
"inoremap ((     (
"inoremap ()     ()
