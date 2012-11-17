" Vim indent file
" Language:     Velocity Template Language (VTL)
" Maintainer:   Eward Song<eward.song@gmail.com>
"
" Mostly based on https://bitbucket.org/sjl/dotfiles/raw/tip/vim/bundle/django-custom/indent/htmldjango.vim
"
" To use: save as ~/.vim/indent/velocity.vim

if exists("b:did_indent")
    finish
endif

runtime! indent/default-html.vim
unlet! b:did_indent

if &l:indentexpr == ''
    if &l:cindent
        let &l:indentexpr = 'cindent(v:lnum)'
    else
        let &l:indentexpr = 'indent(prevnonblank(v:lnum-1))'
    endif
endif
let b:html_indentexpr = &l:indentexpr

let b:did_indent = 1

setlocal indentexpr=GetVelocityIndent()
setlocal indentkeys=o,O,*<Return>,{,},o,O,!^F,<>>

" Only define the function once.
if exists("*GetVelocityIndent")
    finish
endif

function! GetVelocityIndent(...)
    if a:0 && a:1 == '.'
        let v:lnum = line('.')
    elseif a:0 && a:1 =~ '^\d'
        let v:lnum = a:1
    endif
    let vcol = col('.')

    call cursor(v:lnum,vcol)

    exe "let ind = ".b:html_indentexpr

    let lnum = prevnonblank(v:lnum-1)
    let pnb = getline(lnum)
    let cur = getline(v:lnum)

    let tagstart = '#'

    let blocktags = '\<\(if\|foreach\|macro\)\>'
    let midtags = '\<\(elseif\|else\)\>'

    let pnb_blockstart = pnb =~# tagstart . blocktags
    let pnb_blockend   = pnb =~# tagstart . 'end'
    let pnb_blockmid   = pnb =~# tagstart . midtags

    let cur_blockstart = cur =~# tagstart . blocktags
    let cur_blockend   = cur =~# tagstart . 'end'
    let cur_blockmid   = cur =~# tagstart . midtags

    if pnb_blockstart && !pnb_blockend
        let ind = ind + &sw
    elseif pnb_blockmid && !pnb_blockend
        let ind = ind + &sw
    endif

    if cur_blockend && !cur_blockstart
        let ind = ind - &sw
    elseif cur_blockmid
        let ind = ind - &sw
    endif

    return ind
endfunction
