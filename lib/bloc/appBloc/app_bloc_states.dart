import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class AppBlocState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppBlocInitState extends AppBlocState {}

class AppBlocStartingState extends AppBlocState {}

class AppBlocStartedState extends AppBlocState {
  final bool isFirstLaunch;
  AppBlocStartedState(this.isFirstLaunch);
}

class AppBlocErrorState extends AppBlocState {
  final String _error;
  AppBlocErrorState(this._error);
  String get error {
    return _error;
  }
}

/////////////////////////////////////////////////////////
///
class SetFirstLaunchStartingState extends AppBlocState {}

class SetFirstLaunchSuccessState extends AppBlocState {
  final bool isFirstLaunch;
  SetFirstLaunchSuccessState(this.isFirstLaunch);
}

class SetFirstLaunchErrorState extends AppBlocState {
  final String _error;
  SetFirstLaunchErrorState(this._error);
  String get error {
    return _error;
  }
}
