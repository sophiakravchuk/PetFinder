import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/blocs/advert/advert_event.dart';
import 'package:lost_animal/blocs/advert/advert_state.dart';
import 'package:lost_animal/local_storage.dart';
import 'package:lost_animal/services/UserForm.dart';

class AdvertBloc extends Bloc<AdvertEvent, AdvertState> {
  AdvertBloc() : super(AdvertInitial());
  final LocalStorage storage = LocalStorage();
  @override
  Stream<AdvertState> mapEventToState(AdvertEvent event) async* {
    if (event is AdvertCreation) {
      yield* _mapAdvertCreate(event);
    }
    if (event is AdvertLoad) {
      yield* _mapAdvertLoad(event);
    }
  }

  Stream<AdvertState> _mapAdvertCreate(AdvertCreation event) async* {
    String info = await storage.getUserInfo();
    UserForm userForm = UserForm.fromJsonStorage(jsonDecode(info));
    //TODO: add repository or just api request to get user info
    yield AdvertCreated(
      phoneNumber: userForm.phone,
      mail: userForm.email,
      userId: userForm.id,

    );
  }

  Stream<AdvertState> _mapAdvertLoad(AdvertLoad event) async* {
    //TODO: add repository or just api request to get user info
    yield AdvertLoaded(
      fullName: "Julia",
      phoneNumber: "066",
      mail: "julia@gmail.com",
      // imagePath:
      //     'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    );
  }

}
