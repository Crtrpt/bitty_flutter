import 'package:flutter/material.dart';

class ContactAvatar extends StatelessWidget {
  ContactAvatar(this.contact, {this.size: 40});
  var contact;
  double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.size,
      height: this.size,
      child: Container(
          child: Center(
        child: (this.contact.user?.avatar == "")
            ? Text(
                (this.contact.user?.nick_name ?? '')[0],
                style: TextStyle(fontSize: 30, color: Colors.grey.shade500),
              )
            : Image.network(this.contact.user?.avatar ?? ''),
      )),
    );
  }
}
