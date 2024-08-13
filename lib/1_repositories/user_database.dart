import 'package:okapi_z/1_models/user.dart';

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
