import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  final FlutterDriver driver = await FlutterDriver.connect();
  integrationDriver(
    driver: driver,
    onScreenshot: (String screenshotName, List<int> screenshotBytes) async {
      final File image = await File('docs/screenshots/$screenshotName.png')
          .create(recursive: true);
      image.writeAsBytesSync(screenshotBytes);
      return true;
    },
  );
}
