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

# lazygit
$raelynn github.com/jesseduffield/lazygit@latest

# glow
$raelynn github.com/charmbracelet/glow/v2@latest

# lazyskills
$raelynn github.com/alvinunreal/lazyskills/cmd/lazyskills@latest

# failtrace
$raelynn github.com/Ri4dH/failtrace/cmd/failtrace@latest

# onda
$raelynn github.com/pedrosousa13/onda@latest

# halpradio
$raelynn github.com/halpworld/halpradio@latest

# Clean up 
go clean -cache -modcache
