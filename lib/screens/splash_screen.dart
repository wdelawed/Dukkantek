import 'dart:async';

import 'package:dukkantek_assignment/bloc/appBloc/app_bloc.dart';
import 'package:dukkantek_assignment/bloc/authentication_bloc/authentication_states.dart';
import 'package:dukkantek_assignment/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../light_theme.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigate() async {
    await Future.delayed(Duration(seconds: 3));
    if (BlocProvider.of<AppBloc>(context).authBloc.state
        is AuthAuthenticatedState) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MainScreen();
      }));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginAndRegisterScreen();
      }));
    }
  }

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/icons/logo.jpg"),
                ),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
      ),
    );
  }
}
