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