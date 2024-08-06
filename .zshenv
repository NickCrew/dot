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


# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000000
SAVEHIST=10000000

#
# Directories
#
cdpath+=($HOME/.config $HOME/.local/share $HOME/Work $HOME/Code $HOME/Work/Projects)

#
# PAGER, EDITOR
#
export EDITOR=nvim
export VISUAL=nvim
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

if command -v most &> /dev/null; then
  export PAGER=most
else
  export PAGER=less
fi
export MANPAGER=$PAGER

#
# GPG + SSH
#
GPG_TTY=$(tty)
export GPG_TTY
export SSH_CONFIG="$HOME/.ssh/config"
export SSH_IDENTITY="$HOME/.ssh/id_ed25519"

#
# FZF
#
export FZF_COMPLETION_TRIGGER=';;'
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

FZF_COLORS="bg+:-1,\
fg:gray,\
fg+:white,\
border:black,\
spinner:0,\
hl:yellow,\
header:blue,\
info:green,\
pointer:red,\
marker:blue,\
prompt:gray,\
hl+:red"

export FZF_DEFAULT_OPTS="--height 60% \
--border sharp \
--layout reverse \
--color '$FZF_COLORS' \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"


#
# DOCKER
#
export COLIMA_VM="${COLIMA_VM:-default}"
export COLIMA_VM_SOCKET="${HOME}/.colima/${COLIMA_VM}/docker.sock"
export DOCKER_HOST="unix://${COLIMA_VM_SOCKET}"

# 
# Gooogle
#
export CLOUDSDK_HOME=$HOME/opt/google-cloud-sdk

#
# Python
# 
export PYENV_ROOT="$HOME/.pyenv"

#
# RUST
#

#
# BREW
#
if [[ $(uname) == 'Darwin' ]]; then
  export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
  export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"

  if [[ $(uname -m) = "x86_64" ]]; then
      eval "$(/usr/local/HomeBrew/bin/brew shellenv)"
  else
      eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi


#
# PATH
#
path+=("/usr/local/sbin")
path+=("/usr/local/bin")
path+=("${PYENV_ROOT:-$HOME/.pyenv}/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/bin")
path+=("$HOME/.cargo/bin")
path+=("$HOME/.fzf/bin")
path+=("$HOME/.atuin/bin")
path+=("$HOME/opt/bin")
path+=("$HOME/Applications")
path+=("${GOHOME:-$HOME/go}/bin")
path+=("$HOME/.krew/bin")
typeset -U path



