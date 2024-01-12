#!/bin/bash

mkdir -p /etc/openvpn/scripts/
cp ~/Openvpn_ovpn-admin/setup/auth.sh /etc/openvpn/scripts/
chmod +x /etc/openvpn/scripts/auth.sh
cp ~/Openvpn_ovpn-admin/setup/client.conf.tpl /etc/openvpn/server/
echo "finished configuration"