# opens manually selected search results in editor
# depends on: https://github.com/bogado/file-line.git
# TODO: use custom replacements for ag / vim / fzf

search-select-edit () {
    results=$(ag --filename --noheading --numbers --column --nobreak --color --hidden -S $@) 
    selected=$(echo -E $results | fzf --ansi --multi --no-sort --tac) 
    [[ -z "$selected" ]] && return 0
    uniquefileswithlines=$(echo -E $selected | tac | sed '$!N; /^\([^:]*\):.*\n\1:.*$/!P; D' | tac | cut -d: -f1-3) 
    eval "vim $(echo -E $uniquefileswithlines | xargs -I'{}' echo -E -n '"{}" ')"
}
