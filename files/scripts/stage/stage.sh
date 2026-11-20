#!/usr/bin/env bash
set -oue pipefail

TARGET_TRIPLE="x86_64-unknown-linux-gnu"
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_RUSTFLAGS="-C target-cpu=bdver4"
export OPENSSL_NO_VENDOR=1

dnf5 install -y \
        cargo \
        rustc \
        gcc \
        gcc-c++ \
        make \
        pkgconf-pkg-config

# kmon
cargo install --root /tmp --locked --target "${TARGET_TRIPLE}" kmon

# viddy
cargo install --root /tmp --locked --target "${TARGET_TRIPLE}" viddy

# xan
cargo install --root /tmp --locked --target "${TARGET_TRIPLE}" xan

# doxx
dnf5 install -y \
        libxcb-devel
cargo install --root /tmp --locked --target "${TARGET_TRIPLE}" doxx

# xleak
dnf5 install -y \
        libxcb-devel
cargo install --root /tmp --locked --target "${TARGET_TRIPLE}" xleak

# croft-software
cargo install --root /tmp --locked --target "${TARGET_TRIPLE}" croft-software

# eilmeldung
cargo install --root /tmp --locked --target "${TARGET_TRIPLE}" eilmeldung

# elio
cargo install --root /tmp --locked --target "${TARGET_TRIPLE}" elio

# papr-tui 
dnf5 install -y \
        sqlite-devel \
        openssl-devel
LIBSQLITE3_SYS_USE_PKG_CONFIG=1 cargo install --root /tmp --locked --target "${TARGET_TRIPLE}" papr-tui

# asak
dnf5 install -y \
        alsa-lib-devel \
        jack-audio-connection-kit-devel
cargo install --root /tmp --target "${TARGET_TRIPLE}" asak

# kittybrowser
dnf5 install -y \
	git
cargo install --root /tmp --target "${TARGET_TRIPLE}" --git https://github.com/graiz/kittybrowser

# netop
dnf5 install -y \
	pkg-config \
	cmake \
	libpcap-devel
cargo install --root /tmp --target "${TARGET_TRIPLE}" /tmp netop

# terminactory
dnf5 install -y \
	git
cargo install --root /tmp --target "${TARGET_TRIPLE}" --git https://gitlab.com/snipedbywifi/terminactory

# tidemail
curl -fsSL "https://github.com/allisonhere/tidemail/releases/latest/download/tidemail-linux-x86_64.tar.gz" -o "/tmp/tidemail.tar.gz"
tar xzf tidemail.tar.gz -C /tmp/
cp /tmp/tidemail-linux-x86_64 /tmp/bin/tidemail
chmod +x /tmp/bin/tidemail

# solipsist
curl -fsSL "https://github.com/pulkitsharma07/solipsist/releases/latest/download/solipsist-linux-x64.tar.gz" -o "/tmp/solipsist.tar.gz"
tar xzf /tmp/solipsist.tar.gz -C /tmp/
cp /tmp/solipsist*/solipsist /tmp/bin/solipsist
chmod +x /tmp/bin/solipsist

# crow
curl -fsSL "https://github.com/errorware/crow/releases/latest/download/crow-linux-x86_64.tar.gz" -o "/tmp/crow.tar.gz"
tar xzf /tmp/crow.tar.gz -C /tmp/
cp /tmp/crow*/crow /tmp/bin/crow
chmod +x /tmp/bin/crow

# corgi
curl -fsSL "https://corgi.computer/releases/20261106T233845Z-03c72b717526/corgi-linux-x86_64" -o "/tmp/bin/corgi"
chmod +x /tmp/bin/corgi

# rhun
VERSION=$(curl -fsSL "https://github.com/vshvedov/rhun/releases/latest/download/VERSION" | tr -d ' \r\n')
curl -fsSL "https://github.com/vshvedov/rhun/releases/download/v${VERSION}/rhun-${VERSION}-linux-x86_64.tar.gz" -o "/tmp/rhun.tar.gz"
tar xzf /tmp/rhun.tar.gz -C /tmp
cp /tmp/rhun-${VERSION}/bin/rhun /tmp/bin/rhun
chmod +x /tmp/bin/rhun
