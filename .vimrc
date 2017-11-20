execute pathogen#infect()

syntax on
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set cul
set showcmd
set wildmenu
set autochdir
set background=dark
set number
set tabpagemax=50

highlight Normal ctermfg=grey ctermbg=black
highlight LineNr ctermfg=DarkRed 

cabb sex Sex
cabb vex Vex
cabb tex Tex
cabb exp Exp
cabb tedit tabedit
cabb wm wincmd
cabb mw wincmd
cabb w' w
"I keep fat fingering ' when trying to save
cabb tapb tabp
"More common typos
abb ball tab: all

set wildignore=*.pyc

nore ; :
nore , \

nore j gj
nore k gk
xnoremap p pgvy

"set _ as a word seperator kinda questionable use, since it breaks syntax highlighting, but is nice
" when I want mw/bw to behave nicely on var_one var_two
"set iskeyword-=_

function! GoodTabn(...)
    let N = (a:0 == 0) ? 1 : a:1
    let x = tabpagenr() + N
    execute 'tabn ' . x
endfunction

command! -nargs=? GoodTabn call GoodTabn(<f-args>)
cabbrev tabn <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'GoodTabn' : 'tabn')<CR>

command! -nargs=? F call flake8#Flake8()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre     *.py :call TrimWhiteSpace()

