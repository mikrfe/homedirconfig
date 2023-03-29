_gd_vars=( [WORK_DIR]=/ [DIR]=/.gd [CONFIG]=/.gdconfig )
alias gd="$(for i in "${!_gd_vars[@]}"; do echo -n GIT_$i=\"\$HOME${_gd_vars[$i]}\"\ ;
done) git -c \"core.excludesfile=$HOME/.gdignore\""

