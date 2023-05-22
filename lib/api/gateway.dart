import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class Gateway {
  static const String apiKey = 'FUNDA_API_KEY'; // !!! TODO revert this to 'FUNDA_API_KEY'
  static const String httpEndpoint = 'http://partnerapi.funda.nl';
  static const String searchEndpoint = '/feeds/Aanbod.svc/$apiKey/';
  static const String getByIdEndpoint = '/feeds/Aanbod.svc/json/detail/$apiKey/koop/';

  const Gateway();

  Future<XmlDocument?> fetchHousesByCity(String city) async {
    final query = Uri.parse('$httpEndpoint/$searchEndpoint/?type=koop&zo=/$city');
    final response = await http.get(query);

    final body = _validateAndDecodeXmlResponse(response);
    return body;
  }

  Future<Map<String, dynamic>?> fetchHouseById(String id) async {
    final query = Uri.parse('$httpEndpoint/$getByIdEndpoint/$id');
    final response = await http.get(query);

    return _validateAndConvertToJson(response);
  }

  XmlDocument? _validateAndDecodeXmlResponse(http.Response httpResponse) {
    if (httpResponse.statusCode >= 200 && httpResponse.statusCode < 300) {
      return XmlDocument.parse(httpResponse.body);
    } else {
      throw GatewayError(httpResponse.reasonPhrase, httpResponse.statusCode);
    }
  }

  Future<Map<String, dynamic>?> _validateAndConvertToJson(http.Response httpResponse) async {
    if (httpResponse.statusCode >= 200 && httpResponse.statusCode < 300) {
      return jsonDecode(httpResponse.body) as Map<String, dynamic>;
    } else {
      throw GatewayError(httpResponse.reasonPhrase, httpResponse.statusCode);
    }
  }
}

class GatewayError {
  final String? message;
  final int statusCode;

  GatewayError(this.message, this.statusCode);
}
