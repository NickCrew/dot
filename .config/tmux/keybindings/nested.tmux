# vim: ft=tmux
#
# F12 toggles "nested" focus mode. When nested, this session's prefix is
# disabled so a tmux session running inside it can claim the keyboard;
# the status bar dims to indicate which session has focus.

bind -T root F12 \
    set prefix None \; \
    set key-table off \; \
    if -F '#{pane_in_mode}' 'send-keys -X cancel' \; \
    source-file ~/.config/tmux/theme/nested.tmux

bind -T off F12 \
    set -u prefix \; \
    set -u key-table \; \
    set -u status-style \; \
    set -u window-status-current-style \; \
    set -u window-status-current-format \; \
    source-file ~/.config/tmux/theme/statusbar.tmux \; \
    source-file ~/.config/tmux/theme/windows.tmux
