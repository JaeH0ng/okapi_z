# okapi_z

## 폴더 설명

### features/
- **auth/**: 인증 기능과 관련된 모든 코드가 포함됩니다. 데이터 처리(모델, 레포지토리, 프로바이더), 비즈니스 로직(엔티티, 유스케이스), 프레젠테이션 로직(UI 페이지, ViewModel, 위젯)으로 구성됩니다.
- **home/**: 홈 기능에 대한 유사한 구조.
- **settings/**: 설정 기능에 대한 유사한 구조.

### core/
- **constants/**: 앱 전체에서 사용되는 전역 상수들.
- **themes/**: 테마 및 스타일 리소스.
- **utils/**: 앱 전역에서 재사용 가능한 유틸리티 함수들.
- **widgets/**: 여러 기능에서 재사용 가능한 위젯들.

### app.dart
- `MaterialApp`이 구성되는 메인 애플리케이션 위젯으로, 라우팅과 테마 설정 등을 담당합니다.

### main.dart
- Flutter 애플리케이션의 진입점으로, `runApp()`을 호출하는 곳입니다.


## Description of Folders

### features/
- **auth/**: Contains all code related to the authentication feature, including data handling (models, repositories, providers), business logic (entities, use cases), and presentation logic (UI pages, ViewModels, widgets).
- **home/**: Similar structure for the home feature.
- **settings/**: Similar structure for the settings feature.

### core/
- **constants/**: Global constants that are used throughout the app.
- **themes/**: Theming and styling resources.
- **utils/**: Utility functions that can be reused across the app.
- **widgets/**: Common widgets that are used in multiple features.

### app.dart
- The main application widget where `MaterialApp` is configured, along with routing and theming.

### main.dart
- The entry point of the Flutter application, where `runApp()` is called.
