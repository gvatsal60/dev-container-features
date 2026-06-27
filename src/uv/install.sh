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
UV_INSTALL_URL="https://astral.sh/uv/install.sh"

##########################################################################################
# Functions
##########################################################################################

##########################################################################################
# Main Script
##########################################################################################

# Ensure one download utility is available
if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
    if command -v apt-get >/dev/null 2>&1; then
        apt-get update
        apt-get -y install --no-install-recommends ca-certificates curl
        rm -rf /var/lib/apt/lists/*
    else
        echo "curl/wget unavailable and apt-get not found, aborted!!!"
        exit 1
    fi
fi

# Download and run installer script
if command -v curl >/dev/null 2>&1; then
    if ! curl -LsSf "${UV_INSTALL_URL}" -o /tmp/uv-install.sh; then
        rm -f /tmp/uv-install.sh
        echo "uv installation unsuccessful, aborted!!!"
        exit 1
    fi
elif command -v wget >/dev/null 2>&1; then
    if ! wget -qO /tmp/uv-install.sh "${UV_INSTALL_URL}"; then
        rm -f /tmp/uv-install.sh
        echo "uv installation unsuccessful, aborted!!!"
        exit 1
    fi
else
    echo "uv installation unsuccessful, aborted!!!"
    exit 1
fi

env UV_INSTALL_DIR=/usr/local/bin sh /tmp/uv-install.sh
rm -f /tmp/uv-install.sh

if ! command -v uv >/dev/null 2>&1; then
    echo "uv command not found after installation, aborted!!!"
    exit 1
fi
