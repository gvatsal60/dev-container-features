#!/bin/sh

# Check if pip, npm, or yarn is installed and install pre-commit
if command -v "pip3" >/dev/null 2>&1; then
  pip3 install pre-commit
fi
