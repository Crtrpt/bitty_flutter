import 'package:flutter/material.dart';

class Accept extends StatelessWidget {
  dynamic argv;
  Accept(this.argv);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Text(argv['title']),
    );
  }
}
