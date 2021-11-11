# SnapKit

> **SnapKit**은 UI Layout을 더 간결한 코드로 편리하게 작성할 수 있도록 도와주는 라이브러리이다.

**install** 하는 방식은 [How to install SnapKit](How_to_install_SnapKit.md)에서 정리해뒀다.

### Code 해석하기

```swift
make.top.equalTo(first.snp.bottom).offset(32)
```

- `->` 방향으로 해석
- 상단을 `first`의 `bottom`과 같게 한다.
- `offset`은 32

## Anchor

- 모든 anchor와 제약조건을 연결하는 것이 가능하다.

```swift
second.snp.makeConstraints { make in
  make.lead.top.trailing.bottom.equalToSuperview()
}
```

- `edges`라는 속성을 사용해 위와 같이 연결 할 수 있다.

```swift
secode.snp.makeConstraints { make in
  make.edges.equalToSuperview()
}
```

- `inset`을 주고싶은 경우 사용할 수 있다.

```swift
child.snp.makeConstraints { make in
  make.edges.equalToSuperview().inset(16)
}
```

## Constraint

- `multipliedBy()` & `dividedBy()`

```swift
// superview의 너비와 같게 만들고 0.7을 곱한 형태
make.width.equalToSuperview().multipliedBy(0.7)

// superview의 너비와 같게 만들고 0.7을 나눈 형태
make.width.equalToSuperview().dividedBy(0.7)
```

- `offset()`

```swift
// 상단을 first의 하단으로 제한하고, 32만큼 offset
make.top.equalTo(first.snp.bottom).offset(32)
```

### `offset()` vs `inset()`

- **offset()**: element와의 간격에 사용.
- **inset()**: superview와의 간격에 사용.

```swift
first.snp.makeConstraints { make in
    make.top.equalToSuperview().offset(50)
    make.left.equalToSuperview().offset(50)
    make.right.equalToSuperview().offset(-50)
    make.bottom.equalToSuperview().offset(-50)
}
```

```swift
first.snp.makeConstraints { make in
    make.edges.equalToSuperview().inset(UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
}

//make.edges.equalToSuperview().inset(50)
```

## 암시

- constraint 기준이 되는 View의 width, point를 지정해주지 않아도 암시적으로 동일하도록 설정
- constraint 기준이 되는 View의 값을 최대한 짧게 작성할 수 있도록 도와준다.

```swift
view.snp.makeConstraints { make in
  make.width.equalTo(otherView.snp.width)
  make.centerX.equalTo(otherView.snp.centerX)
}

view.snp.makeConstraints { make in
  make.width.equalTo(otherView)
  make.centerX.equalTo(otherView)
}

view.snp.makeConstraints { make in
  make.width.centerX.equalTo(otherView)
}
```

## updateConstraint

- constraint 기준이 될 기존에 지정한 view가 바뀌는게 아닌 constant value만 업데이트 하고 싶은 경우

```swift
extension ViewController {
  override func willTransition(
    to newCollection: UITraitCollection,
    with coordinator: UIViewControllerTransitionCoordinator
    ) {
    super.willTransition(to: newCollection, with: coordinator)

    // 현재 방향
    let isPortrait = UIDevice.current.orientation.isPortrait

    // 방향에 따른 label 높이 값 조정
    test.snp.updateConstraints { make in
      make.height.equalTo(isPortrait ? 45 : 65)
    }

    // 방향에 따른 font 크기 값 조정
    test.font = UIFont.systemFont(ofSize: isPortrait ? 20 : 32, weight: .light)
  }
}
```

## remakeConstraint

- constant value만 변경되는게 아닌 기준이 될 view도 바뀌는 경우
- 기본에 존재하던 constraints 삭제

```swift
test.snp.remakeConstraints { make in
  make.top.equalTo(view.safeAreaLayoutGuide)
  make.width.equalToSuperview().multipliedBy(0.5)
  make.height.equalTo(32)
  make.leading.equalToSuperview()
}
```

#### `lessThanOrEqualTo`, `priority` 라는 속성도 있다.

- lessThanOrEqualTo() 추가하여 사용
- priority() 추가하여 사용
