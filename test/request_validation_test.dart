import 'package:flutter_test/flutter_test.dart';
import 'package:waslt/features/requests/service_request.dart';

void main() {
  RequestDraft draft({
    String building = '٢٣٧',
    int phase = 2,
    String? gate = 'Gate 4',
    bool inside = true,
  }) => RequestDraft(
    service: RequestService.carAssistance,
    phase: phase,
    building: building,
    locationDetails: 'Rear entrance, white car',
    problem: 'Battery will not start',
    gate: gate,
    insideCompound: inside,
  );
  test('Arabic building numbers are accepted and normalised', () {
    expect(() => draft().validate(), returnsNormally);
    expect(normaliseDigits('٢٣٧'), '237');
  });
  test('car assistance outside compound is rejected', () {
    expect(() => draft(inside: false).validate(), throwsArgumentError);
  });
  test('Phase 2 gate cannot be assigned to Phase 1', () {
    expect(() => draft(phase: 1).validate(), throwsArgumentError);
    expect(() => draft(phase: 1, gate: null).validate(), returnsNormally);
  });
  test('building count is not invented from the highest label', () {
    expect(() => draft(building: '375').validate(), returnsNormally);
    expect(() => draft(building: '0').validate(), throwsArgumentError);
    expect(() => draft(building: 'a').validate(), throwsArgumentError);
  });
}
