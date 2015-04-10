# open files at respective lines and optionally columns
# example: vim file:34 otherfile:1337:5
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
        if [[ "$arg" =~ : && -e `echo $arg | cut -d: -f1` && `echo $arg | cut -d: -f2` =~ ^[0-9]+*$ ]] ;then
            args+=(`echo $arg | cut -d: -f1`)
            lines[$fcount]=`echo $arg | cut -d: -f2`
            cols[$fcount]=`echo $arg | cut -d: -f3`
            cols[$fcount]=${cols[$fcount]:-0} # if no column is given, use 0
        else
            args+=("$arg")
        fi
    done
    script=$'set nostartofline\n' # keep column position when switching buffers
    script+=$'blast\n'
    while [[ $fcount -gt 1 ]] ;do
        script+="call cursor(${lines[$fcount]},${cols[$fcount]})"'\n'
        let fcount-=1
        [[ $fcount -gt 1 ]] && script+=$'bprev\n'
    done
    /usr/bin/vim -S <(echo "$script") "${args[@]}"
}
