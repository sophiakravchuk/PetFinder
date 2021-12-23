import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';


class LostForm {
   String userName;
   int id;
   String phone;
   String email;
   int userId;
   String internal_id;

   String fullName;
   String petType;
   String advertType;
   String petName;
   String description;

  LostForm({
    @required this.userName,
    @required this.id,
    @required this.phone,
    @required this.email,
    @required this.userId,
    @required this.fullName,
    @required this.petType,
    @required this.advertType,
    @required this.petName,
    @required this.description,
    @required this.internal_id,
  });

  factory LostForm.fromJson(Map<String, dynamic> json) {
    return LostForm(
      userName: json['userName'] as String,
      id: json['id'] as int,
      phone: json['phone'] as String,
      email: json['email'] as String,
      userId: json['userId'] as int,
      fullName: json['fullName'] as String,
      petType: json['petType'] as String,
      advertType: json['advertType'] as String,
      petName: json['petName'] as String,
      description: json['description'] as String,
      internal_id: json['_id'] as String
    );
  }


  Map<String, dynamic> toJson() => {
    'userName': userName,
    'id': id.toString(),
    'phone': phone,
    'email': email,
    'userId': userId,
    'fullName': fullName,
    'petType': petType,
    'advertType': advertType,
    'petName': petName,
    'description': description,
    '_id': internal_id,
  };

}