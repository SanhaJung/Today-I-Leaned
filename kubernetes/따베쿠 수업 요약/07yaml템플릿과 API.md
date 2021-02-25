## yaml 템플릿

* 사람이 쉽게 읽을 수 있는 데이터 직렬화 형식
* 기본 문법
  * 구조화된 데이터를 표현하기 위한 데이터 포맷
  * 들여쓰기로 데이터 계층 표기
  * 들여쓰기로 tab아닌 space bar 사용(2칸)
  * 가독성이 좋음  -->  설정파일에 적합
  * Scalar 문법: ':'을 기준으로 key:value 
  * 배열 문법: '-' 문자로 여러 개 나열
  * 공식 사이트: http://yaml.org/
  * kubernetes yam example  `$ cat nginx-pod.yaml`



## API version

* alpha -> beta -> stable
* kubernetes Object 정의 시 apiVersion이 필요
* kubernetes가 update하는 API가 있으면 새로운 API가 생성됨



* API Object의 종류 및 버전
  * Deployment		    		apps/v1
  * Pod                                   V1
  * ReplicaSet                       apps/v1
  * ReplicationController    V1
  * Service                             V1
  * PersistentVolume          V1



* 리소스 정보(Documentation) 출력
  * `kubectl explane [오브젝트명]`