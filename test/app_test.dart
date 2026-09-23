import 'package:aivora/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> launch(WidgetTester tester) async {
    tester.view.physicalSize = const Size(430, 932);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const AivoraApp());
    await tester.pumpAndSettle();
  }

  testWidgets('opens the four-section mobile experience', (tester) async {
    await launch(tester);

    expect(find.text('AIVORA'), findsOneWidget);
    expect(find.text('What do you want to achieve?'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Models'), findsOneWidget);
    expect(find.text('Platforms'), findsOneWidget);
    expect(find.text('Prompt Lab'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('switches the whole interface to Arabic', (tester) async {
    await launch(tester);

    await tester.tap(find.byKey(const ValueKey('language-toggle')));
    await tester.pumpAndSettle();

    expect(find.text('ماذا تريد أن تنجز؟'), findsOneWidget);
    expect(find.text('النماذج'), findsOneWidget);
    expect(find.text('المنصات'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('adapts safely to a landscape phone or tablet', (tester) async {
    tester.view.physicalSize = const Size(932, 430);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const AivoraApp());
    await tester.pumpAndSettle();

    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.text('What do you want to achieve?'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('builds a useful prompt without a network call', (tester) async {
    await launch(tester);

    await tester.tap(find.text('Prompt Lab'));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.byKey(const ValueKey('problem-field')),
      420,
      scrollable: find
          .descendant(
            of: find.byType(CustomScrollView).hitTestable(),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    await tester.enterText(
      find.byKey(const ValueKey('problem-field')),
      'Create a launch plan for a tutoring service',
    );
    final generateButton = find.byKey(const ValueKey('generate-prompt'));
    await tester.ensureVisible(generateButton);
    await tester.tap(generateButton);
    await tester.pumpAndSettle();

    expect(find.text('Your prompt is ready'), findsOneWidget);
    expect(
      find.textContaining('Create a launch plan for a tutoring service'),
      findsOneWidget,
    );
    expect(find.byKey(const ValueKey('copy-prompt')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
