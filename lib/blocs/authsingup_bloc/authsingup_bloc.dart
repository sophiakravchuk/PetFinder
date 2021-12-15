import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/blocs/authsingup_bloc/authsingup_event.dart';
import 'package:lost_animal/blocs/authsingup_bloc/authsingup_state.dart';

class AuthSingUpBloc extends Bloc<AuthSingUpEvent, AuthSingUpState> {
  AuthSingUpBloc() : super(AuthSingUpInitial());

  @override
  Stream<AuthSingUpState> mapEventToState(AuthSingUpEvent event) async* {
    if (event is AuthSingUpSave) {
      yield* _mapAuthSingUpSave(event);
    }
  }

  Stream<AuthSingUpState> _mapAuthSingUpSave(AuthSingUpSave event) async* {
  //   TODO: add repository or just api request to get user info
    yield AuthSingUpSaved(
        username: "Julia", phoneNumber: "066", mail: "julia@gmail.com");
  }
}
