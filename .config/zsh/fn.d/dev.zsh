#=========================================
# name: tf-lint
#
# synopsis: 
#----------------------------------------
function lint-tf () {
  tflint --chdir="${1:-.}" --config="${2:-$HOME/.tflint.hcl}" 
}
