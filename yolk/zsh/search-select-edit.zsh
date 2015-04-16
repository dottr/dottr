# opens manually selected search results in editor
# depends on vim-open-files-at-lines (vim filename:5 filename:2 ...)
# TODO: use custom replacements for ag / vim / fzf

search-select-edit () {
    results=$(ag --filename --noheading --numbers --column --nobreak --color -S $@) 
    selected=$(echo -E $results | fzf --ansi --multi --no-sort --tac) 
    [[ -z "$selected" ]] && return 0
    uniquefileswithlines=$(echo -E $selected | tac | sed '$!N; /^\([^:]*\):.*\n\1:.*$/!P; D' | tac | cut -d: -f1-3) 
    eval "vim $(echo -E $uniquefileswithlines | xargs -I'{}' echo -E -n '"{}" ')"
}
