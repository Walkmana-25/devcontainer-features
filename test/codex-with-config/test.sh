#!/bin/bash
set -e

# Import test library for `check` command
source dev-container-features-test-lib

# Check if the 'codex' command is in the path
check "codex-available" codex --version

mkdir -p "$HOME/.codex"
ln -sf /codex_config "$HOME/.codex"

# Check if the config symlink exists and points to the mount
check "codex-config-exists" test -e "$HOME/.codex"
check "codex-config-is-symlink" test -L "$HOME/.codex"
check "codex-config-target" test "$(readlink "$HOME/.codex")" = "/codex_config"

# Report results
reportResults
