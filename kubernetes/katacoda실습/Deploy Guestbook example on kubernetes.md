# Deploy Guestbook example on kubernetes



## Step 1 - Start Kubernetes

#### Task

* Launch Kubernetes cluster
* Health Check
  * `kubectl cluster-info`
  * `kubectl get nodes`



## Step 2 - Redis Master Controller

* kubernetes 배포
  * replication controller
    * 인스턴스 수
    * 사용할 docker 이미지 및 서비스 식별하는 이름 정의
  * service



#### Task

* Create Replication Controller

  * `kubectl create -f redis-master-controller.yaml`
    * redis-master-controller.yaml로 컨트롤러 생성
      * port: 6379
      * redis-master 서버 정의

  ```yaml
  apiVersion: v1
  kind: ReplicationController
  metadata:
    name: redis-master
    labels:
      name: redis-master
  spec:
    replicas: 1
    selector:
      name: redis-master
    template:
      metadata:
        labels:
          name: redis-master
      spec:
        containers:
        - name: master
          image: redis:3.0.7-alpine
          ports:
          - containerPort: 6379
  ```

* 실행 현황 확인
  * `kubectl get rc` 
    * rc: raplication controller
  * `kubectl get pods`



## Step3 - Redis Master Service

* service
  * load balancer
    * 트래픽을 프록시 함
      * 프록시는 컨테이너가 다른 노드에 있는 경우에도 작동
      * 

