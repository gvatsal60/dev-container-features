#!/bin/bash

##########################################################################################
# File: test
# Author: Vatsal Gupta
# Description: Test script for `sonarlint` as devcontainer feature
##########################################################################################

##########################################################################################
# License
##########################################################################################
# This script is licensed under the Apache 2.0 License.

##########################################################################################
# Constants
##########################################################################################

##########################################################################################
# Functions
##########################################################################################
_source_rc_files() {
    for _rc_file in "$HOME/.bashrc" "$HOME/.profile" "$HOME/.zshrc"; do
        if [ -f "$_rc_file" ]; then
            # shellcheck source=/dev/null
            . "$_rc_file" 2>/dev/null || true
        fi
    done
}

##########################################################################################
# Main Script
##########################################################################################

set -e

# shellcheck source=/dev/null
. dev-container-features-test-lib

_source_rc_files

# The 'check' command comes from the dev-container-features-test-lib.
check "node binary is on PATH" which node
check "check node version" node --version

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
