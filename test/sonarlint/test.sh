#!/bin/bash

##########################################################################################
# File: test
# Author: Vatsal Gupta
# Date: 26-Jul-2024
# Description: Test script for sonarlint as vscode feature
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

##########################################################################################
# Main Script
##########################################################################################

set -e

# Optional: Import test library bundled with the devcontainer CLI
# shellcheck source=/dev/null
. dev-container-features-test-lib

# The 'check' command comes from the dev-container-features-test-lib.
check "node --version" node --version

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
