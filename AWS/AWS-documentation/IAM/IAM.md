# what is IAM?

##### Identity and Access Management(신원접근관리)

##### AWS 리소스에 대한 액세스를 안전하게 제어 할 수 있는 웹 서비스

--> 인증 및 권한 부여 대상을 제어



## **주요 기능**

* **Centralized control of your account**(AWS 계정 중앙 제어)
  * 루트 사용자가 사용자 제어
* **Shared access**(AWS 계정에 대한 공유 액세스 제공)
  * 암호, 액세스 키 공유 X --> AWS 계정의 리소스 관리, 사용가능한 권한을 다른 사람에게 부여
* **Granular permisstion**(세분화된 권한 제공)
  * 누가 어떤 서비스에 어떤 권한으로 액세스 할 수 있는지 정의 가능
* **Multi-factor authetication**(다단계 인증-MFA)
  * 보안 강화를 위해 계정, 개별 사용자에게 2단계인증 추가 가능
  * 사용자는 암호, 액세스 키뿐만아니라 디바이스 코드도 제공해야함
* **provied temporaty access**(임시 접근 가능) = 자격증명 연동
  * 기업 네트워크 같은 다른 곳에 이미 암호가 있는 사용자에게 임시 액세스 권한 부여 가능
* **password rotation policy**(암호 정책 설정 가능)
* 무료사용 가능
  * AWS 서비스에 액세스 하는 경우에만 요금 부과



## **Key Terminology for IAM**(핵심 용어)

* **Users**(사용자) - 개인
  * End user(최종 사용자)
  * user(사람)
* **Groups**(사용자 집합)
  * 사용자를 그룸에 넣으면 그룹의 권한을 상속 받음
  * 하나의 그룹 = 하나의 권한 집합
* **Roles**(역할)
  * 역할 생성 후 다른 AWS 자원에 할당
    * ex) AWS 가상머신에 s3에 액세스 가능한 역할을 할당한다.
* **Policies**(정책)
  * 권한을 할당하는 방법
  * policy document - JSON(정책을 정의하는 방법)
  * 그룹, 역할에 따라 그룹에 정책 연결

Policies  --적용--> Group --상속--> User



## IAM 액세스

* AWS Management 콘솔
  * 시간이 오래 걸릴 수 있지만 많은 것을 배우지 않아도 바로 사용 가능
* AWS 명령줄 도구
  * 콘솔보다 빠를 수 있다.
  * AWS 수행 스크립트 작성할때 유용
  * AWS CLI, Windows PowerShell용 도구를 제공함
  * 단 명령어를 알아야하는 단점이 있다.
* AWS SDK
  * 다양한 언어로 라이브러리와 샘플 코드로 구성된 SDK 제공
  * 명령어 세트
  * 프로그래밍 방식으로 접근가능
* IAM HTTPS API
  * 서비스로 직접 HTTPS 요청 실행
  * 프로그래밍 방식
  * 자격증명을 사용하여 요청에 디지털 방식으로 서명하는 코드 포함해야함.
  * HTTP 쿼리를 사용