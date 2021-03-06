import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/services/LostForm_model.dart';
import 'package:lost_animal/services/UserForm.dart';
import 'package:lost_animal/services/http_services.dart';
import '../../local_storage.dart';
import 'advert_list_event.dart';
import 'advert_list_state.dart';

class AdventListBloc extends Bloc<AdventListEvent, AdventListState> {

  final httpService = HttpService();
  final LocalStorage storage = LocalStorage();

  AdventListBloc()
      : super(AdventListInitial());

  @override
  Stream<AdventListState> mapEventToState(AdventListEvent event) async* {
    if (event is AdventListLoad) {
      yield* _mapAdventListLoad(event);
    } else if (event is AdventListDelete) {
      yield* _mapAdventListDelete(event);
    }
  }

  Stream<AdventListState> _mapAdventListLoad(
      AdventListLoad event) async* {
    yield AdventListLoading();
    List<LostForm> advertListMy = [];
    List<LostForm> advertList = await httpService.getLostForms();
    String info = await storage.getUserInfo();
    // String info1 = await storage.removeUserInfo();
    UserForm userForm = UserForm.fromJsonStorage(jsonDecode(info));
    for (LostForm advert in advertList) {
      if (advert.userId == userForm.id) {
        advertListMy.add(advert);
      }
    }
    yield AdventListLoaded(
        adventList: advertList, adventListMy: advertListMy);
  }

  Stream<AdventListState> _mapAdventListDelete(
      AdventListDelete event) async* {
    yield AdventListLoading();

    var result = await httpService.deleteLostForm(event.id);
    List<LostForm> advertListMy = [];
    List<LostForm> advertList = await httpService.getLostForms();
    String info = await storage.getUserInfo();
    // String info1 = await storage.removeUserInfo();
    UserForm userForm = UserForm.fromJsonStorage(jsonDecode(info));
    for (LostForm advert in advertList) {
      if (advert.userId == userForm.id) {
        advertListMy.add(advert);
      }
    }
    yield AdventListLoaded(
        adventList: advertList, adventListMy: advertListMy);
  }

}
