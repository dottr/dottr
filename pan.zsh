export DOTTRHOME=$(dirname "$(/bin/readlink -f "$0")")

fry () {
    source $DOTTRHOME/yolk/zsh/"$@".zsh
}
