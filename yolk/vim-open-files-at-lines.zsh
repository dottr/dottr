# vim file:34 otherfile:1337 -> Open files at respective lines. And in tabs!
# https://gist.github.com/xim/6123691

vim() {
    declare -a args
    let fcount=0
    hit_dashdash=
    for arg in "$@" ;do
        if [[ "$arg" =~ ^- && ! "$hit_dashdash" ]] ;then
            args+=("$arg")
            [[ "$arg" = "--" ]] && hit_dashdash=1
            continue
        fi
        let fcount+=1
        if [[ "$arg" =~ : && -e "${arg%:*}" && "${arg##*:}" =~ ^[0-9]+*$ ]] ;then
            args+=("${arg%:*}")
            lines[$fcount]=${arg##*:}
        else
            args+=("$arg")
        fi
    done
    script=$'blast\n'
    while [[ $fcount -gt 0 ]] ;do
        script+="${lines[$fcount]}"$'\n'
        let fcount-=1
        [[ $fcount -gt 0 ]] && script+=$'bprev\n'
    done
    script+=$'bfirst\n'
    /usr/bin/vim -S <(echo "$script") "${args[@]}"
}
