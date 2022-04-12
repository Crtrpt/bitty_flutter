import 'package:flutter/material.dart';

class PublishBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PublishBox();
  }
}

class _PublishBox extends State<PublishBox> {
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
