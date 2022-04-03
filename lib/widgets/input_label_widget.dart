import 'package:flutter/cupertino.dart';

import '../light_theme.dart';

class InputLabelWidget extends StatelessWidget {
  final bool isRequired;
  final String? text;
  InputLabelWidget(this.text, {this.isRequired = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(
              text ?? "",
              style: TextStyle(color: MyTheme.primary, fontSize: 12),
            ),
          ),
          isRequired
              ? Text(
                  "(مطلوب *)",
                  style: TextStyle(color: MyTheme.error, fontSize: 12),
                )
              : Container()
        ],
      ),
    );
  }
}
