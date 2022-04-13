import 'package:dino/page/user/_avatar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        expandedHeight: 250.0,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Row(
            children: [
              Avatar(
                20,
                size: 50,
              ),
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      faker.person.name(),
                      textScaleFactor: 1,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      faker.person.name(),
                      textScaleFactor: 1,
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              )
            ],
          ),
          background: Image.asset(
            'assets/images/cover.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, int index) {
            return ListTile(
              title: Text('${index + 1}', textScaleFactor: 2),
            );
          },
          childCount: 20,
        ),
      ),
    ]));
  }
}
