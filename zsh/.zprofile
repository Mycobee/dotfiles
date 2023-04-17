function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

setopt PROMPT_SUBST
PROMPT_NEWLINE=$'\n'
export PROMPT='%F{red}%n:%f %F{blue}%2~%f $(parse_git_branch)${PROMPT_NEWLINE}🐝>'


export EDITOR=/opt/homebrew/bin/nvim

#aliases
alias rr='rails routes'
alias rs='rails server'
alias rc='rails console'
alias rdb='rails dbconsole'
alias sp='bundle exec rspec'
alias gc='git commit'
alias gcm='git commit -m'
alias gs='git status'
alias gpm='git pull origin master'
alias ga.='git add .'
alias ga='git add'
alias gac='git add . && git commit'
alias gl='git log'
alias gb='git branch'
alias gpo='git push origin'
alias gch='git checkout'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias yolo='bundle exec rake db:{drop,create,migrate,seed}'
alias dbc='rake db:create'
alias dbm='rake db:migrate'
alias dbs='rake db:seed'
alias bi='bundle install'
alias be='bundle exec'
alias bu='bundle update'
alias vim='nvim'
alias oldvim='/usr/bin/vim'

eval "$(/opt/homebrew/bin/brew shellenv)"

export LIBRARY_PATH="/opt/local/lib"
export LD_LIBRARY_PATH="/opt/local/lib"
export LD_LIBRARY_PATHS="/opt/local/lib"
export DYLD_LIBRARY_PATH="/opt/local/lib"
export LDFLAGS='-L/opt/local/lib'
export PATH="/opt/homebrew/opt/libtool/libexec/gnubin:$PATH"

alias ec='edit-command-line'
alias work='cd ~/work/'
alias infra='cd ~/infra/'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
