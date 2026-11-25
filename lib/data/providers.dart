import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'waslt_database.dart';

final databaseProvider = Provider<WasltDatabase>((ref) {
  final database = WasltDatabase();
  ref.onDispose(() => unawaited(database.close()));
  return database;
});

final requestsProvider = StreamProvider<List<ServiceRequest>>(
  (ref) => ref.watch(databaseProvider).watchRequests(),
);

final requestProvider = StreamProvider.family<ServiceRequest?, String>(
  (ref, id) => ref.watch(databaseProvider).watchRequest(id),
);

final eventsProvider = FutureProvider.family<List<RequestEvent>, String>(
  (ref, id) => ref.watch(databaseProvider).eventsFor(id),
);
