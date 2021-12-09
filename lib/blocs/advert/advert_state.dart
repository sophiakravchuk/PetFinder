import 'package:equatable/equatable.dart';

abstract class AdvertState extends Equatable {
  const AdvertState();

  @override
  List<Object> get props => [];
}

class AdvertInitial extends AdvertState {}

class AdvertCreated extends AdvertState {
  final String fullName;
  final String phoneNumber;
  final String mail;
  final String animal;
  final String description;
  final String imagePath;

  AdvertCreated(
      {this.fullName,
      this.phoneNumber,
      this.mail,
      this.animal,
      this.description,
      this.imagePath});

  AdvertCreated copyWith(
      {String username,
      String phoneNumber,
      String mail,
      String animal,
      String description,
      String imagePath}) {
    return AdvertCreated(
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        mail: mail ?? this.mail,
        animal: animal ?? this.animal,
        description: description ?? this.description,
        imagePath: imagePath ?? this.imagePath);
  }

  @override
  List<Object> get props =>
      [fullName, phoneNumber, mail, animal, description, imagePath];
}
