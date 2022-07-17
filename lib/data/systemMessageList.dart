import 'package:faker/faker.dart';

getSystemMessageList() {
  List<Map<String, dynamic>> list = [];

  list.add({"id": 1, "title": "xx 请求添加你为好友", "time": faker.date.time(), "type": 0, "unread": false, 'level': 0});
  list.add({"id": 5, "title": "你同意了xx的好友添加请求", "time": faker.date.time(), "type": 2, "unread": false, 'level': 0});
  list.add({"id": 6, "title": "你拒绝了xx的好友添加请求", "time": faker.date.time(), "type": 2, "unread": false, 'level': 0});

  list.add({"id": 4, "title": "你请求添加xx为好友", "time": faker.date.time(), "type": 2, "unread": false, 'level': 2});
  list.add({"id": 2, "title": "xx 同意了你的好友添加请求", "time": faker.date.time(), "type": 1, "unread": false, 'level': 1});
  list.add({"id": 3, "title": "xx 拒绝了你的好友请求", "time": faker.date.time(), "type": 2, "unread": false, 'level': 2});

  return list;
}
