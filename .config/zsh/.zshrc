# vim: foldmethod=marker foldmarker={{{,}}}
# .zshrc
#


# Plugins (installed) {{{
PLUGIN_REPOS=(
  ohmyzsh/ohmyzsh

  jkavan/terragrunt-oh-my-zsh-plugin
  bigH/git-fuzzy
  scmbreeze/scm_breeze
  unixorn/git-extra-commands
  baliestri/git-profiles.plugin.zsh
  jeffreytse/zsh-vi-mode
  urbainvaes/fzf-marks
  romkatv/powerlevel10k
  marlonrichert/zsh-autocomplete
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zdharma-continuum/fast-syntax-highlighting
)
# }}}

# Plugins (enabled) {{{

PLUGINS=(
  # zsh-vi-mod
  
  powerlevel10k

  fast-syntax-highlighting
  zsh-autocomplete
  zsh-autosuggestions
  zsh-completions

  fzf-marks
  bd
  git-extra-commands
  terragrunt-oh-my-zsh-plugin

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
  # ohmyzsh/plugins/fzf

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
  "${ZPLUGINDIR:-$HOME/.local/share/zsh/plugins}/git-fuzzy/bin"
  $path
)
# }}}

# Initialize  {{{

# Modules
zmodload zsh/zprof  
zmodload zsh/complist

# Keymap
bindkey -v  

# Prompt
if [[ -f "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 
fi
source $ZDOTDIR/p10k.zsh

# Light-weight plugin manager
source $ZDOTDIR/unplugged.zsh

# }}}

# Options  {{{

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
unsetopt hist_beep				# Shut up shut up shut up# History

# Directories
setopt auto_cd                  # Change to directory without cd 
setopt auto_pushd               # Push the old directory onto the directory stack
setopt pushd_ignore_dups        # Don't push multiple copies of the same directory onto the directory stack
setopt pushdminus               # Use pushd to rotate the stack so that the current directory is always on top

# Completion
setopt glob_complete			# show autocompletion menu with globs
setopt menu_complete			# automatically highlight first element of completion menu
setopt auto_list				# automatically list choices on ambiguous completion.
setopt complete_in_word			# complete from both ends of a word.
setopt no_list_beep				# don't beep when listing choices on ambiguous completion
setopt nocaseglob               # case-insensitive globbing
setopt auto_menu                # Show completion menu on successive tab press
setopt always_to_end
unsetopt complete_aliases       # make aliases work with completion nicely
unsetopt flowcontrol

setopt extendedglob
## }}}

# Load RC {{{

for f in $ZSHRCD/*.zsh; do   # Load RC files
  source $f
done


plugin-clone $PLUGIN_REPOS   # Install plugins
plugin-source $PLUGINS       # Load enabled plugins


for f in $ZSHFND/*.zsh; do   # Load functions
  source $f
done

# }}}

# Bindings {{{

bindkey "^f" zce
bindkey "^b" push-line
bindkey '^I' menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete
bindkey '^[^M' self-insert-unmeta  # Alt + Enter gives a new line

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
# This makes ← and → always move the cursor on the command line, even when you are in the menu:
bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char
# }}}

complete -o nospace -C terraform terraform

source $ZDOTDIR/local.zsh


typeset -U path



