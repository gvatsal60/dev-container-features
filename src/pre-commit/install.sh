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

# Check if python3 command is available
if command -v python3 >/dev/null 2>&1; then
    # Check if pip command is available
    if command -v pip >/dev/null 2>&1; then
        # Upgrade pip to the latest version
        python3 -m pip install --upgrade pip

        # Install the pre-commit package using pip.
        # The --break-system-packages option allows pip to install packages
        # as it won't interfere with system packages.
        python3 -m pip install pre-commit --break-system-packages
    else
        # If pre-commit is not available after installation, print an error message
        echo "pip not available installation unsuccessful, aborted!!!"
        exit 1
    fi
else
    echo "python3 not available installation unsuccessful, aborted!!!"
    exit 1
fi
