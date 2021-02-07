#!/bin/bash

# create a new environment using python 3.8.3 names 383
# pyenv virtualenv 3.8.3 383

# doesn't seem to activate when running in shell... stays
# if you need to clean up base environment run to remove everything
# pip freeze | xargs pip uninstall -y


# Activate 
pyenv activate 383

# update dependencies
pip install -r requirements.txt
# Dectivate
pyenv deactivate

## create/activate new env for shopping
pyenv virtualenv 3.8.3 shopping
pyenv activate shopping