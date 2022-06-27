#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Install ansible if it is not available on the machine
if ! [ -x "$(command -v ansible)" ]; then
  # Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  echo "eval '/opt/homebrew/bin/brew shellenv)'" >> ${HOME}/.zprofile
  eval "/opt/homebrew/bin/brew shellenv)"
  
  # Ansible
  brew install ansible
fi

# Check if any role was entered
tags="all"
while getopts "r:" roles
do
  case "${roles}" in
    r) tags=${OPTARG};;
  esac
done

ansible-playbook -i ./hosts.yml ./environment.yml --ask-become-pass --tags $tags
