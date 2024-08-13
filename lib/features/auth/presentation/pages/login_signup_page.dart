import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okapi_z/core/constants/palatte.dart';
import 'package:okapi_z/features/auth/data/models/user.dart';
import 'package:okapi_z/features/auth/data/models/user_model.dart';
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

    final UserRepository userRepository = UserRepository();

    void signUp(BuildContext context) async {
      final email = emailController.text.trim();
      final name = nameController.text.trim();
      final password = passwordController.text.trim();
      final schoolName = schoolNameController.text.trim();

      if (email.isNotEmpty && name.isNotEmpty && password.isNotEmpty) {
        try {
          final newUser = await userRepository.register(
            UserModel(
              userId: 0,
              email: email,
              name: name,
              profileImagePath: '',
            ),
            password,
          );
          // Navigate to the home page on successful signup
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage(user: newUser)),
          );
        } catch (e) {
          // Handle signup error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${e.toString()}')),
          );
        }
      }
    }

    void signIn(BuildContext context) async {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (email.isNotEmpty && password.isNotEmpty) {
        try {
          final user = await userRepository.login(email, password);
          // Navigate to the home page on successful login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage(user: user)),
          );
        } catch (e) {
          // Handle login error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${e.toString()}')),
          );
        }
      }
    }

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
                            text: isSignupScreen
                                ? 'Welcome to '
                                : 'Welcome back, ',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: isSignupScreen ? 'Sign Up' : 'Sign In',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // 로그인/회원가입 폼
              Positioned(
                top: screenHeight * 0.25,
                right: screenWidth * 0.05,
                left: screenWidth * 0.05,
                child: AuthForm(
                  isSignupScreen: isSignupScreen,
                  emailController: emailController,
                  nameController: nameController,
                  countryController: countryController,
                  passwordController: passwordController,
                  schoolNameController: schoolNameController,
                  onSignIn: () => signIn(context),
                  onSignUp: () => signUp(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
