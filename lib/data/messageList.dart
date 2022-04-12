import 'package:faker/faker.dart';

var getMsgList = () {
  List<Map<String, dynamic>> list = [];
  for (var i = 0; i < 15; i++) {
    var is_me = (i % 3 == 0);
    list.add({"id": i, "f_id": i, "name": "xx" + i.toString(), "msg": faker.company.name(), "last_time": "20:20", "is_me": is_me});
  }
  return list;
};
