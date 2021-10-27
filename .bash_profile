eval "$(/opt/homebrew/bin/brew shellenv)"
function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\033[31m\]$USER: \[\033[0;34m\]\w \[\033[01;34m\]\$(parse_git_branch) \[\033[01;34m\]\n🐝>\[\e[0m\]"
set -o vi
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH=/usr/local/bin:$PATH
export EDITOR=/usr/bin/vim
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
alias cm='cd ~/turing/4module/'
alias yolo='bundle exec rake db:{drop,create,migrate,seed}'
alias dbc='rake db:create'
alias dbm='rake db:migrate'
alias dbs='rake db:seed'
alias bi='bundle install'
alias be='bundle exec'
alias bu='bundle update'
alias vim='nvim'
alias oldvim='vim'
eval "$(rbenv init -)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
