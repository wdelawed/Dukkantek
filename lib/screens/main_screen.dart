import 'package:dukkantek_assignment/bloc/appBloc/app_bloc.dart';
import 'package:dukkantek_assignment/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:dukkantek_assignment/bloc/authentication_bloc/authentication_states.dart';
import 'package:dukkantek_assignment/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pagesCount = 4;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BackgroundWidget(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthUnAuthenticatedState) {
              return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Container(
                    child: Center(
                      child: Text("You are not loggedin"),
                    ),
                  ));
            } else if (state is AuthAuthenticatedState) {
              return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: Container(
                      child: Text("Logged in user"),
                    ),
                  ));
            } else
              return Scaffold(
                  body: Center(
                child: CircularProgressIndicator(),
              ));
          },
          bloc: BlocProvider.of<AppBloc>(context).authBloc,
        ),
      ),
    );
  }
}
