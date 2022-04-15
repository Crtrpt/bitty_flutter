import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  var id;
  double? size = 50;
  Avatar(this.id, {this.size = 40});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
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
              padding: EdgeInsets.all(0),
              child: Image.asset(
                'assets/images/' + faker.randomGenerator.integer(5).toString() + '.png',
                width: size! - 10,
                height: size! - 10,
              ),
            ),
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
