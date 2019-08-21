PROMPT_DIRTRIM=3

PROMPT_COMMAND=__prompt_command

__prompt_command() {
	local EXIT="$?"
	PS1=""
	local RCol='\[\e[0m\]'
	local Red='\[\e[0;31m\]'
	local Gre='\[\e[0;32m\]'
	local BYel='\[\e[1;33m\]'
	local BBlu='\[\e[1;34m\]'
	local Pur='\[\e[0;35m\]'
	if [ $EXIT != 0 ]; then
		PS1+="${BYel}¬"
	else
		PS1+="${Gre}•"
	fi
	PS1+="${Red}\h:${BBlu}\w${Pur}¶ ${RCol}"
}
