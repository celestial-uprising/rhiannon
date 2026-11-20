#!/usr/bin/env bash
set -oue pipefail

export GOOS=linux
export GOARCH=amd64
export GOAMD64=v3
export CGO_ENABLED=0

dnf5 install -y \
        golang \
        git \
        ca-certificates

raelynn="go install -trimpath -ldflags=-s -ldflags=-w"
export GOBIN=/tmp/bin

# ==============================================================================
# 1. lazyjournal (TUI for journalctl, file logs, and container logs)
# ==============================================================================
$raelynn github.com/Lifailon/lazyjournal@latest

# ==============================================================================
# 2. lazygit (Terminal UI for git commands)
# ==============================================================================
$raelynn github.com/jesseduffield/lazygit@latest

# ==============================================================================
# 3. glow (Markdown reader on the CLI)
# ==============================================================================
$raelynn github.com/charmbracelet/glow/v2@latest

# ==============================================================================
# 4. lazyskills (TUI skill manager)
# ==============================================================================
$raelynn github.com/alvinunreal/lazyskills/cmd/lazyskills@latest

# ==============================================================================
# 5. failtrace (Failure trace analyzer)
# ==============================================================================
$raelynn github.com/Ri4dH/failtrace/cmd/failtrace@latest

# ==============================================================================
# 6. onda (Terminal audio/radio player)
# ==============================================================================
$raelynn github.com/pedrosousa13/onda@latest

# ==============================================================================
# 7. halpradio (Terminal internet radio player)
# ==============================================================================
$raelynn github.com/halpworld/halpradio@latest

# Clean up Go module/build cache in /root/go so it doesn't bloat stage layers
go clean -cache -modcache
