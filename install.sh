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
