#!/bin/bash

# Maybe Edit Required
cd /etc/openvpn/server/easyrsa/pki/
openvpn-user db-init
mv openvpn-user.db users.db
openvpn-user --db.path="./users.db" db-migrate
cd /etc/openvpn/server