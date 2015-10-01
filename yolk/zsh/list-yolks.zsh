(
    cd $(dirname "$0")
    ls -1 | xargs -I YOLK sh -c "echo '\033[1mYOLK\033[0m'| sed 's/\.zsh//'; sed '/^[^#]\|^#$\|^$/Q' YOLK"
)
