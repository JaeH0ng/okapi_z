import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  String email;
  String name;
  String birth;
  String password;
  String schoolName;
  String schoolPlaceId;

  User({
    required this.email,
    required this.name,
    required this.birth,
    required this.password,
    required this.schoolName,
    required this.schoolPlaceId,
  });

  User copyWith({
    String? email,
    String? name,
    String? birth,
    String? password,
    String? schoolName,
    String? schoolPlaceId,
  }) {
    return User(
      email: email ?? this.email,
      name: name ?? this.name,
      birth: birth ?? this.birth,
      password: password ?? this.password,
      schoolName: schoolName ?? this.schoolName,
      schoolPlaceId: schoolPlaceId ?? this.schoolPlaceId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'birth': birth,
      'password': password,
      'schoolName': schoolName,
      'schoolPlaceId': schoolPlaceId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      birth: map['birth'] ?? '',
      password: map['password'] ?? '',
      schoolName: map['schoolName'] ?? '',
      schoolPlaceId: map['schoolPlaceId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(email: $email, name: $name, birth: $birth, password: $password, schoolName: $schoolName, schoolPlaceId: $schoolPlaceId)';
  }

  @override
  List<Object> get props {
    return [
      email,
      name,
      birth,
      password,
      schoolName,
      schoolPlaceId,
    ];
  }
}
