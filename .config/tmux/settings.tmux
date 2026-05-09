# vim: ft=tmux
# File: settings.tmux
# Description: Sourced by tmux.conf
#-------------------------------------------------


# ==============================================================================
# TERMINAL & COLOR SUPPORT
# ==============================================================================

set -g default-terminal "tmux-256color"
set -g default-command zsh

# Clipboard
set -as terminal-features "*:clipboard"
set -s set-clipboard on

# True color, Undercurl & Underscore colors support
set -as terminal-features "*:RGB"
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

set -g history-limit 100000
set -g bell-action none  # No bells at all


# ==============================================================================
# CORE SETTINGS
# ==============================================================================

setw -g mode-keys vi             # Vi bindings in copy mode
set -g mouse on
set -g detach-on-destroy on      # off: Stay in tmux when session closes
set -g remain-on-exit on         # Windows can be respawned after command completion
set -g focus-events on           # Focus events enabled for terminals that support it
set -g status-interval 5         # update status bar every n seconds

# Window/Pane naming and numbering
setw -g pane-base-index 1        # Pane numbers start at 1
set -g base-index 1              # Window numbers start at 1
set -g renumber-windows on       # No gaps after closing windows
set -g automatic-rename off

# Time settings 
set -s escape-time 0             # (ms) No delay after Esc 
set -g display-time 4000         # (ms) Duration of status messages 
set -g repeat-time 750           # (ms) Timeout for repeatable keybindings (bind -r)


# ==============================================================================
# PLUGIN CUSTOMIZATION OPTIONS
# ==============================================================================

set -g @sidebar-tree 'e'
set -g @sidebar-tree-focus 'w'
set -g @sidebar-tree-command 'tree -C'
set -g @fpp-mode 'paste' # Paste selected filepaths instead of launching editor

