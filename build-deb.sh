#!/bin/bash
set -e

PKG_NAME="icrn"
VERSION="$(git tag -l | sort | tail -1 | perl -p -e 's/^v//')"
ARCH="all"
MAINTAINER="Martin-Louis Bright <mlbright+icrn@gmail.com>"
DESCRIPTION="IMDSv2 Capacity Rebalancing Notifier"

BUILD_DIR="deb_build"
INSTALL_DIR="$BUILD_DIR/usr/local/bin"
SYSTEMD_DIR="$BUILD_DIR/usr/lib/systemd/system"

# Clean up previous build
rm -rf "$BUILD_DIR"
mkdir -p "$INSTALL_DIR"
mkdir -p "$SYSTEMD_DIR"

# Copy your main script or binary (adjust as needed)
cp icrn "$INSTALL_DIR/$PKG_NAME"

# Copy the systemd service file
cp icrn.service "$SYSTEMD_DIR/$PKG_NAME.service"

# Create DEBIAN control files
mkdir -p "$BUILD_DIR/DEBIAN"
cat >"$BUILD_DIR/DEBIAN/control" <<EOF
Package: $PKG_NAME
Version: $VERSION
Section: utils
Priority: optional
Architecture: $ARCH
Maintainer: $MAINTAINER
Description: $DESCRIPTION
EOF

# Build the package
dpkg-deb --build "$BUILD_DIR" "${PKG_NAME}_${VERSION}_${ARCH}.deb"
