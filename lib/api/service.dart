import 'package:funda_lite/models/house_details.dart';
import 'package:xml/xml.dart';

import 'package:funda_lite/api/gateway.dart';
import 'package:funda_lite/models/house.dart';

class Service {
  final Gateway _gateway;

  const Service() : _gateway = const Gateway();

  Future<List<House?>> getHousesByCity(String city) async {
    final result = <House?>[];

    try {
      final xmlResponse = await _gateway.fetchHousesByCity(city);
      if (xmlResponse == null) return [];

      final nodesList = _getObjectNodesFromDocument(xmlResponse);

      for (var node in nodesList) {
        result.add(_mapNodeToHouse(node));
      }

      return result;
    } on GatewayError catch (e) {
      if (e.statusCode == 404) throw FundaError('No houses could be found.');
      throw FundaError('Something went wrong... Please try again later.');
    }
  }

  Future<HouseDetails> getHouseById(String id) async {
    try {
      final Map<String, dynamic>? map = await _gateway.fetchHouseById(id);
      return HouseDetails.fromMap(map ?? {});
    } on GatewayError catch (e) {
      if (e.statusCode == 404) throw FundaError('The house could not be found.');
      throw FundaError('Something went wrong... Please try again later.');
    }
  }

  List<XmlNode> _getObjectNodesFromDocument(XmlDocument document) {
    final result = <XmlNode>[];
    final documentIterator = document.children.iterator;

    // Look for the nested Objects-element and add its children to results
    while (documentIterator.moveNext()) {
      if ((documentIterator.current as XmlElement).qualifiedName == 'LocatieFeed') {
        final locatieFeed = (documentIterator.current as XmlElement).children.iterator;
        while (locatieFeed.moveNext()) {
          if ((locatieFeed.current as XmlElement).qualifiedName == 'Objects') {
            final objectsIterator = (locatieFeed.current as XmlElement).children.iterator;
            while (objectsIterator.moveNext()) {
              result.add(objectsIterator.current);
            }
          }
        }
      }
    }

    return result;
  }

  House _mapNodeToHouse(XmlNode node) {
    String? id, address, postalCode, price, bedrooms, imageUrl;

    final iterator = node.children.iterator;
    while (iterator.moveNext()) {
      final el = iterator.current as XmlElement;

      if (el.qualifiedName == 'Id') id = el.innerText;
      if (el.qualifiedName == 'Adres') address = el.innerText;
      if (el.qualifiedName == 'Postcode') postalCode = el.innerText;
      if (el.qualifiedName == 'Koopprijs') price = el.innerText;
      if (el.qualifiedName == 'AantalKamers') bedrooms = el.innerText;
      if (el.qualifiedName == 'FotoMedium') imageUrl = el.innerText;
    }

    return House(
      id: id ?? '',
      address: address ?? '',
      postalCode: postalCode ?? '',
      price: price ?? '',
      bedrooms: bedrooms ?? '',
      imageUrl: imageUrl ?? '',
    );
  }
}

class FundaError {
  String message;

  FundaError(this.message);
}
