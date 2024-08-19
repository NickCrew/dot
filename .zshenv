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

export ZSHRCD="${ZOTDIR}/rc.d"
export ZPLUGINDIR="${XDG_DATA_HOME}/zsh/plugins"
