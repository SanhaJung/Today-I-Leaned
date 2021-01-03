# 04. push error

* Pull을 빠뜨린 경우
* e를 commit
* 그리고 push

```bash
$ git push origin main
To https://github.com/SanhaJung/TIL-test.git
 ! [rejected]        main -> main (fetch first)
error: failed to push some refs to 'https://github.com/SanhaJung/TIL-test.git'
#push 실패
hint: Updates were rejected because the remote contains work that you do
# 업데이트 실패, remote가 니가 local에 가지고있지 않은 작업을 들고 있다.
hint: not have locally. This is usually caused by another repository pushing
# 지금 같은 경우 다른 repo로 push하려고 시도한 것이거나 
hint: to the same ref. You may want to first integrate the remote changes
# push를 다시 하기전에 romote 에서 발생한 변경사항을 먼저 통합(반영)을 해야할 수 있다.
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.

```

* `git pull origin main`

  ```bash
  Merge branch 'main' of https://github.com/SanhaJung/TIL-test # <-이미 메시지가 작성되어 있음
  # Please enter a commit message to explain why this merge is necessary,
  # especially if it merges an updated upstream into a topic branch.
  #
  # Lines starting with '#' will be ignored, and an empty message aborts
  # the commit.
  ```

  * vim: 에디터

    * esc
    * :
    * wq(write, quit)

  * enter

    ```bash
    $ git pull origin main
    remote: Enumerating objects: 3, done.
    remote: Counting objects: 100% (3/3), done.
    remote: Compressing objects: 100% (1/1), done.
    remote: Total 2 (delta 1), reused 2 (delta 1), pack-reused 0
    Unpacking objects: 100% (2/2), 239 bytes | 9.00 KiB/s, done.
    From https://github.com/SanhaJung/TIL-test
     * branch            main       -> FETCH_HEAD
       c57d533..8dc4361  main       -> origin/main
    Merge made by the 'recursive' strategy.
    # Merge 생성
    d.txt | 0
     1 file changed, 0 insertions(+), 0 deletions(-)
     create mode 100644 d.txt
    
    ```

    

  