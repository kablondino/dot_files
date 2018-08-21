"  ███████╗██╗    ██╗ █████╗  ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ 
"  ██╔════╝██║    ██║██╔══██╗██╔════╝ ██╔══██╗██║████╗  ██║██╔═══██╗
"  ███████╗██║ █╗ ██║███████║██║  ███╗██║  ██║██║██╔██╗ ██║██║   ██║
"  ╚════██║██║███╗██║██╔══██║██║   ██║██║  ██║██║██║╚██╗██║██║   ██║
"  ███████║╚███╔███╔╝██║  ██║╚██████╔╝██████╔╝██║██║ ╚████║╚██████╔╝
"  ╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ 
"                                                                   
"  ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗                          
"  ██║   ██║██║████╗ ████║██╔══██╗██╔════╝                          
"  ██║   ██║██║██╔████╔██║██████╔╝██║                               
"  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║                               
"   ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗                          
"    ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝                          


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
Plugin 'mgee/lightline-bufferline'

Plugin 'ryanoasis/vim-devicons'	" REQUIRES Nerd Font

Plugin 'Konfekt/FastFold'		" Unchecked with other folding plugins!
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'matze/vim-tex-fold'
Plugin 'tmhedberg/SimpylFold'

Plugin 'tpope/vim-fugitive'

"Plugin 'severin-lemaignan/vim-minimap'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" VUNDLE SETUP END

filetype plugin indent on    " required

set showcmd

" COLORSCHEME SPECIFIC OPTIONS
set bg=dark
colorscheme swagdino

" Specific colors for paretheses and math operators; BREAKS LaTeX!
"autocmd BufRead,BufNewFile * syn match parens /[(){}\[\]]/ 
"			\| hi parens guifg=#ff0000 ctermfg=9
"autocmd BufRead,BufNewFile * syn match MyOperators /[\+\-\=\/]/ 
"			\| hi MyOperators guifg=#ffafff ctermfg=219

" ---------------------------------------------------------------------------
"  Status Line Configuration with Lightline and Lightline-Buffer
" ---------------------------------------------------------------------------
set noshowmode	" Removes duplicate info on the command line
let g:lightline = {
	\ 'colorscheme': 'deus',
	\ 'tabline': {
	\	'left': [ [ 'bufferinfo' ], [ 'buff_separator' ],
	\			[ 'buffers' ], ],
	\	'right': [ [ 'close' ], ],
	\ },
	\ 'tabline_separator': { 'left': '', 'right': '' },
	\ 'tabline_subseparator': { 'left': '', 'right': ''},
	\
	\ 'active': {
	\	'left': [ [ 'mode', 'paste', 'spell' ], [ 'readonly', 'modified',
	\			'filename' ], [ 'char_hex_value' ] ],
	\	'right': [ [ 'lineinfo' ], [ 'percent' ],
	\			[ 'fileencoding', 'filetype'] ],
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
	\		'buffers': 'lightline#bufferline#buffers'
	\ },
	\ 'component_type': {
	\		'buffers': 'tabsel',
	\ },
	\
	\ 'component': {
	\		'char_hex_value': '0x%B',
	\		'filename': '%f',
	\		'lineinfo': '%3l|%-2v',
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

let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#modified = ''
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#read_only = ''

let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

" REMAP ARROW KEYS! to switch between buffers
nnoremap <Left> :bprev<return>
nnoremap <Right> :bnext<return>
 
let g:lightline.separator = { 'left': '', 'right': '' }	" U+E0B0 - E0C7
let g:lightline.subseparator = { 'left': '', 'right': '' }


set laststatus=2					" Always show last status
"set statusline=%f\ =\ Filetype:\ %y
set hidden							" Allows buffer switching without saving
set showtabline=2					" Always show tabs


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

" Turn OFF Vim's default python behavior
let g:python_recommended_style = 1
" Tab length
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 smarttab

" Backspace by default does NOT delete already-written text.
" backspace=2 changes this.
"set backspace=2

set showmatch
set mouse=a

" Sets list characters (\t, \n, etc.)
set list
if has('multi_byte') && &encoding ==# 'utf-8'
	let &listchars = 'tab:▸·,trail:·,eol:¬,extends:,precedes:,nbsp:±'
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

" LaTeX Fold customization
let g:tex_fold_sec_char='§'
let g:tex_fold_env_char='ﲖ'
let g:tex_fold_allow_marker=1
let g:tex_fold_override_foldtext=1
" SageTeX Folding
let g:tex_fold_additional_envs = ['sageblock', 'sagesilent']

" Turn off line cursor and turn on spell check, linebreak for some files
autocmd BufEnter,BufNewFile,BufRead *.md,*.MD setlocal spell spelllang=en
			\ linebreak nocursorline nocursorcolumn
autocmd BufEnter,BufNewFile,BufRead *.tex setlocal spell spelllang=en
			\ linebreak nocursorline nocursorcolumn
" Turn spell check ON for ALL non-comments in tex (latex) files
autocmd BufEnter,BufNewFile,BufRead *.tex syntax spell toplevel
let g:tex_comment_nospell=1

" Searching things
set incsearch
set ignorecase smartcase
" Hit F3 to unhighlight searched term
nnoremap <silent><F3> :noh<return>

" Show and hide 'Minimap'
"let g:minimap_toggle='<F4>'

" Autocomplete pairing of braces and parentheses
"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}
"inoremap (      ()<Left>
"inoremap (<CR>  (<CR>)<Esc>0
"inoremap ((     (
"inoremap ()     ()

