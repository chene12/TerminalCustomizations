# PS1='\[\033]0;Bash Prompt (Git for WINDOWS) - :$PWD\007\]' # set window title
# PS1+="\[\e[36m\]\d \t \[\e[33m\]\w \[\e[36m\]-> \[\e[00m\]";
# export PS1
prompt_git() {

	# Check for what branch we’re on.
	# Get the short symbolic ref. If HEAD isn’t a symbolic ref, get a
	# tracking remote branch or tag. Otherwise, get the
	# short SHA for the latest commit, or give up.
	branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
		git describe --all --exact-match HEAD 2> /dev/null || \
		git rev-parse --short HEAD 2> /dev/null || \
		echo 'unknown')";

	# [ -n "${s}" ] && s=" [${s}]";

	echo -e "${1}${branchName}${2}${s}";
}

PS1='\[\033]0;Terminal\007\]' # set window title
PS1+="\`if [ \$? = 0 ]; then echo \[\e[32m\]✓\[\e[0m\]; else echo \[\e[31m\]X\[\e[0m\]; fi\` "
PS1+="\[\e[34m\]\h "
PS1+="\[\e[36m\][ \w ] \[\e[32m\](\$(prompt_git)) \[\e[33m\]→\[\e[00m\] "
alias python='winpty python.exe'
alias mysql='winpty mysql'
