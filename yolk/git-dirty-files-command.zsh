# issue command on manually selected dirty git files
# example: git-dirty-files-command git add

git-dirty-files-command() {
    git_root=$(git rev-parse --show-toplevel 2> /dev/null)
    files=$(git status --porcelain | awk '{for (i=2; i<=NF; i++) print $i}' | fzf --multi)

    eval "$@ $(echo "$files" | xargs -I'{}' echo -n '"$git_root/{}" ')"
}
