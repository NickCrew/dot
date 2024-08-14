#
# ~/.zshenv
#
###############################################################################

#
# XDG
#
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

#
# ZSH
#
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"
export ZSH_HASH_DIR="${ZSH_HASH_DIR:-$ZDOTDIR/.zsh_hashes}"



