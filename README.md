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
    "ghcr.io/yutailang0119/devcontainer-features/claude-with-config:1": {}
}
```

*Note: Replace `yutailang0119` with the appropriate GitHub username if you have forked this repository.*

## Development

### Testing

To test the features locally, you can use the `devcontainer` CLI.

```bash
devcontainer features test --features claude-with-config --base-image mcr.microsoft.com/devcontainers/base:ubuntu .
```

### Publishing

Features are automatically published to GitHub Container Registry (GHCR) via GitHub Actions when a release is created or manually triggered.

## License

This repository is licensed under the [MIT License](LICENSE).
