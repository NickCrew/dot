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


export LDFLAGS="-L/usr/local/opt/readline/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include -I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

export EDITOR=nvim
export PAGER=most
export VISUAL=$EDITOR
export MANAPAGER=$PAGER
export KEYTIMEOUT=1

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000000
export SAVEHIST=10000000

# GPG + SSH
GPG_TTY=$(tty)
export GPG_TTY
export SSH_CONFIG="$HOME/.ssh/config"
export SSH_IDENTITY="$HOME/.ssh/id_ed25519"

# DOCKER
export COLIMA_VM="${COLIMA_VM:-default}"
export COLIMA_VM_SOCKET="${HOME}/.colima/${COLIMA_VM}/docker.sock"
export DOCKER_HOST="unix://${COLIMA_VM_SOCKET}"

# Gooogle
export CLOUDSDK_HOME=$HOME/opt/google-cloud-sdk

# Python
export PYENV_ROOT="$HOME/.pyenv"



