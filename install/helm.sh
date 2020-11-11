#! /bin/bash
HELM_ARCHIVE="helm-v3.4.0-linux-amd64.tar.gz"
HELM_URL="https://get.helm.sh/$HELM_ARCHIVE"
TMP_ARCHIVE="/tmp/$HELM_ARCHIVE"
TARGET_HELM=/usr/local/bin/helm

sudo wget -q "$HELM_URL" -O "$TMP_ARCHIVE"
sudo tar -zxvf "$TMP_ARCHIVE" -C "/tmp"
sudo mv "/tmp/linux-amd64/helm" "$TARGET_HELM"
sudo chmod 755 "$TARGET_HELM"

helm version
