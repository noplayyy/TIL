# GCD

## GCD란 무엇일까?

초기에는 마이크로 프로세서의 clock 속도를 높이는 방식으로 연산 속도를 높였다. 

하지만 그 후 점점 증가하는 전력 소비와 발생한느 열로 인해 단일 프로세서의 clock 속도 증가에 한계를 맞게 됐고, 이는 특히 모바일에서 영향을 크게 받게 되었다. 따라서 CPU 벤더들은 단일 CPU의 클럭 속도가 빨라지면서 자연스럽게 소프트웨어도 빨라지던 예전과 달리 멀티 코어 프로세서에서는 멀티 프로세서에 어떻게 잘 프로그램의 동작을 배분하는 지가 중요해졌다.

GCD 이전에는 멀티 스레딩을 위해 Thread와 OperationQueue 등의 클래스를 사용했는데, Thread는 복잡하고 Critical Section 등을 이용한 Lock을 관리하기 까다로웠고, OperationQueue는 GCD에 비해 무겁고 Boilerplate 코드들이 많이 필요한 문제가 있다.

GCD (Grand Central Dispatch)는 멀티 코어 프로세서 시스템에 대한 응용 프로그램 지원을 최적화하기 위해 Apple에서 개발한 기술로 스레드 관리와 실행에 대한 책임을 어플리케이션 레벨에서 운영체제 레벨로 넘겨버렸다. 작업단위는 Block(Swift에선 클로저)이라 불리며, DispatchQueue가 이 Block들을 관리한다.

GCD (Grand Central Dispatch)는 멀티 코어 프로세서 시스템에 대한 응용 프로그램 지원을 최적화하기 위해 Apple에서 개발한 기술로 스레드 관리와 실행에 대한 책임을 어플리케이션 레벨에서 운영체제 레벨로 넘겨버렸다. 작업 단위는 Block(Swift에선 클로저)이라 불리며, DispatchQueue가 이 Block들을 관리한다.

GCD는 각 어플리케이션에서 생성된 DispatchQueue를 읽는 멀티코어 실행 엔진을 가지고 있으며, 이것이 Queue에 작업을 넘기기만 하면 되서, Thread를 직접 생성하고 관리하는 것에 비해 관리 용이성과 이식성, 성능이 증가하게 됐다.

애플 공식 문서에서도 Thread 클래스 대신 GCD 사용을 권장하고 있다.

- GCD의 장점
    - reduces the memory penalty for storing thread stacks in the app’s memory space.
    - eliminates the code needed to create and configure your threads.
    - eliminates the code needed to manage and schedule work on threads.
    - simplifies the code

## DispatchQueue

- GCD는 앱이 블록 객체 형태로 작업을 전송할 수 있는 FIFO 대기열 (Queue)을 제공하고 관리한다.
- Queue에 전달된 작업은 시스템이 전적으로 관리하는 스레드 풀(a pool of threads)에서 실행된다.
- DispatchQueue는 2개의 타입(Serial / Concurrent)으로 구분되며 둘 모두 FIFO 순서로 처리한다.
- 앱을 실행하면 시스템이 자동으로 메인스레드 위에서 동작하는 Main 큐(Serial Queue)를 만들어서 작업을 수행하고, 그 외에 추가적으로 여러 개의 Global 큐(Cuncurrent Queue)를 만들어서 큐를 관리한다.
- 각 작업은 동기(sync) 방식과 비동기(async) 방식으로 실행 가능하지만 Main 큐에서는 async 만 사용 가능

### Serial Queue

- Serial Queue는 큐에 추가된 순서대로 한번에 하나의 Task를 실행한다.

<img src = "https://i.imgur.com/CCNk1fj.png">

### Concurrent Queue

- Concurrent Queue는 동시에 하나 이상의 task를 실행하지만 큐에 추가됐을 시에 추가된 순서대로 작업을 계속 진행한다. 위의 사진을 보면 동시에 진행하고 있지만 사실 동시에 진행되는 것이 아니다.

<img src = "https://i.imgur.com/DzZWIFn.png">

### Concurrency(동시성) vs Parallelism(병렬성)

<img src = "https://i.imgur.com/UoR30Ms.png">

- 병렬성(Parallelism)
    - 물리적인 용어
    - 실제로 작업이 동시에 처리되는 것
    - 멀티 코어에서 멀티 스레드를 동작시키는 방식
    - 한 개 이상의 스레드를 포함하는 각 코어들이 동시에 실행되는 성질
    - 병렬성은 데이터 병렬성(Data parallelism)과 작업 병렬성(Task parallelism)으로 구분

- 동시성(Concurrency)
    - 논리적인 용어
    - 동시에 실행되는 것처럼 보이는 것이다.
    - 싱글 코어에서 멀티 스레드를 동작시키기 위한 방식
    - 하지만 멀티 코어에서도 동시성은 사용 가능하다.
    - 멀티 태스킹을 위해 여러 개의 스레드가 번갈아가면서 실행되는 성질
    - 동시성을 이용한 싱글 코어의 멀티 태스킹은 각 스레드들이 병렬적으로 실행되는 것처럼 보이지만 사실은 번갈아가면서 조금씩 실행되고 있는 것

---

### 사용법

> System이 제공하는 Queue에는 `Main` 과 `Global` 이 있다.

- Main
    - UI와 관련된 작업은 모두 main큐를 통해서 수행하며 Serial Queue에 해당된다.
    - MainQueue를 sync 메서드로 동작시키면 Dead Lock 상태에 빠진다.

    ```swift
    DispatchQueue.main.async{ }
    ```

- Global
    - UI를 제외한 작업에서 사용하며 Concurrent Queue에 해당한다.
    - sync와 async 메서드 모두 사용 가능하다.
    - Qos 클래스를 지정하여 우선순위 설정이 가능하다.

    ```swift
    DispatchQueue.global().async{ }
    DispatchQueue.global(qos: .utility).sync{ }
    ```


### QoS(Quality of service)

> 시스템은 QoS 정보를 통해 스케줄링, CPU 및 I/O 처리량, 타이머 대기 시간 등의 우선 순위를 조정
총 6개의 QoS 클래스가 있으며 4개의 주요 유형과 다른 2개의 특수 유형으로 구분 가능
[낮은순] unspecified → background → utility → default → userInitiated → userInteractive [높은순]


### Primary QoS classes

> 우선 순위가 높을 수록 더 빨리 수행되고 더 많은 전력을 소모
수행 작업에 적절한 QoS 클래스를 지정해주어야 더 반응성이 좋아지며, 효율적인 에너지 사용이 가능

- User Interactive
    - 즉각 반응해야 하는 작업으로 반응성 및 성능에 중점
    - main thread에서 동작하는 인터페이스 새로 고침, 애니메이션 작업 등 즉각 수행되는 유저와의 상호작용 작업에 할당
- User Initiated
    - 몇 초 이내의 짧은 시간 내 수행해야 하는 작업으로 반응성 및 성능에 중점
    - 문서를 열거나, 버튼을 클릭해 액션을 수행하는 것처럼 빠른 결과를 요구하는 유저와의 상호작용 작업에 할당
- Utility
    - 수초에서 수분에 걸쳐 수행되는 작업으로 반응성, 성능, 그리고 에너지 효율성 간에 균형을 유지하는 데 중점
    - 데이터를 읽어들이거나 다운로드 하는 등 작업을 완료하는데 어느 정도 시간이 걸릴 수 있으며 보통 진행 표시줄로 표현 Background
    - 수분에서 수시간에 걸쳐 수행되는 작업으로 에너지 효율성에 중점. NSOperation 클래스 사용 시 기본 값
    - background에서 동작하며 색인 생성, 동기화, 백업 같이 사용자가 볼 수 없는 작업에 할당
    - 저전력 모드에서는 네트워킹을 포함하여 백그라운드 작업은 일시 중지


### Special QoS Classes

> 일반적으로, 별도로 사용할 일이 없는 특수 유형의 QoS

- Default
    - QoS를 별도로 지정하지 않으면 기본값으로 사용되는 형태이며 User Initiated와 Utility의 중간 레벨
    - GCD global queue의 기본 동작 형태
- Unspecified
    - QoS 정보가 없으므로 시스템이 QoS를 추론해야 한다는 것을 의미

```swift
/* * Main   : UI와 관련된 작업
   * Global : UI를 제외한 작업에서 사용 */

/* 1번이 끝나고 2번이 동작한다. */
DispatchQueue.global(qos: .userInitiated).async {

    // 1번
    // 위의 작업이 끝나야만
    for _ in 0...900_000_000 {
        _ = 1 + 1
    }

    // 2번
    //밑에 스레드가 실행된다.
    //main스레드는 UI작업을 할때 사용된다.
    DispatchQueue.main.async {
        print("Start")
        self.testView.frame.origin.y += 250
        self.view.backgroundColor = .yellow
    }

/* 1번과 2번이 따로 동작하게된다. */
DispatchQueue.global().async {
    //1번
    for _ in 0...900_000_000 {
        _ = 1 + 1
    }
}
//2번
self.view.backgroundColor = .magenta
```