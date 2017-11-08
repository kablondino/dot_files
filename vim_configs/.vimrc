set nocompatible              " be iMproved, required
filetype off                  " required

" VUNDLE SETUP START
set rtp+=~/.vim/bundle/Vundle.vim " Default path
call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'

Plugin 'luochen1990/rainbow'

Plugin 'nelstrom/vim-markdown-folding'

Plugin 'matze/vim-tex-fold'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" VUNDLE SETUP END

filetype plugin indent on    " required


" COLORSCHEME SPECIFIC OPTIONS
set bg=dark
colorscheme swagdino_pencil

" For the original color
"colorscheme swagdino
"hi Normal guifg=#C6C6C6 ctermfg=254 ctermbg=NONE cterm=NONE
"hi Comment guifg=#875F00 guibg=NONE guisp=NONE gui=italic ctermfg=94 ctermbg=NONE cterm=italic
"hi CursorLineNr guifg=#000000 guibg=#afff00 guisp=NONE gui=bold,italic ctermfg=232 ctermbg=154 cterm=bold,italic

" Solarized
"colorscheme solarized
"let g:solarized_termcolors=256

" Specific colors for paretheses and math operators
autocmd BufRead,BufNewFile * syn match parens /[(){}\[\]]/ | hi parens ctermfg=9
autocmd BufRead,BufNewFile * syn match MyOperators /[\+\-\=\/]/ | hi MyOperators ctermfg=219


set encoding=utf-8

" Line number configurations
set number
" Set nummbers on losing and gaining window focus
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber

" Toggle RELATIVE line numbers on and off with Ctrl-L (upper or lower case)
function! g:NumberToggle()
	if &relativenumber == 0
		set relativenumber
	else
		set norelativenumber
	endif
endfunction
nnoremap <silent><C-L> :call g:NumberToggle()<cr>

" Set the cursorline and cursorcolumn
set cursorline
"autocmd BufWinEnter * if getfsize(expand(@%)) < 10000 | set cursorcolumn | set cursorline | else | set nocursorcolumn | set nocursorline | endif

syntax on

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

" Sets list characters (\t, \n, etc.)
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
autocmd BufNewFile,BufRead *.sage,*.spyx,*.pyx set filetype=python

" Turn off line cursor and turn on spell check, linebreak for some files
autocmd BufEnter *.md setlocal spell spelllang=en linebreak nocursorline nocursorcolumn
autocmd BufEnter *.tex setlocal linebreak nocursorline nocursorcolumn

" Searching things
set incsearch
set ignorecase smartcase
"Hit Esc to unhighlight searched term
nnoremap <silent><esc> :noh<return><esc>

" Autocomplete pairing of braces and parentheses
"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}
"inoremap (      ()<Left>
"inoremap (<CR>  (<CR>)<Esc>0
"inoremap ((     (
"inoremap ()     ()

