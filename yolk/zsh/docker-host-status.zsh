# adds a docker host status to prompt

add-zsh-hook precmd docker_host_precmd

function docker_host_precmd {
    if [ -n "$DOCKER_HOST" ]; then
        PROMPT="${PROMPT}[docker:$DOCKER_HOST] "
    fi
}
