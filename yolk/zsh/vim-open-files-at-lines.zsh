# open files at respective lines and optionally columns
# example: vim file:34 otherfile:1337:5
# https://gist.github.com/xim/6123691

vim() {
    declare -a args
    let fcount=0
    local -a lines cols
    for arg in "$@" ;do
        filename=$(echo -E $arg | grep -oE "^[^:]*")
        [[ -f "$filename" ]] || continue # check if arg is an existing file
        let fcount+=1
        if [[ "$arg" =~ : && -e `echo $arg | cut -d: -f1` && `echo $arg | cut -d: -f2` =~ ^[0-9]+*$ ]] ;then
            args+=(`echo $arg | cut -d: -f1`)
            lines[$fcount]=`echo $arg | cut -d: -f2`
            cols[$fcount]=`echo $arg | cut -d: -f3`
        else
            args+=("$arg")
        fi
    done
    script=$'set nostartofline\n' # keep column position when switching buffers
    script+=$'blast\n'
    while [[ $fcount -gt 0 ]] ;do
        if [[ -n "$lines[$fcount]" ]]; then
            if [[ -n "$cols[$fcount]" ]]; then
                script+="call cursor(${lines[$fcount]},${cols[$fcount]})"'\n'
            else
                script+="normal ${lines[$fcount]}G_"'\n'
            fi
        fi
        let fcount-=1
        [[ $fcount -gt 0 ]] && script+=$'bprev\n'
    done
    /usr/bin/vim -S <(echo "$script") "${args[@]}"
}