#!/bin/bash

OS=$(uname -s)
PYVERSION=${PYVERSION:-3.11.4}
PREFIX="${TMUX_PREFIX:-$HOME/.local}"

TMUX_REMOTE="https://github.com/tmux/tmux"
TPM_REMOTE="https://github.com/tmux-plugins/tpm"
TMUX_PLUG="${TMUX_PLUG:-$HOME/.tmux/plugins}"


install_tmux() {
	TMUX_SRC="${PREFIX}/src/tmux"
	mkdir -p "${TMUX_SRC}" "${PREFIX}/share/man/man1" \
		&& cd "${TMUX_SRC}"

	if [ -d .git ]; then git pull -f;
	else git clone ${TMUX_REMOTE}; fi

	sh autogen.sh 
	./configure --enable-utf8proc --prefix=${PREFIX}
	make && make install 

	[ ! -d "${TMUX_PLUG}/tpm" ] \
      && git clone ${TPM_REMOTE} "${TMUX_PLUG}"
}


# Using Ansible for Docker Registry Load Testing
#
function install_brew() {
  if [ "$OS" = "Darwin" ]; then
      xcode-select --install
      # install homebrew if it's missing
      if ! command -v brew >/dev/null 2>&1; then
          echo "Installing homebrew"
          /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      fi
  fi
}

function install_brew_packages() {
  brew install \
	libevent \
	ncurses \
    cfn-lint \
	utf8proc  \
    ansible \
    yamllint \
    yamlfmt \
    automake \
    aws-iam-authenticator \
    bison \
    bzip2 \
    fortune \
    gimme-aws-creds \
    git-delta \
    helm \
    jq \
    k9s \
    k9s \
    kube-linter \
    kube-linter \
    kube-ps1 \
    kubectl \
    kubectx \
    kubernetes-cli \
    lf \
    luarocks \
    luarocks \
    neovim-remote \
    nvimpager \
    nvm \
    terragrunt \
    terraform \
    pipx \
    pkg-config
    pyenv \
    pyenv-virtualenv \
    pyenv-virtualenvwrapper \
    ranger \
    exa \
    fd-find \
    mcfly \
    ripgrep \
    zoxide 
}

function install_node() {
  if (( ! $+commands[node] )); then
    if (( ! $+commands[nvm] )); then
		PROFILE=/dev/null curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
	fi
	nvm install node
  fi
}

function install_python() {
  # Return immediately if poetry is not found
  if (( $+commands[pyenv] )); then

    pyenv install $PYVERSION
    pyenv global $PYVERSION

    brew install pipx
    pipx ensurepath

    curl -sSL https://install.python-poetry.org | python3 -

  fi
}

function install_python_cli_packages() {
  echo ""
 }


## Main ##

# Homebrew
if [[ ! -z `echo $YADM_BOOTSTRAP_SKIP | grep brew` ]]; then
  install_brew
  install_brew_packages
fi

# Rust
if [[ ! -z `echo $YADM_BOOTSTRAP_SKIP | grep rust` ]]; then
  install_rust
  install_cargo_packages
fi

# Node
if [[ ! -z `echo $YADM_BOOTSTRAP_SKIP | grep node` ]]; then
  install_node
  install_npm_global_packages
fi

# Python
if [[ ! -z `echo $YADM_BOOTSTRAP_SKIP | grep python` ]]; then
  install_python
  install_python_cli_packages
fi

# Tmux
if [[ ! -z `echo $YADM_BOOTSTRAP_SKIP | grep tmux` ]]; then
  install_tmux
fi
