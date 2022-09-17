import 'package:bitty/model/session.dart';
import 'package:flutter/material.dart';

class SessionAvatar extends StatelessWidget {
  SessionAvatar(this.session, {this.size: 40});
  Session? session;
  double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.size,
      height: this.size,
      child: Container(
          child: Center(
        child: (this.session?.avatar == "")
            ? Text(
                (this.session?.name ?? '')[0],
                style: TextStyle(fontSize: 30, color: Colors.grey.shade500),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(this.size / 2),
                child: Image.network(
                  this.session?.avatar ?? '',
                  width: size,
                  height: size,
                )),
      )),
    );
  }
}
