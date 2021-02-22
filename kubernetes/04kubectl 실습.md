* node 보기: kubectl get nodes -o wide



## kubectl이란?

* kubenetes에게 요청할때 쓰는 명령어



## kubectl 명령어 기본구조

### kubectl [command] [TYPE] [NAME] [flages]

ex) kubectl get pod webserver -o wide

* command: 자원(object)에 실행할 명령
  * create
  * get
  * delete
  * edit
* TYPE: 자원의 타입
  * node
  * pod
  * service
* NAME: 자원의 이름
* flags: 부가적으로 설정할 옵션
  * --help
  * -o options



## kubectl 명령어 자동완성