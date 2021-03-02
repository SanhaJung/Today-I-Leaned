## Container 정리

* 컨테이너 하나 = 애플리케이션 하나



## Pod란?

* 컨테이너를 표현하는 k8s API의 최소 단위

  * 도커: 컨테이너 실행
  * k8s: pod 실행

     --> API에서 컨테이너 동작은 불가능

* pod에는 하나 또는 여러개의 컨테이너 포함될 수 있음



## Pod 생성하기

* CLI 
  * `$ kubectl run webserver --image=nginx:1.14`
  * run: 컨테이너 pod를 실행시키는 명령어

* yaml

  ```yaml
  apiVersion: v1
  kind: Pod
  metadate:
    name: webserver
  spec:
    containers:
    - name: nginx-container
      image: nginx:1.14
      imagePullPolicy: Always
      ports:
      - containerPort: 80
        rotocol: TCP
  ```

  * Pod 실행

    * `$ kubectl create -f pod-nginx.yaml`   
      * create: 파일 실행

  * 현재 동작중인 Pod 확인

    ``` bash
    $ kubectl get pods
    $ kubectl get pods -o wide
    $ kubectl get pods -o yaml
    $ kubectl get pods -o json
    
    # i 뒤 요소 만 검색해서 보여줌
    $ kubectl get pods webserver -o json | grep -i podip 
  ```
  
* Pod에 접속해서 결과 보기
  
    `$ curl <pod's IP address>`



* `kubectl describe [오브젝트타입] [오브젝트명]`: 오브젝트 자세히 보여주는 명령어
  * event정보가 출력되어 troble shooting에 쓰임



## muti-container Pod 생성하기

* spec에 containes에 리스트로 정의

* 하나의 pod에 있는 컨테이너들은 동일한 IP(Pod의 IP), pod이름 사용  --> port로 구분

* `kubectl exec [pod이름] -c [container이름] -it --/bin/bash `: container 에 들어가기

* `kubectl logs [pod명] -c [container명]`: container의 로그 보기 

  --> sing-container pod는 컨테이너 명 빼고 명령

  * 200: 정상