# Step 1 - Create Deployment

* Deployment object 
  * kubernetes object 중에 가장 흔한 object임
  * 앱 이름, 레이블, 컨테이너 사양 정의



### Task

* deployment.yaml
  * docke image: **katacoda/docker-http-server:latest**
  * app name: **webapp1**
  * port: **80**

```Yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: webapp1
  template:
    metadata:
      labels:
        app: webapp1
    spec:
      containers:
      - name: webapp1
        image: katacoda/docker-http-server:latest
        ports:
        - containerPort: 80
```

* 클러스터에 배포

  `kubectl create -f deployment.yaml`

* deployment object 목록 확인

  `kubectl get deployment`

  * 세부 정보

    `kubectl describe deployment webapp1`

# step2 - Create Service

* kubernetes 네트워킹 기능
  * 애플리케이션 통신 방식 제어 
  * 네크워크 구성은 Yaml을 통해 제어 가능



### Task

* service.yaml
  * label이 Webapp1인 애플리케이션 선택
  * multiple replicas, instances 가 배포되면 자동으로 로드밸런싱이 됨
  * service는 NodePort 를 통해 애플리케이션 사용

```yaml
apiVersion: v1
kind: Service
metadata:
  name: webapp1-svc
  labels:
    app: webapp1
spec:
  type: NodePort
  ports:
  - port: 80
    nodePort: 30080
  selector:
    app: webapp1
```

* service 배포

  `kubectl create -f service.yaml`

* service 정보 확인

  `kubectl get svc`

  `kubectl describe svc webapp1-svc`

* service 응답 확인

  `curl host01:30080`



# Step 3 - Scale Deployment

* Deployment 확장
  * YAML에서 정보 변경
  * infrastructure as code mindset
  * manifest(매니페스트): 특정 디렉터리에 있는 JSON, YAML 형식의 표준 파드 정의
    * 매니페스트는 소스 제어하에 유지
    * 프로덕션 구성이 소스제어의 구성과 일치하는지 확인
      * 여기서 프로덕션(production)은??
        * 서비스 하고자하는 deployment에 의해 설치된 pod안의 contianer의 애플리케이션
        * 또는 deployment된 container



### Task

* deployment.yaml에서 replicas를 4로 수정
* 변경사항 적용 - deployment.yaml 배포
  * `kubectl apply -f deployment.yaml`
* deployment.yaml 업데이트  확인
  * `kubectl get deployment`
  * 추가 pod 예약 확인
    * `kubectl get pods`
    * 이 pod들은 동일한 레이블이 있으므로 Servi
* service 응답 확인
  * `kubectl host01:30080`