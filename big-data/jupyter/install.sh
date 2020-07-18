#!/bin/bash

# Removing let's not use brew for python

# Jupyter 2.1.5

# Install
brew update && brew upgrade
brew unpin jupyterlab
brew remove jupyterlab

brew install jupyterlab
brew pin jupyterlab
VER=$(brew info jupyterlab | ggrep -oP '(?<=^/usr/local/Cellar/jupyterlab/).*?(?=\s)')
echo "Installed jupyterlab \"${VER}\" via homebrew(enter)"

echo "Finished jupyter install see jupyter/README.md to complete"
echo "Update big-data-env.sh with jupyter version ${VER}"