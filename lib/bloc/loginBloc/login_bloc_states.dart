import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String token;
  final String username;
  final String tokenExpiry;
  final int userId;
  final String userEmail;
  LoginSuccessState(
      this.token, this.username, this.userEmail, this.userId, this.tokenExpiry);
}

class LoginErrorState extends LoginState {
  final String _error;
  LoginErrorState(this._error);
  String get error {
    return _error;
  }
}
