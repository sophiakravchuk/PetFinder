import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/services/LostForm_model.dart';
import 'package:lost_animal/services/http_services.dart';
import 'advert_list_event.dart';
import 'advert_list_state.dart';

class AdventListBloc extends Bloc<AdventListEvent, AdventListState> {

  final httpService = HttpService();

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
    List<LostForm> advertList = await httpService.getLostForms();
    yield AdventListLoaded(
        adventList: advertList);
  }


}
