import 'dart:convert';
import 'package:flutter/services.dart';

class FundaApi {
  static const String resourceEndpoint = 'assets/response.json';

  const FundaApi();

  Future<Map> _loadLocalAsset() async {
    var jsonString = await rootBundle.loadString(resourceEndpoint);

    return jsonDecode(jsonString);
  }

  Future<Map> getResponse() async => await _loadLocalAsset();
}
