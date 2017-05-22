set nocompatible              " be iMproved, required
filetype off                  " required

" VUNDLE SETUP START
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" VUNDLE SETUP END

filetype plugin indent on    " required

" Line number shenanigans
set number
"set numberwidth=2
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
hi Normal guifg=#C6C6C6 ctermfg=251 ctermbg=NONE cterm=NONE
hi Comment guifg=#875F00 ctermfg=94 ctermbg=NONE cterm=italic

" Tab length
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

" Set the color column
"set colorcolumn=80

set laststatus=2
set statusline=%f\ =\ Filetype:\ %y

" Use powerline fonts for vim-airline
let g:airline_powerline_fonts = 1

set showmatch
set mouse=a

set list
set listchars=tab:▸·,trail:·,eol:¬,nbsp:%
" UNICODE for symbols:
" ▶▷▸▹►▻ (The right small triangle) U+25B5 through U+25BB
" · (The middle dot) U+00B7
" ¬ (The not symbol) U+00AC

" Syntax for odd file types
autocmd BufNewFile,BufRead *.source set filetype=fortran
autocmd BufNewFile,BufRead *.sage set filetype=python

" Turn off line cursor and turn on spell check, linebreak for some files
autocmd BufEnter *.md,*.txt setlocal spell spelllang=en linebreak nocursorline nocursorcolumn


" Autocomplete pairing of braces and parentheses
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>0
inoremap ((     (
inoremap ()     ()
