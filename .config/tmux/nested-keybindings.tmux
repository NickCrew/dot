
# Use <F12> to toggle between normal/nested focus mode
# and change the status bar accordiingly
bind -T root F12  \
    set prefix None \; \
    set key-table off \; \
    if -F '#{pane_in_mode}' 'send-keys -X cancel' \; \
    source $nested_inactive \; \

bind -T off F12 \
    set -u prefix \; \
    set -u key-table \; \
    set -u status-style \; \
    set -u window-status-current-style \; \
    set -u window-status-current-format \; \
    source $nested_active \; \



