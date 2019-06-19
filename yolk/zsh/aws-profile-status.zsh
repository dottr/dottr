# adds a aws profile status to prompt

add-zsh-hook precmd aws_profile_precmd

function aws_profile_precmd {
    if [ -n "$AWS_PROFILE" ]; then
        PROMPT="${PROMPT}[aws:$AWS_PROFILE] "
    fi
}
