import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:funda_lite/models/house.dart';
import 'package:funda_lite/pages/favorites/bloc/favorites_bloc.dart';
import 'package:funda_lite/pages/favorites/bloc/favorites_events.dart';
import 'package:funda_lite/pages/favorites/favorites_page.dart';
import 'package:funda_lite/widgets/house_card.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const house1 =
      House(id: '1', address: 'address', postalCode: 'postalCode', price: 'price', bedrooms: 'bedrooms', imageUrl: 'https://placehold.co/600x400.png');
  const house2 =
      House(id: '2', address: 'address', postalCode: 'postalCode', price: 'price', bedrooms: 'bedrooms', imageUrl: 'https://placehold.co/600x400.png');

  testWidgets('HouseCards should be added/removed when adding/removing favorites', (WidgetTester widgetTester) async {
    final bloc = FavoritesBloc();

    await widgetTester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: bloc,
          child: const Scaffold(
            body: FavoritesPage(),
          ),
        ),
      ),
    );

    // Initially, FavoritesPage should not show any cards.
    final cardFinder = find.byType(HouseCard);
    expect(cardFinder, findsNothing);
    expect(find.text('You have not selected any favorites yet.'), findsOneWidget);

    bloc.add(AddFavorite(house1));
    await widgetTester.pumpAndSettle();
    expect(cardFinder, findsOneWidget);
    expect(find.text('You have not selected any favorites yet.'), findsNothing);

    bloc.add(AddFavorite(house2));
    await widgetTester.pumpAndSettle();
    expect(cardFinder, findsNWidgets(2));

    // bloc.add(RemoveFavorite(house1));
    final heartButtonFinder = find.byIcon(Icons.favorite_rounded).first; // At this point there are two cards (so two buttons); pick whichever's first
    await widgetTester.tap(heartButtonFinder); // Tapping the button should remove 1 HouseCard from the list
    await widgetTester.pumpAndSettle();
    expect(cardFinder, findsOneWidget);

    await widgetTester.tap(heartButtonFinder); // There should only be one card left at this point
    await widgetTester.pumpAndSettle();
    expect(cardFinder, findsNothing);
    expect(find.text('You have not selected any favorites yet.'), findsOneWidget); // The list should be empty again
  });
}
