import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PublishBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 5, 10),
      child: Row(
        children: [
          Container(
            child: IconButton(
              icon: Icon(Icons.qr_code),
              color: Colors.grey,
              onPressed: () {},
            ),
          ),
          Expanded(child: TextField()),
          Container(
            child: IconButton(
              icon: Icon(Icons.qr_code),
              color: Colors.grey,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
