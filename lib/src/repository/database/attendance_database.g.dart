// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class AttendanceRecord extends DataClass
    implements Insertable<AttendanceRecord> {
  final String email;
  final double latitude;
  final double longitude;
  final DateTime timeStamp;
  AttendanceRecord(
      {required this.email,
      required this.latitude,
      required this.longitude,
      required this.timeStamp});
  factory AttendanceRecord.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AttendanceRecord(
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      latitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude'])!,
      longitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude'])!,
      timeStamp: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time_stamp'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['email'] = Variable<String>(email);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['time_stamp'] = Variable<DateTime>(timeStamp);
    return map;
  }

  AttendanceTableCompanion toCompanion(bool nullToAbsent) {
    return AttendanceTableCompanion(
      email: Value(email),
      latitude: Value(latitude),
      longitude: Value(longitude),
      timeStamp: Value(timeStamp),
    );
  }

  factory AttendanceRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AttendanceRecord(
      email: serializer.fromJson<String>(json['email']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      timeStamp: serializer.fromJson<DateTime>(json['timeStamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'email': serializer.toJson<String>(email),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'timeStamp': serializer.toJson<DateTime>(timeStamp),
    };
  }

  AttendanceRecord copyWith(
          {String? email,
          double? latitude,
          double? longitude,
          DateTime? timeStamp}) =>
      AttendanceRecord(
        email: email ?? this.email,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        timeStamp: timeStamp ?? this.timeStamp,
      );
  @override
  String toString() {
    return (StringBuffer('AttendanceRecord(')
          ..write('email: $email, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('timeStamp: $timeStamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(email, latitude, longitude, timeStamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceRecord &&
          other.email == this.email &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.timeStamp == this.timeStamp);
}

class AttendanceTableCompanion extends UpdateCompanion<AttendanceRecord> {
  final Value<String> email;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<DateTime> timeStamp;
  const AttendanceTableCompanion({
    this.email = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.timeStamp = const Value.absent(),
  });
  AttendanceTableCompanion.insert({
    required String email,
    required double latitude,
    required double longitude,
    required DateTime timeStamp,
  })  : email = Value(email),
        latitude = Value(latitude),
        longitude = Value(longitude),
        timeStamp = Value(timeStamp);
  static Insertable<AttendanceRecord> custom({
    Expression<String>? email,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<DateTime>? timeStamp,
  }) {
    return RawValuesInsertable({
      if (email != null) 'email': email,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (timeStamp != null) 'time_stamp': timeStamp,
    });
  }

  AttendanceTableCompanion copyWith(
      {Value<String>? email,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<DateTime>? timeStamp}) {
    return AttendanceTableCompanion(
      email: email ?? this.email,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (timeStamp.present) {
      map['time_stamp'] = Variable<DateTime>(timeStamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceTableCompanion(')
          ..write('email: $email, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('timeStamp: $timeStamp')
          ..write(')'))
        .toString();
  }
}

class $AttendanceTableTable extends AttendanceTable
    with TableInfo<$AttendanceTableTable, AttendanceRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double?> latitude = GeneratedColumn<double?>(
      'latitude', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double?> longitude = GeneratedColumn<double?>(
      'longitude', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _timeStampMeta = const VerificationMeta('timeStamp');
  @override
  late final GeneratedColumn<DateTime?> timeStamp = GeneratedColumn<DateTime?>(
      'time_stamp', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [email, latitude, longitude, timeStamp];
  @override
  String get aliasedName => _alias ?? 'attendance_table';
  @override
  String get actualTableName => 'attendance_table';
  @override
  VerificationContext validateIntegrity(Insertable<AttendanceRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('time_stamp')) {
      context.handle(_timeStampMeta,
          timeStamp.isAcceptableOrUnknown(data['time_stamp']!, _timeStampMeta));
    } else if (isInserting) {
      context.missing(_timeStampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  AttendanceRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AttendanceRecord.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AttendanceTableTable createAlias(String alias) {
    return $AttendanceTableTable(attachedDatabase, alias);
  }
}

abstract class _$AttendanceDatabase extends GeneratedDatabase {
  _$AttendanceDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $AttendanceTableTable attendanceTable =
      $AttendanceTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [attendanceTable];
}
