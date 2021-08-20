# Then

> **Then**은 사용하는 UI Property를 선언할 때 더 간결하게 작성할 수 있도록 도움을 주는 라이브러리이다.

### 어떻게 사용할까? 🧐

> Then은 **Trailing Closure** 형식을 사용한다.

```swift
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.text = "THEN"
        label.font = UIFont.boldSystemFont(ofSize: 25, weight: .heavy)
        label.textColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
```

이렇게 위와 같이 `myLabel`이라는 UILabel을 선언한다고 하면

```swift
    lazy var myLabel = UILabel().then {
        $0.text = "THEN"
        $0.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        $0.textColor = UIColor.blue
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
```

위와 같은 방식으로 사용이 가능하다.

혹은, Trailling Closure의 형식을 활용해

```swift
    lazy var myLabel = UILabel().then { m in
        m.text = "THEN"
        m.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        m.textColor = UIColor.blue
        m.translatesAutoresizingMaskIntoConstraints = false
    }
```

이런 방법으로도 사용이 가능하다.

> Then은 정말 한 번 사용해보면 빠져나올 수 없을 만큼 편리한 것 같다. 하지만 사용할 때, 사용하지 않을 때 두 가지 방법을 다 알고 있는 것은 중요하다! 👩‍💻
