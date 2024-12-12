#!/bin/bash

# Activate the conda environment
source ~/anaconda3/bin/activate nbgrader_env  # Adjust the path if Anaconda is installed elsewhere

# Prompt for the course name
read -p "Enter course name: " course_name

# Quickstart for nbgrader
nbgrader quickstart "$course_name"

# Create required directories
mkdir -p "$PWD/$course_name/submitted"
mkdir -p "$PWD/$course_name/release"
rm -rf "$PWD/$course_name/source"
mkdir -p "$PWD/$course_name/source"

# Run the Python script for git assignments
python "$PWD/tools/git_assignments.py"

# Copy assignments to the source folder
cp -r "$PWD/assignments/." "$PWD/$course_name/source/"

# Run the custom config creation script
python "$PWD/tools/create_custom_config.py"

# Replace the nbgrader config
rm -f "$PWD/$course_name/nbgrader_config.py"
mv "$PWD/nbgrader_config.py" "$PWD/$course_name/"

# Create tools folder and copy necessary scripts
mkdir -p "$PWD/$course_name/tools"
cp -r "$PWD/tools/"*.py "$PWD/$course_name/tools/"
cp "$PWD/tools/late.py" "$PWD/$course_name/"
cp "$PWD/tools/"*.bat "$PWD/$course_name/"

# Remove the assignments folder
rm -rf "$PWD/assignments"

# Pause to allow viewing output (not standard for Bash)
read -n 1 -s -r -p "Press any key to continue..."
