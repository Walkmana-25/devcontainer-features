#!/bin/bash

source dev-container-features-test-lib

check "opencode-available" opencode --version

mkdir -p "$HOME/.config" "$HOME/.local/share"
ln -sf /opencode_config "$HOME/.config/opencode"
ln -sf /opencode_data "$HOME/.local/share/opencode"

check "opencode-config-exists" test -e "$HOME/.config/opencode"
check "opencode-config-is-symlink" test -L "$HOME/.config/opencode"
check "opencode-config-target" test "$(readlink "$HOME/.config/opencode")" = "/opencode_config"

check "opencode-data-exists" test -e "$HOME/.local/share/opencode"
check "opencode-data-is-symlink" test -L "$HOME/.local/share/opencode"
check "opencode-data-target" test "$(readlink "$HOME/.local/share/opencode")" = "/opencode_data"

reportResults
