#!/bin/bash
# Go install
## Check if go is already installed
if command -v go &> /dev/null; then
    echo "Go is already installed. No changes made."
else
    # Go installation
    wget https://golang.org/dl/go1.21.6.linux-amd64.tar.gz
    rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.6.linux-amd64.tar.gz
    export PATH=$PATH:/usr/local/go/bin
    go version
fi

# source code build
# copy build result
# Define URLs and file paths
archive_url="https://github.com/kumina/openvpn_exporter/archive/refs/tags/v0.3.0.tar.gz"
archive_file="v0.3.0.tar.gz"
extracted_dir="openvpn_exporter-0.3.0"
binary_file="openvpn_exporter"

# Check if archive and binary already exist
if [ -f "$archive_file" ] && [ -f "/usr/sbin/$binary_file" ]; then
    echo "Archive and binary already exist. No changes made."
else
    # Download archive if it doesn't exist
    [ -f "$archive_file" ] || wget "$archive_url"

    # Extract archive if it doesn't exist
    [ -d "$extracted_dir" ] || tar -xzf "$archive_file"

    # Build binary
    (cd "$extracted_dir" && go build)

    # Move binary to /usr/sbin/ if it doesn't exist
    [ -f "/usr/sbin/$binary_file" ] || mv "$extracted_dir/$binary_file" "/usr/sbin/"

    echo "Script completed."
fi