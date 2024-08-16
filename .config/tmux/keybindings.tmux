# vim: ft=tmux

##
## KEYBINDINGS
##

# Reload Tmux Config
unbind r
bind-key r source-file ~/.tmux.conf  

# Open buffer selection
bind-key B choose-buffer

# Change Window Focus
bind n next-window
bind b previous-window
bind c new-window		

# Move Window and keep focus on moved window
bind S-Left swap-window -d -t -1
bind S-Right swap-window -d -t +1

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
bind -r H resize-pane -L 10 
bind -r J resize-pane -D 10 
bind -r K resize-pane -U 10 
bind -r L resize-pane -R 10 

# Visual Selection
bind-key -T copy-mode-vi 'v'   send -X begin-selection  
# Visual block selection
bind-key -T copy-mode-vi 'S-v' send -X rectangle-toggle  
# Yank/copy to tmux buffer
bind-key -T copy-mode-vi 'y'   send -X copy-selection-and-cancel  
# Paste yanked text
unbind p
bind p paste-buffer  


