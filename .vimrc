" THE FOLLOWING IS FOR VUNDLE and plugins

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" utilsnips
"Plugin 'sirver/ultisnips'

" vim-snippets
"Plugin 'honza/vim-snippets'

" YouCompleteMe
"Plugin 'valloric/youcompleteme'

" The Nerd Tree
Plugin 'scrooloose/nerdtree'

" END VUNDLE
call vundle#end()

set number
colorscheme koehler
"colorscheme herald
syntax on
filetype plugin indent on
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

set showmatch
set mouse=a

set list
set listchars=tab:▸·,trail:·,eol:¬,nbsp:%
" UNICODE for symbols:
" ▶▷▸▹►▻ (The right small triangle) U+25B5 through U+25BB
" · (The middle dot) U+00B7
" ¬ (The not symbol) U+00AC
"hi NonText ctermfg=1 guifg=red

" Status line
set laststatus=2
set statusline=%f\ -\ Filetype:\ %y

au BufNewFile,BufRead *.source set filetype=fortran
au BufNewFile,BufRead *.sage set filetype=python
