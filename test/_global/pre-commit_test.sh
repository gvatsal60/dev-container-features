#!/bin/bash

##########################################################################################
# File: pre-commit_test.sh
# Author: Vatsal Gupta
# Description:
# The 'test/_global' folder is a special test folder that is not tied to a single feature.
#
# This test file is executed against a running container constructed
# from the value of 'pre-commit' in the test/_global/scenarios.json file.
#
# The value of a scenarios element is any properties available in the 'devcontainer.json'.
# Scenarios are useful for testing specific options in a feature, or to test a combination of features.
#
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test --global-scenarios-only
##########################################################################################

##########################################################################################
# License
##########################################################################################
# This script is licensed under the MIT License.
# License information should be updated as necessary.

##########################################################################################
# Global Variables & Constants
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

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "check pre-commit version" pre-commit --version

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
