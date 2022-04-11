import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("系统设置"),
          actions: [],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [ElevatedButton(child: Text("清空缓存"), onPressed: () => {})],
                )
              ],
            )));
  }
}
