## Openvpn_ovpn-admin
---

개발 목적 : OpenVPN 커뮤니티 에디션(오픈소스)을 ovpn-admin 이라는 프로그램을 이용해 GUI로 관리하기 위함
### 실행 환경
* Prod 환경에서는 테스트하지 마세요.
* AWS 환경에서 구성하였습니다.
  * server 는 기본적으로 Public 서브넷에 위치합니다.
  * Ubuntu 20.04 이미지로 서버 생성하였습니다.

  * Client(테스트)용도인 OpenVPN Connect 를 설치하세요.
    * Apple iOS [https://apps.apple.com/us/app/openvpn-connect-openvpn-app/id590379981]
    * Android [https://play.google.com/store/apps/details?id=net.openvpn.openvpn&hl=en&pli=1]
    * Mac OS [https://openvpn.net/client-connect-vpn-for-mac-os/]
    * Windows [https://openvpn.net/client/client-connect-vpn-for-windows/]
    * Linux [https://openvpn.net/openvpn-client-for-linux/]
  * DB (sqlite) 에서 User 정보를 확인하기 위해 sqlite 를 설치하는 것을 권장합니다.
---
### Information
* OpenVPN Community Server 를 사용합니다.
  * apt 로 openvpn 을 설치하고 openvpn 바이너리를 사용하여 서비스화 합니다.
* ovpn-admin 를 사용합니다.
  * 바이너리를 사용하여 ovpn-admin, openvpn-user 바이너리를 사용하여 서비스화 합니다.
---
### Using

---
### Ref
