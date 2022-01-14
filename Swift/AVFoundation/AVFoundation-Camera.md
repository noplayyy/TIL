# AVFoundation를 이용한 Custom Camera 만들기

> 아이디어 페스티벌 InFrame 개발을 통한 경험을 기록하기

- 원래의 계획은 카메라는 `ImagePickerView`로 하는 것이었다.
- `ImagePickerView`의 한계점
  - CustomUI를 만들 수 없다. (Apple에서 제공하는 기본 UI를 사용해야한다.)
  - Camera 기능에 한계가 있었다.
- 그렇다면.. `AVFoundation`를 이용하자!!

### AVCaptureSession

- 세션이란 입력에서 출력 장치로의 데이터 흐름을 제어하는데 사용
- 해상도 설정: captureSession.sessionPreset

```swift
captureSession = AVCaptureSession()
captureSession.sessionPreset = .photo // set resoultion
```

### AVCaptureDevice

- capture 하는 물리적인 device를 참조하는 데이터형

```swift
guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video) else {
    return
}
captureDevice = backCamera
```

### AVCaptureDeviceInput, AVCapturePhotoOutput

- AVCaptureDeviceInput: device의 입력
- AVCapturePhotoOutput: device의 출력
- DeviceInputdmfh input을 참조, PhotoOutput으로 output을 참조하여 captureSession에 등록

```swift
do{
    let input = try AVCaputureDeviceInput(device: backCamera)
    stillImageOutput = AVCapturePhotoOutput()
    if captureSession = captureSession.canAddInput(input), captureSession.canAddOutput(stillImageOutput){
        captureSession.addInput(input)
        captureSession.addOutput(stillImageOutput)
        // 여기에서 preview 세팅하는 함수 호출
    }
} catch {
    print(error.localizedDescription)
}
```

### AVCaptureVideoPreviewLayer

- input, output이 설정된 AVCaptureSession의 객체를 받아서 미리보기 화면의 정보를 갖는 Layer 데이터형
- Layer이므로 따로 UIView를 만들어서 이곳에 부착하는 형태로 사용

```swift
private func setupLivePreview(){
    // previewLayer 세팅
    videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    videoPreviewLayer.videoGravity = .resizeAspectFill
    videoPreviewLayer.connectoin?.videoOrientation = .portrait

    // UIView객체인 preView 위 객체 입힘
    preView.layer.insertSubLayer(videoPreviewLayer, at: 0) // 맨 앞(0번째로 가져와서 보이게끔 설정)
    DispatchQueue.main.async { in
        self.videoPreviewLayer.frame = self.preView.bounds
    }

    //preview까지 준비됐으니 captureSession을 시작하도록 설정
}
```

- captureSession에 시작을 알림

```swift
private func startCaptureSession() {
    DispatchQueue.global(qos: .userInitiated).async {
        self.captureSession.startRunning()
    }
}
```

## 카메라 전환

- 새로운 device를 생성한 후 captureSession에 등록

```swift
private func switchCamera(captureSession: AVCaptureSession?) {
    captureSession?.beginConfiguration()
    let currentInput = captureSession?.inputs.first as? AVCaptureDeviceInput
    captureSession?.removeInput(currentInput!)

    let newCameraDevice = currentInput?.device.position == .back ? camera(with:.front) : camera(with: .back)
    let newVideoInput = try? AVCaptureDeviceInput(device: newCameraDevice!)
    captureSessoin?.addInput(newVideoInput!)
    captureSession?.commitConfiguration()
}

private func camera(with position: AVCaptureDevice.Position) -> AVCaptureDevice? {
    let devices = AVCaptureDevice.devices(for: AVMediaType.video)
    return devives.filter { $0.position == position }.first
}
```
