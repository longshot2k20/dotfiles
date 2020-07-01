#!/bin/bash

# Zookeeper 3.5.8

# PRE-REQS
# jdk8 is installed and 
# JAVA_HOME is set correctly before running

if [[ ! -d "/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home" ]]; then
  echo "JDK-11 must be installed on machine" && exit 1 
fi

# Install Zookeeper
brew update && brew upgrade
brew unpin zookeeper
brew remove zookeeper
[ -d "/usr/local/etc/zookeeper" ] && rm -rf /usr/local/etc/zookeeper && echo "Removed /usr/local/etc/zookeeper"

lsof -i :2181 | grep -i java | awk '{print $2}' | xargs kill
echo "Killed existing processes on 2181"

[[ ! -z $(lsof -i :21810 | grep -i java | awk '{print $2}') ]] && echo "Process still running on 2181 exiting" && exit 1

echo "Copy local zookeeper brew file to override latest"
#cp $HOME/Developer/personal/dotfiles/big-data/zookeeper/rb/zookeeper.rb /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/

brew install zookeeper
brew pin zookeeper
VER=$(brew info zookeeper | ggrep -oP '(?<=^/usr/local/Cellar/zookeeper/).*?(?=\s)')

read -p "Installed zookeeper ${VER} via homebrew(enter)"

echo "Installed zookeeper via homebrew"

read -p "Do you want to remove existing zookeeper data?[Nn]" -n 1 -r
[[ $REPLY =~ ^[Yy]$ ]] && rm -rf $HOME/Data/appData/zookeeper/data/* || echo

mkdir -p $HOME/Data/appData/zookeeper/data
cp -p /usr/local/etc/zookeeper/zoo.cfg /usr/local/etc/zookeeper/zoo.cfg.og

echo "Backed up hadoop default configs"

# update template and cp
sed "s|@@HOME@@|$HOME|g" $HOME/Developer/personal/dotfiles/big-data/zookeeper/zoo.cfg >| /usr/local/etc/zookeeper/zoo.cfg 
# cp -p $HOME/Developer/personal/dotfiles/big-data/zookeeper/zkEnv.sh /usr/local/Cellar/zookeeper/3.5.8/libexec/bin/zkEnv.sh
# chmod u+x /usr/local/Cellar/zookeeper/3.5.8/libexec/zkEnv.sh

echo "Updated zookeeper configs"

echo "Finished Zookeeper install see zookeeper/README.md to complete"
echo "Update big-data-env.sh with Zookeeper version ${VER}"

