#!/bin/bash

file_path="/etc/openvpn/server/server.conf"

# 파일에 지정된 라인이 이미 있는지 확인
if grep -q "^user nobody" "$file_path" && grep -q "^group nogroup" "$file_path" && grep -q "script-security 2" "$file_path" && grep -q "auth-user-pass-verify /etc/openvpn/scripts/auth.sh via-file" "$file_path"; then
    echo "해당 설정 라인은 이미 $file_path 파일에 존재합니다. 변경이 필요하지 않습니다."
else
    sed -i '/^user nobody/s/^/# /' "$file_path"
    sed -i '/^group nogroup/s/^/# /' "$file_path"
    
    # 'script-security 2'가 이미 있는지 확인하고 없으면 추가
    grep -q "script-security 2" "$file_path" || echo "script-security 2" >> "$file_path"
    
    # 'auth-user-pass-verify /etc/openvpn/scripts/auth.sh via-file'가 이미 있는지 확인하고 없으면 추가
    grep -q "auth-user-pass-verify /etc/openvpn/scripts/auth.sh via-file" "$file_path" || echo "auth-user-pass-verify /etc/openvpn/scripts/auth.sh via-file" >> "$file_path"

    echo ""Script completed. Updated configuration in $file_path""
fi