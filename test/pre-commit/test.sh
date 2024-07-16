#!/bin/bash

##########################################################################################
# File: test
# Author: Vatsal Gupta
# Date: 09-Jul-2024
# Description: Test script for pre-commit as vscode feature
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

set -e

# Optional: Import test library bundled with the devcontainer CLI
# shellcheck source=/dev/null
. dev-container-features-test-lib

# The 'check' command comes from the dev-container-features-test-lib.
check "pre-commit --version" pre-commit --version

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
