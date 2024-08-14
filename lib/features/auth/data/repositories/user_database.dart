import 'package:okapi_z/features/auth/data/models/user_model.dart';
import 'dart:async';

class UserRepository {
  final List<UserModel> _mockUsers = [
    UserModel(
      userId: 1,
      email: 'user1@example.com',
      name: 'John Doe',
      profileImagePath: '/images/user1.png',
      birth: '1990-01-01',
      gender: 'Male',
      country: 'USA',
      ageRange: '30~',
      password: 'password123',
      schoolName: 'University A',
    ),
    UserModel(
      userId: 2,
      email: 'user2@example.com',
      name: 'Jane Smith',
      profileImagePath: '/images/user2.png',
      birth: '1992-05-12',
      gender: 'Female',
      country: 'Canada',
      ageRange: '30~',
      password: 'password123',
      schoolName: 'University B',
    ),
    UserModel(
      userId: 3,
      email: 'user3@example.com',
      name: 'Alice Johnson',
      profileImagePath: '/images/user3.png',
      birth: '1995-09-15',
      gender: 'Female',
      country: 'UK',
      ageRange: '25~30',
      password: 'password123',
      schoolName: 'University C',
    ),
  ];

  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    final user = _mockUsers.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () => throw Exception('User not found or incorrect password'),
    );

    return user;
  }

  Future<UserModel> register(UserModel user, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (_mockUsers.any((existingUser) => existingUser.email == user.email)) {
      throw Exception('Email already in use');
    }

    final newUser = user.copyWith(
      userId: _mockUsers.length + 1,
      password: password,
    );

    _mockUsers.add(newUser);

    return newUser;
  }

  List<UserModel> getAllUsers() {
    return _mockUsers;
  }
}
