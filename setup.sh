#!/bin/sh

# Check to see if Homebrew is installed
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing homebrew"; \
	/usr/bin/ruby -e "(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; }

echo "Homebrew is installed in $(which brew)"
brew -v

echo ""
echo "Packages installed"
echo ""
brew bundle list --all

echo ""
brew bundle check --all
