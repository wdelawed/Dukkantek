import 'package:flutter/cupertino.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget? child;
  BackgroundWidget({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage("assets/icons/illustration_background.png"),
        ),
      ),
      constraints: BoxConstraints.expand(),
      child: Center(
        child: this.child,
      ),
    );
  }
}
