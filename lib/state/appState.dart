import 'package:dino/state/mqtt.dart';
import 'package:dino/state/persistence.dart';

class AppState {
  AppState() {
    dynamic p = new Persistence();
    p.init();

    dynamic mqtt = new Mqtt();
    mqtt.init();
  }
}
