import 'package:okapi_z/features/auth/data/models/user_model.dart';

// 여기 작성할 코드
// 로그인 API 요청 처리
// 회원가입 API 요청 처리

import 'dart:async';
// import 'package:dio/dio.dart';

class UserRepository {
  // final Dio _dio = Dio();

  // Mock user data for debugging
  final List<UserModel> _mockUsers = [
    UserModel(
        userId: 1,
        email: 'user1@example.com',
        name: 'John Doe',
        profileImagePath: '/images/user1.png'),
    UserModel(
        userId: 2,
        email: 'user2@example.com',
        name: 'Jane Smith',
        profileImagePath: '/images/user2.png'),
    UserModel(
        userId: 3,
        email: 'user3@example.com',
        name: 'Alice Johnson',
        profileImagePath: '/images/user3.png'),
  ];

  Future<UserModel> login(String email, String password) async {
    // Simulate a delay for network request
    await Future.delayed(Duration(seconds: 1));

    // Check if the user exists in the mock data
    final user = _mockUsers.firstWhere(
      (user) => user.email == email,
      orElse: () => throw Exception('User not found'),
    );

    // Assume any password is correct for debugging purposes
    return user;
  }

  Future<UserModel> register(UserModel user, String password) async {
    // Simulate a delay for network request
    await Future.delayed(Duration(seconds: 1));

    // Check if the email is already taken
    if (_mockUsers.any((existingUser) => existingUser.email == user.email)) {
      throw Exception('Email already in use');
    }

    // Assign a new user ID
    final newUser = user.copyWith(userId: _mockUsers.length + 1);

    // Add the new user to the mock list
    _mockUsers.add(newUser);

    return newUser;
  }

  // Example method to retrieve all users (for testing purposes)
  List<UserModel> getAllUsers() {
    return _mockUsers;
  }
}
