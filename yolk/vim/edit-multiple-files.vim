" edit multiple files at once.
" Usage: :E a.vim b.vim *.rb
" Source: http://vim.wikia.com/wiki/Load_multiple_files_with_a_single_command

command! -complete=file -nargs=* Etab call s:ETW('tabnew', <f-args>)
command! -complete=file -nargs=* Enew call s:ETW('new', <f-args>)
command! -complete=file -nargs=* Evnew call s:ETW('vnew', <f-args>)
command! -complete=file -nargs=* E call s:ETW('edit', <f-args>)
function! s:ETW(what, ...)
    if empty(a:000)
        silent! edit
        return
    endif

    for f1 in a:000
        let files = glob(f1)
        if files == ''
            execute a:what . ' ' . escape(f1, '\ "')
        else
            for f2 in split(files, "\n")
                execute a:what . ' ' . escape(f2, '\ "')
            endfor
        endif
    endfor
endfunction

" overwrite :e with :E
cabbrev e <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'E' : 'e')<CR>
