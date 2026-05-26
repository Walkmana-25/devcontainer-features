# Claude Code with Config

This Devcontainer Feature installs [Claude Code](https://github.com/anthropics/claude-code) and automatically mounts your host-side configuration directory into the container.

## Features

- **Automatic Installation**: Installs the `@anthropic-ai/claude-code` package globally using npm.
- **Config Persistence**: Mounts `${localEnv:HOME}/.claude` from your host to the container user's home directory. This allows you to use your existing authentication and settings without re-authenticating inside each container.

## Requirements

- **Host-side Authentication**: You should be authenticated with Claude Code on your host machine before using this feature. Ensure `${HOME}/.claude` exists on your host.
- **Node.js**: This feature depends on Node.js. It automatically includes the official Node.js Devcontainer Feature if not already present.

## Usage

Add the following to your `devcontainer.json`:

```json
"features": {
    "ghcr.io/your-username/your-repo/claude-with-config:1": {}
}
```

## Note on Mounts

The feature binds `${localEnv:HOME}/.claude` to `/home/${_REMOTE_USER}/.claude`. If you are using a non-standard home directory or a different remote user, ensure the paths are compatible.
