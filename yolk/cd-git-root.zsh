# cd to git root

cd-git-root() {
    dir=$(git rev-parse --show-toplevel 2> /dev/null)
    if [[ $? != 0 ]]; then
        printf 'Not a git repository\n'
        return 1;
    fi

    builtin cd "$dir"
}
