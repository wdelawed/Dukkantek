import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitEvent extends LoginEvent {}

class LoginStartedEvent extends LoginEvent {
  final String email;
  final String password;
  LoginStartedEvent(this.email, this.password);
}

class GoogleLoginStartedEvent extends LoginEvent {
  GoogleLoginStartedEvent();
}
