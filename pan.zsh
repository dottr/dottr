export DOTTRHOME=$(/bin/readlink -f ${0%/*})

pan () {
    source $DOTTRHOME/yolk/"$@".zsh
}
