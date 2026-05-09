# vim: ft=tmux
#
# Indicate this level has focus (normal mode)
set -g @net_speed_interfaces "en8"
set -g @online_icon "ok"
set -g @offline_icon "offline!"

#------------------------
#     COLORS
#------------------------

secondary_label_colour="colour81"
secondary_field_value_colour="colour141"
alt_field_value_colour="colour15"
current_window_number_colour="colour209"


#------------------------
#      CLOCK 
#------------------------

date_seg="#[fg=$secondary_field_value_colour]%a %b %d, %Y"
time_seg="#[fg=$secondary_field_value_colour]%H:%M"
CLOCK="#[fg=$secondary_label_colour]$time_seg#[fg=$secondary_label_colour]]#{prefix_highlight}"


#------------------------
#   RESOURCE MONITOR
#------------------------

cpu_seg="#[fg=$alt_fg_colour]C: #[fg=$secondary_field_value_colour]#{cpu_percentage}"
temp_seg="#[fg=$alt_fg_colour]TEMP: #[fg=$secondary_field_value_colour]#{cpu_temp}"
mem_seg="#[fg=$alt_fg_colour]M: #[fg=$secondary_field_value_colour]#{ram_percentage}"
bat_seg="#[fg=$alt_fg_colour]BAT: #[fg=$secondary_field_value_colour]#{battery_percentage}"
net_seg="#[fg=$alt_fg_colour]Net: #[fg=$secondary_field_value_colour]#{net_speed}"
online_seg="#[fg=$alt_fg_colour]Onlinet: #[fg=$secondary_field_value_colour]#{online_status}"
MONITOR="#[fg=$secondary_label_colour]$cpu_seg #[fg=$secondary_label_colour]]-[$mem_seg#[fg=$secondary_label_colour]"


#------------------------
#   WIDGETS
#------------------------

# WHOAMI
WHOAMI="#[fg=$secondary_label_colour] #[fg=$secondary_fg_colour]#(whoami)#[fg=$secondary_label_colour]@#[fg=colour7]#H#[fg=$secondary_label_colour] "
# SESSION
SESSION="#[fg=$secondary_label_colour]  [#[bg=$primary_bg_colour]#[fg=$secondary_field_value_colour]#S#[fg=$secondary_label_colour]] "  
# WINDOW 
WINDOW=" #[fg=$secondary_label_colour]#I#[fg=$alt_field_value_colour] #{window_name} "
# ACTIVE WINDOW
ACTIVE_WINDOW=" #[bg=$primary_bg_colour]#[fg=$current_window_number_colour]▶ #[fg=$secondary_label_colour]#I#[fg=colour150] #{window_name} #[fg=$accent_fg_colour_alt]" 




#------------------------
#   STATUSBAR LAYOUT
#------------------------

# SECTION:       LEFT       WINDOWS               RIGHT
# FORMAT:      <Session>    <Window List>         <Clock>
# EXAMPLE:        [3]       ▶ 1 nvim  2 zsh       [18:16]
set -g status-right "$CLOCK"
set -g status-left "$SESSION" 
set -g window-status-format "$WINDOW"
set -g window-status-current-format "$ACTIVE_WINDOW"
