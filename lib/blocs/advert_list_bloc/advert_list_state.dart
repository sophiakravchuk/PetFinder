import 'package:equatable/equatable.dart';

abstract class AdventListState extends Equatable {
  const AdventListState();

  @override
  List<Object> get props => [];
}

class AdventListInitial extends AdventListState {}

class AdventListLoaded extends AdventListState {
  final List<Map> adventList;

  AdventListLoaded({this.adventList});

  AdventListLoaded copyWith({List<Map> adventList}) {
    return AdventListLoaded(
        adventList: adventList ?? this.adventList);
  }

  @override
  List<Object> get props => [adventList];
}
