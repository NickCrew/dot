#  vim: foldmethod=marker  foldmarker={{{,}}}
# .zshrc

# {{{ Init

# Start Profiling
zmodload zsh/zprof  


# Instant Prompt
 if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
 fi

# Local vars
_zshrcd="${ZDOTDIR}/zshrc.d"
_zplug="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins"
_omz="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/omz"
_p10kconf="${ZDOTDIR:-$HOME/.config/zsh}/.p10k.zsh"


# Functions and Path
fpath+="${ZSH_CACHE_DIR}/completions"     
if command -v brew &> /dev/null; then
    fpath+="$(brew --prefix)/share/zsh/site-functions"
fi


# }}}

# {{{ Options

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000000
export SAVEHIST=10000000
# History
setopt bang_hist				# Perform textual history expansion, csh-style, treating the character ‘!’ specially.
setopt extended_history			# Record timestamp of command in HISTFILE
setopt hist_expire_dups_first 	# Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       	# Ignore duplicated commands history l
setopt hist_verify            	
setopt hist_ignore_space        # ignore commands that start with space
setopt hist_no_functions		# Don't store function definitions
# setopt hist_no_store			# Don't store history (fc -l) command
setopt hist_reduce_blanks		# Remove superfluous blanks from each command line being added to the history list
setopt hist_verify              # show command with history expansion to user before running it
setopt inc_append_History		# Add new lines to the history file immediately (do not wait until exit)
setopt share_history          	# Share command history data
unsetopt hist_beep				# Shut up shut up shut up
# Directories
setopt auto_cd                  # Change to directory without cd 
setopt auto_pushd               # Push the old directory onto the directory stack
setopt pushd_ignore_dups        # Don't push multiple copies of the same directory onto the directory stack
setopt pushdminus               # Use pushd to rotate the stack so that the current directory is always on top
# Jobs
setopt no_bg_nice		        # Don't run bg jobs at a lower priority
setopt no_hup			        # Don't kill jobs when the shell exits
setopt notify			        # notify when background job finishes				
# Files
unsetopt clobber		        # Disallow overwriting existing files
# Functions
setopt ignore_eof		        # Don't exit on EOF
setopt local_options	        # Allow fucntions to have local options
setopt local_traps		        # Allow functions to have local traps
# Bell
unsetopt beep			        # shut up shut up shut up
# Completion
setopt completealiases          # Make aliases work with completion nicely
setopt glob_complete			# Show autocompletion menu with globs
setopt menu_complete			# Automatically highlight first element of completion menu
setopt auto_list				# Automatically list choices on ambiguous completion.
setopt complete_in_word			# Complete from both ends of a word.
setopt no_list_beep				# Don't beep when listing choices on ambiguous completion
setopt nocaseglob               # Case-insensitive globbing
setopt auto_menu                # show completion menu on successive tab press
setopt always_to_end            
unsetopt flowcontrol 

# }}}

# {{{ Plugins

# zsh-autocomplete
source $_zplug/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# zsh-autosuggestions
source $_zplug/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# zsh-completions
source $_zplug/zsh-completions/zsh-completions.plugin.zsh

# zsh-vi-mode
source $_zplug/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# fzf
source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh

# bd
source $_zplug/bd.zsh

# atuin (shell history)
eval "$(atuin init zsh)"


# Aliases
source "${_zshrcd}/alias.zsh"
# Functions
source "${_zshrcd}/func.zsh"

# Oh-my-zsh plugins
omz_plugins=(kubectl zoxide 1password aws)

for plugin in $omz_plugins; do
  source ${_omz}/plugins/${plugin}/${plugin}.plugin.zsh
done

# Prompt
source $_zplug/powerlevel10k/powerlevel10k.zsh-theme

# zsh-syntax-highlighting
source $_zplug/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# }}}

#{{{ Completion



autoload -Uz history-search-end

zle -N history-beginning-search-backward-end history-search-end

# Autocomplete
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes

# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate      

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'    
zstyle ':completion:*' keep-prefix true

# Use cache for commands using cache
zstyle ':completion:*' use-cache on                                                               
zstyle ':completion:*' cache-path "${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/zcompcache"
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true

zle -C _expand_alias complete-word _generic
bindkey '^Xa' _expand_alias
zstyle ':completion:alias-expension:*' completer _expand_alias                                     

zstyle ':completion:*' menu select                                                              
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories       # Only display some tags for the command cd
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':omz:plugins:iterm2 shell-integration' yes
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}                              # Colors for files and directory
zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases
zstyle ':completion:*' group-name ''                                                              # Required for completion to be in good groups (named after the tags) zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

compdef _dirs d

# }}}

# {{{ Key Bindings

#zstyle '*:compinit' arguments -D -i -u -C -w
bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
bindkey "$terminfo[kcud1]" history-beginning-search-forward-end

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select

bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect 'h' vi-backward-char					# select left in completion menu					
bindkey -M menuselect 'k' vi-up-line-or-history				# select above in completion menu
bindkey -M menuselect 'j' vi-down-line-or-history   		# select below in completion menu
bindkey -M menuselect 'l' vi-forward-char					# select right in completion menu
bindkey -M menuselect '^xg' clear-screen					# Clears the screen?
bindkey -M menuselect '^xi' vi-insert						# Insert
bindkey -M menuselect '^xh' accept-and-hold                	# Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  	# Next
bindkey -M menuselect '^xu' undo                           	# Undo

bindkey -M viins '^g' autosuggest-accept        
bindkey -M viins '^]' autosuggest-accept

bindkey '^R' atuin-search
bindkey '^[[A' atuin-up-search
bindkey '^[OA' atuin-up-search
# }}}


# atuin

# Local config
source ~/.config/zsh/.zlocal

source ~/.p10k.zsh
