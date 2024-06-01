# Prompt
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

setopt PROMPT_SUBST
PROMPT_NEWLINE=$'\n'
PS1='%F{cyan}%n:%f %F{blue}%2~%f $(parse_git_branch)${PROMPT_NEWLINE}$ '

# Autocompletion
zstyle ':completion:*' menu select

source ~/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen apply


# Neovim
export EDITOR=/usr/bin/nvim

#aliases
alias rr='bundle exec rails routes'
alias rs='bundle exec rails server'
alias rc='bundle exec rails console'
alias rdb='bundle exec rails dbconsole'
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
alias yolo='bundle exec rails db:{drop,create,migrate,seed}'
alias dbc='bundle exec rails db:create'
alias dbm='bundle exec rails db:migrate'
alias dbs='bundle exec rails db:seed'
alias bi='bundle install'
alias be='bundle exec'
alias bu='bundle update'
alias vim='nvim'
alias ovim='/usr/bin/vim'
alias work='cd ~/work/'
alias personal='cd ~/personal/'
alias resale='/home/rob/work/mountain-resale/mountain-resale-web/bin/docker-dev'
alias lg='lazygit'

export PATH="/home/rob/.cargo/bin:$PATH"
export PATH="/home/rob/.local/bin:$PATH"


# cli vim editing
set -o vi
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

. "$HOME/.asdf/asdf.sh"
source /usr/share/fzf/shell/key-bindings.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
