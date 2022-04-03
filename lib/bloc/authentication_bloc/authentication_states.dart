import 'package:dukkantek_assignment/models/loggedIn_user_model.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitState extends AuthState {}

class AuthCheckingState extends AuthState {}

class AuthUnAuthenticatedState extends AuthState {}

class AuthAuthenticatedState extends AuthState {
  final LoggedInUserModel loggedInUser;
  AuthAuthenticatedState(this.loggedInUser);
}

class AuthAuthenticationErrorState extends AuthState {
  final String _error;
  AuthAuthenticationErrorState(this._error);
  String get error {
    return _error;
  }
}
