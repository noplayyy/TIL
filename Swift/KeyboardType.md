# KeyboardType

iOS에서 TextField, TextView와 같은 요소에서 입력을 할 때 터치하면 키보드가 화면에 띄워진다.

이 떄 사용자 편의를 위해 목적에 맞는 키보드 타입을 설정해줘야 한다.

```swift
tf.keyboardType = .TYPE
tv.keyboardType = .TYPE
```

위와 같이 설정해줘야 한다.

### 그럼 무슨 타입이 있을까?

[공식문서](https://developer.apple.com/documentation/uikit/uikeyboardtype)를 참고해보자. 

```swift
typedef enum {
    case `default`
    Specifies the default keyboard for the current input method.

    case asciiCapable
    Specifies a keyboard that displays standard ASCII characters.

    case numbersAndPunctuation
    Specifies the numbers and punctuation keyboard.

    case URL
    Specifies a keyboard for URL entry.

    case numberPad
    Specifies a numeric keypad for PIN entry.

    case phonePad
    Specifies a keypad for entering telephone numbers.

    case namePhonePad
    Specifies a keypad for entering a person’s name or phone number.

    case emailAddress
    Specifies a keyboard for entering email addresses.

    case decimalPad
    Specifies a keyboard with numbers and a decimal point.

    case twitter
    Specifies a keyboard for Twitter text entry, with easy access to the at (“@”) and hash (“#”) characters.

    case webSearch
    Specifies a keyboard for web search terms and URL entry.
    
    case asciiCapableNumberPad
    Specifies a number pad that outputs only ASCII digits.
}UIKeyboardType;

static var alphabet: UIKeyboardType
Specifies a keyboard for alphabetic entry.
```

- **default** : 기본적인 키보드
- **asciiCapable** : 영문만 표시되는 키보드
- **numbersAndPunctuation** : 숫자와 특수문자가 표시되는 키보드
- **URL** : URL을 입력할 수 있도록 `.`과 `/` 그리고 `.com`이 키보드 영역에 표시되는 키보드
- **numberPad** : 숫자를 입력하는 키패드 형식의 키보드
- **phonePad** : 전화번호를 입력할 수 있는 키패드 형식의 키보드
- **namePhonePad** : 대문자 입력이 불가한 키보드
- **emailAddress** : 이메일을 입력할 수 있도록 `@`와 `.`이 키보드 영역에 표시되는 키보드
- **decimalPad** : 소숫점을 입력할 수 있는 키패드 형식의 키보드
- **twitter** : 트위터 입력을 빠르게 할 수 있도록 `@`와 `#`이 추가된 키보드
- **webSearch** : URL 및 검색어 입력에 최적화 됨 (`공백` 및 `.`표시)
- **asciiCapableNumberPad** : Ascii 숫자가 표시되는 키보드
- **alphabet** : = asciiCapable 더 이상 사용하지 않음

[Reference](https://ikkison.tistory.com/18)