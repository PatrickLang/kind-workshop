#!/usr/bin/env bash

GORELEASE=1.13.4
KINDRELEASE=v0.5.1
KUBERELEASE=v1.16.2

echo Setting up kubectl
curl -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBERELEASE}/bin/linux/amd64/kubectl
chmod +x /usr/local/bin/kubectl

echo Setting up Docker CE and build tools
curl -Lo /etc/apt/sources.list.d/docker.list https://k8s.work/docker.list  
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add
apt update
apt install git build-essential docker-ce docker-ce-cli vim rsync --no-install-recommends -y
# rm -rf /var/lib/apt/lists/*
sudo usermod -a -G docker vagrant

echo Setting up Golang
curl -Lo /tmp/go${GORELEASE}.linux-amd64.tar.gz https://dl.google.com/go/go${GORELEASE}.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf /tmp/go${GORELEASE}.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" | sudo tee --append /etc/profile
echo "export PATH=\$PATH:~/go/bin" | tee --append ~/.bashrc
source /etc/profile
source ~/.bashrc

echo Setting up Kind
curl -Lo /usr/local/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/${KINDRELEASE}/kind-$(uname)-amd64
chmod +x /usr/local/bin/kind