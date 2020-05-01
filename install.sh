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

message "Configuring BASH settings"
ln -svf $(pwd)/bash/bashrc $HOME/.bashrc > /dev/null

message "Configuring GIT settings"
ln -svf $(pwd)/git/gitconfig $HOME/.gitconfig > /dev/null

message "Configuring SSH settings"
ln -svf $(pwd)/ssh/config $HOME/.ssh/config > /dev/null

message "Downloading Kitty"
curl -sL https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin > /dev/null

message "Configuring Kitty settings"
if [[ ! -d ~/.config/kitty ]]
then
  message "Creating Kitty folder"
  mkdir $HOME/.config/kitty
fi
ln -svf $(pwd)/kitty/kitty $HOME/.config/kitty/kitty.conf > /dev/null

message "Downloading Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

message "Downloading Neovim"
brew install neovim > /dev/null
brew install ripgrep > /dev/null
brew tap homebrew/cask-fonts > /dev/null
brew cask install font-hack-nerd-font > /dev/null
curl -sL https://download-cf.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip --output $HOME/Downloads/jetbrains-mono.zip
unzip -d $HOME/Downloads/ $HOME/Downloads/jetbrains-mono.zip > /dev/null
cp $HOME/Downloads/JetBrainsMono*/**/*.ttf $HOME/Library/Fonts

message "Configuring Neovim settings"
if [[ ! -d ~/.config/nvim ]]
then
  message "Creating Neovim folder"
  mkdir $HOME/.config/nvim
fi
ln -svf $(pwd)/neovim/init.vim $HOME/.config/nvim/init.vim > /dev/null
ln -svf $(pwd)/neovim/coc-settings.json $HOME/.config/nvim/coc-settings.json > /dev/null

message "Downloading Tmux"
brew install tmux > /dev/null
git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

message "Configuring Tmux settings"
ln -svf $(pwd)/tmux/tmux $HOME/.tmux.conf > /dev/null

message "Downloading Elixir"
brew install elixir

message "Downloading Rust"
curl -s --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

message "Downloading NVM"
curl -s -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash > /dev/null
source $HOME/.bashrc
nvm install --lts

message "Downloading Yarn"
curl -s -o- -L https://yarnpkg.com/install.sh | bash > /dev/null

message "Downloading Elixir LSP"
curl -sL https://github.com/JakeBecker/elixir-ls/releases/download/v0.2.25/elixir-ls.zip --output $HOME/Downloads/elixir-ls.zip
unzip -d $HOME/Library/elixir-lsp $HOME/Downloads/elixir-ls.zip > /dev/null

message "Downloading Dart & Flutter LSP"
curl -sL https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v1.12.13+hotfix.8-stable.zip --output $HOME/Downloads/flutter.zip
unzip -d $HOME/Library $HOME/Downloads/flutter.zip > /dev/null

message "Downloading Rust LSP"
curl -sL https://github.com/rust-analyzer/rust-analyzer/archive/2020-03-30.zip --output $HOME/Downloads/rust-analyzer.zip
unzip -d $HOME/Downloads $HOME/Downloads/rust-analyzer.zip > /dev/null
if [[ ! -d $HOME/Library/rust-analyzer ]]
then
  message "Creating Rust LSP folder"
  mkdir $HOME/Library/rust-analyzer
fi
cp -R $HOME/Downloads/rust-analyzer-*/ $HOME/Library/rust-analyzer
cd $HOME/Library/rust-analyzer && cargo xtask install --server > /dev/null
cd $(pwd)

message "Downloading Oh My ZSH"
brew install zsh
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

message "Configuring ZSH settings"
ln -svf $(pwd)/zsh/zshrc $HOME/.zshrc
