# vim: ft=tmux
#
# Default Theme
#====================================

# Foregrounds
primary_fg_colour="colour253"				# white/grey
secondary_fg_colour="colour246"				# grey/grey
alt_fg_colour="colour7"						# light/grey
# Backgrounds
primary_bg_colour="colour236"				# dark/grey
# Values
secondary_field_value_colour="colour141"	# violet
alt_field_value_colour="colour15"			# dark grey
# Keys
primary_label_colour="colour131"			# orange
secondary_label_colour="colour81"			# cyan
# Windows
current_window_number_colour="colour208"	# purple
current_window_hi_colour="colour74"			# blue
# Borders
secondary_border_fg_colour="colour236"		# dark/grey
primary_border_fg_colour="colour38"			# teal

# Status Bar
set -g status-fg $primary_fg_colour
set -g status-bg $primary_bg_colour

# Status Bar Section Length
set -g status-left-length 39
set -g status-right-length 70

# Window Pane Border
set -g pane-active-border-style fg=$primary_border_fg_colour
set -g pane-border-style fg=$secondary_border_fg_colour

# Window Status Style
set -g window-status-separator ''
set -g window-status-style bg=$primary_bg_colour,fg=$primary_fg_colour
set -g window-status-current-style bg=$primary_bg_colour,fg=$primary_fg_colour
set -g window-status-activity-style bg=$primary_fg_colour,fg=$primary_bg_colour

# Status Bar Section Style
set -g status-left-style bg=$primary_bg_colour,fg=$primary_fg_colour
set -g status-right-style bg=$primary_bg_colour,fg=$primary_fg_colour



