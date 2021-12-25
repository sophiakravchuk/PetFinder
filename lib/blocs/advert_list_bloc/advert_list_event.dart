import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AdventListEvent extends Equatable {
  const AdventListEvent();

  @override
  List<Object> get props => [];
}

class AdventListLoad extends AdventListEvent {}

class AdventListDelete extends AdventListEvent {
  final int id;

  AdventListDelete({@required this.id});

  @override
  List<Object> get props => [id];
}

