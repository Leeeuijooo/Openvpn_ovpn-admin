#!/bin/bash

# 디렉토리 생상
if [ ! -d "/var/log/openvpn_logs/" ]; then
    echo "Creating directory: /var/log/openvpn_logs"
    mkdir -p /var/log/openvpn_logs
fi

# server.conf 설정 추가
file_path="/etc/openvpn/server/server.conf"

if grep -q "^status      /var/log/openvpn_logs/openvpn-status.log" "$file_path" && grep -q "^log-append  /var/log/openvpn_logs/openvpn.log" "$file_path"; then
    echo "해당 설정 라인은 이미 $file_path 파일에 존재합니다. 변경이 필요하지 않습니다."
else 
    # status      /var/log/openvpn_logs/openvpn-status.log"가 이미 있는지 확인하고 없으면 추가
    grep -q "status      /var/log/openvpn_logs/openvpn-status.log" "$file_path" || echo "status      /var/log/openvpn_logs/openvpn-status.log" >> "$file_path"
    
    # log-append  /var/log/openvpn_logs/openvpn.log가 이미 있는지 확인하고 없으면 추가
    grep -q "log-append  /var/log/openvpn_logs/openvpn.log" "$file_path" || echo "log-append  /var/log/openvpn_logs/openvpn.log" >> "$file_path"

    echo ""Script completed. Updated configuration in $file_path""
fi

# logrotate 설정
logrotate_file="/etc/logrotate.d/openvpntest"

# Check if logrotate file
if [ -f "$logrotate_file" ]; then
    echo "Logrotate file $logrotate_file already exists. No changes made."
else
    # Create logrotate file and add content
    echo "/var/log/openvpn_logs/openvpn-status.log {" > "$logrotate_file"
    echo "    weekly" >> "$logrotate_file"
    echo "    delaycompress" >> "$logrotate_file"
    echo "    compress" >> "$logrotate_file"
    echo "    missingok" >> "$logrotate_file"
    echo "    notifempty" >> "$logrotate_file"
    echo "}" >> "$logrotate_file"

    echo "/var/log/openvpn_logs/openvpn.log {" >> "$logrotate_file"
    echo "    weekly" >> "$logrotate_file"
    echo "    delaycompress" >> "$logrotate_file"
    echo "    compress" >> "$logrotate_file"
    echo "    missingok" >> "$logrotate_file"
    echo "    notifempty" >> "$logrotate_file"
    echo "    sharedscripts" >> "$logrotate_file"
    echo "    postrotate" >> "$logrotate_file"
    echo "        systemctl restart openvpn-server 2>&1 > /dev/null || true" >> "$logrotate_file"
    echo "    endscript" >> "$logrotate_file"
    echo "}" >> "$logrotate_file"

    echo "Logrotate file created and content added: $logrotate_file"
fi
