# SwiftUI Code를 이용해 개발된 Code 미리보기
> Storyboard를 사용하지 않고 코드로만 개발을 하게되면 배치 화면을 제대로 확인할 수 없어 힘들다. 이런 상황에서 손쉽게 개발할 수 있는 방법을 기록하기 위해 이 md을 작성한다.

다음과 같이 작성한다.
`ViewController.swift`

```swift
#if DEBUG
import SwiftUI // SwiftUI에서 가져와 사용하는 것이다.
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11")) // rawValue를 바꿔주면 미리보기 기기를 변경할 수 있다.
        }
        
    }
} #endif

```