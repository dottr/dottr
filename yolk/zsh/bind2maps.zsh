# bind2maps to bind keys in multiple modes
# taken from: http://git.grml.org/?p=grml-etc-core.git;a=blob_plain;f=etc/skel/.zshrc;hb=HEAD
# usage: bind2maps emacs viins vicmd -- "Home" beginning-of-line

# setup keys!
#   typeset -A key
#   key=(
#   Home     "${terminfo[khome]}"
#   End      "${terminfo[kend]}"
#   Insert   "${terminfo[kich1]}"
#   Delete   "${terminfo[kdch1]}"
#   Up       "${terminfo[kcuu1]}"
#   Down     "${terminfo[kcud1]}"
#   Left     "${terminfo[kcub1]}"
#   Right    "${terminfo[kcuf1]}"
#   PageUp   "${terminfo[kpp]}"
#   PageDown "${terminfo[knp]}"
#   BackTab  "${terminfo[kcbt]}"
#   )

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
