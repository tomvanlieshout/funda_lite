import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:funda_lite/model/house.dart';

class FundaApi {
  static const String resourceEndpoint = 'assets/response.json';

  const FundaApi();

  Future<Map> _loadLocalAsset() async {
    var jsonString = await rootBundle.loadString(resourceEndpoint);

    return jsonDecode(jsonString);
  }

  Future<House> getHouse() async => House.fromMap(await _loadLocalAsset());
}
