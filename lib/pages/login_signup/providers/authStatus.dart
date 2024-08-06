// ignore_for_file: file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';

// 사용자 인증을 관리
class AuthStatus extends StateNotifier<bool> {
  AuthStatus() : super(false);

  void signIn() {
    state = true;
  }

  void signOut() {
    state = false;
  }
}

final authStatusProvider =
    StateNotifierProvider<AuthStatus, bool>((ref) => AuthStatus());
