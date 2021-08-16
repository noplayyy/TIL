## Widget

### 위젯은 어떻게 작동할까?

위젯은 앱의 확장 기능으로 작동한다. 독립형 앱 자체로는 작동하지 않는다. 위젯은 세가지 크기(Small, Medium, Large)로 제공되며 정적이거나 구성 가능할 수 있습니다. 위젯은 상호 작용 측면에서 제한된다. 스크롤은 할 수 없고 탭만 할 수 있다. 작은 위젯은 한 가지 유형의 상호 작용 영역만 가질 수 있는 반면 중간 및 큰 위젯은 여러 개의 탭 가능한 상호 작용 영역을 가질 수 있다. 위젯은 SwiftUI로만 작성할 수 있다.

<img src = "https://miro.medium.com/max/724/1*CvSzY2ADTzv7he7pDBXx1Q.png">

WidgetKit을 사용하여 앱의 아키텍처를 살펴 보자. 앱은 기본적으로 UIKit 또는 SwiftUI 프로젝트이다. 위젯은 앱 외부의 확장 기능처럼 작동한다. iOS / iPadOS 홈화면 또는 macOS의 알림 센터에 표시 될 수 있다.

공유 논리는 두 대상 멤버십 또는 공유 프레임 워크간에 고유되는 일부 파일일 수 있다. 재사용 가능한 코드가 포함 된 프레임 워크를 사용하는 것이 좋다. 또한 코드베이스가 책임을 지는 데 도움이 된다.

## 위젯의 템플릿 파일 이해

### TimelineProvider

TimelineProvider는 위젯의 중요한 부분이다. 위젯에 대한 향후 업데이트의 모든 정보를 iOS에 제공한다.

```swift
public func placeholder(in context: Self.Context) -> Self.Entry
```

```swift
public func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ())
```

WidgetKit은 매개 변수에 컨텍스트를 제공하므로 위젯이 갤러리에서 미리보기 되는지 여부, 위젯 패밀리 크기, 위젯의 실제 크기를 알 수 있다.

완료는 비동기 작업을 완료했음을 시스템에 알린다.

```swift
public func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ())
```

완료 시 반환해야하는 Timeline 객체는 두 개의 매개 변수를 사용한다. 타임 라인 항목 및 정책. 타임 라인 항목의 마지막 날짜 이후 또는 특정 시간 이후에 위젯 업데이트가 절대 불가능할 수 있는 방법에 대한 정책이다.

### SimpleEntry

SimpleEntry는 TimelineEntry의 프로토콜을 따르는 단순한 개체이다. 날짜는 위젯을 업데이트해야 할 때 iOS에 알려주기 때문에 중요하다. 뷰에 대한 모델을 추가 속성으로 추가하여 데이터를 위젯에 쉽게 바인딩 할 수 있다.

### RiddleWidgetEntryView

EntryView는 현재 타임 라인 항목을 매개 변수로 사용하여 홈 화면에 표시되는 위젯의 SwiftUI 보기이다.

### RiddleWidget

RiddleWidget은 프로토콜 위젯을 따른다. 일부 유형의 WidgetConfiguration 본문이 있어야한다.

Apple SDK가 제공하는 두 가지 유형의 WidgetConfiguration이 있다. 구성 가능한 위젯을 원하지 않으므로 여기서는 StaticConfiguration을 사용한다.

사용자가 구성 가능한 위젯을 원할 경우, IntentConfiguration 뿐만 아니라 Siri Intent도 생성해야한다.

[Reference](https://ichi.pro/ko/ios-hom-hwamyeon-eul-wihan-gandanhan-wijes-mandeulgi-57395460212602)
