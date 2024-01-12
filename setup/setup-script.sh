#!/bin/bash

/bin/bash -x ~/Openvpn_ovpn-admin/setup/opvn-admin-install.sh
/bin/bash -x ~/Openvpn_ovpn-admin/setup/openvpn-user-install.sh
/bin/bash -x ~/Openvpn_ovpn-admin/setup/configure.sh
/bin/bash -x ~/Openvpn_ovpn-admin/setup/modify-conf.sh
/bin/bash -x ~/Openvpn_ovpn-admin/setup/openvpn-server-restart.sh
/bin/bash -x ~/Openvpn_ovpn-admin/setup/user.sb-migration.sh