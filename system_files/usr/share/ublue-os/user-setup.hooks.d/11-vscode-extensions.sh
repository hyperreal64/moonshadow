#!/usr/bin/bash

source /usr/lib/ublue/setup-services/libsetup.sh

version-script vscode-extensions-dx user 1 || exit 1

set -x

# Setup VSCode
if test ! -e "$HOME"/.config/Code/User/settings.json; then
	mkdir -p "$HOME"/.config/Code/User
	cp -f /etc/skel/.config/Code/User/settings.json "$HOME"/.config/Code/User/settings.json
fi

code --install-extension Catppuccin.catppuccin-vsc
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension foxundermoon.shell-format
code --install-extension mads-hartmann.bash-ide-vscode
code --install-extension ms-azuretools.vscode-containers
code --install-extension ms-python.black-formatter
code --install-extension ms-python.isort
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension njpwerner.autodocstring
code --install-extension njqdev.vscode-python-typehint
code --install-extension redhat.vscode-xml
code --install-extension redhat.vscode-yaml
code --install-extension stylelint.vscode-stylelint
code --install-extension timonwong.shellcheck
code --install-extension yzhang.markdown-all-in-one
