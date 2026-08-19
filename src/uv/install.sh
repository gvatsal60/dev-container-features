#!/bin/sh

##########################################################################################
# File: install.sh
# Author: Vatsal Gupta
# Description: Installation script for `uv` as devcontainer feature
##########################################################################################

##########################################################################################
# License
##########################################################################################
# This script is licensed under the Apache 2.0 License.

##########################################################################################
# Constants
##########################################################################################
UV_INSTALL_URL="https://astral.sh/uv/install.sh"

##########################################################################################
# Functions
##########################################################################################

##########################################################################################
# Main Script
##########################################################################################

set -o errexit
set -o pipefail
set -o nounset

# Check if curl command is available
if command -v curl >/dev/null 2>&1; then
    curl -fsSL "${UV_INSTALL_URL}" | sh
elif command -v wget >/dev/null 2>&1; then
    wget -qO- "${UV_INSTALL_URL}" | sh
else
    echo "Installation unsuccessful, curl or wget is not installed. Aborted!!!"
    exit 1
fi
