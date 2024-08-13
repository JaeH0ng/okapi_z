# okapi_z
폴더 생성이 필요한 경우, 다음의 코드 입력
```
FOLD_DIR="home" // home을 원하는 폴더 이름으로 변경
mkdir -p $FOLD_DIR/data $FOLD_DIR/domain $FOLD_DIR/presentation/pages $FOLD_DIR/presentation/viewmodels $FOLD_DIR/presentation/widgets

```

## 폴더 설명

``` 
lib/
│
├── features/              # 기능별로 그룹화
│   ├── auth/              # 인증 기능
│   │   ├── data/          # 모델, 데이터 소스, 레포지토리
│   │   │   ├── models/
│   │   │   ├── repositories/                           // 필요 : 로그인, 회원가입 API 요청 처리 기능
│   │   │   └── providers/                              // 필요 : 로그인, 회원가입 상태 관리 provider
│   │   ├── domain/        # 비즈니스 로직, 유스케이스      // 어떻게 활용하는 폴더일지? 좀더 확인 필요
│   │   │   ├── entities/
│   │   │   └── usecases/
│   │   ├── presentation/  # 로그인, 회원가입 UI
│   │   │   ├── pages/
│   │   │   ├── viewmodels/
│   │   │   └── widgets/
│   ├── home/              # 홈 탭
│   │   ├── data/
│   │   ├── domain/
│   │   ├── presentation/
│   │   │   ├── pages/
│   │   │   ├── viewmodels/
│   │   │   └── widgets/
│   └── settings/          # 설정 탭
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
│   ├── auth/              # Authentication
│   │   ├── data/          
│   │   │   ├── models/
│   │   │   ├── repositories/
│   │   │   └── providers/
│   │   ├── domain/        # Business logic, use cases
│   │   │   ├── entities/
│   │   │   └── usecases/
│   │   ├── presentation/  # Signup, Signin UI
│   │   │   ├── pages/
│   │   │   │   └── login_page.dart
│   │   │   ├── viewmodels/
│   │   │   │   └── login_viewmodel.dart
│   │   │   └── widgets/
│   │   │       └── login_form.dart
│   ├── home/              # Home tab
│   │   ├── data/
│   │   ├── domain/
│   │   ├── presentation/
│   │   │   ├── pages/
│   │   │   ├── viewmodels/
│   │   │   └── widgets/
│   └── settings/          # Setting tab
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
