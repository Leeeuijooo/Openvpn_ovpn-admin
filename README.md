## Openvpn_ovpn-admin
---
OpenVPN 커뮤니티 에디션(오픈소스)의 사용자를 ovpn-admin 이라는 프로그램을 이용해 GUI로 관리하기 위한 목적이며, OpenVPN Exporter 을 통해 매트릭을 받아옵니다.

### 실행 환경
* Prod 환경에서는 테스트하지 마세요.
* AWS(EC2) 환경에서 구성하였습니다.
  * Ubuntu 20.04 AMI
  * Client(테스트)용 OpenVPN Connect 를 설치하세요.
    * Apple iOS [https://apps.apple.com/us/app/openvpn-connect-openvpn-app/id590379981]
    * Android [https://play.google.com/store/apps/details?id=net.openvpn.openvpn&hl=en&pli=1]
    * Mac OS [https://openvpn.net/client-connect-vpn-for-mac-os/]
    * Windows [https://openvpn.net/client/client-connect-vpn-for-windows/]
    * Linux [https://openvpn.net/openvpn-client-for-linux/]
  * DB (sqlite) 에서 User 정보를 확인하기 위해 sqlite 를 설치하는 것을 권장합니다.
---
### Information
* OpenVPN Community Edition을 사용합니다.
  * apt 로 openvpn 을 설치하고 openvpn 바이너리를 사용하여 서비스 데몬을 생성합니다.
* ovpn-admin 를 사용합니다.
  * ovpn-admin(prebuilt), openvpn-user(prebuilt) 바이너리 file 을 사용하여 서비스 데몬을 생성합니다.
---
### Using
1. 현재의 레포지토리를 clone 합니다.
2. openvpn-install.sh 파일을 실행하여 vpn 서버를 구축합니다.
3. ovpn-admin 서비스 데몬을 생성합니다. `/usr/lib/systemd/system/`
  * (권장) ID/PW (2차 인증) 방식을 사용하고 싶으시면 ./systemdfile 의 ovpn-admin-id-pw.service 서비스 데몬을 생성하새요.
  * ID/PW (2차 인증) 방식을 사용하고 싶지 않으시면 ./systemdfile 의 ovpn-admin.service 서비스 데몬을 생성하세요.
    ```
    systemctl daemon-reload
    systemctl start Your Service.service
    ```
  * 서비스 데몬 파일(ovpn-admin-id-pw.service, ovpn-admin.service)내에서 `ExecStart` 부분에 VPN 서버의 공인IP 주소를 넣어야 하는 것에 주의하세요.
---
### Ref
* ovpn-admin [https://github.com/flant/ovpn-admin]
* openvpn-user [https://github.com/pashcovich/openvpn-user]