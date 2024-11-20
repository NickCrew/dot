#=========================================
# name rcedit
# synopsis: Edit Config Files
#----------------------------------------
function rcedit ()    { 
  local app=$1
  local rcfile=${2:-config}
  local rcdir="${XDG_CONFIG_HOME:-$HOME/.config}"
  local cachedir="${XDG_CACHE_HOME:-$HOME/.cache}/rcedits/${app}"
  local backupfilename=${rcfile}.$(date +%Y%m%d%H%M%S)
  local backupfilepath="${cachedir}/${backupfilename}"
  local rceditor=${EDITOR:-nvim}
  here=$(pwd)
  cd "${rcdir}/${app}"
  mkdir -p "${cachedir}"
  cp "${rcfile}" "${backupfilepath}"
  ${rceditor} "${rcfile}"    
  cd "${here}"
}



