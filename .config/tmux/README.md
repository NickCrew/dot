# Tmux Configuration

Modular tmux config split into `settings`, `theme`, and `keybindings`,
with an `F12` toggle for nested-session focus mode.

## Install

```bash
git clone https://github.com/NickCrew/tmux-config.git ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Point `~/.tmux.conf` at the entry point. Put any machine-local overrides
above the `source-file` line so they apply before this repo's defaults
have a chance to be overwritten:

```tmux
# ~/.tmux.conf
set -ga terminal-overrides ",*256col*:Tc"
source-file ~/.config/tmux/tmux.conf
```

Start tmux, then press `Prefix + I` to install plugins.

## Layout

```
~/.config/tmux/
├── tmux.conf          # entry point — sources everything below in order
├── settings.tmux      # terminal, mouse, history, base options
├── plugins.tmux       # TPM and plugin list (sourced last)
├── keybindings/
│   ├── default.tmux   # default key table — sets prefix C-a
│   └── nested.tmux    # F12 toggle for nested-session focus mode
├── theme/
│   ├── colors.tmux    # palette vars (must source before statusbar/windows)
│   ├── statusbar.tmux # active status bar
│   ├── windows.tmux   # pane and window styling
│   └── nested.tmux    # dimmed status bar shown in nested mode
└── tools/
    └── show-tmux-colors  # CLI helper that prints the 256-color palette
```

Load order matters. `colors.tmux` defines the palette variables consumed
by `statusbar.tmux` and `windows.tmux`, so it must be sourced first.
`plugins.tmux` runs last per TPM convention.

## Reload

`Prefix + r` re-sources `~/.tmux.conf`. From a shell:
`tmux source ~/.tmux.conf`.

## Keybindings

Prefix is `C-a` (not the default `C-b`). `C-b` is unbound and `C-a` is
also bound to `send-prefix`, so it passes through to nested apps.

### Sessions and windows

| Key | Action |
| --- | --- |
| `prefix r` | Reload `~/.tmux.conf` |
| `prefix q` | Open popup terminal (`display-popup -E`) |
| `prefix B` | Choose buffer |
| `prefix c` | New window |
| `prefix n` | Next window |
| `prefix S-Left` | Swap window with previous, keep focus |
| `prefix S-Right` | Swap window with next, keep focus |
| `prefix &` | Kill window |

Note: the default `p` (previous-window) is rebound to `paste-buffer`
(see Copy mode). Cycle backwards with repeated `prefix n` or use
`prefix l` to jump to the last-active window (default tmux behavior).

### Panes

| Key | Action |
| --- | --- |
| `prefix -` | Split horizontally (new pane below) |
| `prefix \|` | Split vertically (new pane right) |
| `prefix x` | Kill pane |
| `prefix h` / `j` / `k` / `l` | Move focus left/down/up/right |
| `prefix H` / `J` / `K` / `L` | Resize pane by 10 cells (repeatable) |

The resize bindings use `-r`, so you can hold the modifier and press
`H`/`J`/`K`/`L` repeatedly within the repeat-time window without
re-sending the prefix.

### Copy mode (vi)

`mode-keys vi`, so movement is `h`/`j`/`k`/`l`. Enter copy mode with
`prefix [`.

| Key | Action |
| --- | --- |
| `v` | Begin selection |
| `S-v` | Toggle rectangle (block) selection |
| `y` | Copy selection to tmux buffer and exit copy mode |
| `prefix p` | Paste from buffer |

## Nested mode

Press `F12` to disable this session's prefix and dim the status bar.
Useful when a tmux session running inside this one needs to claim the
keyboard — keystrokes pass through unmodified instead of being
intercepted by the outer prefix. Press `F12` again to restore.

Mechanically, the toggle switches `key-table` between the default and
`off`, and re-sources either `theme/nested.tmux` (dim) or
`theme/statusbar.tmux` + `theme/windows.tmux` (restore). See
`keybindings/nested.tmux`.

## Plugins

Managed by [TPM](https://github.com/tmux-plugins/tpm), listed in
`plugins.tmux`:

| Plugin | Purpose |
| --- | --- |
| `tmux-sensible` | Defaults most users converge on |
| `tmux-sessionist` | Better session management bindings |
| `tmux-yank` | Copy to system clipboard |
| `tmux-open` | Open highlighted URLs and files |
| `tmux-fpp` | Pluck file paths out of the buffer |
| `tmux-prefix-highlight` | Show in the status bar when prefix is held |
| `tmux-sidebar` | Toggleable directory-tree sidebar (`prefix + Tab`) |

A few status-bar widget plugins (`tmux-cpu`, `tmux-battery`,
`tmux-net-speed`) and navigator/resizer plugins are commented out in
`plugins.tmux` — uncomment to re-enable.

TPM bindings: `prefix + I` install, `prefix + U` update,
`prefix + alt-u` remove plugins not in the list.

## Tools

`tools/show-tmux-colors` prints the 256-color palette so you can
preview the color codes referenced in `theme/colors.tmux`:

```bash
tools/show-tmux-colors          # all 256
tools/show-tmux-colors 200      # one color
tools/show-tmux-colors 200 220  # range
```
