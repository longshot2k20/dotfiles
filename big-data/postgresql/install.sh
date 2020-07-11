#!/bin/bash

# Postgresql 12.3_4

# Install
brew update && brew upgrade
brew unpin postgresql
brew remove postgresql

read -p "Do you want to remove all existing database data?[Nn]" -n 1 -r
[[ $REPLY =~ ^[Yy]$ ]] && rm -rf /usr/local/var/postgres \
&& rm -rf .psql_history .psqlrc .psql.local .pgpass .psqlrc.local || echo "Error removing postgresql data"

brew install postgresql
brew pin postgresql
VER=$(brew info postgresql | ggrep -oP '(?<=^/usr/local/Cellar/postgresql/).*?(?=\s)')
echo "Installed postgresql \"${VER}\" via homebrew(enter)"

# To migrate existing data from a previous major version of PostgreSQL run:
# brew postgresql-upgrade-database

# To have launchd start postgresql now and restart at login:
brew services start postgresql
[[ ! $? -eq 0 ]] && echo "Cannot create postgresql launchd script"; exit 1 || echo "Created postgresql launchd service"

echo "Finished postgresql install see postgresql/README.md to complete"
echo "Update big-data-env.sh with postgresql version ${VER}"