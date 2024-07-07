#!/bin/bash -i

set -e

# shellcheck disable=SC1091
. dev-container-features-test-lib # FIXME

check "pre-commit --version" pre-commit --version

reportResults
