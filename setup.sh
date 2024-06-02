#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to set up a virtual environment
setup_virtualenv() {
  echo "Creating a virtual environment..."
  python3 -m venv venv
  
  activate_virtualenv

  echo "Upgrading pip..."
  pip install --upgrade pip
}

# Function to activate a virtual environment
activate_virtualenv() {
  echo "Activating the virtual environment..."
  source venv/bin/activate
}

# Function to install Ansible using pip
install_ansible() {
  activate_virtualenv

  echo "Installing Ansible using pip..."
  pip install ansible
  pip install pexpect
}

# Parse command-line options
while getopts "i:p:t:" option; do
  case "${option}" in
    i) inventory_file=${OPTARG};;
    p) playbook_file=${OPTARG};;
    t) tags=${OPTARG};;
    *) usage;;
  esac
done

# Check if required options are provided
if [ -z "$inventory_file" ] || [ -z "$playbook_file" ]; then
  usage
fi

# Check Python version
check_python_version() {
  python_version=$(python3 --version | awk '{print $2}')
  major_version=$(echo $python_version | cut -d'.' -f1)
  minor_version=$(echo $python_version | cut -d'.' -f2)
  if [ $major_version -lt 3 ] || ([ $major_version -eq 3 ] && [ $minor_version -lt 6 ]); then
    echo "Error: Python 3.6 or later is required."
    exit 1
  fi
}

# Check Python version
check_python_version

# Check if a virtual environment already exists and set up if necessary
if [ -f "venv/pyvenv.cfg" ]; then
  echo "Virtual environment already exists."
else
  setup_virtualenv
fi

# Activate the virtual environment
activate_virtualenv

# Install Ansible using pip if not available in the virtual environment
if ! [ -x "$(command -v ansible)" ]; then
  install_ansible
else
  echo "Ansible is already installed."
fi

# Run the Ansible playbook with the specified tags
if [ -z "$tags" ]; then
  ansible-playbook -i "$inventory_file" "$playbook_file" --ask-become-pass --ask-vault-pass
else
  ansible-playbook -i "$inventory_file" "$playbook_file" --ask-become-pass --ask-vault-pass --tags "$tags"
fi

# Deactivate the virtual environment if activated
if [ -f "venv/pyvenv.cfg" ]; then
  echo "Deactivating the virtual environment..."
  deactivate
fi
