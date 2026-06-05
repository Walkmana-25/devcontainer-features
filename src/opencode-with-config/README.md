# OpenCode with Config

This Devcontainer Feature provides [OpenCode](https://github.com/sst/opencode) and automatically mounts your host-side configuration directories into the container.

## Features

- **Official OpenCode Support**: Leverages the [OpenCode DevContainer Feature](https://github.com/dirien/devcontainer-features) for installation.
- **Config Persistence**: Mounts the following directories from your host machine:
  - `${localEnv:HOME}/.config/opencode` → `/opencode_config` → symlinked to `${_REMOTE_USER_HOME}/.config/opencode`
  - `${localEnv:HOME}/.local/share/opencode` → `/opencode_data` → symlinked to `${_REMOTE_USER_HOME}/.local/share/opencode`
- This allows you to use your existing authentication and settings without re-authenticating inside each container.

## Requirements

- **Host-side Authentication**: You should have OpenCode configured on your host machine before using this feature. Ensure the following directories exist:
  - `${HOME}/.config/opencode` (global configuration)
  - `${HOME}/.local/share/opencode` (authentication data)

## Usage

Add the following to your `devcontainer.json`:

```json
"features": {
    "ghcr.io/walkmana-25/devcontainer-features/opencode-with-config:1": {}
}
```

## Note on Mounts

The feature binds:
- `${localEnv:HOME}/.config/opencode` to `/opencode_config` and creates a symbolic link to `${_REMOTE_USER_HOME}/.config/opencode`
- `${localEnv:HOME}/.local/share/opencode` to `/opencode_data` and creates a symbolic link to `${_REMOTE_USER_HOME}/.local/share/opencode`
