import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/blocs/advert/advert_event.dart';
import 'package:lost_animal/blocs/advert/advert_state.dart';

class AdvertBloc extends Bloc<AdvertEvent, AdvertState> {
  AdvertBloc() : super(AdvertInitial());

  @override
  Stream<AdvertState> mapEventToState(AdvertEvent event) async* {
    if (event is AdvertState) {
      yield* _mapPersonalInfoLoad(event);
    }
  }

  Stream<AdvertState> _mapPersonalInfoLoad(AdvertCreation event) async* {
    //TODO: add repository or just api request to get user info
    yield AdvertCreated(
      fullName: "Julia",
      phoneNumber: "066",
      mail: "julia@gmail.com",
      imagePath:
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    );
  }
}
