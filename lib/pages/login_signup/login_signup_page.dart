// ignore_for_file: unnecessary_const

// 상태관리
/* 
- authProvider를 사용하여 로그인/회원가입 화면 전환 상태 관리
- isSignupScreen 변수로 현재 로그인 화면인지 회원가입 화면인지 나타냄
- ref.watch(authProvider)를 통해 'authProvider'의 상태를 구독
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okapi_z/config/palatte.dart';
import 'package:okapi_z/models/user.dart';
import 'package:okapi_z/pages/home/home_page.dart';
import 'package:okapi_z/pages/login_signup/login_signup_widgets/auth_form.dart';
import 'package:okapi_z/pages/login_signup/providers/auth_provider.dart';
import 'package:okapi_z/repositories/user_database.dart';

class LoginSignupScreen extends ConsumerWidget {
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignupScreen = ref.watch(authProvider);

    // TextEditingController 추가
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final birthController = TextEditingController();
    final passwordController = TextEditingController();
    final schoolNameController = TextEditingController();
    final schoolPlaceIdController = TextEditingController();

    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          // 상단 배경과 환영 메시지
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.yellow,
              height: 300,
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 환영 메시지
                    RichText(
                      text: TextSpan(
                        text: 'Welcome',
                        style: const TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 25,
                            color: Colors.white),
                        children: [
                          TextSpan(
                            text: isSignupScreen ? ' to okapi-z!' : ' back',
                            style: const TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    // 로그인 또는 회원가입 설명
                    Text(
                      isSignupScreen
                          ? 'Signup to continue'
                          : 'Signin to continue',
                      style: const TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 로그인 및 회원가입 폼 애니메이션 컨테이너
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: 180,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              padding: const EdgeInsets.all(20.0),
              height: isSignupScreen ? 400.0 : 250.0,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5),
                ],
              ),
              child: Column(
                children: [
                  // 로그인 및 회원가입 전환 버튼
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ref.read(authProvider.notifier).toggle();
                        },
                        child: Column(
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1),
                            ),
                            if (!isSignupScreen)
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.read(authProvider.notifier).toggle();
                        },
                        child: Column(
                          children: [
                            Text(
                              'SIGNUP',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1),
                            ),
                            if (isSignupScreen)
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                  // 회원가입 및 로그인 폼
                  AuthForm(
                    isSignupScreen: isSignupScreen,
                    emailController: emailController,
                    nameController: nameController,
                    birthController: birthController,
                    passwordController: passwordController,
                    schoolNameController: schoolNameController,
                    schoolPlaceIdController: schoolPlaceIdController,
                  ),
                ],
              ),
            ),
          ),
          // 전송 버튼
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: isSignupScreen ? 580 : 390,
            right: 0,
            left: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: GestureDetector(
                  onTap: () {
                    if (isSignupScreen) {
                      // 사용자 정보 저장 요청
                      signUp(
                        context,
                        emailController.text,
                        nameController.text,
                        birthController.text,
                        passwordController.text,
                        schoolNameController.text,
                        schoolPlaceIdController.text,
                      );
                    } else {
                      // 로그인 로직 추가 (추후 구현)
                      signIn(
                        context,
                        emailController.text,
                        passwordController.text,
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//   // 사용자 정보 저장을 위한 서버 요청 함수
//   void signUp(String email, String name, String birth, String password, String schoolName, String schoolPlaceId) async {
//     final url = 'https://your-django-server.com/api/signup/';
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'email': email,
//         'name': name,
//         'birth': birth,
//         'password': password,
//         'school_name': schoolName,
//         'school_place_id': schoolPlaceId,
//       }),
//     );

//     if (response.statusCode == 201) {
//       // 성공적으로 회원가입 완료
//       print('Signup successful');
//       // HomePage로 이동
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
//     } else {
//       // 오류 처리
//       print('Signup failed: ${response.body}');
//     }
//   }
// }

// 백엔드 서버 연결 전 사용할 함수
  // 사용자 정보 저장을 위한 로컬 데이터베이스 요청 함수
  void signUp(BuildContext context, String email, String name, String birth,
      String password, String schoolName, String schoolPlaceId) {
    User user = User(
      email: email,
      name: name,
      birth: birth,
      password: password,
      schoolName: schoolName,
      schoolPlaceId: schoolPlaceId,
    );

    userDatabase.addUser(user);
    print('Signup successful');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  // 로그인 요청 함수
  void signIn(BuildContext context, String email, String password) {
    if (userDatabase.authenticateUser(email, password)) {
      print('Login successful');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print('Login failed');
    }
  }
}
