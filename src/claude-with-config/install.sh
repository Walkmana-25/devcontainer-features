#!/bin/sh
set -e

# The 'install.sh' is executed by the dev container CLI as root.
echo "Activating feature 'claude-with-config'"
echo "Claude Code installation is handled by dependency: ghcr.io/anthropics/devcontainer-features/claude-code:1"
echo "Host configuration directory will be mounted via devcontainer-feature.json mounts property."
