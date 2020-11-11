#!/bin/bash

# Shamelessly copied from https://rancher.com/docs/rancher/v2.x/en/installation/install-rancher-on-k8s/

export KUBECONFIG="/vagrant/kube_config_cluster.yml"

# Install the CustomResourceDefinition resources separately
kubectl apply --validate=false \
  -f https://github.com/jetstack/cert-manager/releases/download/v1.0.4/cert-manager.crds.yaml

# Create the namespace for cert-manager
kubectl create namespace cert-manager

# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io

# Update your local Helm chart repository cache
helm repo update

# Install the cert-manager Helm chart
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v1.0.4

# Sanity check and deploy
kubectl get deployments -n cert-manager
kubectl rollout status deployment -n cert-manager cert-manager
kubectl rollout status deployment -n cert-manager cert-manager-cainjector
kubectl rollout status deployment -n cert-manager cert-manager-webhook
