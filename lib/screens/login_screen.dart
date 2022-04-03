import 'package:dukkantek_assignment/widgets/background_widget.dart';
import 'package:dukkantek_assignment/widgets/login_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../light_theme.dart';

class LoginAndRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: DefaultTabController(
          length: 1,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                leadingWidth: 100,
                expandedHeight: 247,
                flexibleSpace: FlexibleSpaceBar(
                  background: Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.only(top: 50, bottom: 48),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          image: DecorationImage(
                              image: AssetImage(
                            "assets/icons/logo.jpg",
                          ))),
                    ),
                  ),
                ),
                bottom: TabBar(
                  indicatorWeight: 5,
                  labelColor: MyTheme.primary,
                  indicatorColor: MyTheme.primary,
                  tabs: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text("LOGIN"),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 450,
                  child: TabBarView(
                    children: [LoginFormWidget()],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
