#!/bin/sh

##########################################################################################
# File: install.sh
# Author: Vatsal Gupta
# Date: 09-Jul-2024
# Description: Installation script for `pre-commit` as devcontainer feature
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

if command -v pre-commit >/dev/null 2>&1; then
    exit 0
fi

# Prefer distro package manager to avoid pip conflicts on externally-managed environments.
apt_install_succeeded="false"
if command -v apt-get >/dev/null 2>&1; then
    if ! apt-get update; then
        echo "apt-get update failed; falling back to pip installation."
    else
        if apt-get -y install --no-install-recommends pre-commit; then
            apt_install_succeeded="true"
            rm -rf /var/lib/apt/lists/*
        else
            echo "apt-get install pre-commit failed; falling back to pip installation."
        fi
    fi
fi

if [ "${apt_install_succeeded}" = "true" ]; then
    exit 0
fi

if command -v python3 >/dev/null 2>&1 && python3 -m pip --version >/dev/null 2>&1; then
    python3 -m pip install pre-commit --break-system-packages
else
    echo "pre-commit installation unsuccessful: python3 or pip not available, aborted!!!"
    exit 1
fi
