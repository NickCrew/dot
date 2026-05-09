#
# Miscellaneous utility functions
#


# Find process using port (requires sudo)
function fd-port-proc () { 
  local port
  local pid
  port=$1
  pid=$(sudo lsof -nP -i4TCP:${port} | grep LISTEN | awk '{print $2}')
  if [[ -z $pid ]]; then
      echo "No process found using port $port"
  else
      ps -p $pid
  fi
}


# Show all 256 colors
function show-colors () {
  for i in {0..255};
    do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; 
  done
}


function emarks () {
  ${EDITOR:-nvim} "$HOME/.pathmarks"
}


# Manage dot files git repo
function dots () {
  git \
    --git-dir="${DOTSDIR:-$HOME/.dots.git}" \
    --work-tree=$HOME \
    "$@"
}

# Initialize Dotfiles bare repo
function  dots-init () {
  git clone \
    --bare ${DOTS_HTTP_URL:-https://github.com/NickCrew/dots.git} \
    -b ${DOTS_BRANCH:-main} "${DOTS_DIR:-$HOME/.dots.git}"

  dots config status.showUntrackedFiles no

  dots checkout
}

# # name: edit-cfg
# # synopsis: Quickly open frequently edited config files
# function edit-cfg () {
#
#
#   nocd=0
#   if [[ "$2" == "-x" || "$2" == "--nocd"]]; then 
#     nocd=1
#   fi
#
#   editor=${EDITOR:-nvim}
#
#   # XDG Config Home
#   xdg_cfg_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
#
#   # Config Home
#   zsh_cfg="${xdg_cfg_dir}/zsh/.zshrc" 
#   git_cfg="${xdg_cfg_dir}/git/gitconfig"
#   tmux_cfg="${xdg_cfg_dir}/tmux/default.tmux"
#   tmuxp_cfg="${xdg_cfg_dir}/tmuxp/default.yaml"
#   nvim_cfg="${xdg_cfg_dir}/nvim/init.lua"
#   # User Home
#   claude_user_cfg="$HOME/.claude.json"
#   claude_cfg="$HOME/.claude/settings.json"
#   codex_cfg="$HOME/.codex/config.toml"
#   gemini_cfg="$HOME/.gemini/settings.json"
#   npm_cfg="$HOME/.npmrc"
#   # User Library
#   ghostty_cfg="$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
#
#   app="$1"
#   app_cfg_dir_var="${(P)${:-app}}_cfg"
#   app_cfg_dir=$(echo "${(P)${app_cfg_dir_var}}")
#
#
#   if [[ ! -d "${app_cfg_dir}" ]]; then
#     echo "ERROR: Could not determine config file path for app '${app}'"
#     exit 1
#   fi
#
#   $editor "${app_cfg_dir}"
#
# }
