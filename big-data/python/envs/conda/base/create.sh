#!/bin/bash

# since this is the base environment just create spec-list.txt and environment.yml as examples

# https://www.anaconda.com/blog/moving-conda-environments
rm environment.yml spec-list.txt

conda list --explicit > spec-list.txt
# to create env myenv base off spec-list
# conda create --name myenv --file spec-list.txt

conda env export -n base > environment.yml
# to create env(name in yml) off environment.yml
# conda env create -f environment.yml

