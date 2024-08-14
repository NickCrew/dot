#  vim: foldmethod=marker  foldmarker={{{,}}}
# .zshrc

# {{{ Init

# Start Profiling
zmodload zsh/zprof  

# vi-mode
bindkey -v

# Instant Prompt
 if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
 fi

# Local vars
_zshrcd="${ZDOTDIR}/zshrc.d"
_zplug="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins"


# }}}

# {{{ Environment


# Directories

# PAGER, EDITOR
export EDITOR=nvim
export VISUAL=nvim
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

if command -v most &> /dev/null; then
  export PAGER=most
else
  export PAGER=less
fi
export MANPAGER=$PAGER

# GPG + SSH
GPG_TTY=$(tty)
export GPG_TTY
export SSH_CONFIG="$HOME/.ssh/config"
export SSH_IDENTITY="$HOME/.ssh/id_ed25519"

# FZF
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

# DOCKER
export COLIMA_VM="${COLIMA_VM:-default}"
export COLIMA_VM_SOCKET="${HOME}/.colima/${COLIMA_VM}/docker.sock"
export DOCKER_HOST="unix://${COLIMA_VM_SOCKET}"

# Gooogle
export CLOUDSDK_HOME=$HOME/opt/google-cloud-sdk

# Python
export PYENV_ROOT="$HOME/.pyenv"

# RUST

# BREW
if [[ $(uname) == 'Darwin' ]]; then
  export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
  export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"

  if [[ $(uname -m) = "x86_64" ]]; then
      eval "$(/usr/local/HomeBrew/bin/brew shellenv)"
  else
      eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi


# {{{ Paths

# Functions and Path
fpath+="${ZSH_CACHE_DIR}/completions"     
if command -v brew &> /dev/null; then
    fpath+="$(brew --prefix)/share/zsh/site-functions"
fi


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

#    }}}

# }}}

# {{{ Settings

# {{{ History

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000000
export SAVEHIST=10000000
setopt bang_hist				# Perform textual history expansion, csh-style, treating the character ‘!’ specially.
setopt extended_history			# Record timestamp of command in HISTFILE
setopt hist_expire_dups_first 	# Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       	# Ignore duplicated commands history l
setopt hist_ignore_space        # ignore commands that start with space
setopt hist_no_functions		# Don't store function definitions
setopt hist_reduce_blanks		# Remove superfluous blanks from each command line being added to the history list
setopt hist_verify              # show command with history expansion to user before running it
setopt inc_append_History		# Add new lines to the history file immediately (do not wait until exit)
setopt share_history          	# Share command history data
unsetopt hist_beep				# Shut up shut up shut up
#     }}}

# Directories
cdpath+=($HOME/.config $HOME/.local/share $HOME/Work $HOME/Code $HOME/Work/Projects)
setopt auto_cd                  # Change to directory without cd 
setopt auto_pushd               # Push the old directory onto the directory stack
setopt pushd_ignore_dups        # Don't push multiple copies of the same directory onto the directory stack
setopt pushdminus               # Use pushd to rotate the stack so that the current directory is always on top
# Misc
setopt notify			        # notify when background job finishes				
unsetopt clobber		        # Allow overwriting existing files
setopt ignore_eof		        # Don't exit on EOF
setopt local_options	        # Allow fucntions to have local options
setopt local_traps		        # Allow functions to have local traps
unsetopt beep			        # shut up shut up shut up

# }}}

# fast-syntax-highlighting !! Needs to load BEFORE zsh-autocomplete 
source $_zplug/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Completion {{{

zmodload zsh/complist  
zle -C _expand_alias complete-word _generic

# {{{ Options
setopt glob_complete			# Show autocompletion menu with globs
setopt menu_complete			# Automatically highlight first element of completion menu
setopt auto_list				# Automatically list choices on ambiguous completion.
setopt complete_in_word			# Complete from both ends of a word.
setopt no_list_beep				# Don't beep when listing choices on ambiguous completion
setopt nocaseglob               # Case-insensitive globbing
setopt auto_menu                # show completion menu on successive tab press
setopt always_to_end
unsetopt complete_aliases       # Make aliases work with completion nicely
unsetopt flowcontrol
# }}}

# {{{ zstyle

#
# :omz:
#
zstyle ':omz:plugins:iterm2 shell-integration' yes
#
# :autocomplete:
# 
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
#
# :completion:
#
zstyle ':completion:*' completer _extensions _complete _approximate
# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/zcompcache"
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true
zstyle ':completion:alias-expension:*' completer _expand_alias
# Allow you to select in a menu
zstyle ':completion:*' menu select
# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}
# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases
# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
# See ZSHCOMPWID "completion matching control"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' keep-prefix true
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
#zstyle '*:compinit' arguments -D -i -u -C -w
#     }}}

# {{{ Plugins

# zsh-autocomplete
source "${_zplug}/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
# bd
source "${_zplug}/bd.zsh"
# zsh-autosuggestions
source "${_zplug}/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
# zsh-completions
source "${_zplug}/zsh-completions/zsh-completions.plugin.zsh"
# fzf
test -e ~/.fzf.shell/completion.zsh && source ~/.fzf/shell/completion.zsh
_omz_plugins=(zoxide 1password aws)
for plugin in $_omz_plugins; do
  source "${XDG_DATA_HOME:-$HOME/.local/share}/zsh/omz/plugins/${plugin}/${plugin}.plugin.zsh"
done

#     }}}

# }}}

# Aliases !! Load after completions 
source "${_zshrcd}/alias.zsh"
# Functions
source "${_zshrcd}/func.zsh"
# Prompt
test -e ~/.p10k.zsh && source ~/.p10k.zsh
source "${_zplug}/powerlevel10k/powerlevel10k.zsh-theme"

# {{{ Keybindings

source ~/.fzf/shell/key-bindings.zsh
bindkey -M menuselect 'h' vi-backward-char					# select left in completion menu					
bindkey -M menuselect 'k' vi-up-line-or-history				# select above in completion menu
bindkey -M menuselect 'j' vi-down-line-or-history   		# select below in completion menu
bindkey -M menuselect 'l' vi-forward-char					# select right in completion menu
bindkey -M menuselect '^xg' clear-screen					# Clears the screen
bindkey -M menuselect '^xi' vi-insert						# Insert
bindkey -M menuselect '^xh' accept-and-hold                	# Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  	# Next
bindkey -M menuselect '^xu' undo                           	# Undo
# zsh-autocomplete keybindings
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

eval "$(atuin init zsh --disable-up-arrow)"
bindkey '^R' atuin-search-viins
bindkey -M viins '^R' atuin-search-viins

# }}}

# Local config
if [[ -f $ZDOTDIR/zlocal.zsh ]]; then
    source $ZDOTDIR/zlocal.zsh
fi

