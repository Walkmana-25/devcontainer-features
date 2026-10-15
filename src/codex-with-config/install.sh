#!/bin/sh
set -e

# Options passed from devcontainer-feature.json
VERSION="${VERSION:-latest}"
INSTALLMETHOD="${INSTALLMETHOD:-standalone}"

echo "Activating feature 'codex-with-config'"

if [ "$INSTALLMETHOD" = "npm" ]; then
    echo "Installing Codex CLI via npm..."
    npm install -g @openai/codex
else
    echo "Installing Codex CLI via the official standalone installer..."

    # Install into a shared system location so the binary is accessible
    # to all container users (not just root).
    export CODEX_HOME="/usr/local/lib/codex"

    if [ "$VERSION" != "latest" ]; then
        export CODEX_RELEASE="$VERSION"
        echo "Installing Codex CLI version: $VERSION"
    fi

    curl -fsSL https://chatgpt.com/codex/install.sh | sh

    # Locate the installed binary and expose it on the global PATH.
    # Copy (rather than symlink) so the binary remains self-contained.
    BIN_PATH="$(find /usr/local/lib/codex -type f -name codex 2>/dev/null | head -1)"
    if [ -n "$BIN_PATH" ]; then
        cp "$BIN_PATH" /usr/local/bin/codex
        chmod +x /usr/local/bin/codex
        echo "Codex CLI installed at /usr/local/bin/codex"
    else
        echo "Warning: could not locate the installed binary."
    fi
fi

echo "Host configuration directory (~/.codex-container) will be mounted via devcontainer-feature.json mounts property."
