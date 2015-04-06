# smart cd function, e.g., switch to /etc when issuing /etc/hosts
# example: smart-cd /etc/hosts

smart-cd() {
    if (( ${#argv} == 1 )) && [[ -f ${1} ]]; then
        [[ ! -e ${1:h} ]] && return 1
        print "Correcting ${1} to ${1:h}"
        builtin cd ${1:h}
    else
        builtin cd "$@"
    fi
}
