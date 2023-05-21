import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class Gateway {
  static const String apiKey = 'FUNDA_API_KEY'; // !!! TODO revert this to 'FUNDA_API_KEY'
  static const String httpEndpoint = 'http://partnerapi.funda.nl';
  static const String searchEndpoint = '/feeds/Aanbod.svc/$apiKey/';

  const Gateway();

  Future<XmlDocument> fetchHousesByCity(String city) async {
    final query = Uri.parse('$httpEndpoint/$searchEndpoint/?type=koop&zo=/$city');
    final response = await http.get(query);

    final body = _decodeXmlResponse(response.body);
    return body;
  }

  // TODO also validate response before trying to parse.
  XmlDocument _decodeXmlResponse(String content) => XmlDocument.parse(content);
}
