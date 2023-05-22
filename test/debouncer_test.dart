import 'package:flutter_test/flutter_test.dart';
import 'package:funda_lite/pages/houses_overview/houses_overview_page.dart';

void main() {
  test('Test Debouncer util', () async {
    var debouncer = Debouncer(const Duration(milliseconds: 100));
    var validator = 0;

    debouncer.run(() => validator++);
    expect(0, validator); // debouncer is synchronous, mutation of validator should occur ~100ms in the future

    await Future.delayed(const Duration(milliseconds: 100));
    expect(1, validator);
  });
}
