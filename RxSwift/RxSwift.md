# RxSwift

## RxSwift란 무엇일까?

**관찰 가능한 연속성(순차적)형태**와 **함수 형태의 연산자**를 이용해 **비동기&이벤트를 위한 코드**로 구성하고 있는 라이브러리이다.  
그동안 사용하던 cocoa 코드에 결정적이고 비동기적인 방법을 이용하여 이벤트에 반응할 수 있도록 한다.

### 비동기&이벤트의 표현 => 관찰 가능한 순차적인 형태, 함수형태의 연산자

- 비동기 프로그래밍이 필요한 때

  - 버튼을 눌렀을 때의 반응
  - 텍스트필드에 포커스가 잡힌 경우
  - 인터넷에서 크기가 큰 이미지 파일을 받는 경우
  - 디스크에 데이터를 저장하는 경우
  - 오디오를 실행하는 경우

- UIKit을 통해 비동기를 사용했을 때
  - NotificationCenter: 백그라운드 진입 후 몇 초 있다가 메시지 알림
  - The delegate pattern: tableViewdml didSelectRowAt과 같은 메소드
  - closure

## 그럼 왜 RxSwift를 사용할까?

1. **RxSwift없이 비동기적인 측면에 접근했을 때의 상황**

   - 비동기 실행 코드를 이해하기 힘들다.: 애플의 API에서 제공하는 delegate 패턴을 그대로 사용할 뿐이지, 그 코드 자체는 속에 내장되어 있다.
   - 비동기 실행에 관한 명확한 추론을 하기가 힘들다.

   ex) 값을 예측하기 힘들다.
   버튼 클릭 이벤트가 몇 번 발생했는지 모르므로 currentIndex의 값을 코드 상에서 확인하기 힘들다.

   ```swift
   var array = [1, 2, 3]
   var currentIndex = 0

   @IBAction func printNext(_ sender: Any) {
       print(array[currentIndex])

       if currentIndex != array.count - 1 {
           currentIndex += 1
       }
   }
   ```

2. **MVVM과 밀접한 연관**
   MVVM의 배경: 데이터 바인딩을 제공하는 플랫폼에서 만들어진 이벤트 중심 프로그램을 위해 특별히 개발 됐다.
   RxSwift는 이와 연관성이 높다.

   ![MVVM](images/MVVM.png)

## RxSwift가 왜 필요할까?

1. **명시적으로 공유된 mutable state를 알기 위해서**

   > state: 컴퓨터를 오랫동안 켜놓으면 꺼질 수 있지만 SW와 HW는 처음과 같은 상태 -> state를 바뀌게 한 것은 "memory"  
   > 따라서 위 예에서 명시적으로 공유된 state는 "memory"라고 할 수 있다.

2. **Imperative Programming(명시적 코드)의 한계 극복**
   > 명시적 코드: 일반적으로 짰던 프로그램 방식 run(), getInstance()와 같은 컴퓨터에게 알려주는 프로그램  
   > 사람이 명시적 코드를 통해 비동기적 앱을 구현할 때 어려움이 따름  
   > (아래 코드 같은 경우, 순서를 조금 바꾸면 전혀 다른 메소드가 될 수 있다. - 비동기적인 어려움이 있다.)

```swift
override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    setupUI()
    connectUIControls()
    createDataSource()
    listenForChanges()
}
```

3. **Side Effects를 통해 state 파악**

- Side Effects는 코드의 현재 흐름에 대한 state를 표현  
  (위 코드에서 connectUIControls()가 실행되기 전에 Side Effects를 발생 시켜서 정보를 알 수 있게 함)
- Side Effects가 발생한다면, 그 메소드가 실행되기 전의 작업을 지정해줄 수 있는 장점

4. **Declarative code(선언적 코드)**

- 절차지향 프로그램과 함수형 프로그램의 균형성을 갖춘 형태가 RxSwift  
  Declarative code는 이벤트가 일어날 때 그 데이터에 대한 처리가 가능하며, for loop와 같은 작업 역시도 가능
- 절차지향 프로그램은 마음대로 상태를 변경하며, 함수형 프로그램은 side effect를 최소화 하는 코드를 지향

5. **Reactive System**

- Responsive: 언제나 UI를 최신 상태로 유지
- Resilient(탄력이 있는): 각 behavior들은 독립적이고 에러가 발생할 때 회복에 유연한 탄력적 특성
- Elastic(유연한): 다양한 workload를 처리(데이터 모음, 자원 공유 등)
- Message driven: components들은 메세지 기반으로 상호작용 하므로 재사용성의 장점과 lifecycle과 클래스의 구현을 분리

## Rx의 3요소

1. **Observables\<Data>**
   객체에 이벤트나 값 추가, 수정 등과 같은 것을 가능하게끔 해준다.

- event 종류: next event, completed event, error event

ex1) API.download(file:)은 Observable\<Data> 인스턴스를 반환  
subscribe클로저를 한 후, 또다시 Observable형태의 onError나 onCompleted 상태 반환

```swift
API.download(file: "http://www...")
    .subscribe(onNext: { data in
        // Append data to temporary file
    },
    onError: { error in
        // Display error to user
    }.
    onCompleted: {
        // Use downloaded file
    })
```

ex2) 디바이스를 가로로 할지, 세로로 할지 정하는 코드

```swift
UIDevice.rx.orientation
    .subscribe(onNext: { current in
        switch current {
        case .landscape:
            // Re-arrange UI for landscape
        case .portrait:
            // Re-arrange UI for portrait
        }
    })
```

2. **Operators**  
   마치 연산자와 같이 "비동기들은 highly decoupled and composable"  
   옵저버에서 나온 결과를 Rx연산자를 통해 입력 및 출력이 가능 -> side effect 발생 가능

ex) showAlert와 같이 옵저버에서 나온 결과에서 Rx연산자를 사용하여 경고문(side effect) 발생

```swift
UIDevice.rx.orientation
  .filter { value in
    return value != .landscape
  }
  .map { _ in
    return "Portrait is the best!"
  }
  .subscribe(onNext: { string in
    showAlert(text: string)
  })
```

![Operators](images/Operators.png)

-> filter는 가로가 아닌 값만 통과  
-> .map에서 문자열을 리턴  
-> 위에서 문자열 받아서 alert 실행

3. **Schedulers**
   기존에 사용하던 DispatchQueue와 기능 동일  
   ![Schedulers](images/Schedulers.png)

| RxSwift                         | Normal                                |
| :------------------------------ | :------------------------------------ |
| Main Thread Serial Scheduler    | Main thread scheduler                 |
| Background Concurrent Scheduler | concurrent Background GCD queue       |
| Custom NSOperation Scheduler    | custom OperationQueue-based scheduler |

## RxCocoa란?

![RxCocoa](images/RxCocoa.png)

1. 개념
   RxCocoa란 "UIKit 및 Cocoa개발을 지원하는 클래스"를 보유하고 있는 RxSwift 동반 라이브러리이다.

- 다양한 UI 구성 요소에 대한 반응형 확장(reactive extensions)기능을 추가하여 UI 이벤트를 추가 기능

ex) UISwitch에서의 Rx

```swift
toggleSwitch.rx.isOn
  .subscribe(onNext: { isOn in
    print(isOn ? "It's ON" : "It's OFF")
  })
```

2. 사용  
   코코아 팟에서 설치

```ruby
use_frameworks!

target 'MyTargetName' do
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
end
```

[Reference](https://ios-development.tistory.com/95)
