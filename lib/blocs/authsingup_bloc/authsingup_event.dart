import 'package:equatable/equatable.dart';

abstract class AuthSingUpEvent extends Equatable {
  const AuthSingUpEvent();

  @override
  List<Object> get props => [];
}

class AuthSingUpSave extends AuthSingUpEvent {}