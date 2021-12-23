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
  final String animalName;
  final String description;
  final String image;
  final int userId;

  AdvertCreated(
      {this.fullName,
        this.phoneNumber,
        this.mail,
        this.animal,
        this.animalName,
        this.description,
        this.image,
        this.userId,
      });

  AdvertCreated copyWith(
      {String username,
        String phoneNumber,
        String mail,
        String animal,
        String animalName,
        String description,
        String image,
        int userId}) {
    return AdvertCreated(
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        mail: mail ?? this.mail,
        animalName: animalName ?? this.animalName,
        animal: animal ?? this.animal,
        description: description ?? this.description,
        image: image ?? this.image,
        userId: userId ?? this.userId);
  }

  @override
  List<Object> get props =>
      [fullName, phoneNumber, mail, animal, animalName, description, image, userId];
}

class AdvertLoaded extends AdvertState {
  final String fullName;
  final String phoneNumber;
  final String mail;
  final String animal;
  final String animalName;
  final String description;
  final String image;
  final int userId;

  AdvertLoaded(
      {this.fullName,
        this.phoneNumber,
        this.mail,
        this.animal,
        this.animalName,
        this.description,
        this.image,
        this.userId});

  AdvertLoaded copyWith(
      {String username,
        String phoneNumber,
        String mail,
        String animal,
        String animalName,
        String description,
        String image,
        int userId}) {
    return AdvertLoaded(
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        mail: mail ?? this.mail,
        animalName: animalName ?? this.animalName,
        animal: animal ?? this.animal,
        description: description ?? this.description,
        image: image ?? this.image,
        userId: userId ?? this.userId);
  }

  @override
  List<Object> get props =>
      [fullName, phoneNumber, mail, animal, animalName, description, image, userId];
}
