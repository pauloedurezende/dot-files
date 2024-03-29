# dot-files

:gear: My files and settings I use to mount my development environment

## Supported Operating Systems

- Pop!_OS - Version: 22.04 LTS
- macOS Ventura - Version: 13.3.1

## Before starting [Debian]

### Graphic Server Protocol

- Enable Wayland

```bash
$ sudo nano /etc/gdm3/custom.conf
```

- Uncomment the line with `WaylandEnable` under `[daemon]`, change the current value to `true` and save the changes made

- Restart GDM3

```bash
$ systemctl restart gdm3
```

### SSH [Debian & Darwin]

- Restore your SSH private keys

```bash
$ chown user:user ~/.ssh/id_rsa*
$ chmod 600 ~/.ssh/id_rsa
$ chmod 644 ~/.ssh/id_rsa.pub
```

- Start the ssh-agent in the background

```bash
$ eval "$(ssh-agent -s)"
```

- Add your SSH private keys to the ssh-agent

```bash
$ ssh-add ~/.ssh/id_rsa
```

### GPG [Debian & Darwin]

- Import your GPG key

```bash
$ gpg --import my-private-key.asc
```

### Variables

- Add the variables necessary for Ansible to work correctly in `/group_vars/all.yml` file

## Install

- Run the `setup` based on your system so that you can prepare your system to receive the tools used

```bash
$ bash setup-debian.sh # For debian base distro
$ bash setup-darwin.sh # For macOS base distro
```
