#!/usr/bin/env bash

OS=$(uname -s)

# macOS Specific
if [ "$OS" = "Darwin" ]; then

  # Install homebrew
  printf "\nInstalling Homebrew...\n"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  BREW_FORMULAE='./brew/formulae.txt'

  # Install brew formulae
  printf "Installing Homebrew formulae from '$BREW_FORMULAE'..."
  xargs brew install <$BREW_FORMULAE
fi

printf "\nInstalling yarn...\n"
url -o- -L https://yarnpkg.com/install.sh | bash

printf "\nInstalling NVM...\n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

printf "\nChanging shell to zsh...\n"
# NOTE: You may have to run the following:
#   sudo printf $(which zsh) >> /etc/shells`
chsh -s $(which zsh)

printf "\nInstalling oh-my-zsh...\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

printf "\nSymlinking '*.symlink' files...\n"
for SOURCE_FILE in $(find $(pwd) -name '*.symlink'); do
  LINK_FILE="$HOME/.$(basename ${SOURCE_FILE%.symlink})"
  rm $LINK_FILE
  ln -sv "$SOURCE_FILE" $LINK_FILE
done
