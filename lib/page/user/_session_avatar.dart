import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class SessionAvatar extends StatelessWidget {
  var session;

  SessionAvatar(this.session);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
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
                child: Image.asset(
                  'assets/images/' + faker.randomGenerator.integer(5).toString() + '.png',
                  width: 40,
                  height: 40,
                )),
          ),
          // Positioned(left: 0, bottom: 0, child: Icon(Icons.android_outlined)),
          if (session['is_important']) ...[
            Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red), color: Colors.red, shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      "99",
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ),
                ))
          ],
          //在线状态
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
