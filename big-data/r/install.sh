#!/bin/bash

# R 4.0.2_1

# Install R and RStudio
brew update && brew upgrade

brew remove r

brew install r
VER=$(brew info r | ggrep -oP '(?<=^/usr/local/Cellar/r/).*?(?=\s)')
echo "Installed r \"${VER}\" via homebrew(enter)"

brew cask remove rstudio
brew cask install rstudio

echo "Finished R and RStudio install see r/README.md to complete"
echo "Update big-data-env.sh with r version ${VER}"