#
# Navigation
#
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

#
# Directories
#
alias ..-='cd ..'
alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'


alias md='mkdir -p'
alias rd=rmdir


if [[ -v commands[lsd] ]]; then
  alias ls='lsd --color=auto --icon=auto --group-directories-first'
  alias l='ls'
  alias ll='ls --long --git'
  alias la='ls --long --git --almost-all'
else
  alias lsa='ls -lah'
  alias ll='ls -lh'
  alias la='ls -lAh'
fi

[[ -v commands[bat] ]] && alias bat='bat --style=numbers --color=always'

[[ -v commands[fd] ]] && alias find='fd'

#
# Apps / Integrations
# 
alias dc='docker compose'
alias dea='direnv allow'
alias dots='git --git-dir=$HOME/.dot.git --work-tree=$HOME'
alias g='git'
alias gac='gimme-aws-creds'
alias gtw='gittower' 
alias lg='lazygit'
alias po='poetry'
alias rr='ranger'
alias sto='stow -d ~/.fosto -t ~/ '
alias tf='terraform'
alias tg='terragrunt'
alias v='nvim'
alias k='kubectl'
alias wtst='wezterm cli set-tab-title'
alias wt='wezterm'
alias xx='xplr'
alias xzsh='exec zsh'
alias x='xplr'
