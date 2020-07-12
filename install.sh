#!/bin/bash

echo "  ___          _       ___   _   _                ___               _            _   _             ";
echo " |   \   ___  | |_    | __| (_) | |  ___   ___   |_ _|  _ _    ___ | |_   __ _  | | | |  ___   _ _ ";
echo " | |) | / _ \ |  _|   | _|  | | | | / -_) (_-<    | |  | ' \  (_-< |  _| / _\` | | | | | / -_) | '_|";
echo " |___/  \___/  \__|   |_|   |_| |_| \___| /__/   |___| |_||_| /__/  \__| \__,_| |_| |_| \___| |_|  ";
echo "                                                                                                   ";

message() {
    content=$1

    # Colors
    blue="\e[34m"
    white="\e[0m"
    gray="\e[37m"

    # Style
    bold="\e[1m"

    printf "$gray¤%.0s" {1..$(tput cols)}
    echo "$blue==>$white $bold$content"
}

message "Downloading Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

message "Downloading packages"
brew install git
brew install neovim
brew install fzf
brew install ripgrep
brew install tmux
brew install zsh

message "Downloading fonts"
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

curl -sL https://download-cf.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip --output $HOME/Downloads/jetbrains-mono.zip
unzip -d $HOME/Downloads/ $HOME/Downloads/jetbrains-mono.zip > /dev/null
cp $HOME/Downloads/JetBrainsMono*/**/*.ttf $HOME/Library/Fonts

message "Configuring BASH"
ln -svf $(pwd)/bash/bashrc $HOME/.bashrc > /dev/null

message "Configuring GIT"
ln -svf $(pwd)/git/gitconfig $HOME/.gitconfig > /dev/null

message "Configuring SSH"
ln -svf $(pwd)/ssh/config $HOME/.ssh/config > /dev/null

message "Downloading Kitty Terminal"
curl -sL https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin > /dev/null

message "Configuring Kitty Terminal"
if [[ ! -d ~/.config/kitty ]]
then
  mkdir $HOME/.config/kitty
fi
ln -svf $(pwd)/kitty/kitty.conf $HOME/.config/kitty/kitty.conf > /dev/null

message "Configuring Neovim"
if [[ ! -d ~/.config/nvim ]]
then
  mkdir $HOME/.config/nvim
fi
ln -svf $(pwd)/neovim/init.vim $HOME/.config/nvim/init.vim > /dev/null
ln -svf $(pwd)/neovim/coc-settings.json $HOME/.config/nvim/coc-settings.json > /dev/null

message "Downloading Tmux Plugin Manager"
brew install tmux > /dev/null
git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

message "Configuring Tmux"
ln -svf $(pwd)/tmux/tmux.conf $HOME/.tmux.conf > /dev/null

message "Downloading Yarn"
curl -s -o- -L https://yarnpkg.com/install.sh | bash > /dev/null

message "Downloading zplug"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

message "Configuring ZSH"
ln -svf $(pwd)/zsh/zshrc $HOME/.zshrc
