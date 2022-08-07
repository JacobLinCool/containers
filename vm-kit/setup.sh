#!/bin/sh
set -ex
DEBIAN_FRONTEND=noninteractive

# Setup Host Tools
sudo apt update && sudo apt upgrade -y && sudo apt install -y curl jq git && sudo apt autoremove -y

# Install Docker
curl -fsSL https://get.docker.com | sudo sh -
sudo chmod a+rw /var/run/docker.sock

# Install Sysbox
if [ "$(arch)" = "x86_64" ]; then
    wget -O ~/sysbox.deb https://downloads.nestybox.com/sysbox/releases/v0.5.2/sysbox-ce_0.5.2-0.linux_amd64.deb
else
    wget -O ~/sysbox.deb https://downloads.nestybox.com/sysbox/releases/v0.5.2/sysbox-ce_0.5.2-0.linux_arm64.deb
fi
sha256sum ~/sysbox.deb
sudo apt install -y ~/sysbox.deb
rm ~/sysbox.deb
sudo systemctl status sysbox -n 30 --no-pager

# Docker Compose
docker compose up -d
