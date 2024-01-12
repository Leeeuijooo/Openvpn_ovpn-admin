#!/bin/bash

file_path="/etc/openvpn/server/server.conf"

# Replace the specified lines in the original file
sed -i 's/^user nobody/# user nobody/' "$file_path"
sed -i 's/^group nogroup/# group nogroup/' "$file_path"
echo "script-security 2" >> "$file_path"
echo "auth-user-pass-verify /etc/openvpn/scripts/auth.sh via-file" >> "$file_path"
echo "Script completed. Updated configuration in $file_path"