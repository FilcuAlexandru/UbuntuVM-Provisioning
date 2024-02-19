#!/bin/bash

# Install necessary packages
sudo apt install -y python3-pip python3-openssl

# Install Ansible using pip
echo "*** Installing Ansible with pip ***"
python3 -m pip install --user ansible

# Add pip-installed binaries to PATH
echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc

