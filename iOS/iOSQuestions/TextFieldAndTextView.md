# TextField and TextView

### TextField 📝

**단일 줄**의 텍스트를 처리하는 데 용이하며, `UIView`를 상속 받았다.

### TextView 📚

**여러 줄**의 텍스트를 처리하는 데 용이하며, `UIScrollView`를 상속 받았다.

### 무슨 차이가 있을까? 🤔

줄 수의 차이가 있다고 볼 수 있다. 🧐

TextField는 `did done Exit` 이벤트를 통해 키보드 처리가 가능 하지만,
TextView는 원래 다중 줄의 처리를 목적으로 하기 때문에 `Done`이라는 이벤트 처리가 없다.

또한 `placeholder` 유무 차이가 있다.

TextField는 `placeholder`가 있지만,
TextView는 없다.
