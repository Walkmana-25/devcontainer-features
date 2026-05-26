#!/bin/bash
set -e

# Import test library for `check` command
source dev-container-features-test-lib

# Check if the 'claude' command is in the path
check "claude-available" claude --version

# Check if the config directory or symlink exists
check "claude-config-exists" test -e "${_REMOTE_USER_HOME}/.claude"

# Report results
reportResults
