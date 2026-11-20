#!/usr/bin/env bash
set -oue pipefail

TARGET_TRIPLE="x86_64-unknown-linux-gnu"
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_RUSTFLAGS="-C target-cpu=bdver4"
export OPENSSL_NO_VENDOR=1

dnf5 install -y \
	cargo \
	rustc \
	pkg-config \
	cmake \
	libpcap-devel \
	alsa-lib-devel \
	clang-devel \
	git \
	gcc \
	make \
	vulkan-loader-devel \
	vulkan-headers \
	libxkbcommon-devel \
	glslc

git clone https://github.com/peteonrails/voxtype /tmp/voxtype
cd /tmp/voxtype
cargo build --release --features gpu-vulkan,osd-native 
cp /tmp/voxtype/target/release/voxtype /tmp/bin/voxtype
