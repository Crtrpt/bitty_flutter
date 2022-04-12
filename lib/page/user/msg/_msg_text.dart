import 'package:flutter/material.dart';

class MsgText extends StatelessWidget {
  var msg;
  MsgText(this.msg);

  @override
  Widget build(BuildContext context) {
    return Text(msg, style: TextStyle(color: Colors.black87));
  }
}
