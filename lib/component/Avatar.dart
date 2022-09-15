import 'package:flutter/cupertino.dart';

class Avatar extends StatelessWidget {
  const Avatar({this.size = 40, this.userId = ""});
  final String userId;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text("avatar");
  }
}
