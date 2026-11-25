// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waslt_database.dart';

// ignore_for_file: type=lint
class $ServiceRequestsTable extends ServiceRequests
    with TableInfo<$ServiceRequestsTable, ServiceRequest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceRequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serviceMeta = const VerificationMeta(
    'service',
  );
  @override
  late final GeneratedColumn<String> service = GeneratedColumn<String>(
    'service',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phaseMeta = const VerificationMeta('phase');
  @override
  late final GeneratedColumn<int> phase = GeneratedColumn<int>(
    'phase',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _buildingMeta = const VerificationMeta(
    'building',
  );
  @override
  late final GeneratedColumn<String> building = GeneratedColumn<String>(
    'building',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationDetailsMeta = const VerificationMeta(
    'locationDetails',
  );
  @override
  late final GeneratedColumn<String> locationDetails = GeneratedColumn<String>(
    'location_details',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _problemMeta = const VerificationMeta(
    'problem',
  );
  @override
  late final GeneratedColumn<String> problem = GeneratedColumn<String>(
    'problem',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gateMeta = const VerificationMeta('gate');
  @override
  late final GeneratedColumn<String> gate = GeneratedColumn<String>(
    'gate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('requested'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    service,
    phase,
    building,
    locationDetails,
    problem,
    gate,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_requests';
  @override
  VerificationContext validateIntegrity(
    Insertable<ServiceRequest> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('service')) {
      context.handle(
        _serviceMeta,
        service.isAcceptableOrUnknown(data['service']!, _serviceMeta),
      );
    } else if (isInserting) {
      context.missing(_serviceMeta);
    }
    if (data.containsKey('phase')) {
      context.handle(
        _phaseMeta,
        phase.isAcceptableOrUnknown(data['phase']!, _phaseMeta),
      );
    } else if (isInserting) {
      context.missing(_phaseMeta);
    }
    if (data.containsKey('building')) {
      context.handle(
        _buildingMeta,
        building.isAcceptableOrUnknown(data['building']!, _buildingMeta),
      );
    } else if (isInserting) {
      context.missing(_buildingMeta);
    }
    if (data.containsKey('location_details')) {
      context.handle(
        _locationDetailsMeta,
        locationDetails.isAcceptableOrUnknown(
          data['location_details']!,
          _locationDetailsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_locationDetailsMeta);
    }
    if (data.containsKey('problem')) {
      context.handle(
        _problemMeta,
        problem.isAcceptableOrUnknown(data['problem']!, _problemMeta),
      );
    } else if (isInserting) {
      context.missing(_problemMeta);
    }
    if (data.containsKey('gate')) {
      context.handle(
        _gateMeta,
        gate.isAcceptableOrUnknown(data['gate']!, _gateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceRequest(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      service: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}service'],
      )!,
      phase: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}phase'],
      )!,
      building: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}building'],
      )!,
      locationDetails: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_details'],
      )!,
      problem: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}problem'],
      )!,
      gate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gate'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ServiceRequestsTable createAlias(String alias) {
    return $ServiceRequestsTable(attachedDatabase, alias);
  }
}

class ServiceRequest extends DataClass implements Insertable<ServiceRequest> {
  final String id;
  final String service;
  final int phase;
  final String building;
  final String locationDetails;
  final String problem;
  final String? gate;
  final String status;
  final DateTime createdAt;
  const ServiceRequest({
    required this.id,
    required this.service,
    required this.phase,
    required this.building,
    required this.locationDetails,
    required this.problem,
    this.gate,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['service'] = Variable<String>(service);
    map['phase'] = Variable<int>(phase);
    map['building'] = Variable<String>(building);
    map['location_details'] = Variable<String>(locationDetails);
    map['problem'] = Variable<String>(problem);
    if (!nullToAbsent || gate != null) {
      map['gate'] = Variable<String>(gate);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ServiceRequestsCompanion toCompanion(bool nullToAbsent) {
    return ServiceRequestsCompanion(
      id: Value(id),
      service: Value(service),
      phase: Value(phase),
      building: Value(building),
      locationDetails: Value(locationDetails),
      problem: Value(problem),
      gate: gate == null && nullToAbsent ? const Value.absent() : Value(gate),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory ServiceRequest.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceRequest(
      id: serializer.fromJson<String>(json['id']),
      service: serializer.fromJson<String>(json['service']),
      phase: serializer.fromJson<int>(json['phase']),
      building: serializer.fromJson<String>(json['building']),
      locationDetails: serializer.fromJson<String>(json['locationDetails']),
      problem: serializer.fromJson<String>(json['problem']),
      gate: serializer.fromJson<String?>(json['gate']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'service': serializer.toJson<String>(service),
      'phase': serializer.toJson<int>(phase),
      'building': serializer.toJson<String>(building),
      'locationDetails': serializer.toJson<String>(locationDetails),
      'problem': serializer.toJson<String>(problem),
      'gate': serializer.toJson<String?>(gate),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ServiceRequest copyWith({
    String? id,
    String? service,
    int? phase,
    String? building,
    String? locationDetails,
    String? problem,
    Value<String?> gate = const Value.absent(),
    String? status,
    DateTime? createdAt,
  }) => ServiceRequest(
    id: id ?? this.id,
    service: service ?? this.service,
    phase: phase ?? this.phase,
    building: building ?? this.building,
    locationDetails: locationDetails ?? this.locationDetails,
    problem: problem ?? this.problem,
    gate: gate.present ? gate.value : this.gate,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  ServiceRequest copyWithCompanion(ServiceRequestsCompanion data) {
    return ServiceRequest(
      id: data.id.present ? data.id.value : this.id,
      service: data.service.present ? data.service.value : this.service,
      phase: data.phase.present ? data.phase.value : this.phase,
      building: data.building.present ? data.building.value : this.building,
      locationDetails: data.locationDetails.present
          ? data.locationDetails.value
          : this.locationDetails,
      problem: data.problem.present ? data.problem.value : this.problem,
      gate: data.gate.present ? data.gate.value : this.gate,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceRequest(')
          ..write('id: $id, ')
          ..write('service: $service, ')
          ..write('phase: $phase, ')
          ..write('building: $building, ')
          ..write('locationDetails: $locationDetails, ')
          ..write('problem: $problem, ')
          ..write('gate: $gate, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    service,
    phase,
    building,
    locationDetails,
    problem,
    gate,
    status,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceRequest &&
          other.id == this.id &&
          other.service == this.service &&
          other.phase == this.phase &&
          other.building == this.building &&
          other.locationDetails == this.locationDetails &&
          other.problem == this.problem &&
          other.gate == this.gate &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class ServiceRequestsCompanion extends UpdateCompanion<ServiceRequest> {
  final Value<String> id;
  final Value<String> service;
  final Value<int> phase;
  final Value<String> building;
  final Value<String> locationDetails;
  final Value<String> problem;
  final Value<String?> gate;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ServiceRequestsCompanion({
    this.id = const Value.absent(),
    this.service = const Value.absent(),
    this.phase = const Value.absent(),
    this.building = const Value.absent(),
    this.locationDetails = const Value.absent(),
    this.problem = const Value.absent(),
    this.gate = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ServiceRequestsCompanion.insert({
    required String id,
    required String service,
    required int phase,
    required String building,
    required String locationDetails,
    required String problem,
    this.gate = const Value.absent(),
    this.status = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       service = Value(service),
       phase = Value(phase),
       building = Value(building),
       locationDetails = Value(locationDetails),
       problem = Value(problem),
       createdAt = Value(createdAt);
  static Insertable<ServiceRequest> custom({
    Expression<String>? id,
    Expression<String>? service,
    Expression<int>? phase,
    Expression<String>? building,
    Expression<String>? locationDetails,
    Expression<String>? problem,
    Expression<String>? gate,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (service != null) 'service': service,
      if (phase != null) 'phase': phase,
      if (building != null) 'building': building,
      if (locationDetails != null) 'location_details': locationDetails,
      if (problem != null) 'problem': problem,
      if (gate != null) 'gate': gate,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ServiceRequestsCompanion copyWith({
    Value<String>? id,
    Value<String>? service,
    Value<int>? phase,
    Value<String>? building,
    Value<String>? locationDetails,
    Value<String>? problem,
    Value<String?>? gate,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ServiceRequestsCompanion(
      id: id ?? this.id,
      service: service ?? this.service,
      phase: phase ?? this.phase,
      building: building ?? this.building,
      locationDetails: locationDetails ?? this.locationDetails,
      problem: problem ?? this.problem,
      gate: gate ?? this.gate,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (service.present) {
      map['service'] = Variable<String>(service.value);
    }
    if (phase.present) {
      map['phase'] = Variable<int>(phase.value);
    }
    if (building.present) {
      map['building'] = Variable<String>(building.value);
    }
    if (locationDetails.present) {
      map['location_details'] = Variable<String>(locationDetails.value);
    }
    if (problem.present) {
      map['problem'] = Variable<String>(problem.value);
    }
    if (gate.present) {
      map['gate'] = Variable<String>(gate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceRequestsCompanion(')
          ..write('id: $id, ')
          ..write('service: $service, ')
          ..write('phase: $phase, ')
          ..write('building: $building, ')
          ..write('locationDetails: $locationDetails, ')
          ..write('problem: $problem, ')
          ..write('gate: $gate, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RequestEventsTable extends RequestEvents
    with TableInfo<$RequestEventsTable, RequestEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RequestEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _requestIdMeta = const VerificationMeta(
    'requestId',
  );
  @override
  late final GeneratedColumn<String> requestId = GeneratedColumn<String>(
    'request_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES service_requests(id)',
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, requestId, action, occurredAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'request_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<RequestEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('request_id')) {
      context.handle(
        _requestIdMeta,
        requestId.isAcceptableOrUnknown(data['request_id']!, _requestIdMeta),
      );
    } else if (isInserting) {
      context.missing(_requestIdMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RequestEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RequestEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      requestId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}request_id'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
    );
  }

  @override
  $RequestEventsTable createAlias(String alias) {
    return $RequestEventsTable(attachedDatabase, alias);
  }
}

class RequestEvent extends DataClass implements Insertable<RequestEvent> {
  final int id;
  final String requestId;
  final String action;
  final DateTime occurredAt;
  const RequestEvent({
    required this.id,
    required this.requestId,
    required this.action,
    required this.occurredAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['request_id'] = Variable<String>(requestId);
    map['action'] = Variable<String>(action);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    return map;
  }

  RequestEventsCompanion toCompanion(bool nullToAbsent) {
    return RequestEventsCompanion(
      id: Value(id),
      requestId: Value(requestId),
      action: Value(action),
      occurredAt: Value(occurredAt),
    );
  }

  factory RequestEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RequestEvent(
      id: serializer.fromJson<int>(json['id']),
      requestId: serializer.fromJson<String>(json['requestId']),
      action: serializer.fromJson<String>(json['action']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'requestId': serializer.toJson<String>(requestId),
      'action': serializer.toJson<String>(action),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
    };
  }

  RequestEvent copyWith({
    int? id,
    String? requestId,
    String? action,
    DateTime? occurredAt,
  }) => RequestEvent(
    id: id ?? this.id,
    requestId: requestId ?? this.requestId,
    action: action ?? this.action,
    occurredAt: occurredAt ?? this.occurredAt,
  );
  RequestEvent copyWithCompanion(RequestEventsCompanion data) {
    return RequestEvent(
      id: data.id.present ? data.id.value : this.id,
      requestId: data.requestId.present ? data.requestId.value : this.requestId,
      action: data.action.present ? data.action.value : this.action,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RequestEvent(')
          ..write('id: $id, ')
          ..write('requestId: $requestId, ')
          ..write('action: $action, ')
          ..write('occurredAt: $occurredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, requestId, action, occurredAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RequestEvent &&
          other.id == this.id &&
          other.requestId == this.requestId &&
          other.action == this.action &&
          other.occurredAt == this.occurredAt);
}

class RequestEventsCompanion extends UpdateCompanion<RequestEvent> {
  final Value<int> id;
  final Value<String> requestId;
  final Value<String> action;
  final Value<DateTime> occurredAt;
  const RequestEventsCompanion({
    this.id = const Value.absent(),
    this.requestId = const Value.absent(),
    this.action = const Value.absent(),
    this.occurredAt = const Value.absent(),
  });
  RequestEventsCompanion.insert({
    this.id = const Value.absent(),
    required String requestId,
    required String action,
    required DateTime occurredAt,
  }) : requestId = Value(requestId),
       action = Value(action),
       occurredAt = Value(occurredAt);
  static Insertable<RequestEvent> custom({
    Expression<int>? id,
    Expression<String>? requestId,
    Expression<String>? action,
    Expression<DateTime>? occurredAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (requestId != null) 'request_id': requestId,
      if (action != null) 'action': action,
      if (occurredAt != null) 'occurred_at': occurredAt,
    });
  }

  RequestEventsCompanion copyWith({
    Value<int>? id,
    Value<String>? requestId,
    Value<String>? action,
    Value<DateTime>? occurredAt,
  }) {
    return RequestEventsCompanion(
      id: id ?? this.id,
      requestId: requestId ?? this.requestId,
      action: action ?? this.action,
      occurredAt: occurredAt ?? this.occurredAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (requestId.present) {
      map['request_id'] = Variable<String>(requestId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RequestEventsCompanion(')
          ..write('id: $id, ')
          ..write('requestId: $requestId, ')
          ..write('action: $action, ')
          ..write('occurredAt: $occurredAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$WasltDatabase extends GeneratedDatabase {
  _$WasltDatabase(QueryExecutor e) : super(e);
  $WasltDatabaseManager get managers => $WasltDatabaseManager(this);
  late final $ServiceRequestsTable serviceRequests = $ServiceRequestsTable(
    this,
  );
  late final $RequestEventsTable requestEvents = $RequestEventsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    serviceRequests,
    requestEvents,
  ];
}

typedef $$ServiceRequestsTableCreateCompanionBuilder =
    ServiceRequestsCompanion Function({
      required String id,
      required String service,
      required int phase,
      required String building,
      required String locationDetails,
      required String problem,
      Value<String?> gate,
      Value<String> status,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ServiceRequestsTableUpdateCompanionBuilder =
    ServiceRequestsCompanion Function({
      Value<String> id,
      Value<String> service,
      Value<int> phase,
      Value<String> building,
      Value<String> locationDetails,
      Value<String> problem,
      Value<String?> gate,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$ServiceRequestsTableReferences
    extends
        BaseReferences<_$WasltDatabase, $ServiceRequestsTable, ServiceRequest> {
  $$ServiceRequestsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$RequestEventsTable, List<RequestEvent>>
  _requestEventsRefsTable(_$WasltDatabase db) => MultiTypedResultKey.fromTable(
    db.requestEvents,
    aliasName: $_aliasNameGenerator(
      db.serviceRequests.id,
      db.requestEvents.requestId,
    ),
  );

  $$RequestEventsTableProcessedTableManager get requestEventsRefs {
    final manager = $$RequestEventsTableTableManager(
      $_db,
      $_db.requestEvents,
    ).filter((f) => f.requestId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_requestEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ServiceRequestsTableFilterComposer
    extends Composer<_$WasltDatabase, $ServiceRequestsTable> {
  $$ServiceRequestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get service => $composableBuilder(
    column: $table.service,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get phase => $composableBuilder(
    column: $table.phase,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get building => $composableBuilder(
    column: $table.building,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationDetails => $composableBuilder(
    column: $table.locationDetails,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get problem => $composableBuilder(
    column: $table.problem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gate => $composableBuilder(
    column: $table.gate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> requestEventsRefs(
    Expression<bool> Function($$RequestEventsTableFilterComposer f) f,
  ) {
    final $$RequestEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.requestEvents,
      getReferencedColumn: (t) => t.requestId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestEventsTableFilterComposer(
            $db: $db,
            $table: $db.requestEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ServiceRequestsTableOrderingComposer
    extends Composer<_$WasltDatabase, $ServiceRequestsTable> {
  $$ServiceRequestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get service => $composableBuilder(
    column: $table.service,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get phase => $composableBuilder(
    column: $table.phase,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get building => $composableBuilder(
    column: $table.building,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationDetails => $composableBuilder(
    column: $table.locationDetails,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get problem => $composableBuilder(
    column: $table.problem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gate => $composableBuilder(
    column: $table.gate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ServiceRequestsTableAnnotationComposer
    extends Composer<_$WasltDatabase, $ServiceRequestsTable> {
  $$ServiceRequestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get service =>
      $composableBuilder(column: $table.service, builder: (column) => column);

  GeneratedColumn<int> get phase =>
      $composableBuilder(column: $table.phase, builder: (column) => column);

  GeneratedColumn<String> get building =>
      $composableBuilder(column: $table.building, builder: (column) => column);

  GeneratedColumn<String> get locationDetails => $composableBuilder(
    column: $table.locationDetails,
    builder: (column) => column,
  );

  GeneratedColumn<String> get problem =>
      $composableBuilder(column: $table.problem, builder: (column) => column);

  GeneratedColumn<String> get gate =>
      $composableBuilder(column: $table.gate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> requestEventsRefs<T extends Object>(
    Expression<T> Function($$RequestEventsTableAnnotationComposer a) f,
  ) {
    final $$RequestEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.requestEvents,
      getReferencedColumn: (t) => t.requestId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RequestEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.requestEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ServiceRequestsTableTableManager
    extends
        RootTableManager<
          _$WasltDatabase,
          $ServiceRequestsTable,
          ServiceRequest,
          $$ServiceRequestsTableFilterComposer,
          $$ServiceRequestsTableOrderingComposer,
          $$ServiceRequestsTableAnnotationComposer,
          $$ServiceRequestsTableCreateCompanionBuilder,
          $$ServiceRequestsTableUpdateCompanionBuilder,
          (ServiceRequest, $$ServiceRequestsTableReferences),
          ServiceRequest,
          PrefetchHooks Function({bool requestEventsRefs})
        > {
  $$ServiceRequestsTableTableManager(
    _$WasltDatabase db,
    $ServiceRequestsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceRequestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceRequestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceRequestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> service = const Value.absent(),
                Value<int> phase = const Value.absent(),
                Value<String> building = const Value.absent(),
                Value<String> locationDetails = const Value.absent(),
                Value<String> problem = const Value.absent(),
                Value<String?> gate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ServiceRequestsCompanion(
                id: id,
                service: service,
                phase: phase,
                building: building,
                locationDetails: locationDetails,
                problem: problem,
                gate: gate,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String service,
                required int phase,
                required String building,
                required String locationDetails,
                required String problem,
                Value<String?> gate = const Value.absent(),
                Value<String> status = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ServiceRequestsCompanion.insert(
                id: id,
                service: service,
                phase: phase,
                building: building,
                locationDetails: locationDetails,
                problem: problem,
                gate: gate,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ServiceRequestsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({requestEventsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (requestEventsRefs) db.requestEvents,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (requestEventsRefs)
                    await $_getPrefetchedData<
                      ServiceRequest,
                      $ServiceRequestsTable,
                      RequestEvent
                    >(
                      currentTable: table,
                      referencedTable: $$ServiceRequestsTableReferences
                          ._requestEventsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ServiceRequestsTableReferences(
                            db,
                            table,
                            p0,
                          ).requestEventsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.requestId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ServiceRequestsTableProcessedTableManager =
    ProcessedTableManager<
      _$WasltDatabase,
      $ServiceRequestsTable,
      ServiceRequest,
      $$ServiceRequestsTableFilterComposer,
      $$ServiceRequestsTableOrderingComposer,
      $$ServiceRequestsTableAnnotationComposer,
      $$ServiceRequestsTableCreateCompanionBuilder,
      $$ServiceRequestsTableUpdateCompanionBuilder,
      (ServiceRequest, $$ServiceRequestsTableReferences),
      ServiceRequest,
      PrefetchHooks Function({bool requestEventsRefs})
    >;
typedef $$RequestEventsTableCreateCompanionBuilder =
    RequestEventsCompanion Function({
      Value<int> id,
      required String requestId,
      required String action,
      required DateTime occurredAt,
    });
typedef $$RequestEventsTableUpdateCompanionBuilder =
    RequestEventsCompanion Function({
      Value<int> id,
      Value<String> requestId,
      Value<String> action,
      Value<DateTime> occurredAt,
    });

final class $$RequestEventsTableReferences
    extends BaseReferences<_$WasltDatabase, $RequestEventsTable, RequestEvent> {
  $$RequestEventsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ServiceRequestsTable _requestIdTable(_$WasltDatabase db) =>
      db.serviceRequests.createAlias(
        $_aliasNameGenerator(db.requestEvents.requestId, db.serviceRequests.id),
      );

  $$ServiceRequestsTableProcessedTableManager get requestId {
    final $_column = $_itemColumn<String>('request_id')!;

    final manager = $$ServiceRequestsTableTableManager(
      $_db,
      $_db.serviceRequests,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_requestIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RequestEventsTableFilterComposer
    extends Composer<_$WasltDatabase, $RequestEventsTable> {
  $$RequestEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ServiceRequestsTableFilterComposer get requestId {
    final $$ServiceRequestsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestId,
      referencedTable: $db.serviceRequests,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceRequestsTableFilterComposer(
            $db: $db,
            $table: $db.serviceRequests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RequestEventsTableOrderingComposer
    extends Composer<_$WasltDatabase, $RequestEventsTable> {
  $$RequestEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ServiceRequestsTableOrderingComposer get requestId {
    final $$ServiceRequestsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestId,
      referencedTable: $db.serviceRequests,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceRequestsTableOrderingComposer(
            $db: $db,
            $table: $db.serviceRequests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RequestEventsTableAnnotationComposer
    extends Composer<_$WasltDatabase, $RequestEventsTable> {
  $$RequestEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  $$ServiceRequestsTableAnnotationComposer get requestId {
    final $$ServiceRequestsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestId,
      referencedTable: $db.serviceRequests,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceRequestsTableAnnotationComposer(
            $db: $db,
            $table: $db.serviceRequests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RequestEventsTableTableManager
    extends
        RootTableManager<
          _$WasltDatabase,
          $RequestEventsTable,
          RequestEvent,
          $$RequestEventsTableFilterComposer,
          $$RequestEventsTableOrderingComposer,
          $$RequestEventsTableAnnotationComposer,
          $$RequestEventsTableCreateCompanionBuilder,
          $$RequestEventsTableUpdateCompanionBuilder,
          (RequestEvent, $$RequestEventsTableReferences),
          RequestEvent,
          PrefetchHooks Function({bool requestId})
        > {
  $$RequestEventsTableTableManager(
    _$WasltDatabase db,
    $RequestEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RequestEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RequestEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RequestEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> requestId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
              }) => RequestEventsCompanion(
                id: id,
                requestId: requestId,
                action: action,
                occurredAt: occurredAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String requestId,
                required String action,
                required DateTime occurredAt,
              }) => RequestEventsCompanion.insert(
                id: id,
                requestId: requestId,
                action: action,
                occurredAt: occurredAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RequestEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({requestId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (requestId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.requestId,
                        referencedTable: $$RequestEventsTableReferences
                            ._requestIdTable(db),
                        referencedColumn: $$RequestEventsTableReferences
                            ._requestIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RequestEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$WasltDatabase,
      $RequestEventsTable,
      RequestEvent,
      $$RequestEventsTableFilterComposer,
      $$RequestEventsTableOrderingComposer,
      $$RequestEventsTableAnnotationComposer,
      $$RequestEventsTableCreateCompanionBuilder,
      $$RequestEventsTableUpdateCompanionBuilder,
      (RequestEvent, $$RequestEventsTableReferences),
      RequestEvent,
      PrefetchHooks Function({bool requestId})
    >;

class $WasltDatabaseManager {
  final _$WasltDatabase _db;
  $WasltDatabaseManager(this._db);
  $$ServiceRequestsTableTableManager get serviceRequests =>
      $$ServiceRequestsTableTableManager(_db, _db.serviceRequests);
  $$RequestEventsTableTableManager get requestEvents =>
      $$RequestEventsTableTableManager(_db, _db.requestEvents);
}
