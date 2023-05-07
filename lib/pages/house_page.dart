import 'package:flutter/material.dart';
import 'package:funda_lite/api/funda_api.dart';
import 'package:funda_lite/model/house.dart';

import 'package:funda_lite/widgets/button_bar.dart' as funda;
import 'package:funda_lite/widgets/loading_widget.dart';
import 'package:funda_lite/widgets/photo_gallery.dart';
import 'package:url_launcher/url_launcher.dart';

class HousePage extends StatefulWidget {
  final FundaApi api;

  const HousePage({super.key}) : api = const FundaApi();

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  late final Future<House> house;
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    _fetchHouse();
  }

  _fetchHouse() => house = widget.api.getHouse();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: ((context, snapshot) {
        return snapshot.data != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  PhotoGallery(snapshot.data?.photos ?? []),
                  _buildButtonBar(snapshot.data!),
                ],
              )
            : const LoadingWidget();
      }),
      future: house,
    );
  }

  _buildButtonBar(House data) {
    return funda.ButtonBar([
      IconButton(
          onPressed: () => setState(() {
                isFavorited = !isFavorited;
              }),
          icon: Icon(
            isFavorited ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            color: isFavorited ? Colors.red : Colors.black,
          )),
      IconButton(
        icon: const Icon(Icons.open_in_browser_rounded),
        onPressed: () {
          if (data.adUrl != null) launchUrl(Uri.parse(data.adUrl ?? ''), mode: LaunchMode.externalApplication);
        },
      ),
    ]);
  }
}
