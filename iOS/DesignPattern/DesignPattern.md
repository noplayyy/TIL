# Design Pattern

## MVC (Model - View - Controller)

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

## MVVM (Model - View - ViewModel)

<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99FF8F385C97A2CD3B">

<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbn1Udk%2FbtqDQbP5qek%2Fz1qsoTEU7KL67Yhqkb2mO0%2Fimg.png">

- Model의 변화를 ViewModel에게 알려주면 ViewModel과 바인딩 되어있는 View가 업데이트 된다.
- View에 들어온 Event를 ViewModel에게 알려주면 ViewModel은 Model을 업데이트 시킨다.

MVC와 달리 ViewModel이 중간 다리 역할을 하고 ViewModel이 중간 다리 역할을 하고 ViewController가 View로 들어간 패턴이다. 따라서 Controller와 Model은 서로 대화할 수 없다. ViewModel을 통해야한다.

> ViewModel

     ViewModel은 Presentation Logic을 다루게 된다. 하지만 UI는 다루지 않는다.
     ViewModel과 View를 바인딩 할 때 주로 Rx를 이용한다.

### 장점

1. 유닛테스팅 하기 좋다

   ViewModel은 View에 대해 아무것도 모른다. 즉 ViewModel에는 UIKit과 관련된 코드가 없다. ( ↔ View랑 너무 친한 MVC의 Controller) ViewController와 의존성도 전혀 없다. 따라서 ViewModel을 이용해서 Model의 비즈니스 로직을 테스트해 볼 수 있다.

## VIPER (View - interactor - Presenter - Entity - Router)

<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F9988024D5C9F1BB336">

- Entity (엔티티) = 모델객체
- Interactor (인터랙터) = 모델 객체 (entity)를 조작한다. 어떤 행동에 따라서 모델 객체를 조작하는 로직이 담겨있다.
- Presenter (프리젠터) = Interactor에서 데이터를 가져오고 View에 보여준다.
- View (뷰) = Presenter의 요정을 받고 요청대로 보여주고, 사용자의 입력을 받으면 다시 Presenter로 넘긴다.
- Router (라우터) 또는 Wireframe = 화면 전환 담당, 화면 전환을 어떻게 하는 지 알고 있다. '언제' 화면을 전환할 지 알고 있는 Presenter가 '어떻게' 화면을 전환할 지 알고 있는 Router에게 화면 전환을 요청한다.

⇒ Presenter는 View, Interactor, Router와 상호작용한다. (Interactor로 부터 조작된 데이터를 가져오고, View / ViewController에 준비한 데이터를 보내주고, Router에 화면 전환을 부탁한다.)

간단하게 Presenter 코드를 보면 다음과 같다.

```swift
class PostListPresenter: PostListPresenterProtocol {
	weak var view: PostListViewProtocol?
	var interactor: PostListInteractorInputProtocol?
	var wireFrame: PostListWireFrameProtocol?

	func viewDidLoad() {
		view?.showLoading()
		interactor?.retrievePostList()
	}

	func showPostDetail(forPost post: PostModel) {
		wireFrame?.presentPostDetailScreen(from: view!, forPost: post)
	}
}
```

## MVC-C / MVVM-C

navigation 코드를 Coordinate가 전부 담당하는 패턴

[Reference](https://eunjin3786.tistory.com/31)
