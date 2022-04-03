import 'dart:async';

import 'package:dukkantek_assignment/bloc/authentication_bloc/authentication_events.dart';
import 'package:dukkantek_assignment/bloc/loginBloc/login_bloc.dart';
import 'package:dukkantek_assignment/bloc/loginBloc/login_bloc_states.dart';
import 'package:dukkantek_assignment/models/loggedIn_user_model.dart';
import 'package:dukkantek_assignment/network/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late Repository repository;
  late LoggedInUserModel? user;

  late LoginBloc _loginBloc;

  LoginBloc get loginBloc => _loginBloc;

  late StreamSubscription _loginStream;

  AuthBloc(this.repository) : super(AuthInitState()) {
    _loginBloc = LoginBloc(this.repository);

    _loginStream = _loginBloc.stream.listen((loginState) {
      if (loginState is LoginSuccessState) {
        add(LoginSuccessEvent(LoggedInUserModel(loginState.token,
            loginState.username, loginState.userEmail, loginState.userId,
            tokenExpiry: loginState.tokenExpiry)));
      } else if (loginState is LoginErrorState) {
        this.add(LoginErrorEvent(loginState.error));
      }
    });
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthStartedEvent) {
      yield AuthCheckingState();
      LoggedInUserModel _user = await repository.getAuthenticatedUser();
      if (_user != null &&
          _user.token != null &&
          _user.username != null &&
          !_user.isTokenExpired()) {
        this.user = _user;
        yield AuthAuthenticatedState(_user);
      } else {
        yield AuthUnAuthenticatedState();
      }
    } else if (event is LoginSuccessEvent) {
      await repository.setAuthenticatedUser(event.user);
      this.user = event.user;
      yield AuthAuthenticatedState(event.user);
    } else if (event is LoginErrorEvent) {
      this.user = null;
      yield AuthUnAuthenticatedState();
    } else if (event is LogoutSuccessEvent) {
      // this.user = LoggedInUserModel.empty();
      this.user = null;
      yield AuthUnAuthenticatedState();
    } else if (event is RegisterSuccessEvent) {
      await repository.setAuthenticatedUser(event.user);
      this.user = event.user;
      yield AuthAuthenticatedState(event.user);
    } else if (event is RegisterErrorEvent) {
      yield AuthUnAuthenticatedState();
    }
  }

  @override
  Future<void> close() {
    _loginStream.cancel();

    _loginBloc.close();
    return super.close();
  }
}
