import 'package:dukkantek_assignment/models/loggedIn_user_model.dart';
import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthStartedEvent extends AuthEvent {}

class LoginSuccessEvent extends AuthEvent {
  final LoggedInUserModel user;
  LoginSuccessEvent(this.user);
}

class LoginErrorEvent extends AuthEvent {
  final String error;
  LoginErrorEvent(this.error);
}

class LogoutSuccessEvent extends AuthEvent {}

class LogoutErrorEvent extends AuthEvent {
  final String error;
  LogoutErrorEvent(this.error);
}

class RegisterSuccessEvent extends AuthEvent {
  final LoggedInUserModel user;
  RegisterSuccessEvent(this.user);
}

class RegisterErrorEvent extends AuthEvent {
  final String error;
  RegisterErrorEvent(this.error);
}
