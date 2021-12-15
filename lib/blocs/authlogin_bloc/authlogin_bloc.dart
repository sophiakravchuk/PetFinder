import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/blocs/authlogin_bloc/authlogin_event.dart';
import 'package:lost_animal/blocs/authlogin_bloc/authlogin_state.dart';

class AuthLogInBloc extends Bloc<AuthLogInEvent, AuthLogInState> {
  AuthLogInBloc() : super(AuthLogInInitial());

  @override
  Stream<AuthLogInState> mapEventToState(AuthLogInEvent event) async* {
    if (event is AuthLogInEnter) {
      yield* _mapAuthLogInEnter(event);
    }
  }

  Stream<AuthLogInState> _mapAuthLogInEnter(AuthLogInEnter event) async* {
  //   TODO: add repository or just api request to get user info
    yield AuthLogInEntered(
        username: "Julia", phoneNumber: "066", mail: "julia@gmail.com");
  }
}
