# issue command on manually selected dirty git files
# example: git-dirty-files-command git add
# example: rm $(git-select-dirty-files)

git-select-dirty-files() {
    git_root=$(git rev-parse --show-toplevel 2> /dev/null)
    git status --porcelain | awk '{for (i=2; i<=NF; i++) print $i}' | fzf --multi
}

git-dirty-files-command() {
    files=$(git-select-dirty-files)
    [[ -z "$files" ]] && return 0

    eval "$@ $(echo "$files" | xargs -I'{}' echo -n '"$git_root/{}" ')"
}

