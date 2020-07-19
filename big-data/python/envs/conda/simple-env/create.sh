#!/bin/bash

# create
# conda env create -f environment.yml

# update
conda env update -f environment.yml

# add to jupyter notebook
# conda activate simple-env
# python -m ipykernel install --user --name=simple-env
# conda deactivate