import 'package:flutter_test/flutter_test.dart';
import 'package:tentweny_demo/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('TrailerViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
