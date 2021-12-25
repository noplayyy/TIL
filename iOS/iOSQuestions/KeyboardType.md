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