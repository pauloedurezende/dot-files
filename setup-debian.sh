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

# Check if any role was entered
tags="all"
while getopts "r:" roles
do
  case "${roles}" in
    r) tags=${OPTARG};;
  esac
done

ansible-playbook -i hosts.yml environment.yml --ask-become-pass --tags $tags
