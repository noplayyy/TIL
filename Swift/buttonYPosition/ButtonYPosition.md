# Change Button's Y Position

> EZY 개발을 하던 중 키보드가 활성화 됐을 때 버튼을 올려줘야하는 난관에 봉착했다..😱 다음 번에 만났을 땐 손쉽게 해결하기 위해서, 기억하기 위해서 이 TIL을 작성한다!🧐

사실 생각보단 방법이 간단하고 코드 또한 길지 않아 놀라웠다. 하지만 코드를 하나하나 이해하는 것 또한 중요하기에 작성하면서 다시 한 번 정리해보자!

- `UITextField`, `UIButton` 배치를 완료했다는 전제하에 진행한다.
- UITextField는 `textField`, UIButton은 `YButton`로 선언했다.

`keyboardWillShow`, `keyboardWillHide` 두 가지 function을 이용해 키보드가 보일 때, 보이지 않을 때 각각 변화를 주는 것이다.


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
키보드가 보일 때 `YButton`은 `view`의 `height`를 1.7로 나눈 위치에 존재한다는 것이다.


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

```swift
@objc
func keyboardWillHide(_ sender: Notification) {
    YButton.frame.origin.y = self.view.frame.height - YButton.frame.height - self.view.frame.height/20
}
```

```swift
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    textField.resignFirstResponder()
}
```

```swift
NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)

NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
```
