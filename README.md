# dot-files

:gear: My files and settings I use to mount my development environment

## Before starting

### SSH

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

### GPG

- Import your GPG key

```bash
$ gpg --import my-private-key.asc
```
