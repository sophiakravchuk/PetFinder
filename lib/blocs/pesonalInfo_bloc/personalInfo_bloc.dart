import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/blocs/pesonalInfo_bloc/personalInfo_event.dart';
import 'package:lost_animal/blocs/pesonalInfo_bloc/personalInfo_state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc() : super(PersonalInfoInitial());

  @override
  Stream<PersonalInfoState> mapEventToState(PersonalInfoEvent event) async* {
    if (event is PersonalInfoLoad) {
      yield* _mapPersonalInfoLoad(event);
    }
  }

  Stream<PersonalInfoState> _mapPersonalInfoLoad(
      PersonalInfoLoad event) async* {
    //TODO: add repository or just api request to get user info
    yield PersonalInfoLoaded(
        username: "Julia", phoneNumber: "066", mail: "julia@gmail.com");
  }
}
