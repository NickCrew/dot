# vim: foldmethod=marker foldmarker={{{,}}}
# .zshrc
#


# Plugin repos  {{{
PLUGIN_REPOS=(
  ohmyzsh/ohmyzsh

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
  
  powerlevel10k

  fast-syntax-highlighting
  zsh-autocomplete
  zsh-autosuggestions
  zsh-completions

  bd
  ohmyzsh/plugins/direnv
  ohmyzsh/plugins/dircycle
  ohmyzsh/plugins/zoxide
  ohmyzsh/plugins/forklift
  ohmyzsh/plugins/jsontools
  ohmyzsh/plugins/copyfile
  ohmyzsh/plugins/copypath
  ohmyzsh/plugins/copybuffer

  ohmyzsh/plugins/rbenv
  ohmyzsh/plugins/ruby

  ohmyzsh/plugins/1password
  ohmyzsh/plugins/aws
  ohmyzsh/plugins/k9s
  ohmyzsh/plugins/gh
  ohmyzsh/plugins/git

  ohmyzsh/plugins/colored-man-pages
  ohmyzsh/plugins/colorize
  ohmyzsh/plugins/ssh-agent
  ohmyzsh/plugins/fancy-ctrl-z
)
# }}}

# Paths {{{
source ~/.fzf/shell/key-bindings.zsh 
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

# Initialize  {{{
zmodload zsh/zprof  # Profiling
zmodload zsh/complist

bindkey -v  

# Prompt
#
if [[ -f "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 
fi
source $ZDOTDIR/p10k.zsh

source $ZDOTDIR/unplugged.zsh
# }}}

# Options  {{{
#
# History
setopt bang_hist				# Perform textual history expansion, csh-style, treating the character ‘!’ specially.
setopt extended_history			# Record timestamp of command in HISTFILE
setopt hist_expire_dups_first 	# Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       	# Ignore duplicated commands history l
source ~/.fzf/shell/key-bindings.zsh 
source ~/.fzf/shell/completion.zsh 
setopt hist_ignore_space        # ignore commands that start with space
setopt hist_no_functions		# Don't store function definitions
setopt hist_reduce_blanks		# Remove superfluous blanks from each command line being added to the history list
setopt hist_verify              # show command with history expansion to user before running it
setopt inc_append_History		# Add new lines to the history file immediately (do not wait until exit)
setopt share_history          	# Share command history data
unsetopt hist_beep				# Shut up shut up shut up# History
# Directories
setopt auto_cd                  # Change to directory without cd 
setopt auto_pushd               # Push the old directory onto the directory stack
setopt pushd_ignore_dups        # Don't push multiple copies of the same directory onto the directory stack
setopt pushdminus               # Use pushd to rotate the stack so that the current directory is always on top
# Completion
setopt GLOB_COMPLETE			# show autocompletion menu with globs
setopt MENU_COMPLETE			# automatically highlight first element of completion menu
setopt AUTO_LIST				# automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD			# complete from both ends of a word.
setopt NO_LIST_BEEP				# don't beep when listing choices on ambiguous completion
setopt NOCASEGLOB               # case-insensitive globbing
setopt AUTO_MENU                # Show completion menu on successive tab press
setopt ALWAYS_TO_END
unsetopt COMPLETE_ALIASES       # make aliases work with completion nicely
unsetopt FLOWCONTROL
## }}}

# Completion {{{
#
autoload -Uz compinit
for dump in $ZDOTDIR/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
zle -C _expand_alias complete-word _generic

source $ZDOTDIR/_completion.zsh
source ~/.fzf/shell/completion.zsh 

# }}}

# Source RC Files and functions
source $ZDOTDIR/_aliases.zsh
source $ZDOTDIR/_fzf.zsh
source $ZDOTDIR/_utils.zsh

plugin-clone $PLUGIN_REPOS
plugin-source $PLUGINS

# Bindings {{{
source ~/.fzf/shell/key-bindings.zsh 

bindkey -M menuselect '^M' .accept-line
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect '^xg' clear-screen					# Clear
bindkey -M menuselect '^xi' vi-insert						# Insert
bindkey -M menuselect '^xh' accept-and-hold                	# Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  	# Next
bindkey -M menuselect '^xu' undo                           	# Undo
bindkey '^I' menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete
# This makes ← and → always move the cursor on the command line, even when you are in the menu:
bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char
# }}}


complete -o nospace -C terraform terraform
source $ZDOTDIR/_local.zsh

typeset -U path


