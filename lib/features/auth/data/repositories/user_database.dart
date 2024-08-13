import 'package:okapi_z/features/auth/data/models/user.dart';

// 여기 작성할 코드
// 로그인 API 요청 처리
// 회원가입 API 요청 처리

class UserDatabase {
  final List<User> _users = [];

  void addUser(User user) {
    _users.add(user);
  }

  User? getUserByEmail(String email) {
    return _users.cast<User?>().firstWhere(
          (user) => user?.email == email,
          orElse: () => null,
        );
  }

  bool authenticateUser(String email, String password) {
    User? user = getUserByEmail(email);
    if (user != null && user.password == password) {
      return true;
    }
    return false;
  }
}

final userDatabase = UserDatabase();
