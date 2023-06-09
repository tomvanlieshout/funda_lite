// Mocks generated by Mockito 5.4.0 from annotations
// in funda_lite/test/details_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:funda_lite/api/service.dart' as _i3;
import 'package:funda_lite/models/house.dart' as _i5;
import 'package:funda_lite/models/house_details.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHouseDetails_0 extends _i1.SmartFake implements _i2.HouseDetails {
  _FakeHouseDetails_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Service].
///
/// See the documentation for Mockito's code generation for more information.
class MockService extends _i1.Mock implements _i3.Service {
  MockService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.House?>> getHousesByCity(String? city) =>
      (super.noSuchMethod(
        Invocation.method(
          #getHousesByCity,
          [city],
        ),
        returnValue: _i4.Future<List<_i5.House?>>.value(<_i5.House?>[]),
      ) as _i4.Future<List<_i5.House?>>);
  @override
  _i4.Future<_i2.HouseDetails> getHouseById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getHouseById,
          [id],
        ),
        returnValue: _i4.Future<_i2.HouseDetails>.value(_FakeHouseDetails_0(
          this,
          Invocation.method(
            #getHouseById,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.HouseDetails>);
}
