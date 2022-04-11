import 'package:flutter/material.dart';

class PublishBox extends StatefulWidget {
  var expand;
  var content;
  PublishBox({this.expand, this.content = "content"});

  @override
  State<StatefulWidget> createState() {
    return _PublishBox(this);
  }
}

class _PublishBox extends State<PublishBox> {
  var ctx;
  _PublishBox(this.ctx);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                  decoration: InputDecoration(enabledBorder: null, hintText: "send message"),
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
          )),
    );
  }
}
