# send rpc commands to neovim
# example: nvim-rpc /tmp/nvimcskUxs/0 "set background=dark"
# example: nvim-rpc-all "set background=dark"
# dependencies: msgpack-tools, netcat

nvim-rpc() {
    # usage: nvim-rpc <socket> <command>
    # requires: https://github.com/ludocode/msgpack-tools and netcat

    # https://github.com/msgpack-rpc/msgpack-rpc/blob/master/spec.md
    # msgpack-rpc is an array of [type, msgid, method, params]
    # encode and send it to nvims unix socket via netcat
    echo "[0,0,\"vim_command\",[\"$2\"]]" | json2msgpack | nc -U $1 -q0
}

nvim-rpc-all() {
    # usage: nvim-rpc-all <command>
    (
    for nvim in /tmp/nvim*/0; do
        nvim-rpc $nvim "$1"
    done
    ) || true
}
