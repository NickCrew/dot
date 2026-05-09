#!/Users/nick/.pyenv/versions/neovim/bin/python3
import glob
from pynvim import attach

nvims = [attach('socket', path=p) for p in glob.glob('/tmp/nvim/nvim*.sock')]

for nvim in nvims:
    nvim.command('call darkmodesocket#updateTheme()')
