# okapi_z
## if you need to make new folder, use this code.
```
FOLD_DIR="home" // home을 원하는 폴더 이름으로 변경
mkdir -p $FOLD_DIR/data $FOLD_DIR/domain $FOLD_DIR/presentation/pages $FOLD_DIR/presentation/viewmodels $FOLD_DIR/presentation/widgets

```
## How to use Icon?(icons has been already uploaded)
- we can also use 'icon_print.js' file which can get the SVG code of the icon.
- If you want to search 'Home' Icon, type this at the terminal screen.
```
node icon_print.js Home
```
- then file will be automatically created at "assets/icons/" folder.

- if you watn to use icon, you can use like this way
```
import 'package:flutter_svg/svg.dart';
// ...
CustomTextField(
  controller: widget.emailController,
  icon: SvgPicture.asset(
    'assets/icons/email.svg', // SVG 아이콘 사용
    width: 24,
    height: 24,
  ),
  hintText: 'Email',
),
```
- search icon here : https://iconpark.oceanengine.com/official
- 'How to use' : https://www.npmjs.com/package/@icon-park/svg

## 폴더 설명

``` 
lib/
│
├── core/                
│   ├── constants/        # 앱 전역에서 사용되는 상수들
│   ├── themes/           # 앱의 테마와 스타일 정의
│   ├── utils/            # 공통적으로 사용하는 유틸리티 함수들
│   └── widgets/          # 공통으로 재사용 가능한 위젯들
│
├── features/              # 기능별로 그룹화
│   ├── auth/              # 인증 기능
│   │   ├── data/          # 데이터 레이어 (모델, 데이터 소스, 레포지토리)
│   │   │   ├── models/    # 유저 모델 정의
│   │   │   ├── repositories/ # 유저 인증 관련 레포지토리
│   │   │   └── providers/  # Riverpod Providers (상태 관리)
│   │   ├── domain/        # 도메인 레이어 (엔티티, 유스케이스)
│   │   │   ├── entities/  # 유저 엔티티
│   │   │   └── usecases/  # 유저 인증 로직 (회원가입, 로그인)
│   │   ├── presentation/  # 프레젠테이션 레이어 (UI)
│   │   │   ├── pages/     # 로그인, 회원가입 페이지 UI
│   │   │   ├── viewmodels/ # 로그인, 회원가입 ViewModel
│   │   │   └── widgets/   # 로그인, 회원가입에 관련된 위젯
│   │
│   ├── adventure/         # Adventure 기능
│   │   ├── data/          
│   │   │   ├── models/    # Adventure, Comment, Like, Participant 모델 정의
│   │   │   ├── repositories/ # Adventure 관련 레포지토리
│   │   │   └── providers/  # Riverpod Providers (상태 관리)
│   │   ├── domain/        
│   │   │   ├── entities/  # Adventure 엔티티
│   │   │   └── usecases/  # Adventure 생성, 수정, 삭제 등의 유스케이스
│   │   ├── presentation/  
│   │   │   ├── pages/     # Adventure 리스트, 상세보기 페이지 UI
│   │   │   ├── viewmodels/ # Adventure ViewModel
│   │   │   └── widgets/   # Adventure 관련된 위젯
│   │
│   ├── chat/              # 채팅 기능
│   │   ├── data/          
│   │   │   ├── models/    # ChatRoom, ChatMessage 모델 정의
│   │   │   ├── repositories/ # 채팅 메시지 관련 레포지토리
│   │   │   └── providers/  # Riverpod Providers (상태 관리)
│   │   ├── domain/        
│   │   │   ├── entities/  # ChatRoom, ChatMessage 엔티티
│   │   │   └── usecases/  # 채팅 메시지 전송, 조회 유스케이스
│   │   ├── presentation/  
│   │   │   ├── pages/     # 채팅방 페이지 UI
│   │   │   ├── viewmodels/ # 채팅 ViewModel
│   │   │   └── widgets/   # 채팅 관련된 위젯
│   │
│   ├── location_search/    # 장소 검색 기능
│   │   ├── data/          
│   │   │   ├── models/    # Location 모델 정의
│   │   │   ├── repositories/ # 장소 검색 관련 레포지토리
│   │   │   └── providers/  # Riverpod Providers (상태 관리)
│   │   ├── domain/        
│   │   │   ├── entities/  # Location 엔티티
│   │   │   └── usecases/  # 장소 검색 유스케이스
│   │   ├── presentation/  
│   │   │   ├── pages/     # 장소 검색 페이지 UI
│   │   │   ├── viewmodels/ # 장소 검색 ViewModel
│   │   │   └── widgets/   # 장소 검색 관련된 위젯
│
├── app.dart               # 앱 전체 구조와 라우팅 설정
└── main.dart              # 앱의 진입점
```

## About Folder Structure
```
lib/
│
├── core/           
│   ├── constants/        # Constants used globally across the app
│   ├── themes/           # Defines the app's theme and style
│   ├── utils/            # Common utility functions
│   └── widgets/          # Reusable widgets
│
├── features/              # Grouped by features
│   ├── auth/              # Authentication feature
│   │   ├── data/          # Data layer (models, data sources, repositories)
│   │   │   ├── models/    # Defines user models
│   │   │   ├── repositories/ # Repositories related to user authentication
│   │   │   └── providers/  # Riverpod Providers (state management)
│   │   ├── domain/        # Domain layer (entities, use cases)
│   │   │   ├── entities/  # User entities
│   │   │   └── usecases/  # User authentication logic (sign-up, login)
│   │   ├── presentation/  # Presentation layer (UI)
│   │   │   ├── pages/     # Login and sign-up page UIs
│   │   │   ├── viewmodels/ # Login and sign-up ViewModel
│   │   │   └── widgets/   # Widgets related to login and sign-up
│   │
│   ├── adventure/         # Adventure feature
│   │   ├── data/          
│   │   │   ├── models/    # Defines Adventure, Comment, Like, Participant models
│   │   │   ├── repositories/ # Repositories related to Adventure
│   │   │   └── providers/  # Riverpod Providers (state management)
│   │   ├── domain/        
│   │   │   ├── entities/  # Adventure entities
│   │   │   └── usecases/  # Use cases for creating, editing, and deleting Adventures
│   │   ├── presentation/  
│   │   │   ├── pages/     # Adventure list and detail page UIs
│   │   │   ├── viewmodels/ # Adventure ViewModel
│   │   │   └── widgets/   # Widgets related to Adventure
│   │
│   ├── chat/              # Chat feature
│   │   ├── data/          
│   │   │   ├── models/    # Defines ChatRoom, ChatMessage models
│   │   │   ├── repositories/ # Repositories related to chat messages
│   │   │   └── providers/  # Riverpod Providers (state management)
│   │   ├── domain/        
│   │   │   ├── entities/  # ChatRoom, ChatMessage entities
│   │   │   └── usecases/  # Use cases for sending and retrieving chat messages
│   │   ├── presentation/  
│   │   │   ├── pages/     # Chat room page UI
│   │   │   ├── viewmodels/ # Chat ViewModel
│   │   │   └── widgets/   # Widgets related to chat
│   │
│   ├── location_search/    # Location search feature
│   │   ├── data/          
│   │   │   ├── models/    # Defines Location model
│   │   │   ├── repositories/ # Repositories related to location search
│   │   │   └── providers/  # Riverpod Providers (state management)
│   │   ├── domain/        
│   │   │   ├── entities/  # Location entities
│   │   │   └── usecases/  # Use cases for location search
│   │   ├── presentation/  
│   │   │   ├── pages/     # Location search page UI
│   │   │   ├── viewmodels/ # Location search ViewModel
│   │   │   └── widgets/   # Widgets related to location search
│
├── app.dart               # App structure and routing settings
└── main.dart              # Entry point of the app

```