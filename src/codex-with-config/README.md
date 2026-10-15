# Codex with Config

This Devcontainer Feature provides [OpenAI Codex CLI](https://github.com/openai/codex) and automatically mounts your host-side configuration directory into the container.

## Features

- **Codex CLI Installation**: Installs Codex CLI using the official standalone installer (no Node.js dependency) or npm.
- **Config Persistence**: Mounts `${localEnv:HOME}/.codex-container` from your host to `/codex_config` in the container, and creates a symbolic link at `${_REMOTE_USER_HOME}/.codex`. This allows you to use your existing authentication, settings, and session history without re-authenticating inside each container.
- **Version Pinning**: Optionally pin a specific Codex CLI release.

## Requirements

- **Host-side Authentication**: You should be authenticated with Codex CLI on your host machine before using this feature. Ensure `${HOME}/.codex-container` exists on your host.

## Usage

Add the following to your `devcontainer.json`:

```json
"features": {
    "ghcr.io/walkmana-25/devcontainer-features/codex-with-config:1": {}
}
```

### Options

| Option | Type | Default | Description |
|---|---|---|---|
| `version` | string | `latest` | Version of Codex CLI to install (e.g. `0.161.0`). |
| `installMethod` | string | `standalone` | `standalone` (official installer) or `npm`. |

Example with options:

```json
"features": {
    "ghcr.io/walkmana-25/devcontainer-features/codex-with-config:1": {
        "version": "0.161.0"
    }
}
```

## Note on Mounts

The feature binds `${localEnv:HOME}/.codex-container` to `/codex_config` and creates a symbolic link to `${_REMOTE_USER_HOME}/.codex` if it doesn't already exist.

At post-create, the feature also grants the container user's group read/write
access to the mounted configuration and sets the setgid bit on directories, so
files created by the container user remain group-writable after rebuilds. This
avoids SQLite "database is locked" / permission errors caused by UID mismatches
between the host (e.g. macOS uid 501) and the container user (uid 1000).

## Authentication

- **ChatGPT account**: Run `codex login` inside the container after creation. The auth token is stored in `~/.codex/auth.json` (persisted to the host mount).
- **API key**: Set the `OPENAI_API_KEY` environment variable, or run `printenv OPENAI_API_KEY | codex login --with-api-key`.
