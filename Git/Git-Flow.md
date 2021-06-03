# Git-flow

## Git Repository 구성

Repository는 Upstream Remote Repository(이하 Upstream Repository), Origin Remote Repository(이하 Origin Repository), Local Repository 이렇게 3부분으로 구성된다. Upstream Repository는 개발자들이 공유하는 저장소로 최신 소스코드가 저장되어 있는 원격 저장소이다. Origin Repository는 Upstream Repository를 Fork한 원격 개인 저장소이다. Local Repository는 내 컴퓨터에 저장되어 있는 개인 저장소이다.

<img src = "https://woowabros.github.io/img/2017-10-30/github-flow_repository_structure.png"/>

위 그림은 Git Repository 구성과 워크플로우를 설명하고 있다. Local Repository에서 작업을 완료한 후 작업 브랜치를 Origin Repository에 push한다. 그리고 Github에서 Origin Repository에 push한 브랜치를 Upstream Repository로 merge하는 pull Request를 생성하고 코드리뷰를 거친 후 merge한다. 다시 새로운 작업을 할 때 Local Repository에서 Upstream Repository를 pull한다.

### Git-flow 전략 간단하게 살펴보기

git flow를 사용했을 때 작업을 어떻게 하는지 살펴보기 전에 먼저 Git-flow에 대해서 간단히 살펴보자. Git-flow에는 5가지 종류의 브랜치가 존재한다. 항상 유지되는 메인 브랜치들(master, develop)과 일정 기간 동안만 유지되는 보조 브랜치들(feature, release, hotfix)이 있다.

- master: 제품으로 출시될 수 있는 브랜치
- develop: 다음 출시 버전을 개발하는 브랜치
- feature : 기능을 개발하는 브랜치
- release : 이번 출시 버전을 준비하는 브랜치
- hotfix : 출시 버전에서 발생한 버그를 수정 하는 브랜치

<img src = "https://woowabros.github.io/img/2017-10-30/git-flow_overall_graph.png"/>

위 그림을 일반적인 개발 흐름으로 살펴보면 처음에는 master와 develop 브랜치가 존재한다. 물론 develop 브랜치는 master에서부터 시작된 브랜치이다. develop 브랜치에서는 상시로 버그를 수정한 커밋들이 추가된다. 새로운 기능 추가 작업이 있는 경우 develop 브랜치에서 feature 브랜치를 생성한다. feature 브랜치는 언제나 develop 브랜치에서부터 시작하게 된다. 기능 추가 작업이 완료되었다면 feature 브랜치는 develop 브랜치로 merge된다. develop에 이번 버전에 포함되는 모든 기능이 merge 되었다면 QA를 하기 위해 develop 브랜치에서부터 release 브랜치를 생성한다. QA를 진행하면서 발생한 버그들은 release 브랜치에 수정된다. QA를 무사히 통과했다면 release 브랜치를 master와 develop 브랜치로 merge한다. 마지막으로 출시된 master 브랜치에서 버전 태그를 추가한다.

> 원할한 협업 진행을 위해 Git-flow를 공부하여 숙지하는 것이 좋다고 생각한다. 