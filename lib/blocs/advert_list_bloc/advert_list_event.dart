import 'package:equatable/equatable.dart';

abstract class AdventListEvent extends Equatable {
  const AdventListEvent();

  @override
  List<Object> get props => [];
}

class AdventListLoad extends AdventListEvent {}