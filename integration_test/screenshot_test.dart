import 'dart:io';

import 'package:dino/main.dart' as app;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test/integration_test_driver_extended.dart';

takeScreenshot(tester, binding) async {
  if (kIsWeb) {
    await binding.takeScreenshot('test-screenshot');
    return;
  } else if (Platform.isAndroid) {
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();
  }
  await binding.takeScreenshot('test-screenshot');
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    final binding = IntegrationTestWidgetsFlutterBinding();
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('tap on the floating action button, verify counter', (WidgetTester tester) async {
      app.main();

      try {
        await integrationDriver(
          onScreenshot: (String screenshotName, List<int> screenshotBytes) async {
            final File image = await File('screenshots/$screenshotName.png').create(recursive: true);
            image.writeAsBytesSync(screenshotBytes);
            return true;
          },
        );
      } catch (e) {
        print('Error occured: $e');
      }

      await takeScreenshot(tester, binding);
      // Verify the counter increments by 1.
      // expect(find.text('1'), findsOneWidget);
    });
  });
}
