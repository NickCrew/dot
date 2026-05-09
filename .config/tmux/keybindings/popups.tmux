# vim: ft=tmux

# ==============================================================================
# CUSTOM POPUPS & SCRIPTS
# ==============================================================================

# Dependencies: 
#     - fzf
#     - zoxide
#     - https://github.com/raine/tmux-file-picker
#     - https://github.com/raine/tmux-bro
# Install:
#     - brew install coreutils tree
#     - cargo install fzf zoxide bat fd-find
#     - pipx install git+https://github.com/raine/tmux-bro.git
#     - brew install raine/tmux-snaglord/tmux-snaglord
#     - curl -O https://raw.githubusercontent.com/raine/tmux-file-picker/main/tmux-file-picker

# Open in a popup (tmux 3.2+) — uses lite shell mode (see ~/.config/zsh/.zshrc TMUX_POPUP block)
bind q display-popup -E -e TMUX_POPUP=1

# Pre-warmed full shell popup — first invocation pays full init, subsequent are ~instant.
# Detach with <prefix> d to keep session warm. Exit shell (C-d) destroys it.
bind C-a display-popup -E -h 90% -w 90% "tmux new-session -A -s _popup"

# Reset the warmed popup session (next <prefix> Q will re-init).
bind C-q run-shell 'tmux kill-session -t _popup 2>/dev/null; tmux display-message "popup session reset"'

bind C-s display-popup -h 50% -w 20% -E "tmux-session-switcher"
bind C-o display-popup -E "tmux-zoxide-window"
bind C-t display-popup -E "tmux-bro"

# File Pickers
bind C-f display-popup -h 60% -w 60% -E "tmux-file-picker"
bind C-r display-popup -h 60% -w 60% -E "tmux-file-picker -d"
bind C-g display-popup -h 60% -w 60% -E "tmux-file-picker -g"
bind C-d display-popup -h 60% -w 61% -E "tmux-file-picker --zoxide --dir-only"
bind C-z display-popup -h 60% -w 60% -E "tmux-file-picker --zoxide"

# Yanking
bind C-y display-popup -h 70% -w 70% -E "tmux-snaglord"



