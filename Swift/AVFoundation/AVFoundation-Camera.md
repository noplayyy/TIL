# AVFoundation를 이용한 Custom Camera 만들기

> 아이디어 페스티벌 InFrame 개발을 통한 경험을 기록하기

- 원래의 계획은 카메라는 `ImagePickerView`로 하는 것이었다.
- `ImagePickerView`의 한계점
    - CustomUI를 만들 수 없다. (Apple에서 제공하는 기본 UI를 사용해야한다.)
    - Camera 기능에 한계가 있었다.
- 그렇다면.. `AVFoundation`를 이용하자!!

### AVFoundation