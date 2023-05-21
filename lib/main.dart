import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funda_lite/pages/favorites/favorites_page.dart';
import 'package:funda_lite/pages/house_details/bloc/details_bloc.dart';
import 'package:funda_lite/pages/houses_overview/bloc/overview_bloc.dart';
import 'package:funda_lite/pages/house_details/house_details_page.dart';
import 'package:funda_lite/pages/houses_overview/houses_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: BlocProvider(
        create: (context) => HousesOverviewBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Funda Lite',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: _selectedIndex == 0 ? const HousesOverviewPage() : const FavoritesPage(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (value) => setState(() {
              _selectedIndex = value;
            }),
            items: const [
              BottomNavigationBarItem(label: 'Houses', icon: Icon(Icons.house_rounded)),
              BottomNavigationBarItem(label: 'Favorites', icon: Icon(Icons.favorite)),
            ],
          ),
        ),
      ),
      routes: {
        '/house-details-page': (context) => BlocProvider(create: (context) => HouseDetailsBloc(), child: const HouseDetailsPage()),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
