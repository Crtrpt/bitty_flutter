import 'package:dino/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('运行截图测试', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('屏幕显示截图', (WidgetTester tester) async {
      app.main();

      // This is required prior to taking the screenshot (Android only).
      await binding.convertFlutterSurfaceToImage();

      await tester.pumpAndSettle();
      final List<int> firstPng = await binding.takeScreenshot('login');
      expect(firstPng.isNotEmpty, isTrue);
    });
  });
}
