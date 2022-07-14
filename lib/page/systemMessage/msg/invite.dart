import 'package:flutter/material.dart';

class Invite extends StatelessWidget {
  dynamic argv;
  Invite(this.argv);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Text(argv['title']),
    );
  }
}
