import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okapi_z/pages/home/home_page.dart';
import 'package:okapi_z/pages/login_signup/login_signup_page.dart';
import 'package:okapi_z/pages/login_signup/providers/authStatus.dart';

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
      home: isAuthenticated ? const HomePage() : const LoginSignupScreen(),
    );
  }
}
