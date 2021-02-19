# IAM 작동 방식

* 계정에 대한 인증 및 권한 부여를 제어하는데 필요한 인프라 제공

  * **IAM인프라**

    * 용어: Terms

    * 요청: Request
    * 인증: Authentication
    * 권한 부여: Authorization
    * 작업 또는 연산: Actions or operations
    * 리소스: Resources

--------------------------------------------------------------------

* **용어: Terms**
  * 리소스
    * **IAM에 저장된** 사용자, 그룹, 역할, 정책, 자격증명 공급자 **객체**
    * IAM에서 리소스 추가, 편집, 제거 가능
  * Identities(ID)
    * 식별, 그룹화에 사용되는 IAM 리소스 객체
    * 정책을 IAM identity(IAM 자격증명)에 연결 가능(users, groups, roles 포함)
  * Entities
    * AWS가 인증에 사용하는 IAM 리소스 객체
    * IAM users, 연합된 사용자, IAM 역할 포함
  * 보안 주체(Principals)
    * 로그인하고 aws에 요청하는 사람 또는 애플리케이션
      * AWS 계정 루트 사용자, IAM 사용자, IAM 역할을 사용하여 로그인
    * AWS 리소스에 작업을 요청할 수 있는 사람/애플리케이션
    * AWS 계정 루트사용자, IAM 엔티티로 인증되어 AWS에 요청
      * AWS 루트 사용자는 daily work에 사용하지 않는 것이 좋음
      * 대신 IAM 엔티티(사용자, 역할)를 생성
    * 애플리케이션이 AWS 계정에 액세스할 수 있도록 연동사용자, 프로그래밍 방식의 액세스 지원

-----------------------

* **요청: Request**
  * 