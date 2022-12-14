import 'package:bitty/model/group.dart';
import 'package:flutter/material.dart';

class GroupAvatar extends StatelessWidget {
  GroupAvatar(this.group, {this.size: 40});
  Group? group;
  double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.size,
      height: this.size,
      child: Container(
          child: Center(
        child: (group?.avatar == "")
            ? Text(
                (group?.name ?? '')[0],
                style: TextStyle(fontSize: 30, color: Colors.grey.shade500),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(this.size / 2),
                child: Image.network(
                  this.group?.avatar ?? '',
                  width: size,
                  height: size,
                )),
      )),
    );
  }
}
