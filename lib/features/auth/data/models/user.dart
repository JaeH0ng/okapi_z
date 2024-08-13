import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  String email;
  String name;
  String birth;
  String gender;
  String country;
  String ageRange;
  String password;
  String schoolName;
  String profileImagePath;

  User({
    required this.email,
    required this.name,
    required this.birth,
    required this.gender,
    required this.country,
    required this.ageRange,
    required this.password,
    required this.schoolName,
    required this.profileImagePath,
  });

  User copyWith({
    String? email,
    String? name,
    String? birth,
    String? gender,
    String? country,
    String? ageRange,
    String? password,
    String? schoolName,
    String? profileImagePath,
  }) {
    return User(
      email: email ?? this.email,
      name: name ?? this.name,
      birth: birth ?? this.birth,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      ageRange: ageRange ?? this.ageRange,
      password: password ?? this.password,
      schoolName: schoolName ?? this.schoolName,
      profileImagePath: profileImagePath ?? this.profileImagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'birth': birth,
      'gender': gender,
      'country': country,
      'ageRange': ageRange,
      'password': password,
      'schoolName': schoolName,
      'profileImagePath': profileImagePath,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      birth: map['birth'] ?? '',
      gender: map['gender'] ?? '',
      country: map['country'] ?? '',
      ageRange: map['ageRange'] ?? '',
      password: map['password'] ?? '',
      schoolName: map['schoolName'] ?? '',
      profileImagePath: map['profileImagePath'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(email: $email, name: $name, birth: $birth, gender: $gender, country: $country, ageRange: $ageRange, password: $password, schoolName: $schoolName, profileImagePath: $profileImagePath)';
  }

  @override
  List<Object> get props {
    return [
      email,
      name,
      birth,
      gender,
      country,
      ageRange,
      password,
      schoolName,
      profileImagePath,
    ];
  }
}
