import 'package:faker/faker.dart';

getEndpointList() {
  List<Map<String, dynamic>> list = [];
  for (var i = 0; i < 100; i++) {
    var name = faker.person.name();
    list.add({
      "id": i,
      "name": name,
      "remark": "备注信息",
      "scenes_type": 0, //0 文字聊天场景 1 视频聊天 2 语音聊天 3 地图聊天
      "last_msg": faker.lorem.sentence(),
      "last_time": faker.date.time(),
      "is_pin": i < 3,
      "is_important": (i % 3) == 0,
      "unread": faker.randomGenerator.integer(99)
    });
  }
  return list;
}
