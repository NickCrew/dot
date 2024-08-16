# vim: ft=tmux
# Terminal & True Color
set -g default-terminal "screen-256color"
set -as terminal-features ",xterm-256color:RGB"     #  For <3.2 : set -ga terminal-overrides ",xterm-256color*:Tc"

# Shell
set -g default-command zsh
set -g history-limit 10000

# Input
set -g prefix C-a  
set -g mode-keys vi
set -g mouse on
set -sg escape-time 10

# UI
set -g focus-events on

# Statusbar
set -g status-interval 5    # update status bar every n seconds

# Window Names / Indexes
set -g base-index 1         
set -g automatic-rename on 
set-option -g renumber-windows on

# Panes
setw -g pane-base-index 1


