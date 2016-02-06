# git clone repositories from github
# example: github-clone dottr/dottr
# example: github-clone rust-lang/rust --depth=1

github-clone() {
    REPO=$1
    shift 1
    git clone git@github.com:$REPO $@
}
