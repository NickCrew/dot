# Tmux Configuration

## Installation

Install the configuration directory
````bash
git clone https://github.com/NickCrew/tmux-config.git ~/.tmux.conf.d
````

Create a `~/.tmux.conf` file that sets/overrides local settings and sources `~/.tmux.conf.d/default.conf`. 

### Minimal Example
````bash
# ~/.tmux.conf

source ~/.tmux.conf.d/default.conf

set -ga terminal-overrides ",*256col*:Tc"
````


### Plugins

Start `tmux` and press `Prefix + I` to install plugins. Plugins will create and install to `~/.tmux/plugins`.

## Usage

### Nested Sessions
Toggle nested sessions using `F12`. Status bar changes to indicate the outer session keybindings are disabled.



