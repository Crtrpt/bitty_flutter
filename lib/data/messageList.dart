import 'package:faker/faker.dart';

getMsgList() {
  List<Map<String, dynamic>> list = [];
  for (var i = 0; i < 15; i++) {
    var is_me = (i % 3 == 0);
    list.add({"id": i, "f_id": i, "name": faker.person.name(), "msg": faker.lorem.sentence(), "last_time": faker.date.time(), "is_me": is_me});
  }
  return list;
}
