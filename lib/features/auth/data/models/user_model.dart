import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int userId;
  final String email;
  final String name;
  final String? profileImagePath;
  final String? birth;
  final String? gender;
  final String? country;
  final String? ageRange;
  final String? password;
  final String? schoolName;
  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    this.profileImagePath,
    this.birth,
    this.gender,
    this.country,
    this.ageRange,
    this.password,
    this.schoolName,
  });

  UserModel copyWith({
    int? userId,
    String? email,
    String? name,
    String? profileImagePath,
    String? birth,
    String? gender,
    String? country,
    String? ageRange,
    String? password,
    String? schoolName,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      birth: birth ?? this.birth,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      ageRange: ageRange ?? this.ageRange,
      password: password ?? this.password,
      schoolName: schoolName ?? this.schoolName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'profileImagePath': profileImagePath,
      'birth': birth,
      'gender': gender,
      'country': country,
      'ageRange': ageRange,
      'password': password,
      'schoolName': schoolName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId']?.toInt() ?? 0,
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      profileImagePath: map['profileImagePath'],
      birth: map['birth'],
      gender: map['gender'],
      country: map['country'],
      ageRange: map['ageRange'],
      password: map['password'],
      schoolName: map['schoolName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(userId: $userId, email: $email, name: $name, profileImagePath: $profileImagePath, birth: $birth, gender: $gender, country: $country, ageRange: $ageRange, password: $password, schoolName: $schoolName)';
  }

  @override
  List<Object?> get props {
    return [
      userId,
      email,
      name,
      profileImagePath,
      birth,
      gender,
      country,
      ageRange,
      password,
      schoolName,
    ];
  }
}
