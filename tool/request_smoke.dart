// ignore_for_file: avoid_print, avoid_relative_lib_imports
import '../lib/features/requests/service_request.dart';

void check(bool value, String description) {
  if (!value) throw StateError(description);
  print('PASS $description');
}

bool valid(RequestDraft draft) {
  try {
    draft.validate();
    return true;
  } on ArgumentError {
    return false;
  }
}

RequestDraft make({
  int phase = 2,
  String building = '237',
  String? gate = 'Gate 4',
  bool inside = true,
  RequestService service = RequestService.carAssistance,
  String problem = 'Battery will not start',
  String location = 'Rear entrance',
}) => RequestDraft(
  service: service,
  phase: phase,
  building: building,
  gate: gate,
  insideCompound: inside,
  problem: problem,
  locationDetails: location,
);

void main() {
  check(valid(make()), 'In-compound car request accepted');
  check(
    valid(make(service: RequestService.plumbing)),
    'Plumbing request accepted',
  );
  check(!valid(make(inside: false)), 'Outside-compound request rejected');
  check(!valid(make(phase: 1)), 'Phase 2 gate cannot leak into Phase 1');
  check(
    valid(make(phase: 1, gate: null)),
    'Phase 1 works without invented gate details',
  );
  check(!valid(make(phase: 3)), 'Unknown phase rejected');
  check(valid(make(building: '٢٣٧')), 'Arabic numerals accepted');
  check(normaliseDigits('٢٣٧') == '237', 'Arabic digits normalised');
  check(normaliseDigits('۲۳۷') == '237', 'Persian digits normalised');
  check(
    valid(make(building: '375')),
    'Label 375 accepted without assuming a building count',
  );
  check(!valid(make(building: '0')), 'Zero building rejected');
  check(!valid(make(building: 'abc')), 'Non-numeric building rejected');
  check(!valid(make(gate: 'Gate 99')), 'Unverified gate rejected');
  check(valid(make(gate: null)), 'Entry gate can be confirmed later');
  check(!valid(make(problem: '')), 'Empty problem rejected');
  check(!valid(make(location: '')), 'Empty location rejected');
  print(
    '16 request-domain checks passed. Flutter and Drift tests are separate.',
  );
}
