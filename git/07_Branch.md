# 07. Branch

* branch: 가지 --> 가지치기

* `git branch`: 브랜치 목록 확인

* `git branch login` 브랜치 생성

* `git switch login`: `login`브랜치로 이동

  ```bash
  $ git switch login
  Switched to branch 'login'
  ```

* `git log --oneline --graph --all`

  * 한줄로, 그래프 포함, 브랜치 전부

* `git switch -c login`: 브랜치 만들면서 바로 이동

  * `git branch login`  + `git swtch login`

* 구버전
  * `git checkout login`: 이동
  * `git checkout -b login`: 생성하면서 바로