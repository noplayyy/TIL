# SuperView가 nil..?

> 한전 kdn 소프트웨어 경진 대회 작품을 개발하다가 발생한 오류에 대한 몇 시간 삽질을 기록한다.

```swift
Fatal error: Expected superview but found nil when attempting make constraint `equalToSuperview`.
```

위 글은 발생한 오류의 전문이다.

그대로 직역하면 `superview`가 `nil`이다. 그러므로 `equalToSuperView`를 수행할 수 없다. 라는 의미이다.

당시에 `view`로 제작한 `alertView`를 `ViewController`에 불러오는 과정에 발생한 오류인데, 나는 이를 view 파일에서 준 **레이아웃의 오류로 생각**해서 계속해서 **레이아웃 수정만 반복했다.**

그러다가 문득 든 생각. 레이아웃 설정 호출을 먼저하고 `addSubView`를 했네..?

```swift
private func energyAlterViewSetting(){
    alterView.layoutSetting(sw: self.view.frame.width, sh: self.view.frame.height)

    alterView.backgroundColor = .white
    alterView.addSubview(alterView.monthLabel)
    alterView.addSubview(alterView.energyGraph)
    alterView.addSubview(alterView.energyLabel)
    alterView.addSubview(alterView.cancleButton)
    alterView.addSubview(alterView.okButton)
}
```

역시나 이런 상태였다. `layoutSetting`함수에서 위치를 잡는데 `addSubView`도 안 한 상태에서 하려니 당연히 위치를 잡을 수 없어 발생한 **Thread Error**였다!!

해결 방법은 간단하다.

```swift
private func energyAlterViewSetting(){
    alterView.backgroundColor = .white
    alterView.addSubview(alterView.monthLabel)
    alterView.addSubview(alterView.energyGraph)
    alterView.addSubview(alterView.energyLabel)
    alterView.addSubview(alterView.cancleButton)
    alterView.addSubview(alterView.okButton)

    alterView.layoutSetting(sw: self.view.frame.width, sh: self.view.frame.height)
}
```

둘의 위치를 바꿔주기만 하면 됐다.

이렇게 몇 시간 간의 허무한 삽질을 마쳤다.. 기본 중에 기본인데 View로 구현한 것을 가져오면서 범한 실수인 것이다..😭

**역시 오류가 발생하면 가장 먼저 기본부터 살펴봐야한다.**

##### 2021년 11월 22일(월) 장장 네 시간의 삽질 기록
