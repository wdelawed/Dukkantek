import 'dart:ui';

import 'package:dukkantek_assignment/network/repository.dart';
import 'package:dukkantek_assignment/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/appBloc/app_bloc.dart';
import 'bloc/appBloc/app_bloc_event.dart';
import 'bloc/appBloc/app_bloc_states.dart';
import 'light_theme.dart';

Repository repository = Repository();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppBloc appBloc = AppBloc();
  @override
  void dispose() {
    appBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (appBloc.state is AppBlocInitState) appBloc.add(AppBlocStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AppBloc>(create: (context) => appBloc)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
        ],
        locale: const Locale('en', 'US'),
        title: 'Yusr App',
        theme: MyTheme.light,
        home: SplashScreen(),
      ),
    );
  }
}
