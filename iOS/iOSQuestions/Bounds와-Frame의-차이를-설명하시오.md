# Bounds and Frame

Frame과 Bounds는 **UIView**의 instance property이다.

Frame과 Bounds는 모두 사각형으로 그려진다. 즉 **origin**과 **size**를 가진다.

## frame이란?

```
The frame rectangle, which describes the view's location and size in its superview's coordinate system.

SuperView(상위뷰)의 좌표 시스템 안에서 View의 위치와 크기를 나타낸다.
```

SuperView, 상위뷰는 한 단계 상위 뷰를 의미한다.

## bounds란?

```
The bounds rectangle, which describes the view's location and size in its own coordinate system.

View의 위치와 크기를 자신만의 좌표 시스템 안에서 나타낸다.
```

bounds는 자신만의 좌표 시스템을 쓴다.

|                           |             frame              |                                                          bounds                                                          |
| :-----------------------: | :----------------------------: | :----------------------------------------------------------------------------------------------------------------------: |
|   origin (x, y) 기준점    |      Super View의 좌표계       |                                                      자신의 좌표계                                                       |
| size (width, height) 기준 | View 영역을 모두 감싸는 사각형 |                                                      View 영역 자체                                                      |
|         사용 용도         | View의 위치와 크기를 나타낼 때 | View를 회전한 후 View의 실제 크기를 알고 싶을 때 / View 내부에 그림을 그릴 때 (drawRect) / ScrollView에서 스크롤링 할 때 |

### 한 줄 정리

> Bounds와 Frame 둘다 **CGRect** 타입이지만 Bounds는 **자기 자신만의 좌표 시스템을 기준**으로 origin(좌표)를 나타내고, Frame은 **SuperView(자신의 부모뷰)의 좌표 시스템을 기준**으로 origin(좌표)을 나타낸다.
