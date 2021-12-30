#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Install ansible if it is not available on the machine
if ! [ -x "$(command -v ansible)" ]; then
  sudo apt update
  sudo apt install software-properties-common
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  sudo apt install --yes ansible
fi

ansible-playbook -i --ask-become-pass --tags setup
