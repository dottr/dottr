# tools to analyze and tune your aliases and functions
# mostusedcommands:   find out which commands you are using most
# mostusedaliases:    find out which aliases/functions you are using most
# mostusednotaliases: find candidates to create short aliases for
# leastusedaliases:   see if you are really using your aliases
#
# TODO
# - detect commands after pipes
# - special case for git commands?

alias commandhistory='fc -l 1 | sed "s/^ *[0-9]* *//" | grep -P "^[\w\\-]+([^\w/=@]|$)" -o | grep -P "^[\w\\-]+" -o'
alias listaliases='alias | sed "s/^alias //" | cut -d "=" -f 1'
alias listfunctions='print -l ${(ok)functions}' # only works in zsh, bash: compgen -A function
alias listselfdefined='(listaliases; listfunctions)'

alias mostusedcommands='commandhistory | sort | uniq -c | sort -n'
alias mostusedaliases='commandhistory | grep -Fx "$(listselfdefined)" | sort | uniq -c | sort -n'
alias mostusednotaliases='commandhistory | grep -Fxv "$(listselfdefined)" | sort | uniq -c | sort -n'

alias leastusedaliases='{commandhistory | grep -Fx "$(listselfdefined)" | sort | uniq -c | sort -nr; listselfdefined | grep -Fvx "$(commandhistory)" | sed "s/^.*/      0 &/"}'

