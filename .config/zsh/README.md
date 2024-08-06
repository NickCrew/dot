# ZSH Config



## Setup

- This project is the `$ZDOTDIR`.   
- The `zshenv` file should be symlinked to `~/.zshenv`


### Completion

Updating completion scripts:

```zsh
outdir="${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/completions"
mkdir -p "${outdir}"

just --completions zsh > "${outdir}/_just"
kubectl completion zsh > "${outdir}/_kubectl"
colima completion zsh > "${outdir}/_colima"
gh completion -s zsh > "${outdir}/_gh"
wezterm shell-completion zsh > "${outdir}/_wezterm"
helm completion zsh > "${outdir}/_helm"
```





