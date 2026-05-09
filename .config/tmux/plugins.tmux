# vim: ft=tmux

# DISABLED — kept for reference:

# # url: https://github.com/tmux-plugins/vim-tmux-navigator
# set -g @plugin 'tmux-plugins/vim-tmux-navigator'

# # url: https://github.com/RyanMillerC/better-vim-tmux-resizer
# set -g @plugin 'RyanMillerC/better-vim-tmux-resizer'

# # url: https://github.com/tmux-plugins/tmux-cpu
# set -g @plugin 'tmux-plugins/tmux-cpu'

# # url: https://github.com/tmux-plugins/tmux-battery
# set -g @plugin 'tmux-plugins/tmux-battery'

# # url: https://github.com/tmux-plugins/tmux-net-speed
# set -g @plugin 'tmux-plugins/tmux-net-speed'



# url: https://github.com/tmux-plugins/tpm
set -g @plugin 'tmux-plugins/tpm'

# url: https://github.com/tmux-plugins/tmux-fpp
set -g @plugin 'tmux-plugins/tmux-fpp'

# url: https://github.com/tmux-plugins/tmux-open
set -g @plugin 'tmux-plugins/tmux-open'

# url: https://github.com/tmux-plugins/tmux-sensible
set -g @plugin 'tmux-plugins/tmux-sensible'

# url: https://github.com/tmux-plugins/tmux-sessionist
set -g @plugin 'tmux-plugins/tmux-sessionist'

# url: https://github.com/tmux-plugins/tmux-yank
set -g @plugin 'tmux-plugins/tmux-yank'

# url: https://github.com/tmux-plugins/tmux-prefix-highlight
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'

# url: https://github.com/tmux-plugins/tmux-sidebar
set -g @plugin 'tmux-plugins/tmux-sidebar'

# url: https://github.com/tmux-plugins/tmux-urlview
# dependencies: urlview (brew install urlview)
set -g @plugin 'tmux-plugins/tmux-urlview'

# Install TPM with: git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
run -b '~/.tmux/plugins/tpm/tpm'
