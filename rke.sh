#! /bin/bash
RKE_URL="https://github.com/rancher/rke/releases/download/v1.1.9/rke_linux-amd64"
TARGET_RKE=/usr/local/bin/rke

sudo wget -q $RKE_URL -O $TARGET_RKE
sudo chmod 755 $TARGET_RKE

rke --version

