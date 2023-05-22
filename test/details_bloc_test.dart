import 'package:flutter_test/flutter_test.dart';
import 'package:funda_lite/api/service.dart';
import 'package:funda_lite/models/house_details.dart';
import 'package:funda_lite/pages/house_details/bloc/details_bloc.dart';
import 'package:funda_lite/pages/house_details/bloc/details_events.dart';
import 'package:funda_lite/pages/house_details/bloc/details_states.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'details_bloc_test.mocks.dart';

@GenerateMocks([Service])
void main() {
  const fakeHouse = HouseDetails.fromMap({
    'imageUrl': '1',
    'adUrl': '2',
    'streetAndHouseNo': '3',
    'postalCode': '4',
    'city': '5',
    'price': '6',
    'pricePerSqMeter': '7',
    'squareMeters': '8',
    'energyGrade': '9',
    'description': '10',
    'constructionYear': '11',
    'houseType': '12',
    'brokerName': '13',
    'brokerPhoneNumber': '14',
  });
  test('Bloc should emit HouseLoaded when Service returns valid data', () {
    final Service mockedService = MockService();
    when(mockedService.getHouseById('12345')).thenAnswer((_) async => fakeHouse);

    final bloc = HouseDetailsBloc(mockedService);
    bloc.add(LoadHouse('12345'));

    expectLater(
        bloc.stream,
        emitsInOrder([
          Loading(),
          HouseLoaded(fakeHouse),
        ]));
  });

  test('Bloc should emit ErrorState when Service throws an error', () {
    final Service mockedService = MockService();
    when(mockedService.getHouseById('12345')).thenAnswer((_) async => throw FundaError('Error!'));

    final bloc = HouseDetailsBloc(mockedService);
    bloc.add(LoadHouse('12345'));

    expectLater(
        bloc.stream,
        emitsInOrder([
          Loading(),
          ErrorState('Error!'),
        ]));
  });
}
