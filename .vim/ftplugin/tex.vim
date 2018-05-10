" Add SageTeX Python highlighting WITHIN TeX file
let b:current_syntax = ''
unlet b:current_syntax
syntax include @TeX syntax/tex.vim

let b:current_syntax = ''
unlet b:current_syntax
syntax include @Python syntax/python.vim
syntax region pythonSnip matchgroup=Snip start='\\begin{sageblock}' end='\\end{sageblock}' containedin=@TeX contains=@Python
syntax region pythonSnip matchgroup=Snip start='\\begin{sagesilent}' end='\\end{sagesilent}' containedin=@TeX contains=@Python
syntax region pythonSnip matchgroup=Snip start='\\sageplot{' end='}' containedin=@TeX contains=@Python
syntax region pythonSnip matchgroup=Snip start='\\sage{' end='}' containedin=@TeX contains=@Python
hi link Snip SpecialComment

