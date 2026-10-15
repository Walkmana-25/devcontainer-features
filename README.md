# Custom Devcontainer Features

This repository contains a collection of custom [Devcontainer Features](https://containers.dev/features). These features can be used in your `devcontainer.json` to enhance your development environment.

## Available Features

### Claude Code with Config (`claude-with-config`)

This feature provides [Claude Code](https://github.com/anthropics/claude-code) and automatically mounts your host-side configuration directory into the container.

- **Official Claude Code Support**: Leverages the official Claude Code Feature for installation.
- **Config Persistence**: Mounts `${localEnv:HOME}/.claude` from your host to `${_REMOTE_USER_HOME}/.claude` in the container.
- **Seamless Authentication**: Use your existing host-side authentication and settings without re-authenticating.

#### Usage

Add the following to your `devcontainer.json`:

```json
"features": {
    "ghcr.io/walkmana-25/devcontainer-features/claude-with-config:1": {}
}
```

### OpenCode with Config (`opencode-with-config`)

This feature provides [OpenCode](https://github.com/sst/opencode) and automatically mounts your host-side configuration directories into the container.

- **Official OpenCode Support**: Leverages the official OpenCode Feature for installation.
- **Config Persistence**: Mounts the following from your host:
  - `${localEnv:HOME}/.config/opencode` → `${_REMOTE_USER_HOME}/.config/opencode`
  - `${localEnv:HOME}/.local/share/opencode` → `${_REMOTE_USER_HOME}/.local/share/opencode`
- **Seamless Authentication**: Use your existing host-side authentication and settings without re-authenticating.

#### Requirements

- Ensure `${HOME}/.config/opencode` exists on your host (global configuration).
- Ensure `${HOME}/.local/share/opencode` exists on your host (authentication data).

#### Usage

Add the following to your `devcontainer.json`:

```json
"features": {
    "ghcr.io/walkmana-25/devcontainer-features/opencode-with-config:1": {}
}
```

### Codex with Config (`codex-with-config`)

This feature provides [OpenAI Codex CLI](https://github.com/openai/codex) and automatically mounts your host-side configuration directory into the container.

- **Codex CLI Installation**: Installs Codex CLI using the official standalone installer (no Node.js dependency) or npm.
- **Config Persistence**: Mounts `${localEnv:HOME}/.codex-container` from your host to `${_REMOTE_USER_HOME}/.codex` in the container.
- **Seamless Authentication**: Use your existing host-side authentication and settings without re-authenticating.

#### Requirements

- Ensure `${HOME}/.codex-container` exists on your host (configuration and authentication data).

#### Usage

Add the following to your `devcontainer.json`:

```json
"features": {
    "ghcr.io/walkmana-25/devcontainer-features/codex-with-config:1": {}
}
```

## Development

### Testing

To test the features locally, you can use the `devcontainer` CLI.

```bash
# Test claude-with-config
devcontainer features test --features claude-with-config --base-image mcr.microsoft.com/devcontainers/base:ubuntu .

# Test opencode-with-config
devcontainer features test --features opencode-with-config --base-image mcr.microsoft.com/devcontainers/base:ubuntu .

# Test codex-with-config
devcontainer features test --features codex-with-config --base-image mcr.microsoft.com/devcontainers/base:ubuntu .
```

### Publishing

Features are automatically published to GitHub Container Registry (GHCR) via GitHub Actions when a release is created or manually triggered.

## License

This repository is licensed under the [MIT License](LICENSE).
