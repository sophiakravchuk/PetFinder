import 'package:equatable/equatable.dart';

abstract class PersonalInfoEvent extends Equatable {
  const PersonalInfoEvent();

  @override
  List<Object> get props => [];
}

class PersonalInfoLoad extends PersonalInfoEvent {}
class PersonalInfoLogOut  extends PersonalInfoEvent {}