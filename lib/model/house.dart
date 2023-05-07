class House {
  final Map _sourceMap;

  const House.fromMap(this._sourceMap);

  List<String> get photos => _extractPhotos();
  String? get adUrl => _sourceMap['URL'];

  String? get streetAndHouseNo => _sourceMap['Adres'];
  String? get postalCode => _sourceMap['Postcode'];
  String? get city => _sourceMap['Plaats'];
  num? get price => _sourceMap['Prijs']?['Koopprijs'];
  num? get squareMeters => _sourceMap['WoonOppervlakte'];
  num get bedrooms => _sourceMap['AantalKamers'] ?? 0;
  String? get energyGrade => _sourceMap['EnergieLabel']?['Label'];

  String? get description => _sourceMap['VolledigeBeschrijving'];
  String? get constructionYear => _sourceMap['Bouwjaar'];
  String? get houseType => _sourceMap['SoortWoning'];
  String? get brokerName => _sourceMap['Makelaar'];
  String? get brokerPhoneNumber => _sourceMap['MakelaarTelefoon'];

  List<String> _extractPhotos() {
    final result = <String>[];

    for (var map in _sourceMap['Media']) {
      int numberOfResolutions = map['MediaItems'].length;
      result.add(map['MediaItems'][numberOfResolutions - 1]['Url']);
    }

    return result;
  }

  Map asMap() => {..._sourceMap};

  House copyWith(Map<String, dynamic> newData) => House.fromMap({...asMap(), ...newData});

  @override
  String toString() => asMap().values.join(',');
}
