# MVC (Model - View - Controller)

<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FLtfxT%2FbtqDPZoMgaR%2F3l9DkmfVfL3lS4Jernarz0%2Fimg.png">

### 장점

1. 역할 분담을 고려한 구조를 빠르게 구현 할 수 있음

### 단점

1.  MVC는 MVC (Massive View Controller) ?

    Model에 넣기도 애매하고 View에 넣기 애매한 코드들은 모두 Controller에 들어가게 되어서 Controller가 비대해진다.

    > Example

        날짜 데이터를 각 국가별 양식으로 포맷하는 코드.

        비지니스 로직이나 데이터라고 보기도 어렵고 UI라고 보기도 어렵다. 결국 이와 같은 Formatting 담당 코드들은 Controller에 들어가게 된다.

2.  애플의 MVC 패턴에서는 View와 Controller가 너무 친하다.

    애플의 MVC 패턴은 기존 MVC 패턴과 다르다. View와 Controller가 강하게 연결되어 있어 View Controller가 거의 모든 일을 한다. ViewController에서는 Controller가 View의 life cycle(라이프 사이클)에 관여하기 때문에 View와 Controller를 분리하기 어렵다. 그래서 앱을 테스트할 때, Model은 따로 분리되어 테스트를 할 수 있어도 View와 Controller는 강하게 연결되어 있기 때문에 각각 테스트하기 어렵다는 단점이 있다.

<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F9956104D5C9EF01C3A">