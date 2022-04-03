import 'package:bloc/bloc.dart';
import 'package:dukkantek_assignment/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:dukkantek_assignment/bloc/authentication_bloc/authentication_events.dart';
import 'package:dukkantek_assignment/network/repository.dart';

import 'app_bloc_event.dart';
import 'app_bloc_states.dart';

class AppBloc extends Bloc<AppBlocEvent, AppBlocState> {
  late Repository _repository;
  late AuthBloc authBloc;

  bool isFirstLaunch = true;
  AppBloc() : super(AppBlocInitState()) {
    _repository = Repository();
    authBloc = AuthBloc(_repository);
  }

  @override
  Stream<AppBlocState> mapEventToState(event) async* {
    if (event is AppBlocStartedEvent) {
      yield AppBlocStartingState();
      authBloc.add(AuthStartedEvent());
      try {
        isFirstLaunch = await _repository.isAppFirstLaunch();
        yield AppBlocStartedState(isFirstLaunch);
      } catch (e) {
        yield AppBlocErrorState(e.toString());
      }
    } else if (event is AppBlocSetFirstTimeLaunchEvent) {
      yield SetFirstLaunchStartingState();
      try {
        await _repository.setAppFirstLaunch(event.isFirstLaunch);
        yield SetFirstLaunchSuccessState(event.isFirstLaunch);
      } catch (e) {
        yield SetFirstLaunchErrorState(e.toString());
      }
    }
  }
}
