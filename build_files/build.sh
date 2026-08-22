#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

# Additional packages
dnf5 install -y \
	atop \
	nfs-utils \
	prometheus-node-exporter \
	rpcbind \
	yakuake

# systemd services
systemctl enable atop.service
systemctl enable atopacct.service
systemctl enable atop-rotate.timer
systemctl enable prometheus-node-exporter.service
systemctl enable rpcbind.service
systemctl disable cups.service
