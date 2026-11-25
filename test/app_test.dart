import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waslt/app.dart';
import 'package:waslt/data/providers.dart';
import 'package:waslt/data/waslt_database.dart';

void main() {
  testWidgets('resident saves an in-compound request and sees the details', (
    tester,
  ) async {
    final db = WasltDatabase.forTesting(
      DatabaseConnection(
        NativeDatabase.memory(),
        closeStreamsSynchronously: true,
      ),
    );
    addTearDown(() async {
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.runAsync(db.close);
    });
    await tester.runAsync(() => db.customSelect('SELECT 1').get());
    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: const WasltApp(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Car assistance'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('building-input')), '٢٣٧');
    await tester.scrollUntilVisible(
      find.byKey(const Key('location-input')),
      250,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.enterText(
      find.byKey(const Key('location-input')),
      'Rear entrance, white car',
    );
    await tester.scrollUntilVisible(
      find.byKey(const Key('problem-input')),
      250,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.enterText(
      find.byKey(const Key('problem-input')),
      'Battery will not start',
    );
    await tester.scrollUntilVisible(
      find.byKey(const Key('inside-checkbox')),
      250,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.byKey(const Key('inside-checkbox')));
    await tester.scrollUntilVisible(
      find.byKey(const Key('submit-request')),
      250,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.byKey(const Key('submit-request')));
    await tester.pumpAndSettle();
    expect(find.text('Request details'), findsOneWidget);
    expect(find.text('Phase 2 · Building 237'), findsOneWidget);
    expect(find.text('Saved locally · not dispatched'), findsOneWidget);
    expect(find.text('Resident submitted request'), findsOneWidget);
  });

  testWidgets('form rejects missing information', (tester) async {
    final db = WasltDatabase.forTesting(
      DatabaseConnection(
        NativeDatabase.memory(),
        closeStreamsSynchronously: true,
      ),
    );
    addTearDown(() async {
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.runAsync(db.close);
    });
    await tester.runAsync(() => db.customSelect('SELECT 1').get());
    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: const WasltApp(),
      ),
    );
    await tester.pumpAndSettle();
    ProviderScope.containerOf(tester.element(find.byType(WasltApp)))
        .read(routerProvider)
        .go('/');
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('Plumbing'),
      250,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Plumbing'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.byKey(const Key('submit-request')),
      250,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.byKey(const Key('submit-request')));
    await tester.pumpAndSettle();
    expect(await tester.runAsync(() => db.watchRequests().first), isEmpty);
    expect(
      find.text('Describe the problem in at least 10 characters.'),
      findsOneWidget,
    );
  });
}
