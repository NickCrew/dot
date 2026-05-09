# vim: ft=tmux
# file: keybindings/default.tmux
# description: default key table — prefix, panes, windows, copy mode
# sourced by: tmux.conf
#----------------------------------------------------


# Prefix - Ctrl + A
set -g prefix C-a
unbind C-b
bind C-a send-prefix


# Reload Tmux Config
unbind r
bind-key r source-file ~/.tmux.conf  

# Open Popup terminal
bind q display-popup -E

# Open buffer selection
bind-key B choose-buffer

# Change Window Focus
bind -r ] next-window
bind -r [ previous-window
bind -r c new-window		

# Move Window and keep focus on moved window
bind -r S-Left swap-window -d -t -1
bind -r S-Right swap-window -d -t +1

# Pane Controls
bind - split-window -v
bind | split-window -h
bind x kill-pane
bind & kill-window

# Pane Navigation
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Pane Sizing
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5 
bind -r K resize-pane -U 5 
bind -r L resize-pane -R 5 

# Visual Selection
bind Enter copy-mode
bind -T copy-mode-vi v if -F "#{selection_present}" { send -X clear-selection } { send -X begin-selection }
# Visual block selection
bind -T copy-mode-vi S-v send -X rectangle-toggle  
# Yank/copy to tmux buffer
bind -T copy-mode-vi y send -X copy-selection-no-clear  
bind -T copy-mode-vi Enter send -X copy-selection-and-cancel

# Paste yanked text
unbind p
bind p paste-buffer  

# Session Management
unbind S
bind S command-prompt 'rename-session %%'
bind N new-session
# Create new session from current window
bind B command-prompt -p "New session name:" "new-session -d -s '%%'; move-window -t '%%:'; switch-client -t '%%'"



