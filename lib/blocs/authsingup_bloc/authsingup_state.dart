import 'package:equatable/equatable.dart';

abstract class AuthSingUpState extends Equatable {
  const AuthSingUpState();

  @override
  List<Object> get props => [];
}

class AuthSingUpInitial extends AuthSingUpState {}

class AuthSingUpSaved extends AuthSingUpState {
  final String username;
  final String phoneNumber;
  final String mail;

  AuthSingUpSaved({this.username, this.phoneNumber, this.mail});

  AuthSingUpSaved copyWith({String username, String phoneNumber, String mail}) {
    return AuthSingUpSaved(
        username: username ?? this.username,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        mail: mail ?? this.mail);
  }

  @override
  List<Object> get props => [username, phoneNumber, mail];
}
