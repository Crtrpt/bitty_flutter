import 'package:flutter/material.dart';

class DrawerAvatar extends StatelessWidget {
  DrawerAvatar(this.user, {this.size: 40});
  var user;
  double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.size,
      height: this.size,
      child: Container(
          child: Center(
        child: (this.user?.avatar == "")
            ? Text(
                (this.user?.nick_name ?? '')[0],
                style: TextStyle(fontSize: 30, color: Colors.grey.shade500),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(this.size / 2),
                child: Image.network(
                  this.user?.avatar ?? '',
                  width: size,
                  height: size,
                )),
      )),
    );
  }
}
