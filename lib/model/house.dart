class House {
  final Map _sourceMap;

  const House.fromMap(this._sourceMap);

  bool get isFavorited => _sourceMap['isFavorited'] ?? false;

  String? get streetAndHouseNo => _sourceMap['Adres'];
  String? get postalCode => _sourceMap['Postcode'];
  String? get city => _sourceMap['Plaats'];
  num? get price => _sourceMap['Prijs']['Koopprijs'];
  num? get squareMeters => _sourceMap['WoonOppervlakte'];
  num get bedrooms => _sourceMap['AantalKamers'] ?? 0;

  String? get description => _sourceMap['VolledigeBeschrijving'];
  String? get constructionYear => _sourceMap['Bouwjaar'];
  String? get houseType => _sourceMap['SoortWoning'];
  String? get brokerName => _sourceMap['Makelaar'];
  String? get brokerPhoneNumber => _sourceMap['MakelaarTelefoon'];

  Map asMap() => {..._sourceMap};

  House copyWith(Map<String, dynamic> newData) => House.fromMap({...asMap(), ...newData});
}
