 export FZF_COMPLETION_TRIGGER=';;'
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
_FZF_COLORS="bg+:-1,fg:gray,fg+:white,border:black,spinner:0,hl:yellow,header:blue,info:green,pointer:red,marker:blue,prompt:gray,hl+:red"
export FZF_DEFAULT_OPTS="--height 60% --border sharp --layout reverse --color '$_FZF_COLORS' --prompt '∷ ' --pointer ▶ --marker ⇒"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_CTRL_T_OPTS="--walker-skip .git --preview 'bat --style=numbers --color=always {}' --bind '?:toggle-preview'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls" 
