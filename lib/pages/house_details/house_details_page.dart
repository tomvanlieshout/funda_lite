import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funda_lite/models/house_details.dart';
import 'package:funda_lite/pages/house_details/bloc/details_bloc.dart';
import 'package:funda_lite/pages/house_details/bloc/details_events.dart';
import 'package:funda_lite/pages/house_details/bloc/details_states.dart';
import 'package:funda_lite/widgets/broker_section.dart';

import 'package:funda_lite/widgets/energy_grade.dart';
import 'package:funda_lite/widgets/expandable_section.dart';
import 'package:funda_lite/widgets/main_info_section.dart';
import 'package:funda_lite/widgets/specifications_section.dart';
import 'package:funda_lite/widgets/error_widget.dart' as funda;
import 'package:url_launcher/url_launcher.dart';

class HouseDetailsPage extends StatefulWidget {
  static const String routeName = '/house-details-page';

  const HouseDetailsPage({super.key});

  @override
  State<HouseDetailsPage> createState() => _HouseDetailsPageState();
}

class _HouseDetailsPageState extends State<HouseDetailsPage> {
  late HouseDetailsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HouseDetailsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('House Details', style: TextStyle(color: Colors.white)),
      ),
      body: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          if (state is InitialState) {
            _bloc.add(LoadHouse(id));
            return Container();
          }
          if (state is Loading) return const Center(child: CircularProgressIndicator());
          if (state is HouseLoaded) return _buildDetails(state.house);
          if (state is ErrorState) return funda.ErrorWidget(state.message);
          return Container();
        },
      ),
    );
  }

  _buildDetails(HouseDetails details) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (details.imageUrl != null) Image.network(details.imageUrl!),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainInfoSection(
                    address: details.streetAndHouseNo ?? '',
                    postalCode: details.postalCode ?? '',
                    city: details.city ?? '',
                    price: details.price ?? '',
                    squareMeters: details.squareMeters as int,
                    numberOfBedrooms: details.bedrooms as int,
                    energyGrade: details.energyGrade ?? '',
                  ),
                  _buildLaunchButton(details),
                ],
              ),
            ),
            ExpandableSection(title: 'Omschrijving', body: Text(details.description ?? '')),
            ExpandableSection(
                title: 'Kenmerken',
                body: SpecificationsSection(
                  price: details.price ?? '',
                  pricePerSqMeter: details.pricePerSqMeter ?? '',
                  bedrooms: details.bedrooms.toString(),
                  squareMeters: details.squareMeters.toString(),
                  energyGrade: EnergyGrade(details.energyGrade ?? '', padding: const EdgeInsets.only(top: 4.0)),
                  constructionYear: details.constructionYear ?? '',
                  houseType: details.houseType ?? '',
                )),
            ExpandableSection(title: details.brokerName ?? '', body: BrokerSection(details.brokerPhoneNumber ?? '')),
          ],
        ),
      ),
    );
  }

  _buildLaunchButton(HouseDetails details) {
    return IconButton(
      icon: const Icon(Icons.open_in_browser_rounded),
      onPressed: () {
        if (details.adUrl != null) launchUrl(Uri.parse(details.adUrl ?? ''), mode: LaunchMode.externalApplication);
      },
    );
  }
}
