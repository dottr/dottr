# interactively select git commit from current branch and execute command
# example: git-select-commit git checkout

git-select-commit() {
    gitlog=$(git log --pretty=format:'%Cred%h %C(reset)%C(dim)%ad%x08%x08%x08%x08%x08%x08%x08%x08%x08%Creset %s%C(yellow)%d%C(reset) %C(blue)<%an> %Cgreen(%ar)%Creset' --abbrev-commit --date=iso --date-order)
    echo $gitlog | fzf --no-sort --ansi | cut -f1 | while read -r hash description; do $@ "$hash"; done
}
