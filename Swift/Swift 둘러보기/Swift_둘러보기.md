# Swift 둘러보기

### 변수와 상수

변수 variable는 값을 수정할 수 있고, 상수 constant는 그렇지 않다. Swift에서는 언제 어디서 값이 어떻게 바뀔지 모르는 변수보다는 상수를 사용하는 것을 권장한다. 그래야 안전하다.

변수는 `var` 로 선언하고 상수는 `let` 으로 선언한다.

```swift
var name = "Yeonju Noh"
let birthyear = 2004
```

나중에 만약 이름을 바꾸고 싶다면 바꿀 수 있다.

```swift
name = "노연주"
```

하지만, 아래와 같이 태어난 해를 바꾸려 하면 컴파일 에러가 발생한다.

```swift
birthyear = 2000 // 컴파일 에러
```

> Cannot assign to value: 'birthyear' is a 'let' constant

`let` 키워드로 선언된 상수의 값을 변경할 수 없다는 에러이다. 이렇게 바뀌면 안되는 값을 상수로 정의해두면 편하다.

Swift는 정적 타이핑 언어이다. 변수나 상수를 정의할 때 그 자료형(타입)이 어떤 것인지를 명시해주어야하는 언어이다. 예를 들면 이런 것이다.

```swift
var name: String = "Yeonju Noh"
let birthyear: Int = 2004
var height: Float = 163.1
```

`name` 은 `String`이고, `birthyear`는 `Int`고, `height`은 `Float`타입이다. 이렇게 변수 또는 상수 이름 뒤에 콜론(`:`)을 붙이고 자료형을 써주면 된다. 이때 사용하는 `:String` 과 `:Int` 등을 가지고 타입 어노테이션 Type Annotation이라고 한다.

Swift에서는 타입을 굉장히 엄격하게 다루기 때문에, 다른 자료형끼리는 기본적인 연산조차 되지 않는다. 아래와 같이 `Int` 타입인 `birthyear` 와 `Float` 타입인 `height` 을 더하려 하면 컴파일 에러가 발생한다.

```swift
birthyear + height // 컴파일 에러!
```

> Binary operator '+' cannot be applied to operands of type 'Int' and 'Float'

이럴 때에는 명확하게 다음과 같이 사용해야한다.

```swift
Floar(birthyear) + height // 2167.1
```

조금 더 응용하면 아래와 같이 숫자를 문자열로 만들 수도 있다.

```swift
String(birthyear) + "년에 태어난 " + name + "야 안녕!" // 2004년에 태어난 노연주야 안녕!
```

더 간단하게 작성할 수도 있다.

```swift
"\(birthyear)년에 태어난 \(name)야 안녕!" // 2004년에 태어난 노연주야 안녕!
```

---

### 타입 추론(Type Inference)

생각해보면  우리가 처음에 사용한 예제에서는 자료형을 명시하지 않았다. 그런데도 우리는 `name` 이 문자열이라는 것을 알았고, `birthyear` 가 정수형이라는 것을 알았다.

Swift 컴파일러도 마찬가지로, 큰 따옴표(`"`)로 감싸진 텍스트는 `String` 타입인 것을 알고, 숫자는 `Int` 타입인 것을 인식할 수 있다. 이렇게 타입을 직접 명시하지 않고도 값을 가지고 정적 타이핑을 할 수 있게 해주는 것을 타입 추론 Type Inference이라고 한다.

---

### 배열(Array)과 딕셔너리(Dictionary)

배열과 딕셔너리는 모두 대괄호 (`[]`)를 이용해서 정의할 수 있다.

```swift
var languages = ["Swift", "Objective-C", "Python"]
var capitals = [
	"한국": "서울",
	"일본": "도쿄",
	"중국": "베이징",
]
```

배열과 딕셔너리에 접근하거나 값을 변경할 때도 대괄호를 사용한다.

```swift
languages[0] //Swift
languages[1] = "Ruby"

capitals["한국"] // 서울
capitals["프랑스"] = "파리"
```

참고로, 다른 상수와 마찬가지로 배열과 딕셔너리를 `let` 으로 정의하면 값을 수정할 수 없다. 물론 값을 추가하거나 빼는 것도 불가능하다.

위에서 정의해본 `languages` 와 `capitals` 의 타입은 대괄호를 사용한다. 

```swift
var languages: [String] = ["Swift", "Object-C", "Python"]
var capitals" [String: String] = [
	"한국": "서울",
	"일본": "도쿄",
	"중국": "베이징",
]
```

만약 빈 배열이나 빈 딕셔너리를 정의하고 싶다면 또한 대괄호를 쓴다. 배열 딕셔너리는 대괄호로 시작해서 대괄호로 끝나는 것이다.

```swift
var languages: [String] = []
var capitals: [String: String] = [:]
```

빈 배열로 선언하는 것을 조금 더 간결하게 하고싶다면 이런 식으로 할 수 있다.

```swift
var languages = [String]()
var capitals = [String: String]()
```

타입 뒤에 괄호 `()` 를 쓰는 것은 생성자 Initializer를 호출하는 것이다.  

---

### 조건문과 반복문

조건을 검사할 때에는 `if` , `switch` 를 쓴다. 아래 코드는 `if` 를 사용한 예시이다.

```swift
var age = 19
var student = ""

if age >= 8 && age < 14 {
	student = "초등학생"
} else if age < 17 {
	student = "중학생"
} else if age < 20 {
	student = "고등학생"
} else {
	student = "기타"
}

student // 고등학생
```

`if` 문의 조건절에는 값이 정확하게 참 혹은 거짓으로 나오는 `Bool` 타입을 사용해야한다. 위에서 언급한 것과 같이 Swift에서는 타입 검사를 굉장히 엄격하게 하기 때문에, 다른 언어에서 사용 가능한 아래와 같은 코드를 사용하지 못한다.

```swift
var number = 0
if !number { // 컴파일 에러!
	// ...
}
```

> Unary operator '!' cannot be applied to an operand of type 'Int'

이렇게 적어줘야한다.

```swift
if number == 0 {
	// ...
}
```

빈 문자열이나 배열 등을 검사할 때에도 명확하게 길이가 0인지를 검사해야한다.

```swift
if name.isEmpty {...}
if languages.isEmpty {...}
```

만약 C나 Java와 같은 프로그래밍 언어를 사용해봤다면 `switch` 는 단순히 값이 '같은지'만을 검사하는 것으로 알고 있을 것이다. Swift의 `switch` 구문은 조금 특별하다. 패턴 매칭이 가능하기 때문이다. 아래 코드는 위에서 작성한 `if` 문을 `switch` 문으로 옮겨본 것이다.

```swift
switch age {
case 8..<14:
	student = "초등학생"
case 14..<17:
	student = "중학생"
case 17..<20:
	student = "고등학생"
default:
	student = "기타"
}
```

`8..<14` 와 같이 범위 Range안에 `age` 가 포함되었는지 여부를 검사할 수 있다. 반복되는 연산을 할 때에는 `for` , `while` 을 쓴다. `for` 구문을 사용해서 배열과 딕셔너리를 차례로 순환할 때에는 아래와 같이 쓴다.

```swift
for language in languages {
  print("저는 \(language) 언어를 다룰 수 있습니다.")
}

for (country, capital) in capitals {
  print("\(country)의 수도는 \(capital)입니다.")
}
```

단순한 반복문을 만들고 싶다면 범위를 만들어서 반복시킬 수도 있다.

```swift
for i in 0..<100 {
	i
}
```

만약 `i` 를 사용하지 않는데 단순한 반복을 하고 싶다면, `i` 대신 `_` 를 사용해서 무시할 수 있다.

```swift
for _ in 0..<10 {
	printf("Hello!")
}
```

`_` 키워드는 어디서나 변수 이름 대신에 사용할 수 있다. 알아두면 유용하게 사용할 수 있다.

`while` 은 조건문의 값이 `true` 일 때 계속 반복된다.

```swift
var i = 0
while i < 100 {
	i += 1
}
```

---

## 옵셔널 (Optional)

Swift가 가지고 있는 가장 큰 특징 중 하나가 바로 옵셔널 Optional 이다. 직역하면 '선택적인'이라는 뜻이 되는데, 값이 있을 수도 없을 수도 있는 것을 나타낸다.

예를 들면 문자열의 값이 있으면 `"가나다"` 가 될 것이다. 그럼, 값이 없다면 `""` 일까? 그렇지 않다. `""` 도 엄연히 값이 있는 문자열이다. 정확히는 '값이 없다'가 아니고 '빈 값'이다. 값이 없는 문자열은 바로 `nil` 이다.

또 다른 예를 들면 정수형의 값이 있으면 `123` 과 같은 값이 있을 것이다. 값이 없다면 `0` 일까? 마찬가지로 `0` 은 `0` 이라는 숫자 '값'이다. 이 경우에도 값이 없는 정수는 `nil` 이다.

마찬가지로, 빈 배열이나 빈 딕셔너리라고 해서 '값이 없는' 것이 아니다. 다만 '비어 있을' 뿐이다. 배열과 딕셔너리의 경우에도 '없는 값'은 `nil` 이다.

이렇게, 값이 없는 경우를 나타낼 때에는 `nil` 을 사용한다. 그렇다고 해서 모든 변수에 `nil` 을 넣을 수 있는 것은 아니다. 예로, 우리가 위에서 정의한 `name` 이라는 변수에 `nil` 을 넣으려 하면 에러가 발생한다.

```swift
var name: String = "노연주"
name = nil // 컴파일 에러!
```

> Nil cannot be assigned to type 'String'

값이 있을 수도 있고 없을 수도 있는 변수를 정의할 때에는 타입 어노테이션에 `?` 를 붙여야한다. 이렇게 정의한 변수를 바로 옵셔널 Optional이라고 한다. 옵셔널에 초깃값을 지정하지 않으면 기본값은 `nil`이다.

```swift
var email: String?
print(email) //nil

email = "yjnoh1016@naver.com"
print(email) // Optional("yjnoh1016@naver.com")
```

옵셔널로 정의한 변수는 옵셔널이 아닌 변수와 다르다. 예를 들어, 아래와 같은 코드는 사용할 수 없다.

```swift
let optionalEmail: String? = "yjnoh1016@naver.com"
let requiredEmail: String = optionalEmail // 컴파일 에러!
```

> Value of optional type 'String?' not unwrapped; did you mean to use '!' or '?'?

`requiredEmail` 변수는 옵셔널이 아닌 `String` 이기 때문에 항상 값을 가지고 있어야 한다. 반면에, `optionalEmail` 은 옵셔널로 선언된 변수이기 때문에 실제 코드가 실행되기 전까지는 값이 있는지 없는지 알 수 없다. 따라서 Swift 컴파일러는 안전을 위해 `requiredEmail` 에는 옵셔널로 선언된 변수를 대입할 수 없게 만들었다.

옵셔널은 개념적으로 이렇게 표현할 수 있다. 어떤 값 또는 `nil` 을 가지고 있는 것이다.

```markdown
				,-- 어떤 값 (String, Int, ...)
Optional
        `-- nil
```

### 옵셔널 바인딩 (Optional Binding)

---

그럼 옵셔널의 값을 가져오고 싶은 경우에는 어떻게 하면 될까? 이 때 사용하는 것이 바로 옵셔널 바인딩 Optional Binding이다.

옵셔널 바인딩은 옵셔널의 값이 존재하는 지를 검사한 뒤, 존재한다면 그 값을 다른 변수에 대입시켜준다. `if let` 또는 `if var` 를 사용한다. 옵셔널의 값을 벗겨서 값이 있다면 `if` 문 안으로 들어가고, 값이 `nil` 이라면 그냥 통과하게 된다.

예를 들어, 아래의 코드에서 `optionalEmail` 에 값이 존재하다면 `email` 이라는 변수 안에 실제 값이 저장되고, `if` 문 안으로 들어가고, 값이 `nil` 이라면 그냥 통과하게 된다.

예를 들어, 아래 코드에서 `optionalEmail` 에 값이 존재한다면 `email` 이라는 변수 안에 실제 값이 저장되고, `if` 문 내에서 그 값을 사용할 수 있다. 만약 `optionalEmail` 이 `nil` 이라면 `if` 문 안으로 진입한다.

```swift
var optionalName = String? = "노연주"
var optionalEmail: String? = "yjnoh1016@naver.com"

if let name = optionalName, email = optionalEmail {
	// name과 email 값이 존재
}
```

> 코드가 너무 길 경우에는, 이렇게 여러 줄에 걸쳐서 사용하는 것이 바람직하다.

```swift
if let name = optionalName,
	let email = optionalEmail {
	// name과 email 값이 존재
}
```

> 참고로, 두 번째 `let` 부터는 생략이 가능하다.

위 코드는 아래 코드와 동일하다.

```swift
if let name = optionalName {
	if let email = optionalEmail {
	// name과 email 값이 존재
	}
}
```

> 한 번의 `if` 문에서 여러 옵셔널을 바인딩할 수 있게 된 것은 Swift 1.2 버전부터이다. 이전 버전까지는 바로 위와 같이 여러 번으로 감싸진 옵셔널 바인딩을 사용했다.

옵셔널을 바인딩할 때 `,` 를 사용해서 조건도 함께 지정할 수 있다. `,` 이후의 조건절은 옵셔널 바인딩이 일어난 후에 실행된다. 즉, 옵셔널이 벗겨진 값을 가지고 조건을 검사하게 된다.

```swift
var optionalAge: Int? = 22

if let age = optionalAge, age >= 20 {
	// age의 값이 존재하고, 20 이상이다.
}
```

위 코드는 아래와 동일하다.

```swift
if let age = optionalAge {
	if age >= 20 {
		// age의 값이 존재하고, 20 이상이다.
	}
} 
```

### 옵셔널 체이닝 (Optional Chaining)

---

Swift 코드를 간결하게 만들어주는 많은 요소들이 있는데, 옵셔널 체이닝 Optional Chaining을 알게되면 다른 프로그래밍 언어가 조금 불편하게 느껴지는 경우가 생긴다.

코드가 이해에 조금 더 도움이 된다. 어떤 배열이 '빈 배열'인지를 검사하려면 `nil`이 아니면서 빈 배열인지를 확인해보면 된다. 이렇게

```swift
let array: [String]? = []
var isEmptyArray = false

if let array = array, array.isEmpty {
	isEmptyArray = true
} else {
	isEmptyArray = false 
}

isEmptyArray
```

옵셔널 체이닝을 사용하면 이 코드를 더 간결하게 쓸 수 있다.

```swift
let isEmptyArray = array?.isEmpty == true
```

옵셔널 체이닝은 옵셔널의 속성에 접근할 때, 옵셔널 바인딩 과정을 `?` 키워드로 줄여주는 역할을 한다. 다음과 같이 3가지 경우의 수를 생각해보자.

- `array` 가 `nil` 인 경우

    ```swift
    array?.isEmpty
    ~~~~~
    여기까지 실행되고 `nil`을 반환한다.
    ```

- `array`가 빈 배열인 경우

    ```swift
    array?.isEmpty
    ~~~~~~~~~~~~~~
    여기까지 실행되고 `true`을 반환한다.
    ```

- `array` 에 요소가 있는 경우

    ```swift
    array?.isEmpty
    ~~~~~~~~~~~~~~
    여기까지 실행되고 `false`을 반환한다.
    ```

`array?.isEmpty` 의 결과로 나올 수 있는 값은 `nil` , `true` , `false` 가 된다. `isEmpty` 의 반환값은 `Bool` 인데, 옵셔널 체이닝으로 인해 `Bool?` 을 반환하도록 바뀐 것이다. 따라서 값이 실제로 `true` 인지를 확인하려면, `==true` 를 해주어야한다.

### 옵셔널 벗기기

---

옵셔널을 사용할 때마다 옵셔널 바인딩을 하는 것이 가장 바람직하다. 하지만, 개발을 하다보면 분명히 값이 존재할 것임에도 불구하고 옵셔널로 사용해야 하는 경우가 종종 있다. 이럴 때에는 옵셔널에 값이 있다고 가정하고 값에 바로 접근할 수 있도록 도와주는 키워드인 `!` 를 붙여서 사용하면 된다.

```swift
print(optionalEmail) // Optional("yjnoh1016@naver.com")
print(optionalEmail!) // yjnoh1016@naver.com
```

`!` 를 사용할 때에는 주의할 점이 있는데 옵셔널 값이 `nil` 인 경우에는 런타임 에러가 발생한다는 것이다. Java의 NullPointerException과 비슷하다고 생각해면 된다.

```swift
var optionalEmail: String?
print(optionalEmail!) // 런타임 에러!
```

> fatal error: unexpectedly found nil while unwrapping an Optional value

런타임 에러가 발생하면 iOS 앱은 강제로 종료(크래시)된다. 그러니 굉장히 조심해서 사용해야 한다.

### 암묵적으로 벗겨진 옵셔널 (Implicitly Unwrapped Optional)

---

만약, 옵셔널을 정의할 때 `?` 대신 `!` 를 붙이면 `ImplicitlyUnwrappedOptional` 이라는 옵셔널로 정의된다. 직역하면 '암묵적으로 벗겨진 옵셔널'이다.

```swift
var email: String! = "yjnoh1016@naver.com"
print(email) // yjnoh1016@naver.com
```

이렇게 정의된 옵셔널은 `nil` 을 포함할 수 있는 옵셔널이긴 한데, 접근할 때 옵셔널 바인딩이나 옵셔널을 벗기는 과정을 거치지 않고도 바로 값에 접근할 수 있다는 점에서 일반적인 옵셔널과 조금 다르다.

옵셔널 벗기기와 마찬가지로, 값이 없는데 접근을 시도하면 런타임 에러가 발생한다.

```swift
var email: String!
print(email) // 런타임 에러!
```

> fatal error: unexpectedly found nil while unwrapping an Optional value

가급적이면 일반적인 옵셔널을 사용해서 정의하고, 옵셔널 바인딩 또는 옵셔널 체이닝을 통해 값에 접근하는 것이 더 바람직하다.

## 함수와 클로저

---

 

함수는 `func` 키워드를 사용해서 정의한다. `->` 를 사용해서 함수의 반환 타입을 지정한다.

```swift
func hello(name: String, time: Int) -> String {
	var string = ""
	for _in 0..<time {
		print(name)
	}
}

hello(to: "노연주", numberOfTimes: 3} // 이곳에서는 'to'와 'numberOfTimes'를 사용한다.
```

파라미터 이름을 `_` 로 정의하면 함수를 호출할 때 파라미터 이름을 생략할 수 있게 된다.

```swift
func hello(_ name: String, time: Int) {
	// ...
}

hello("노연주" time: 3) //'name"' 이 생략되었습니다.
```

파라미터에 기본 값을 지정할 수도 있다. 기본 값이 지정된 파라미터는 함수 호출 시 생략할 수 있다.

```swift
func hello(name: String, time: Int = 1){
	// ...
}

hello("노연주")
```

`...` 을 사용하면 개수가 정해지지 않은 파라미터 Variadic Parameters를 받을 수 있다.

```swift
func sum(_numbers: Int...) -> Int {
	var sum = 0
	for number in numbers {
		sum += number
	}
	return sum
}

sum(1,2)
sum(3,4,5)
```

함수 안에 함수를 또 작성할 수도 있습니다.

```swift
func hello(name: String, time: Int){
	func message(name: String) -> String {
		return "\(name)님 안녕하세요!"
	}

	for _ in 0..<time {
		print(message(name: name))
	}
}
```

심지어 함수 안에 정의한 함수를 반환할 수도 있다.

```swift
func helloGenerator(message: String) -> (String) -> String {
	func hello(name: String) -> String {
		return name + message
	}
	return hello
}

let hello = helloGenerator(message: "님 안녕하세요!")
hello("노연주")
```

여기서 핵심은, `helloGenerator()` 함수의 반환 타입이 `(String) -> String` 라는 것이다. 즉, `helloGenerator()` 는 '문자열을 받아서 문자열을 반환하는 함수'를 반환하는 함수인 것이다.

만약 `helloGenerator()` 안에 정의한 `hello()` 함수가 여러개의 파라미터를 받는다면 이렇게 써야 한다.

```swift
func helloGenerator(message: String) -> (String, String) -> String {
  func hello(firstName: String, lastName: String) -> String {
    return lastName + firstName + message
  }
  return hello
}

let hello = helloGenerator(message: "님 안녕하세요!")
hello("연주", "노")
```

`(Stirng) -> String` 이 `(String, String) -> String` 으로 바뀌었다. 문자열 두 개를 받아서 문자열을 반환하는 의미이다.

### 클로저(Closure)

---

클로저 Closure를 사용하면 바로 위에 작성한 코드를 조금 더 간결하게 만들 수 있다. 클로저는 중괄호(`{}`)로 감싸진 '실행 가능한 코드 블럭'이다.

```swift
func helloGenerator(message: String) -> (String, String) -> String {
	return { (firstName: String, lastName: String) -> String in
		return lastName + firstName + message
	}
}
```

함수와는 다르게 함수 이름 정의가 따로 존재하지 않는다. 하지만 파라미터를 받을 수 있고, 반환 값이 존재할 수있다는 점에서 함수와 동일하다. 바로 함수는 이름이 있는 클로저이다.

위 함수에서 클로저를 반환하는 코드를 조금 더 자세히 살펴보자. 클로저는 중괄호(`{}`)로 감싸져있다. 그리고 파라미터를 괄호로 감싸서 정의한다. 함수와 마찬가지로 `->` 를 사용해서 반환타입을 명시한다. 조금 다른 점은 `in` 키워드를 사용해서 파라미터, 반환 타입 영역과 실제 클로저의 코드를 분리하고 있다.

```swift
{ (firstName: String, lastName: String) -> String in
  return lastName + firstName + message
}
```

클로저의 장점은 사실 간결함과 유연함에 있다. 바로 위에서 작성한 코드는 이해를 돕기 위해 생략가능한 것들을 하나도 생략하지 않고 모두 적었기 때문에 조금 복잡해 보일 수 있다. 이제 하나씩 생략해보자.

Swift 컴파일러의 타입 추론 덕분에, `helloGenerator()` 함수에서 반환하는 타입을 가지고 클로저에서 어떤 파라미터를 받고 어떤 타입을 반환하는 지를 알 수 있다.

```swift
func helloGenerator(message: String) -> (String, String) -> String {
	return { firstName, lastNmae in 
		return lastName + firstName + message
	}
}
```

훨씬 깔끔해졌다. 놀라운 사실은 여기서 생략할 수 있는게 더 있다는 사실이다. 마찬가지로 타입 추론 덕분에 첫번째 파라미터가 문자열이고, 두 번째 파라미터도 문자열이라는 것을 알 수 있었다. 첫 번째 파라미터는 `$0` , 두 번째 파라미터는 `$1` 로 바꿔서 쓸 수 있다.

```swift
func helloGenerator(message: String) -> (String, String) -> String {
	return { $1 + $0 + message }
}
```

이제 진짜로 간결해졌다. 처음에 작성했던 `helloGenerator()` 함수의 코드가 4줄이었는데 클로저를 사용하면서 3줄로 줄어들었고, 클로저에서 불필요한 부분을 생략하면서 달랑 1줄로 줄어들었다.

클로저는 변수처럼 정의할 수 있다.

```swift
let hello: (String, String) -> String = { $1 + $0 + "님 안녕하세요!" }
hello("연주", "노")
```

물론 옵셔널로도 정의할 수 있다. 옵셔널 체이닝도 가능하다.

```swift
let hello: ((String, String) -> String)?
hello?("연주", "노")
```

클로저를 변수로 정의하고 함수에서 반환할 수 있는 것처럼, 파라미터로도 받을 수 있다.

```swift
func manipulate(number: Int, using block: Int -> Int) -> Int {
	return block(number)
}

manipulate(number: 10, using: { (number: Int) -> Int in
	return number * 2
})
```

 

아까와 같이 생략할 수도 있다.

```swift
manipulate(number: 10, using: {
	$0 * 2
}
```

이런 구조로 만들어진 예시가 바로 `sort()` 와 `filter()` 이다. 함수가 클로저 하나만을 파라미터로 받는다면, 괄호를 아예 쓰지 않아도 된다.

```swift
let number = [1, 3, 2, 6, 7, 5, 8, 4]

let sortedNumbers = numbers.sort { $0 < $1 }
print(sortedNumbers) // [1, 2, 3, 4, 5, 6, 7, 8]

let evens = numbers.filter { $0 % 2 == 0 }
print(evens) // [2, 6, 8, 4]
```

### 클로저 활용하기

---

클로저는 Swift의 굉장히 많은 곳에서 사용된다. 바로 위에서 예시를 든 것 처럼 `sort()` 나 `filter()` 와 같은 배열에 많이 쓰인다. 대표적인 메서드로는 `sort()` , `filter()` , `map()` , `reduce()` 가 있다. `sort()` 와 `filter()` 는 바로 위에서 써봤으니 `map()` 과 `reduce()` 에 대해서 살펴보자.

`map()` 은 파라미터로 받은 클로저를 모든 요소에 실행하고, 그 결과를 반환한다. 예를 들어, 정수 배열의 모든 요소들에 2를 곱한 값으로 이루어진 배열을 만들고 싶다면, 이렇게 작성할 수 있다.

```swift
let arr1 = [1, 3, 6, 2, 7, 9]
let arr2 = arr1.map { $0 * 2 } // [2, 6, 12, 4, 14, 18]
```

`reduce()` 는 초깃값이 주어지고, 초깃값과 첫번째 요소의 클로저 실행 결과, 그리고 그 결과와 두 번째 요소의 클로저 실행 결과, 그리고 그 결과와 세 번째 요소의 클로저 실행 결과, ...끝까지 실행한 후의 값을 반환한다. 바로 위에서 정의한 `arr1` 의 모든 요소의 합을 구하고 싶다면, 아래와 같이 작성할 수 있다.

```swift
arr.reduce(0) { $0 + $1 } // 28
```

 

첫 번째 인자로 주어진 0부터 시작해서, 각 요소들과의 주어진 클로저에 대한 실행 결과를 바로 다음 요소와 실행합니다. 처음에는 0과 1을 더해서 1, 그 결과인 1과 3을 더해서 4, 그리고 4와 6을 더해서 10, 10과 2를 더해서 12, 12와 7을 더해서 19, 그리고 19와 9를 더해서 28이 반환된다.

### 클래스와 구조체

---

클래스 Class는 `class` 로 정의하고, 구조체 Structure는 `struct` 로 정의한다.

```swift
class Dog {
	var name: Stirng?
	var age: Int?
	
	func simpleDescription() -> String {
		if let name = self.name {
			return "🐶 \(name)"
		} else {
			return "🐶 No name"
		}
	}
}

struct Coffee {
	var name: String?
	var size: String?

	func simpleDescription() -> String {
		if let name =  self.name {
			return "☕️ \(name)"
		} else {
			return "☕️ No name"
		}
	}
}

var myDog = Dog()
myDog.name = "사랑이"
myDog.age = 3
print(myDog.simpleDescription()) // 🐶 사랑이

var myCoffee = Coffee()
myCoffee.name = "바닐라라떼"
myCoffee.size = "Venti"
print(myCoffee.simpleDescription()) // ☕️ 아메리카노

```

클래스는 상속이 가능하다. 구조체는 불가능하다.

```swift
class Animal {
	let numberofLegs = 4
}

class Dog: Animal {
	var name: String?
	var age: Int?
}

var myDog = Dog()
print(myDog.numberOfLeg) // Animal 클래스로부터 상속받은 값 (4)
```

클래스는 참조 Reference하고, 구조체는 복사 Copy한다.

```swift
var dog1 = Dog() // dog1은 새로 만들어진 Dog()를 참조한다.
var dog2 = dog1 // dog2는 dog1이 참조하는 Dog()를 똑같이 참조한다.
dog1.name = "사랑이" // dog1의 이름을 바꾸면 Dog()의 이름이 바뀌기 때문에,
print(dog2.name) // dog2의 이름을 가져와도 바뀐 이름 ("사랑이")이 출력된다.

var coffee1 = Coffee() // coffee1은 새로 만들어진 Coffee() 그 자체이다.
var coffee2 = coffee1 // coffee2는 coffee1을 복사한 값 자체이다.
coffee1.name = "바닐라 라떼" // coffee1의 이름을 바꿔도
coffee.name // coffee2는 완전히 별개이기 때문에 이름이 바뀌지 않는다. (nil)
```

### 생성자 (Initializer)

---

클래스와 구조체 모두 생성자를 가지고 있다. 생성자에서는 속성의 초깃값을 지정할 수 있다.

```swift
class Dog {
	var name: String?
	var age: Int?

	init() {
		self.age = 0
	}
}

struct Coffee {
	var name: String?
	var size: Stirng?

	init() {
		self.size = "Tail"
	}
}
```

만약 속성이 옵셔널이 아니라면 항상 초깃값을 가져야 한다. 만약 옵셔널이 아닌 속성이 초깃값을 가지고 있지 않으면 컴파일 에러가 발생한다.

```swift
class Dog {
	var name: String?
	var age: Int // 컴파일 에러!
}
```

> stored property 'age' without initial value prevents synthesized initializers

속성을 정의할 때 초깃값을 지정해 주는 방법과,

```swift
class Dog {
	var name: String?
	var age: Int = 0 // 속성을 정의할 때 초깃값 지정
}
```

생성자에서 초깃값을 지정해주는 방법이 있다.

```swift
class Dog {
	var name: String? 
	var age: Int

	init() {
		self.age = 0 // 생성자에서 초깃값 지정
	}
}
```

생성자도 함수와 마찬가지로 파라미터를 받을 수 있다.

```swift
class Dog {
	var name: String?
	var age: Int

	init(name: String?, age: Int) {
		self.name = name
		self.age = age
	}
}

var myDog = Dog(name: "사랑이", age: 3)
```

만약 상속받은 클래스라면 생성자에서 상위 클래스의 생성자를 호출해주어야 한다. 만약 생성자의 파라미터가 상위 클래스의 파라미터와 같다면, `override` 키워드를 붙여 주어야 한다. `super.init()` 은 클래스 속성들의 초깃값이 모두 설정된 후에 해야 한다. 그리고 나서부터 자기 자신에 대한 `self` 키워드를 사용할 수 있다.

```swift
class Dog: Animal {
  var name: String?
  var age: Int

  override init() {
    self.age = 0 // 초깃값 설정
    super.init() // 상위 클래스 생성자 호출
    print(self.simpleDescription()) // 여기서부터 'self' 접근 가능
  }

  func simpleDescription() -> String {
    if let name = self.name {
      return "🐶 \(name)"
    } else {
      return "🐶 No name"
    }
  }
}
```

만약, 위 예시 코드를 아래처럼 바꿔서 `super.init()` 을 하기 전에 `self` 에 접근한다면 컴파일 에러가 발생한다.

```swift
override init() {
	self.age = 0
	print(self.simpleDescription()) // 컴파일 에러!
	super.init()
}
```

> error: use of 'self' in method call 'simpleDescription' before super.init initializes self

`deinit` 은 메모리에서 해제된 직후에 호출됩니다.

```swift
class Dog {
	// ...

	deinit { 
		print("메모리에서 해제됨")
	}
}
```

### 속성 (Properties)

---

속성은 크게 두 가지로 나뉜다. 값을 가지는 속성 Stored Property과 계산되는 속성 Computed Property이다. 쉽게 말하면 속성이 값 자체를 가지고

있는지, 혹은 어떠한 연산을 수행한 뒤 그 결과를 반환하는지의 차이이다.

우리가 지금까지 정의하고 사용한 `name` , `age` 와 같은 속성들은 모두 Stored Property이다. Computed Property는 `get` , `set` 을 사용해서 정의할 수 있다. `set` 에서는 새로 결정될 값을 `nameValue` 라는 예약어를 통해 접근할 수 있다.

```swift
struct Hex {
	var decimal: Int?
	var hexString: String? {
		get {
			if let decimal = self.decimal {
				return String(decimal, radix: 16)
			} else {
				return nil
			}
		}
		set {
			if let nameValue = nameValue {
				self.decimal = Int(nameValue, radix: 16)
			} else {
				self.decimal = nil
			}
		}
	}
}

var hex = Hex()
hex.decimal = 10
hex.hexString // "a"

hex.hexString = "b"
hex.decimal // 11
```

위 코드에서 `hexString` 은 실제 값을 가지고 있지는 않지만, `decimal` 로부터 값을 받아와 16진수 문자열로 만들어서 반환한다. `decimal` 은 Stored Property, `hexString` 은 Computed Property이다.

참고로, `get` 만 정의할 경우에는 `get` 키워드를 생략할 수 있다. 이런 속성을 읽기 전용 Read Only이라고 한다.

```swift
class Hex {
	// ...

	var hexCode: String? {
		if let hex = self.hexString {
			return "0x" + hex
		}
	return nil
	}
}
```

`get` , `set` 과 비슷한 `willSet` , `didSet` 을 이용하면 속성에 값이 지정되기 직전과 직후에 원하는 코드를 실행할 수 있다.

```swift
struct Hex {
	var decimal: Int? {
		willSet {
			print("\(self.decimal)에서 \(newValue)로 값이 바뀔 예정이다.")
		}
		didSet {
			print("\(oldValue)에서 \(self.decimal)로 값이 바뀌었다.")
		}
	}
}
```

마찬가지로, `willSet` 에서는 새로운 값을 `nameValue` 로 얻어올 수 있고, `didSet` 에서는 예전 값을 `oldValue` 라는 예약어를 통해 얻어올 수 있다.

`willSet` 과 `didSet` 은 일반적으로 어떤 속성의 값이 바뀌었을 때 UI를 업데이트하거나 특정 메서드를 호출하는 등의 역할을 할 때에 사용된다.

## 튜플 (Tuple)

---

튜플 Tuple은 어떠한 값들의 묶음이다. 배열과 비슷하다고 볼 수 있지만, 배열과는 다르게 길이가 고정되어 있다. 값에 접근할 때도 `[]` 대신 `.` 을 사용한다.

```swift
var coffeeInfo = (coffee: "아메리카노", price: 5100)
namedCoffeeInfo.coffee // 아메리카노
namedCoffeeInfo.price // 5100
namedCoffeeInfo.price = 5100
```

이렇게 보면, 앞서 살펴본 구조체와 비슷하다. 실제로도 간단한 자로형을 만들 때에는 구조체 대신 튜플을 사용해서 만들기도 한다.

튜플의 타입 어노테이션은 이렇게 생겼다.

```swift
var coffeeInfo: (String, Int)
var namedCoffeeInfo: (coffee: String, price: Int)
```

튜플을 조금 응용하면, 아래와 같이 여러 변수에 값을 지정할 수도 있다.

```swift
let (coffee, price) = ("아메리카노", 5100)
coffee // 아메리카노
price // 5100
```

튜플이 가진 값을 가지고 변수에 값을 지정할 때, 무시하고 싶은 값이 있다면 `_` 키워드를 사용해서 할 수 있다. 아래 코드에서는  `"라떼"` 라는 첫 번째 값을 무시한다.

```swift
let (_, latteSize, lattePrice) = ("라떼", "Venti", 5600)
latteSize // Venti
lattePrice // 5600
```

물론 튜플을 반환하는 함수도 만들 수 있다.

```swift
/// 커피 이름에 맞는 커피 가격 정보를 반환한다. 일치하는 커피 이름이 없다면 `nil`을 반환한다.
///
/// - parameter name: 커피 이름
///
/// - returns: 커피 이름과 가격 정보로 구성된 튜플을 반환한다.
func coffeeInfo(for name: String) -> (name: String, price: Int)? {
	let coffeeInfoList: [(name: String, price: Int)] = [
		("아메리카노", 5100),
		("라떼", 5600).
	]
	for coffeeInfo in coffeeInfoList {
		if coffeeInfo.name == name {
			return coffeeInfo
		}
	}
	return nil
}

coffeeInfo(for: "아메리카노")?.price // 5100
coffeeInfo(for: "에스프레소")?.price // nil

let(_, lattePrice) = coffeeInfo(for: "라떼")!
latteePrice // 5600 
```

## Enum

---

열거라는 뜻을 가진 Enumeration에서 따온 용어이다. 한글로 번역할 때에는 열거형이라는 말을 많이 사용한다. 1월부터 12월까지를 `enum` 으로 한 번 정의해보자.

```swift
enum Month: Int {
	case january = 1
	case febuary
	case march
	case april
	case may
	case june
	case july
	case august
	case september
	case october
	case november
	case december

	func simpleDescription() -> String {
		switch self {
		case .january":
			return "1월"
		case .february:
      return "2월"
    case .march:
      return "3월"
    case .april:
      return "4월"
    case .may:
      return "5월"
    case .june:
      return "6월"
    case .july:
      return "7월"
    case .august:
      return "8월"
    case .september:
      return "9월"
    case .october:
      return "10월"
    case .november:
      return "11월"
    case .december:
      return "12월"
    }
  }
}

let december = Month.december
print(december.simpleDescription()) // 12월
print(december.rawValue)            // 12
```

위 예시에서 작성한 `Month` 는 `Int` 를 원시값으로 가지도록 정의되었다. 그렇기 때문에 각 케이스들은 1부터 12의 값을 가지고 있다. `rawValue` 속성이 바로 그 값을 나타낸다. 반대로, 원시값을 가지고 Enum을 만들 수 있다.

```swift
let october = Month(rawValue: 10)
print(october) // Optional(Month.october)
```

`Month(rawValue:)` 의 반환값이 옵셔널인 이유는, Enum에서 정의되지 않은 원시값을 가지고 생성할 경우 `nil` 을 반환하기 때문이다.

```swift
Month(rawValue: 13) //nil
```

일반적으로 Enum은 `Int` 만을 원시값으로 가질 수 있다고 생각한다. 다른 프로그래밍 언어에서는 모두 그렇다. 하지만, Swift의 Enum은 조금 독특하다. 아래 예시는 `String` 을 원시값으로 가지는 Enum이다.

```swift
enum IssueState: String {
	case open = "open"
	case closed = "closed"
}
```

만약 어떤 API의 응답에서 내려주는 `state` 의 값이 `open` 또는 `closed` 라면, `if-else` 없이도 `IssueState(rawValue:)` 를 사용해서 Enum을 생성할 수 있다.

Enum은 원시값을 가지지 않을 수도 있다. 원시값을 가져야 할 필요가 없다면 굳이 만들지 않아도 된다.

```swift
enum Spoon {
	case dirt
	case bronze
	case silver
	case gold
	
	func simpleDescription() -> String {
		switch self {
		case .dirt:
			return "흙"
		case .bronze:
			return "동"
		case .silver:
			return "은"
		case .gold:
			return "금"
		}
	}
}
```

Enum을 예측할 수 있다면 Enum의 이름을 생략할 수 있다.

```swift
let spoon: Spoon = .gold // 변수에 타입 어노테이션이 있기 때문에 생략 가능
func doSomething(with spoon: Spoon) {
	// ...
}
doSomething(with: .silver) // 함수 정의에 타입 어노테이션이 있기 때문에 생략
```


### 연관 값 (Associated Values)을 가지는 Enum

Enum은 연관 값 Associated Values을 가질 수 있습니다. 아래 예시는 어떤 API에 대한 에러를 정의한 것인데요. `invalidParameter` 케이스는 필드 이름과 메시지를 가지도록 정의되었다.

```swift
enum NetworkError {
	case invalidParameter(String, String)
	case timeout
}

let error: NetworkError = .invalidParameter("email", "이메일 형식이 올바르지 않습니다.")
```

이 값을 꺼내올 수 있는 방법으로는 `if-case`  또는 `switch` 를 활용하는 방법이 있다.

```swift
if case .invalidParameter(let field, let message) = error {
  print(field) // email
  print(message) // 이메일 형식이 올바르지 않습니다.
}

switch error {
case .invalidParameter(let field, let message):
  print(field) // email
  print(message) // 이메일 형식이 올바르지 않습니다.

default:
  break
}
```