# Claude Code with Config

This Devcontainer Feature provides [Claude Code](https://github.com/anthropics/claude-code) and automatically mounts your host-side configuration directory into the container.

## Features

- **Official Claude Code Support**: Leverages the [official Claude Code Feature](https://github.com/anthropics/devcontainer-features) for installation.
- **Config Persistence**: Mounts `${localEnv:HOME}/.claude` from your host to `/claude_config` in the container, and creates a symbolic link at `${_REMOTE_USER_HOME}/.claude`. This allows you to use your existing authentication and settings without re-authenticating inside each container.

## Requirements

- **Host-side Authentication**: You should be authenticated with Claude Code on your host machine before using this feature. Ensure `${HOME}/.claude` exists on your host.

## Usage

Add the following to your `devcontainer.json`:

```json
"features": {
    "ghcr.io/walkmana-25/devcontainer-features/claude-with-config:1": {}
}
```

## Note on Mounts

The feature binds `${localEnv:HOME}/.claude` to `/claude_config` and creates a symbolic link to `${_REMOTE_USER_HOME}/.claude` if it doesn't already exist.
