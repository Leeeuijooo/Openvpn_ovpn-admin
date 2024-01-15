#!/bin/bash

file_name="ovpn-admin-linux-amd64.tar.gz"

# 파일이 존재하지 않으면 다운로드 및 설치 수행
if [ ! -f "$file_name" ]; then
    # ovpn-admin 다운로드 및 설치
    wget https://github.com/flant/ovpn-admin/releases/download/2.0.2/$file_name
    tar -xvzf $file_name
    cp ovpn-admin-linux-amd64 /usr/sbin/
    echo "Finished ovpn-admin file install"
else
    echo "File $file_name already exists. Skipping download and install."
fi