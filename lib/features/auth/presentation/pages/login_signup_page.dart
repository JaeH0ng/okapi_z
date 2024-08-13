import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okapi_z/core/constants/palatte.dart';
import 'package:okapi_z/features/auth/data/models/user.dart';
import 'package:okapi_z/features/home/presentation/home_page.dart';
import 'package:okapi_z/features/auth/presentation/widgets/auth_form.dart';
import 'package:okapi_z/features/auth/data/providers/auth_provider.dart';
import 'package:okapi_z/features/auth/data/repositories/user_database.dart';

class LoginSignupScreen extends ConsumerWidget {
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignupScreen = ref.watch(authProvider);

    // TextEditingController 추가
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final countryController = TextEditingController();
    final passwordController = TextEditingController();
    final schoolNameController = TextEditingController();

    // 화면 크기 정보 가져오기
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          child: Stack(
            children: [
              // 상단 배경과 환영 메시지
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: Colors.yellow,
                  height: screenHeight * 0.35, // 화면 높이의 35%로 설정
                  child: Container(
                    padding: EdgeInsets.only(top: screenHeight * 0.1, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 환영 메시지
                        RichText(
                          text: TextSpan(
                            text: 'Welcome',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: screenWidth * 0.06,
                                color: Colors.white),
                            children: [
                              TextSpan(
                                text: isSignupScreen ? ' to okapi-z!' : ' back',
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: screenWidth * 0.06,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        // 로그인 또는 회원가입 설명
                        Text(
                          isSignupScreen
                              ? 'Signup to continue'
                              : 'Signin to continue',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.white,
                            fontSize: screenWidth * 0.04,
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
                top: screenHeight * 0.25,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  padding: const EdgeInsets.all(20.0),
                  width: screenWidth - 40,
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
                  child: IntrinsicHeight(
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
                                        fontSize: screenWidth * 0.02,
                                        fontWeight: FontWeight.bold,
                                        color: !isSignupScreen
                                            ? Palette.activeColor
                                            : Palette.textColor1),
                                  ),
                                  if (!isSignupScreen)
                                    Container(
                                      margin: const EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: screenWidth * 0.15,
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
                                        fontSize: screenWidth * 0.02,
                                        fontWeight: FontWeight.bold,
                                        color: isSignupScreen
                                            ? Palette.activeColor
                                            : Palette.textColor1),
                                  ),
                                  if (isSignupScreen)
                                    Container(
                                      margin: const EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: screenWidth * 0.15,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                        // 회원가입 및 로그인 폼
                        Expanded(
                          child: SingleChildScrollView(
                            child: AuthForm(
                              isSignupScreen: isSignupScreen,
                              emailController: emailController,
                              nameController: nameController,
                              countryController: countryController,
                              passwordController: passwordController,
                              schoolNameController: schoolNameController,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // 전송 버튼
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: isSignupScreen ? screenHeight * 0.95 : screenHeight * 0.5,
                right: 0,
                left: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: screenWidth * 0.1,
                    width: screenWidth * 0.1,
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
                            '', // 생년월일은 AuthForm 내에서 처리되므로 여기에 추가하지 않음
                            '', // 성별은 AuthForm 내에서 처리되므로 여기에 추가하지 않음
                            countryController.text,
                            '', // 연령대는 AuthForm 내에서 처리되므로 여기에 추가하지 않음
                            passwordController.text,
                            schoolNameController.text,
                            '', // 프로필 이미지 경로는 AuthForm 내에서 처리되므로 여기에 추가하지 않음
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
        ),
      ),
    );
  }

  // 사용자 정보 저장을 위한 로컬 데이터베이스 요청 함수
  void signUp(
    BuildContext context,
    String email,
    String name,
    String birth,
    String gender,
    String country,
    String ageRange,
    String password,
    String schoolName,
    String profileImagePath,
  ) {
    User user = User(
      email: email,
      name: name,
      birth: birth,
      gender: gender,
      country: country,
      ageRange: ageRange,
      password: password,
      schoolName: schoolName,
      profileImagePath: profileImagePath,
    );

    userDatabase.addUser(user);
    print('Signup successful');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  // 로그인 요청 함수
  void signIn(BuildContext context, String email, String password) {
    if (userDatabase.authenticateUser(email, password)) {
      print('Login successful');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      print('Login failed');
    }
  }
}
