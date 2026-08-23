#!/bin/bash

##########################################################################################
# File: install.sh
# Author: Vatsal Gupta
# Description: Installation script for `kilo-cli` as devcontainer feature
##########################################################################################

##########################################################################################
# License
##########################################################################################
# This script is licensed under the Apache 2.0 License.

##########################################################################################
# Constants
##########################################################################################
INSTALL_URL="https://kilo.ai/cli/install"

##########################################################################################
# Functions
##########################################################################################

# Generic function to link binaries from user install locations to /usr/local/bin
_link_user_binaries() {
    local user_home_dirs=("/root" "/home/vscode" "/home/codespace" "/home/gitpod" "${HOME}")
    local bin_dirs=(".local/bin" "bin")

    for user_home in "${user_home_dirs[@]}"; do
        for bin_dir in "${bin_dirs[@]}"; do
            local full_path="${user_home}/${bin_dir}"
            if [ -d "${full_path}" ]; then
                for binary in "${full_path}"/*; do
                    if [ -f "${binary}" ] && [ -x "${binary}" ]; then
                        local binary_name=$(basename "${binary}")
                        # Only link if not already in /usr/local/bin
                        if [ ! -f "/usr/local/bin/${binary_name}" ]; then
                            ln -sf "${binary}" "/usr/local/bin/${binary_name}"
                        fi
                    fi
                done
            fi
        done
    done
}

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

# Link any user-installed binaries to /usr/local/bin for global access
_link_user_binaries
