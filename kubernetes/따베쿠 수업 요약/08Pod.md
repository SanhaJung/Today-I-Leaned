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
    
    $ kubectl get pods webserver -o json | grep -i podip
    ```

  * Pod에 접속해서 결과 보기

    `$ curl <pod's IP address>`