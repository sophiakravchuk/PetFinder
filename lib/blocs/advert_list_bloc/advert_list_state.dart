import 'package:equatable/equatable.dart';
import 'package:lost_animal/services/LostForm_model.dart';

abstract class AdventListState extends Equatable {
  const AdventListState();

  @override
  List<Object> get props => [];
}

class AdventListInitial extends AdventListState {}

class AdventListLoaded extends AdventListState {
  final List<LostForm> adventList;
  final List<LostForm> adventListMy;

  AdventListLoaded({this.adventList, this.adventListMy});

  AdventListLoaded copyWith({List<Map> adventList, List<Map> adventListMy}) {
    return AdventListLoaded(
        adventList: adventList ?? this.adventList,
        adventListMy: adventListMy ?? this.adventListMy);
  }

  @override
  List<Object> get props => [adventList, adventListMy];
}
