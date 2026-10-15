#!/bin/bash
set -e

# Import test library for `check` command
source dev-container-features-test-lib

# Check if the 'codex' command is in the path
check "codex-available" codex --version

# The executable must remain inside the standalone package layout so Codex
# can locate codex-package.json and start its background server.
CODEX_BIN="$(command -v codex)"
CODEX_REAL="$(readlink -f "$CODEX_BIN")"
CODEX_PACKAGE_ROOT="$(dirname "$(dirname "$CODEX_REAL")")"
check "codex-package-manifest" test -f "$CODEX_PACKAGE_ROOT/codex-package.json"

mkdir -p "$HOME/.codex"
ln -sf /codex_config "$HOME/.codex"

# Check if the config symlink exists and points to the mount
check "codex-config-exists" test -e "$HOME/.codex"
check "codex-config-is-symlink" test -L "$HOME/.codex"
check "codex-config-target" test "$(readlink "$HOME/.codex")" = "/codex_config"

# Report results
reportResults
