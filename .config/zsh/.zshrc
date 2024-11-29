# vim: foldmethod=marker foldmarker={{{,}}}
# .zshrc


[[ -z "$ZDOTDIR" ]] && export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

export ZSHRCD="$ZDOTDIR/rc.d"

# Plugin repos  {{{
PLUGIN_REPOS=(
 # projects with nested plugins
  ohmyzsh/ohmyzsh

  # regular plugins
  jeffreytse/zsh-vi-mode
  romkatv/powerlevel10k
  marlonrichert/zsh-autocomplete
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
 zdharma-continuum/fast-syntax-highlighting
)
# }}}

# Plugins {{{
PLUGINS=(
  # zsh-vi-mod
  
  # Prompt
  powerlevel10k

  fast-syntax-highlighting
  zsh-autocomplete
  zsh-autosuggestions
  zsh-completions

  
  # dirs and files
  bd
  ohmyzsh/plugins/direnv
  ohmyzsh/plugins/dircycle
  ohmyzsh/plugins/zoxide
  ohmyzsh/plugins/forklift
  ohmyzsh/plugins/jsontools

  #  Cloud tools 
  ohmyzsh/plugins/1password
  ohmyzsh/plugins/aws
  ohmyzsh/plugins/k9s
  ohmyzsh/plugins/gh
  ohmyzsh/plugins/git

  # Shell
  ohmyzsh/plugins/colored-man-pages
  ohmyzsh/plugins/colorize
  ohmyzsh/plugins/ssh-agent
  ohmyzsh/plugins/fancy-ctrl-z
)
# }}}

# Paths {{{
fpath=(
  "${HOMEBREW_PREFIX}/share/zsh/site-functions"
  "${ZSH_CACHE_DIR}/completions"     
  "${ZDOTDIR}/fn.d"           
  $fpath
)

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
# }}}

zmodload zsh/zprof  # Profiling

# Load Prompt
if [[ -f "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 
fi

source $ZDOTDIR/p10k.zsh   
source $ZDOTDIR/unplugged.zsh  

for f in $ZSHRCD/{aliases,options}.zsh; 
  do source $f; 
done

plugin-clone $PLUGIN_REPOS
plugin-source $PLUGINS

for f in $ZSHRCD/{completion,functions,keybindings}.zsh; 
  do source $f; 
done

source $ZDOTDIR/zlocal.zsh

typeset -U path

