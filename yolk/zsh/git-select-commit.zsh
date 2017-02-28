# interactively select git commit and write it to stdout
# example: git checkout $(git-select-commit)

git-select-commit() {
    gitlog=$(git log --pretty=format:'%Cred%h %C(reset)%C(dim)%ad%Creset %s%C(yellow)%d%C(reset) %C(blue)<%an> %Cgreen(%ar)%Creset' --abbrev-commit --date=iso --date-order --date="format:%F %R" $@)
    echo -E $gitlog | fzf --no-sort --ansi | cut -d ' ' -f1
}
