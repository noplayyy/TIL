# Map

map은 데이터를 변형하고자 할 때 사용한다.

**기존 데이터를 변형**하여 새로운 컨테이너를 만드는데, 기존 데이터는 변형되지 않습니다.

특히 map은 기존의 for - in 구문과 큰 차이가 없지만, map 사용시 다음과 같은 이점이 있다.

- 코드의 **간결성**
- **재사용** 용이
- 컴파일 최적화 **성능 좋음**

### map의 기본 형태

```swift
array.map(transform: T throws -> T)
```

T type의 transform을 받아 새로운 T type의 컨테이너를 생성한다는 이야기이다.

#### for-in

```swift
let numArray = [1,3,5,7,9]
var multiArray = [Int]()
for num in numArray {
    multiArray.append(num * 2)
}
print(multiArray)
// [2, 6, 10, 14, 18]
```
