# VIPER (View - interactor - Presenter - Entity - Router)

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

[Reference](https://eunjin3786.tistory.com/31)
