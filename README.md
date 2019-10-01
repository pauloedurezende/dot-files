# dot-files

⚙️ My files and settings I use to mount my development environment

## Install

This installation guide is divided with the tools you use to make it easier for others to customize them, the list of tools you use is as follows:

- [Git](#git)
- [Nerd Fonts](#nerd-fonts)
- [Kitty Terminal](#kitty-terminal)
- [Yarn](#yarn)
- [NVM](#nvm)
- [Neovim](#neovim)
- [SSH](#ssh)
- [ZSH](#zsh)

## Git

- Install
```bash
$ brew install git
```

- Set the configuration file
```bash
$ ln -sv $(pwd)/git/gitconfig.symlink $HOME/.gitconfig
```

## Nerd Fonts
```bash
$ brew tap homebrew/cask-fonts
$ brew cask install font-hack-nerd-font
```

## Kitty Terminal

- Install
```bash
$ curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
$ mkdir $HOME/.config/kitty
```

- Set the configuration file
```bash
$ ln -sv $(pwd)/kitty/kitty.symlink $HOME/.config/kitty/kitty.conf
```

## Yarn
```bash
$ url -o- -L https://yarnpkg.com/install.sh | bash
```

## NVM
```bash
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```

## Neovim

- Install
```bash
$ brew install neovim
$ brew install ruby
$ brew install python3
$ brew install python2
$ brew install fzf
$ brew install the_silver_searcher
$ yarn global add neovim
```

- Set the configuration file
```bash
$ mkdir $HOME/.config/nvim
$ ln -sv $(pwd)/neovim/init.vim $HOME/.config/nvim/init.vim
$ ln -sv $(pwd)/neovim/coc-settings.json $HOME/.config/nvim/coc-settings.json
```

## SSH
```bash
$ ln -sv $(pwd)/ssh/config $HOME/.ssh/config
```

## ZSH

- Install
```bash
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

- Set the configuration file
```bash
$ ln -sv $(pwd)/zsh/zshrc.symlink $HOME/.zshrc
```

### Plugins

- zsh-autosuggestions
```bash
$ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

- zsh-syntax-highlighting
```bash
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

- zsh-async
```bash
$ git clone https://github.com/mafredri/zsh-async ~/.oh-my-zsh/async
```

- zsh-pure
```bash
$ git clone https://github.com/sindresorhus/pure ~/.oh-my-zsh/pure
$ ln -sv $HOME/.oh-my-zsh/pure/pure.zsh $HOME/.oh-my-zsh/themes/pure.zsh-theme
```
