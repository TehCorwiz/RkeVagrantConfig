#! /bin/bash

# Download latest version
wget -q "https://storage.googleapis.com/kubernetes-release/release/$(wget -qO- https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
sudo chmod 755 ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

kubectl version --client

