# MVVM
## MVVM이란?

MVVM은 Model - View - ViewModel의 약자로 소프트웨어 아키텍처 패턴이다.

(Model은 데이터, View는 유저 인터페이스, ViewModel은 뷰와 모델 사이를 연결)


### Model(모델)은 어떤 부분을 책임지고 있을까?

데이터 모델, 데이터 접근 레이어, 비즈니스 로직 등이 포함되어 있다.

모델은 데이터를 얻거나 저장하거나 지우거나 업데이트에 대해 알고있다. 이 작업들은 뷰 모델에 의해 시작되며 모델이 데이터에 대한 작업을 마치면 뷰 모델에게 결과를 알린다.

모델은 뷰 모델이 소유하고 있고, 뷰나 뷰모델이 모델에 대해 들여다볼 수 없다.


### View(뷰)는 어떤 부분을 책임지고 있을까?

사용자 이벤트를 수신하고 데이터를 표시하는 유저 인터페이스를 책임진다.

(ViewController도 View의 일부)

해당 이벤트들은 뷰 모델에 전달되어 처리해야할 책임이 있고 뷰는 뷰 모델의 변경사항을 감지하고 뷰 모델이 업데이트한 데이터를 보여준다.

뷰와 모델 사이에 연결이 없고 뷰 모델에 의해 연결된다.


### ViewModel(뷰 모델)은 어떤 부분을 책임지고 있을까?

뷰 모델은 로직을 담당하고 있고, 유저가 뷰에서 어떤 액션을 취할 때 모델을 변경하거나 되었을 때 해당 모델을 업데이트하고 뷰 모델에게 결과를 알리고 뷰를 갱신하는 책임을 가지고 있습니다.


### 조금 더 자세하게 살펴보자

MVC에서 파생된 모델로 모델과 뷰 사이 뿐만 아니라 뷰와 컨트롤러 간의 의존성도 고려해 각 단위가 독립적으로 작성되고 테스트 될 수 있도록 설계된 패턴이다.

MVVM에서의 ViewModel은 View와 1:n 관계를 이룬다.


<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FOwzzZ%2FbtqARwRQICN%2FcVfDt48KVNpEZEASIjoMq0%2Fimg.png"/>

뷰 모델은 뷰를 나타내주기 위한 모델이자 Presentation Logic을 처리하는 역할을 한다.

따라서, 뷰에 어떤 뷰 모델을 연결하느냐에 따라 로직처리가 달라지고, 모델이 변경되면 관련된 뷰 모델을 사용하는 뷰가 자동으로 업데이트되는 방식이다.

각각의 뷰는 자신이 사용할 뷰 모델을 선택하여 바인딩하여 업데이트를 받게되고, 뷰는 단순히 유저 인터페이스를 표시하기 위한 로직만을 담당하며, 가장 이상적인 형태는 일부 유저 인터페이스를 제외하면 오로지 메소드를 호출하는 생성자만 존재하는 것이다.

뷰와 뷰 모델 간에는 데이터 바인딩을 통해 특정 뷰의 속성과 뷰 모델의 속성을 연결한 뒤 뷰 모델 속성이 변경되면 자동으로 뷰를 업데이트 한다.


### 장점

테스트 용이성이다.

뷰 모델에서는 UIKit 관련된 코드가 없으므로 UI에 독립적인 테스트를 할 수 있다.


### 단점

뷰 모델을 설계하는 것이 쉽지 않다.

뷰에 대한 처리가 복잡해질수록 뷰 모델이 거대해져 오버스펙이 될 수 있다.


### 예제 (Protocol Oriented MVVM)

뷰 모델을 프로토콜로 구성하면 코드가 더 간결해지고 명확해진다.

- Model

```swift
struct Person {
	let firstName: String
	let lastName: String
}
```

- View Model

```swift
// 프로토콜
protocol GreetingViewModelProtocol: class {
  var greeting: String? { get }
  var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set } 
  init(person: Person)
  func showGreeting()
}

// 뷰모델
class GreetingViewModel: GreetingViewModelProtocol {
  let person: Person
  var greeting: String? {
    didSet {
      self.greetingDidChange?(self)
    }
  }

  var greetingDidChange: ((GreetingViewModelProtocol) -> ())?

  required init(person: Person) {
    self.person = person
  }

  func showGreeting() {
    self.greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
  }
}
```

- View

```swift
class GreetingViewController: UIViewController {
  var viewModel: GreetingViewModelProtocol! {
    didSet {
      self.viewModel.greetingDidChange = { [unowned self] viewModel in
        self.greetingLabel.text = viewModel.greeting
      }
    }
  }

  let showGreetingButton = UIButton()
  let greetingLabel = UILabel()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.showGreetingButton.addTarget(self.viewModel, action: "showGreeting", forControlEvents: .TouchUpInside)
  }
}
```

```swift
// Assembling of MVVM
let model = Person(firstName: "David", lastName: "Blaine")
let viewModel = GreetingViewModel(person: model)
let view = GreetingViewController()
view.viewModel = viewModel
```

[Reference](https://gwangyonglee.tistory.com/49)