# adds a precmd hook to zsh to print a bell character

add-zsh-hook precmd bell_precmd

function bell_precmd {
    echo -ne "\a"
}
