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

```swift
second.snp.makeConstraints { make in
  make.lead.top.trailing.bottom.equalToSuperview()
}
```

- 모든 anchor와 제약조건을 연결하는 것이 가능하다.

```swift
secode.snp.makeConstraints { make in
  make.edges.equalToSuperview()
}
```

- `edges`라는 속성을 사용해 위와 같이 연결 할 수 있다.

```swift
child.snp.makeConstraints { make in
  make.edges.equalToSuperview().inset(16)
}
```

- `inset`을 주고싶은 경우 사용할 수 있다.
