#!/bin/bash

### This is the FIRST bash script to be executed: 

# Activate Conda
source ~/anaconda3/etc/profile.d/conda.sh

# Create and activate a new Conda environment
conda create --name nbgrader_env -y

### Manually enter this command after the execution of this bash script:
#conda activate nbgrader_env