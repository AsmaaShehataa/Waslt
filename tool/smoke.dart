// ignore_for_file: avoid_print, avoid_relative_lib_imports
// No third-party packages: this can run even if pub.dev is unavailable.
import '../lib/core/runtime_config.dart';
import '../lib/features/bookings/quote.dart';

void check(bool value, String message) {
  if (!value) throw StateError(message);
  print('PASS $message');
}

void main() {
  check(!RuntimeConfig.cloudEnabled, 'Cloud is disabled');
  check(!RuntimeConfig.paymentsEnabled, 'Payments are disabled');
  check(!RuntimeConfig.analyticsEnabled, 'Analytics are disabled');
  check(!RuntimeConfig.backgroundWorkEnabled, 'Background work is disabled');
  final first = Quote(
    version: 1,
    description: 'Repair',
    labourPiastres: 10001,
    partsPiastres: 2002,
  );
  check(first.totalPiastres == 12003, 'Money uses exact integer piastres');
  final approval = QuoteApproval();
  check(!approval.authorises(first), 'Work starts unapproved');
  approval.approve(first);
  check(
    approval.authorises(first),
    'Explicit approval authorises the current version',
  );
  final revised = Quote(
    version: 2,
    description: 'Repair plus part',
    labourPiastres: 10001,
    partsPiastres: 3000,
  );
  check(!approval.authorises(revised), 'A revised quote needs fresh approval');
  var rejected = false;
  try {
    Quote(
      version: 1,
      description: 'Repair',
      labourPiastres: -1,
      partsPiastres: 0,
    );
  } on ArgumentError {
    rejected = true;
  }
  check(rejected, 'Negative charges are rejected');
  print(
    '9 checks passed. This verifies Dart/domain behaviour, not Flutter or cloud integration.',
  );
}
