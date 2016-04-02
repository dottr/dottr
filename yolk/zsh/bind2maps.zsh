# bind2maps to bind keys in multiple modes
# taken from: http://git.grml.org/?p=grml-etc-core.git;a=blob_plain;f=etc/skel/.zshrc;hb=HEAD
# usage: bind2maps emacs viins vicmd -- "Home" beginning-of-line

bind2maps () {
    local i sequence widget
    local -a maps

    while [[ "$1" != "--" ]]; do
        maps+=( "$1" )
        shift
    done
    shift

    if [[ "$1" == "-s" ]]; then
        shift
        sequence="$1"
    else
        sequence="${key[$1]}"
    fi
    widget="$2"

    [[ -z "$sequence" ]] && return 1

    for i in "${maps[@]}"; do
        bindkey -M "$i" "$sequence" "$widget"
    done
}
