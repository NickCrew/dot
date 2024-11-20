#  vim: foldmethod=marker  foldmarker={{{,}}}
# .zshrc

# 1.0 Initialize {{{

# Start profiling
zmodload zsh/zprof  

# vi  mode
bindkey -v

# Instant Prompt
if [[ -f "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 
fi
# Load prompot
source $ZDOTDIR/p10k.zsh

# Load the plugin manager
source $ZDOTDIR/unplugged.zsh 

# PATH
path=(
  "$HOME/.cargo/bin" 
  "$HOME/.fzf/bin" 
  "$HOME/.atuin/bin" 
  "$HOME/.krew/bin" 
  "${GOHOME:-$HOME/go}/bin" 
  "$HOME/opt/bin"
  "$HOME/bin" 
  "$HOME/.local/bin" 
  "$HOME/Applications" 
  "/usr/local/sbin" 
  "/usr/local/bin"
  $path
)

fpath+="${HOMEBREW_PREFIX}/share/zsh/site-functions"
fpath+="${ZSH_CACHE_DIR}/completions"     

# Init Completion
zmodload zsh/complist  
zle -C _expand_alias complete-word _generic

#}}}

PLUGIN_REPOS=(
  # projects with nested plugins
  ohmyzsh/ohmyzsh

  # # regular plugins
  jeffreytse/zsh-vi-mode
  romkatv/powerlevel10k
  marlonrichert/zsh-autocomplete
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zdharma-continuum/fast-syntax-highlighting
)

PLUGINS=(
  # zsh-vi-mode
  ##: Prompt
  powerlevel10k
  ##: 
  fast-syntax-highlighting
  zsh-autocomplete
  zsh-autosuggestions
  zsh-completions
  bd
  # Oh My Zsh Plugins
  ohmyzsh/plugins/1password
  ohmyzsh/plugins/aws
  ohmyzsh/plugins/colored-man-pages
  ohmyzsh/plugins/colorize
  ohmyzsh/plugins/direnv
  ohmyzsh/plugins/dirhistory
  ohmyzsh/plugins/k9s
  ohmyzsh/plugins/ssh-agent
  ohmyzsh/plugins/fancy-ctrl-z
  ohmyzsh/plugins/forklift
  ohmyzsh/plugins/gh
  ohmyzsh/plugins/git
  ohmyzsh/plugins/jsontools
  ohmyzsh/plugins/zoxide
)

plugin-clone $PLUGIN_REPOS
plugin-source $PLUGINS


# Load config dirs. 
# Pay attention to order:
# 1. aliases
# 2. envvars
# 3. functions
# 4. rc fragments
# 5. local
for f in $ZDOTDIR/{alias,env,fn,rc,local}.d/*.zsh; do 
  source $f
done


  # 2.0 Install Plugins {{{

#}}}


# }}}

