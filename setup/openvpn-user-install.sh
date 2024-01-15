#!/bin/bash

file_name="openvpn-user-linux-amd64.tar.gz"

# 파일이 존재하지 않으면 다운로드 및 설치 수행
if [ ! -f "$file_name" ]; then
    # openvpn-user 다운로드 및 설치
    wget https://github.com/pashcovich/openvpn-user/releases/download/v1.0.9/$file_name
    tar -xvzf $file_name
    cp openvpn-user /usr/local/sbin/
    echo "Finished openvpn-user file install"
else
    echo "File $file_name already exists. Skipping download and install."
fi