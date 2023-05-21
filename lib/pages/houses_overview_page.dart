import 'package:flutter/widgets.dart';
import 'package:funda_lite/api/service.dart';

class HousesOverviewPage extends StatefulWidget {
  const HousesOverviewPage({super.key});

  @override
  State<HousesOverviewPage> createState() => _HousesOverviewPageState();
}

class _HousesOverviewPageState extends State<HousesOverviewPage> {
  final Service _service = Service();
  late final response;

  @override
  void initState() {
    super.initState();
    _service.getHousesByCity('Nijmegen').then((value) => response = value);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
