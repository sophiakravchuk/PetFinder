import 'package:equatable/equatable.dart';

abstract class AdvertEvent extends Equatable {
  const AdvertEvent();

  @override
  List<Object> get props => [];
}

class AdvertCreation extends AdvertEvent {}
