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
UV_GIT_URL="https://github.com/astral-sh/uv"
##########################################################################################
# Functions
##########################################################################################

##########################################################################################
# Main Script
##########################################################################################

# Check if curl command is available
if command -v curl >/dev/null 2>&1; then
  curl -LsSf ${UV_GIT_URL}/install.sh | sh
else if command -v wget >/dev/null 2>&1; then
  wget -qO- ${UV_GIT_URL}/install.sh | sh
else if command -v pipx >/dev/null 2>&1; then
  pipx install uv
else if command -v pip >/dev/null 2>&1; then
  python3 -m pip install uv
else if command -v brew >/dev/null 2>&1; then
  brew install uv
else if command -v winget >/dev/null 2>&1; then
  winget install --id=astral-sh.uv  -e
else if command -v scoop >/dev/null 2>&1; then
  scoop install uv
else if command -v cargo >/dev/null 2>&1; then
  cargo install --git ${UV_GIT_URL} uv
else
    echo "uv installation unsuccessful, aborted!!!"
    exit 1
fi
