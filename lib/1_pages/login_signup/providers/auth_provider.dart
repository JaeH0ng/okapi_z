// ignore: file_names
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 로그인/회원가입 페이지의 UI 토글을 관리
class AuthState extends StateNotifier<bool> {
  AuthState() : super(true);

  void toggle() {
    state = !state;
  }
}

final authProvider =
    StateNotifierProvider<AuthState, bool>((ref) => AuthState());
