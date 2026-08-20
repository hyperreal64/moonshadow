#!/usr/bin/env bash
set -xeuo pipefail

systemctl enable docker.socket
systemctl enable podman.socket
systemctl enable ublue-system-setup.service
systemctl --global enable ublue-user-setup.service
systemctl enable bazzite-dx-groups.service

# systemd for additional packages
systemctl enable atop.service
systemctl enable atopacct.service
systemctl enable atop-rotate.timer
systemctl enable prometheus-node-exporter.service
systemctl enable rpcbind.service
systemctl disable cups.service
