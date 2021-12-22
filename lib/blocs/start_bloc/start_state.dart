import 'package:equatable/equatable.dart';


abstract class StartState extends Equatable {
  const StartState();

  @override
  List<Object> get props => [];
}

class StartInitial extends StartState {}

class RegisterInfoLoaded extends StartState {
  final bool registered;

  RegisterInfoLoaded({this.registered});

  RegisterInfoLoaded copyWith({bool registered}) {
    return RegisterInfoLoaded(
        registered: registered ?? this.registered);
  }

  @override
  List<Object> get props => [registered];
}
