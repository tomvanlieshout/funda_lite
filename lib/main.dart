import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funda_lite/pages/house_details/bloc/details_bloc.dart';
import 'package:funda_lite/pages/houses_overview/bloc/overview_bloc.dart';
import 'package:funda_lite/pages/house_details/house_details_page.dart';
import 'package:funda_lite/pages/houses_overview/houses_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: BlocProvider(create: (context) => HousesOverviewBloc(), child: const HousesOverviewPage()),
      routes: {
        '/house-details-page': (context) => BlocProvider(create: (context) => HouseDetailsBloc(), child: const HouseDetailsPage()),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
