#! /bin/bash

# Download latest version
VERSION=$(wget -qO- https://storage.googleapis.com/kubernetes-release/release/stable.txt)
wget -q "https://storage.googleapis.com/kubernetes-release/release/$VERSION/bin/linux/amd64/kubectl"
sudo chmod 755 ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

kubectl version --client
