import 'package:flutter/material.dart';

class GroupAvatar extends StatelessWidget {
  GroupAvatar(this.group, {this.size: 40});
  var group;
  double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.size,
      height: this.size,
      child: Container(
          child: Center(
        child: (this.group.group?.avatar == "")
            ? Text(
                (this.group.group?.name ?? '')[0],
                style: TextStyle(fontSize: 30, color: Colors.grey.shade500),
              )
            : Image.network(this.group.group?.avatar ?? ''),
      )),
    );
  }
}
