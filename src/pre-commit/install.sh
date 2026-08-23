#!/bin/bash

##########################################################################################
# File: install.sh
# Author: Vatsal Gupta
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

# Generic function to link binaries from user install locations to /usr/local/bin
_link_user_binaries() {
    local user_home_dirs=("/root" "/home/vscode" "/home/codespace" "/home/gitpod")
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

# Link any user-installed binaries to /usr/local/bin for global access
_link_user_binaries
