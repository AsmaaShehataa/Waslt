import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:uuid/uuid.dart';

import '../features/requests/service_request.dart';

part 'waslt_database.g.dart';

class ServiceRequests extends Table {
  TextColumn get id => text()();
  TextColumn get service => text()();
  IntColumn get phase => integer()();
  TextColumn get building => text()();
  TextColumn get locationDetails => text()();
  TextColumn get problem => text()();
  TextColumn get gate => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('requested'))();
  DateTimeColumn get createdAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

class RequestEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get requestId =>
      text().customConstraint('NOT NULL REFERENCES service_requests(id)')();
  TextColumn get action => text()();
  DateTimeColumn get occurredAt => dateTime()();
}

@DriftDatabase(tables: [ServiceRequests, RequestEvents])
class WasltDatabase extends _$WasltDatabase {
  WasltDatabase() : super(driftDatabase(name: 'waslt'));
  WasltDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    beforeOpen: (_) async => customStatement('PRAGMA foreign_keys = ON'),
  );

  Stream<List<ServiceRequest>> watchRequests() => (select(
    serviceRequests,
  )..orderBy([(r) => OrderingTerm.desc(r.createdAt)])).watch();

  Stream<ServiceRequest?> watchRequest(String id) => (select(
    serviceRequests,
  )..where((r) => r.id.equals(id))).watchSingleOrNull();

  Future<List<RequestEvent>> eventsFor(String id) =>
      (select(requestEvents)
            ..where((e) => e.requestId.equals(id))
            ..orderBy([(e) => OrderingTerm.asc(e.id)]))
          .get();

  Future<String> submit(RequestDraft draft) async {
    draft.validate();
    final id = const Uuid().v4();
    final now = DateTime.now().toUtc();
    await transaction(() async {
      await into(serviceRequests).insert(
        ServiceRequestsCompanion.insert(
          id: id,
          service: draft.service.name,
          phase: draft.phase,
          building: normaliseDigits(draft.building.trim()),
          locationDetails: draft.locationDetails.trim(),
          problem: draft.problem.trim(),
          gate: Value(draft.gate),
          createdAt: now,
        ),
      );
      await into(requestEvents).insert(
        RequestEventsCompanion.insert(
          requestId: id,
          action: 'Resident submitted request',
          occurredAt: now,
        ),
      );
    });
    return id;
  }

  Future<void> cancel(String id) => transaction(() async {
    final changed =
        await (update(serviceRequests)
              ..where((r) => r.id.equals(id) & r.status.equals('requested')))
            .write(const ServiceRequestsCompanion(status: Value('cancelled')));
    if (changed != 1) throw StateError('This request cannot be cancelled.');
    await into(requestEvents).insert(
      RequestEventsCompanion.insert(
        requestId: id,
        action: 'Resident cancelled request',
        occurredAt: DateTime.now().toUtc(),
      ),
    );
  });
}
