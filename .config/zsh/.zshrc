#  vim: foldmethod=marker  foldmarker={{{,}}}
# .zshrc


# Start profiling
zmodload zsh/zprof  

# Init plugin loader
source $ZDOTDIR/zload.zsh

# vi-mode
bindkey -v

# Instant Prompt
zload "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# Env Vars, Options
zload-rc env setopt 

# fast-syntax-highlighting !! Needs to load BEFORE zsh-autocomplete 
zload-plug fast-syntax-highlighting

# Completions
fpath+="${ZSH_CACHE_DIR}/completions"     
zmodload zsh/complist  
zle -C _expand_alias complete-word _generic
zload-rc zstyle
# Completion Plugins
zload-plug zsh-autocomplete zsh-autosuggestions zsh-completions bd iterm2

# OMZ Plugins
zload-omz zoxide 1password aws

# Custom RC
zload-rc prompt keybindings alias func hist

# Local RC
zload $ZDOTDIR/zlocal.zsh


