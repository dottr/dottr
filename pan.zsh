export DOTTRHOME=$(dirname "$(/bin/readlink -f "$0")")

fry () {
    yolk_file=$DOTTRHOME/yolk/zsh/"$@".zsh
    if [ -f "$yolk_file" ]; then
        source $yolk_file
    else
        echo "No yolk with name '$@' exists." >&2
        echo "Check: fry list-yolks" >&2
        return 1
    fi
}
