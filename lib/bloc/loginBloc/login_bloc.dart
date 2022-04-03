import 'package:dukkantek_assignment/models/loggedIn_user_model.dart';
import 'package:dukkantek_assignment/network/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_bloc_events.dart';
import 'login_bloc_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  Repository repository;
  LoginBloc(this.repository) : super(LoginInitState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginStartedEvent) {
      yield LoginLoadingState();
      try {
        LoggedInUserModel user =
            await repository.login(event.email, event.password);
        yield LoginSuccessState(user.token ?? "", user.username ?? "",
            user.user_email ?? "", user.user_id ?? 1, user.tokenExpiry ?? "");
      } catch (e) {
        yield LoginErrorState(e.toString());
      }
    } else if (event is GoogleLoginStartedEvent) {
      yield LoginLoadingState();
      try {
        LoggedInUserModel user = await repository.googleSignIn();
        yield LoginSuccessState(user.token ?? "", user.username ?? "",
            user.user_email ?? "", user.user_id ?? 1, user.tokenExpiry ?? "");
      } catch (e) {
        yield LoginErrorState("Failed to SignIn using google");
      }
    } else if (event is LoginInitEvent) yield LoginInitState();
  }
}
