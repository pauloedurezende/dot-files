#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Install ansible if it is not available on the machine
if ! [ -x "$(command -v ansible)" ]; then
  xcode-select --install
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  python3 get-pip.py
  python3 -m pip install ansible
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
