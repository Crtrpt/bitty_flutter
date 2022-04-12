import 'package:faker/faker.dart';

getEndpointList() {
  List<Map<String, dynamic>> list = [];
  for (var i = 0; i < 100; i++) {
    var name = faker.person.name();
    list.add({"id": i, "name": name, "last_msg": faker.lorem.sentence(), "last_time": faker.date.time(), "is_pin": i < 3, "is_important": (i % 3) == 0, "unread": faker.randomGenerator.integer(99)});
  }
  return list;
}
