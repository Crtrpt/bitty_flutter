import 'package:faker/faker.dart';

getEndpointList() {
  List<Map<String, dynamic>> list = [];
  for (var i = 0; i < 100; i++) {
    var name = faker.person.name();
    list.add({"id": i, "name": name, "last_msg": faker.lorem.sentence(), "last_time": "20:20"});
  }
  return list;
}
