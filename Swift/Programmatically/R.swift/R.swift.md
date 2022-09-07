# R.swift

> 회사 온보딩 업무를 위해서 R.swift라는 라이브러리에 대해 이해도를 높여보자.

## R.swift란?

이미지나 색상, Storyboard에 접근을 할 때 우리는 `String`기반으로 접근을 한다.  
그런데 이런 방식에는 문제가 있는데,

- 이미지나 색상이 삭제되어도 빌드가 되며, 실행 중 에러를 발생시킨다. (뒤늦게 크래시가 발생)
- 이미지 이름을 타이핑해서 불러오면 오타가 발생할 수 있고, 이 역시 나중에 런타임 에러를 발생시킨다.

이 문제점을 해결하기 위해 만들어진 라이브러리이다.

R.swift는 프로젝트에서 Image, Font, Color와 같은 리소스에 대해서 autocomplete & strong type을 얻을 수 있게 해준다.

## 사용 방법 알아보기

```swift
let icon = UIImage(named: "settings-icon")
let font = UIFont(name: "San Francisco", size: 42)
let color = UIColor(named: "indicator highlight")
let viewController = CustomViewController(nibName: "CustomView", bundle: nil)
let string = String(format: NSLocalizedString("welcome.withName", comment: ""), locale: NSLocale.current, "Arthur Dent")
```

위와 같이 불러오던 속성들을

```swift
let icon = R.image.settingsIcon()
let font = R.font.sanFrancisco(size: 42)
let color = R.color.indicatorHighlight()
let viewController = CustomViewController(nib: R.nib.customView)
let string = R.string.localizable.welcomeWithName("Arthur Dent")
```

이렇게 불러올 수 있다.

## R.swift에 대한 정보들을 더 알아보기

### 왜 이름이 R일까?

안드로이드에서는 모든 리소스가 자동을 프로젝트의 R클래스에 정의된다. 그래서 R.string.hello 이런 식으로 접근이 가능하다.  
iOS에는 위와 같은 클래스가 없기에 라이브러리 이름을 R.swift로 지었다고 한다.

### 왜 SwiftGen, Shark, Natalie가 아닌 R.swift를 쓸까?

R.swift는 폴더를 스캔하거나 파일을 요청하는 대신 Xcodeproj 파일에서 리소스를 검사한다.  
R.swift는 다양한 asset을 지원한다.  
R.swift는 바닐라 애플 API와 매우 가깝다. 작은 코드 변화지만 큰 영향을 준다.

### R.swift는 어떻게 작동할까?

빌드 할 때 마다 R.swift가 실행된다.  
Xcode 프로젝트 파일을 보고, 현재 빌드 Target과 연결된 모든 리소스를 검사한다.  
모든 리소스에 대한 타입 참조가 포함된 struct를 포함한 R.generated.swift 파일을 생성한다.

iOS에서는 문자열을 통한 리소스 참조라서 무조건 컴파일을 하고, 런타임에 실패하는 문자열을 통한 리소스 참조는 리팩토링을 어렵게 하고 버그를 쉽게 만드는 방식 같다.  
이런 문제를 해결하기 위해 만들어진 R.swift를 잘 활용하면 더 좋은 코드를 만들 수 있지 않을까? 라는 생각이 든다.

[R.swift 사용하기](https://github.com/mac-cain13/R.swift)  
[Reference](https://zeddios.tistory.com/1016)
