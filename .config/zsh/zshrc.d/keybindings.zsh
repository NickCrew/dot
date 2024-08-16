
alias _bind=bindkey
alias _bindms='bindkey -M menuselect'
alias _bindviins='bindkey -M viins'

_bindms 'h' vi-backward-char					# select left in completion menu					
_bindms 'k' vi-up-line-or-history				# select above in completion menu
_bindms 'j' vi-down-line-or-history   		# select below in completion menu
_bindms 'l' vi-forward-char					# select right in completion menu
_bindms '^xg' clear-screen					# Clears the screen
_bindms '^xi' vi-insert						# Insert
_bindms '^xh' accept-and-hold                	# Hold
_bindms '^xn' accept-and-infer-next-history  	# Next
_bindms '^xu' undo                           	# Undo

# zsh-autocomplete keybindings
_bindms '\t' menu-select "$terminfo[kcbt]" menu-select
_bindms '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete


