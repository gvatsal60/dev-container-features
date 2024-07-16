#!/bin/sh

##########################################################################################
# File: install.sh
# Author: Vatsal Gupta
# Date: 09-Jul-2024
# Description: Installation script for pre-commit as vscode feature
##########################################################################################

##########################################################################################
# License
##########################################################################################
# This script is licensed under the Apache 2.0 License.
# License information should be updated as necessary.

##########################################################################################
# Constants
##########################################################################################

##########################################################################################
# Functions
##########################################################################################

##########################################################################################
# Main Script
##########################################################################################

# Check if pip command is available
if command -v pip >/dev/null 2>&1; then
    # Upgrade pip to the latest version
    pip install --upgrade pip

    # Install pre-commit using pip
    pip install pre-commit

    # Check if .pre-commit-config.yaml file exists
    if [ -f .pre-commit-config.yaml ]; then
        # If .pre-commit-config.yaml exists, run pre-commit install
        pre-commit autoupdate
        pre-commit install
        pre-commit run --all-files
    else
        # If .pre-commit-config.yaml does not exist, print a warning message
        echo ".pre-commit-config.yaml file not found. Skipping pre-commit installation."
    fi
else
    # If pre-commit is not available after installation, print an error message
    echo "Pre-commit installation unsuccessful, aborted!!!"
    exit 1
fi
