#!/bin/sh

##########################################################################################
# File: install.sh
# Author: Vatsal Gupta
# Date: 06-Sept-2025
# Description: Installation script for `uv` as devcontainer feature
##########################################################################################

##########################################################################################
# License
##########################################################################################
# This script is licensed under the Apache 2.0 License.

##########################################################################################
# Constants
##########################################################################################
UV_GIT_URL="https://astral.sh/uv"

##########################################################################################
# Functions
##########################################################################################

##########################################################################################
# Main Script
##########################################################################################

# FIXME
echo "${HOME}"

# Check if curl command is available
if command -v curl >/dev/null 2>&1; then
    echo "Before ${HOME}"
    curl -LsSf "${UV_GIT_URL}"/install.sh | sh
    echo "After ${HOME}"
elif command -v wget >/dev/null 2>&1; then
    wget -qO- "${UV_GIT_URL}"/install.sh | sh
elif command -v pipx >/dev/null 2>&1; then
    pipx install uv
elif command -v pip >/dev/null 2>&1; then
    pip install uv
elif command -v brew >/dev/null 2>&1; then
    brew install uv
elif command -v winget >/dev/null 2>&1; then
    winget install --id=astral-sh.uv  -e
elif command -v scoop >/dev/null 2>&1; then
    scoop install uv
elif command -v cargo >/dev/null 2>&1; then
    cargo install --git "${UV_GIT_URL}" uv
else
    echo "uv installation unsuccessful, aborted!!!"
    exit 1
fi
