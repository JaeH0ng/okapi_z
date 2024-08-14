import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okapi_z/core/constants/palatte.dart';
import 'package:okapi_z/features/auth/data/models/user_model.dart';
import 'package:okapi_z/features/home/presentation/home_page.dart';
import 'package:okapi_z/features/auth/presentation/widgets/auth_form.dart';
import 'package:okapi_z/features/auth/data/repositories/user_database.dart';

class LoginSignupScreen extends ConsumerStatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends ConsumerState<LoginSignupScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController countryController;
  late TextEditingController passwordController;
  late TextEditingController schoolNameController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    emailController = TextEditingController();
    nameController = TextEditingController();
    countryController = TextEditingController();
    passwordController = TextEditingController();
    schoolNameController = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    emailController.dispose();
    nameController.dispose();
    countryController.dispose();
    passwordController.dispose();
    schoolNameController.dispose();
    super.dispose();
  }

  void signUp(BuildContext context) async {
    final email = emailController.text.trim();
    final name = nameController.text.trim();
    final password = passwordController.text.trim();
    final schoolName = schoolNameController.text.trim();

    if (email.isNotEmpty && name.isNotEmpty && password.isNotEmpty) {
      try {
        final newUser = await UserRepository().register(
          UserModel(
            userId: 0,
            email: email,
            name: name,
            profileImagePath: '',
          ),
          password,
        );
        // 회원가입 성공 후 홈 페이지로 이동
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(user: newUser)),
        );
      } catch (e) {
        // 회원가입 에러 처리
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
        final user = await UserRepository().login(email, password);
        // 로그인 성공 후 홈 페이지로 이동
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(user: user)),
        );
      } catch (e) {
        // 로그인 에러 처리
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        RichText(
                          text: TextSpan(
                            text: _tabController.index == 0
                                ? 'Welcome back'
                                : 'Welcome to okapi-z!',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: _tabController.index == 0
                                    ? '\nSignin to continue'
                                    : '\nSignup to continue',
                                style: TextStyle(
                                  fontSize: 20,
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
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        indicatorColor: Colors.orange,
                        indicatorWeight: 2.0,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(text: "LOGIN"),
                          Tab(text: "SIGNUP"),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.5,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    AuthForm(
                                      isSignupScreen: false,
                                      emailController: emailController,
                                      nameController: nameController,
                                      countryController: countryController,
                                      passwordController: passwordController,
                                      schoolNameController:
                                          schoolNameController,
                                      onSignIn: () => signIn(context),
                                      onSignUp: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    AuthForm(
                                      isSignupScreen: true,
                                      emailController: emailController,
                                      nameController: nameController,
                                      countryController: countryController,
                                      passwordController: passwordController,
                                      schoolNameController:
                                          schoolNameController,
                                      onSignIn: () {},
                                      onSignUp: () => signUp(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: screenWidth * 0.5 - 25,
                child: ElevatedButton(
                  onPressed: () {
                    if (_tabController.index == 0) {
                      signIn(context);
                    } else {
                      signUp(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(), backgroundColor: Colors.orange,
                    padding: EdgeInsets.all(20), // Background color
                  ),
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
