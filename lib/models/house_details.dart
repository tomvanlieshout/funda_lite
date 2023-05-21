import 'package:equatable/equatable.dart';

class HouseDetails extends Equatable {
  final Map _sourceMap;

  const HouseDetails.fromMap(this._sourceMap);

  List<String> get photos => _extractPhotos();
  String? get adUrl => _sourceMap['URL'];

  String? get streetAndHouseNo => _sourceMap['Adres'];
  String? get postalCode => _sourceMap['Postcode'];
  String? get city => _sourceMap['Plaats'];
  String? get price => '€${_sourceMap['Prijs']?['Koopprijs'].toString().replaceRange(3, 3, '.')}'; // Add euro-sign and '.' after first three digits
  String? get pricePerSqMeter => '€${eurosPerSqMeter.round().toString().replaceRange(1, 1, '.')}';
  num? get squareMeters => _sourceMap['WoonOppervlakte'];
  num get bedrooms => _sourceMap['AantalKamers'] ?? 0;
  String? get energyGrade => _sourceMap['Energielabel']?['Label'];

  String? get description => _sourceMap['VolledigeOmschrijving'];
  String? get constructionYear => _sourceMap['Bouwjaar'];
  String? get houseType => _sourceMap['SoortWoning'];
  String? get brokerName => _sourceMap['Makelaar'];
  String? get brokerPhoneNumber => _sourceMap['MakelaarTelefoon'];

  num get eurosPerSqMeter => (_sourceMap['Prijs']?['Koopprijs'] ?? 0) / (squareMeters ?? 1);
  List<String> _extractPhotos() {
    final result = <String>[];

    for (var map in _sourceMap['Media']) {
      int numberOfResolutions = map['MediaItems'].length;
      result.add(map['MediaItems'][numberOfResolutions - 1]['Url']);
    }

    return result;
  }

  Map asMap() => {..._sourceMap};

  HouseDetails copyWith(Map<String, dynamic> newData) => HouseDetails.fromMap({...asMap(), ...newData});

  @override
  String toString() => asMap().values.join(',');

  @override
  List<Object?> get props => [...asMap().values];
}
