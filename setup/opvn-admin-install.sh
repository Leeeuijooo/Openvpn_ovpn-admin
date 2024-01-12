#!/bin/bash

# ovpn-admin 다운로드 및 설치
wget https://github.com/flant/ovpn-admin/releases/download/2.0.2/ovpn-admin-linux-amd64.tar.gz
tar -xvzf ovpn-admin-linux-*.tar.gz
cp ovpn-admin-linux-amd64 /usr/sbin/
echo "finished ovpn-admin file install"