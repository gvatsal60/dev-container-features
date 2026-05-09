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
if command -v apt-get >/dev/null 2>&1; then
    apt-get update
    if ! apt-get -y install --no-install-recommends pre-commit; then
        echo "apt-get install pre-commit failed; falling back to pip installation."
    fi
    rm -rf /var/lib/apt/lists/*
fi

if ! command -v pre-commit >/dev/null 2>&1; then
    if command -v python3 >/dev/null 2>&1 && command -v pip >/dev/null 2>&1; then
        python3 -m pip install pre-commit --break-system-packages
    else
        echo "pre-commit installation unsuccessful: python3 or pip not available, aborted!!!"
        exit 1
    fi
fi
