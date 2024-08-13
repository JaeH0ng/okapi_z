import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class UserModel extends Equatable {
  final int userId;
  final String email;
  final String name;
  final String? profileImagePath;
  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    this.profileImagePath,
  });

  UserModel copyWith({
    int? userId,
    String? email,
    String? name,
    ValueGetter<String?>? profileImagePath,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      profileImagePath:
          profileImagePath != null ? profileImagePath() : this.profileImagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'profileImagePath': profileImagePath,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId']?.toInt() ?? 0,
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      profileImagePath: map['profileImagePath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel1(userId: $userId, email: $email, name: $name, profileImagePath: $profileImagePath)';
  }

  @override
  List<Object?> get props => [userId, email, name, profileImagePath];
}
