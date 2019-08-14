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
