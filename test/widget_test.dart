import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_library_app/main.dart';
import 'package:movie_library_app/movie_card.dart';

void main() {
  testWidgets('Movie Library App smoke and feature test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MovieLibraryApp());
    await tester.pumpAndSettle();

    // 1. Verify AppBar title
    expect(find.text('Movie Library'), findsOneWidget);

    // 2. Verify search TextField is present with hint text
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Search movies...'), findsOneWidget);

    // 3. Verify ListView is shown by default
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(MovieCard), findsWidgets);
    expect(find.text('Inception'), findsOneWidget);
    expect(find.text('20% OFF'), findsWidgets);

    // 4. Test BONUS: Tap discount badge on one card, verify all cards change to 19% OFF
    final discountBadge = find.text('20% OFF').first;
    await tester.tap(discountBadge);
    await tester.pumpAndSettle();

    expect(find.text('20% OFF'), findsNothing);
    expect(find.text('19% OFF'), findsWidgets);

    // 5. Test toggle to GridView
    final toggleViewButton = find.byType(IconButton).first;
    await tester.tap(toggleViewButton);
    await tester.pumpAndSettle();

    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(ListView), findsNothing);

    // 6. Test search filter by title (case-insensitive)
    await tester.enterText(find.byType(TextField), 'matrix');
    await tester.pumpAndSettle();

    expect(find.text('The Matrix'), findsOneWidget);
    expect(find.text('Inception'), findsNothing);

    // 7. Test search filter by genre
    await tester.enterText(find.byType(TextField), 'animation');
    await tester.pumpAndSettle();

    expect(find.text('Spirited Away'), findsOneWidget);

    // 8. Test no movies found message
    await tester.enterText(find.byType(TextField), 'XYZNonExistentMovie');
    await tester.pumpAndSettle();

    expect(find.text('No movies found'), findsOneWidget);
    expect(find.byType(MovieCard), findsNothing);
  });
}
