import 'package:equatable/equatable.dart';

abstract class PersonalInfoState extends Equatable {
  const PersonalInfoState();

  @override
  List<Object> get props => [];
}

class PersonalInfoInitial extends PersonalInfoState {}

class PersonalInfoLoaded extends PersonalInfoState {
  final String username;
  final String phoneNumber;
  final String mail;

  PersonalInfoLoaded({this.username, this.phoneNumber, this.mail});

  PersonalInfoLoaded copyWith({String username, String phoneNumber, String mail}) {
    return PersonalInfoLoaded(
        username: username ?? this.username,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        mail: mail ?? this.mail);
  }

  @override
  List<Object> get props => [username, phoneNumber, mail];
}
class PersonalInfoLogOutDone extends PersonalInfoState {
  final String username;
  final String phoneNumber;
  final String mail;

  PersonalInfoLogOutDone({this.username, this.phoneNumber, this.mail});

  PersonalInfoLogOutDone copyWith({String username, String phoneNumber, String mail}) {
    return PersonalInfoLogOutDone(
        username: username ?? this.username,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        mail: mail ?? this.mail);
  }

  @override
  List<Object> get props => [username, phoneNumber, mail];
}
