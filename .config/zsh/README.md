# ZSH Config

## Structure


### `$ZDOTDIR`

The `~/.zshenv` is always in the 

```
├── .zprofile                 # Loads after .zshrc for login and non-interactive
├── .zsh_history              # (ignored by git)
├── .zshrc   
├── README.md
├── fragments                 # shell integrations (with load order)
│   ├── 10-terraform.zsh
│   ├── 20-fzf.zsh
│   ├── 30-atuin.zsh
│   └── 70-pyenv.zsh
├── local.zsh                 # Load sensitive values (ignored by git)
├── p10k.zsh                  # Prompt configuration
├── rc.d                      # zshrc sections (with load order)
│   ├── 20-options.zsh
│   ├── 30-zstyle.zsh
│   ├── 35-exports.zsh
│   ├── 40-env.zsh
│   ├── 50-aliases.zsh
│   ├── 50-func.zsh
│   └── 95-keybindings.zsh
└── unplugged.zsh             # A lightweight plugin manager
```



## Completion

### Updating completions

To help me generate completions on a new machine.

```zsh
outdir="${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/completions"

mkdir -p "${outdir}"
kubectl completion zsh > "${outdir}/_kubectl"
colima completion zsh > "${outdir}/_colima"
gh completion -s zsh > "${outdir}/_gh"
wezterm shell-completion zsh > "${outdir}/_wezterm"
helm completion zsh > "${outdir}/_helm"
```





