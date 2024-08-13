# okapi_z

## 폴더 설명

``` 
lib/
│
├── features/              # 기능별로 그룹화
│   ├── auth/              # 예: 인증 기능
│   │   ├── data/          # 모델, 데이터 소스, 레포지토리
│   │   │   ├── models/
│   │   │   ├── repositories/
│   │   │   └── providers/
│   │   ├── domain/        # 비즈니스 로직, 유스케이스
│   │   │   ├── entities/
│   │   │   └── usecases/
│   │   ├── presentation/  # UI와 관련된 코드
│   │   │   ├── pages/
│   │   │   │   └── login_page.dart
│   │   │   ├── viewmodels/
│   │   │   │   └── login_viewmodel.dart
│   │   │   └── widgets/
│   │   │       └── login_form.dart
│   ├── home/              # 예: 홈 기능
│   │   ├── data/
│   │   ├── domain/
│   │   ├── presentation/
│   │   │   ├── pages/
│   │   │   ├── viewmodels/
│   │   │   └── widgets/
│   └── settings/          # 예: 설정 기능
│       ├── data/
│       ├── domain/
│       ├── presentation/
│       │   ├── pages/
│       │   ├── viewmodels/
│       │   └── widgets/
│
├── core/
│   ├── constants/         # 공통 상수
│   ├── themes/            # 공통 테마
│   ├── utils/             # 공통 유틸리티
│   └── widgets/           # 재사용 가능한 공통 위젯
│
├── app.dart               # 앱 위젯 (MaterialApp, Route 설정)
└── main.dart              # 메인 진입점
```



## Description of Folders

```
lib/
│
├── features/              # Grouped by functionality
│   ├── auth/              # Example: Authentication feature
│   │   ├── data/          # Models, data sources, repositories
│   │   │   ├── models/
│   │   │   ├── repositories/
│   │   │   └── providers/
│   │   ├── domain/        # Business logic, use cases
│   │   │   ├── entities/
│   │   │   └── usecases/
│   │   ├── presentation/  # UI-related code
│   │   │   ├── pages/
│   │   │   │   └── login_page.dart
│   │   │   ├── viewmodels/
│   │   │   │   └── login_viewmodel.dart
│   │   │   └── widgets/
│   │   │       └── login_form.dart
│   ├── home/              # Example: Home feature
│   │   ├── data/
│   │   ├── domain/
│   │   ├── presentation/
│   │   │   ├── pages/
│   │   │   ├── viewmodels/
│   │   │   └── widgets/
│   └── settings/          # Example: Settings feature
│       ├── data/
│       ├── domain/
│       ├── presentation/
│       │   ├── pages/
│       │   ├── viewmodels/
│       │   └── widgets/
│
├── core/
│   ├── constants/         # Common constants
│   ├── themes/            # Common themes
│   ├── utils/             # Common utilities
│   └── widgets/           # Reusable common widgets
│
├── app.dart               # App widget (MaterialApp, route settings)
└── main.dart              # Main entry point
```
