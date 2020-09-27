#!/bin/bash

set -e

sudo apt update
sudo apt install -y emacs git curl exuberant-ctags python3-jedi global npm \
    python3-bashate shellcheck elpa-use-package elpa-magit elpa-zenburn-theme \
    elpa-solarized-theme elpa-powerline elpa-lsp-mode elpa-ivy elpa-company \
    elpa-company-lsp elpa-projectile elpa-which-key

npm i -g bash-language-server
