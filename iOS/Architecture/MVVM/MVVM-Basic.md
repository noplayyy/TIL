# MVVM (Model - View - ViewModel)

<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99FF8F385C97A2CD3B">

<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbn1Udk%2FbtqDQbP5qek%2Fz1qsoTEU7KL67Yhqkb2mO0%2Fimg.png">

- Model의 변화를 ViewModel에게 알려주면 ViewModel과 바인딩 되어있는 View가 업데이트 된다.
- View에 들어온 Event를 ViewModel에게 알려주면 ViewModel은 Model을 업데이트 시킨다.

MVC와 달리 ViewModel이 중간 다리 역할을 하고 ViewController가 View로 들어간 패턴이다. 따라서 Controller와 Model은 서로 대화할 수 없다. ViewModel을 통해야한다.

> ViewModel

     ViewModel은 Presentation Logic을 다루게 된다. 하지만 UI는 다루지 않는다.
     ViewModel과 View를 바인딩 할 때 주로 Rx를 이용한다.

### 장점

1. 유닛테스팅 하기 좋다

   ViewModel은 View에 대해 아무것도 모른다. 즉 ViewModel에는 UIKit과 관련된 코드가 없다. ( ↔ View랑 너무 친한 MVC의 Controller) ViewController와 의존성도 전혀 없다. 따라서 ViewModel을 이용해서 Model의 비즈니스 로직을 테스트해 볼 수 있다.

[Reference](https://eunjin3786.tistory.com/31)
