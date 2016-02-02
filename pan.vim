let s:path = expand('<sfile>:hp')

" TODO: completion
command! -nargs=1 Fry call s:fry(<f-args>)
function! s:fry(package)
    if !empty(a:package)
        exec 'source ' . s:path . '/yolk/vim/' . a:package . '.vim'
    endif
endfunction
