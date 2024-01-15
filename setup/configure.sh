#!/bin/bash

# /etc/openvpn/scripts/ 디렉토리가 없다면 생성
if [ ! -d "/etc/openvpn/scripts/" ]; then
    echo "Creating directory: /etc/openvpn/scripts/"
    mkdir -p /etc/openvpn/scripts/
fi

# ~/Openvpn_ovpn-admin/setup/auth.sh 파일을 /etc/openvpn/scripts/ 디렉토리에 복사
if [ ! -f "/etc/openvpn/scripts/auth.sh" ]; then
    echo "Copying auth.sh to /etc/openvpn/scripts/"
    cp ~/Openvpn_ovpn-admin/setup/auth.sh /etc/openvpn/scripts/
fi

# /etc/openvpn/scripts/auth.sh 파일에 실행 권한이 없다면 부여
if [ ! -x "/etc/openvpn/scripts/auth.sh" ]; then
    echo "Granting execute permission to /etc/openvpn/scripts/auth.sh"
    chmod +x /etc/openvpn/scripts/auth.sh
fi

# ~/Openvpn_ovpn-admin/setup/client.conf.tpl 파일을 /etc/openvpn/server/ 디렉토리에 복사
if [ ! -f "/etc/openvpn/server/client.conf.tpl" ]; then
    echo "Copying client.conf.tpl to /etc/openvpn/server/"
    cp ~/Openvpn_ovpn-admin/setup/client.conf.tpl /etc/openvpn/server/
fi

echo "Finished configuration"