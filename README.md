# :gear: dot-files

> This repository contains my personal dot-files and settings used to configure my development environment across different operating systems. It includes configurations for various tools and utilities that I commonly use.

## Supported Operating Systems

- **macOS Sonoma**: Version: 14.4.1
- **Debian**: Versions: 10 (Buster), 11 (Bullseye)
- **Ubuntu**: Versions: 20.04 LTS (Focal Fossa), 22.04 LTS (Jammy Jellyfish)

### :warning: Note on Debian and Ubuntu

Although Debian and Ubuntu are listed, be aware that they are currently not receiving as much attention and support as the other operating systems listed. Consequently, functions and settings may not work correctly on these operating systems. Use at your own risk.

## Features

- Automated setup of development environment using Ansible.
- Integration with 1Password CLI for secure credential handling.
- Support for GPG and SSH key management.

## Getting Started

### Prerequisites

- Python 3.6 or later installed on your system.
- 1Password installed with [SSH agent](https://developer.1password.com/docs/ssh/get-started#step-3-turn-on-the-1password-ssh-agent) support and [CLI integration](https://developer.1password.com/docs/cli/get-started/#step-2-turn-on-the-1password-desktop-app-integration).

### Installation

1. Clone this repository to your local machine:
```bash
git clone https://github.com/pauloedurezende/dot-files.git
```

2. Navigate to the repository directory:

```bash
cd dot-files
```

3. Run the Ansible playbook to set up your environment::
```bash
bash setup.sh -i hosts.yml -p main.yml 
```

#### Custom Tags
If you want to run the playbook with specific tags, you can use the -t option followed by the tags you want to apply:

```bash
bash setup.sh -i hosts.yml -p main.yml -t tag1,tag2
```
