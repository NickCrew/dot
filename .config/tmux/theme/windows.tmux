# vim: ft=tmux

# Window Pane Border
set -g pane-active-border-style fg=$primary_border_fg_colour
set -g pane-border-style fg=$secondary_border_fg_colour

# Window Status Style
set -g window-status-separator ''
set -g window-status-style bg=$primary_bg_colour,fg=$primary_fg_colour
set -g window-status-current-style bg=$primary_bg_colour,fg=$primary_fg_colour
set -g window-status-activity-style bg=$primary_fg_colour,fg=$primary_bg_colour

