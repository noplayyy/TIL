# Filter

filter는 데이터를 추출하고자 할 때 사용한다.

기존 컨테이너에서 **내부의 값을 걸러** 새로운 컨테이너를 만든다.

filter 또한 map과 마찬가지로 for-in 문과 크게 다르지 않다.

### filter의 기본 형태

```swift
array.filter(isIncluded: T throws -> T)
```

T타입의 isIncluded를 받아 새로운 T형태의 컨테이너를 생성한다.

### for-in

```swift
let stringAttay = ["가수", "대통령", "개발자", "선생님", "의사", "검사", "건물주"]
var threeCountArray = [String]()
for st in stringAttay {
    if st.count == 3 {
        threeCountArray.append(st)
    }
}
print(threeCountArray)
// ["대통령", "개발자", "선생님", "건물주"]
```

### filter

```swift
let stringAttay = ["가수", "대통령", "개발자", "선생님", "의사", "검사", "건물주"]
let threeCountArray = stringAttay.filter { $0.count == 3 }
print(threeCountArray)
// ["대통령", "개발자", "선생님", "건물주"]
```

위 코드는 아래의 코드에서 **매개변수, 반환 타입, 반환 키워드(return)를 생략한 후행 클로저**입니다.

```swift
let stringAttay = ["가수", "대통령", "개발자", "선생님", "의사", "검사", "건물주"]
let threeCountArray = stringAttay.filter({ (value: String) -> Bool in
    return value.count == 3
})
print(threeCountArray)
// ["대통령", "개발자", "선생님", "건물주"]
```
