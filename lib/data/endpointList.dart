import 'package:faker/faker.dart';

final fakerFa = Faker(provider: FakerDataProviderFa());
var getEndpointList = () {
  List<Map<String, dynamic>> list = [];
  for (var i = 0; i < 100; i++) {
    var name = faker.person.name();
    list.add({"id": i, "name": name, "last_msg": fakerFa.lorem.word(), "last_time": "20:20"});
  }
  return list;
};
