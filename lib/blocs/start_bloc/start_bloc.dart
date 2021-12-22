import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/blocs/start_bloc/start_event.dart';
import 'package:lost_animal/blocs/start_bloc/start_state.dart';

import '../../local_storage.dart';

class StartBloc extends Bloc<StartEvent, StartState> {
  StartBloc() : super(StartInitial());

  final LocalStorage storage = LocalStorage();

  @override
  Stream<StartState> mapEventToState(StartEvent event) async* {
    if (event is RegisterInfoLoad) {
      yield* _mapRegisterInfoLoad(event);
    }
  }

  Stream<RegisterInfoLoaded> _mapRegisterInfoLoad(
      RegisterInfoLoad event) async* {
    var info = await storage.getUserInfo();
    if (info != 0 && info != null) {
      yield RegisterInfoLoaded(
          registered: true);
    } else {
      yield RegisterInfoLoaded(
          registered: false);
    }
  }
}
