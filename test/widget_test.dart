import 'package:flutter_test/flutter_test.dart';

import 'package:assi/main.dart';

void main() {
  testWidgets('splash and donation screens navigate correctly', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('LifeDrop'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Give blood.\nShare life.'), findsOneWidget);

    await tester.tap(find.text('Donation guide').first);
    await tester.pumpAndSettle();
    expect(find.text('Check local eligibility'), findsOneWidget);

    await tester.tap(find.byTooltip('Back (Navigator.pop)'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Donation essentials').first);
    await tester.pumpAndSettle();
    expect(find.text('About LifeDrop'), findsOneWidget);
    expect(find.text('Eligibility'), findsOneWidget);
  });
}
