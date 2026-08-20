#!/bin/bash

##########################################################################################
# File: install.sh
# Author: Vatsal Gupta
# Description: Installation script for `hermes-agent` as devcontainer feature
##########################################################################################

##########################################################################################
# License
##########################################################################################
# This script is licensed under the Apache 2.0 License.

##########################################################################################
# Constants
##########################################################################################
INSTALL_URL="https://hermes-agent.nousresearch.com/install.sh"

##########################################################################################
# Functions
##########################################################################################

##########################################################################################
# Main Script
##########################################################################################

set -o errexit
set -o pipefail
set -o nounset

if command -v curl >/dev/null 2>&1; then
    curl -fsSL "${INSTALL_URL}" | bash
elif command -v wget >/dev/null 2>&1; then
    wget -qO- "${INSTALL_URL}" | bash
else
    echo "Installation unsuccessful, curl or wget is not installed. Aborted!!!"
    exit 1
fi
