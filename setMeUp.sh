#!/bin/bash

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.6/2022-03-09/bin/linux/amd64/kubectl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

#......................
echo "Other commands..."

unzip awscliv2.zip
chmod +x ./kubectl

#......................
echo "Installation..."

sudo ./aws/install
sudo yum git

#......................
echo "Pathing..."

mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
sudo mv /tmp/eksctl /usr/local/bin

#......................
echo "Here's the versions"
aws --version
kubectl version --short --client
eksctl version
