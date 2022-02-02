# 키보드 입력 레이아웃 이슈 해결

[이전](/Swift/Programmatically/Example/ButtonYPosition/ButtonYPosition.md)에 작성한 방법을 사용해 위치를 조절하면 키보드 입력 시 버튼이 사라지는 오류가 발생했다.

### 해결 방법

`remakeConstraints`를 사용하자!

```swift
@objc
func keyboardWillShow(_ sender: Notification) {
    var keyboardHeight: CGFloat = CGFloat(0)
    if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        let keyboardRectangle = keyboardFrame.cgRectValue
        keyboardHeight = keyboardRectangle.height
    }
    YButton.snp.remakeConstraints { make in
        make.left.equalToSuperview().offset(self.view.frame.width/17)
        make.centerX.equalToSuperview()
        make.height.equalToSuperview().dividedBy(16.24)
        make.bottom.equalToSuperview().offset(-keyboardHeight - self.view.frame.height/32.48)
    }
}
```

```swift
@objc // 키보드가 숨겨지면 다시 원 상태
func keyboardWillHide(_ sender: Notification) {
    YButton.snp.remakeConstraints { make in
        make.left.equalToSuperview().offset(self.view.frame.width/17)
        make.centerX.equalToSuperview()
        make.height.equalToSuperview().dividedBy(16.24)
        make.bottom.equalToSuperview().offset(self.view.frame.height/32.48 * -1)
    }
}
```
