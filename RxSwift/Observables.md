# Observables

## Observables 관련 용어 및 기능

### Observable이란?

Observable이란 여러 이벤트들을 생성(emit)할 수 있는 대상을 말한다.

### sequence란?

Observable == Observable sequence == sequence 셋 모두 같은 표현으로 쓰인다.  
그렇다면 왜 이렇게 부를까?

> Observable life cycle
> ![Observable life cycle](images/ObservableLifeCycle.png)

> "Observe" 결과 사건들은 "sequence"라고 할 수 있다.
> ![Observable Sequence](images/ObserveSequence.png)

1. next: 구성요소를 계속해서 방출시킬 수 있는 기능 (=observable 구독자에게 데이터 전달)
2. completed: 이벤트를 종료시킬 수 있는 기능 (=observable 구독자에게 완료되었음을 알림)

- 그림에서 끝에 막대기가 세로로 있는 것(이미 일이 끝난 상태)

> completed  
> ![Observable Completed](images/ObservableCompleted.png)

3. error: 이벤트에 오류가 있음을 알고 중간에 종료시킬 수 있는 기능(observable 구독자에게 오류를 알림)

- 이벤트에 오류를 포함하고 있는 경우 "X"로 표현

> error  
> ![Observable Error](images/ObservableError.png)

## Observable(sequence) 생성

1. **Observable.just()**: 오직 하나의 요소를 포함하는 "Sequence" 생성

- [one, two, three]처럼 하나의 배열로도 삽입 가능

```swift
example(of: "just, of, from") {
    // 1
    let one = 1
    let two = 2
    let three = 3

    // 2
    let observable = Observable<Int>.just(one)
}
```

example 메소드

```swift
public func example(of description: String,
                    action: () -> Void) {
    print("\n--- Example of:", description, "---")
    action()
}
```

2. **Observable.of()**: 타입 추론을 이용하며 "Sequence" 생성

- 3개의 integer 값에 대한 sequence 생성

```swift
let observable2_1 = Observable.of(one, two, three)
```

.of()로 단일요소 만들기(.just()와 동일한 결과)
```swift
let observable3_1 = Observable.of([one, two, three])
let observable3_2 = Observable.just([one, two, three])
```

[one, two, three]와 (one, two, three)의 차이를 주의(단일 요소인 배열, 배열이 아닌 다중 요소)

3. Observable.from(): 오직 array 타입만 처리하며 각각 요소들을 하나씩 "emit"하는 기능
```swift
let observable4= Observable.from([one, two, three])
```

4. Observable.create()  
클로저 형식이며 다양한 값(onNext, onCompleted, ...)을 생성할 수 있음  
disposeBag: 쓰레기봉투

```swift
example(of: "create") {
    let disposeBag = DisposeBag()

    let observable = Observable<String>.create({ (observer) -> Disposable in
    
     })
}
```
