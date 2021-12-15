import 'package:flutter_bloc/flutter_bloc.dart';
import 'advert_list_event.dart';
import 'advert_list_state.dart';

class AdventListBloc extends Bloc<AdventListEvent, AdventListState> {

  final debugList = [
    {
      "fullName": "Julia Pochynok",
      "phoneNumber": "111111111",
      "mail": "julia@gmail.com",
      "animal": "bunny",
      "animalName": "Umu",
      "description": "Really cool bunny",
      "imagePath": null,
    },
    {
      "fullName": "Sonia",
      "phoneNumber": "222222",
      "mail": "sonia@gmail.com",
      "animal": "cat",
      "animalName": "Weiß",
      "description": "Really cool cat",
      "imagePath": null,
    },
    {
      "fullName": "Ihor",
      "phoneNumber": "33333333",
      "mail": "ihor@gmail.com",
      "animal": "dog",
      "animalName": "Dood",
      "description": "Really cool dog",
      "imagePath": null,
    },
  ];

  AdventListBloc()
      : super(AdventListInitial());

  @override
  Stream<AdventListState> mapEventToState(AdventListEvent event) async* {
    if (event is AdventListLoad) {
      yield* _mapAdventListLoad(event);
    }
  }

  Stream<AdventListState> _mapAdventListLoad(
      AdventListLoad event) async* {
    //TODO: add repository or just api request to get advents list
    List<Map> currentAdventList = debugList;
    yield AdventListLoaded(
        adventList: currentAdventList);
  }


}
