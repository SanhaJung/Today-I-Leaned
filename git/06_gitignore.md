# 06. gitignore

* 우리가 git으로 관리하고 싶지 않은 파일들을 제외 시키는 방법

  * 우리가 원하지 않는 파일을 제외
  * 외부에 공개되면 안되는 것들(key, secret)

* `.gitingnore`

  * `.gitingnore`에 작성된 파일들은 git으로 관리하지 않겠다.무리하라!

    ```bash
    .DS_Store # Mac OS에서만 사용하는 파일
    ```

* 작성법

  ``` 
  f.txt #특정파일
  secret/ #특정 폴더, 그 안에 있는 것들도 다 제외
  *.png #특정 확장자 / 모든 png는 빼고
  !profile.png #모든 png는 빼고, profile.png는 넣고!
  ```

* 처음부터, git으로 관리한 적이 없을때 부터 관리를 해줘야 함!

* 그렇다면 이미 commit을 한 파일들은 어떻게 제외할 수 있을까?

  1. `.gitignore`에다가 파일 명시
  2. `git rm --cached [파일명]`
     * git에서 더 이상 관리하지 않겠다!
     * WD에서 삭제해서 더 이상 관리하지 않겠다!

* 제외하면 좋은 파일

  * `.DS_Store`: Mac OS
  * `Thumbs.db`: Windows

  