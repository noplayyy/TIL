# Change Button's Y Position

> EZY 개발을 하던 중 키보드가 활성화 됐을 때 버튼을 올려줘야하는 난관에 봉착했다..😱 다음 번에 만났을 땐 손쉽게 해결하기 위해서, 기억하기 위해서 이 TIL을 작성한다!🧐

사실 생각보단 방법이 간단하고 코드 또한 길지 않아 놀라웠다. 하지만 코드를 하나하나 이해하는 것 또한 중요하기에 작성하면서 다시 한 번 정리해보자!

- `UITextField`, `UIButton` 배치를 완료했다는 전제하에 진행한다.
- UITextField는 `textField`, UIButton은 `YButton`로 선언했다.

`keyboardWillShow`, `keyboardWillHide` 두 가지 function을 이용해 키보드가 보일 때, 보이지 않을 때 각각 변화를 주는 것이다.

## 어떻게 사용할까?😲

```swift
NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)

NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
```

## 버튼을 어떻게 올리는데?😲

다음은 `keyboardWillShow` 함수로 `YButton`의 `y` 위치를 올려주는 코드이다.

```swift
@objc
func keyboardWillShow(_ sender: Notification) {
    YButton.frame.origin.y = self.view.frame.height/1.7
}
```

### 세세하게 살펴보자🧐

- `keyboardWillShow` function은 **키보드가 보일 때** 일어나는 이벤트를 작성한다.
- `YButton.frame.origin.y`는 바로 읽을 수 있듯이 `YButton`의 `y` 위치 값을 말한다.
- `self.view.frame.height/1.7`은 바로 알 수 있으니 **PASS!**

### 한 마디로!🤔

키보드가 보일 때 `YButton`은 `view`의 `height` 값을 1.7로 나눈 위치에 존재한다는 것이다.

## 그럼 **키보드 높이** 만큼 올려주고 싶다면?🤯

아래의 코드를 한 번 살펴보자!!

```swift
@objc
func keyboardWillShow(_ sender: Notification) {
    var keyboardHeight: CGFloat = CGFloat(0)
    if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        let keyboardRectangle = keyboardFrame.cgRectValue
        keyboardHeight = keyboardRectangle.height
    }
    YButton.frame.origin.y -= keyboardHeight
}
```

### 세세하게 살펴보자🧐

- `keyboardHeight`라는 변수는 `CGFloat` 형식으로 키보드의 높이를 받아오는 변수이다.
- `if~` 구문은 사용자의 keyboardFrame을 받아온다.
- `keyboardRectangle`은 `keyboardFrame` 값을 받아온 상수이다.
- `keyboardHeight`는 `keyboardRectangle`의 `height`, 즉 **높이**를 받는다.
- `YButton`의 `y` 값을 `keyboardHeight`만큼 `-`하여 버튼은 키보드의 상단에 위치하게 된다.

### 한 마디로!🤔

키보드가 보일 때 사용자의 키보드 높이를 `keyboardHeight`에 저장하여 `y`값을 `-`하여 키보드의 상단에 `YButton`이 위치할 수 있게 한다는 것이다.

## 그럼 키보드가 사라졌을 때는?😲

다음은 `keyboardWillHide` 함수로 `YButton`의 `y` 위치를 다시 내려주는 코드이다.

```swift
@objc
func keyboardWillHide(_ sender: Notification) {
    YButton.frame.origin.y = self.view.frame.height - YButton.frame.height - self.view.frame.height/32.48
}
```

### 세세하게 살펴보자🧐

- `keyboardWillHide` function은 **키보드가 사라졌을 때** 일어나는 이벤트를 작성한다.
- `YButton.frame.origin.y` 값에 원래 `YButton`이 위치하고 있던 `y`값을 넣어준다.

### 한 마디로!🤔

키보드가 사라졌을 때 `YButton`은 원래 위치하고 있던 `y`에 돌아가는 것이다.

### 추가로 하나 덧붙이기📚

```swift
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    textField.resignFirstResponder()
}
```

이 코드를 작성해주면 `textField` 작성 중일 때 키보드가 아닌 다른 화면을 누르면 키보드가 닫힌다
