import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Persistence {
  init() async {
    await Hive.initFlutter();
  }
}
