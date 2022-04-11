import 'package:flutter/material.dart';

class CleanCache extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: () => {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(title: Text("提示"), content: const Text('本次操作将删除所有本地缓存'), actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, '取消'),
                              child: const Text('取消'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, '确认'),
                              child: const Text('确认'),
                            ),
                          ]))
                },
            child: Text(
              '清除缓存',
            )),
        Text("当前占用空间：" + "10M")
      ],
    );
  }
}
