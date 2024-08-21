#  vim: foldmethod=marker  foldmarker=[[,]]
# .zshrc


################## INITIALIZE #####################[[


# Instant Prompt
if [[ -f "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 
fi
# Start profiling
zmodload zsh/zprof  
export ZSHRCD=$ZDOTDIR/rc.d
# Load plugin manager
source $ZSHRCD/unplugged.zsh 

# Function path
fpath+="${ZSH_CACHE_DIR}/completions"     
bindkey -v

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
  "${PYENV_ROOT:-$HOME/.pyenv}/bin"
  "/usr/local/sbin" 
  "/usr/local/bin"
  $path
)
typeset -U path
export PATH


#]]


################## INSTALL PLUGINS [[

#
# INSTALL PLUGINS
# 
repos=(
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
plugin-clone $repos
#]]

zmodload zsh/complist  
zle -C _expand_alias complete-word _generic


############### ENVIRONMENT [[
# EDITOR

# ]]

############### Setopts [[

# History
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
#]]

################ SOURCE PLUGINS [[


#  LOAD PLUGINS
plugins=(
  powerlevel10k
  # zsh-vi-mode

  fast-syntax-highlighting
  zsh-autocomplete
  # zsh-autosuggestions
  zsh-completions
  bd

  ohmyzsh/plugins/1password
  ohmyzsh/plugins/aws
  ohmyzsh/plugins/colored-man-pages
  ohmyzsh/plugins/colorize
  ohmyzsh/plugins/direnv
  ohmyzsh/plugins/emoji
  ohmyzsh/plugins/fancy-ctrl-z
  ohmyzsh/plugins/forklift
  ohmyzsh/plugins/gh
  ohmyzsh/plugins/git
  ohmyzsh/plugins/jsontools
  ohmyzsh/plugins/zoxide
)
plugin-source $plugins

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

#]]

################ ZSTYLE [[

# Autocomplete
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
# Completers
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
# ]]

################ KEYBINDINGS [[


source ~/.fzf/shell/{key-bindings,completions}.zsh 
# RUST
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
export FZF_CTRL_T_OPTS="--walker-skip .git --preview 'bat --style=numbers --color=always {}' --bind '?:toggle-preview'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"


source $ZSHRCD/func.zsh
source $ZSHRCD/aliases.zsh
eval "$(atuin init zsh --disable-up-arrow)"

bindkey -M menuselect 'h' vi-backward-char				 # Left
bindkey -M menuselect 'k' vi-up-line-or-history				# Up
bindkey -M menuselect 'j' vi-down-line-or-history           # Down
bindkey -M menuselect 'l' vi-forward-char					# Right
bindkey -M menuselect '^xg' clear-screen					# Clear
bindkey -M menuselect '^xi' vi-insert						# Insert
bindkey -M menuselect '^xh' accept-and-hold                	# Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  	# Next
bindkey -M menuselect '^xu' undo                           	# Undo

bindkey              '^I'         menu-select
bindkey "$terminfo[kcbt]" reverse-menu-select

# This makes ← and → always move the cursor on the command line, even when you are in the menu:
bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char

# Use vium cli mode
bindkey '^P' up-history      
bindkey '^N' down-history
# bkspc and ^h working after returning from cmd mode
bindkey '^?' backward-delete-char  
bindkey '^h' backward-delete-char
 # ctrl-w removed word backwards
bindkey '^w' backward-kill-word   

# CTRL-R for history search
bindkey '^r' atuin-search-viins
# ]]


 export LS_COLORS="$(vivid generate tokyonight-moon)"
eval "$(brew shellenv zsh)"
fpath+="$(brew --prefix)/share/zsh/site-functions"
source $ZSHRCD/after/zlocal.zsh
