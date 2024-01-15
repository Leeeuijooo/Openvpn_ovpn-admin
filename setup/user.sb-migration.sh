#!/bin/bash

db_path="/etc/openvpn/server/easyrsa/pki/users.db"

# 지정된 경로에 users.db 파일이 존재하지 않을 때만 실행
if [ ! -f "$db_path" ]; then
    cd /etc/openvpn/server/easyrsa/pki/
    openvpn-user db-init
    mv openvpn-user.db users.db
    openvpn-user --db.path="./users.db" db-migrate
else
    echo "users.db already exists. Skipping the initialization steps."
fi

cd /etc/openvpn/server