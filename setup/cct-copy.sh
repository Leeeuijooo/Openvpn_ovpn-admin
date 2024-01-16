#!/bin/bash

# ~/Openvpn_ovpn-admin/setup/client.conf.tpl 파일을 /etc/openvpn/server/ 디렉토리에 복사
if [ ! -f "/etc/openvpn/server/client.conf.tpl" ]; then
    echo "Copying client.conf.tpl to /etc/openvpn/server/"
    cp ~/Openvpn_ovpn-admin/setup/client.conf.tpl /etc/openvpn/server/
fi

echo "Finished configuration"