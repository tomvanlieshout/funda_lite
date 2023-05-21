import 'package:flutter/material.dart';
import 'package:funda_lite/api/gateway.dart';
// import 'package:funda_lite/model/house_details.dart';
import 'package:funda_lite/widgets/broker_section.dart';

import 'package:funda_lite/widgets/button_bar.dart' as funda;
import 'package:funda_lite/widgets/energy_grade.dart';
import 'package:funda_lite/widgets/expandable_section.dart';
import 'package:funda_lite/widgets/loading_widget.dart';
import 'package:funda_lite/widgets/main_info_section.dart';
import 'package:funda_lite/widgets/photo_gallery.dart';
import 'package:funda_lite/widgets/specifications_section.dart';
import 'package:url_launcher/url_launcher.dart';

class HousePage extends StatefulWidget {
  final Gateway api;

  const HousePage({super.key}) : api = const Gateway();

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  // late final Future<HouseDetails> response;
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    // _fetchHouse();
  }

  // _fetchHouse() => response = widget.api.getHouse();

  @override
  Widget build(BuildContext context) {
    return Placeholder();
    // return FutureBuilder(
    //   builder: ((context, snapshot) {
    //     return snapshot.data != null
    //         ? Align(
    //             alignment: Alignment.topCenter,
    //             child: SingleChildScrollView(
    //               child: Column(
    //                 children: <Widget>[
    //                   PhotoGallery(snapshot.data!.photos),
    //                   Padding(
    //                     padding: const EdgeInsets.only(top: 8.0),
    //                     child: Row(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         MainInfoSection(
    //                           address: snapshot.data!.streetAndHouseNo ?? '',
    //                           postalCode: snapshot.data!.postalCode ?? '',
    //                           city: snapshot.data!.city ?? '',
    //                           price: snapshot.data!.price ?? '',
    //                           squareMeters: snapshot.data!.squareMeters as int,
    //                           numberOfBedrooms: snapshot.data!.bedrooms as int,
    //                           energyGrade: snapshot.data!.energyGrade ?? '',
    //                         ),
    //                         _buildButtonBar(snapshot.data!),
    //                       ],
    //                     ),
    //                   ),
    //                   ExpandableSection(title: 'Omschrijving', body: Text(snapshot.data!.description ?? '')),
    //                   ExpandableSection(
    //                       title: 'Kenmerken',
    //                       body: SpecificationsSection(
    //                         price: snapshot.data!.price ?? '',
    //                         pricePerSqMeter: snapshot.data!.pricePerSqMeter ?? '',
    //                         bedrooms: snapshot.data!.bedrooms.toString(),
    //                         squareMeters: snapshot.data!.squareMeters.toString(),
    //                         energyGrade: EnergyGrade(snapshot.data!.energyGrade ?? '', padding: const EdgeInsets.only(top: 4.0)),
    //                         constructionYear: snapshot.data!.constructionYear ?? '',
    //                         houseType: snapshot.data!.houseType ?? '',
    //                       )),
    //                   ExpandableSection(title: snapshot.data!.brokerName ?? '', body: BrokerSection(snapshot.data!.brokerPhoneNumber ?? '')),
    //                 ],
    //               ),
    //             ),
    //           )
    //         : const LoadingWidget();
    //   }),
    //   future: response,
    // );
  }

  // _buildButtonBar(HouseDetails data) {
  //   return funda.ButtonBar([
  //     IconButton(
  //         onPressed: () => setState(() {
  //               isFavorited = !isFavorited;
  //             }),
  //         icon: Icon(
  //           isFavorited ? Icons.favorite_rounded : Icons.favorite_border_rounded,
  //           color: isFavorited ? Colors.red : Colors.black,
  //         )),
  //     IconButton(
  //       icon: const Icon(Icons.open_in_browser_rounded),
  //       onPressed: () {
  //         if (data.adUrl != null) launchUrl(Uri.parse(data.adUrl ?? ''), mode: LaunchMode.externalApplication);
  //       },
  //     ),
  //   ]);
  // }
}
