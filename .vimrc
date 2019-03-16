set autochdir
set ruler
set vb t_vb=

set number
set cursorline

set hlsearch
set incsearch
set showcmd

set ts=4
set expandtab
set shiftwidth=4
set autoindent
set cindent
set smartindent
set smarttab

inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>

set list
set listchars=tab:›\ ,trail:•,extends:>,precedes:<,nbsp:.

set colorcolumn=81
set textwidth=80
set softtabstop=4

syntax enable
syntax on

set statusline=%F%m%r%h%w\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "
set laststatus=2

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: Weizhuo Zhang (Ray)")
        call append(line(".")+2, "\# mail: wzhuo.zhang@gmail.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    elseif &filetype == 'python'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: Weizhuo Zhang (Ray)")
        call append(line(".")+2, "\# mail: wzhuo.zhang@gmail.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: Weizhuo Zhang (Ray)")
        call append(line(".")+2, "    > Mail: wzhuo.zhang@gmail.com")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "")
        call append(line(".")+8, "int main(int argc, char** argv){")
        call append(line(".")+9, "")
        call append(line(".")+10, "}")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include <stdio.h>")
        call append(line(".")+7, "")
        call append(line(".")+8, "int main(int argc, char** argv){")
        call append(line(".")+9, "")
        call append(line(".")+10, "}")
    endif
    autocmd BufNewFile * normal G
endfunc

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>


map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< -pthread -std=c++11"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc
"C,C++ Debug
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

"haskell-vim
filetype plugin indent on
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1
