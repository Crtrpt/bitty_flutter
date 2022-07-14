import 'package:flutter/material.dart';

class Refuse extends StatelessWidget {
  dynamic argv;
  Refuse(this.argv);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Text(argv['title']),
    );
  }
}
