import 'package:flutter/material.dart';

class SelectTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: () => {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 500,
                        child: Center(
                          child: ListView(
                            children: [
                              ListTile(
                                title: Text("默认(自动切换)"),
                              ),
                              ListTile(
                                title: Text("白天"),
                              ),
                              ListTile(
                                title: Text("黑夜"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                },
            child: Text(
              '选择主题',
            )),
        Text("当前主题：" + "自动")
      ],
    );
  }
}
