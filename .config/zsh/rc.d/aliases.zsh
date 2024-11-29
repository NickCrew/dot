
 # List files
if [[ -v commands[lsd] ]]; then
  alias ls='lsd --color=auto --icon=auto --group-directories-first'
  alias l='ls'
  alias lg='ls --long --git --almost-all'
  alias la='ls --long --almost-all'
  alias ll='ls --long'
else
  alias lsa='ls -lah'
  alias ll='ls -lh'
  alias la='ls -lAh'
fi

  
# File management
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias md='mkdir -p'
alias rd=rmdir
alias dea='direnv allow'
alias xx='xplr'
alias rr='ranger'
 
 
 
# Directory navigation
alias ..-='cd ..'
alias -- -='cd -'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'


# Terraform/terragrunt
alias tf='terraform'
alias tg='terragrunt'
alias tga='terragrunt apply -auto-approve'
alias tgd='terragrgunt destroy -auto-approve'
alias tgi='terragrunt init'
alias tgia='terragrunt init && terragrunt apply -auto-approve'

  
 # Neovim
alias nvi="nvr --remote-silent"
alias v='~/opt/nvim-macos-x86_64/bin/nvim'
alias nvs='nvr --remote-silent'
alias nvws='nvr --remote-wait-silent'
alias nvt='nvr --remote-tab'
alias nvts='nvr --remote-tab-silent'
 

# Cat
[[ -v commands[bat] ]] && alias bat='bat --style=numbers --color=always'

# ZSH
alias xzsh='exec zsh'

# Development
alias dc='docker compose'
alias po='poetry'

# Kubernetes
alias k='kubectl'

# AWS
alias gac='gimme-aws-creds'

# Wezterm
alias wt='wezterm'
alias wtst='wezterm cli set-tab-title'


 # Dotfiles
alias dots='git --git-dir=$HOME/.dot.git --work-tree=$HOME'

 # Git
alias g='git'
alias gtw='gittower' 
alias lg='lazygit'
alias gz='search-from-top'

 
alias rcedit-wezterm="rcedit wezterm wezterm.lua"
alias rcedit-zsh="rcedit zsh .zshrc"
alias rcedit-git="rcedit git config"
alias rcedit-p10k="rcedit zsh p10k.zsh"
alias rcedit-nvim="rcedit nvim init.lua"

 
