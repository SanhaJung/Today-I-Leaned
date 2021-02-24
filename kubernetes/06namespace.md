## 네임스페이스 사용하기

* namespace 생성
  * CLI
    * `$ kubectl create namespace blue`
    * `$ kubectl get namespaces`
  * yaml
    * `$ kubectl create namespace green --dry-run -o yaml > green-ns.yaml`
    * `$ vim  green-ns.yaml`
    * `$ kubectl create -f green-ns.yaml`
* namespace 관리
  * `$ kubectl get namespace`
  * `$ kubectl delete namespace`  : api중에 가장 큰 단위 - 지우면 같이 지워짐



* 사용할 네임스페이스 switch

  * 기본으로 사용하는 namespace를 defaul가 아닌 다른 namespace로 switch

  * 방법

    * namespace를 포함한 context 등록

            ```bash
    $ kubectl config --help
    $ kubectl config set-context NAME --cluster=kubernetes ...
    $ kubectl config view
            ```

    * 등록된  namespace로 context 변경

    ​       `$ kubectl config use-context NAME`