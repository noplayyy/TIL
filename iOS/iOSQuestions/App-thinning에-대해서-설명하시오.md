# App thinning에 대해서 설명하시오.

## 앱 시닝(app thinning)이란?

애플리케이션이 디바이스에 설치될 때, 앱 스토어와 운영체제가 디바이스의 특성에 맞게 설치되도록 하는 **설치 최적화 기술**을 의미한다. 최소한의 디스크 사용과 빠른 다운로드를 제공할 수 있다. 앱 시닝은 `슬라이싱(slicing)`, `비트코드(bitcode)`, 그리고 `주문형 리소스(on-demand resource)`가 있다.

## 슬라이싱(slicing)이란?

앱이 지원하는 여러 디바이스에 대해 각각 조각 애플리케이션 번들을 생성하고, **해당 디바이스에 가장 적합한 조각**을 전달하는 기술이다. 개발자가 App store connect에 업로드하면, 앱 스토어에서 디바이스 특성에 따라 다양한 버전의 조각들을 생성한다. 그리고 사용자가 그 조각 중에서 가장 알맞은 조각(app variant)을 다운로드 받는 것이다.

![slicing](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FliRcH%2FbtqB0ePGdup%2FhKwkuN5aD5ctfsuKdcxdSk%2Fimg.png)

## 비트코드(bitcode)란?

비트코드는 기계언어로 번역되기 이전 단계의 중간표현(Intermediate Representation)을 말한다. 현재 iOS에서는 옵션이나 기본 설정으로 되어 있으며, 개발자가 프로젝트 옵션에서 선택할 수 있다. 비트코드를 사용하여 업로드를 하면 애플이 애플리케이션을 재컴파일하여 앱 바이너리(app binary)를 생성한다. 비트코드를 사용하지 않으면, 모든 경우의 디바이스의 경우에 따라 바이너리로 생성하여 합쳐져서 fat binary라는 것이 업로드되지만, 비트코드를 사용하면 필요 경우에 따라 재컴파일하게 되므로 여기에서 최적화 할 수 있다.

## 주문형 리소스(on-demand resource)란?

쉽게 말해서, 필요할 때 다운로드 받는다는 것이다. 예를 든다면 사용자가 게임을 한다. 현재 레벨보다 상위레벨은 필요하지 않으므로 갖고 있을 필요가 없다. 사용자의 레벨이 필요할 때 다운로드 받는 것이다. 또한 인앱 구매를 예로 들 수 있다. 사용자의 선택에 따라 다운로드를 받는 것이다.

![on-demand resource](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcAvpAu%2FbtqBZhl6yKO%2FEucAD3dfLILVuzMwWGH761%2Fimg.png)

### 한 줄 정리

> 애플리케이션이 디바이스에 설치될 때, 앱 스토어와 운영체제가 디바이스의 특성에 맞게 설치되도록 하는 **설치 최적화 기술**을 의미한다. 최소한의 디스크 사용과 빠른 다운로드를 제공할 수 있다. 앱 시닝은 해당 디바이스에 가장 적합한 조각을 전달하는 `슬라이싱(slicing)`, 바이너리를 생성하여 재컴파일 하는 `비트코드(bitcode)`, 그리고 선택에 따라 다운로드를 받는 `주문형 리소스(on-demand resource)`가 있다.
