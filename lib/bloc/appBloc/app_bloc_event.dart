import 'package:equatable/equatable.dart';

class AppBlocEvent extends Equatable {
  @override
  List<Object> get props => [];

}

class AppBlocStartedEvent extends AppBlocEvent{}

class AppBlocSetFirstTimeLaunchEvent extends AppBlocEvent{
  final bool isFirstLaunch ; 
  AppBlocSetFirstTimeLaunchEvent(this.isFirstLaunch);
}
