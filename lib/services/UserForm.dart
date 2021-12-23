import 'package:flutter/foundation.dart';


class UserForm {
  String userName;
  int id;
  String phone;
  String email;
  String pass;

  UserForm({
    @required this.userName,
    @required this.id,
    @required this.phone,
    @required this.email,
    @required this.pass,
  });
  factory UserForm.fromJsonStorage(Map<String, dynamic> json) {
    return UserForm(
      userName: json['userName'] as String,
      id: int.parse(json['id']),
      phone: json['phone'] as String,
      email: json['email'] as String,
      pass: json['pass'] as String,
    );
  }
  factory UserForm.fromJson(Map<String, dynamic> json) {
    return UserForm(
      userName: json['userName'] as String,
      id: json['id'] as int,
      phone: json['phone'] as String,
      email: json['email'] as String,
      pass: json['pass'] as String,
    );
  }


  Map<String, dynamic> toJson() => {
    'userName': userName,
    'id': id.toString(),
    'phone': phone,
    'email': email,
    'pass': pass,
  };

}