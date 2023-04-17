function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

setopt PROMPT_SUBST
PROMPT_NEWLINE=$'\n'
PS1='%F{red}%n:%f %F{blue}%2~%f $(parse_git_branch)${PROMPT_NEWLINE}🐝>'
