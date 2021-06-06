# How to use git?

> git을 어떻게 사용하는 지 명령어를 설명하는 md 파일이다. 협업을 하며 git을 사용하는 빈도가 높아지므로 기억이 나지 않을 경우를 대비해 복습하는 의미에서 작성한다.

### 1. Setting, Initialization

#### 전역 사용자, 이메일 구성

```
git config --global user.name "NAME"
git config --global user.email "EMAIL"
```

#### 전역 설정 정보 조회

```
git config --global --list
```

#### 저장소 초기화 하기

```
git init
```

#### 저장소 복제하기

```
git clone <REPOSITORY URL>
```

#### 새로운 원격 저장소 추가하기

```
git remote add <REMOTE STORAGE NAME (Default : origin)> <REPOSITORY URL>
```

### 2. Basic Commands

#### 파일 스테이징 및 커밋

```
git add <file>  // git add . : 모든 파일 스테이징
git commit -m "<COMMIT MESSAGE>"
```

#### 최근 커밋 수정하기

```
git commit -m "<COMMIT MESSAGE>" --amend
```

### 3. Branch

#### 로컬 branch list 보기

```
git branch
```

#### 원격 branch list 보기

```
git branch -r
```

#### 모든 branch list 보기

```
git branch -a
```

#### 현재 branch에서 새로운 branch 생성

```
git branch <NEW BRANCH>
```

#### 다른 branch check out 하기

```
git checkout <BRANCH>
```

#### 현재 branch에서 새로운 branch 생성하고 check out 하기

```
git checkout -b <NEW BRANCH>
```

#### 다른 branch를 현재 branch에 덮어쓰기

```
git merge <BRANCH>
```

#### branch 삭제하기

```
- 삭제할 branch가 현재 branch에 합쳐졌을 경우
git branch -d <DELETE BRANCH>

- 삭제할 branch가 현재 branch에 합쳐지지 않았을 경우
git branch -D <DELETE BRANCH>
```

### 4. Remote repository

#### 저장소 복제하기

```
git clone <REPOSITORY URL>
```

#### 새로운 원격 저장소 추가하기

```
git remote add <REMOTE STORAGE NAME (Default : origin)> <REPOSITORY URL>
```

#### 원격 branch list 보기

```
git branch -r
```

#### 원격 branch에서 로컬 branch 생성하기

```
git branch <NEW BRANCH> <REMOTE BRANCH>
```

#### 원격 저장소에서 합치지 않고 로컬 branch로 변경 사항 가져오기

```
git fetch <REMOTE REPOSITORY>
```

#### 원격 저장소에서 변경 사항을 가져와 현재 branch에 합치기

```
git pull <REMOTE REPOSITORY>
```
