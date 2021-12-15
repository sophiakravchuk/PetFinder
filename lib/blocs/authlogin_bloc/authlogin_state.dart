import 'package:equatable/equatable.dart';

abstract class AuthLogInState extends Equatable {
  const AuthLogInState();

  @override
  List<Object> get props => [];
}

class AuthLogInInitial extends AuthLogInState {}

class AuthLogInEntered extends AuthLogInState {
  final String username;
  final String phoneNumber;
  final String mail;

  AuthLogInEntered({this.username, this.phoneNumber, this.mail});

  AuthLogInEntered copyWith({String username, String phoneNumber, String mail}) {
    return AuthLogInEntered(
        username: username ?? this.username,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        mail: mail ?? this.mail);
  }

  @override
  List<Object> get props => [username, phoneNumber, mail];
}
