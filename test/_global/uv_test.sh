#!/bin/bash

##########################################################################################
# File: uv_test
# Author: Vatsal Gupta
# Description:
# The 'test/_global' folder is a special test folder that is not tied to a single feature.
#
# This test file is executed against a running container constructed
# from the value of 'uv' in the test/_global/scenarios.json file.
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
# This script is licensed under the Apache 2.0 License.
# License information should be updated as necessary.

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

_ensure_on_path() {
    _bin_name="$1"
    if command -v "$_bin_name" >/dev/null 2>&1; then
        return 0
    fi
    _installed_bin="$(find "$HOME" -maxdepth 5 -name "$_bin_name" -type f -executable 2>/dev/null | head -1)"
    if [[ -n "$_installed_bin" ]]; then
        export PATH="$(dirname "$_installed_bin"):$PATH"
    fi
}

##########################################################################################
# Main Script
##########################################################################################

set -e

# shellcheck source=/dev/null
. dev-container-features-test-lib

_source_rc_files
_ensure_on_path uv

# The 'check' command comes from the dev-container-features-test-lib.
check "check uv version"

UV_PATH="${HOME}/.local/bin/uv"

if [ -x "${UV_PATH}" ]; then
    "${UV_PATH}" --version
elif command -v uv >/dev/null 2>&1; then
    uv --version
else
    echo "uv is not installed"
    exit 1
fi

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
