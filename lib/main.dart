import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okapi_z/features/auth/data/models/user_model.dart';
import 'package:okapi_z/features/auth/presentation/pages/login_signup_page.dart';
import 'package:okapi_z/features/auth/data/providers/authStatus.dart';
import 'package:okapi_z/features/home/presentation/main_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authStatusProvider);

    return MaterialApp(
      title: 'okapi-z',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // authStatusProvider가 true이면 home을, false이면 로그인 페이지를 보여준다.
      // home: isAuthenticated ? const MainPage() : const LoginSignupScreen(), // TODO: need to redict to MainPage() if authenticated
      // home: isAuthenticated
      //     ? const LoginSignupScreen() // 로그인 전에는 user가 필요 없음
      //     : const LoginSignupScreen(),
      home: MainPage(
        user: UserModel(userId: 123, email: 'email', name: 'name'),
      ),
    );
  }
}
