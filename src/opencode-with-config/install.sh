#!/bin/sh
set -e

# The 'install.sh' is executed by the dev container CLI as root.
echo "Activating feature 'opencode-with-config'"
echo "OpenCode installation is handled by dependency: ghcr.io/dirien/devcontainer-features/opencode:0"
echo "Host configuration directories will be mounted via devcontainer-feature.json mounts property."
