import 'package:equatable/equatable.dart';

abstract class AuthLogInEvent extends Equatable {
  const AuthLogInEvent();

  @override
  List<Object> get props => [];
}

class AuthLogInEnter extends AuthLogInEvent {}