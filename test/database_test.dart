import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waslt/data/waslt_database.dart';
import 'package:waslt/features/requests/service_request.dart';

const draft = RequestDraft(
  service: RequestService.carAssistance,
  phase: 2,
  building: '٢٣٧',
  locationDetails: 'Rear entrance, white car',
  problem: 'Battery will not start',
  gate: 'Gate 4',
  insideCompound: true,
);

void main() {
  test('saved request survives database close and reopening', () async {
    final folder = await Directory.systemTemp.createTemp('waslt-db-test');
    addTearDown(() => folder.delete(recursive: true));
    final file = File('${folder.path}/test.sqlite');
    final first = WasltDatabase.forTesting(NativeDatabase(file));
    final id = await first.submit(draft);
    await first.close();
    final reopened = WasltDatabase.forTesting(NativeDatabase(file));
    addTearDown(reopened.close);
    final row = await reopened.watchRequest(id).first;
    expect(row?.building, '237');
    expect(row?.gate, 'Gate 4');
    expect(
      (await reopened.eventsFor(id)).single.action,
      'Resident submitted request',
    );
  });

  test('cancellation is recorded exactly once', () async {
    final db = WasltDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final id = await db.submit(draft);
    await db.cancel(id);
    expect((await db.watchRequest(id).first)?.status, 'cancelled');
    await expectLater(db.cancel(id), throwsStateError);
    expect(await db.eventsFor(id), hasLength(2));
  });

  test('invalid requests never create rows or events', () async {
    final db = WasltDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    const invalid = RequestDraft(
      service: RequestService.carAssistance,
      phase: 2,
      building: '237',
      locationDetails: 'Rear entrance',
      problem: 'Battery will not start',
      insideCompound: false,
    );
    await expectLater(db.submit(invalid), throwsArgumentError);
    expect(await db.watchRequests().first, isEmpty);
  });
}
