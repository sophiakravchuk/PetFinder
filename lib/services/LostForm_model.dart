

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';



// part 'data.g.dart';

// @JsonSerializable()
class LostForm {
  final String userName;
  final int id;
  final String phone;
  final String email;

  LostForm({
    @required this.userName,
    @required this.id,
    @required this.phone,
    @required this.email,
  });

  factory LostForm.fromJson(Map<String, dynamic> json) {
    return LostForm(
      userName: json['userName'] as String,
      id: json['id'] as int,
      phone: json['phone'] as String,
      email: json['email'] as String,
    );
  }


  Map<String, dynamic> toJson() => {
    'userName': userName,
    'id': id.toString(),
    'phone': phone,
    'email': email,
  };

}