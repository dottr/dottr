# opens manually selected search results in editor
# depends on vim-open-files-at-lines (vim filename:5 filename:2 ...)
# TODO: use custom replacements for ag / vim / fzf

search-select-edit() {
    results=$(ag --filename --noheading --numbers --nobreak --color -S $@)
    selected=$(echo $results | fzf --ansi --multi)
    uniquefileswithlines=$(echo $selected | sed 's/\(.\+\)\:\([0-9]\+\)\:.*/\2 \1/' | uniq --skip-fields=1 | sed 's/\([0-9]\+\) \(.\+\)$/\2:\1/')
    eval "vim $(echo $uniquefileswithlines | xargs -I'{}' echo -n '"{}" ')"
}
