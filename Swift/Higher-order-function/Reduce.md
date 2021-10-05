# Reduce

reduce는 데이터를 합쳐주기 위해 사용한다.

기존 컨테이너에서 **내부의 값들을 결합**하여 새로운 값을 만든다.

reduce를 이해하기 위해 숫자 합 예제를 살펴보자.

### for-in

```swift
let numberArray = [1,2,3,4,5,6,7,8,9,10]
var sum = 0
for number in numberArray {
    sum += number
}
print(sum)
// 55
```

### reduce

```swift
let numberArray = [1,2,3,4,5,6,7,8,9,10]
let sum = numberArray.reduce(0) { $0 + $1 }
print(sum)
// 55
```

위 코드는 아래의 코드에서 **매개변수, 반환 타입, 반환 키워드(return)를 생략한 후행 클로저**입니다.

```swift
let numberArray = [1,2,3,4,5,6,7,8,9,10]
let sum = numberArray.reduce(0, { (first: Int, second: Int) -> Int in
    return first + second
})
print(sum)
// 55
```
