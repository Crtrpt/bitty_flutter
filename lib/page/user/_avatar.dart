import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  var id;
  Avatar(this.id);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x10000000),
                  blurRadius: .1,
                  spreadRadius: 0.5,
                ), //BoxShadow
              ],
              borderRadius: new BorderRadius.all(Radius.circular(100)),
            ),
            padding: EdgeInsets.all(4),
            child: Positioned.fill(
                child: Image.network(
              "https://api.multiavatar.com/" + id.toString() + ".png",
              width: 40,
              height: 40,
            )),
          ),
          // Positioned(left: 0, bottom: 0, child: Icon(Icons.android_outlined)),
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(border: Border.all(width: 4, color: Colors.white), color: Colors.green, shape: BoxShape.circle),
              )),
        ],
      ),
    );
  }
}
