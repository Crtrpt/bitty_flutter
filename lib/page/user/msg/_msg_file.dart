import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class MsgFile extends StatefulWidget {
  var msg;
  MsgFile(this.msg);

  @override
  State<StatefulWidget> createState() => _MsgFile(msg);
}

class _MsgFile extends State<MsgFile> {
  var msg;
  _MsgFile(this.msg);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        IconButton(onPressed: () => {}, icon: Icon(Icons.insert_drive_file)),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("name:"),
                  Text(
                    faker.food.dish(),
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "size:",
                    style: TextStyle(color: Colors.black54, fontSize: 10),
                  ),
                  // Text("20M")
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
