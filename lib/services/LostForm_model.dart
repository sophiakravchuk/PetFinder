import 'package:flutter/foundation.dart';

class Post {
  final String userName;
  final int id;
  final String phone;
  final String email;

  Post({
    @required this.userName,
    @required this.id,
    @required this.phone,
    @required this.email,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userName'] as int,
      id: json['id'] as int,
      title: json['phone'] as String,
      body: json['email'] as String,
    );
  }
}