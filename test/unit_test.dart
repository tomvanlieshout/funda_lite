import 'package:flutter_test/flutter_test.dart';
import 'package:funda_lite/api/funda_api.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Test (de)serialization of house-model', () async {
    final source = await const FundaApi().getHouse();

    expect(67, source.photos.length);
    expect('http://www.funda.nl/koop/nijmegen/huis-88569588-brink-19/', source.adUrl);
    expect('Brink 19', source.streetAndHouseNo);

    // etc...
  });
}
