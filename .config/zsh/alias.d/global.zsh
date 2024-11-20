
# Dotfiles
alias sto='stow -d ~/.fosto -t ~/ '
alias dots='git --git-dir=$HOME/.dot.git --work-tree=$HOME'


# Cat
[[ -v commands[bat] ]] && alias bat='bat --style=numbers --color=always'

# ZSH
alias xzsh='exec zsh'

# Development
alias dc='docker compose'
alias po='poetry'

# Git
alias g='git'
alias gtw='gittower' 
alias lg='lazygit'
alias gz='search-from-top'

# Kubernetes
alias k='kubectl'

# AWS
alias gac='gimme-aws-creds'

# Wezterm
alias wt='wezterm'
alias wtst='wezterm cli set-tab-title'



