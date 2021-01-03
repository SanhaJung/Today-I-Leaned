# 08. Merge Branch

* 병합
  * `git merge {브랜치 이름}`

1. Fast-Forward

   ```bash
   (main)  $ git switch -c login
   (login) $ touch login.txt
   (login) $ git add, git commit
   (login) $ git switch main
   (main)  $ git merge login
   ```

   ```bash
   $ git log --oneline --graph --all
   ```

   

2. 3-way Merge

   

3. Merge Comflict