#!/bin/bash

# PrestoDB 0.235.1_1

# PRE-REQS
# jdk11 is installed and 
# JAVA_HOME is set correctly before running
# Hadoop
# Hive

if [[ ! -d "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home" ]]; then
  echo "JDK-8 must be installed on machine" && exit 1 
fi

# Install PrestDB
brew update && brew upgrade
brew unpin prestodb
brew remove prestodb

brew install prestodb
brew pin prestodb
VER=$(brew info prestodb | ggrep -oP '(?<=^/usr/local/Cellar/prestodb/).*?(?=\s)')
read -p "Installed prestodb \"${VER}\" via homebrew(enter)"

read -p "Do you want to remove existing prestodb data?[Nn]" -n 1 -r
[[ $REPLY =~ ^[Yy]$ ]] && rm -rf $HOME/Data/appData/presto/data/* || echo
echo;echo

mkdir -p $HOME/Data/appData/presto/data

# backup configs
cp -p /usr/local/Cellar/prestodb/${VER}/libexec/etc/config.properties /usr/local/Cellar/prestodb/${VER}/libexec/etc/config.properties.og 
cp -p /usr/local/Cellar/prestodb/${VER}/libexec/etc/jvm.config /usr/local/Cellar/prestodb/${VER}/libexec/etc/jvm.config.og 
cp -p /usr/local/Cellar/prestodb/${VER}/libexec/etc/node.properties /usr/local/Cellar/prestodb/${VER}/libexec/etc/node.properties.og 

# update config
cp -p $HOME/Developer/personal/dotfiles/big-data/prestodb/config.properties /usr/local/Cellar/prestodb/${VER}/libexec/etc/config.properties
cp -p $HOME/Developer/personal/dotfiles/big-data/prestodb/jvm.config /usr/local/Cellar/prestodb/${VER}/libexec/etc/jvm.config
sed "s|@@HOME@@|$HOME|g" $HOME/Developer/personal/dotfiles/big-data/prestodb/node.properties >| /usr/local/Cellar/prestodb/${VER}/libexec/etc/node.properties

# Currently throwing NoSuchFieldException should be fixed in next homebrew update
# update hive properties
#cp -p $HOME/Developer/personal/dotfiles/big-data/prestodb/hive.properties /usr/local/Cellar/prestodb/${VER}/libexec/etc/catalog/hive.properties

echo "Finished PrestoDB install see prestodb/README.md to complete"
echo "Update big-data-env.sh with PrestoDB version ${VER}"