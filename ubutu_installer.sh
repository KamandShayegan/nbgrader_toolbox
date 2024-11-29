#!/bin/bash

### This is the SECOND bash script to be executed:

# Install required packages
conda install -y gitpython
pip install tabulate pandas opencv-python opencv-contrib-python matplotlib xlsxwriter
conda install -y jupyter
conda install -y -c conda-forge nbgrader

# Enable nbgrader extensions
jupyter nbextension install --sys-prefix --py nbgrader --overwrite
jupyter nbextension enable --sys-prefix --py nbgrader
jupyter serverextension enable --sys-prefix --py nbgrader

# Clone the nbgrader_toolbox repository and checkout the installer branch
git clone https://github.com/daniuher/nbgrader_toolbox.git nbgrader
cd nbgrader
git checkout installer
