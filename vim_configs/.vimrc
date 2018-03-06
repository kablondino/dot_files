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
Plugin 'taohex/lightline-buffer'

Plugin 'ryanoasis/vim-devicons'	" REQUIRES Nerd Font

Plugin 'nelstrom/vim-markdown-folding'
Plugin 'matze/vim-tex-fold'

"Plugin 'xuhdev/vim-latex-live-preview'
" Enter :LLPStartPreview <source>

" All of your Plugins must be added before the following line
call vundle#end()            " required
" VUNDLE SETUP END

filetype plugin indent on    " required


" COLORSCHEME SPECIFIC OPTIONS
set bg=dark
colorscheme swagdino

" Specific colors for paretheses and math operators; BREAKS LaTeX!
"autocmd BufRead,BufNewFile * syn match parens /[(){}\[\]]/ 
"			\| hi parens guifg=#ff0000 ctermfg=9
"autocmd BufRead,BufNewFile * syn match MyOperators /[\+\-\=\/]/ 
"			\| hi MyOperators guifg=#ffafff ctermfg=219

" Vim Lightline configuration, with buffer
set noshowmode	" Removes duplicate info on the command line
let g:lightline = {
	\ 'colorscheme': 'landscape',
	\ 'tabline': {
	\	'left': [ [ 'bufferinfo' ], [ 'buff_separator' ],
	\			[ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
	\	'right': [ [ 'close' ], ],
	\ },
	\ 'tabline_separator': { 'left': '', 'right': '' },
	\
	\ 'active': {
	\	'left': [ [ 'mode', 'paste', 'spell' ], [ 'readonly', 'filename',
	\			'modified' ], [ 'char_hex_value' ] ],
	\	'right': [ [ 'lineinfo' ], [ 'percent' ],
	\			[ 'fileformat', 'fileencoding', 'filetype'] ],
	\ },
	\
	\ 'inactive': {
	\	'left': [ [ 'big_separator' ], [ 'char_hex_value',
	\			'readonly', 'filename', 'modified' ] ],
	\	'right': [ [ 'lineinfo' ], [ 'percent' ],
	\			[ 'fileformat', 'fileencoding', 'filetype'] ],
	\ },
	\
	\ 'component_expand': {
	\		'buffercurrent': 'lightline#buffer#buffercurrent',
	\		'bufferbefore': 'lightline#buffer#bufferbefore',
	\		'bufferafter': 'lightline#buffer#bufferafter',
	\ },
	\ 'component_type': {
	\		'buffercurrent': 'tabsel',
	\		'bufferbefore': 'raw',
	\		'bufferafter': 'raw',
	\ },
	\ 'component': {
	\		'char_hex_value': '0x%B',
	\		'filename': '%f',
	\		'lineinfo': '%3l:%-2v',
	\		'buff_separator': '',
	\		'big_separator': '      ',
	\ },
	\ 'component_function': {
	\		'filetype': 'MyFiletype',
	\		'fileformat': 'MyFileformat',
	\		'bufferinfo': 'lightline#buffer#bufferinfo',
	\		'readonly': 'LightlineReadonly',
	\		'modified': 'LightlineModified',
	\ }, }
function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . 
	\		WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . 
	\		WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineReadonly()	" For the status line
	return &readonly ? '' : ''	" ,	U+F023, F13E, E0A2
endfunction
function! LightlineModified()
	return &modifiable && &modified ? ' ' : ' '	" U+E240, U+F00D, F00C
endfunction

" REMAP ARROW KEYS! to switch between buffers
nnoremap <Left> :bprev<return>
nnoremap <Right> :bnext<return>
 
let g:lightline.separator = { 'left': '', 'right': '' }	" U+E0B0 - E0C7
let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline_buffer_readonly_icon = ''	" U+F023, for the buffer line
let g:lightline_buffer_modified_icon = ' '	" U+F069
let g:lightline_buffer_git_icon = ''		" U+E0A0
let g:lightline_buffer_ellipsis_icon = '…'	" U+2026
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = ''

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'
" hide buffer list
let g:lightline_buffer_excludes = ['vimfiler']

" max file name length
let g:lightline_buffer_maxflen = 30
" max file extension length
let g:lightline_buffer_maxfextlen = 3
" min file name length
let g:lightline_buffer_minflen = 16
" min file extension length
let g:lightline_buffer_minfextlen = 3
" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20


set encoding=utf-8
set fileencoding=utf-8

" Line number configurations
set number
" Set numbers on losing and gaining window focus
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
nnoremap <silent><C-L> :call g:NumberToggle()<return>

" Set the cursorline and cursorcolumn
set cursorline
set colorcolumn=80

" Better way of showing syntax
if !exists("g:syntax_on")
	syntax enable
endif

set t_ZH=[3m
set t_ZR=[23m

" Tab length
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

" Set the color column
"set colorcolumn=80

set laststatus=2					" Always show last status
set statusline=%f\ =\ Filetype:\ %y
set hidden							" Allows buffer switching without saving
set showtabline=2					" Always show tabs

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
" · (The middle dot) U+00B7
" ¬ (The not symbol) U+00AC

" Syntax for odd file types
autocmd BufNewFile,BufRead *.source set filetype=fortran
autocmd BufNewFile,BufRead *.sage,*.spyx,*.pyx set filetype=python

" Turn off line cursor and turn on spell check, linebreak for some files
autocmd BufEnter,BufNewFile,BufRead *.md setlocal spell spelllang=en
			\	linebreak nocursorline nocursorcolumn
autocmd BufEnter,BufNewFile,BufRead *.tex setlocal spell spelllang=en
			\	linebreak nocursorline nocursorcolumn
" Turn spell check ON for ALL non-comments in tex (latex) files
autocmd BufEnter,BufNewFile,BufRead *.tex syntax spell toplevel

" Searching things
set incsearch
set ignorecase smartcase
" Hit Esc to unhighlight searched term
nnoremap <silent><F3> :noh<return>

" Autocomplete pairing of braces and parentheses
"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}
"inoremap (      ()<Left>
"inoremap (<CR>  (<CR>)<Esc>0
"inoremap ((     (
"inoremap ()     ()

