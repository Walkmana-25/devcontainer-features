#!/bin/bash
set -e

# Import test library for `check` command
source dev-container-features-test-lib

# Check if the 'claude' command is in the path
check "claude-available" claude --version

# Report results
reportResults
