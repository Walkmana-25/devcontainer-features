#!/bin/sh
set -e

# The 'install.sh' is executed by the dev container CLI as root.
echo "Activating feature 'claude-with-config'"

# Install Claude Code globally using npm
# Since this feature depends on the Node.js feature, npm should be available.
if ! command -v npm >/dev/null 2>&1; then
    echo "Error: npm is not installed. This feature requires Node.js."
    exit 1
fi

echo "Installing @anthropic-ai/claude-code..."
npm install -g @anthropic-ai/claude-code

echo "Claude Code installed successfully."
