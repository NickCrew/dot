
bindkey -v  

source ~/.fzf/shell/key-bindings.zsh

bindkey -M menuselect 'h' vi-backward-char				    # Left
bindkey -M menuselect 'k' vi-up-line-or-history				# Up
bindkey -M menuselect 'j' vi-down-line-or-history           # Down
bindkey -M menuselect 'l' vi-forward-char					# Right
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
# History
# bindkey -M viins '^[[A' up-line-or-history
# bindkey -M viins '^[[B' down-line-or-history
# bindkey '^[[A' up-line-or-history
# bindkey '^[[B' down-line-or-history
# BKSPC and CTRL+H working after returning from cmd mode
bindkey '^?' backward-delete-char  
bindkey '^h' backward-delete-char
 # CTRL-W removed word backwards
bindkey '^w' backward-kill-word   

# CTRL-R for history search
bindkey '^r' atuin-search-viins
eval "$(atuin init zsh)"


