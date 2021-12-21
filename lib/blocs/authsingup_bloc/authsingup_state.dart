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
  final String pass;
  final String confpass;

  AuthSingUpSaved({this.username, this.phoneNumber, this.mail, this.pass, this.confpass});

  AuthSingUpSaved copyWith({String username, String phoneNumber, String mail, String pass, String confpass}) {
    return AuthSingUpSaved(
        username: username ?? this.username,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        mail: mail ?? this.mail,
        pass: pass ?? this.pass,
        confpass: confpass ?? this.confpass);
  }

  @override
  List<Object> get props => [username, phoneNumber, mail, pass, confpass];
}
