import 'package:flutter/material.dart';

class SelectLanguage extends StatelessWidget {
  var languageList = [
    {"name": "自动"},
    {"name": "英文"},
    {"name": "中文"},
    {"name": "俄文"},
    {"name": "日文"},
    {"name": "法语"},
    {"name": "德语"},
    {"name": "葡萄牙"},
  ];

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
                          child: ListView.builder(
                            itemBuilder: (ctx, idx) {
                              return ListTile(title: Text(languageList[idx]["name"]!));
                            },
                            itemCount: languageList.length,
                          ),
                        ),
                      );
                    },
                  )
                },
            child: Text(
              '选择语言',
            )),
        Text("当前语言：" + "跟随系统")
      ],
    );
  }
}
