import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/blocs/pesonalInfo_bloc/personalInfo_event.dart';
import 'package:lost_animal/blocs/pesonalInfo_bloc/personalInfo_state.dart';
import 'package:lost_animal/services/UserForm.dart';

import '../../local_storage.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc() : super(PersonalInfoInitial());

  final LocalStorage storage = LocalStorage();

  @override
  Stream<PersonalInfoState> mapEventToState(PersonalInfoEvent event) async* {
    if (event is PersonalInfoLoad) {
      yield* _mapPersonalInfoLoad(event);
    }
    else if (event is PersonalInfoLogOut) {
      yield* _mapPersonalInfoLogOut(event);
    }
  }

  Stream<PersonalInfoState> _mapPersonalInfoLoad(
      PersonalInfoLoad event) async* {
    String info = await storage.getUserInfo();
    UserForm userForm = UserForm.fromJsonStorage(jsonDecode(info));
    yield PersonalInfoLoaded(
        username: userForm.userName, phoneNumber: userForm.phone, mail: userForm.email);
  }
  Stream<PersonalInfoState> _mapPersonalInfoLogOut(
      PersonalInfoLogOut event) async* {
    storage.removeUserInfo();
    yield PersonalInfoLogOutDone(
        username: "", phoneNumber: "", mail: "");
  }
}
