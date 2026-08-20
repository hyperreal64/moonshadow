#!/usr/bin/bash

source /usr/lib/ublue/setup-services/libsetup.sh

version-script vscode-extensions-dx user 1 || exit 1

set -x

# Setup VSCodium
if test ! -e "$HOME"/.config/Codium/User/settings.json; then
	mkdir -p "$HOME"/.config/Codium/User
	cp -f /etc/skel/.config/Codium/User/settings.json "$HOME"/.config/Codium/User/settings.json
fi

codium --install-extension ms-vscode-remote.remote-containers
codium --install-extension ms-vscode-remote.remote-ssh
