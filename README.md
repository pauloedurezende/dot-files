# dot-files

⚙️ My files and settings I use to mount my development environment

## Install

This installation guide is divided with the tools you use to make it easier for others to customize them, the list of tools you use is as follows:

- [ZSH](#zsh)
- [Bash](#bash)
- [Kitty](#kitty)
- [Homebrew](#homebrew)
- [Fonts](#fonts)
- [Git](#git)
- [NVM](#nvm)
- [Yarn](#yarn)
- [NeoVim](#neovim)
- [TMUX](#tmux)
- [LSP](#lsp)
- [SSH](#ssh)

## ZSH

- Install
```bash
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

- Set the configuration file
```bash
$ ln -svf $(pwd)/zsh/zshrc.symlink $HOME/.zshrc
```

- Install necessary plugins
```bash
$ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
$ git clone https://github.com/mafredri/zsh-async ~/.oh-my-zsh/plugins/async
$ git clone https://github.com/sindresorhus/pure ~/.oh-my-zsh/pure
$ ln -sv $HOME/.oh-my-zsh/pure/pure.zsh $HOME/.oh-my-zsh/themes/pure.zsh-theme
```

## Bash

- Set the configuration file
```bash
$ ln -svf $(pwd)/bash/bash_profile.symlink $HOME/.bash_profile
```

## Kitty

- Install
```bash
$ curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

- Set the configuration file
```bash
$ mkdir $HOME/.config/kitty
$ ln -svf $(pwd)/kitty/kitty.symlink $HOME/.config/kitty/kitty.conf
```

## Homebrew

- Install
```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- Install necessary packages
```
$ brew install neovim
$ brew install ripgrep
$ brew install sshfs
$ brew install tmux
```

- Install necessary fonts

```bash
$ brew tap homebrew/cask-fonts
$ brew cask install font-hack-nerd-font
```

## Fonts

- [Download JetBrains Mono](https://www.jetbrains.com/lp/mono/)

## Git

- Configuration file
```bash
$ ln -svf $(pwd)/git/gitconfig.symlink $HOME/.gitconfig
```

## NVM

- Install
```bash
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```

- Install latest Node LTS
```bash
$ nvm install --lts
```

## Yarn

- Install
```bash
$ curl -o- -L https://yarnpkg.com/install.sh | bash
```

## NeoVim

- Set the configuration file
```bash
$ mkdir $HOME/.config/nvim
$ ln -svf $(pwd)/neovim/init.vim $HOME/.config/nvim/init.vim
$ ln -svf $(pwd)/neovim/coc-settings.json $HOME/.config/nvim/coc-settings.json
```

# TMUX

- Install Tmux Plugin Manager
```bash
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

- Set the configuration file
```bash
$ ln -svf $(pwd)/tmux/tmux.symlink $HOME/.tmux.conf
```

## LSP

- [Download last Elixir-LS release](https://github.com/JakeBecker/elixir-ls/releases/latest)
- Extract the downloaded release

```bash
$ cd ~/Library && unzip ~/Downloads/elixir-ls.zip
```

- [Download last Flutter release](https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v1.12.13+hotfix.8-stable.zip)
- Extract the downloaded release

```bash
$ cd ~/Library && unzip ~/Downloads/flutter*.zip
```

- [Download last rust-analyzer release](https://github.com/rust-analyzer/rust-analyzer/releases/latest)
- Extract the downloaded release

```bash
$ cd ~/Library && unzip ~/Downloads/rust-analyzer*.zip
```

## SSH
```bash
$ ln -svf $(pwd)/ssh/config $HOME/.ssh/config
```
