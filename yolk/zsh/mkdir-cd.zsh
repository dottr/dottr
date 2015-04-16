# create directory and cd into it
# example: mkdir-cd foo/bar

mkdir-cd() {
    if (( ARGC != 1 )); then
        printf 'Usage: mkdir-cd <directory>\n'
        return 1;
    fi
    if [[ ! -d "$1" ]]; then
        command mkdir -p "$1"
    else
        printf "'%s' already exists\n" "$1"
    fi
    builtin cd "$1"
}
