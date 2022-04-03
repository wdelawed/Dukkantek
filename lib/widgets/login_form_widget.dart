import 'package:dukkantek_assignment/bloc/appBloc/app_bloc.dart';
import 'package:dukkantek_assignment/bloc/loginBloc/login_bloc.dart';
import 'package:dukkantek_assignment/bloc/loginBloc/login_bloc_events.dart';
import 'package:dukkantek_assignment/bloc/loginBloc/login_bloc_states.dart';
import 'package:dukkantek_assignment/models/loggedIn_user_model.dart';
import 'package:dukkantek_assignment/screens/main_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../light_theme.dart';

class LoginFormWidget extends StatefulWidget {
  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? email;
  String? password;

  bool showPassword = false;
  @override
  void initState() {
    BlocProvider.of<AppBloc>(context).authBloc.loginBloc.add(LoginInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: BlocProvider.of<AppBloc>(context).authBloc.loginBloc,
      listener: (context, state) {
        if (state is LoginErrorState) {
          Fluttertoast.showToast(
              msg: "${state.error}",
              toastLength: Toast.LENGTH_LONG,
              textColor: Colors.white,
              backgroundColor: Colors.red[800]);
        } else if (state is LoginSuccessState) {
          BlocProvider.of<AppBloc>(context).authBloc.user = LoggedInUserModel(
              state.token, state.username, state.userEmail, state.userId);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return MainScreen();
          }));
        }
      },
      child: Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formkey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 28),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Material(
                    shadowColor: Colors.black.withOpacity(.16),
                    elevation: 8,
                    child: TextFormField(
                      textDirection: TextDirection.ltr,
                      onSaved: (v) {
                        email = v;
                      },
                      validator: LoggedInUserModel.emailValidator,
                      decoration: InputDecoration(hintText: "Your Email"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Material(
                    shadowColor: Colors.black.withOpacity(.16),
                    elevation: 8,
                    child: TextFormField(
                      obscureText: !showPassword,
                      onSaved: (v) {
                        password = v;
                      },
                      validator: LoggedInUserModel.passwordValidator,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: " Password",
                        suffixIcon: GestureDetector(
                          child: Icon(
                            Icons.remove_red_eye,
                            color: MyTheme.secondary,
                          ),
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  bloc: BlocProvider.of<AppBloc>(context).authBloc.loginBloc,
                  builder: (context, state) {
                    if (state is LoginLoadingState)
                      return Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Material(
                          child: TextButton(
                        style: ButtonStyle(
                          textStyle:
                              MaterialStateProperty.resolveWith<TextStyle>(
                                  (Set<MaterialState> states) {
                            return TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Cairo");
                          }),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Colors.transparent))),
                          minimumSize: MaterialStateProperty.resolveWith<Size>(
                              (Set<MaterialState> states) {
                            return Size(125, 49);
                          }),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return MyTheme.focused;
                            return MyTheme.primary;
                          }),
                        ),
                        child: Text("LOGIN "),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            BlocProvider.of<AppBloc>(context)
                                .authBloc
                                .loginBloc
                                .add(LoginStartedEvent(
                                    email ?? "", password ?? ""));
                          }
                        },
                      )),
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: null,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 1,
                          color: Color(0xff010101).withOpacity(.32),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: Text("OR LOGIN WITH"),
                      ),
                      Expanded(
                        child: Divider(
                          height: 1,
                          color: Color(0xff010101).withOpacity(.32),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding: EdgeInsets.all(0),
                    buttonHeight: 50.42,
                    buttonMinWidth: 50.42,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        constraints:
                            BoxConstraints.expand(width: 50.42, height: 50.42),
                        padding: EdgeInsets.all(0),
                        iconSize: 50.42,
                        onPressed: () {
                          BlocProvider.of<AppBloc>(context)
                              .authBloc
                              .loginBloc
                              .add(GoogleLoginStartedEvent());
                        },
                        icon: SvgPicture.asset("assets/svgs/ic_google.svg"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
