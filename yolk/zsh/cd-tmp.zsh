# create temporary directory and cd into to it

cd-tmp() {
    local t
    t=$(mktemp -d)
    echo "$t"
    builtin cd "$t"
}
