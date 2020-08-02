#!/bin/bash

# create
conda env create -f environment.yml

# update
# conda env update -f environment.yml

# add to jupyter notebook
conda activate bootcamp
python -m ipykernel install --user --name=bootcamp
# conda deactivate