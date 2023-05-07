import 'package:flutter/material.dart';
import 'package:funda_lite/api/funda_api.dart';
import 'package:funda_lite/model/house.dart';
import 'package:funda_lite/widgets/loading_widget.dart';
import 'package:funda_lite/widgets/photo_gallery.dart';

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
      home: const MyHomePage(title: 'Funda Lite'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final FundaApi api;

  const MyHomePage({super.key, required this.title}) : api = const FundaApi();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final Future<House> house;

  @override
  void initState() {
    super.initState();
    _fetchHouse();
  }

  _fetchHouse() => house = widget.api.getHouse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          builder: ((context, snapshot) {
            return snapshot.data != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      PhotoGallery(snapshot.data?.photos ?? []),
                    ],
                  )
                : const LoadingWidget();
          }),
          future: house,
        ),
      ),
    );
  }
}
