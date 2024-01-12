#!/bin/bash

wget https://github.com/pashcovich/openvpn-user/releases/download/v1.0.9/openvpn-user-linux-amd64.tar.gz
tar -xvzf openvpn-user-linux-amd64.tar.gz
cp openvpn-user /usr/local/sbin/
echo "openvpn-user file install"