import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PublishBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(10, 5, 5, 10),
          child: Row(
            children: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.multitrack_audio),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(enabledBorder: null, hintText: "输入你要发送的消息"),
                maxLines: 1,
              )),
              Container(
                child: IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ));
  }
}
