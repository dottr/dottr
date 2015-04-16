# execute commands only on the staged changes of a git repository.
# changes which are not staged are stashed and restored after the command.
# example usage: $ git-onstage sbt test

git-onstage() {
    git status

    if u="$(git status --porcelain)" && test -z "$u"; then
        # clean => just run
        $@
        rc=$?
    else
        # unstaged/untracked changes => stash + run
        git stash save --keep-index --include-untracked
        $@
        rc=$?
        git stash pop
    fi

    return $rc
}
