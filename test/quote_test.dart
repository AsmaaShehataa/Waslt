import 'package:flutter_test/flutter_test.dart';
import 'package:waslt/features/bookings/quote.dart';

void main() {
  test('revised quote needs resident approval', () {
    final first = Quote(
      version: 1,
      description: 'Repair',
      labourPiastres: 100,
      partsPiastres: 0,
    );
    final second = Quote(
      version: 2,
      description: 'Extra work',
      labourPiastres: 200,
      partsPiastres: 0,
    );
    final approval = QuoteApproval()..approve(first);
    expect(approval.authorises(first), isTrue);
    expect(approval.authorises(second), isFalse);
  });
}
