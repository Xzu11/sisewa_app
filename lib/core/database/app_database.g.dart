// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $OrganisasiTable extends Organisasi
    with TableInfo<$OrganisasiTable, OrganisasiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrganisasiTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idOrganisasiMeta = const VerificationMeta(
    'idOrganisasi',
  );
  @override
  late final GeneratedColumn<int> idOrganisasi = GeneratedColumn<int>(
    'id_organisasi',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namaOrganisasiMeta = const VerificationMeta(
    'namaOrganisasi',
  );
  @override
  late final GeneratedColumn<String> namaOrganisasi = GeneratedColumn<String>(
    'nama_organisasi',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _singkatanMeta = const VerificationMeta(
    'singkatan',
  );
  @override
  late final GeneratedColumn<String> singkatan = GeneratedColumn<String>(
    'singkatan',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fakultasMeta = const VerificationMeta(
    'fakultas',
  );
  @override
  late final GeneratedColumn<String> fakultas = GeneratedColumn<String>(
    'fakultas',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jurusanMeta = const VerificationMeta(
    'jurusan',
  );
  @override
  late final GeneratedColumn<String> jurusan = GeneratedColumn<String>(
    'jurusan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _alamatMeta = const VerificationMeta('alamat');
  @override
  late final GeneratedColumn<String> alamat = GeneratedColumn<String>(
    'alamat',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noTeleponMeta = const VerificationMeta(
    'noTelepon',
  );
  @override
  late final GeneratedColumn<String> noTelepon = GeneratedColumn<String>(
    'no_telepon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _namaKetuaMeta = const VerificationMeta(
    'namaKetua',
  );
  @override
  late final GeneratedColumn<String> namaKetua = GeneratedColumn<String>(
    'nama_ketua',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _namaPembinaMeta = const VerificationMeta(
    'namaPembina',
  );
  @override
  late final GeneratedColumn<String> namaPembina = GeneratedColumn<String>(
    'nama_pembina',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoPathMeta = const VerificationMeta(
    'logoPath',
  );
  @override
  late final GeneratedColumn<String> logoPath = GeneratedColumn<String>(
    'logo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idOrganisasi,
    namaOrganisasi,
    singkatan,
    fakultas,
    jurusan,
    alamat,
    email,
    noTelepon,
    namaKetua,
    namaPembina,
    logoPath,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'organisasi';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrganisasiData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_organisasi')) {
      context.handle(
        _idOrganisasiMeta,
        idOrganisasi.isAcceptableOrUnknown(
          data['id_organisasi']!,
          _idOrganisasiMeta,
        ),
      );
    }
    if (data.containsKey('nama_organisasi')) {
      context.handle(
        _namaOrganisasiMeta,
        namaOrganisasi.isAcceptableOrUnknown(
          data['nama_organisasi']!,
          _namaOrganisasiMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_namaOrganisasiMeta);
    }
    if (data.containsKey('singkatan')) {
      context.handle(
        _singkatanMeta,
        singkatan.isAcceptableOrUnknown(data['singkatan']!, _singkatanMeta),
      );
    } else if (isInserting) {
      context.missing(_singkatanMeta);
    }
    if (data.containsKey('fakultas')) {
      context.handle(
        _fakultasMeta,
        fakultas.isAcceptableOrUnknown(data['fakultas']!, _fakultasMeta),
      );
    }
    if (data.containsKey('jurusan')) {
      context.handle(
        _jurusanMeta,
        jurusan.isAcceptableOrUnknown(data['jurusan']!, _jurusanMeta),
      );
    }
    if (data.containsKey('alamat')) {
      context.handle(
        _alamatMeta,
        alamat.isAcceptableOrUnknown(data['alamat']!, _alamatMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('no_telepon')) {
      context.handle(
        _noTeleponMeta,
        noTelepon.isAcceptableOrUnknown(data['no_telepon']!, _noTeleponMeta),
      );
    }
    if (data.containsKey('nama_ketua')) {
      context.handle(
        _namaKetuaMeta,
        namaKetua.isAcceptableOrUnknown(data['nama_ketua']!, _namaKetuaMeta),
      );
    }
    if (data.containsKey('nama_pembina')) {
      context.handle(
        _namaPembinaMeta,
        namaPembina.isAcceptableOrUnknown(
          data['nama_pembina']!,
          _namaPembinaMeta,
        ),
      );
    }
    if (data.containsKey('logo_path')) {
      context.handle(
        _logoPathMeta,
        logoPath.isAcceptableOrUnknown(data['logo_path']!, _logoPathMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idOrganisasi};
  @override
  OrganisasiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrganisasiData(
      idOrganisasi: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_organisasi'],
      )!,
      namaOrganisasi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_organisasi'],
      )!,
      singkatan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}singkatan'],
      )!,
      fakultas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fakultas'],
      ),
      jurusan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jurusan'],
      ),
      alamat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alamat'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      noTelepon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}no_telepon'],
      ),
      namaKetua: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_ketua'],
      ),
      namaPembina: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_pembina'],
      ),
      logoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $OrganisasiTable createAlias(String alias) {
    return $OrganisasiTable(attachedDatabase, alias);
  }
}

class OrganisasiData extends DataClass implements Insertable<OrganisasiData> {
  final int idOrganisasi;
  final String namaOrganisasi;
  final String singkatan;
  final String? fakultas;
  final String? jurusan;
  final String? alamat;
  final String? email;
  final String? noTelepon;
  final String? namaKetua;
  final String? namaPembina;
  final String? logoPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  const OrganisasiData({
    required this.idOrganisasi,
    required this.namaOrganisasi,
    required this.singkatan,
    this.fakultas,
    this.jurusan,
    this.alamat,
    this.email,
    this.noTelepon,
    this.namaKetua,
    this.namaPembina,
    this.logoPath,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_organisasi'] = Variable<int>(idOrganisasi);
    map['nama_organisasi'] = Variable<String>(namaOrganisasi);
    map['singkatan'] = Variable<String>(singkatan);
    if (!nullToAbsent || fakultas != null) {
      map['fakultas'] = Variable<String>(fakultas);
    }
    if (!nullToAbsent || jurusan != null) {
      map['jurusan'] = Variable<String>(jurusan);
    }
    if (!nullToAbsent || alamat != null) {
      map['alamat'] = Variable<String>(alamat);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || noTelepon != null) {
      map['no_telepon'] = Variable<String>(noTelepon);
    }
    if (!nullToAbsent || namaKetua != null) {
      map['nama_ketua'] = Variable<String>(namaKetua);
    }
    if (!nullToAbsent || namaPembina != null) {
      map['nama_pembina'] = Variable<String>(namaPembina);
    }
    if (!nullToAbsent || logoPath != null) {
      map['logo_path'] = Variable<String>(logoPath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  OrganisasiCompanion toCompanion(bool nullToAbsent) {
    return OrganisasiCompanion(
      idOrganisasi: Value(idOrganisasi),
      namaOrganisasi: Value(namaOrganisasi),
      singkatan: Value(singkatan),
      fakultas: fakultas == null && nullToAbsent
          ? const Value.absent()
          : Value(fakultas),
      jurusan: jurusan == null && nullToAbsent
          ? const Value.absent()
          : Value(jurusan),
      alamat: alamat == null && nullToAbsent
          ? const Value.absent()
          : Value(alamat),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      noTelepon: noTelepon == null && nullToAbsent
          ? const Value.absent()
          : Value(noTelepon),
      namaKetua: namaKetua == null && nullToAbsent
          ? const Value.absent()
          : Value(namaKetua),
      namaPembina: namaPembina == null && nullToAbsent
          ? const Value.absent()
          : Value(namaPembina),
      logoPath: logoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(logoPath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory OrganisasiData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrganisasiData(
      idOrganisasi: serializer.fromJson<int>(json['idOrganisasi']),
      namaOrganisasi: serializer.fromJson<String>(json['namaOrganisasi']),
      singkatan: serializer.fromJson<String>(json['singkatan']),
      fakultas: serializer.fromJson<String?>(json['fakultas']),
      jurusan: serializer.fromJson<String?>(json['jurusan']),
      alamat: serializer.fromJson<String?>(json['alamat']),
      email: serializer.fromJson<String?>(json['email']),
      noTelepon: serializer.fromJson<String?>(json['noTelepon']),
      namaKetua: serializer.fromJson<String?>(json['namaKetua']),
      namaPembina: serializer.fromJson<String?>(json['namaPembina']),
      logoPath: serializer.fromJson<String?>(json['logoPath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idOrganisasi': serializer.toJson<int>(idOrganisasi),
      'namaOrganisasi': serializer.toJson<String>(namaOrganisasi),
      'singkatan': serializer.toJson<String>(singkatan),
      'fakultas': serializer.toJson<String?>(fakultas),
      'jurusan': serializer.toJson<String?>(jurusan),
      'alamat': serializer.toJson<String?>(alamat),
      'email': serializer.toJson<String?>(email),
      'noTelepon': serializer.toJson<String?>(noTelepon),
      'namaKetua': serializer.toJson<String?>(namaKetua),
      'namaPembina': serializer.toJson<String?>(namaPembina),
      'logoPath': serializer.toJson<String?>(logoPath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  OrganisasiData copyWith({
    int? idOrganisasi,
    String? namaOrganisasi,
    String? singkatan,
    Value<String?> fakultas = const Value.absent(),
    Value<String?> jurusan = const Value.absent(),
    Value<String?> alamat = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> noTelepon = const Value.absent(),
    Value<String?> namaKetua = const Value.absent(),
    Value<String?> namaPembina = const Value.absent(),
    Value<String?> logoPath = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => OrganisasiData(
    idOrganisasi: idOrganisasi ?? this.idOrganisasi,
    namaOrganisasi: namaOrganisasi ?? this.namaOrganisasi,
    singkatan: singkatan ?? this.singkatan,
    fakultas: fakultas.present ? fakultas.value : this.fakultas,
    jurusan: jurusan.present ? jurusan.value : this.jurusan,
    alamat: alamat.present ? alamat.value : this.alamat,
    email: email.present ? email.value : this.email,
    noTelepon: noTelepon.present ? noTelepon.value : this.noTelepon,
    namaKetua: namaKetua.present ? namaKetua.value : this.namaKetua,
    namaPembina: namaPembina.present ? namaPembina.value : this.namaPembina,
    logoPath: logoPath.present ? logoPath.value : this.logoPath,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  OrganisasiData copyWithCompanion(OrganisasiCompanion data) {
    return OrganisasiData(
      idOrganisasi: data.idOrganisasi.present
          ? data.idOrganisasi.value
          : this.idOrganisasi,
      namaOrganisasi: data.namaOrganisasi.present
          ? data.namaOrganisasi.value
          : this.namaOrganisasi,
      singkatan: data.singkatan.present ? data.singkatan.value : this.singkatan,
      fakultas: data.fakultas.present ? data.fakultas.value : this.fakultas,
      jurusan: data.jurusan.present ? data.jurusan.value : this.jurusan,
      alamat: data.alamat.present ? data.alamat.value : this.alamat,
      email: data.email.present ? data.email.value : this.email,
      noTelepon: data.noTelepon.present ? data.noTelepon.value : this.noTelepon,
      namaKetua: data.namaKetua.present ? data.namaKetua.value : this.namaKetua,
      namaPembina: data.namaPembina.present
          ? data.namaPembina.value
          : this.namaPembina,
      logoPath: data.logoPath.present ? data.logoPath.value : this.logoPath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrganisasiData(')
          ..write('idOrganisasi: $idOrganisasi, ')
          ..write('namaOrganisasi: $namaOrganisasi, ')
          ..write('singkatan: $singkatan, ')
          ..write('fakultas: $fakultas, ')
          ..write('jurusan: $jurusan, ')
          ..write('alamat: $alamat, ')
          ..write('email: $email, ')
          ..write('noTelepon: $noTelepon, ')
          ..write('namaKetua: $namaKetua, ')
          ..write('namaPembina: $namaPembina, ')
          ..write('logoPath: $logoPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idOrganisasi,
    namaOrganisasi,
    singkatan,
    fakultas,
    jurusan,
    alamat,
    email,
    noTelepon,
    namaKetua,
    namaPembina,
    logoPath,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganisasiData &&
          other.idOrganisasi == this.idOrganisasi &&
          other.namaOrganisasi == this.namaOrganisasi &&
          other.singkatan == this.singkatan &&
          other.fakultas == this.fakultas &&
          other.jurusan == this.jurusan &&
          other.alamat == this.alamat &&
          other.email == this.email &&
          other.noTelepon == this.noTelepon &&
          other.namaKetua == this.namaKetua &&
          other.namaPembina == this.namaPembina &&
          other.logoPath == this.logoPath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class OrganisasiCompanion extends UpdateCompanion<OrganisasiData> {
  final Value<int> idOrganisasi;
  final Value<String> namaOrganisasi;
  final Value<String> singkatan;
  final Value<String?> fakultas;
  final Value<String?> jurusan;
  final Value<String?> alamat;
  final Value<String?> email;
  final Value<String?> noTelepon;
  final Value<String?> namaKetua;
  final Value<String?> namaPembina;
  final Value<String?> logoPath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const OrganisasiCompanion({
    this.idOrganisasi = const Value.absent(),
    this.namaOrganisasi = const Value.absent(),
    this.singkatan = const Value.absent(),
    this.fakultas = const Value.absent(),
    this.jurusan = const Value.absent(),
    this.alamat = const Value.absent(),
    this.email = const Value.absent(),
    this.noTelepon = const Value.absent(),
    this.namaKetua = const Value.absent(),
    this.namaPembina = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  OrganisasiCompanion.insert({
    this.idOrganisasi = const Value.absent(),
    required String namaOrganisasi,
    required String singkatan,
    this.fakultas = const Value.absent(),
    this.jurusan = const Value.absent(),
    this.alamat = const Value.absent(),
    this.email = const Value.absent(),
    this.noTelepon = const Value.absent(),
    this.namaKetua = const Value.absent(),
    this.namaPembina = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : namaOrganisasi = Value(namaOrganisasi),
       singkatan = Value(singkatan);
  static Insertable<OrganisasiData> custom({
    Expression<int>? idOrganisasi,
    Expression<String>? namaOrganisasi,
    Expression<String>? singkatan,
    Expression<String>? fakultas,
    Expression<String>? jurusan,
    Expression<String>? alamat,
    Expression<String>? email,
    Expression<String>? noTelepon,
    Expression<String>? namaKetua,
    Expression<String>? namaPembina,
    Expression<String>? logoPath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (idOrganisasi != null) 'id_organisasi': idOrganisasi,
      if (namaOrganisasi != null) 'nama_organisasi': namaOrganisasi,
      if (singkatan != null) 'singkatan': singkatan,
      if (fakultas != null) 'fakultas': fakultas,
      if (jurusan != null) 'jurusan': jurusan,
      if (alamat != null) 'alamat': alamat,
      if (email != null) 'email': email,
      if (noTelepon != null) 'no_telepon': noTelepon,
      if (namaKetua != null) 'nama_ketua': namaKetua,
      if (namaPembina != null) 'nama_pembina': namaPembina,
      if (logoPath != null) 'logo_path': logoPath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  OrganisasiCompanion copyWith({
    Value<int>? idOrganisasi,
    Value<String>? namaOrganisasi,
    Value<String>? singkatan,
    Value<String?>? fakultas,
    Value<String?>? jurusan,
    Value<String?>? alamat,
    Value<String?>? email,
    Value<String?>? noTelepon,
    Value<String?>? namaKetua,
    Value<String?>? namaPembina,
    Value<String?>? logoPath,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return OrganisasiCompanion(
      idOrganisasi: idOrganisasi ?? this.idOrganisasi,
      namaOrganisasi: namaOrganisasi ?? this.namaOrganisasi,
      singkatan: singkatan ?? this.singkatan,
      fakultas: fakultas ?? this.fakultas,
      jurusan: jurusan ?? this.jurusan,
      alamat: alamat ?? this.alamat,
      email: email ?? this.email,
      noTelepon: noTelepon ?? this.noTelepon,
      namaKetua: namaKetua ?? this.namaKetua,
      namaPembina: namaPembina ?? this.namaPembina,
      logoPath: logoPath ?? this.logoPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idOrganisasi.present) {
      map['id_organisasi'] = Variable<int>(idOrganisasi.value);
    }
    if (namaOrganisasi.present) {
      map['nama_organisasi'] = Variable<String>(namaOrganisasi.value);
    }
    if (singkatan.present) {
      map['singkatan'] = Variable<String>(singkatan.value);
    }
    if (fakultas.present) {
      map['fakultas'] = Variable<String>(fakultas.value);
    }
    if (jurusan.present) {
      map['jurusan'] = Variable<String>(jurusan.value);
    }
    if (alamat.present) {
      map['alamat'] = Variable<String>(alamat.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (noTelepon.present) {
      map['no_telepon'] = Variable<String>(noTelepon.value);
    }
    if (namaKetua.present) {
      map['nama_ketua'] = Variable<String>(namaKetua.value);
    }
    if (namaPembina.present) {
      map['nama_pembina'] = Variable<String>(namaPembina.value);
    }
    if (logoPath.present) {
      map['logo_path'] = Variable<String>(logoPath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrganisasiCompanion(')
          ..write('idOrganisasi: $idOrganisasi, ')
          ..write('namaOrganisasi: $namaOrganisasi, ')
          ..write('singkatan: $singkatan, ')
          ..write('fakultas: $fakultas, ')
          ..write('jurusan: $jurusan, ')
          ..write('alamat: $alamat, ')
          ..write('email: $email, ')
          ..write('noTelepon: $noTelepon, ')
          ..write('namaKetua: $namaKetua, ')
          ..write('namaPembina: $namaPembina, ')
          ..write('logoPath: $logoPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $LevelTable extends Level with TableInfo<$LevelTable, LevelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LevelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idLevelMeta = const VerificationMeta(
    'idLevel',
  );
  @override
  late final GeneratedColumn<int> idLevel = GeneratedColumn<int>(
    'id_level',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namaLevelMeta = const VerificationMeta(
    'namaLevel',
  );
  @override
  late final GeneratedColumn<String> namaLevel = GeneratedColumn<String>(
    'nama_level',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _deskripsiMeta = const VerificationMeta(
    'deskripsi',
  );
  @override
  late final GeneratedColumn<String> deskripsi = GeneratedColumn<String>(
    'deskripsi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusRecordMeta = const VerificationMeta(
    'statusRecord',
  );
  @override
  late final GeneratedColumn<String> statusRecord = GeneratedColumn<String>(
    'status_record',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('aktif'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idLevel,
    namaLevel,
    deskripsi,
    statusRecord,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'level';
  @override
  VerificationContext validateIntegrity(
    Insertable<LevelData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_level')) {
      context.handle(
        _idLevelMeta,
        idLevel.isAcceptableOrUnknown(data['id_level']!, _idLevelMeta),
      );
    }
    if (data.containsKey('nama_level')) {
      context.handle(
        _namaLevelMeta,
        namaLevel.isAcceptableOrUnknown(data['nama_level']!, _namaLevelMeta),
      );
    } else if (isInserting) {
      context.missing(_namaLevelMeta);
    }
    if (data.containsKey('deskripsi')) {
      context.handle(
        _deskripsiMeta,
        deskripsi.isAcceptableOrUnknown(data['deskripsi']!, _deskripsiMeta),
      );
    }
    if (data.containsKey('status_record')) {
      context.handle(
        _statusRecordMeta,
        statusRecord.isAcceptableOrUnknown(
          data['status_record']!,
          _statusRecordMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idLevel};
  @override
  LevelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LevelData(
      idLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_level'],
      )!,
      namaLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_level'],
      )!,
      deskripsi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deskripsi'],
      ),
      statusRecord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_record'],
      )!,
    );
  }

  @override
  $LevelTable createAlias(String alias) {
    return $LevelTable(attachedDatabase, alias);
  }
}

class LevelData extends DataClass implements Insertable<LevelData> {
  final int idLevel;
  final String namaLevel;
  final String? deskripsi;
  final String statusRecord;
  const LevelData({
    required this.idLevel,
    required this.namaLevel,
    this.deskripsi,
    required this.statusRecord,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_level'] = Variable<int>(idLevel);
    map['nama_level'] = Variable<String>(namaLevel);
    if (!nullToAbsent || deskripsi != null) {
      map['deskripsi'] = Variable<String>(deskripsi);
    }
    map['status_record'] = Variable<String>(statusRecord);
    return map;
  }

  LevelCompanion toCompanion(bool nullToAbsent) {
    return LevelCompanion(
      idLevel: Value(idLevel),
      namaLevel: Value(namaLevel),
      deskripsi: deskripsi == null && nullToAbsent
          ? const Value.absent()
          : Value(deskripsi),
      statusRecord: Value(statusRecord),
    );
  }

  factory LevelData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LevelData(
      idLevel: serializer.fromJson<int>(json['idLevel']),
      namaLevel: serializer.fromJson<String>(json['namaLevel']),
      deskripsi: serializer.fromJson<String?>(json['deskripsi']),
      statusRecord: serializer.fromJson<String>(json['statusRecord']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idLevel': serializer.toJson<int>(idLevel),
      'namaLevel': serializer.toJson<String>(namaLevel),
      'deskripsi': serializer.toJson<String?>(deskripsi),
      'statusRecord': serializer.toJson<String>(statusRecord),
    };
  }

  LevelData copyWith({
    int? idLevel,
    String? namaLevel,
    Value<String?> deskripsi = const Value.absent(),
    String? statusRecord,
  }) => LevelData(
    idLevel: idLevel ?? this.idLevel,
    namaLevel: namaLevel ?? this.namaLevel,
    deskripsi: deskripsi.present ? deskripsi.value : this.deskripsi,
    statusRecord: statusRecord ?? this.statusRecord,
  );
  LevelData copyWithCompanion(LevelCompanion data) {
    return LevelData(
      idLevel: data.idLevel.present ? data.idLevel.value : this.idLevel,
      namaLevel: data.namaLevel.present ? data.namaLevel.value : this.namaLevel,
      deskripsi: data.deskripsi.present ? data.deskripsi.value : this.deskripsi,
      statusRecord: data.statusRecord.present
          ? data.statusRecord.value
          : this.statusRecord,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LevelData(')
          ..write('idLevel: $idLevel, ')
          ..write('namaLevel: $namaLevel, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('statusRecord: $statusRecord')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idLevel, namaLevel, deskripsi, statusRecord);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LevelData &&
          other.idLevel == this.idLevel &&
          other.namaLevel == this.namaLevel &&
          other.deskripsi == this.deskripsi &&
          other.statusRecord == this.statusRecord);
}

class LevelCompanion extends UpdateCompanion<LevelData> {
  final Value<int> idLevel;
  final Value<String> namaLevel;
  final Value<String?> deskripsi;
  final Value<String> statusRecord;
  const LevelCompanion({
    this.idLevel = const Value.absent(),
    this.namaLevel = const Value.absent(),
    this.deskripsi = const Value.absent(),
    this.statusRecord = const Value.absent(),
  });
  LevelCompanion.insert({
    this.idLevel = const Value.absent(),
    required String namaLevel,
    this.deskripsi = const Value.absent(),
    this.statusRecord = const Value.absent(),
  }) : namaLevel = Value(namaLevel);
  static Insertable<LevelData> custom({
    Expression<int>? idLevel,
    Expression<String>? namaLevel,
    Expression<String>? deskripsi,
    Expression<String>? statusRecord,
  }) {
    return RawValuesInsertable({
      if (idLevel != null) 'id_level': idLevel,
      if (namaLevel != null) 'nama_level': namaLevel,
      if (deskripsi != null) 'deskripsi': deskripsi,
      if (statusRecord != null) 'status_record': statusRecord,
    });
  }

  LevelCompanion copyWith({
    Value<int>? idLevel,
    Value<String>? namaLevel,
    Value<String?>? deskripsi,
    Value<String>? statusRecord,
  }) {
    return LevelCompanion(
      idLevel: idLevel ?? this.idLevel,
      namaLevel: namaLevel ?? this.namaLevel,
      deskripsi: deskripsi ?? this.deskripsi,
      statusRecord: statusRecord ?? this.statusRecord,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idLevel.present) {
      map['id_level'] = Variable<int>(idLevel.value);
    }
    if (namaLevel.present) {
      map['nama_level'] = Variable<String>(namaLevel.value);
    }
    if (deskripsi.present) {
      map['deskripsi'] = Variable<String>(deskripsi.value);
    }
    if (statusRecord.present) {
      map['status_record'] = Variable<String>(statusRecord.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LevelCompanion(')
          ..write('idLevel: $idLevel, ')
          ..write('namaLevel: $namaLevel, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('statusRecord: $statusRecord')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  @override
  late final GeneratedColumn<int> idUser = GeneratedColumn<int>(
    'id_user',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _passwordHashMeta = const VerificationMeta(
    'passwordHash',
  );
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
    'password_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _namaLengkapMeta = const VerificationMeta(
    'namaLengkap',
  );
  @override
  late final GeneratedColumn<String> namaLengkap = GeneratedColumn<String>(
    'nama_lengkap',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noTeleponMeta = const VerificationMeta(
    'noTelepon',
  );
  @override
  late final GeneratedColumn<String> noTelepon = GeneratedColumn<String>(
    'no_telepon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('aktif'),
  );
  static const VerificationMeta _lastLoginMeta = const VerificationMeta(
    'lastLogin',
  );
  @override
  late final GeneratedColumn<DateTime> lastLogin = GeneratedColumn<DateTime>(
    'last_login',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idUser,
    username,
    passwordHash,
    namaLengkap,
    email,
    noTelepon,
    role,
    status,
    lastLogin,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_user')) {
      context.handle(
        _idUserMeta,
        idUser.isAcceptableOrUnknown(data['id_user']!, _idUserMeta),
      );
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
        _passwordHashMeta,
        passwordHash.isAcceptableOrUnknown(
          data['password_hash']!,
          _passwordHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('nama_lengkap')) {
      context.handle(
        _namaLengkapMeta,
        namaLengkap.isAcceptableOrUnknown(
          data['nama_lengkap']!,
          _namaLengkapMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_namaLengkapMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('no_telepon')) {
      context.handle(
        _noTeleponMeta,
        noTelepon.isAcceptableOrUnknown(data['no_telepon']!, _noTeleponMeta),
      );
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('last_login')) {
      context.handle(
        _lastLoginMeta,
        lastLogin.isAcceptableOrUnknown(data['last_login']!, _lastLoginMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idUser};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      idUser: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_user'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      passwordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_hash'],
      )!,
      namaLengkap: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_lengkap'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      noTelepon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}no_telepon'],
      ),
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      lastLogin: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_login'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int idUser;
  final String username;
  final String passwordHash;
  final String namaLengkap;
  final String? email;
  final String? noTelepon;
  final String role;
  final String status;
  final DateTime? lastLogin;
  final DateTime createdAt;
  final DateTime updatedAt;
  const User({
    required this.idUser,
    required this.username,
    required this.passwordHash,
    required this.namaLengkap,
    this.email,
    this.noTelepon,
    required this.role,
    required this.status,
    this.lastLogin,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_user'] = Variable<int>(idUser);
    map['username'] = Variable<String>(username);
    map['password_hash'] = Variable<String>(passwordHash);
    map['nama_lengkap'] = Variable<String>(namaLengkap);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || noTelepon != null) {
      map['no_telepon'] = Variable<String>(noTelepon);
    }
    map['role'] = Variable<String>(role);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || lastLogin != null) {
      map['last_login'] = Variable<DateTime>(lastLogin);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      idUser: Value(idUser),
      username: Value(username),
      passwordHash: Value(passwordHash),
      namaLengkap: Value(namaLengkap),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      noTelepon: noTelepon == null && nullToAbsent
          ? const Value.absent()
          : Value(noTelepon),
      role: Value(role),
      status: Value(status),
      lastLogin: lastLogin == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLogin),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      idUser: serializer.fromJson<int>(json['idUser']),
      username: serializer.fromJson<String>(json['username']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      namaLengkap: serializer.fromJson<String>(json['namaLengkap']),
      email: serializer.fromJson<String?>(json['email']),
      noTelepon: serializer.fromJson<String?>(json['noTelepon']),
      role: serializer.fromJson<String>(json['role']),
      status: serializer.fromJson<String>(json['status']),
      lastLogin: serializer.fromJson<DateTime?>(json['lastLogin']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idUser': serializer.toJson<int>(idUser),
      'username': serializer.toJson<String>(username),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'namaLengkap': serializer.toJson<String>(namaLengkap),
      'email': serializer.toJson<String?>(email),
      'noTelepon': serializer.toJson<String?>(noTelepon),
      'role': serializer.toJson<String>(role),
      'status': serializer.toJson<String>(status),
      'lastLogin': serializer.toJson<DateTime?>(lastLogin),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  User copyWith({
    int? idUser,
    String? username,
    String? passwordHash,
    String? namaLengkap,
    Value<String?> email = const Value.absent(),
    Value<String?> noTelepon = const Value.absent(),
    String? role,
    String? status,
    Value<DateTime?> lastLogin = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => User(
    idUser: idUser ?? this.idUser,
    username: username ?? this.username,
    passwordHash: passwordHash ?? this.passwordHash,
    namaLengkap: namaLengkap ?? this.namaLengkap,
    email: email.present ? email.value : this.email,
    noTelepon: noTelepon.present ? noTelepon.value : this.noTelepon,
    role: role ?? this.role,
    status: status ?? this.status,
    lastLogin: lastLogin.present ? lastLogin.value : this.lastLogin,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      idUser: data.idUser.present ? data.idUser.value : this.idUser,
      username: data.username.present ? data.username.value : this.username,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      namaLengkap: data.namaLengkap.present
          ? data.namaLengkap.value
          : this.namaLengkap,
      email: data.email.present ? data.email.value : this.email,
      noTelepon: data.noTelepon.present ? data.noTelepon.value : this.noTelepon,
      role: data.role.present ? data.role.value : this.role,
      status: data.status.present ? data.status.value : this.status,
      lastLogin: data.lastLogin.present ? data.lastLogin.value : this.lastLogin,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('idUser: $idUser, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('namaLengkap: $namaLengkap, ')
          ..write('email: $email, ')
          ..write('noTelepon: $noTelepon, ')
          ..write('role: $role, ')
          ..write('status: $status, ')
          ..write('lastLogin: $lastLogin, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idUser,
    username,
    passwordHash,
    namaLengkap,
    email,
    noTelepon,
    role,
    status,
    lastLogin,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.idUser == this.idUser &&
          other.username == this.username &&
          other.passwordHash == this.passwordHash &&
          other.namaLengkap == this.namaLengkap &&
          other.email == this.email &&
          other.noTelepon == this.noTelepon &&
          other.role == this.role &&
          other.status == this.status &&
          other.lastLogin == this.lastLogin &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> idUser;
  final Value<String> username;
  final Value<String> passwordHash;
  final Value<String> namaLengkap;
  final Value<String?> email;
  final Value<String?> noTelepon;
  final Value<String> role;
  final Value<String> status;
  final Value<DateTime?> lastLogin;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UsersCompanion({
    this.idUser = const Value.absent(),
    this.username = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.namaLengkap = const Value.absent(),
    this.email = const Value.absent(),
    this.noTelepon = const Value.absent(),
    this.role = const Value.absent(),
    this.status = const Value.absent(),
    this.lastLogin = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.idUser = const Value.absent(),
    required String username,
    required String passwordHash,
    required String namaLengkap,
    this.email = const Value.absent(),
    this.noTelepon = const Value.absent(),
    required String role,
    this.status = const Value.absent(),
    this.lastLogin = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : username = Value(username),
       passwordHash = Value(passwordHash),
       namaLengkap = Value(namaLengkap),
       role = Value(role);
  static Insertable<User> custom({
    Expression<int>? idUser,
    Expression<String>? username,
    Expression<String>? passwordHash,
    Expression<String>? namaLengkap,
    Expression<String>? email,
    Expression<String>? noTelepon,
    Expression<String>? role,
    Expression<String>? status,
    Expression<DateTime>? lastLogin,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (idUser != null) 'id_user': idUser,
      if (username != null) 'username': username,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (namaLengkap != null) 'nama_lengkap': namaLengkap,
      if (email != null) 'email': email,
      if (noTelepon != null) 'no_telepon': noTelepon,
      if (role != null) 'role': role,
      if (status != null) 'status': status,
      if (lastLogin != null) 'last_login': lastLogin,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UsersCompanion copyWith({
    Value<int>? idUser,
    Value<String>? username,
    Value<String>? passwordHash,
    Value<String>? namaLengkap,
    Value<String?>? email,
    Value<String?>? noTelepon,
    Value<String>? role,
    Value<String>? status,
    Value<DateTime?>? lastLogin,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return UsersCompanion(
      idUser: idUser ?? this.idUser,
      username: username ?? this.username,
      passwordHash: passwordHash ?? this.passwordHash,
      namaLengkap: namaLengkap ?? this.namaLengkap,
      email: email ?? this.email,
      noTelepon: noTelepon ?? this.noTelepon,
      role: role ?? this.role,
      status: status ?? this.status,
      lastLogin: lastLogin ?? this.lastLogin,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idUser.present) {
      map['id_user'] = Variable<int>(idUser.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (namaLengkap.present) {
      map['nama_lengkap'] = Variable<String>(namaLengkap.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (noTelepon.present) {
      map['no_telepon'] = Variable<String>(noTelepon.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (lastLogin.present) {
      map['last_login'] = Variable<DateTime>(lastLogin.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('idUser: $idUser, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('namaLengkap: $namaLengkap, ')
          ..write('email: $email, ')
          ..write('noTelepon: $noTelepon, ')
          ..write('role: $role, ')
          ..write('status: $status, ')
          ..write('lastLogin: $lastLogin, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UserOrganisasiTable extends UserOrganisasi
    with TableInfo<$UserOrganisasiTable, UserOrganisasiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserOrganisasiTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idUserOrganisasiMeta = const VerificationMeta(
    'idUserOrganisasi',
  );
  @override
  late final GeneratedColumn<int> idUserOrganisasi = GeneratedColumn<int>(
    'id_user_organisasi',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  @override
  late final GeneratedColumn<int> idUser = GeneratedColumn<int>(
    'id_user',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id_user)',
    ),
  );
  static const VerificationMeta _idOrganisasiMeta = const VerificationMeta(
    'idOrganisasi',
  );
  @override
  late final GeneratedColumn<int> idOrganisasi = GeneratedColumn<int>(
    'id_organisasi',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES organisasi (id_organisasi)',
    ),
  );
  static const VerificationMeta _jabatanMeta = const VerificationMeta(
    'jabatan',
  );
  @override
  late final GeneratedColumn<String> jabatan = GeneratedColumn<String>(
    'jabatan',
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
    defaultValue: const Constant('aktif'),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idUserOrganisasi,
    idUser,
    idOrganisasi,
    jabatan,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_organisasi';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserOrganisasiData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_user_organisasi')) {
      context.handle(
        _idUserOrganisasiMeta,
        idUserOrganisasi.isAcceptableOrUnknown(
          data['id_user_organisasi']!,
          _idUserOrganisasiMeta,
        ),
      );
    }
    if (data.containsKey('id_user')) {
      context.handle(
        _idUserMeta,
        idUser.isAcceptableOrUnknown(data['id_user']!, _idUserMeta),
      );
    } else if (isInserting) {
      context.missing(_idUserMeta);
    }
    if (data.containsKey('id_organisasi')) {
      context.handle(
        _idOrganisasiMeta,
        idOrganisasi.isAcceptableOrUnknown(
          data['id_organisasi']!,
          _idOrganisasiMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idOrganisasiMeta);
    }
    if (data.containsKey('jabatan')) {
      context.handle(
        _jabatanMeta,
        jabatan.isAcceptableOrUnknown(data['jabatan']!, _jabatanMeta),
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
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idUserOrganisasi};
  @override
  UserOrganisasiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserOrganisasiData(
      idUserOrganisasi: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_user_organisasi'],
      )!,
      idUser: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_user'],
      )!,
      idOrganisasi: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_organisasi'],
      )!,
      jabatan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jabatan'],
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
  $UserOrganisasiTable createAlias(String alias) {
    return $UserOrganisasiTable(attachedDatabase, alias);
  }
}

class UserOrganisasiData extends DataClass
    implements Insertable<UserOrganisasiData> {
  final int idUserOrganisasi;
  final int idUser;
  final int idOrganisasi;
  final String? jabatan;
  final String status;
  final DateTime createdAt;
  const UserOrganisasiData({
    required this.idUserOrganisasi,
    required this.idUser,
    required this.idOrganisasi,
    this.jabatan,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_user_organisasi'] = Variable<int>(idUserOrganisasi);
    map['id_user'] = Variable<int>(idUser);
    map['id_organisasi'] = Variable<int>(idOrganisasi);
    if (!nullToAbsent || jabatan != null) {
      map['jabatan'] = Variable<String>(jabatan);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UserOrganisasiCompanion toCompanion(bool nullToAbsent) {
    return UserOrganisasiCompanion(
      idUserOrganisasi: Value(idUserOrganisasi),
      idUser: Value(idUser),
      idOrganisasi: Value(idOrganisasi),
      jabatan: jabatan == null && nullToAbsent
          ? const Value.absent()
          : Value(jabatan),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory UserOrganisasiData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserOrganisasiData(
      idUserOrganisasi: serializer.fromJson<int>(json['idUserOrganisasi']),
      idUser: serializer.fromJson<int>(json['idUser']),
      idOrganisasi: serializer.fromJson<int>(json['idOrganisasi']),
      jabatan: serializer.fromJson<String?>(json['jabatan']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idUserOrganisasi': serializer.toJson<int>(idUserOrganisasi),
      'idUser': serializer.toJson<int>(idUser),
      'idOrganisasi': serializer.toJson<int>(idOrganisasi),
      'jabatan': serializer.toJson<String?>(jabatan),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserOrganisasiData copyWith({
    int? idUserOrganisasi,
    int? idUser,
    int? idOrganisasi,
    Value<String?> jabatan = const Value.absent(),
    String? status,
    DateTime? createdAt,
  }) => UserOrganisasiData(
    idUserOrganisasi: idUserOrganisasi ?? this.idUserOrganisasi,
    idUser: idUser ?? this.idUser,
    idOrganisasi: idOrganisasi ?? this.idOrganisasi,
    jabatan: jabatan.present ? jabatan.value : this.jabatan,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  UserOrganisasiData copyWithCompanion(UserOrganisasiCompanion data) {
    return UserOrganisasiData(
      idUserOrganisasi: data.idUserOrganisasi.present
          ? data.idUserOrganisasi.value
          : this.idUserOrganisasi,
      idUser: data.idUser.present ? data.idUser.value : this.idUser,
      idOrganisasi: data.idOrganisasi.present
          ? data.idOrganisasi.value
          : this.idOrganisasi,
      jabatan: data.jabatan.present ? data.jabatan.value : this.jabatan,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserOrganisasiData(')
          ..write('idUserOrganisasi: $idUserOrganisasi, ')
          ..write('idUser: $idUser, ')
          ..write('idOrganisasi: $idOrganisasi, ')
          ..write('jabatan: $jabatan, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idUserOrganisasi,
    idUser,
    idOrganisasi,
    jabatan,
    status,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserOrganisasiData &&
          other.idUserOrganisasi == this.idUserOrganisasi &&
          other.idUser == this.idUser &&
          other.idOrganisasi == this.idOrganisasi &&
          other.jabatan == this.jabatan &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class UserOrganisasiCompanion extends UpdateCompanion<UserOrganisasiData> {
  final Value<int> idUserOrganisasi;
  final Value<int> idUser;
  final Value<int> idOrganisasi;
  final Value<String?> jabatan;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const UserOrganisasiCompanion({
    this.idUserOrganisasi = const Value.absent(),
    this.idUser = const Value.absent(),
    this.idOrganisasi = const Value.absent(),
    this.jabatan = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UserOrganisasiCompanion.insert({
    this.idUserOrganisasi = const Value.absent(),
    required int idUser,
    required int idOrganisasi,
    this.jabatan = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : idUser = Value(idUser),
       idOrganisasi = Value(idOrganisasi);
  static Insertable<UserOrganisasiData> custom({
    Expression<int>? idUserOrganisasi,
    Expression<int>? idUser,
    Expression<int>? idOrganisasi,
    Expression<String>? jabatan,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (idUserOrganisasi != null) 'id_user_organisasi': idUserOrganisasi,
      if (idUser != null) 'id_user': idUser,
      if (idOrganisasi != null) 'id_organisasi': idOrganisasi,
      if (jabatan != null) 'jabatan': jabatan,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UserOrganisasiCompanion copyWith({
    Value<int>? idUserOrganisasi,
    Value<int>? idUser,
    Value<int>? idOrganisasi,
    Value<String?>? jabatan,
    Value<String>? status,
    Value<DateTime>? createdAt,
  }) {
    return UserOrganisasiCompanion(
      idUserOrganisasi: idUserOrganisasi ?? this.idUserOrganisasi,
      idUser: idUser ?? this.idUser,
      idOrganisasi: idOrganisasi ?? this.idOrganisasi,
      jabatan: jabatan ?? this.jabatan,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idUserOrganisasi.present) {
      map['id_user_organisasi'] = Variable<int>(idUserOrganisasi.value);
    }
    if (idUser.present) {
      map['id_user'] = Variable<int>(idUser.value);
    }
    if (idOrganisasi.present) {
      map['id_organisasi'] = Variable<int>(idOrganisasi.value);
    }
    if (jabatan.present) {
      map['jabatan'] = Variable<String>(jabatan.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserOrganisasiCompanion(')
          ..write('idUserOrganisasi: $idUserOrganisasi, ')
          ..write('idUser: $idUser, ')
          ..write('idOrganisasi: $idOrganisasi, ')
          ..write('jabatan: $jabatan, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $KategoriBarangTable extends KategoriBarang
    with TableInfo<$KategoriBarangTable, KategoriBarangData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KategoriBarangTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idKategoriMeta = const VerificationMeta(
    'idKategori',
  );
  @override
  late final GeneratedColumn<int> idKategori = GeneratedColumn<int>(
    'id_kategori',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namaKategoriMeta = const VerificationMeta(
    'namaKategori',
  );
  @override
  late final GeneratedColumn<String> namaKategori = GeneratedColumn<String>(
    'nama_kategori',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deskripsiMeta = const VerificationMeta(
    'deskripsi',
  );
  @override
  late final GeneratedColumn<String> deskripsi = GeneratedColumn<String>(
    'deskripsi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusRecordMeta = const VerificationMeta(
    'statusRecord',
  );
  @override
  late final GeneratedColumn<String> statusRecord = GeneratedColumn<String>(
    'status_record',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('aktif'),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idKategori,
    namaKategori,
    deskripsi,
    statusRecord,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kategori_barang';
  @override
  VerificationContext validateIntegrity(
    Insertable<KategoriBarangData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_kategori')) {
      context.handle(
        _idKategoriMeta,
        idKategori.isAcceptableOrUnknown(data['id_kategori']!, _idKategoriMeta),
      );
    }
    if (data.containsKey('nama_kategori')) {
      context.handle(
        _namaKategoriMeta,
        namaKategori.isAcceptableOrUnknown(
          data['nama_kategori']!,
          _namaKategoriMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_namaKategoriMeta);
    }
    if (data.containsKey('deskripsi')) {
      context.handle(
        _deskripsiMeta,
        deskripsi.isAcceptableOrUnknown(data['deskripsi']!, _deskripsiMeta),
      );
    }
    if (data.containsKey('status_record')) {
      context.handle(
        _statusRecordMeta,
        statusRecord.isAcceptableOrUnknown(
          data['status_record']!,
          _statusRecordMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idKategori};
  @override
  KategoriBarangData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KategoriBarangData(
      idKategori: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_kategori'],
      )!,
      namaKategori: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_kategori'],
      )!,
      deskripsi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deskripsi'],
      ),
      statusRecord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_record'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $KategoriBarangTable createAlias(String alias) {
    return $KategoriBarangTable(attachedDatabase, alias);
  }
}

class KategoriBarangData extends DataClass
    implements Insertable<KategoriBarangData> {
  final int idKategori;
  final String namaKategori;
  final String? deskripsi;
  final String statusRecord;
  final DateTime createdAt;
  const KategoriBarangData({
    required this.idKategori,
    required this.namaKategori,
    this.deskripsi,
    required this.statusRecord,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_kategori'] = Variable<int>(idKategori);
    map['nama_kategori'] = Variable<String>(namaKategori);
    if (!nullToAbsent || deskripsi != null) {
      map['deskripsi'] = Variable<String>(deskripsi);
    }
    map['status_record'] = Variable<String>(statusRecord);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  KategoriBarangCompanion toCompanion(bool nullToAbsent) {
    return KategoriBarangCompanion(
      idKategori: Value(idKategori),
      namaKategori: Value(namaKategori),
      deskripsi: deskripsi == null && nullToAbsent
          ? const Value.absent()
          : Value(deskripsi),
      statusRecord: Value(statusRecord),
      createdAt: Value(createdAt),
    );
  }

  factory KategoriBarangData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KategoriBarangData(
      idKategori: serializer.fromJson<int>(json['idKategori']),
      namaKategori: serializer.fromJson<String>(json['namaKategori']),
      deskripsi: serializer.fromJson<String?>(json['deskripsi']),
      statusRecord: serializer.fromJson<String>(json['statusRecord']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idKategori': serializer.toJson<int>(idKategori),
      'namaKategori': serializer.toJson<String>(namaKategori),
      'deskripsi': serializer.toJson<String?>(deskripsi),
      'statusRecord': serializer.toJson<String>(statusRecord),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  KategoriBarangData copyWith({
    int? idKategori,
    String? namaKategori,
    Value<String?> deskripsi = const Value.absent(),
    String? statusRecord,
    DateTime? createdAt,
  }) => KategoriBarangData(
    idKategori: idKategori ?? this.idKategori,
    namaKategori: namaKategori ?? this.namaKategori,
    deskripsi: deskripsi.present ? deskripsi.value : this.deskripsi,
    statusRecord: statusRecord ?? this.statusRecord,
    createdAt: createdAt ?? this.createdAt,
  );
  KategoriBarangData copyWithCompanion(KategoriBarangCompanion data) {
    return KategoriBarangData(
      idKategori: data.idKategori.present
          ? data.idKategori.value
          : this.idKategori,
      namaKategori: data.namaKategori.present
          ? data.namaKategori.value
          : this.namaKategori,
      deskripsi: data.deskripsi.present ? data.deskripsi.value : this.deskripsi,
      statusRecord: data.statusRecord.present
          ? data.statusRecord.value
          : this.statusRecord,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KategoriBarangData(')
          ..write('idKategori: $idKategori, ')
          ..write('namaKategori: $namaKategori, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('statusRecord: $statusRecord, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idKategori, namaKategori, deskripsi, statusRecord, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KategoriBarangData &&
          other.idKategori == this.idKategori &&
          other.namaKategori == this.namaKategori &&
          other.deskripsi == this.deskripsi &&
          other.statusRecord == this.statusRecord &&
          other.createdAt == this.createdAt);
}

class KategoriBarangCompanion extends UpdateCompanion<KategoriBarangData> {
  final Value<int> idKategori;
  final Value<String> namaKategori;
  final Value<String?> deskripsi;
  final Value<String> statusRecord;
  final Value<DateTime> createdAt;
  const KategoriBarangCompanion({
    this.idKategori = const Value.absent(),
    this.namaKategori = const Value.absent(),
    this.deskripsi = const Value.absent(),
    this.statusRecord = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  KategoriBarangCompanion.insert({
    this.idKategori = const Value.absent(),
    required String namaKategori,
    this.deskripsi = const Value.absent(),
    this.statusRecord = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : namaKategori = Value(namaKategori);
  static Insertable<KategoriBarangData> custom({
    Expression<int>? idKategori,
    Expression<String>? namaKategori,
    Expression<String>? deskripsi,
    Expression<String>? statusRecord,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (idKategori != null) 'id_kategori': idKategori,
      if (namaKategori != null) 'nama_kategori': namaKategori,
      if (deskripsi != null) 'deskripsi': deskripsi,
      if (statusRecord != null) 'status_record': statusRecord,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  KategoriBarangCompanion copyWith({
    Value<int>? idKategori,
    Value<String>? namaKategori,
    Value<String?>? deskripsi,
    Value<String>? statusRecord,
    Value<DateTime>? createdAt,
  }) {
    return KategoriBarangCompanion(
      idKategori: idKategori ?? this.idKategori,
      namaKategori: namaKategori ?? this.namaKategori,
      deskripsi: deskripsi ?? this.deskripsi,
      statusRecord: statusRecord ?? this.statusRecord,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idKategori.present) {
      map['id_kategori'] = Variable<int>(idKategori.value);
    }
    if (namaKategori.present) {
      map['nama_kategori'] = Variable<String>(namaKategori.value);
    }
    if (deskripsi.present) {
      map['deskripsi'] = Variable<String>(deskripsi.value);
    }
    if (statusRecord.present) {
      map['status_record'] = Variable<String>(statusRecord.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KategoriBarangCompanion(')
          ..write('idKategori: $idKategori, ')
          ..write('namaKategori: $namaKategori, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('statusRecord: $statusRecord, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $BarangTable extends Barang with TableInfo<$BarangTable, BarangData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BarangTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idBarangMeta = const VerificationMeta(
    'idBarang',
  );
  @override
  late final GeneratedColumn<int> idBarang = GeneratedColumn<int>(
    'id_barang',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idKategoriMeta = const VerificationMeta(
    'idKategori',
  );
  @override
  late final GeneratedColumn<int> idKategori = GeneratedColumn<int>(
    'id_kategori',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES kategori_barang (id_kategori)',
    ),
  );
  static const VerificationMeta _idOrganisasiMeta = const VerificationMeta(
    'idOrganisasi',
  );
  @override
  late final GeneratedColumn<int> idOrganisasi = GeneratedColumn<int>(
    'id_organisasi',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES organisasi (id_organisasi)',
    ),
  );
  static const VerificationMeta _namaBarangMeta = const VerificationMeta(
    'namaBarang',
  );
  @override
  late final GeneratedColumn<String> namaBarang = GeneratedColumn<String>(
    'nama_barang',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 150,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deskripsiMeta = const VerificationMeta(
    'deskripsi',
  );
  @override
  late final GeneratedColumn<String> deskripsi = GeneratedColumn<String>(
    'deskripsi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fotoBarangMeta = const VerificationMeta(
    'fotoBarang',
  );
  @override
  late final GeneratedColumn<String> fotoBarang = GeneratedColumn<String>(
    'foto_barang',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stokTotalMeta = const VerificationMeta(
    'stokTotal',
  );
  @override
  late final GeneratedColumn<int> stokTotal = GeneratedColumn<int>(
    'stok_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _stokTersediaMeta = const VerificationMeta(
    'stokTersedia',
  );
  @override
  late final GeneratedColumn<int> stokTersedia = GeneratedColumn<int>(
    'stok_tersedia',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _kondisiMeta = const VerificationMeta(
    'kondisi',
  );
  @override
  late final GeneratedColumn<String> kondisi = GeneratedColumn<String>(
    'kondisi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('baik'),
  );
  static const VerificationMeta _statusRecordMeta = const VerificationMeta(
    'statusRecord',
  );
  @override
  late final GeneratedColumn<String> statusRecord = GeneratedColumn<String>(
    'status_record',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('aktif'),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idBarang,
    idKategori,
    idOrganisasi,
    namaBarang,
    deskripsi,
    fotoBarang,
    stokTotal,
    stokTersedia,
    kondisi,
    statusRecord,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'barang';
  @override
  VerificationContext validateIntegrity(
    Insertable<BarangData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_barang')) {
      context.handle(
        _idBarangMeta,
        idBarang.isAcceptableOrUnknown(data['id_barang']!, _idBarangMeta),
      );
    }
    if (data.containsKey('id_kategori')) {
      context.handle(
        _idKategoriMeta,
        idKategori.isAcceptableOrUnknown(data['id_kategori']!, _idKategoriMeta),
      );
    } else if (isInserting) {
      context.missing(_idKategoriMeta);
    }
    if (data.containsKey('id_organisasi')) {
      context.handle(
        _idOrganisasiMeta,
        idOrganisasi.isAcceptableOrUnknown(
          data['id_organisasi']!,
          _idOrganisasiMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idOrganisasiMeta);
    }
    if (data.containsKey('nama_barang')) {
      context.handle(
        _namaBarangMeta,
        namaBarang.isAcceptableOrUnknown(data['nama_barang']!, _namaBarangMeta),
      );
    } else if (isInserting) {
      context.missing(_namaBarangMeta);
    }
    if (data.containsKey('deskripsi')) {
      context.handle(
        _deskripsiMeta,
        deskripsi.isAcceptableOrUnknown(data['deskripsi']!, _deskripsiMeta),
      );
    }
    if (data.containsKey('foto_barang')) {
      context.handle(
        _fotoBarangMeta,
        fotoBarang.isAcceptableOrUnknown(data['foto_barang']!, _fotoBarangMeta),
      );
    }
    if (data.containsKey('stok_total')) {
      context.handle(
        _stokTotalMeta,
        stokTotal.isAcceptableOrUnknown(data['stok_total']!, _stokTotalMeta),
      );
    }
    if (data.containsKey('stok_tersedia')) {
      context.handle(
        _stokTersediaMeta,
        stokTersedia.isAcceptableOrUnknown(
          data['stok_tersedia']!,
          _stokTersediaMeta,
        ),
      );
    }
    if (data.containsKey('kondisi')) {
      context.handle(
        _kondisiMeta,
        kondisi.isAcceptableOrUnknown(data['kondisi']!, _kondisiMeta),
      );
    }
    if (data.containsKey('status_record')) {
      context.handle(
        _statusRecordMeta,
        statusRecord.isAcceptableOrUnknown(
          data['status_record']!,
          _statusRecordMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idBarang};
  @override
  BarangData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BarangData(
      idBarang: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_barang'],
      )!,
      idKategori: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_kategori'],
      )!,
      idOrganisasi: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_organisasi'],
      )!,
      namaBarang: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_barang'],
      )!,
      deskripsi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deskripsi'],
      ),
      fotoBarang: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}foto_barang'],
      ),
      stokTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stok_total'],
      )!,
      stokTersedia: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stok_tersedia'],
      )!,
      kondisi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kondisi'],
      )!,
      statusRecord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_record'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BarangTable createAlias(String alias) {
    return $BarangTable(attachedDatabase, alias);
  }
}

class BarangData extends DataClass implements Insertable<BarangData> {
  final int idBarang;
  final int idKategori;
  final int idOrganisasi;
  final String namaBarang;
  final String? deskripsi;
  final String? fotoBarang;
  final int stokTotal;
  final int stokTersedia;
  final String kondisi;
  final String statusRecord;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BarangData({
    required this.idBarang,
    required this.idKategori,
    required this.idOrganisasi,
    required this.namaBarang,
    this.deskripsi,
    this.fotoBarang,
    required this.stokTotal,
    required this.stokTersedia,
    required this.kondisi,
    required this.statusRecord,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_barang'] = Variable<int>(idBarang);
    map['id_kategori'] = Variable<int>(idKategori);
    map['id_organisasi'] = Variable<int>(idOrganisasi);
    map['nama_barang'] = Variable<String>(namaBarang);
    if (!nullToAbsent || deskripsi != null) {
      map['deskripsi'] = Variable<String>(deskripsi);
    }
    if (!nullToAbsent || fotoBarang != null) {
      map['foto_barang'] = Variable<String>(fotoBarang);
    }
    map['stok_total'] = Variable<int>(stokTotal);
    map['stok_tersedia'] = Variable<int>(stokTersedia);
    map['kondisi'] = Variable<String>(kondisi);
    map['status_record'] = Variable<String>(statusRecord);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BarangCompanion toCompanion(bool nullToAbsent) {
    return BarangCompanion(
      idBarang: Value(idBarang),
      idKategori: Value(idKategori),
      idOrganisasi: Value(idOrganisasi),
      namaBarang: Value(namaBarang),
      deskripsi: deskripsi == null && nullToAbsent
          ? const Value.absent()
          : Value(deskripsi),
      fotoBarang: fotoBarang == null && nullToAbsent
          ? const Value.absent()
          : Value(fotoBarang),
      stokTotal: Value(stokTotal),
      stokTersedia: Value(stokTersedia),
      kondisi: Value(kondisi),
      statusRecord: Value(statusRecord),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BarangData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BarangData(
      idBarang: serializer.fromJson<int>(json['idBarang']),
      idKategori: serializer.fromJson<int>(json['idKategori']),
      idOrganisasi: serializer.fromJson<int>(json['idOrganisasi']),
      namaBarang: serializer.fromJson<String>(json['namaBarang']),
      deskripsi: serializer.fromJson<String?>(json['deskripsi']),
      fotoBarang: serializer.fromJson<String?>(json['fotoBarang']),
      stokTotal: serializer.fromJson<int>(json['stokTotal']),
      stokTersedia: serializer.fromJson<int>(json['stokTersedia']),
      kondisi: serializer.fromJson<String>(json['kondisi']),
      statusRecord: serializer.fromJson<String>(json['statusRecord']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idBarang': serializer.toJson<int>(idBarang),
      'idKategori': serializer.toJson<int>(idKategori),
      'idOrganisasi': serializer.toJson<int>(idOrganisasi),
      'namaBarang': serializer.toJson<String>(namaBarang),
      'deskripsi': serializer.toJson<String?>(deskripsi),
      'fotoBarang': serializer.toJson<String?>(fotoBarang),
      'stokTotal': serializer.toJson<int>(stokTotal),
      'stokTersedia': serializer.toJson<int>(stokTersedia),
      'kondisi': serializer.toJson<String>(kondisi),
      'statusRecord': serializer.toJson<String>(statusRecord),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BarangData copyWith({
    int? idBarang,
    int? idKategori,
    int? idOrganisasi,
    String? namaBarang,
    Value<String?> deskripsi = const Value.absent(),
    Value<String?> fotoBarang = const Value.absent(),
    int? stokTotal,
    int? stokTersedia,
    String? kondisi,
    String? statusRecord,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => BarangData(
    idBarang: idBarang ?? this.idBarang,
    idKategori: idKategori ?? this.idKategori,
    idOrganisasi: idOrganisasi ?? this.idOrganisasi,
    namaBarang: namaBarang ?? this.namaBarang,
    deskripsi: deskripsi.present ? deskripsi.value : this.deskripsi,
    fotoBarang: fotoBarang.present ? fotoBarang.value : this.fotoBarang,
    stokTotal: stokTotal ?? this.stokTotal,
    stokTersedia: stokTersedia ?? this.stokTersedia,
    kondisi: kondisi ?? this.kondisi,
    statusRecord: statusRecord ?? this.statusRecord,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BarangData copyWithCompanion(BarangCompanion data) {
    return BarangData(
      idBarang: data.idBarang.present ? data.idBarang.value : this.idBarang,
      idKategori: data.idKategori.present
          ? data.idKategori.value
          : this.idKategori,
      idOrganisasi: data.idOrganisasi.present
          ? data.idOrganisasi.value
          : this.idOrganisasi,
      namaBarang: data.namaBarang.present
          ? data.namaBarang.value
          : this.namaBarang,
      deskripsi: data.deskripsi.present ? data.deskripsi.value : this.deskripsi,
      fotoBarang: data.fotoBarang.present
          ? data.fotoBarang.value
          : this.fotoBarang,
      stokTotal: data.stokTotal.present ? data.stokTotal.value : this.stokTotal,
      stokTersedia: data.stokTersedia.present
          ? data.stokTersedia.value
          : this.stokTersedia,
      kondisi: data.kondisi.present ? data.kondisi.value : this.kondisi,
      statusRecord: data.statusRecord.present
          ? data.statusRecord.value
          : this.statusRecord,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BarangData(')
          ..write('idBarang: $idBarang, ')
          ..write('idKategori: $idKategori, ')
          ..write('idOrganisasi: $idOrganisasi, ')
          ..write('namaBarang: $namaBarang, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('fotoBarang: $fotoBarang, ')
          ..write('stokTotal: $stokTotal, ')
          ..write('stokTersedia: $stokTersedia, ')
          ..write('kondisi: $kondisi, ')
          ..write('statusRecord: $statusRecord, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idBarang,
    idKategori,
    idOrganisasi,
    namaBarang,
    deskripsi,
    fotoBarang,
    stokTotal,
    stokTersedia,
    kondisi,
    statusRecord,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BarangData &&
          other.idBarang == this.idBarang &&
          other.idKategori == this.idKategori &&
          other.idOrganisasi == this.idOrganisasi &&
          other.namaBarang == this.namaBarang &&
          other.deskripsi == this.deskripsi &&
          other.fotoBarang == this.fotoBarang &&
          other.stokTotal == this.stokTotal &&
          other.stokTersedia == this.stokTersedia &&
          other.kondisi == this.kondisi &&
          other.statusRecord == this.statusRecord &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BarangCompanion extends UpdateCompanion<BarangData> {
  final Value<int> idBarang;
  final Value<int> idKategori;
  final Value<int> idOrganisasi;
  final Value<String> namaBarang;
  final Value<String?> deskripsi;
  final Value<String?> fotoBarang;
  final Value<int> stokTotal;
  final Value<int> stokTersedia;
  final Value<String> kondisi;
  final Value<String> statusRecord;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BarangCompanion({
    this.idBarang = const Value.absent(),
    this.idKategori = const Value.absent(),
    this.idOrganisasi = const Value.absent(),
    this.namaBarang = const Value.absent(),
    this.deskripsi = const Value.absent(),
    this.fotoBarang = const Value.absent(),
    this.stokTotal = const Value.absent(),
    this.stokTersedia = const Value.absent(),
    this.kondisi = const Value.absent(),
    this.statusRecord = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BarangCompanion.insert({
    this.idBarang = const Value.absent(),
    required int idKategori,
    required int idOrganisasi,
    required String namaBarang,
    this.deskripsi = const Value.absent(),
    this.fotoBarang = const Value.absent(),
    this.stokTotal = const Value.absent(),
    this.stokTersedia = const Value.absent(),
    this.kondisi = const Value.absent(),
    this.statusRecord = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : idKategori = Value(idKategori),
       idOrganisasi = Value(idOrganisasi),
       namaBarang = Value(namaBarang);
  static Insertable<BarangData> custom({
    Expression<int>? idBarang,
    Expression<int>? idKategori,
    Expression<int>? idOrganisasi,
    Expression<String>? namaBarang,
    Expression<String>? deskripsi,
    Expression<String>? fotoBarang,
    Expression<int>? stokTotal,
    Expression<int>? stokTersedia,
    Expression<String>? kondisi,
    Expression<String>? statusRecord,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (idBarang != null) 'id_barang': idBarang,
      if (idKategori != null) 'id_kategori': idKategori,
      if (idOrganisasi != null) 'id_organisasi': idOrganisasi,
      if (namaBarang != null) 'nama_barang': namaBarang,
      if (deskripsi != null) 'deskripsi': deskripsi,
      if (fotoBarang != null) 'foto_barang': fotoBarang,
      if (stokTotal != null) 'stok_total': stokTotal,
      if (stokTersedia != null) 'stok_tersedia': stokTersedia,
      if (kondisi != null) 'kondisi': kondisi,
      if (statusRecord != null) 'status_record': statusRecord,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BarangCompanion copyWith({
    Value<int>? idBarang,
    Value<int>? idKategori,
    Value<int>? idOrganisasi,
    Value<String>? namaBarang,
    Value<String?>? deskripsi,
    Value<String?>? fotoBarang,
    Value<int>? stokTotal,
    Value<int>? stokTersedia,
    Value<String>? kondisi,
    Value<String>? statusRecord,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return BarangCompanion(
      idBarang: idBarang ?? this.idBarang,
      idKategori: idKategori ?? this.idKategori,
      idOrganisasi: idOrganisasi ?? this.idOrganisasi,
      namaBarang: namaBarang ?? this.namaBarang,
      deskripsi: deskripsi ?? this.deskripsi,
      fotoBarang: fotoBarang ?? this.fotoBarang,
      stokTotal: stokTotal ?? this.stokTotal,
      stokTersedia: stokTersedia ?? this.stokTersedia,
      kondisi: kondisi ?? this.kondisi,
      statusRecord: statusRecord ?? this.statusRecord,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idBarang.present) {
      map['id_barang'] = Variable<int>(idBarang.value);
    }
    if (idKategori.present) {
      map['id_kategori'] = Variable<int>(idKategori.value);
    }
    if (idOrganisasi.present) {
      map['id_organisasi'] = Variable<int>(idOrganisasi.value);
    }
    if (namaBarang.present) {
      map['nama_barang'] = Variable<String>(namaBarang.value);
    }
    if (deskripsi.present) {
      map['deskripsi'] = Variable<String>(deskripsi.value);
    }
    if (fotoBarang.present) {
      map['foto_barang'] = Variable<String>(fotoBarang.value);
    }
    if (stokTotal.present) {
      map['stok_total'] = Variable<int>(stokTotal.value);
    }
    if (stokTersedia.present) {
      map['stok_tersedia'] = Variable<int>(stokTersedia.value);
    }
    if (kondisi.present) {
      map['kondisi'] = Variable<String>(kondisi.value);
    }
    if (statusRecord.present) {
      map['status_record'] = Variable<String>(statusRecord.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BarangCompanion(')
          ..write('idBarang: $idBarang, ')
          ..write('idKategori: $idKategori, ')
          ..write('idOrganisasi: $idOrganisasi, ')
          ..write('namaBarang: $namaBarang, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('fotoBarang: $fotoBarang, ')
          ..write('stokTotal: $stokTotal, ')
          ..write('stokTersedia: $stokTersedia, ')
          ..write('kondisi: $kondisi, ')
          ..write('statusRecord: $statusRecord, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $HargaSewaTable extends HargaSewa
    with TableInfo<$HargaSewaTable, HargaSewaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HargaSewaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idHargaMeta = const VerificationMeta(
    'idHarga',
  );
  @override
  late final GeneratedColumn<int> idHarga = GeneratedColumn<int>(
    'id_harga',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idBarangMeta = const VerificationMeta(
    'idBarang',
  );
  @override
  late final GeneratedColumn<int> idBarang = GeneratedColumn<int>(
    'id_barang',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES barang (id_barang)',
    ),
  );
  static const VerificationMeta _idLevelMeta = const VerificationMeta(
    'idLevel',
  );
  @override
  late final GeneratedColumn<int> idLevel = GeneratedColumn<int>(
    'id_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES level (id_level)',
    ),
  );
  static const VerificationMeta _hargaPerHariMeta = const VerificationMeta(
    'hargaPerHari',
  );
  @override
  late final GeneratedColumn<double> hargaPerHari = GeneratedColumn<double>(
    'harga_per_hari',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _diskonMeta = const VerificationMeta('diskon');
  @override
  late final GeneratedColumn<double> diskon = GeneratedColumn<double>(
    'diskon',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _tanggalBerlakuMeta = const VerificationMeta(
    'tanggalBerlaku',
  );
  @override
  late final GeneratedColumn<DateTime> tanggalBerlaku =
      GeneratedColumn<DateTime>(
        'tanggal_berlaku',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _statusRecordMeta = const VerificationMeta(
    'statusRecord',
  );
  @override
  late final GeneratedColumn<String> statusRecord = GeneratedColumn<String>(
    'status_record',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('aktif'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idHarga,
    idBarang,
    idLevel,
    hargaPerHari,
    diskon,
    tanggalBerlaku,
    statusRecord,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'harga_sewa';
  @override
  VerificationContext validateIntegrity(
    Insertable<HargaSewaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_harga')) {
      context.handle(
        _idHargaMeta,
        idHarga.isAcceptableOrUnknown(data['id_harga']!, _idHargaMeta),
      );
    }
    if (data.containsKey('id_barang')) {
      context.handle(
        _idBarangMeta,
        idBarang.isAcceptableOrUnknown(data['id_barang']!, _idBarangMeta),
      );
    } else if (isInserting) {
      context.missing(_idBarangMeta);
    }
    if (data.containsKey('id_level')) {
      context.handle(
        _idLevelMeta,
        idLevel.isAcceptableOrUnknown(data['id_level']!, _idLevelMeta),
      );
    } else if (isInserting) {
      context.missing(_idLevelMeta);
    }
    if (data.containsKey('harga_per_hari')) {
      context.handle(
        _hargaPerHariMeta,
        hargaPerHari.isAcceptableOrUnknown(
          data['harga_per_hari']!,
          _hargaPerHariMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hargaPerHariMeta);
    }
    if (data.containsKey('diskon')) {
      context.handle(
        _diskonMeta,
        diskon.isAcceptableOrUnknown(data['diskon']!, _diskonMeta),
      );
    }
    if (data.containsKey('tanggal_berlaku')) {
      context.handle(
        _tanggalBerlakuMeta,
        tanggalBerlaku.isAcceptableOrUnknown(
          data['tanggal_berlaku']!,
          _tanggalBerlakuMeta,
        ),
      );
    }
    if (data.containsKey('status_record')) {
      context.handle(
        _statusRecordMeta,
        statusRecord.isAcceptableOrUnknown(
          data['status_record']!,
          _statusRecordMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idHarga};
  @override
  HargaSewaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HargaSewaData(
      idHarga: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_harga'],
      )!,
      idBarang: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_barang'],
      )!,
      idLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_level'],
      )!,
      hargaPerHari: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}harga_per_hari'],
      )!,
      diskon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}diskon'],
      )!,
      tanggalBerlaku: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}tanggal_berlaku'],
      )!,
      statusRecord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_record'],
      )!,
    );
  }

  @override
  $HargaSewaTable createAlias(String alias) {
    return $HargaSewaTable(attachedDatabase, alias);
  }
}

class HargaSewaData extends DataClass implements Insertable<HargaSewaData> {
  final int idHarga;
  final int idBarang;
  final int idLevel;
  final double hargaPerHari;
  final double diskon;
  final DateTime tanggalBerlaku;
  final String statusRecord;
  const HargaSewaData({
    required this.idHarga,
    required this.idBarang,
    required this.idLevel,
    required this.hargaPerHari,
    required this.diskon,
    required this.tanggalBerlaku,
    required this.statusRecord,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_harga'] = Variable<int>(idHarga);
    map['id_barang'] = Variable<int>(idBarang);
    map['id_level'] = Variable<int>(idLevel);
    map['harga_per_hari'] = Variable<double>(hargaPerHari);
    map['diskon'] = Variable<double>(diskon);
    map['tanggal_berlaku'] = Variable<DateTime>(tanggalBerlaku);
    map['status_record'] = Variable<String>(statusRecord);
    return map;
  }

  HargaSewaCompanion toCompanion(bool nullToAbsent) {
    return HargaSewaCompanion(
      idHarga: Value(idHarga),
      idBarang: Value(idBarang),
      idLevel: Value(idLevel),
      hargaPerHari: Value(hargaPerHari),
      diskon: Value(diskon),
      tanggalBerlaku: Value(tanggalBerlaku),
      statusRecord: Value(statusRecord),
    );
  }

  factory HargaSewaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HargaSewaData(
      idHarga: serializer.fromJson<int>(json['idHarga']),
      idBarang: serializer.fromJson<int>(json['idBarang']),
      idLevel: serializer.fromJson<int>(json['idLevel']),
      hargaPerHari: serializer.fromJson<double>(json['hargaPerHari']),
      diskon: serializer.fromJson<double>(json['diskon']),
      tanggalBerlaku: serializer.fromJson<DateTime>(json['tanggalBerlaku']),
      statusRecord: serializer.fromJson<String>(json['statusRecord']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idHarga': serializer.toJson<int>(idHarga),
      'idBarang': serializer.toJson<int>(idBarang),
      'idLevel': serializer.toJson<int>(idLevel),
      'hargaPerHari': serializer.toJson<double>(hargaPerHari),
      'diskon': serializer.toJson<double>(diskon),
      'tanggalBerlaku': serializer.toJson<DateTime>(tanggalBerlaku),
      'statusRecord': serializer.toJson<String>(statusRecord),
    };
  }

  HargaSewaData copyWith({
    int? idHarga,
    int? idBarang,
    int? idLevel,
    double? hargaPerHari,
    double? diskon,
    DateTime? tanggalBerlaku,
    String? statusRecord,
  }) => HargaSewaData(
    idHarga: idHarga ?? this.idHarga,
    idBarang: idBarang ?? this.idBarang,
    idLevel: idLevel ?? this.idLevel,
    hargaPerHari: hargaPerHari ?? this.hargaPerHari,
    diskon: diskon ?? this.diskon,
    tanggalBerlaku: tanggalBerlaku ?? this.tanggalBerlaku,
    statusRecord: statusRecord ?? this.statusRecord,
  );
  HargaSewaData copyWithCompanion(HargaSewaCompanion data) {
    return HargaSewaData(
      idHarga: data.idHarga.present ? data.idHarga.value : this.idHarga,
      idBarang: data.idBarang.present ? data.idBarang.value : this.idBarang,
      idLevel: data.idLevel.present ? data.idLevel.value : this.idLevel,
      hargaPerHari: data.hargaPerHari.present
          ? data.hargaPerHari.value
          : this.hargaPerHari,
      diskon: data.diskon.present ? data.diskon.value : this.diskon,
      tanggalBerlaku: data.tanggalBerlaku.present
          ? data.tanggalBerlaku.value
          : this.tanggalBerlaku,
      statusRecord: data.statusRecord.present
          ? data.statusRecord.value
          : this.statusRecord,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HargaSewaData(')
          ..write('idHarga: $idHarga, ')
          ..write('idBarang: $idBarang, ')
          ..write('idLevel: $idLevel, ')
          ..write('hargaPerHari: $hargaPerHari, ')
          ..write('diskon: $diskon, ')
          ..write('tanggalBerlaku: $tanggalBerlaku, ')
          ..write('statusRecord: $statusRecord')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idHarga,
    idBarang,
    idLevel,
    hargaPerHari,
    diskon,
    tanggalBerlaku,
    statusRecord,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HargaSewaData &&
          other.idHarga == this.idHarga &&
          other.idBarang == this.idBarang &&
          other.idLevel == this.idLevel &&
          other.hargaPerHari == this.hargaPerHari &&
          other.diskon == this.diskon &&
          other.tanggalBerlaku == this.tanggalBerlaku &&
          other.statusRecord == this.statusRecord);
}

class HargaSewaCompanion extends UpdateCompanion<HargaSewaData> {
  final Value<int> idHarga;
  final Value<int> idBarang;
  final Value<int> idLevel;
  final Value<double> hargaPerHari;
  final Value<double> diskon;
  final Value<DateTime> tanggalBerlaku;
  final Value<String> statusRecord;
  const HargaSewaCompanion({
    this.idHarga = const Value.absent(),
    this.idBarang = const Value.absent(),
    this.idLevel = const Value.absent(),
    this.hargaPerHari = const Value.absent(),
    this.diskon = const Value.absent(),
    this.tanggalBerlaku = const Value.absent(),
    this.statusRecord = const Value.absent(),
  });
  HargaSewaCompanion.insert({
    this.idHarga = const Value.absent(),
    required int idBarang,
    required int idLevel,
    required double hargaPerHari,
    this.diskon = const Value.absent(),
    this.tanggalBerlaku = const Value.absent(),
    this.statusRecord = const Value.absent(),
  }) : idBarang = Value(idBarang),
       idLevel = Value(idLevel),
       hargaPerHari = Value(hargaPerHari);
  static Insertable<HargaSewaData> custom({
    Expression<int>? idHarga,
    Expression<int>? idBarang,
    Expression<int>? idLevel,
    Expression<double>? hargaPerHari,
    Expression<double>? diskon,
    Expression<DateTime>? tanggalBerlaku,
    Expression<String>? statusRecord,
  }) {
    return RawValuesInsertable({
      if (idHarga != null) 'id_harga': idHarga,
      if (idBarang != null) 'id_barang': idBarang,
      if (idLevel != null) 'id_level': idLevel,
      if (hargaPerHari != null) 'harga_per_hari': hargaPerHari,
      if (diskon != null) 'diskon': diskon,
      if (tanggalBerlaku != null) 'tanggal_berlaku': tanggalBerlaku,
      if (statusRecord != null) 'status_record': statusRecord,
    });
  }

  HargaSewaCompanion copyWith({
    Value<int>? idHarga,
    Value<int>? idBarang,
    Value<int>? idLevel,
    Value<double>? hargaPerHari,
    Value<double>? diskon,
    Value<DateTime>? tanggalBerlaku,
    Value<String>? statusRecord,
  }) {
    return HargaSewaCompanion(
      idHarga: idHarga ?? this.idHarga,
      idBarang: idBarang ?? this.idBarang,
      idLevel: idLevel ?? this.idLevel,
      hargaPerHari: hargaPerHari ?? this.hargaPerHari,
      diskon: diskon ?? this.diskon,
      tanggalBerlaku: tanggalBerlaku ?? this.tanggalBerlaku,
      statusRecord: statusRecord ?? this.statusRecord,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idHarga.present) {
      map['id_harga'] = Variable<int>(idHarga.value);
    }
    if (idBarang.present) {
      map['id_barang'] = Variable<int>(idBarang.value);
    }
    if (idLevel.present) {
      map['id_level'] = Variable<int>(idLevel.value);
    }
    if (hargaPerHari.present) {
      map['harga_per_hari'] = Variable<double>(hargaPerHari.value);
    }
    if (diskon.present) {
      map['diskon'] = Variable<double>(diskon.value);
    }
    if (tanggalBerlaku.present) {
      map['tanggal_berlaku'] = Variable<DateTime>(tanggalBerlaku.value);
    }
    if (statusRecord.present) {
      map['status_record'] = Variable<String>(statusRecord.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HargaSewaCompanion(')
          ..write('idHarga: $idHarga, ')
          ..write('idBarang: $idBarang, ')
          ..write('idLevel: $idLevel, ')
          ..write('hargaPerHari: $hargaPerHari, ')
          ..write('diskon: $diskon, ')
          ..write('tanggalBerlaku: $tanggalBerlaku, ')
          ..write('statusRecord: $statusRecord')
          ..write(')'))
        .toString();
  }
}

class $PeminjamTable extends Peminjam
    with TableInfo<$PeminjamTable, PeminjamData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PeminjamTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPeminjamMeta = const VerificationMeta(
    'idPeminjam',
  );
  @override
  late final GeneratedColumn<int> idPeminjam = GeneratedColumn<int>(
    'id_peminjam',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  @override
  late final GeneratedColumn<int> idUser = GeneratedColumn<int>(
    'id_user',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id_user)',
    ),
  );
  static const VerificationMeta _nimMeta = const VerificationMeta('nim');
  @override
  late final GeneratedColumn<String> nim = GeneratedColumn<String>(
    'nim',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kelasMeta = const VerificationMeta('kelas');
  @override
  late final GeneratedColumn<String> kelas = GeneratedColumn<String>(
    'kelas',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fakultasMeta = const VerificationMeta(
    'fakultas',
  );
  @override
  late final GeneratedColumn<String> fakultas = GeneratedColumn<String>(
    'fakultas',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jurusanMeta = const VerificationMeta(
    'jurusan',
  );
  @override
  late final GeneratedColumn<String> jurusan = GeneratedColumn<String>(
    'jurusan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kontakMeta = const VerificationMeta('kontak');
  @override
  late final GeneratedColumn<String> kontak = GeneratedColumn<String>(
    'kontak',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _alamatMeta = const VerificationMeta('alamat');
  @override
  late final GeneratedColumn<String> alamat = GeneratedColumn<String>(
    'alamat',
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
    defaultValue: const Constant('aktif'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idPeminjam,
    idUser,
    nim,
    kelas,
    fakultas,
    jurusan,
    kontak,
    email,
    alamat,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'peminjam';
  @override
  VerificationContext validateIntegrity(
    Insertable<PeminjamData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_peminjam')) {
      context.handle(
        _idPeminjamMeta,
        idPeminjam.isAcceptableOrUnknown(data['id_peminjam']!, _idPeminjamMeta),
      );
    }
    if (data.containsKey('id_user')) {
      context.handle(
        _idUserMeta,
        idUser.isAcceptableOrUnknown(data['id_user']!, _idUserMeta),
      );
    } else if (isInserting) {
      context.missing(_idUserMeta);
    }
    if (data.containsKey('nim')) {
      context.handle(
        _nimMeta,
        nim.isAcceptableOrUnknown(data['nim']!, _nimMeta),
      );
    }
    if (data.containsKey('kelas')) {
      context.handle(
        _kelasMeta,
        kelas.isAcceptableOrUnknown(data['kelas']!, _kelasMeta),
      );
    }
    if (data.containsKey('fakultas')) {
      context.handle(
        _fakultasMeta,
        fakultas.isAcceptableOrUnknown(data['fakultas']!, _fakultasMeta),
      );
    }
    if (data.containsKey('jurusan')) {
      context.handle(
        _jurusanMeta,
        jurusan.isAcceptableOrUnknown(data['jurusan']!, _jurusanMeta),
      );
    }
    if (data.containsKey('kontak')) {
      context.handle(
        _kontakMeta,
        kontak.isAcceptableOrUnknown(data['kontak']!, _kontakMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('alamat')) {
      context.handle(
        _alamatMeta,
        alamat.isAcceptableOrUnknown(data['alamat']!, _alamatMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPeminjam};
  @override
  PeminjamData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PeminjamData(
      idPeminjam: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_peminjam'],
      )!,
      idUser: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_user'],
      )!,
      nim: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nim'],
      ),
      kelas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kelas'],
      ),
      fakultas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fakultas'],
      ),
      jurusan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jurusan'],
      ),
      kontak: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kontak'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      alamat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alamat'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $PeminjamTable createAlias(String alias) {
    return $PeminjamTable(attachedDatabase, alias);
  }
}

class PeminjamData extends DataClass implements Insertable<PeminjamData> {
  final int idPeminjam;
  final int idUser;
  final String? nim;
  final String? kelas;
  final String? fakultas;
  final String? jurusan;
  final String? kontak;
  final String? email;
  final String? alamat;
  final String status;
  const PeminjamData({
    required this.idPeminjam,
    required this.idUser,
    this.nim,
    this.kelas,
    this.fakultas,
    this.jurusan,
    this.kontak,
    this.email,
    this.alamat,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_peminjam'] = Variable<int>(idPeminjam);
    map['id_user'] = Variable<int>(idUser);
    if (!nullToAbsent || nim != null) {
      map['nim'] = Variable<String>(nim);
    }
    if (!nullToAbsent || kelas != null) {
      map['kelas'] = Variable<String>(kelas);
    }
    if (!nullToAbsent || fakultas != null) {
      map['fakultas'] = Variable<String>(fakultas);
    }
    if (!nullToAbsent || jurusan != null) {
      map['jurusan'] = Variable<String>(jurusan);
    }
    if (!nullToAbsent || kontak != null) {
      map['kontak'] = Variable<String>(kontak);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || alamat != null) {
      map['alamat'] = Variable<String>(alamat);
    }
    map['status'] = Variable<String>(status);
    return map;
  }

  PeminjamCompanion toCompanion(bool nullToAbsent) {
    return PeminjamCompanion(
      idPeminjam: Value(idPeminjam),
      idUser: Value(idUser),
      nim: nim == null && nullToAbsent ? const Value.absent() : Value(nim),
      kelas: kelas == null && nullToAbsent
          ? const Value.absent()
          : Value(kelas),
      fakultas: fakultas == null && nullToAbsent
          ? const Value.absent()
          : Value(fakultas),
      jurusan: jurusan == null && nullToAbsent
          ? const Value.absent()
          : Value(jurusan),
      kontak: kontak == null && nullToAbsent
          ? const Value.absent()
          : Value(kontak),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      alamat: alamat == null && nullToAbsent
          ? const Value.absent()
          : Value(alamat),
      status: Value(status),
    );
  }

  factory PeminjamData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PeminjamData(
      idPeminjam: serializer.fromJson<int>(json['idPeminjam']),
      idUser: serializer.fromJson<int>(json['idUser']),
      nim: serializer.fromJson<String?>(json['nim']),
      kelas: serializer.fromJson<String?>(json['kelas']),
      fakultas: serializer.fromJson<String?>(json['fakultas']),
      jurusan: serializer.fromJson<String?>(json['jurusan']),
      kontak: serializer.fromJson<String?>(json['kontak']),
      email: serializer.fromJson<String?>(json['email']),
      alamat: serializer.fromJson<String?>(json['alamat']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPeminjam': serializer.toJson<int>(idPeminjam),
      'idUser': serializer.toJson<int>(idUser),
      'nim': serializer.toJson<String?>(nim),
      'kelas': serializer.toJson<String?>(kelas),
      'fakultas': serializer.toJson<String?>(fakultas),
      'jurusan': serializer.toJson<String?>(jurusan),
      'kontak': serializer.toJson<String?>(kontak),
      'email': serializer.toJson<String?>(email),
      'alamat': serializer.toJson<String?>(alamat),
      'status': serializer.toJson<String>(status),
    };
  }

  PeminjamData copyWith({
    int? idPeminjam,
    int? idUser,
    Value<String?> nim = const Value.absent(),
    Value<String?> kelas = const Value.absent(),
    Value<String?> fakultas = const Value.absent(),
    Value<String?> jurusan = const Value.absent(),
    Value<String?> kontak = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> alamat = const Value.absent(),
    String? status,
  }) => PeminjamData(
    idPeminjam: idPeminjam ?? this.idPeminjam,
    idUser: idUser ?? this.idUser,
    nim: nim.present ? nim.value : this.nim,
    kelas: kelas.present ? kelas.value : this.kelas,
    fakultas: fakultas.present ? fakultas.value : this.fakultas,
    jurusan: jurusan.present ? jurusan.value : this.jurusan,
    kontak: kontak.present ? kontak.value : this.kontak,
    email: email.present ? email.value : this.email,
    alamat: alamat.present ? alamat.value : this.alamat,
    status: status ?? this.status,
  );
  PeminjamData copyWithCompanion(PeminjamCompanion data) {
    return PeminjamData(
      idPeminjam: data.idPeminjam.present
          ? data.idPeminjam.value
          : this.idPeminjam,
      idUser: data.idUser.present ? data.idUser.value : this.idUser,
      nim: data.nim.present ? data.nim.value : this.nim,
      kelas: data.kelas.present ? data.kelas.value : this.kelas,
      fakultas: data.fakultas.present ? data.fakultas.value : this.fakultas,
      jurusan: data.jurusan.present ? data.jurusan.value : this.jurusan,
      kontak: data.kontak.present ? data.kontak.value : this.kontak,
      email: data.email.present ? data.email.value : this.email,
      alamat: data.alamat.present ? data.alamat.value : this.alamat,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PeminjamData(')
          ..write('idPeminjam: $idPeminjam, ')
          ..write('idUser: $idUser, ')
          ..write('nim: $nim, ')
          ..write('kelas: $kelas, ')
          ..write('fakultas: $fakultas, ')
          ..write('jurusan: $jurusan, ')
          ..write('kontak: $kontak, ')
          ..write('email: $email, ')
          ..write('alamat: $alamat, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idPeminjam,
    idUser,
    nim,
    kelas,
    fakultas,
    jurusan,
    kontak,
    email,
    alamat,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PeminjamData &&
          other.idPeminjam == this.idPeminjam &&
          other.idUser == this.idUser &&
          other.nim == this.nim &&
          other.kelas == this.kelas &&
          other.fakultas == this.fakultas &&
          other.jurusan == this.jurusan &&
          other.kontak == this.kontak &&
          other.email == this.email &&
          other.alamat == this.alamat &&
          other.status == this.status);
}

class PeminjamCompanion extends UpdateCompanion<PeminjamData> {
  final Value<int> idPeminjam;
  final Value<int> idUser;
  final Value<String?> nim;
  final Value<String?> kelas;
  final Value<String?> fakultas;
  final Value<String?> jurusan;
  final Value<String?> kontak;
  final Value<String?> email;
  final Value<String?> alamat;
  final Value<String> status;
  const PeminjamCompanion({
    this.idPeminjam = const Value.absent(),
    this.idUser = const Value.absent(),
    this.nim = const Value.absent(),
    this.kelas = const Value.absent(),
    this.fakultas = const Value.absent(),
    this.jurusan = const Value.absent(),
    this.kontak = const Value.absent(),
    this.email = const Value.absent(),
    this.alamat = const Value.absent(),
    this.status = const Value.absent(),
  });
  PeminjamCompanion.insert({
    this.idPeminjam = const Value.absent(),
    required int idUser,
    this.nim = const Value.absent(),
    this.kelas = const Value.absent(),
    this.fakultas = const Value.absent(),
    this.jurusan = const Value.absent(),
    this.kontak = const Value.absent(),
    this.email = const Value.absent(),
    this.alamat = const Value.absent(),
    this.status = const Value.absent(),
  }) : idUser = Value(idUser);
  static Insertable<PeminjamData> custom({
    Expression<int>? idPeminjam,
    Expression<int>? idUser,
    Expression<String>? nim,
    Expression<String>? kelas,
    Expression<String>? fakultas,
    Expression<String>? jurusan,
    Expression<String>? kontak,
    Expression<String>? email,
    Expression<String>? alamat,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (idPeminjam != null) 'id_peminjam': idPeminjam,
      if (idUser != null) 'id_user': idUser,
      if (nim != null) 'nim': nim,
      if (kelas != null) 'kelas': kelas,
      if (fakultas != null) 'fakultas': fakultas,
      if (jurusan != null) 'jurusan': jurusan,
      if (kontak != null) 'kontak': kontak,
      if (email != null) 'email': email,
      if (alamat != null) 'alamat': alamat,
      if (status != null) 'status': status,
    });
  }

  PeminjamCompanion copyWith({
    Value<int>? idPeminjam,
    Value<int>? idUser,
    Value<String?>? nim,
    Value<String?>? kelas,
    Value<String?>? fakultas,
    Value<String?>? jurusan,
    Value<String?>? kontak,
    Value<String?>? email,
    Value<String?>? alamat,
    Value<String>? status,
  }) {
    return PeminjamCompanion(
      idPeminjam: idPeminjam ?? this.idPeminjam,
      idUser: idUser ?? this.idUser,
      nim: nim ?? this.nim,
      kelas: kelas ?? this.kelas,
      fakultas: fakultas ?? this.fakultas,
      jurusan: jurusan ?? this.jurusan,
      kontak: kontak ?? this.kontak,
      email: email ?? this.email,
      alamat: alamat ?? this.alamat,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPeminjam.present) {
      map['id_peminjam'] = Variable<int>(idPeminjam.value);
    }
    if (idUser.present) {
      map['id_user'] = Variable<int>(idUser.value);
    }
    if (nim.present) {
      map['nim'] = Variable<String>(nim.value);
    }
    if (kelas.present) {
      map['kelas'] = Variable<String>(kelas.value);
    }
    if (fakultas.present) {
      map['fakultas'] = Variable<String>(fakultas.value);
    }
    if (jurusan.present) {
      map['jurusan'] = Variable<String>(jurusan.value);
    }
    if (kontak.present) {
      map['kontak'] = Variable<String>(kontak.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (alamat.present) {
      map['alamat'] = Variable<String>(alamat.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PeminjamCompanion(')
          ..write('idPeminjam: $idPeminjam, ')
          ..write('idUser: $idUser, ')
          ..write('nim: $nim, ')
          ..write('kelas: $kelas, ')
          ..write('fakultas: $fakultas, ')
          ..write('jurusan: $jurusan, ')
          ..write('kontak: $kontak, ')
          ..write('email: $email, ')
          ..write('alamat: $alamat, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $PenyewaanTable extends Penyewaan
    with TableInfo<$PenyewaanTable, PenyewaanData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PenyewaanTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idSewaMeta = const VerificationMeta('idSewa');
  @override
  late final GeneratedColumn<int> idSewa = GeneratedColumn<int>(
    'id_sewa',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _kodeSewaMeta = const VerificationMeta(
    'kodeSewa',
  );
  @override
  late final GeneratedColumn<String> kodeSewa = GeneratedColumn<String>(
    'kode_sewa',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _idPeminjamMeta = const VerificationMeta(
    'idPeminjam',
  );
  @override
  late final GeneratedColumn<int> idPeminjam = GeneratedColumn<int>(
    'id_peminjam',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES peminjam (id_peminjam)',
    ),
  );
  static const VerificationMeta _idOrganisasiMeta = const VerificationMeta(
    'idOrganisasi',
  );
  @override
  late final GeneratedColumn<int> idOrganisasi = GeneratedColumn<int>(
    'id_organisasi',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES organisasi (id_organisasi)',
    ),
  );
  static const VerificationMeta _tanggalSewaMeta = const VerificationMeta(
    'tanggalSewa',
  );
  @override
  late final GeneratedColumn<DateTime> tanggalSewa = GeneratedColumn<DateTime>(
    'tanggal_sewa',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tanggalRencanaKembaliMeta =
      const VerificationMeta('tanggalRencanaKembali');
  @override
  late final GeneratedColumn<DateTime> tanggalRencanaKembali =
      GeneratedColumn<DateTime>(
        'tanggal_rencana_kembali',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _tanggalAktualKembaliMeta =
      const VerificationMeta('tanggalAktualKembali');
  @override
  late final GeneratedColumn<DateTime> tanggalAktualKembali =
      GeneratedColumn<DateTime>(
        'tanggal_aktual_kembali',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _statusPenyewaanMeta = const VerificationMeta(
    'statusPenyewaan',
  );
  @override
  late final GeneratedColumn<String> statusPenyewaan = GeneratedColumn<String>(
    'status_penyewaan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('menunggu'),
  );
  static const VerificationMeta _totalHargaMeta = const VerificationMeta(
    'totalHarga',
  );
  @override
  late final GeneratedColumn<double> totalHarga = GeneratedColumn<double>(
    'total_harga',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _dpMeta = const VerificationMeta('dp');
  @override
  late final GeneratedColumn<double> dp = GeneratedColumn<double>(
    'dp',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sisaBayarMeta = const VerificationMeta(
    'sisaBayar',
  );
  @override
  late final GeneratedColumn<double> sisaBayar = GeneratedColumn<double>(
    'sisa_bayar',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _catatanMeta = const VerificationMeta(
    'catatan',
  );
  @override
  late final GeneratedColumn<String> catatan = GeneratedColumn<String>(
    'catatan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _idAdminMeta = const VerificationMeta(
    'idAdmin',
  );
  @override
  late final GeneratedColumn<int> idAdmin = GeneratedColumn<int>(
    'id_admin',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id_user)',
    ),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idSewa,
    kodeSewa,
    idPeminjam,
    idOrganisasi,
    tanggalSewa,
    tanggalRencanaKembali,
    tanggalAktualKembali,
    statusPenyewaan,
    totalHarga,
    dp,
    sisaBayar,
    catatan,
    idAdmin,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'penyewaan';
  @override
  VerificationContext validateIntegrity(
    Insertable<PenyewaanData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_sewa')) {
      context.handle(
        _idSewaMeta,
        idSewa.isAcceptableOrUnknown(data['id_sewa']!, _idSewaMeta),
      );
    }
    if (data.containsKey('kode_sewa')) {
      context.handle(
        _kodeSewaMeta,
        kodeSewa.isAcceptableOrUnknown(data['kode_sewa']!, _kodeSewaMeta),
      );
    } else if (isInserting) {
      context.missing(_kodeSewaMeta);
    }
    if (data.containsKey('id_peminjam')) {
      context.handle(
        _idPeminjamMeta,
        idPeminjam.isAcceptableOrUnknown(data['id_peminjam']!, _idPeminjamMeta),
      );
    } else if (isInserting) {
      context.missing(_idPeminjamMeta);
    }
    if (data.containsKey('id_organisasi')) {
      context.handle(
        _idOrganisasiMeta,
        idOrganisasi.isAcceptableOrUnknown(
          data['id_organisasi']!,
          _idOrganisasiMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idOrganisasiMeta);
    }
    if (data.containsKey('tanggal_sewa')) {
      context.handle(
        _tanggalSewaMeta,
        tanggalSewa.isAcceptableOrUnknown(
          data['tanggal_sewa']!,
          _tanggalSewaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tanggalSewaMeta);
    }
    if (data.containsKey('tanggal_rencana_kembali')) {
      context.handle(
        _tanggalRencanaKembaliMeta,
        tanggalRencanaKembali.isAcceptableOrUnknown(
          data['tanggal_rencana_kembali']!,
          _tanggalRencanaKembaliMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tanggalRencanaKembaliMeta);
    }
    if (data.containsKey('tanggal_aktual_kembali')) {
      context.handle(
        _tanggalAktualKembaliMeta,
        tanggalAktualKembali.isAcceptableOrUnknown(
          data['tanggal_aktual_kembali']!,
          _tanggalAktualKembaliMeta,
        ),
      );
    }
    if (data.containsKey('status_penyewaan')) {
      context.handle(
        _statusPenyewaanMeta,
        statusPenyewaan.isAcceptableOrUnknown(
          data['status_penyewaan']!,
          _statusPenyewaanMeta,
        ),
      );
    }
    if (data.containsKey('total_harga')) {
      context.handle(
        _totalHargaMeta,
        totalHarga.isAcceptableOrUnknown(data['total_harga']!, _totalHargaMeta),
      );
    }
    if (data.containsKey('dp')) {
      context.handle(_dpMeta, dp.isAcceptableOrUnknown(data['dp']!, _dpMeta));
    }
    if (data.containsKey('sisa_bayar')) {
      context.handle(
        _sisaBayarMeta,
        sisaBayar.isAcceptableOrUnknown(data['sisa_bayar']!, _sisaBayarMeta),
      );
    }
    if (data.containsKey('catatan')) {
      context.handle(
        _catatanMeta,
        catatan.isAcceptableOrUnknown(data['catatan']!, _catatanMeta),
      );
    }
    if (data.containsKey('id_admin')) {
      context.handle(
        _idAdminMeta,
        idAdmin.isAcceptableOrUnknown(data['id_admin']!, _idAdminMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idSewa};
  @override
  PenyewaanData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PenyewaanData(
      idSewa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_sewa'],
      )!,
      kodeSewa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kode_sewa'],
      )!,
      idPeminjam: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_peminjam'],
      )!,
      idOrganisasi: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_organisasi'],
      )!,
      tanggalSewa: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}tanggal_sewa'],
      )!,
      tanggalRencanaKembali: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}tanggal_rencana_kembali'],
      )!,
      tanggalAktualKembali: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}tanggal_aktual_kembali'],
      ),
      statusPenyewaan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_penyewaan'],
      )!,
      totalHarga: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_harga'],
      )!,
      dp: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}dp'],
      )!,
      sisaBayar: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sisa_bayar'],
      )!,
      catatan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}catatan'],
      ),
      idAdmin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_admin'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PenyewaanTable createAlias(String alias) {
    return $PenyewaanTable(attachedDatabase, alias);
  }
}

class PenyewaanData extends DataClass implements Insertable<PenyewaanData> {
  final int idSewa;
  final String kodeSewa;
  final int idPeminjam;
  final int idOrganisasi;
  final DateTime tanggalSewa;
  final DateTime tanggalRencanaKembali;
  final DateTime? tanggalAktualKembali;
  final String statusPenyewaan;
  final double totalHarga;
  final double dp;
  final double sisaBayar;
  final String? catatan;
  final int? idAdmin;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PenyewaanData({
    required this.idSewa,
    required this.kodeSewa,
    required this.idPeminjam,
    required this.idOrganisasi,
    required this.tanggalSewa,
    required this.tanggalRencanaKembali,
    this.tanggalAktualKembali,
    required this.statusPenyewaan,
    required this.totalHarga,
    required this.dp,
    required this.sisaBayar,
    this.catatan,
    this.idAdmin,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_sewa'] = Variable<int>(idSewa);
    map['kode_sewa'] = Variable<String>(kodeSewa);
    map['id_peminjam'] = Variable<int>(idPeminjam);
    map['id_organisasi'] = Variable<int>(idOrganisasi);
    map['tanggal_sewa'] = Variable<DateTime>(tanggalSewa);
    map['tanggal_rencana_kembali'] = Variable<DateTime>(tanggalRencanaKembali);
    if (!nullToAbsent || tanggalAktualKembali != null) {
      map['tanggal_aktual_kembali'] = Variable<DateTime>(tanggalAktualKembali);
    }
    map['status_penyewaan'] = Variable<String>(statusPenyewaan);
    map['total_harga'] = Variable<double>(totalHarga);
    map['dp'] = Variable<double>(dp);
    map['sisa_bayar'] = Variable<double>(sisaBayar);
    if (!nullToAbsent || catatan != null) {
      map['catatan'] = Variable<String>(catatan);
    }
    if (!nullToAbsent || idAdmin != null) {
      map['id_admin'] = Variable<int>(idAdmin);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PenyewaanCompanion toCompanion(bool nullToAbsent) {
    return PenyewaanCompanion(
      idSewa: Value(idSewa),
      kodeSewa: Value(kodeSewa),
      idPeminjam: Value(idPeminjam),
      idOrganisasi: Value(idOrganisasi),
      tanggalSewa: Value(tanggalSewa),
      tanggalRencanaKembali: Value(tanggalRencanaKembali),
      tanggalAktualKembali: tanggalAktualKembali == null && nullToAbsent
          ? const Value.absent()
          : Value(tanggalAktualKembali),
      statusPenyewaan: Value(statusPenyewaan),
      totalHarga: Value(totalHarga),
      dp: Value(dp),
      sisaBayar: Value(sisaBayar),
      catatan: catatan == null && nullToAbsent
          ? const Value.absent()
          : Value(catatan),
      idAdmin: idAdmin == null && nullToAbsent
          ? const Value.absent()
          : Value(idAdmin),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PenyewaanData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PenyewaanData(
      idSewa: serializer.fromJson<int>(json['idSewa']),
      kodeSewa: serializer.fromJson<String>(json['kodeSewa']),
      idPeminjam: serializer.fromJson<int>(json['idPeminjam']),
      idOrganisasi: serializer.fromJson<int>(json['idOrganisasi']),
      tanggalSewa: serializer.fromJson<DateTime>(json['tanggalSewa']),
      tanggalRencanaKembali: serializer.fromJson<DateTime>(
        json['tanggalRencanaKembali'],
      ),
      tanggalAktualKembali: serializer.fromJson<DateTime?>(
        json['tanggalAktualKembali'],
      ),
      statusPenyewaan: serializer.fromJson<String>(json['statusPenyewaan']),
      totalHarga: serializer.fromJson<double>(json['totalHarga']),
      dp: serializer.fromJson<double>(json['dp']),
      sisaBayar: serializer.fromJson<double>(json['sisaBayar']),
      catatan: serializer.fromJson<String?>(json['catatan']),
      idAdmin: serializer.fromJson<int?>(json['idAdmin']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idSewa': serializer.toJson<int>(idSewa),
      'kodeSewa': serializer.toJson<String>(kodeSewa),
      'idPeminjam': serializer.toJson<int>(idPeminjam),
      'idOrganisasi': serializer.toJson<int>(idOrganisasi),
      'tanggalSewa': serializer.toJson<DateTime>(tanggalSewa),
      'tanggalRencanaKembali': serializer.toJson<DateTime>(
        tanggalRencanaKembali,
      ),
      'tanggalAktualKembali': serializer.toJson<DateTime?>(
        tanggalAktualKembali,
      ),
      'statusPenyewaan': serializer.toJson<String>(statusPenyewaan),
      'totalHarga': serializer.toJson<double>(totalHarga),
      'dp': serializer.toJson<double>(dp),
      'sisaBayar': serializer.toJson<double>(sisaBayar),
      'catatan': serializer.toJson<String?>(catatan),
      'idAdmin': serializer.toJson<int?>(idAdmin),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PenyewaanData copyWith({
    int? idSewa,
    String? kodeSewa,
    int? idPeminjam,
    int? idOrganisasi,
    DateTime? tanggalSewa,
    DateTime? tanggalRencanaKembali,
    Value<DateTime?> tanggalAktualKembali = const Value.absent(),
    String? statusPenyewaan,
    double? totalHarga,
    double? dp,
    double? sisaBayar,
    Value<String?> catatan = const Value.absent(),
    Value<int?> idAdmin = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PenyewaanData(
    idSewa: idSewa ?? this.idSewa,
    kodeSewa: kodeSewa ?? this.kodeSewa,
    idPeminjam: idPeminjam ?? this.idPeminjam,
    idOrganisasi: idOrganisasi ?? this.idOrganisasi,
    tanggalSewa: tanggalSewa ?? this.tanggalSewa,
    tanggalRencanaKembali: tanggalRencanaKembali ?? this.tanggalRencanaKembali,
    tanggalAktualKembali: tanggalAktualKembali.present
        ? tanggalAktualKembali.value
        : this.tanggalAktualKembali,
    statusPenyewaan: statusPenyewaan ?? this.statusPenyewaan,
    totalHarga: totalHarga ?? this.totalHarga,
    dp: dp ?? this.dp,
    sisaBayar: sisaBayar ?? this.sisaBayar,
    catatan: catatan.present ? catatan.value : this.catatan,
    idAdmin: idAdmin.present ? idAdmin.value : this.idAdmin,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PenyewaanData copyWithCompanion(PenyewaanCompanion data) {
    return PenyewaanData(
      idSewa: data.idSewa.present ? data.idSewa.value : this.idSewa,
      kodeSewa: data.kodeSewa.present ? data.kodeSewa.value : this.kodeSewa,
      idPeminjam: data.idPeminjam.present
          ? data.idPeminjam.value
          : this.idPeminjam,
      idOrganisasi: data.idOrganisasi.present
          ? data.idOrganisasi.value
          : this.idOrganisasi,
      tanggalSewa: data.tanggalSewa.present
          ? data.tanggalSewa.value
          : this.tanggalSewa,
      tanggalRencanaKembali: data.tanggalRencanaKembali.present
          ? data.tanggalRencanaKembali.value
          : this.tanggalRencanaKembali,
      tanggalAktualKembali: data.tanggalAktualKembali.present
          ? data.tanggalAktualKembali.value
          : this.tanggalAktualKembali,
      statusPenyewaan: data.statusPenyewaan.present
          ? data.statusPenyewaan.value
          : this.statusPenyewaan,
      totalHarga: data.totalHarga.present
          ? data.totalHarga.value
          : this.totalHarga,
      dp: data.dp.present ? data.dp.value : this.dp,
      sisaBayar: data.sisaBayar.present ? data.sisaBayar.value : this.sisaBayar,
      catatan: data.catatan.present ? data.catatan.value : this.catatan,
      idAdmin: data.idAdmin.present ? data.idAdmin.value : this.idAdmin,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PenyewaanData(')
          ..write('idSewa: $idSewa, ')
          ..write('kodeSewa: $kodeSewa, ')
          ..write('idPeminjam: $idPeminjam, ')
          ..write('idOrganisasi: $idOrganisasi, ')
          ..write('tanggalSewa: $tanggalSewa, ')
          ..write('tanggalRencanaKembali: $tanggalRencanaKembali, ')
          ..write('tanggalAktualKembali: $tanggalAktualKembali, ')
          ..write('statusPenyewaan: $statusPenyewaan, ')
          ..write('totalHarga: $totalHarga, ')
          ..write('dp: $dp, ')
          ..write('sisaBayar: $sisaBayar, ')
          ..write('catatan: $catatan, ')
          ..write('idAdmin: $idAdmin, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idSewa,
    kodeSewa,
    idPeminjam,
    idOrganisasi,
    tanggalSewa,
    tanggalRencanaKembali,
    tanggalAktualKembali,
    statusPenyewaan,
    totalHarga,
    dp,
    sisaBayar,
    catatan,
    idAdmin,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PenyewaanData &&
          other.idSewa == this.idSewa &&
          other.kodeSewa == this.kodeSewa &&
          other.idPeminjam == this.idPeminjam &&
          other.idOrganisasi == this.idOrganisasi &&
          other.tanggalSewa == this.tanggalSewa &&
          other.tanggalRencanaKembali == this.tanggalRencanaKembali &&
          other.tanggalAktualKembali == this.tanggalAktualKembali &&
          other.statusPenyewaan == this.statusPenyewaan &&
          other.totalHarga == this.totalHarga &&
          other.dp == this.dp &&
          other.sisaBayar == this.sisaBayar &&
          other.catatan == this.catatan &&
          other.idAdmin == this.idAdmin &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PenyewaanCompanion extends UpdateCompanion<PenyewaanData> {
  final Value<int> idSewa;
  final Value<String> kodeSewa;
  final Value<int> idPeminjam;
  final Value<int> idOrganisasi;
  final Value<DateTime> tanggalSewa;
  final Value<DateTime> tanggalRencanaKembali;
  final Value<DateTime?> tanggalAktualKembali;
  final Value<String> statusPenyewaan;
  final Value<double> totalHarga;
  final Value<double> dp;
  final Value<double> sisaBayar;
  final Value<String?> catatan;
  final Value<int?> idAdmin;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PenyewaanCompanion({
    this.idSewa = const Value.absent(),
    this.kodeSewa = const Value.absent(),
    this.idPeminjam = const Value.absent(),
    this.idOrganisasi = const Value.absent(),
    this.tanggalSewa = const Value.absent(),
    this.tanggalRencanaKembali = const Value.absent(),
    this.tanggalAktualKembali = const Value.absent(),
    this.statusPenyewaan = const Value.absent(),
    this.totalHarga = const Value.absent(),
    this.dp = const Value.absent(),
    this.sisaBayar = const Value.absent(),
    this.catatan = const Value.absent(),
    this.idAdmin = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PenyewaanCompanion.insert({
    this.idSewa = const Value.absent(),
    required String kodeSewa,
    required int idPeminjam,
    required int idOrganisasi,
    required DateTime tanggalSewa,
    required DateTime tanggalRencanaKembali,
    this.tanggalAktualKembali = const Value.absent(),
    this.statusPenyewaan = const Value.absent(),
    this.totalHarga = const Value.absent(),
    this.dp = const Value.absent(),
    this.sisaBayar = const Value.absent(),
    this.catatan = const Value.absent(),
    this.idAdmin = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : kodeSewa = Value(kodeSewa),
       idPeminjam = Value(idPeminjam),
       idOrganisasi = Value(idOrganisasi),
       tanggalSewa = Value(tanggalSewa),
       tanggalRencanaKembali = Value(tanggalRencanaKembali);
  static Insertable<PenyewaanData> custom({
    Expression<int>? idSewa,
    Expression<String>? kodeSewa,
    Expression<int>? idPeminjam,
    Expression<int>? idOrganisasi,
    Expression<DateTime>? tanggalSewa,
    Expression<DateTime>? tanggalRencanaKembali,
    Expression<DateTime>? tanggalAktualKembali,
    Expression<String>? statusPenyewaan,
    Expression<double>? totalHarga,
    Expression<double>? dp,
    Expression<double>? sisaBayar,
    Expression<String>? catatan,
    Expression<int>? idAdmin,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (idSewa != null) 'id_sewa': idSewa,
      if (kodeSewa != null) 'kode_sewa': kodeSewa,
      if (idPeminjam != null) 'id_peminjam': idPeminjam,
      if (idOrganisasi != null) 'id_organisasi': idOrganisasi,
      if (tanggalSewa != null) 'tanggal_sewa': tanggalSewa,
      if (tanggalRencanaKembali != null)
        'tanggal_rencana_kembali': tanggalRencanaKembali,
      if (tanggalAktualKembali != null)
        'tanggal_aktual_kembali': tanggalAktualKembali,
      if (statusPenyewaan != null) 'status_penyewaan': statusPenyewaan,
      if (totalHarga != null) 'total_harga': totalHarga,
      if (dp != null) 'dp': dp,
      if (sisaBayar != null) 'sisa_bayar': sisaBayar,
      if (catatan != null) 'catatan': catatan,
      if (idAdmin != null) 'id_admin': idAdmin,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PenyewaanCompanion copyWith({
    Value<int>? idSewa,
    Value<String>? kodeSewa,
    Value<int>? idPeminjam,
    Value<int>? idOrganisasi,
    Value<DateTime>? tanggalSewa,
    Value<DateTime>? tanggalRencanaKembali,
    Value<DateTime?>? tanggalAktualKembali,
    Value<String>? statusPenyewaan,
    Value<double>? totalHarga,
    Value<double>? dp,
    Value<double>? sisaBayar,
    Value<String?>? catatan,
    Value<int?>? idAdmin,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return PenyewaanCompanion(
      idSewa: idSewa ?? this.idSewa,
      kodeSewa: kodeSewa ?? this.kodeSewa,
      idPeminjam: idPeminjam ?? this.idPeminjam,
      idOrganisasi: idOrganisasi ?? this.idOrganisasi,
      tanggalSewa: tanggalSewa ?? this.tanggalSewa,
      tanggalRencanaKembali:
          tanggalRencanaKembali ?? this.tanggalRencanaKembali,
      tanggalAktualKembali: tanggalAktualKembali ?? this.tanggalAktualKembali,
      statusPenyewaan: statusPenyewaan ?? this.statusPenyewaan,
      totalHarga: totalHarga ?? this.totalHarga,
      dp: dp ?? this.dp,
      sisaBayar: sisaBayar ?? this.sisaBayar,
      catatan: catatan ?? this.catatan,
      idAdmin: idAdmin ?? this.idAdmin,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idSewa.present) {
      map['id_sewa'] = Variable<int>(idSewa.value);
    }
    if (kodeSewa.present) {
      map['kode_sewa'] = Variable<String>(kodeSewa.value);
    }
    if (idPeminjam.present) {
      map['id_peminjam'] = Variable<int>(idPeminjam.value);
    }
    if (idOrganisasi.present) {
      map['id_organisasi'] = Variable<int>(idOrganisasi.value);
    }
    if (tanggalSewa.present) {
      map['tanggal_sewa'] = Variable<DateTime>(tanggalSewa.value);
    }
    if (tanggalRencanaKembali.present) {
      map['tanggal_rencana_kembali'] = Variable<DateTime>(
        tanggalRencanaKembali.value,
      );
    }
    if (tanggalAktualKembali.present) {
      map['tanggal_aktual_kembali'] = Variable<DateTime>(
        tanggalAktualKembali.value,
      );
    }
    if (statusPenyewaan.present) {
      map['status_penyewaan'] = Variable<String>(statusPenyewaan.value);
    }
    if (totalHarga.present) {
      map['total_harga'] = Variable<double>(totalHarga.value);
    }
    if (dp.present) {
      map['dp'] = Variable<double>(dp.value);
    }
    if (sisaBayar.present) {
      map['sisa_bayar'] = Variable<double>(sisaBayar.value);
    }
    if (catatan.present) {
      map['catatan'] = Variable<String>(catatan.value);
    }
    if (idAdmin.present) {
      map['id_admin'] = Variable<int>(idAdmin.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PenyewaanCompanion(')
          ..write('idSewa: $idSewa, ')
          ..write('kodeSewa: $kodeSewa, ')
          ..write('idPeminjam: $idPeminjam, ')
          ..write('idOrganisasi: $idOrganisasi, ')
          ..write('tanggalSewa: $tanggalSewa, ')
          ..write('tanggalRencanaKembali: $tanggalRencanaKembali, ')
          ..write('tanggalAktualKembali: $tanggalAktualKembali, ')
          ..write('statusPenyewaan: $statusPenyewaan, ')
          ..write('totalHarga: $totalHarga, ')
          ..write('dp: $dp, ')
          ..write('sisaBayar: $sisaBayar, ')
          ..write('catatan: $catatan, ')
          ..write('idAdmin: $idAdmin, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DetailPenyewaanTable extends DetailPenyewaan
    with TableInfo<$DetailPenyewaanTable, DetailPenyewaanData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DetailPenyewaanTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idDetailMeta = const VerificationMeta(
    'idDetail',
  );
  @override
  late final GeneratedColumn<int> idDetail = GeneratedColumn<int>(
    'id_detail',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idSewaMeta = const VerificationMeta('idSewa');
  @override
  late final GeneratedColumn<int> idSewa = GeneratedColumn<int>(
    'id_sewa',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES penyewaan (id_sewa)',
    ),
  );
  static const VerificationMeta _idBarangMeta = const VerificationMeta(
    'idBarang',
  );
  @override
  late final GeneratedColumn<int> idBarang = GeneratedColumn<int>(
    'id_barang',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES barang (id_barang)',
    ),
  );
  static const VerificationMeta _jumlahMeta = const VerificationMeta('jumlah');
  @override
  late final GeneratedColumn<int> jumlah = GeneratedColumn<int>(
    'jumlah',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _hargaSatuanMeta = const VerificationMeta(
    'hargaSatuan',
  );
  @override
  late final GeneratedColumn<double> hargaSatuan = GeneratedColumn<double>(
    'harga_satuan',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kondisiSaatPinjamMeta = const VerificationMeta(
    'kondisiSaatPinjam',
  );
  @override
  late final GeneratedColumn<String> kondisiSaatPinjam =
      GeneratedColumn<String>(
        'kondisi_saat_pinjam',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _catatanMeta = const VerificationMeta(
    'catatan',
  );
  @override
  late final GeneratedColumn<String> catatan = GeneratedColumn<String>(
    'catatan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idDetail,
    idSewa,
    idBarang,
    jumlah,
    hargaSatuan,
    subtotal,
    kondisiSaatPinjam,
    catatan,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'detail_penyewaan';
  @override
  VerificationContext validateIntegrity(
    Insertable<DetailPenyewaanData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_detail')) {
      context.handle(
        _idDetailMeta,
        idDetail.isAcceptableOrUnknown(data['id_detail']!, _idDetailMeta),
      );
    }
    if (data.containsKey('id_sewa')) {
      context.handle(
        _idSewaMeta,
        idSewa.isAcceptableOrUnknown(data['id_sewa']!, _idSewaMeta),
      );
    } else if (isInserting) {
      context.missing(_idSewaMeta);
    }
    if (data.containsKey('id_barang')) {
      context.handle(
        _idBarangMeta,
        idBarang.isAcceptableOrUnknown(data['id_barang']!, _idBarangMeta),
      );
    } else if (isInserting) {
      context.missing(_idBarangMeta);
    }
    if (data.containsKey('jumlah')) {
      context.handle(
        _jumlahMeta,
        jumlah.isAcceptableOrUnknown(data['jumlah']!, _jumlahMeta),
      );
    }
    if (data.containsKey('harga_satuan')) {
      context.handle(
        _hargaSatuanMeta,
        hargaSatuan.isAcceptableOrUnknown(
          data['harga_satuan']!,
          _hargaSatuanMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hargaSatuanMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('kondisi_saat_pinjam')) {
      context.handle(
        _kondisiSaatPinjamMeta,
        kondisiSaatPinjam.isAcceptableOrUnknown(
          data['kondisi_saat_pinjam']!,
          _kondisiSaatPinjamMeta,
        ),
      );
    }
    if (data.containsKey('catatan')) {
      context.handle(
        _catatanMeta,
        catatan.isAcceptableOrUnknown(data['catatan']!, _catatanMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idDetail};
  @override
  DetailPenyewaanData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DetailPenyewaanData(
      idDetail: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_detail'],
      )!,
      idSewa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_sewa'],
      )!,
      idBarang: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_barang'],
      )!,
      jumlah: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jumlah'],
      )!,
      hargaSatuan: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}harga_satuan'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
      kondisiSaatPinjam: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kondisi_saat_pinjam'],
      ),
      catatan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}catatan'],
      ),
    );
  }

  @override
  $DetailPenyewaanTable createAlias(String alias) {
    return $DetailPenyewaanTable(attachedDatabase, alias);
  }
}

class DetailPenyewaanData extends DataClass
    implements Insertable<DetailPenyewaanData> {
  final int idDetail;
  final int idSewa;
  final int idBarang;
  final int jumlah;
  final double hargaSatuan;
  final double subtotal;
  final String? kondisiSaatPinjam;
  final String? catatan;
  const DetailPenyewaanData({
    required this.idDetail,
    required this.idSewa,
    required this.idBarang,
    required this.jumlah,
    required this.hargaSatuan,
    required this.subtotal,
    this.kondisiSaatPinjam,
    this.catatan,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_detail'] = Variable<int>(idDetail);
    map['id_sewa'] = Variable<int>(idSewa);
    map['id_barang'] = Variable<int>(idBarang);
    map['jumlah'] = Variable<int>(jumlah);
    map['harga_satuan'] = Variable<double>(hargaSatuan);
    map['subtotal'] = Variable<double>(subtotal);
    if (!nullToAbsent || kondisiSaatPinjam != null) {
      map['kondisi_saat_pinjam'] = Variable<String>(kondisiSaatPinjam);
    }
    if (!nullToAbsent || catatan != null) {
      map['catatan'] = Variable<String>(catatan);
    }
    return map;
  }

  DetailPenyewaanCompanion toCompanion(bool nullToAbsent) {
    return DetailPenyewaanCompanion(
      idDetail: Value(idDetail),
      idSewa: Value(idSewa),
      idBarang: Value(idBarang),
      jumlah: Value(jumlah),
      hargaSatuan: Value(hargaSatuan),
      subtotal: Value(subtotal),
      kondisiSaatPinjam: kondisiSaatPinjam == null && nullToAbsent
          ? const Value.absent()
          : Value(kondisiSaatPinjam),
      catatan: catatan == null && nullToAbsent
          ? const Value.absent()
          : Value(catatan),
    );
  }

  factory DetailPenyewaanData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DetailPenyewaanData(
      idDetail: serializer.fromJson<int>(json['idDetail']),
      idSewa: serializer.fromJson<int>(json['idSewa']),
      idBarang: serializer.fromJson<int>(json['idBarang']),
      jumlah: serializer.fromJson<int>(json['jumlah']),
      hargaSatuan: serializer.fromJson<double>(json['hargaSatuan']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      kondisiSaatPinjam: serializer.fromJson<String?>(
        json['kondisiSaatPinjam'],
      ),
      catatan: serializer.fromJson<String?>(json['catatan']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idDetail': serializer.toJson<int>(idDetail),
      'idSewa': serializer.toJson<int>(idSewa),
      'idBarang': serializer.toJson<int>(idBarang),
      'jumlah': serializer.toJson<int>(jumlah),
      'hargaSatuan': serializer.toJson<double>(hargaSatuan),
      'subtotal': serializer.toJson<double>(subtotal),
      'kondisiSaatPinjam': serializer.toJson<String?>(kondisiSaatPinjam),
      'catatan': serializer.toJson<String?>(catatan),
    };
  }

  DetailPenyewaanData copyWith({
    int? idDetail,
    int? idSewa,
    int? idBarang,
    int? jumlah,
    double? hargaSatuan,
    double? subtotal,
    Value<String?> kondisiSaatPinjam = const Value.absent(),
    Value<String?> catatan = const Value.absent(),
  }) => DetailPenyewaanData(
    idDetail: idDetail ?? this.idDetail,
    idSewa: idSewa ?? this.idSewa,
    idBarang: idBarang ?? this.idBarang,
    jumlah: jumlah ?? this.jumlah,
    hargaSatuan: hargaSatuan ?? this.hargaSatuan,
    subtotal: subtotal ?? this.subtotal,
    kondisiSaatPinjam: kondisiSaatPinjam.present
        ? kondisiSaatPinjam.value
        : this.kondisiSaatPinjam,
    catatan: catatan.present ? catatan.value : this.catatan,
  );
  DetailPenyewaanData copyWithCompanion(DetailPenyewaanCompanion data) {
    return DetailPenyewaanData(
      idDetail: data.idDetail.present ? data.idDetail.value : this.idDetail,
      idSewa: data.idSewa.present ? data.idSewa.value : this.idSewa,
      idBarang: data.idBarang.present ? data.idBarang.value : this.idBarang,
      jumlah: data.jumlah.present ? data.jumlah.value : this.jumlah,
      hargaSatuan: data.hargaSatuan.present
          ? data.hargaSatuan.value
          : this.hargaSatuan,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      kondisiSaatPinjam: data.kondisiSaatPinjam.present
          ? data.kondisiSaatPinjam.value
          : this.kondisiSaatPinjam,
      catatan: data.catatan.present ? data.catatan.value : this.catatan,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DetailPenyewaanData(')
          ..write('idDetail: $idDetail, ')
          ..write('idSewa: $idSewa, ')
          ..write('idBarang: $idBarang, ')
          ..write('jumlah: $jumlah, ')
          ..write('hargaSatuan: $hargaSatuan, ')
          ..write('subtotal: $subtotal, ')
          ..write('kondisiSaatPinjam: $kondisiSaatPinjam, ')
          ..write('catatan: $catatan')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idDetail,
    idSewa,
    idBarang,
    jumlah,
    hargaSatuan,
    subtotal,
    kondisiSaatPinjam,
    catatan,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailPenyewaanData &&
          other.idDetail == this.idDetail &&
          other.idSewa == this.idSewa &&
          other.idBarang == this.idBarang &&
          other.jumlah == this.jumlah &&
          other.hargaSatuan == this.hargaSatuan &&
          other.subtotal == this.subtotal &&
          other.kondisiSaatPinjam == this.kondisiSaatPinjam &&
          other.catatan == this.catatan);
}

class DetailPenyewaanCompanion extends UpdateCompanion<DetailPenyewaanData> {
  final Value<int> idDetail;
  final Value<int> idSewa;
  final Value<int> idBarang;
  final Value<int> jumlah;
  final Value<double> hargaSatuan;
  final Value<double> subtotal;
  final Value<String?> kondisiSaatPinjam;
  final Value<String?> catatan;
  const DetailPenyewaanCompanion({
    this.idDetail = const Value.absent(),
    this.idSewa = const Value.absent(),
    this.idBarang = const Value.absent(),
    this.jumlah = const Value.absent(),
    this.hargaSatuan = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.kondisiSaatPinjam = const Value.absent(),
    this.catatan = const Value.absent(),
  });
  DetailPenyewaanCompanion.insert({
    this.idDetail = const Value.absent(),
    required int idSewa,
    required int idBarang,
    this.jumlah = const Value.absent(),
    required double hargaSatuan,
    required double subtotal,
    this.kondisiSaatPinjam = const Value.absent(),
    this.catatan = const Value.absent(),
  }) : idSewa = Value(idSewa),
       idBarang = Value(idBarang),
       hargaSatuan = Value(hargaSatuan),
       subtotal = Value(subtotal);
  static Insertable<DetailPenyewaanData> custom({
    Expression<int>? idDetail,
    Expression<int>? idSewa,
    Expression<int>? idBarang,
    Expression<int>? jumlah,
    Expression<double>? hargaSatuan,
    Expression<double>? subtotal,
    Expression<String>? kondisiSaatPinjam,
    Expression<String>? catatan,
  }) {
    return RawValuesInsertable({
      if (idDetail != null) 'id_detail': idDetail,
      if (idSewa != null) 'id_sewa': idSewa,
      if (idBarang != null) 'id_barang': idBarang,
      if (jumlah != null) 'jumlah': jumlah,
      if (hargaSatuan != null) 'harga_satuan': hargaSatuan,
      if (subtotal != null) 'subtotal': subtotal,
      if (kondisiSaatPinjam != null) 'kondisi_saat_pinjam': kondisiSaatPinjam,
      if (catatan != null) 'catatan': catatan,
    });
  }

  DetailPenyewaanCompanion copyWith({
    Value<int>? idDetail,
    Value<int>? idSewa,
    Value<int>? idBarang,
    Value<int>? jumlah,
    Value<double>? hargaSatuan,
    Value<double>? subtotal,
    Value<String?>? kondisiSaatPinjam,
    Value<String?>? catatan,
  }) {
    return DetailPenyewaanCompanion(
      idDetail: idDetail ?? this.idDetail,
      idSewa: idSewa ?? this.idSewa,
      idBarang: idBarang ?? this.idBarang,
      jumlah: jumlah ?? this.jumlah,
      hargaSatuan: hargaSatuan ?? this.hargaSatuan,
      subtotal: subtotal ?? this.subtotal,
      kondisiSaatPinjam: kondisiSaatPinjam ?? this.kondisiSaatPinjam,
      catatan: catatan ?? this.catatan,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idDetail.present) {
      map['id_detail'] = Variable<int>(idDetail.value);
    }
    if (idSewa.present) {
      map['id_sewa'] = Variable<int>(idSewa.value);
    }
    if (idBarang.present) {
      map['id_barang'] = Variable<int>(idBarang.value);
    }
    if (jumlah.present) {
      map['jumlah'] = Variable<int>(jumlah.value);
    }
    if (hargaSatuan.present) {
      map['harga_satuan'] = Variable<double>(hargaSatuan.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (kondisiSaatPinjam.present) {
      map['kondisi_saat_pinjam'] = Variable<String>(kondisiSaatPinjam.value);
    }
    if (catatan.present) {
      map['catatan'] = Variable<String>(catatan.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetailPenyewaanCompanion(')
          ..write('idDetail: $idDetail, ')
          ..write('idSewa: $idSewa, ')
          ..write('idBarang: $idBarang, ')
          ..write('jumlah: $jumlah, ')
          ..write('hargaSatuan: $hargaSatuan, ')
          ..write('subtotal: $subtotal, ')
          ..write('kondisiSaatPinjam: $kondisiSaatPinjam, ')
          ..write('catatan: $catatan')
          ..write(')'))
        .toString();
  }
}

class $PengembalianTable extends Pengembalian
    with TableInfo<$PengembalianTable, PengembalianData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PengembalianTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPengembalianMeta = const VerificationMeta(
    'idPengembalian',
  );
  @override
  late final GeneratedColumn<int> idPengembalian = GeneratedColumn<int>(
    'id_pengembalian',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idSewaMeta = const VerificationMeta('idSewa');
  @override
  late final GeneratedColumn<int> idSewa = GeneratedColumn<int>(
    'id_sewa',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES penyewaan (id_sewa)',
    ),
  );
  static const VerificationMeta _tanggalDikembalikanMeta =
      const VerificationMeta('tanggalDikembalikan');
  @override
  late final GeneratedColumn<DateTime> tanggalDikembalikan =
      GeneratedColumn<DateTime>(
        'tanggal_dikembalikan',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _statusPengembalianMeta =
      const VerificationMeta('statusPengembalian');
  @override
  late final GeneratedColumn<String> statusPengembalian =
      GeneratedColumn<String>(
        'status_pengembalian',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('diterima'),
      );
  static const VerificationMeta _dendaMeta = const VerificationMeta('denda');
  @override
  late final GeneratedColumn<double> denda = GeneratedColumn<double>(
    'denda',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _catatanMeta = const VerificationMeta(
    'catatan',
  );
  @override
  late final GeneratedColumn<String> catatan = GeneratedColumn<String>(
    'catatan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _idAdminMeta = const VerificationMeta(
    'idAdmin',
  );
  @override
  late final GeneratedColumn<int> idAdmin = GeneratedColumn<int>(
    'id_admin',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id_user)',
    ),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idPengembalian,
    idSewa,
    tanggalDikembalikan,
    statusPengembalian,
    denda,
    catatan,
    idAdmin,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pengembalian';
  @override
  VerificationContext validateIntegrity(
    Insertable<PengembalianData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_pengembalian')) {
      context.handle(
        _idPengembalianMeta,
        idPengembalian.isAcceptableOrUnknown(
          data['id_pengembalian']!,
          _idPengembalianMeta,
        ),
      );
    }
    if (data.containsKey('id_sewa')) {
      context.handle(
        _idSewaMeta,
        idSewa.isAcceptableOrUnknown(data['id_sewa']!, _idSewaMeta),
      );
    } else if (isInserting) {
      context.missing(_idSewaMeta);
    }
    if (data.containsKey('tanggal_dikembalikan')) {
      context.handle(
        _tanggalDikembalikanMeta,
        tanggalDikembalikan.isAcceptableOrUnknown(
          data['tanggal_dikembalikan']!,
          _tanggalDikembalikanMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tanggalDikembalikanMeta);
    }
    if (data.containsKey('status_pengembalian')) {
      context.handle(
        _statusPengembalianMeta,
        statusPengembalian.isAcceptableOrUnknown(
          data['status_pengembalian']!,
          _statusPengembalianMeta,
        ),
      );
    }
    if (data.containsKey('denda')) {
      context.handle(
        _dendaMeta,
        denda.isAcceptableOrUnknown(data['denda']!, _dendaMeta),
      );
    }
    if (data.containsKey('catatan')) {
      context.handle(
        _catatanMeta,
        catatan.isAcceptableOrUnknown(data['catatan']!, _catatanMeta),
      );
    }
    if (data.containsKey('id_admin')) {
      context.handle(
        _idAdminMeta,
        idAdmin.isAcceptableOrUnknown(data['id_admin']!, _idAdminMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPengembalian};
  @override
  PengembalianData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PengembalianData(
      idPengembalian: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_pengembalian'],
      )!,
      idSewa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_sewa'],
      )!,
      tanggalDikembalikan: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}tanggal_dikembalikan'],
      )!,
      statusPengembalian: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_pengembalian'],
      )!,
      denda: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}denda'],
      )!,
      catatan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}catatan'],
      ),
      idAdmin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_admin'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PengembalianTable createAlias(String alias) {
    return $PengembalianTable(attachedDatabase, alias);
  }
}

class PengembalianData extends DataClass
    implements Insertable<PengembalianData> {
  final int idPengembalian;
  final int idSewa;
  final DateTime tanggalDikembalikan;
  final String statusPengembalian;
  final double denda;
  final String? catatan;
  final int? idAdmin;
  final DateTime createdAt;
  const PengembalianData({
    required this.idPengembalian,
    required this.idSewa,
    required this.tanggalDikembalikan,
    required this.statusPengembalian,
    required this.denda,
    this.catatan,
    this.idAdmin,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_pengembalian'] = Variable<int>(idPengembalian);
    map['id_sewa'] = Variable<int>(idSewa);
    map['tanggal_dikembalikan'] = Variable<DateTime>(tanggalDikembalikan);
    map['status_pengembalian'] = Variable<String>(statusPengembalian);
    map['denda'] = Variable<double>(denda);
    if (!nullToAbsent || catatan != null) {
      map['catatan'] = Variable<String>(catatan);
    }
    if (!nullToAbsent || idAdmin != null) {
      map['id_admin'] = Variable<int>(idAdmin);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PengembalianCompanion toCompanion(bool nullToAbsent) {
    return PengembalianCompanion(
      idPengembalian: Value(idPengembalian),
      idSewa: Value(idSewa),
      tanggalDikembalikan: Value(tanggalDikembalikan),
      statusPengembalian: Value(statusPengembalian),
      denda: Value(denda),
      catatan: catatan == null && nullToAbsent
          ? const Value.absent()
          : Value(catatan),
      idAdmin: idAdmin == null && nullToAbsent
          ? const Value.absent()
          : Value(idAdmin),
      createdAt: Value(createdAt),
    );
  }

  factory PengembalianData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PengembalianData(
      idPengembalian: serializer.fromJson<int>(json['idPengembalian']),
      idSewa: serializer.fromJson<int>(json['idSewa']),
      tanggalDikembalikan: serializer.fromJson<DateTime>(
        json['tanggalDikembalikan'],
      ),
      statusPengembalian: serializer.fromJson<String>(
        json['statusPengembalian'],
      ),
      denda: serializer.fromJson<double>(json['denda']),
      catatan: serializer.fromJson<String?>(json['catatan']),
      idAdmin: serializer.fromJson<int?>(json['idAdmin']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPengembalian': serializer.toJson<int>(idPengembalian),
      'idSewa': serializer.toJson<int>(idSewa),
      'tanggalDikembalikan': serializer.toJson<DateTime>(tanggalDikembalikan),
      'statusPengembalian': serializer.toJson<String>(statusPengembalian),
      'denda': serializer.toJson<double>(denda),
      'catatan': serializer.toJson<String?>(catatan),
      'idAdmin': serializer.toJson<int?>(idAdmin),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PengembalianData copyWith({
    int? idPengembalian,
    int? idSewa,
    DateTime? tanggalDikembalikan,
    String? statusPengembalian,
    double? denda,
    Value<String?> catatan = const Value.absent(),
    Value<int?> idAdmin = const Value.absent(),
    DateTime? createdAt,
  }) => PengembalianData(
    idPengembalian: idPengembalian ?? this.idPengembalian,
    idSewa: idSewa ?? this.idSewa,
    tanggalDikembalikan: tanggalDikembalikan ?? this.tanggalDikembalikan,
    statusPengembalian: statusPengembalian ?? this.statusPengembalian,
    denda: denda ?? this.denda,
    catatan: catatan.present ? catatan.value : this.catatan,
    idAdmin: idAdmin.present ? idAdmin.value : this.idAdmin,
    createdAt: createdAt ?? this.createdAt,
  );
  PengembalianData copyWithCompanion(PengembalianCompanion data) {
    return PengembalianData(
      idPengembalian: data.idPengembalian.present
          ? data.idPengembalian.value
          : this.idPengembalian,
      idSewa: data.idSewa.present ? data.idSewa.value : this.idSewa,
      tanggalDikembalikan: data.tanggalDikembalikan.present
          ? data.tanggalDikembalikan.value
          : this.tanggalDikembalikan,
      statusPengembalian: data.statusPengembalian.present
          ? data.statusPengembalian.value
          : this.statusPengembalian,
      denda: data.denda.present ? data.denda.value : this.denda,
      catatan: data.catatan.present ? data.catatan.value : this.catatan,
      idAdmin: data.idAdmin.present ? data.idAdmin.value : this.idAdmin,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PengembalianData(')
          ..write('idPengembalian: $idPengembalian, ')
          ..write('idSewa: $idSewa, ')
          ..write('tanggalDikembalikan: $tanggalDikembalikan, ')
          ..write('statusPengembalian: $statusPengembalian, ')
          ..write('denda: $denda, ')
          ..write('catatan: $catatan, ')
          ..write('idAdmin: $idAdmin, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idPengembalian,
    idSewa,
    tanggalDikembalikan,
    statusPengembalian,
    denda,
    catatan,
    idAdmin,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PengembalianData &&
          other.idPengembalian == this.idPengembalian &&
          other.idSewa == this.idSewa &&
          other.tanggalDikembalikan == this.tanggalDikembalikan &&
          other.statusPengembalian == this.statusPengembalian &&
          other.denda == this.denda &&
          other.catatan == this.catatan &&
          other.idAdmin == this.idAdmin &&
          other.createdAt == this.createdAt);
}

class PengembalianCompanion extends UpdateCompanion<PengembalianData> {
  final Value<int> idPengembalian;
  final Value<int> idSewa;
  final Value<DateTime> tanggalDikembalikan;
  final Value<String> statusPengembalian;
  final Value<double> denda;
  final Value<String?> catatan;
  final Value<int?> idAdmin;
  final Value<DateTime> createdAt;
  const PengembalianCompanion({
    this.idPengembalian = const Value.absent(),
    this.idSewa = const Value.absent(),
    this.tanggalDikembalikan = const Value.absent(),
    this.statusPengembalian = const Value.absent(),
    this.denda = const Value.absent(),
    this.catatan = const Value.absent(),
    this.idAdmin = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PengembalianCompanion.insert({
    this.idPengembalian = const Value.absent(),
    required int idSewa,
    required DateTime tanggalDikembalikan,
    this.statusPengembalian = const Value.absent(),
    this.denda = const Value.absent(),
    this.catatan = const Value.absent(),
    this.idAdmin = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : idSewa = Value(idSewa),
       tanggalDikembalikan = Value(tanggalDikembalikan);
  static Insertable<PengembalianData> custom({
    Expression<int>? idPengembalian,
    Expression<int>? idSewa,
    Expression<DateTime>? tanggalDikembalikan,
    Expression<String>? statusPengembalian,
    Expression<double>? denda,
    Expression<String>? catatan,
    Expression<int>? idAdmin,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (idPengembalian != null) 'id_pengembalian': idPengembalian,
      if (idSewa != null) 'id_sewa': idSewa,
      if (tanggalDikembalikan != null)
        'tanggal_dikembalikan': tanggalDikembalikan,
      if (statusPengembalian != null) 'status_pengembalian': statusPengembalian,
      if (denda != null) 'denda': denda,
      if (catatan != null) 'catatan': catatan,
      if (idAdmin != null) 'id_admin': idAdmin,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PengembalianCompanion copyWith({
    Value<int>? idPengembalian,
    Value<int>? idSewa,
    Value<DateTime>? tanggalDikembalikan,
    Value<String>? statusPengembalian,
    Value<double>? denda,
    Value<String?>? catatan,
    Value<int?>? idAdmin,
    Value<DateTime>? createdAt,
  }) {
    return PengembalianCompanion(
      idPengembalian: idPengembalian ?? this.idPengembalian,
      idSewa: idSewa ?? this.idSewa,
      tanggalDikembalikan: tanggalDikembalikan ?? this.tanggalDikembalikan,
      statusPengembalian: statusPengembalian ?? this.statusPengembalian,
      denda: denda ?? this.denda,
      catatan: catatan ?? this.catatan,
      idAdmin: idAdmin ?? this.idAdmin,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPengembalian.present) {
      map['id_pengembalian'] = Variable<int>(idPengembalian.value);
    }
    if (idSewa.present) {
      map['id_sewa'] = Variable<int>(idSewa.value);
    }
    if (tanggalDikembalikan.present) {
      map['tanggal_dikembalikan'] = Variable<DateTime>(
        tanggalDikembalikan.value,
      );
    }
    if (statusPengembalian.present) {
      map['status_pengembalian'] = Variable<String>(statusPengembalian.value);
    }
    if (denda.present) {
      map['denda'] = Variable<double>(denda.value);
    }
    if (catatan.present) {
      map['catatan'] = Variable<String>(catatan.value);
    }
    if (idAdmin.present) {
      map['id_admin'] = Variable<int>(idAdmin.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PengembalianCompanion(')
          ..write('idPengembalian: $idPengembalian, ')
          ..write('idSewa: $idSewa, ')
          ..write('tanggalDikembalikan: $tanggalDikembalikan, ')
          ..write('statusPengembalian: $statusPengembalian, ')
          ..write('denda: $denda, ')
          ..write('catatan: $catatan, ')
          ..write('idAdmin: $idAdmin, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $KondisiBarangKembaliTable extends KondisiBarangKembali
    with TableInfo<$KondisiBarangKembaliTable, KondisiBarangKembaliData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KondisiBarangKembaliTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idKondisiMeta = const VerificationMeta(
    'idKondisi',
  );
  @override
  late final GeneratedColumn<int> idKondisi = GeneratedColumn<int>(
    'id_kondisi',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idPengembalianMeta = const VerificationMeta(
    'idPengembalian',
  );
  @override
  late final GeneratedColumn<int> idPengembalian = GeneratedColumn<int>(
    'id_pengembalian',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pengembalian (id_pengembalian)',
    ),
  );
  static const VerificationMeta _idBarangMeta = const VerificationMeta(
    'idBarang',
  );
  @override
  late final GeneratedColumn<int> idBarang = GeneratedColumn<int>(
    'id_barang',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES barang (id_barang)',
    ),
  );
  static const VerificationMeta _kondisiMeta = const VerificationMeta(
    'kondisi',
  );
  @override
  late final GeneratedColumn<String> kondisi = GeneratedColumn<String>(
    'kondisi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deskripsiMeta = const VerificationMeta(
    'deskripsi',
  );
  @override
  late final GeneratedColumn<String> deskripsi = GeneratedColumn<String>(
    'deskripsi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fotoBuktiMeta = const VerificationMeta(
    'fotoBukti',
  );
  @override
  late final GeneratedColumn<String> fotoBukti = GeneratedColumn<String>(
    'foto_bukti',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _biayaPerbaikanMeta = const VerificationMeta(
    'biayaPerbaikan',
  );
  @override
  late final GeneratedColumn<double> biayaPerbaikan = GeneratedColumn<double>(
    'biaya_perbaikan',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idKondisi,
    idPengembalian,
    idBarang,
    kondisi,
    deskripsi,
    fotoBukti,
    biayaPerbaikan,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kondisi_barang_kembali';
  @override
  VerificationContext validateIntegrity(
    Insertable<KondisiBarangKembaliData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_kondisi')) {
      context.handle(
        _idKondisiMeta,
        idKondisi.isAcceptableOrUnknown(data['id_kondisi']!, _idKondisiMeta),
      );
    }
    if (data.containsKey('id_pengembalian')) {
      context.handle(
        _idPengembalianMeta,
        idPengembalian.isAcceptableOrUnknown(
          data['id_pengembalian']!,
          _idPengembalianMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idPengembalianMeta);
    }
    if (data.containsKey('id_barang')) {
      context.handle(
        _idBarangMeta,
        idBarang.isAcceptableOrUnknown(data['id_barang']!, _idBarangMeta),
      );
    } else if (isInserting) {
      context.missing(_idBarangMeta);
    }
    if (data.containsKey('kondisi')) {
      context.handle(
        _kondisiMeta,
        kondisi.isAcceptableOrUnknown(data['kondisi']!, _kondisiMeta),
      );
    } else if (isInserting) {
      context.missing(_kondisiMeta);
    }
    if (data.containsKey('deskripsi')) {
      context.handle(
        _deskripsiMeta,
        deskripsi.isAcceptableOrUnknown(data['deskripsi']!, _deskripsiMeta),
      );
    }
    if (data.containsKey('foto_bukti')) {
      context.handle(
        _fotoBuktiMeta,
        fotoBukti.isAcceptableOrUnknown(data['foto_bukti']!, _fotoBuktiMeta),
      );
    }
    if (data.containsKey('biaya_perbaikan')) {
      context.handle(
        _biayaPerbaikanMeta,
        biayaPerbaikan.isAcceptableOrUnknown(
          data['biaya_perbaikan']!,
          _biayaPerbaikanMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idKondisi};
  @override
  KondisiBarangKembaliData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KondisiBarangKembaliData(
      idKondisi: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_kondisi'],
      )!,
      idPengembalian: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_pengembalian'],
      )!,
      idBarang: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_barang'],
      )!,
      kondisi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kondisi'],
      )!,
      deskripsi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deskripsi'],
      ),
      fotoBukti: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}foto_bukti'],
      ),
      biayaPerbaikan: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}biaya_perbaikan'],
      )!,
    );
  }

  @override
  $KondisiBarangKembaliTable createAlias(String alias) {
    return $KondisiBarangKembaliTable(attachedDatabase, alias);
  }
}

class KondisiBarangKembaliData extends DataClass
    implements Insertable<KondisiBarangKembaliData> {
  final int idKondisi;
  final int idPengembalian;
  final int idBarang;
  final String kondisi;
  final String? deskripsi;
  final String? fotoBukti;
  final double biayaPerbaikan;
  const KondisiBarangKembaliData({
    required this.idKondisi,
    required this.idPengembalian,
    required this.idBarang,
    required this.kondisi,
    this.deskripsi,
    this.fotoBukti,
    required this.biayaPerbaikan,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_kondisi'] = Variable<int>(idKondisi);
    map['id_pengembalian'] = Variable<int>(idPengembalian);
    map['id_barang'] = Variable<int>(idBarang);
    map['kondisi'] = Variable<String>(kondisi);
    if (!nullToAbsent || deskripsi != null) {
      map['deskripsi'] = Variable<String>(deskripsi);
    }
    if (!nullToAbsent || fotoBukti != null) {
      map['foto_bukti'] = Variable<String>(fotoBukti);
    }
    map['biaya_perbaikan'] = Variable<double>(biayaPerbaikan);
    return map;
  }

  KondisiBarangKembaliCompanion toCompanion(bool nullToAbsent) {
    return KondisiBarangKembaliCompanion(
      idKondisi: Value(idKondisi),
      idPengembalian: Value(idPengembalian),
      idBarang: Value(idBarang),
      kondisi: Value(kondisi),
      deskripsi: deskripsi == null && nullToAbsent
          ? const Value.absent()
          : Value(deskripsi),
      fotoBukti: fotoBukti == null && nullToAbsent
          ? const Value.absent()
          : Value(fotoBukti),
      biayaPerbaikan: Value(biayaPerbaikan),
    );
  }

  factory KondisiBarangKembaliData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KondisiBarangKembaliData(
      idKondisi: serializer.fromJson<int>(json['idKondisi']),
      idPengembalian: serializer.fromJson<int>(json['idPengembalian']),
      idBarang: serializer.fromJson<int>(json['idBarang']),
      kondisi: serializer.fromJson<String>(json['kondisi']),
      deskripsi: serializer.fromJson<String?>(json['deskripsi']),
      fotoBukti: serializer.fromJson<String?>(json['fotoBukti']),
      biayaPerbaikan: serializer.fromJson<double>(json['biayaPerbaikan']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idKondisi': serializer.toJson<int>(idKondisi),
      'idPengembalian': serializer.toJson<int>(idPengembalian),
      'idBarang': serializer.toJson<int>(idBarang),
      'kondisi': serializer.toJson<String>(kondisi),
      'deskripsi': serializer.toJson<String?>(deskripsi),
      'fotoBukti': serializer.toJson<String?>(fotoBukti),
      'biayaPerbaikan': serializer.toJson<double>(biayaPerbaikan),
    };
  }

  KondisiBarangKembaliData copyWith({
    int? idKondisi,
    int? idPengembalian,
    int? idBarang,
    String? kondisi,
    Value<String?> deskripsi = const Value.absent(),
    Value<String?> fotoBukti = const Value.absent(),
    double? biayaPerbaikan,
  }) => KondisiBarangKembaliData(
    idKondisi: idKondisi ?? this.idKondisi,
    idPengembalian: idPengembalian ?? this.idPengembalian,
    idBarang: idBarang ?? this.idBarang,
    kondisi: kondisi ?? this.kondisi,
    deskripsi: deskripsi.present ? deskripsi.value : this.deskripsi,
    fotoBukti: fotoBukti.present ? fotoBukti.value : this.fotoBukti,
    biayaPerbaikan: biayaPerbaikan ?? this.biayaPerbaikan,
  );
  KondisiBarangKembaliData copyWithCompanion(
    KondisiBarangKembaliCompanion data,
  ) {
    return KondisiBarangKembaliData(
      idKondisi: data.idKondisi.present ? data.idKondisi.value : this.idKondisi,
      idPengembalian: data.idPengembalian.present
          ? data.idPengembalian.value
          : this.idPengembalian,
      idBarang: data.idBarang.present ? data.idBarang.value : this.idBarang,
      kondisi: data.kondisi.present ? data.kondisi.value : this.kondisi,
      deskripsi: data.deskripsi.present ? data.deskripsi.value : this.deskripsi,
      fotoBukti: data.fotoBukti.present ? data.fotoBukti.value : this.fotoBukti,
      biayaPerbaikan: data.biayaPerbaikan.present
          ? data.biayaPerbaikan.value
          : this.biayaPerbaikan,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KondisiBarangKembaliData(')
          ..write('idKondisi: $idKondisi, ')
          ..write('idPengembalian: $idPengembalian, ')
          ..write('idBarang: $idBarang, ')
          ..write('kondisi: $kondisi, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('fotoBukti: $fotoBukti, ')
          ..write('biayaPerbaikan: $biayaPerbaikan')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idKondisi,
    idPengembalian,
    idBarang,
    kondisi,
    deskripsi,
    fotoBukti,
    biayaPerbaikan,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KondisiBarangKembaliData &&
          other.idKondisi == this.idKondisi &&
          other.idPengembalian == this.idPengembalian &&
          other.idBarang == this.idBarang &&
          other.kondisi == this.kondisi &&
          other.deskripsi == this.deskripsi &&
          other.fotoBukti == this.fotoBukti &&
          other.biayaPerbaikan == this.biayaPerbaikan);
}

class KondisiBarangKembaliCompanion
    extends UpdateCompanion<KondisiBarangKembaliData> {
  final Value<int> idKondisi;
  final Value<int> idPengembalian;
  final Value<int> idBarang;
  final Value<String> kondisi;
  final Value<String?> deskripsi;
  final Value<String?> fotoBukti;
  final Value<double> biayaPerbaikan;
  const KondisiBarangKembaliCompanion({
    this.idKondisi = const Value.absent(),
    this.idPengembalian = const Value.absent(),
    this.idBarang = const Value.absent(),
    this.kondisi = const Value.absent(),
    this.deskripsi = const Value.absent(),
    this.fotoBukti = const Value.absent(),
    this.biayaPerbaikan = const Value.absent(),
  });
  KondisiBarangKembaliCompanion.insert({
    this.idKondisi = const Value.absent(),
    required int idPengembalian,
    required int idBarang,
    required String kondisi,
    this.deskripsi = const Value.absent(),
    this.fotoBukti = const Value.absent(),
    this.biayaPerbaikan = const Value.absent(),
  }) : idPengembalian = Value(idPengembalian),
       idBarang = Value(idBarang),
       kondisi = Value(kondisi);
  static Insertable<KondisiBarangKembaliData> custom({
    Expression<int>? idKondisi,
    Expression<int>? idPengembalian,
    Expression<int>? idBarang,
    Expression<String>? kondisi,
    Expression<String>? deskripsi,
    Expression<String>? fotoBukti,
    Expression<double>? biayaPerbaikan,
  }) {
    return RawValuesInsertable({
      if (idKondisi != null) 'id_kondisi': idKondisi,
      if (idPengembalian != null) 'id_pengembalian': idPengembalian,
      if (idBarang != null) 'id_barang': idBarang,
      if (kondisi != null) 'kondisi': kondisi,
      if (deskripsi != null) 'deskripsi': deskripsi,
      if (fotoBukti != null) 'foto_bukti': fotoBukti,
      if (biayaPerbaikan != null) 'biaya_perbaikan': biayaPerbaikan,
    });
  }

  KondisiBarangKembaliCompanion copyWith({
    Value<int>? idKondisi,
    Value<int>? idPengembalian,
    Value<int>? idBarang,
    Value<String>? kondisi,
    Value<String?>? deskripsi,
    Value<String?>? fotoBukti,
    Value<double>? biayaPerbaikan,
  }) {
    return KondisiBarangKembaliCompanion(
      idKondisi: idKondisi ?? this.idKondisi,
      idPengembalian: idPengembalian ?? this.idPengembalian,
      idBarang: idBarang ?? this.idBarang,
      kondisi: kondisi ?? this.kondisi,
      deskripsi: deskripsi ?? this.deskripsi,
      fotoBukti: fotoBukti ?? this.fotoBukti,
      biayaPerbaikan: biayaPerbaikan ?? this.biayaPerbaikan,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idKondisi.present) {
      map['id_kondisi'] = Variable<int>(idKondisi.value);
    }
    if (idPengembalian.present) {
      map['id_pengembalian'] = Variable<int>(idPengembalian.value);
    }
    if (idBarang.present) {
      map['id_barang'] = Variable<int>(idBarang.value);
    }
    if (kondisi.present) {
      map['kondisi'] = Variable<String>(kondisi.value);
    }
    if (deskripsi.present) {
      map['deskripsi'] = Variable<String>(deskripsi.value);
    }
    if (fotoBukti.present) {
      map['foto_bukti'] = Variable<String>(fotoBukti.value);
    }
    if (biayaPerbaikan.present) {
      map['biaya_perbaikan'] = Variable<double>(biayaPerbaikan.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KondisiBarangKembaliCompanion(')
          ..write('idKondisi: $idKondisi, ')
          ..write('idPengembalian: $idPengembalian, ')
          ..write('idBarang: $idBarang, ')
          ..write('kondisi: $kondisi, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('fotoBukti: $fotoBukti, ')
          ..write('biayaPerbaikan: $biayaPerbaikan')
          ..write(')'))
        .toString();
  }
}

class $PembayaranTable extends Pembayaran
    with TableInfo<$PembayaranTable, PembayaranData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PembayaranTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPembayaranMeta = const VerificationMeta(
    'idPembayaran',
  );
  @override
  late final GeneratedColumn<int> idPembayaran = GeneratedColumn<int>(
    'id_pembayaran',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idSewaMeta = const VerificationMeta('idSewa');
  @override
  late final GeneratedColumn<int> idSewa = GeneratedColumn<int>(
    'id_sewa',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES penyewaan (id_sewa)',
    ),
  );
  static const VerificationMeta _jenisPembayaranMeta = const VerificationMeta(
    'jenisPembayaran',
  );
  @override
  late final GeneratedColumn<String> jenisPembayaran = GeneratedColumn<String>(
    'jenis_pembayaran',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _metodePembayaranMeta = const VerificationMeta(
    'metodePembayaran',
  );
  @override
  late final GeneratedColumn<String> metodePembayaran = GeneratedColumn<String>(
    'metode_pembayaran',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jumlahBayarMeta = const VerificationMeta(
    'jumlahBayar',
  );
  @override
  late final GeneratedColumn<double> jumlahBayar = GeneratedColumn<double>(
    'jumlah_bayar',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tanggalBayarMeta = const VerificationMeta(
    'tanggalBayar',
  );
  @override
  late final GeneratedColumn<DateTime> tanggalBayar = GeneratedColumn<DateTime>(
    'tanggal_bayar',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _statusPembayaranMeta = const VerificationMeta(
    'statusPembayaran',
  );
  @override
  late final GeneratedColumn<String> statusPembayaran = GeneratedColumn<String>(
    'status_pembayaran',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _buktiBayarMeta = const VerificationMeta(
    'buktiBayar',
  );
  @override
  late final GeneratedColumn<String> buktiBayar = GeneratedColumn<String>(
    'bukti_bayar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _keteranganMeta = const VerificationMeta(
    'keterangan',
  );
  @override
  late final GeneratedColumn<String> keterangan = GeneratedColumn<String>(
    'keterangan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _idAdminMeta = const VerificationMeta(
    'idAdmin',
  );
  @override
  late final GeneratedColumn<int> idAdmin = GeneratedColumn<int>(
    'id_admin',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id_user)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idPembayaran,
    idSewa,
    jenisPembayaran,
    metodePembayaran,
    jumlahBayar,
    tanggalBayar,
    statusPembayaran,
    buktiBayar,
    keterangan,
    idAdmin,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pembayaran';
  @override
  VerificationContext validateIntegrity(
    Insertable<PembayaranData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_pembayaran')) {
      context.handle(
        _idPembayaranMeta,
        idPembayaran.isAcceptableOrUnknown(
          data['id_pembayaran']!,
          _idPembayaranMeta,
        ),
      );
    }
    if (data.containsKey('id_sewa')) {
      context.handle(
        _idSewaMeta,
        idSewa.isAcceptableOrUnknown(data['id_sewa']!, _idSewaMeta),
      );
    } else if (isInserting) {
      context.missing(_idSewaMeta);
    }
    if (data.containsKey('jenis_pembayaran')) {
      context.handle(
        _jenisPembayaranMeta,
        jenisPembayaran.isAcceptableOrUnknown(
          data['jenis_pembayaran']!,
          _jenisPembayaranMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_jenisPembayaranMeta);
    }
    if (data.containsKey('metode_pembayaran')) {
      context.handle(
        _metodePembayaranMeta,
        metodePembayaran.isAcceptableOrUnknown(
          data['metode_pembayaran']!,
          _metodePembayaranMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_metodePembayaranMeta);
    }
    if (data.containsKey('jumlah_bayar')) {
      context.handle(
        _jumlahBayarMeta,
        jumlahBayar.isAcceptableOrUnknown(
          data['jumlah_bayar']!,
          _jumlahBayarMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_jumlahBayarMeta);
    }
    if (data.containsKey('tanggal_bayar')) {
      context.handle(
        _tanggalBayarMeta,
        tanggalBayar.isAcceptableOrUnknown(
          data['tanggal_bayar']!,
          _tanggalBayarMeta,
        ),
      );
    }
    if (data.containsKey('status_pembayaran')) {
      context.handle(
        _statusPembayaranMeta,
        statusPembayaran.isAcceptableOrUnknown(
          data['status_pembayaran']!,
          _statusPembayaranMeta,
        ),
      );
    }
    if (data.containsKey('bukti_bayar')) {
      context.handle(
        _buktiBayarMeta,
        buktiBayar.isAcceptableOrUnknown(data['bukti_bayar']!, _buktiBayarMeta),
      );
    }
    if (data.containsKey('keterangan')) {
      context.handle(
        _keteranganMeta,
        keterangan.isAcceptableOrUnknown(data['keterangan']!, _keteranganMeta),
      );
    }
    if (data.containsKey('id_admin')) {
      context.handle(
        _idAdminMeta,
        idAdmin.isAcceptableOrUnknown(data['id_admin']!, _idAdminMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPembayaran};
  @override
  PembayaranData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PembayaranData(
      idPembayaran: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_pembayaran'],
      )!,
      idSewa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_sewa'],
      )!,
      jenisPembayaran: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jenis_pembayaran'],
      )!,
      metodePembayaran: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metode_pembayaran'],
      )!,
      jumlahBayar: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}jumlah_bayar'],
      )!,
      tanggalBayar: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}tanggal_bayar'],
      )!,
      statusPembayaran: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_pembayaran'],
      )!,
      buktiBayar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bukti_bayar'],
      ),
      keterangan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}keterangan'],
      ),
      idAdmin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_admin'],
      ),
    );
  }

  @override
  $PembayaranTable createAlias(String alias) {
    return $PembayaranTable(attachedDatabase, alias);
  }
}

class PembayaranData extends DataClass implements Insertable<PembayaranData> {
  final int idPembayaran;
  final int idSewa;
  final String jenisPembayaran;
  final String metodePembayaran;
  final double jumlahBayar;
  final DateTime tanggalBayar;
  final String statusPembayaran;
  final String? buktiBayar;
  final String? keterangan;
  final int? idAdmin;
  const PembayaranData({
    required this.idPembayaran,
    required this.idSewa,
    required this.jenisPembayaran,
    required this.metodePembayaran,
    required this.jumlahBayar,
    required this.tanggalBayar,
    required this.statusPembayaran,
    this.buktiBayar,
    this.keterangan,
    this.idAdmin,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_pembayaran'] = Variable<int>(idPembayaran);
    map['id_sewa'] = Variable<int>(idSewa);
    map['jenis_pembayaran'] = Variable<String>(jenisPembayaran);
    map['metode_pembayaran'] = Variable<String>(metodePembayaran);
    map['jumlah_bayar'] = Variable<double>(jumlahBayar);
    map['tanggal_bayar'] = Variable<DateTime>(tanggalBayar);
    map['status_pembayaran'] = Variable<String>(statusPembayaran);
    if (!nullToAbsent || buktiBayar != null) {
      map['bukti_bayar'] = Variable<String>(buktiBayar);
    }
    if (!nullToAbsent || keterangan != null) {
      map['keterangan'] = Variable<String>(keterangan);
    }
    if (!nullToAbsent || idAdmin != null) {
      map['id_admin'] = Variable<int>(idAdmin);
    }
    return map;
  }

  PembayaranCompanion toCompanion(bool nullToAbsent) {
    return PembayaranCompanion(
      idPembayaran: Value(idPembayaran),
      idSewa: Value(idSewa),
      jenisPembayaran: Value(jenisPembayaran),
      metodePembayaran: Value(metodePembayaran),
      jumlahBayar: Value(jumlahBayar),
      tanggalBayar: Value(tanggalBayar),
      statusPembayaran: Value(statusPembayaran),
      buktiBayar: buktiBayar == null && nullToAbsent
          ? const Value.absent()
          : Value(buktiBayar),
      keterangan: keterangan == null && nullToAbsent
          ? const Value.absent()
          : Value(keterangan),
      idAdmin: idAdmin == null && nullToAbsent
          ? const Value.absent()
          : Value(idAdmin),
    );
  }

  factory PembayaranData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PembayaranData(
      idPembayaran: serializer.fromJson<int>(json['idPembayaran']),
      idSewa: serializer.fromJson<int>(json['idSewa']),
      jenisPembayaran: serializer.fromJson<String>(json['jenisPembayaran']),
      metodePembayaran: serializer.fromJson<String>(json['metodePembayaran']),
      jumlahBayar: serializer.fromJson<double>(json['jumlahBayar']),
      tanggalBayar: serializer.fromJson<DateTime>(json['tanggalBayar']),
      statusPembayaran: serializer.fromJson<String>(json['statusPembayaran']),
      buktiBayar: serializer.fromJson<String?>(json['buktiBayar']),
      keterangan: serializer.fromJson<String?>(json['keterangan']),
      idAdmin: serializer.fromJson<int?>(json['idAdmin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPembayaran': serializer.toJson<int>(idPembayaran),
      'idSewa': serializer.toJson<int>(idSewa),
      'jenisPembayaran': serializer.toJson<String>(jenisPembayaran),
      'metodePembayaran': serializer.toJson<String>(metodePembayaran),
      'jumlahBayar': serializer.toJson<double>(jumlahBayar),
      'tanggalBayar': serializer.toJson<DateTime>(tanggalBayar),
      'statusPembayaran': serializer.toJson<String>(statusPembayaran),
      'buktiBayar': serializer.toJson<String?>(buktiBayar),
      'keterangan': serializer.toJson<String?>(keterangan),
      'idAdmin': serializer.toJson<int?>(idAdmin),
    };
  }

  PembayaranData copyWith({
    int? idPembayaran,
    int? idSewa,
    String? jenisPembayaran,
    String? metodePembayaran,
    double? jumlahBayar,
    DateTime? tanggalBayar,
    String? statusPembayaran,
    Value<String?> buktiBayar = const Value.absent(),
    Value<String?> keterangan = const Value.absent(),
    Value<int?> idAdmin = const Value.absent(),
  }) => PembayaranData(
    idPembayaran: idPembayaran ?? this.idPembayaran,
    idSewa: idSewa ?? this.idSewa,
    jenisPembayaran: jenisPembayaran ?? this.jenisPembayaran,
    metodePembayaran: metodePembayaran ?? this.metodePembayaran,
    jumlahBayar: jumlahBayar ?? this.jumlahBayar,
    tanggalBayar: tanggalBayar ?? this.tanggalBayar,
    statusPembayaran: statusPembayaran ?? this.statusPembayaran,
    buktiBayar: buktiBayar.present ? buktiBayar.value : this.buktiBayar,
    keterangan: keterangan.present ? keterangan.value : this.keterangan,
    idAdmin: idAdmin.present ? idAdmin.value : this.idAdmin,
  );
  PembayaranData copyWithCompanion(PembayaranCompanion data) {
    return PembayaranData(
      idPembayaran: data.idPembayaran.present
          ? data.idPembayaran.value
          : this.idPembayaran,
      idSewa: data.idSewa.present ? data.idSewa.value : this.idSewa,
      jenisPembayaran: data.jenisPembayaran.present
          ? data.jenisPembayaran.value
          : this.jenisPembayaran,
      metodePembayaran: data.metodePembayaran.present
          ? data.metodePembayaran.value
          : this.metodePembayaran,
      jumlahBayar: data.jumlahBayar.present
          ? data.jumlahBayar.value
          : this.jumlahBayar,
      tanggalBayar: data.tanggalBayar.present
          ? data.tanggalBayar.value
          : this.tanggalBayar,
      statusPembayaran: data.statusPembayaran.present
          ? data.statusPembayaran.value
          : this.statusPembayaran,
      buktiBayar: data.buktiBayar.present
          ? data.buktiBayar.value
          : this.buktiBayar,
      keterangan: data.keterangan.present
          ? data.keterangan.value
          : this.keterangan,
      idAdmin: data.idAdmin.present ? data.idAdmin.value : this.idAdmin,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PembayaranData(')
          ..write('idPembayaran: $idPembayaran, ')
          ..write('idSewa: $idSewa, ')
          ..write('jenisPembayaran: $jenisPembayaran, ')
          ..write('metodePembayaran: $metodePembayaran, ')
          ..write('jumlahBayar: $jumlahBayar, ')
          ..write('tanggalBayar: $tanggalBayar, ')
          ..write('statusPembayaran: $statusPembayaran, ')
          ..write('buktiBayar: $buktiBayar, ')
          ..write('keterangan: $keterangan, ')
          ..write('idAdmin: $idAdmin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idPembayaran,
    idSewa,
    jenisPembayaran,
    metodePembayaran,
    jumlahBayar,
    tanggalBayar,
    statusPembayaran,
    buktiBayar,
    keterangan,
    idAdmin,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PembayaranData &&
          other.idPembayaran == this.idPembayaran &&
          other.idSewa == this.idSewa &&
          other.jenisPembayaran == this.jenisPembayaran &&
          other.metodePembayaran == this.metodePembayaran &&
          other.jumlahBayar == this.jumlahBayar &&
          other.tanggalBayar == this.tanggalBayar &&
          other.statusPembayaran == this.statusPembayaran &&
          other.buktiBayar == this.buktiBayar &&
          other.keterangan == this.keterangan &&
          other.idAdmin == this.idAdmin);
}

class PembayaranCompanion extends UpdateCompanion<PembayaranData> {
  final Value<int> idPembayaran;
  final Value<int> idSewa;
  final Value<String> jenisPembayaran;
  final Value<String> metodePembayaran;
  final Value<double> jumlahBayar;
  final Value<DateTime> tanggalBayar;
  final Value<String> statusPembayaran;
  final Value<String?> buktiBayar;
  final Value<String?> keterangan;
  final Value<int?> idAdmin;
  const PembayaranCompanion({
    this.idPembayaran = const Value.absent(),
    this.idSewa = const Value.absent(),
    this.jenisPembayaran = const Value.absent(),
    this.metodePembayaran = const Value.absent(),
    this.jumlahBayar = const Value.absent(),
    this.tanggalBayar = const Value.absent(),
    this.statusPembayaran = const Value.absent(),
    this.buktiBayar = const Value.absent(),
    this.keterangan = const Value.absent(),
    this.idAdmin = const Value.absent(),
  });
  PembayaranCompanion.insert({
    this.idPembayaran = const Value.absent(),
    required int idSewa,
    required String jenisPembayaran,
    required String metodePembayaran,
    required double jumlahBayar,
    this.tanggalBayar = const Value.absent(),
    this.statusPembayaran = const Value.absent(),
    this.buktiBayar = const Value.absent(),
    this.keterangan = const Value.absent(),
    this.idAdmin = const Value.absent(),
  }) : idSewa = Value(idSewa),
       jenisPembayaran = Value(jenisPembayaran),
       metodePembayaran = Value(metodePembayaran),
       jumlahBayar = Value(jumlahBayar);
  static Insertable<PembayaranData> custom({
    Expression<int>? idPembayaran,
    Expression<int>? idSewa,
    Expression<String>? jenisPembayaran,
    Expression<String>? metodePembayaran,
    Expression<double>? jumlahBayar,
    Expression<DateTime>? tanggalBayar,
    Expression<String>? statusPembayaran,
    Expression<String>? buktiBayar,
    Expression<String>? keterangan,
    Expression<int>? idAdmin,
  }) {
    return RawValuesInsertable({
      if (idPembayaran != null) 'id_pembayaran': idPembayaran,
      if (idSewa != null) 'id_sewa': idSewa,
      if (jenisPembayaran != null) 'jenis_pembayaran': jenisPembayaran,
      if (metodePembayaran != null) 'metode_pembayaran': metodePembayaran,
      if (jumlahBayar != null) 'jumlah_bayar': jumlahBayar,
      if (tanggalBayar != null) 'tanggal_bayar': tanggalBayar,
      if (statusPembayaran != null) 'status_pembayaran': statusPembayaran,
      if (buktiBayar != null) 'bukti_bayar': buktiBayar,
      if (keterangan != null) 'keterangan': keterangan,
      if (idAdmin != null) 'id_admin': idAdmin,
    });
  }

  PembayaranCompanion copyWith({
    Value<int>? idPembayaran,
    Value<int>? idSewa,
    Value<String>? jenisPembayaran,
    Value<String>? metodePembayaran,
    Value<double>? jumlahBayar,
    Value<DateTime>? tanggalBayar,
    Value<String>? statusPembayaran,
    Value<String?>? buktiBayar,
    Value<String?>? keterangan,
    Value<int?>? idAdmin,
  }) {
    return PembayaranCompanion(
      idPembayaran: idPembayaran ?? this.idPembayaran,
      idSewa: idSewa ?? this.idSewa,
      jenisPembayaran: jenisPembayaran ?? this.jenisPembayaran,
      metodePembayaran: metodePembayaran ?? this.metodePembayaran,
      jumlahBayar: jumlahBayar ?? this.jumlahBayar,
      tanggalBayar: tanggalBayar ?? this.tanggalBayar,
      statusPembayaran: statusPembayaran ?? this.statusPembayaran,
      buktiBayar: buktiBayar ?? this.buktiBayar,
      keterangan: keterangan ?? this.keterangan,
      idAdmin: idAdmin ?? this.idAdmin,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPembayaran.present) {
      map['id_pembayaran'] = Variable<int>(idPembayaran.value);
    }
    if (idSewa.present) {
      map['id_sewa'] = Variable<int>(idSewa.value);
    }
    if (jenisPembayaran.present) {
      map['jenis_pembayaran'] = Variable<String>(jenisPembayaran.value);
    }
    if (metodePembayaran.present) {
      map['metode_pembayaran'] = Variable<String>(metodePembayaran.value);
    }
    if (jumlahBayar.present) {
      map['jumlah_bayar'] = Variable<double>(jumlahBayar.value);
    }
    if (tanggalBayar.present) {
      map['tanggal_bayar'] = Variable<DateTime>(tanggalBayar.value);
    }
    if (statusPembayaran.present) {
      map['status_pembayaran'] = Variable<String>(statusPembayaran.value);
    }
    if (buktiBayar.present) {
      map['bukti_bayar'] = Variable<String>(buktiBayar.value);
    }
    if (keterangan.present) {
      map['keterangan'] = Variable<String>(keterangan.value);
    }
    if (idAdmin.present) {
      map['id_admin'] = Variable<int>(idAdmin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PembayaranCompanion(')
          ..write('idPembayaran: $idPembayaran, ')
          ..write('idSewa: $idSewa, ')
          ..write('jenisPembayaran: $jenisPembayaran, ')
          ..write('metodePembayaran: $metodePembayaran, ')
          ..write('jumlahBayar: $jumlahBayar, ')
          ..write('tanggalBayar: $tanggalBayar, ')
          ..write('statusPembayaran: $statusPembayaran, ')
          ..write('buktiBayar: $buktiBayar, ')
          ..write('keterangan: $keterangan, ')
          ..write('idAdmin: $idAdmin')
          ..write(')'))
        .toString();
  }
}

class $DokumenPendukungTable extends DokumenPendukung
    with TableInfo<$DokumenPendukungTable, DokumenPendukungData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DokumenPendukungTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idDokumenMeta = const VerificationMeta(
    'idDokumen',
  );
  @override
  late final GeneratedColumn<int> idDokumen = GeneratedColumn<int>(
    'id_dokumen',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idSewaMeta = const VerificationMeta('idSewa');
  @override
  late final GeneratedColumn<int> idSewa = GeneratedColumn<int>(
    'id_sewa',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES penyewaan (id_sewa)',
    ),
  );
  static const VerificationMeta _jenisDokumenMeta = const VerificationMeta(
    'jenisDokumen',
  );
  @override
  late final GeneratedColumn<String> jenisDokumen = GeneratedColumn<String>(
    'jenis_dokumen',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _namaFileMeta = const VerificationMeta(
    'namaFile',
  );
  @override
  late final GeneratedColumn<String> namaFile = GeneratedColumn<String>(
    'nama_file',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pathFileMeta = const VerificationMeta(
    'pathFile',
  );
  @override
  late final GeneratedColumn<String> pathFile = GeneratedColumn<String>(
    'path_file',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tanggalUploadMeta = const VerificationMeta(
    'tanggalUpload',
  );
  @override
  late final GeneratedColumn<DateTime> tanggalUpload =
      GeneratedColumn<DateTime>(
        'tanggal_upload',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _statusVerifikasiMeta = const VerificationMeta(
    'statusVerifikasi',
  );
  @override
  late final GeneratedColumn<String> statusVerifikasi = GeneratedColumn<String>(
    'status_verifikasi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idDokumen,
    idSewa,
    jenisDokumen,
    namaFile,
    pathFile,
    tanggalUpload,
    statusVerifikasi,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dokumen_pendukung';
  @override
  VerificationContext validateIntegrity(
    Insertable<DokumenPendukungData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_dokumen')) {
      context.handle(
        _idDokumenMeta,
        idDokumen.isAcceptableOrUnknown(data['id_dokumen']!, _idDokumenMeta),
      );
    }
    if (data.containsKey('id_sewa')) {
      context.handle(
        _idSewaMeta,
        idSewa.isAcceptableOrUnknown(data['id_sewa']!, _idSewaMeta),
      );
    } else if (isInserting) {
      context.missing(_idSewaMeta);
    }
    if (data.containsKey('jenis_dokumen')) {
      context.handle(
        _jenisDokumenMeta,
        jenisDokumen.isAcceptableOrUnknown(
          data['jenis_dokumen']!,
          _jenisDokumenMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_jenisDokumenMeta);
    }
    if (data.containsKey('nama_file')) {
      context.handle(
        _namaFileMeta,
        namaFile.isAcceptableOrUnknown(data['nama_file']!, _namaFileMeta),
      );
    } else if (isInserting) {
      context.missing(_namaFileMeta);
    }
    if (data.containsKey('path_file')) {
      context.handle(
        _pathFileMeta,
        pathFile.isAcceptableOrUnknown(data['path_file']!, _pathFileMeta),
      );
    } else if (isInserting) {
      context.missing(_pathFileMeta);
    }
    if (data.containsKey('tanggal_upload')) {
      context.handle(
        _tanggalUploadMeta,
        tanggalUpload.isAcceptableOrUnknown(
          data['tanggal_upload']!,
          _tanggalUploadMeta,
        ),
      );
    }
    if (data.containsKey('status_verifikasi')) {
      context.handle(
        _statusVerifikasiMeta,
        statusVerifikasi.isAcceptableOrUnknown(
          data['status_verifikasi']!,
          _statusVerifikasiMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idDokumen};
  @override
  DokumenPendukungData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DokumenPendukungData(
      idDokumen: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_dokumen'],
      )!,
      idSewa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_sewa'],
      )!,
      jenisDokumen: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jenis_dokumen'],
      )!,
      namaFile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_file'],
      )!,
      pathFile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path_file'],
      )!,
      tanggalUpload: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}tanggal_upload'],
      )!,
      statusVerifikasi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_verifikasi'],
      )!,
    );
  }

  @override
  $DokumenPendukungTable createAlias(String alias) {
    return $DokumenPendukungTable(attachedDatabase, alias);
  }
}

class DokumenPendukungData extends DataClass
    implements Insertable<DokumenPendukungData> {
  final int idDokumen;
  final int idSewa;
  final String jenisDokumen;
  final String namaFile;
  final String pathFile;
  final DateTime tanggalUpload;
  final String statusVerifikasi;
  const DokumenPendukungData({
    required this.idDokumen,
    required this.idSewa,
    required this.jenisDokumen,
    required this.namaFile,
    required this.pathFile,
    required this.tanggalUpload,
    required this.statusVerifikasi,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_dokumen'] = Variable<int>(idDokumen);
    map['id_sewa'] = Variable<int>(idSewa);
    map['jenis_dokumen'] = Variable<String>(jenisDokumen);
    map['nama_file'] = Variable<String>(namaFile);
    map['path_file'] = Variable<String>(pathFile);
    map['tanggal_upload'] = Variable<DateTime>(tanggalUpload);
    map['status_verifikasi'] = Variable<String>(statusVerifikasi);
    return map;
  }

  DokumenPendukungCompanion toCompanion(bool nullToAbsent) {
    return DokumenPendukungCompanion(
      idDokumen: Value(idDokumen),
      idSewa: Value(idSewa),
      jenisDokumen: Value(jenisDokumen),
      namaFile: Value(namaFile),
      pathFile: Value(pathFile),
      tanggalUpload: Value(tanggalUpload),
      statusVerifikasi: Value(statusVerifikasi),
    );
  }

  factory DokumenPendukungData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DokumenPendukungData(
      idDokumen: serializer.fromJson<int>(json['idDokumen']),
      idSewa: serializer.fromJson<int>(json['idSewa']),
      jenisDokumen: serializer.fromJson<String>(json['jenisDokumen']),
      namaFile: serializer.fromJson<String>(json['namaFile']),
      pathFile: serializer.fromJson<String>(json['pathFile']),
      tanggalUpload: serializer.fromJson<DateTime>(json['tanggalUpload']),
      statusVerifikasi: serializer.fromJson<String>(json['statusVerifikasi']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idDokumen': serializer.toJson<int>(idDokumen),
      'idSewa': serializer.toJson<int>(idSewa),
      'jenisDokumen': serializer.toJson<String>(jenisDokumen),
      'namaFile': serializer.toJson<String>(namaFile),
      'pathFile': serializer.toJson<String>(pathFile),
      'tanggalUpload': serializer.toJson<DateTime>(tanggalUpload),
      'statusVerifikasi': serializer.toJson<String>(statusVerifikasi),
    };
  }

  DokumenPendukungData copyWith({
    int? idDokumen,
    int? idSewa,
    String? jenisDokumen,
    String? namaFile,
    String? pathFile,
    DateTime? tanggalUpload,
    String? statusVerifikasi,
  }) => DokumenPendukungData(
    idDokumen: idDokumen ?? this.idDokumen,
    idSewa: idSewa ?? this.idSewa,
    jenisDokumen: jenisDokumen ?? this.jenisDokumen,
    namaFile: namaFile ?? this.namaFile,
    pathFile: pathFile ?? this.pathFile,
    tanggalUpload: tanggalUpload ?? this.tanggalUpload,
    statusVerifikasi: statusVerifikasi ?? this.statusVerifikasi,
  );
  DokumenPendukungData copyWithCompanion(DokumenPendukungCompanion data) {
    return DokumenPendukungData(
      idDokumen: data.idDokumen.present ? data.idDokumen.value : this.idDokumen,
      idSewa: data.idSewa.present ? data.idSewa.value : this.idSewa,
      jenisDokumen: data.jenisDokumen.present
          ? data.jenisDokumen.value
          : this.jenisDokumen,
      namaFile: data.namaFile.present ? data.namaFile.value : this.namaFile,
      pathFile: data.pathFile.present ? data.pathFile.value : this.pathFile,
      tanggalUpload: data.tanggalUpload.present
          ? data.tanggalUpload.value
          : this.tanggalUpload,
      statusVerifikasi: data.statusVerifikasi.present
          ? data.statusVerifikasi.value
          : this.statusVerifikasi,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DokumenPendukungData(')
          ..write('idDokumen: $idDokumen, ')
          ..write('idSewa: $idSewa, ')
          ..write('jenisDokumen: $jenisDokumen, ')
          ..write('namaFile: $namaFile, ')
          ..write('pathFile: $pathFile, ')
          ..write('tanggalUpload: $tanggalUpload, ')
          ..write('statusVerifikasi: $statusVerifikasi')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idDokumen,
    idSewa,
    jenisDokumen,
    namaFile,
    pathFile,
    tanggalUpload,
    statusVerifikasi,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DokumenPendukungData &&
          other.idDokumen == this.idDokumen &&
          other.idSewa == this.idSewa &&
          other.jenisDokumen == this.jenisDokumen &&
          other.namaFile == this.namaFile &&
          other.pathFile == this.pathFile &&
          other.tanggalUpload == this.tanggalUpload &&
          other.statusVerifikasi == this.statusVerifikasi);
}

class DokumenPendukungCompanion extends UpdateCompanion<DokumenPendukungData> {
  final Value<int> idDokumen;
  final Value<int> idSewa;
  final Value<String> jenisDokumen;
  final Value<String> namaFile;
  final Value<String> pathFile;
  final Value<DateTime> tanggalUpload;
  final Value<String> statusVerifikasi;
  const DokumenPendukungCompanion({
    this.idDokumen = const Value.absent(),
    this.idSewa = const Value.absent(),
    this.jenisDokumen = const Value.absent(),
    this.namaFile = const Value.absent(),
    this.pathFile = const Value.absent(),
    this.tanggalUpload = const Value.absent(),
    this.statusVerifikasi = const Value.absent(),
  });
  DokumenPendukungCompanion.insert({
    this.idDokumen = const Value.absent(),
    required int idSewa,
    required String jenisDokumen,
    required String namaFile,
    required String pathFile,
    this.tanggalUpload = const Value.absent(),
    this.statusVerifikasi = const Value.absent(),
  }) : idSewa = Value(idSewa),
       jenisDokumen = Value(jenisDokumen),
       namaFile = Value(namaFile),
       pathFile = Value(pathFile);
  static Insertable<DokumenPendukungData> custom({
    Expression<int>? idDokumen,
    Expression<int>? idSewa,
    Expression<String>? jenisDokumen,
    Expression<String>? namaFile,
    Expression<String>? pathFile,
    Expression<DateTime>? tanggalUpload,
    Expression<String>? statusVerifikasi,
  }) {
    return RawValuesInsertable({
      if (idDokumen != null) 'id_dokumen': idDokumen,
      if (idSewa != null) 'id_sewa': idSewa,
      if (jenisDokumen != null) 'jenis_dokumen': jenisDokumen,
      if (namaFile != null) 'nama_file': namaFile,
      if (pathFile != null) 'path_file': pathFile,
      if (tanggalUpload != null) 'tanggal_upload': tanggalUpload,
      if (statusVerifikasi != null) 'status_verifikasi': statusVerifikasi,
    });
  }

  DokumenPendukungCompanion copyWith({
    Value<int>? idDokumen,
    Value<int>? idSewa,
    Value<String>? jenisDokumen,
    Value<String>? namaFile,
    Value<String>? pathFile,
    Value<DateTime>? tanggalUpload,
    Value<String>? statusVerifikasi,
  }) {
    return DokumenPendukungCompanion(
      idDokumen: idDokumen ?? this.idDokumen,
      idSewa: idSewa ?? this.idSewa,
      jenisDokumen: jenisDokumen ?? this.jenisDokumen,
      namaFile: namaFile ?? this.namaFile,
      pathFile: pathFile ?? this.pathFile,
      tanggalUpload: tanggalUpload ?? this.tanggalUpload,
      statusVerifikasi: statusVerifikasi ?? this.statusVerifikasi,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idDokumen.present) {
      map['id_dokumen'] = Variable<int>(idDokumen.value);
    }
    if (idSewa.present) {
      map['id_sewa'] = Variable<int>(idSewa.value);
    }
    if (jenisDokumen.present) {
      map['jenis_dokumen'] = Variable<String>(jenisDokumen.value);
    }
    if (namaFile.present) {
      map['nama_file'] = Variable<String>(namaFile.value);
    }
    if (pathFile.present) {
      map['path_file'] = Variable<String>(pathFile.value);
    }
    if (tanggalUpload.present) {
      map['tanggal_upload'] = Variable<DateTime>(tanggalUpload.value);
    }
    if (statusVerifikasi.present) {
      map['status_verifikasi'] = Variable<String>(statusVerifikasi.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DokumenPendukungCompanion(')
          ..write('idDokumen: $idDokumen, ')
          ..write('idSewa: $idSewa, ')
          ..write('jenisDokumen: $jenisDokumen, ')
          ..write('namaFile: $namaFile, ')
          ..write('pathFile: $pathFile, ')
          ..write('tanggalUpload: $tanggalUpload, ')
          ..write('statusVerifikasi: $statusVerifikasi')
          ..write(')'))
        .toString();
  }
}

class $NotifikasiTable extends Notifikasi
    with TableInfo<$NotifikasiTable, NotifikasiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotifikasiTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idNotifikasiMeta = const VerificationMeta(
    'idNotifikasi',
  );
  @override
  late final GeneratedColumn<int> idNotifikasi = GeneratedColumn<int>(
    'id_notifikasi',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  @override
  late final GeneratedColumn<int> idUser = GeneratedColumn<int>(
    'id_user',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id_user)',
    ),
  );
  static const VerificationMeta _judulMeta = const VerificationMeta('judul');
  @override
  late final GeneratedColumn<String> judul = GeneratedColumn<String>(
    'judul',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pesanMeta = const VerificationMeta('pesan');
  @override
  late final GeneratedColumn<String> pesan = GeneratedColumn<String>(
    'pesan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jenisMeta = const VerificationMeta('jenis');
  @override
  late final GeneratedColumn<String> jenis = GeneratedColumn<String>(
    'jenis',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('info'),
  );
  static const VerificationMeta _statusBacaMeta = const VerificationMeta(
    'statusBaca',
  );
  @override
  late final GeneratedColumn<String> statusBaca = GeneratedColumn<String>(
    'status_baca',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('belum'),
  );
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
    'link',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idNotifikasi,
    idUser,
    judul,
    pesan,
    jenis,
    statusBaca,
    link,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notifikasi';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotifikasiData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_notifikasi')) {
      context.handle(
        _idNotifikasiMeta,
        idNotifikasi.isAcceptableOrUnknown(
          data['id_notifikasi']!,
          _idNotifikasiMeta,
        ),
      );
    }
    if (data.containsKey('id_user')) {
      context.handle(
        _idUserMeta,
        idUser.isAcceptableOrUnknown(data['id_user']!, _idUserMeta),
      );
    } else if (isInserting) {
      context.missing(_idUserMeta);
    }
    if (data.containsKey('judul')) {
      context.handle(
        _judulMeta,
        judul.isAcceptableOrUnknown(data['judul']!, _judulMeta),
      );
    } else if (isInserting) {
      context.missing(_judulMeta);
    }
    if (data.containsKey('pesan')) {
      context.handle(
        _pesanMeta,
        pesan.isAcceptableOrUnknown(data['pesan']!, _pesanMeta),
      );
    } else if (isInserting) {
      context.missing(_pesanMeta);
    }
    if (data.containsKey('jenis')) {
      context.handle(
        _jenisMeta,
        jenis.isAcceptableOrUnknown(data['jenis']!, _jenisMeta),
      );
    }
    if (data.containsKey('status_baca')) {
      context.handle(
        _statusBacaMeta,
        statusBaca.isAcceptableOrUnknown(data['status_baca']!, _statusBacaMeta),
      );
    }
    if (data.containsKey('link')) {
      context.handle(
        _linkMeta,
        link.isAcceptableOrUnknown(data['link']!, _linkMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idNotifikasi};
  @override
  NotifikasiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotifikasiData(
      idNotifikasi: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_notifikasi'],
      )!,
      idUser: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_user'],
      )!,
      judul: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}judul'],
      )!,
      pesan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pesan'],
      )!,
      jenis: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jenis'],
      )!,
      statusBaca: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_baca'],
      )!,
      link: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}link'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $NotifikasiTable createAlias(String alias) {
    return $NotifikasiTable(attachedDatabase, alias);
  }
}

class NotifikasiData extends DataClass implements Insertable<NotifikasiData> {
  final int idNotifikasi;
  final int idUser;
  final String judul;
  final String pesan;
  final String jenis;
  final String statusBaca;
  final String? link;
  final DateTime createdAt;
  const NotifikasiData({
    required this.idNotifikasi,
    required this.idUser,
    required this.judul,
    required this.pesan,
    required this.jenis,
    required this.statusBaca,
    this.link,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_notifikasi'] = Variable<int>(idNotifikasi);
    map['id_user'] = Variable<int>(idUser);
    map['judul'] = Variable<String>(judul);
    map['pesan'] = Variable<String>(pesan);
    map['jenis'] = Variable<String>(jenis);
    map['status_baca'] = Variable<String>(statusBaca);
    if (!nullToAbsent || link != null) {
      map['link'] = Variable<String>(link);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  NotifikasiCompanion toCompanion(bool nullToAbsent) {
    return NotifikasiCompanion(
      idNotifikasi: Value(idNotifikasi),
      idUser: Value(idUser),
      judul: Value(judul),
      pesan: Value(pesan),
      jenis: Value(jenis),
      statusBaca: Value(statusBaca),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
      createdAt: Value(createdAt),
    );
  }

  factory NotifikasiData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotifikasiData(
      idNotifikasi: serializer.fromJson<int>(json['idNotifikasi']),
      idUser: serializer.fromJson<int>(json['idUser']),
      judul: serializer.fromJson<String>(json['judul']),
      pesan: serializer.fromJson<String>(json['pesan']),
      jenis: serializer.fromJson<String>(json['jenis']),
      statusBaca: serializer.fromJson<String>(json['statusBaca']),
      link: serializer.fromJson<String?>(json['link']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idNotifikasi': serializer.toJson<int>(idNotifikasi),
      'idUser': serializer.toJson<int>(idUser),
      'judul': serializer.toJson<String>(judul),
      'pesan': serializer.toJson<String>(pesan),
      'jenis': serializer.toJson<String>(jenis),
      'statusBaca': serializer.toJson<String>(statusBaca),
      'link': serializer.toJson<String?>(link),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  NotifikasiData copyWith({
    int? idNotifikasi,
    int? idUser,
    String? judul,
    String? pesan,
    String? jenis,
    String? statusBaca,
    Value<String?> link = const Value.absent(),
    DateTime? createdAt,
  }) => NotifikasiData(
    idNotifikasi: idNotifikasi ?? this.idNotifikasi,
    idUser: idUser ?? this.idUser,
    judul: judul ?? this.judul,
    pesan: pesan ?? this.pesan,
    jenis: jenis ?? this.jenis,
    statusBaca: statusBaca ?? this.statusBaca,
    link: link.present ? link.value : this.link,
    createdAt: createdAt ?? this.createdAt,
  );
  NotifikasiData copyWithCompanion(NotifikasiCompanion data) {
    return NotifikasiData(
      idNotifikasi: data.idNotifikasi.present
          ? data.idNotifikasi.value
          : this.idNotifikasi,
      idUser: data.idUser.present ? data.idUser.value : this.idUser,
      judul: data.judul.present ? data.judul.value : this.judul,
      pesan: data.pesan.present ? data.pesan.value : this.pesan,
      jenis: data.jenis.present ? data.jenis.value : this.jenis,
      statusBaca: data.statusBaca.present
          ? data.statusBaca.value
          : this.statusBaca,
      link: data.link.present ? data.link.value : this.link,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotifikasiData(')
          ..write('idNotifikasi: $idNotifikasi, ')
          ..write('idUser: $idUser, ')
          ..write('judul: $judul, ')
          ..write('pesan: $pesan, ')
          ..write('jenis: $jenis, ')
          ..write('statusBaca: $statusBaca, ')
          ..write('link: $link, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idNotifikasi,
    idUser,
    judul,
    pesan,
    jenis,
    statusBaca,
    link,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotifikasiData &&
          other.idNotifikasi == this.idNotifikasi &&
          other.idUser == this.idUser &&
          other.judul == this.judul &&
          other.pesan == this.pesan &&
          other.jenis == this.jenis &&
          other.statusBaca == this.statusBaca &&
          other.link == this.link &&
          other.createdAt == this.createdAt);
}

class NotifikasiCompanion extends UpdateCompanion<NotifikasiData> {
  final Value<int> idNotifikasi;
  final Value<int> idUser;
  final Value<String> judul;
  final Value<String> pesan;
  final Value<String> jenis;
  final Value<String> statusBaca;
  final Value<String?> link;
  final Value<DateTime> createdAt;
  const NotifikasiCompanion({
    this.idNotifikasi = const Value.absent(),
    this.idUser = const Value.absent(),
    this.judul = const Value.absent(),
    this.pesan = const Value.absent(),
    this.jenis = const Value.absent(),
    this.statusBaca = const Value.absent(),
    this.link = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  NotifikasiCompanion.insert({
    this.idNotifikasi = const Value.absent(),
    required int idUser,
    required String judul,
    required String pesan,
    this.jenis = const Value.absent(),
    this.statusBaca = const Value.absent(),
    this.link = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : idUser = Value(idUser),
       judul = Value(judul),
       pesan = Value(pesan);
  static Insertable<NotifikasiData> custom({
    Expression<int>? idNotifikasi,
    Expression<int>? idUser,
    Expression<String>? judul,
    Expression<String>? pesan,
    Expression<String>? jenis,
    Expression<String>? statusBaca,
    Expression<String>? link,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (idNotifikasi != null) 'id_notifikasi': idNotifikasi,
      if (idUser != null) 'id_user': idUser,
      if (judul != null) 'judul': judul,
      if (pesan != null) 'pesan': pesan,
      if (jenis != null) 'jenis': jenis,
      if (statusBaca != null) 'status_baca': statusBaca,
      if (link != null) 'link': link,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  NotifikasiCompanion copyWith({
    Value<int>? idNotifikasi,
    Value<int>? idUser,
    Value<String>? judul,
    Value<String>? pesan,
    Value<String>? jenis,
    Value<String>? statusBaca,
    Value<String?>? link,
    Value<DateTime>? createdAt,
  }) {
    return NotifikasiCompanion(
      idNotifikasi: idNotifikasi ?? this.idNotifikasi,
      idUser: idUser ?? this.idUser,
      judul: judul ?? this.judul,
      pesan: pesan ?? this.pesan,
      jenis: jenis ?? this.jenis,
      statusBaca: statusBaca ?? this.statusBaca,
      link: link ?? this.link,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idNotifikasi.present) {
      map['id_notifikasi'] = Variable<int>(idNotifikasi.value);
    }
    if (idUser.present) {
      map['id_user'] = Variable<int>(idUser.value);
    }
    if (judul.present) {
      map['judul'] = Variable<String>(judul.value);
    }
    if (pesan.present) {
      map['pesan'] = Variable<String>(pesan.value);
    }
    if (jenis.present) {
      map['jenis'] = Variable<String>(jenis.value);
    }
    if (statusBaca.present) {
      map['status_baca'] = Variable<String>(statusBaca.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotifikasiCompanion(')
          ..write('idNotifikasi: $idNotifikasi, ')
          ..write('idUser: $idUser, ')
          ..write('judul: $judul, ')
          ..write('pesan: $pesan, ')
          ..write('jenis: $jenis, ')
          ..write('statusBaca: $statusBaca, ')
          ..write('link: $link, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $RiwayatStatusTable extends RiwayatStatus
    with TableInfo<$RiwayatStatusTable, RiwayatStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RiwayatStatusTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idRiwayatMeta = const VerificationMeta(
    'idRiwayat',
  );
  @override
  late final GeneratedColumn<int> idRiwayat = GeneratedColumn<int>(
    'id_riwayat',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idSewaMeta = const VerificationMeta('idSewa');
  @override
  late final GeneratedColumn<int> idSewa = GeneratedColumn<int>(
    'id_sewa',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES penyewaan (id_sewa)',
    ),
  );
  static const VerificationMeta _statusLamaMeta = const VerificationMeta(
    'statusLama',
  );
  @override
  late final GeneratedColumn<String> statusLama = GeneratedColumn<String>(
    'status_lama',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusBaruMeta = const VerificationMeta(
    'statusBaru',
  );
  @override
  late final GeneratedColumn<String> statusBaru = GeneratedColumn<String>(
    'status_baru',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keteranganMeta = const VerificationMeta(
    'keterangan',
  );
  @override
  late final GeneratedColumn<String> keterangan = GeneratedColumn<String>(
    'keterangan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  @override
  late final GeneratedColumn<int> idUser = GeneratedColumn<int>(
    'id_user',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id_user)',
    ),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idRiwayat,
    idSewa,
    statusLama,
    statusBaru,
    keterangan,
    idUser,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'riwayat_status';
  @override
  VerificationContext validateIntegrity(
    Insertable<RiwayatStatusData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_riwayat')) {
      context.handle(
        _idRiwayatMeta,
        idRiwayat.isAcceptableOrUnknown(data['id_riwayat']!, _idRiwayatMeta),
      );
    }
    if (data.containsKey('id_sewa')) {
      context.handle(
        _idSewaMeta,
        idSewa.isAcceptableOrUnknown(data['id_sewa']!, _idSewaMeta),
      );
    } else if (isInserting) {
      context.missing(_idSewaMeta);
    }
    if (data.containsKey('status_lama')) {
      context.handle(
        _statusLamaMeta,
        statusLama.isAcceptableOrUnknown(data['status_lama']!, _statusLamaMeta),
      );
    }
    if (data.containsKey('status_baru')) {
      context.handle(
        _statusBaruMeta,
        statusBaru.isAcceptableOrUnknown(data['status_baru']!, _statusBaruMeta),
      );
    } else if (isInserting) {
      context.missing(_statusBaruMeta);
    }
    if (data.containsKey('keterangan')) {
      context.handle(
        _keteranganMeta,
        keterangan.isAcceptableOrUnknown(data['keterangan']!, _keteranganMeta),
      );
    }
    if (data.containsKey('id_user')) {
      context.handle(
        _idUserMeta,
        idUser.isAcceptableOrUnknown(data['id_user']!, _idUserMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idRiwayat};
  @override
  RiwayatStatusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RiwayatStatusData(
      idRiwayat: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_riwayat'],
      )!,
      idSewa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_sewa'],
      )!,
      statusLama: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_lama'],
      ),
      statusBaru: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_baru'],
      )!,
      keterangan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}keterangan'],
      ),
      idUser: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_user'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RiwayatStatusTable createAlias(String alias) {
    return $RiwayatStatusTable(attachedDatabase, alias);
  }
}

class RiwayatStatusData extends DataClass
    implements Insertable<RiwayatStatusData> {
  final int idRiwayat;
  final int idSewa;
  final String? statusLama;
  final String statusBaru;
  final String? keterangan;
  final int? idUser;
  final DateTime createdAt;
  const RiwayatStatusData({
    required this.idRiwayat,
    required this.idSewa,
    this.statusLama,
    required this.statusBaru,
    this.keterangan,
    this.idUser,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_riwayat'] = Variable<int>(idRiwayat);
    map['id_sewa'] = Variable<int>(idSewa);
    if (!nullToAbsent || statusLama != null) {
      map['status_lama'] = Variable<String>(statusLama);
    }
    map['status_baru'] = Variable<String>(statusBaru);
    if (!nullToAbsent || keterangan != null) {
      map['keterangan'] = Variable<String>(keterangan);
    }
    if (!nullToAbsent || idUser != null) {
      map['id_user'] = Variable<int>(idUser);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RiwayatStatusCompanion toCompanion(bool nullToAbsent) {
    return RiwayatStatusCompanion(
      idRiwayat: Value(idRiwayat),
      idSewa: Value(idSewa),
      statusLama: statusLama == null && nullToAbsent
          ? const Value.absent()
          : Value(statusLama),
      statusBaru: Value(statusBaru),
      keterangan: keterangan == null && nullToAbsent
          ? const Value.absent()
          : Value(keterangan),
      idUser: idUser == null && nullToAbsent
          ? const Value.absent()
          : Value(idUser),
      createdAt: Value(createdAt),
    );
  }

  factory RiwayatStatusData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RiwayatStatusData(
      idRiwayat: serializer.fromJson<int>(json['idRiwayat']),
      idSewa: serializer.fromJson<int>(json['idSewa']),
      statusLama: serializer.fromJson<String?>(json['statusLama']),
      statusBaru: serializer.fromJson<String>(json['statusBaru']),
      keterangan: serializer.fromJson<String?>(json['keterangan']),
      idUser: serializer.fromJson<int?>(json['idUser']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idRiwayat': serializer.toJson<int>(idRiwayat),
      'idSewa': serializer.toJson<int>(idSewa),
      'statusLama': serializer.toJson<String?>(statusLama),
      'statusBaru': serializer.toJson<String>(statusBaru),
      'keterangan': serializer.toJson<String?>(keterangan),
      'idUser': serializer.toJson<int?>(idUser),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RiwayatStatusData copyWith({
    int? idRiwayat,
    int? idSewa,
    Value<String?> statusLama = const Value.absent(),
    String? statusBaru,
    Value<String?> keterangan = const Value.absent(),
    Value<int?> idUser = const Value.absent(),
    DateTime? createdAt,
  }) => RiwayatStatusData(
    idRiwayat: idRiwayat ?? this.idRiwayat,
    idSewa: idSewa ?? this.idSewa,
    statusLama: statusLama.present ? statusLama.value : this.statusLama,
    statusBaru: statusBaru ?? this.statusBaru,
    keterangan: keterangan.present ? keterangan.value : this.keterangan,
    idUser: idUser.present ? idUser.value : this.idUser,
    createdAt: createdAt ?? this.createdAt,
  );
  RiwayatStatusData copyWithCompanion(RiwayatStatusCompanion data) {
    return RiwayatStatusData(
      idRiwayat: data.idRiwayat.present ? data.idRiwayat.value : this.idRiwayat,
      idSewa: data.idSewa.present ? data.idSewa.value : this.idSewa,
      statusLama: data.statusLama.present
          ? data.statusLama.value
          : this.statusLama,
      statusBaru: data.statusBaru.present
          ? data.statusBaru.value
          : this.statusBaru,
      keterangan: data.keterangan.present
          ? data.keterangan.value
          : this.keterangan,
      idUser: data.idUser.present ? data.idUser.value : this.idUser,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RiwayatStatusData(')
          ..write('idRiwayat: $idRiwayat, ')
          ..write('idSewa: $idSewa, ')
          ..write('statusLama: $statusLama, ')
          ..write('statusBaru: $statusBaru, ')
          ..write('keterangan: $keterangan, ')
          ..write('idUser: $idUser, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idRiwayat,
    idSewa,
    statusLama,
    statusBaru,
    keterangan,
    idUser,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RiwayatStatusData &&
          other.idRiwayat == this.idRiwayat &&
          other.idSewa == this.idSewa &&
          other.statusLama == this.statusLama &&
          other.statusBaru == this.statusBaru &&
          other.keterangan == this.keterangan &&
          other.idUser == this.idUser &&
          other.createdAt == this.createdAt);
}

class RiwayatStatusCompanion extends UpdateCompanion<RiwayatStatusData> {
  final Value<int> idRiwayat;
  final Value<int> idSewa;
  final Value<String?> statusLama;
  final Value<String> statusBaru;
  final Value<String?> keterangan;
  final Value<int?> idUser;
  final Value<DateTime> createdAt;
  const RiwayatStatusCompanion({
    this.idRiwayat = const Value.absent(),
    this.idSewa = const Value.absent(),
    this.statusLama = const Value.absent(),
    this.statusBaru = const Value.absent(),
    this.keterangan = const Value.absent(),
    this.idUser = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RiwayatStatusCompanion.insert({
    this.idRiwayat = const Value.absent(),
    required int idSewa,
    this.statusLama = const Value.absent(),
    required String statusBaru,
    this.keterangan = const Value.absent(),
    this.idUser = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : idSewa = Value(idSewa),
       statusBaru = Value(statusBaru);
  static Insertable<RiwayatStatusData> custom({
    Expression<int>? idRiwayat,
    Expression<int>? idSewa,
    Expression<String>? statusLama,
    Expression<String>? statusBaru,
    Expression<String>? keterangan,
    Expression<int>? idUser,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (idRiwayat != null) 'id_riwayat': idRiwayat,
      if (idSewa != null) 'id_sewa': idSewa,
      if (statusLama != null) 'status_lama': statusLama,
      if (statusBaru != null) 'status_baru': statusBaru,
      if (keterangan != null) 'keterangan': keterangan,
      if (idUser != null) 'id_user': idUser,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RiwayatStatusCompanion copyWith({
    Value<int>? idRiwayat,
    Value<int>? idSewa,
    Value<String?>? statusLama,
    Value<String>? statusBaru,
    Value<String?>? keterangan,
    Value<int?>? idUser,
    Value<DateTime>? createdAt,
  }) {
    return RiwayatStatusCompanion(
      idRiwayat: idRiwayat ?? this.idRiwayat,
      idSewa: idSewa ?? this.idSewa,
      statusLama: statusLama ?? this.statusLama,
      statusBaru: statusBaru ?? this.statusBaru,
      keterangan: keterangan ?? this.keterangan,
      idUser: idUser ?? this.idUser,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idRiwayat.present) {
      map['id_riwayat'] = Variable<int>(idRiwayat.value);
    }
    if (idSewa.present) {
      map['id_sewa'] = Variable<int>(idSewa.value);
    }
    if (statusLama.present) {
      map['status_lama'] = Variable<String>(statusLama.value);
    }
    if (statusBaru.present) {
      map['status_baru'] = Variable<String>(statusBaru.value);
    }
    if (keterangan.present) {
      map['keterangan'] = Variable<String>(keterangan.value);
    }
    if (idUser.present) {
      map['id_user'] = Variable<int>(idUser.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RiwayatStatusCompanion(')
          ..write('idRiwayat: $idRiwayat, ')
          ..write('idSewa: $idSewa, ')
          ..write('statusLama: $statusLama, ')
          ..write('statusBaru: $statusBaru, ')
          ..write('keterangan: $keterangan, ')
          ..write('idUser: $idUser, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $LogAktivitasTable extends LogAktivitas
    with TableInfo<$LogAktivitasTable, LogAktivitasData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogAktivitasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idLogMeta = const VerificationMeta('idLog');
  @override
  late final GeneratedColumn<int> idLog = GeneratedColumn<int>(
    'id_log',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  @override
  late final GeneratedColumn<int> idUser = GeneratedColumn<int>(
    'id_user',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id_user)',
    ),
  );
  static const VerificationMeta _aktivitasMeta = const VerificationMeta(
    'aktivitas',
  );
  @override
  late final GeneratedColumn<String> aktivitas = GeneratedColumn<String>(
    'aktivitas',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modulMeta = const VerificationMeta('modul');
  @override
  late final GeneratedColumn<String> modul = GeneratedColumn<String>(
    'modul',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deskripsiMeta = const VerificationMeta(
    'deskripsi',
  );
  @override
  late final GeneratedColumn<String> deskripsi = GeneratedColumn<String>(
    'deskripsi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ipAddressMeta = const VerificationMeta(
    'ipAddress',
  );
  @override
  late final GeneratedColumn<String> ipAddress = GeneratedColumn<String>(
    'ip_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idLog,
    idUser,
    aktivitas,
    modul,
    deskripsi,
    ipAddress,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'log_aktivitas';
  @override
  VerificationContext validateIntegrity(
    Insertable<LogAktivitasData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_log')) {
      context.handle(
        _idLogMeta,
        idLog.isAcceptableOrUnknown(data['id_log']!, _idLogMeta),
      );
    }
    if (data.containsKey('id_user')) {
      context.handle(
        _idUserMeta,
        idUser.isAcceptableOrUnknown(data['id_user']!, _idUserMeta),
      );
    }
    if (data.containsKey('aktivitas')) {
      context.handle(
        _aktivitasMeta,
        aktivitas.isAcceptableOrUnknown(data['aktivitas']!, _aktivitasMeta),
      );
    } else if (isInserting) {
      context.missing(_aktivitasMeta);
    }
    if (data.containsKey('modul')) {
      context.handle(
        _modulMeta,
        modul.isAcceptableOrUnknown(data['modul']!, _modulMeta),
      );
    }
    if (data.containsKey('deskripsi')) {
      context.handle(
        _deskripsiMeta,
        deskripsi.isAcceptableOrUnknown(data['deskripsi']!, _deskripsiMeta),
      );
    }
    if (data.containsKey('ip_address')) {
      context.handle(
        _ipAddressMeta,
        ipAddress.isAcceptableOrUnknown(data['ip_address']!, _ipAddressMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idLog};
  @override
  LogAktivitasData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LogAktivitasData(
      idLog: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_log'],
      )!,
      idUser: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_user'],
      ),
      aktivitas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aktivitas'],
      )!,
      modul: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}modul'],
      ),
      deskripsi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deskripsi'],
      ),
      ipAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ip_address'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LogAktivitasTable createAlias(String alias) {
    return $LogAktivitasTable(attachedDatabase, alias);
  }
}

class LogAktivitasData extends DataClass
    implements Insertable<LogAktivitasData> {
  final int idLog;
  final int? idUser;
  final String aktivitas;
  final String? modul;
  final String? deskripsi;
  final String? ipAddress;
  final DateTime createdAt;
  const LogAktivitasData({
    required this.idLog,
    this.idUser,
    required this.aktivitas,
    this.modul,
    this.deskripsi,
    this.ipAddress,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_log'] = Variable<int>(idLog);
    if (!nullToAbsent || idUser != null) {
      map['id_user'] = Variable<int>(idUser);
    }
    map['aktivitas'] = Variable<String>(aktivitas);
    if (!nullToAbsent || modul != null) {
      map['modul'] = Variable<String>(modul);
    }
    if (!nullToAbsent || deskripsi != null) {
      map['deskripsi'] = Variable<String>(deskripsi);
    }
    if (!nullToAbsent || ipAddress != null) {
      map['ip_address'] = Variable<String>(ipAddress);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LogAktivitasCompanion toCompanion(bool nullToAbsent) {
    return LogAktivitasCompanion(
      idLog: Value(idLog),
      idUser: idUser == null && nullToAbsent
          ? const Value.absent()
          : Value(idUser),
      aktivitas: Value(aktivitas),
      modul: modul == null && nullToAbsent
          ? const Value.absent()
          : Value(modul),
      deskripsi: deskripsi == null && nullToAbsent
          ? const Value.absent()
          : Value(deskripsi),
      ipAddress: ipAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(ipAddress),
      createdAt: Value(createdAt),
    );
  }

  factory LogAktivitasData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LogAktivitasData(
      idLog: serializer.fromJson<int>(json['idLog']),
      idUser: serializer.fromJson<int?>(json['idUser']),
      aktivitas: serializer.fromJson<String>(json['aktivitas']),
      modul: serializer.fromJson<String?>(json['modul']),
      deskripsi: serializer.fromJson<String?>(json['deskripsi']),
      ipAddress: serializer.fromJson<String?>(json['ipAddress']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idLog': serializer.toJson<int>(idLog),
      'idUser': serializer.toJson<int?>(idUser),
      'aktivitas': serializer.toJson<String>(aktivitas),
      'modul': serializer.toJson<String?>(modul),
      'deskripsi': serializer.toJson<String?>(deskripsi),
      'ipAddress': serializer.toJson<String?>(ipAddress),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LogAktivitasData copyWith({
    int? idLog,
    Value<int?> idUser = const Value.absent(),
    String? aktivitas,
    Value<String?> modul = const Value.absent(),
    Value<String?> deskripsi = const Value.absent(),
    Value<String?> ipAddress = const Value.absent(),
    DateTime? createdAt,
  }) => LogAktivitasData(
    idLog: idLog ?? this.idLog,
    idUser: idUser.present ? idUser.value : this.idUser,
    aktivitas: aktivitas ?? this.aktivitas,
    modul: modul.present ? modul.value : this.modul,
    deskripsi: deskripsi.present ? deskripsi.value : this.deskripsi,
    ipAddress: ipAddress.present ? ipAddress.value : this.ipAddress,
    createdAt: createdAt ?? this.createdAt,
  );
  LogAktivitasData copyWithCompanion(LogAktivitasCompanion data) {
    return LogAktivitasData(
      idLog: data.idLog.present ? data.idLog.value : this.idLog,
      idUser: data.idUser.present ? data.idUser.value : this.idUser,
      aktivitas: data.aktivitas.present ? data.aktivitas.value : this.aktivitas,
      modul: data.modul.present ? data.modul.value : this.modul,
      deskripsi: data.deskripsi.present ? data.deskripsi.value : this.deskripsi,
      ipAddress: data.ipAddress.present ? data.ipAddress.value : this.ipAddress,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LogAktivitasData(')
          ..write('idLog: $idLog, ')
          ..write('idUser: $idUser, ')
          ..write('aktivitas: $aktivitas, ')
          ..write('modul: $modul, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idLog,
    idUser,
    aktivitas,
    modul,
    deskripsi,
    ipAddress,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LogAktivitasData &&
          other.idLog == this.idLog &&
          other.idUser == this.idUser &&
          other.aktivitas == this.aktivitas &&
          other.modul == this.modul &&
          other.deskripsi == this.deskripsi &&
          other.ipAddress == this.ipAddress &&
          other.createdAt == this.createdAt);
}

class LogAktivitasCompanion extends UpdateCompanion<LogAktivitasData> {
  final Value<int> idLog;
  final Value<int?> idUser;
  final Value<String> aktivitas;
  final Value<String?> modul;
  final Value<String?> deskripsi;
  final Value<String?> ipAddress;
  final Value<DateTime> createdAt;
  const LogAktivitasCompanion({
    this.idLog = const Value.absent(),
    this.idUser = const Value.absent(),
    this.aktivitas = const Value.absent(),
    this.modul = const Value.absent(),
    this.deskripsi = const Value.absent(),
    this.ipAddress = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  LogAktivitasCompanion.insert({
    this.idLog = const Value.absent(),
    this.idUser = const Value.absent(),
    required String aktivitas,
    this.modul = const Value.absent(),
    this.deskripsi = const Value.absent(),
    this.ipAddress = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : aktivitas = Value(aktivitas);
  static Insertable<LogAktivitasData> custom({
    Expression<int>? idLog,
    Expression<int>? idUser,
    Expression<String>? aktivitas,
    Expression<String>? modul,
    Expression<String>? deskripsi,
    Expression<String>? ipAddress,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (idLog != null) 'id_log': idLog,
      if (idUser != null) 'id_user': idUser,
      if (aktivitas != null) 'aktivitas': aktivitas,
      if (modul != null) 'modul': modul,
      if (deskripsi != null) 'deskripsi': deskripsi,
      if (ipAddress != null) 'ip_address': ipAddress,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  LogAktivitasCompanion copyWith({
    Value<int>? idLog,
    Value<int?>? idUser,
    Value<String>? aktivitas,
    Value<String?>? modul,
    Value<String?>? deskripsi,
    Value<String?>? ipAddress,
    Value<DateTime>? createdAt,
  }) {
    return LogAktivitasCompanion(
      idLog: idLog ?? this.idLog,
      idUser: idUser ?? this.idUser,
      aktivitas: aktivitas ?? this.aktivitas,
      modul: modul ?? this.modul,
      deskripsi: deskripsi ?? this.deskripsi,
      ipAddress: ipAddress ?? this.ipAddress,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idLog.present) {
      map['id_log'] = Variable<int>(idLog.value);
    }
    if (idUser.present) {
      map['id_user'] = Variable<int>(idUser.value);
    }
    if (aktivitas.present) {
      map['aktivitas'] = Variable<String>(aktivitas.value);
    }
    if (modul.present) {
      map['modul'] = Variable<String>(modul.value);
    }
    if (deskripsi.present) {
      map['deskripsi'] = Variable<String>(deskripsi.value);
    }
    if (ipAddress.present) {
      map['ip_address'] = Variable<String>(ipAddress.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogAktivitasCompanion(')
          ..write('idLog: $idLog, ')
          ..write('idUser: $idUser, ')
          ..write('aktivitas: $aktivitas, ')
          ..write('modul: $modul, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $OrganisasiTable organisasi = $OrganisasiTable(this);
  late final $LevelTable level = $LevelTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $UserOrganisasiTable userOrganisasi = $UserOrganisasiTable(this);
  late final $KategoriBarangTable kategoriBarang = $KategoriBarangTable(this);
  late final $BarangTable barang = $BarangTable(this);
  late final $HargaSewaTable hargaSewa = $HargaSewaTable(this);
  late final $PeminjamTable peminjam = $PeminjamTable(this);
  late final $PenyewaanTable penyewaan = $PenyewaanTable(this);
  late final $DetailPenyewaanTable detailPenyewaan = $DetailPenyewaanTable(
    this,
  );
  late final $PengembalianTable pengembalian = $PengembalianTable(this);
  late final $KondisiBarangKembaliTable kondisiBarangKembali =
      $KondisiBarangKembaliTable(this);
  late final $PembayaranTable pembayaran = $PembayaranTable(this);
  late final $DokumenPendukungTable dokumenPendukung = $DokumenPendukungTable(
    this,
  );
  late final $NotifikasiTable notifikasi = $NotifikasiTable(this);
  late final $RiwayatStatusTable riwayatStatus = $RiwayatStatusTable(this);
  late final $LogAktivitasTable logAktivitas = $LogAktivitasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    organisasi,
    level,
    users,
    userOrganisasi,
    kategoriBarang,
    barang,
    hargaSewa,
    peminjam,
    penyewaan,
    detailPenyewaan,
    pengembalian,
    kondisiBarangKembali,
    pembayaran,
    dokumenPendukung,
    notifikasi,
    riwayatStatus,
    logAktivitas,
  ];
}

typedef $$OrganisasiTableCreateCompanionBuilder = OrganisasiCompanion Function({
  Value<int> idOrganisasi,
  required String namaOrganisasi,
  required String singkatan,
  Value<String?> fakultas,
  Value<String?> jurusan,
  Value<String?> alamat,
  Value<String?> email,
  Value<String?> noTelepon,
  Value<String?> namaKetua,
  Value<String?> namaPembina,
  Value<String?> logoPath,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$OrganisasiTableUpdateCompanionBuilder = OrganisasiCompanion Function({
  Value<int> idOrganisasi,
  Value<String> namaOrganisasi,
  Value<String> singkatan,
  Value<String?> fakultas,
  Value<String?> jurusan,
  Value<String?> alamat,
  Value<String?> email,
  Value<String?> noTelepon,
  Value<String?> namaKetua,
  Value<String?> namaPembina,
  Value<String?> logoPath,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$OrganisasiTableReferences
    extends BaseReferences<_$AppDatabase, $OrganisasiTable, OrganisasiData> {
  $$OrganisasiTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UserOrganisasiTable, List<UserOrganisasiData>>
  _userOrganisasiRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userOrganisasi,
    aliasName: 'organisasi__id_organisasi__user_organisasi__id_organisasi',
  );

  $$UserOrganisasiTableProcessedTableManager get userOrganisasiRefs {
    final manager = $$UserOrganisasiTableTableManager($_db, $_db.userOrganisasi)
        .filter(
          (f) => f.idOrganisasi.idOrganisasi.sqlEquals(
            $_itemColumn<int>('id_organisasi')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_userOrganisasiRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BarangTable, List<BarangData>> _barangRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.barang,
    aliasName: 'organisasi__id_organisasi__barang__id_organisasi',
  );

  $$BarangTableProcessedTableManager get barangRefs {
    final manager = $$BarangTableTableManager($_db, $_db.barang).filter(
      (f) => f.idOrganisasi.idOrganisasi.sqlEquals(
        $_itemColumn<int>('id_organisasi')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_barangRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PenyewaanTable, List<PenyewaanData>>
  _penyewaanRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.penyewaan,
    aliasName: 'organisasi__id_organisasi__penyewaan__id_organisasi',
  );

  $$PenyewaanTableProcessedTableManager get penyewaanRefs {
    final manager = $$PenyewaanTableTableManager($_db, $_db.penyewaan).filter(
      (f) => f.idOrganisasi.idOrganisasi.sqlEquals(
        $_itemColumn<int>('id_organisasi')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_penyewaanRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$OrganisasiTableFilterComposer
    extends Composer<_$AppDatabase, $OrganisasiTable> {
  $$OrganisasiTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idOrganisasi => $composableBuilder(
    column: $table.idOrganisasi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaOrganisasi => $composableBuilder(
    column: $table.namaOrganisasi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get singkatan => $composableBuilder(
    column: $table.singkatan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fakultas => $composableBuilder(
    column: $table.fakultas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jurusan => $composableBuilder(
    column: $table.jurusan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alamat => $composableBuilder(
    column: $table.alamat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get noTelepon => $composableBuilder(
    column: $table.noTelepon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaKetua => $composableBuilder(
    column: $table.namaKetua,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaPembina => $composableBuilder(
    column: $table.namaPembina,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> userOrganisasiRefs(
    Expression<bool> Function($$UserOrganisasiTableFilterComposer f) f,
  ) {
    final $$UserOrganisasiTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.userOrganisasi,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserOrganisasiTableFilterComposer(
            $db: $db,
            $table: $db.userOrganisasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> barangRefs(
    Expression<bool> Function($$BarangTableFilterComposer f) f,
  ) {
    final $$BarangTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.barang,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BarangTableFilterComposer(
            $db: $db,
            $table: $db.barang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> penyewaanRefs(
    Expression<bool> Function($$PenyewaanTableFilterComposer f) f,
  ) {
    final $$PenyewaanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableFilterComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrganisasiTableOrderingComposer
    extends Composer<_$AppDatabase, $OrganisasiTable> {
  $$OrganisasiTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idOrganisasi => $composableBuilder(
    column: $table.idOrganisasi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaOrganisasi => $composableBuilder(
    column: $table.namaOrganisasi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get singkatan => $composableBuilder(
    column: $table.singkatan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fakultas => $composableBuilder(
    column: $table.fakultas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jurusan => $composableBuilder(
    column: $table.jurusan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alamat => $composableBuilder(
    column: $table.alamat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get noTelepon => $composableBuilder(
    column: $table.noTelepon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaKetua => $composableBuilder(
    column: $table.namaKetua,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaPembina => $composableBuilder(
    column: $table.namaPembina,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrganisasiTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrganisasiTable> {
  $$OrganisasiTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idOrganisasi => $composableBuilder(
    column: $table.idOrganisasi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get namaOrganisasi => $composableBuilder(
    column: $table.namaOrganisasi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get singkatan =>
      $composableBuilder(column: $table.singkatan, builder: (column) => column);

  GeneratedColumn<String> get fakultas =>
      $composableBuilder(column: $table.fakultas, builder: (column) => column);

  GeneratedColumn<String> get jurusan =>
      $composableBuilder(column: $table.jurusan, builder: (column) => column);

  GeneratedColumn<String> get alamat =>
      $composableBuilder(column: $table.alamat, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get noTelepon =>
      $composableBuilder(column: $table.noTelepon, builder: (column) => column);

  GeneratedColumn<String> get namaKetua =>
      $composableBuilder(column: $table.namaKetua, builder: (column) => column);

  GeneratedColumn<String> get namaPembina => $composableBuilder(
    column: $table.namaPembina,
    builder: (column) => column,
  );

  GeneratedColumn<String> get logoPath =>
      $composableBuilder(column: $table.logoPath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> userOrganisasiRefs<T extends Object>(
    Expression<T> Function($$UserOrganisasiTableAnnotationComposer a) f,
  ) {
    final $$UserOrganisasiTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.userOrganisasi,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserOrganisasiTableAnnotationComposer(
            $db: $db,
            $table: $db.userOrganisasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> barangRefs<T extends Object>(
    Expression<T> Function($$BarangTableAnnotationComposer a) f,
  ) {
    final $$BarangTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.barang,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BarangTableAnnotationComposer(
            $db: $db,
            $table: $db.barang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> penyewaanRefs<T extends Object>(
    Expression<T> Function($$PenyewaanTableAnnotationComposer a) f,
  ) {
    final $$PenyewaanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableAnnotationComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrganisasiTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrganisasiTable,
          OrganisasiData,
          $$OrganisasiTableFilterComposer,
          $$OrganisasiTableOrderingComposer,
          $$OrganisasiTableAnnotationComposer,
          $$OrganisasiTableCreateCompanionBuilder,
          $$OrganisasiTableUpdateCompanionBuilder,
          (OrganisasiData, $$OrganisasiTableReferences),
          OrganisasiData,
          PrefetchHooks Function({
            bool userOrganisasiRefs,
            bool barangRefs,
            bool penyewaanRefs,
          })
        > {
  $$OrganisasiTableTableManager(_$AppDatabase db, $OrganisasiTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrganisasiTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrganisasiTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrganisasiTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idOrganisasi = const Value.absent(),
                Value<String> namaOrganisasi = const Value.absent(),
                Value<String> singkatan = const Value.absent(),
                Value<String?> fakultas = const Value.absent(),
                Value<String?> jurusan = const Value.absent(),
                Value<String?> alamat = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> noTelepon = const Value.absent(),
                Value<String?> namaKetua = const Value.absent(),
                Value<String?> namaPembina = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => OrganisasiCompanion(
                idOrganisasi: idOrganisasi,
                namaOrganisasi: namaOrganisasi,
                singkatan: singkatan,
                fakultas: fakultas,
                jurusan: jurusan,
                alamat: alamat,
                email: email,
                noTelepon: noTelepon,
                namaKetua: namaKetua,
                namaPembina: namaPembina,
                logoPath: logoPath,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> idOrganisasi = const Value.absent(),
                required String namaOrganisasi,
                required String singkatan,
                Value<String?> fakultas = const Value.absent(),
                Value<String?> jurusan = const Value.absent(),
                Value<String?> alamat = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> noTelepon = const Value.absent(),
                Value<String?> namaKetua = const Value.absent(),
                Value<String?> namaPembina = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => OrganisasiCompanion.insert(
                idOrganisasi: idOrganisasi,
                namaOrganisasi: namaOrganisasi,
                singkatan: singkatan,
                fakultas: fakultas,
                jurusan: jurusan,
                alamat: alamat,
                email: email,
                noTelepon: noTelepon,
                namaKetua: namaKetua,
                namaPembina: namaPembina,
                logoPath: logoPath,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$OrganisasiTable, OrganisasiData>(table),
                  $$OrganisasiTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userOrganisasiRefs = false,
                barangRefs = false,
                penyewaanRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (userOrganisasiRefs) db.userOrganisasi,
                    if (barangRefs) db.barang,
                    if (penyewaanRefs) db.penyewaan,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (userOrganisasiRefs)
                        await $_getPrefetchedData<
                          OrganisasiData,
                          $OrganisasiTable,
                          UserOrganisasiData
                        >(
                          currentTable: table,
                          referencedTable: $$OrganisasiTableReferences
                              ._userOrganisasiRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrganisasiTableReferences(
                                db,
                                table,
                                p0,
                              ).userOrganisasiRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idOrganisasi == item.idOrganisasi,
                              ),
                          typedResults: items,
                        ),
                      if (barangRefs)
                        await $_getPrefetchedData<
                          OrganisasiData,
                          $OrganisasiTable,
                          BarangData
                        >(
                          currentTable: table,
                          referencedTable: $$OrganisasiTableReferences
                              ._barangRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrganisasiTableReferences(
                                db,
                                table,
                                p0,
                              ).barangRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idOrganisasi == item.idOrganisasi,
                              ),
                          typedResults: items,
                        ),
                      if (penyewaanRefs)
                        await $_getPrefetchedData<
                          OrganisasiData,
                          $OrganisasiTable,
                          PenyewaanData
                        >(
                          currentTable: table,
                          referencedTable: $$OrganisasiTableReferences
                              ._penyewaanRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrganisasiTableReferences(
                                db,
                                table,
                                p0,
                              ).penyewaanRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idOrganisasi == item.idOrganisasi,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$OrganisasiTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrganisasiTable,
      OrganisasiData,
      $$OrganisasiTableFilterComposer,
      $$OrganisasiTableOrderingComposer,
      $$OrganisasiTableAnnotationComposer,
      $$OrganisasiTableCreateCompanionBuilder,
      $$OrganisasiTableUpdateCompanionBuilder,
      (OrganisasiData, $$OrganisasiTableReferences),
      OrganisasiData,
      PrefetchHooks Function({
        bool userOrganisasiRefs,
        bool barangRefs,
        bool penyewaanRefs,
      })
    >;
typedef $$LevelTableCreateCompanionBuilder = LevelCompanion Function({
  Value<int> idLevel,
  required String namaLevel,
  Value<String?> deskripsi,
  Value<String> statusRecord,
});
typedef $$LevelTableUpdateCompanionBuilder = LevelCompanion Function({
  Value<int> idLevel,
  Value<String> namaLevel,
  Value<String?> deskripsi,
  Value<String> statusRecord,
});

final class $$LevelTableReferences
    extends BaseReferences<_$AppDatabase, $LevelTable, LevelData> {
  $$LevelTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HargaSewaTable, List<HargaSewaData>>
  _hargaSewaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.hargaSewa,
    aliasName: 'level__id_level__harga_sewa__id_level',
  );

  $$HargaSewaTableProcessedTableManager get hargaSewaRefs {
    final manager = $$HargaSewaTableTableManager($_db, $_db.hargaSewa).filter(
      (f) => f.idLevel.idLevel.sqlEquals($_itemColumn<int>('id_level')!),
    );

    final cache = $_typedResult.readTableOrNull(_hargaSewaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LevelTableFilterComposer extends Composer<_$AppDatabase, $LevelTable> {
  $$LevelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idLevel => $composableBuilder(
    column: $table.idLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaLevel => $composableBuilder(
    column: $table.namaLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusRecord => $composableBuilder(
    column: $table.statusRecord,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> hargaSewaRefs(
    Expression<bool> Function($$HargaSewaTableFilterComposer f) f,
  ) {
    final $$HargaSewaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLevel,
      referencedTable: $db.hargaSewa,
      getReferencedColumn: (t) => t.idLevel,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HargaSewaTableFilterComposer(
            $db: $db,
            $table: $db.hargaSewa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LevelTableOrderingComposer
    extends Composer<_$AppDatabase, $LevelTable> {
  $$LevelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idLevel => $composableBuilder(
    column: $table.idLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaLevel => $composableBuilder(
    column: $table.namaLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusRecord => $composableBuilder(
    column: $table.statusRecord,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LevelTableAnnotationComposer
    extends Composer<_$AppDatabase, $LevelTable> {
  $$LevelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idLevel =>
      $composableBuilder(column: $table.idLevel, builder: (column) => column);

  GeneratedColumn<String> get namaLevel =>
      $composableBuilder(column: $table.namaLevel, builder: (column) => column);

  GeneratedColumn<String> get deskripsi =>
      $composableBuilder(column: $table.deskripsi, builder: (column) => column);

  GeneratedColumn<String> get statusRecord => $composableBuilder(
    column: $table.statusRecord,
    builder: (column) => column,
  );

  Expression<T> hargaSewaRefs<T extends Object>(
    Expression<T> Function($$HargaSewaTableAnnotationComposer a) f,
  ) {
    final $$HargaSewaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLevel,
      referencedTable: $db.hargaSewa,
      getReferencedColumn: (t) => t.idLevel,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HargaSewaTableAnnotationComposer(
            $db: $db,
            $table: $db.hargaSewa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LevelTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LevelTable,
          LevelData,
          $$LevelTableFilterComposer,
          $$LevelTableOrderingComposer,
          $$LevelTableAnnotationComposer,
          $$LevelTableCreateCompanionBuilder,
          $$LevelTableUpdateCompanionBuilder,
          (LevelData, $$LevelTableReferences),
          LevelData,
          PrefetchHooks Function({bool hargaSewaRefs})
        > {
  $$LevelTableTableManager(_$AppDatabase db, $LevelTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LevelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LevelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LevelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idLevel = const Value.absent(),
                Value<String> namaLevel = const Value.absent(),
                Value<String?> deskripsi = const Value.absent(),
                Value<String> statusRecord = const Value.absent(),
              }) => LevelCompanion(
                idLevel: idLevel,
                namaLevel: namaLevel,
                deskripsi: deskripsi,
                statusRecord: statusRecord,
              ),
          createCompanionCallback:
              ({
                Value<int> idLevel = const Value.absent(),
                required String namaLevel,
                Value<String?> deskripsi = const Value.absent(),
                Value<String> statusRecord = const Value.absent(),
              }) => LevelCompanion.insert(
                idLevel: idLevel,
                namaLevel: namaLevel,
                deskripsi: deskripsi,
                statusRecord: statusRecord,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LevelTable, LevelData>(table),
                  $$LevelTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({hargaSewaRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (hargaSewaRefs) db.hargaSewa],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (hargaSewaRefs)
                    await $_getPrefetchedData<
                      LevelData,
                      $LevelTable,
                      HargaSewaData
                    >(
                      currentTable: table,
                      referencedTable: $$LevelTableReferences
                          ._hargaSewaRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$LevelTableReferences(db, table, p0).hargaSewaRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idLevel == item.idLevel,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LevelTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LevelTable,
      LevelData,
      $$LevelTableFilterComposer,
      $$LevelTableOrderingComposer,
      $$LevelTableAnnotationComposer,
      $$LevelTableCreateCompanionBuilder,
      $$LevelTableUpdateCompanionBuilder,
      (LevelData, $$LevelTableReferences),
      LevelData,
      PrefetchHooks Function({bool hargaSewaRefs})
    >;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> idUser,
  required String username,
  required String passwordHash,
  required String namaLengkap,
  Value<String?> email,
  Value<String?> noTelepon,
  required String role,
  Value<String> status,
  Value<DateTime?> lastLogin,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> idUser,
  Value<String> username,
  Value<String> passwordHash,
  Value<String> namaLengkap,
  Value<String?> email,
  Value<String?> noTelepon,
  Value<String> role,
  Value<String> status,
  Value<DateTime?> lastLogin,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UserOrganisasiTable, List<UserOrganisasiData>>
  _userOrganisasiRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userOrganisasi,
    aliasName: 'users__id_user__user_organisasi__id_user',
  );

  $$UserOrganisasiTableProcessedTableManager get userOrganisasiRefs {
    final manager = $$UserOrganisasiTableTableManager(
      $_db,
      $_db.userOrganisasi,
    ).filter((f) => f.idUser.idUser.sqlEquals($_itemColumn<int>('id_user')!));

    final cache = $_typedResult.readTableOrNull(_userOrganisasiRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PeminjamTable, List<PeminjamData>>
  _peminjamRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.peminjam,
    aliasName: 'users__id_user__peminjam__id_user',
  );

  $$PeminjamTableProcessedTableManager get peminjamRefs {
    final manager = $$PeminjamTableTableManager(
      $_db,
      $_db.peminjam,
    ).filter((f) => f.idUser.idUser.sqlEquals($_itemColumn<int>('id_user')!));

    final cache = $_typedResult.readTableOrNull(_peminjamRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PenyewaanTable, List<PenyewaanData>>
  _penyewaanRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.penyewaan,
    aliasName: 'users__id_user__penyewaan__id_admin',
  );

  $$PenyewaanTableProcessedTableManager get penyewaanRefs {
    final manager = $$PenyewaanTableTableManager(
      $_db,
      $_db.penyewaan,
    ).filter((f) => f.idAdmin.idUser.sqlEquals($_itemColumn<int>('id_user')!));

    final cache = $_typedResult.readTableOrNull(_penyewaanRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PengembalianTable, List<PengembalianData>>
  _pengembalianRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.pengembalian,
    aliasName: 'users__id_user__pengembalian__id_admin',
  );

  $$PengembalianTableProcessedTableManager get pengembalianRefs {
    final manager = $$PengembalianTableTableManager(
      $_db,
      $_db.pengembalian,
    ).filter((f) => f.idAdmin.idUser.sqlEquals($_itemColumn<int>('id_user')!));

    final cache = $_typedResult.readTableOrNull(_pengembalianRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PembayaranTable, List<PembayaranData>>
  _pembayaranRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.pembayaran,
    aliasName: 'users__id_user__pembayaran__id_admin',
  );

  $$PembayaranTableProcessedTableManager get pembayaranRefs {
    final manager = $$PembayaranTableTableManager(
      $_db,
      $_db.pembayaran,
    ).filter((f) => f.idAdmin.idUser.sqlEquals($_itemColumn<int>('id_user')!));

    final cache = $_typedResult.readTableOrNull(_pembayaranRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$NotifikasiTable, List<NotifikasiData>>
  _notifikasiRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.notifikasi,
    aliasName: 'users__id_user__notifikasi__id_user',
  );

  $$NotifikasiTableProcessedTableManager get notifikasiRefs {
    final manager = $$NotifikasiTableTableManager(
      $_db,
      $_db.notifikasi,
    ).filter((f) => f.idUser.idUser.sqlEquals($_itemColumn<int>('id_user')!));

    final cache = $_typedResult.readTableOrNull(_notifikasiRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RiwayatStatusTable, List<RiwayatStatusData>>
  _riwayatStatusRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.riwayatStatus,
    aliasName: 'users__id_user__riwayat_status__id_user',
  );

  $$RiwayatStatusTableProcessedTableManager get riwayatStatusRefs {
    final manager = $$RiwayatStatusTableTableManager(
      $_db,
      $_db.riwayatStatus,
    ).filter((f) => f.idUser.idUser.sqlEquals($_itemColumn<int>('id_user')!));

    final cache = $_typedResult.readTableOrNull(_riwayatStatusRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LogAktivitasTable, List<LogAktivitasData>>
  _logAktivitasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.logAktivitas,
    aliasName: 'users__id_user__log_aktivitas__id_user',
  );

  $$LogAktivitasTableProcessedTableManager get logAktivitasRefs {
    final manager = $$LogAktivitasTableTableManager(
      $_db,
      $_db.logAktivitas,
    ).filter((f) => f.idUser.idUser.sqlEquals($_itemColumn<int>('id_user')!));

    final cache = $_typedResult.readTableOrNull(_logAktivitasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idUser => $composableBuilder(
    column: $table.idUser,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaLengkap => $composableBuilder(
    column: $table.namaLengkap,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get noTelepon => $composableBuilder(
    column: $table.noTelepon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastLogin => $composableBuilder(
    column: $table.lastLogin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> userOrganisasiRefs(
    Expression<bool> Function($$UserOrganisasiTableFilterComposer f) f,
  ) {
    final $$UserOrganisasiTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.userOrganisasi,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserOrganisasiTableFilterComposer(
            $db: $db,
            $table: $db.userOrganisasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> peminjamRefs(
    Expression<bool> Function($$PeminjamTableFilterComposer f) f,
  ) {
    final $$PeminjamTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.peminjam,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeminjamTableFilterComposer(
            $db: $db,
            $table: $db.peminjam,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> penyewaanRefs(
    Expression<bool> Function($$PenyewaanTableFilterComposer f) f,
  ) {
    final $$PenyewaanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idAdmin,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableFilterComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> pengembalianRefs(
    Expression<bool> Function($$PengembalianTableFilterComposer f) f,
  ) {
    final $$PengembalianTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.pengembalian,
      getReferencedColumn: (t) => t.idAdmin,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PengembalianTableFilterComposer(
            $db: $db,
            $table: $db.pengembalian,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> pembayaranRefs(
    Expression<bool> Function($$PembayaranTableFilterComposer f) f,
  ) {
    final $$PembayaranTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.pembayaran,
      getReferencedColumn: (t) => t.idAdmin,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PembayaranTableFilterComposer(
            $db: $db,
            $table: $db.pembayaran,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> notifikasiRefs(
    Expression<bool> Function($$NotifikasiTableFilterComposer f) f,
  ) {
    final $$NotifikasiTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.notifikasi,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotifikasiTableFilterComposer(
            $db: $db,
            $table: $db.notifikasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> riwayatStatusRefs(
    Expression<bool> Function($$RiwayatStatusTableFilterComposer f) f,
  ) {
    final $$RiwayatStatusTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.riwayatStatus,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RiwayatStatusTableFilterComposer(
            $db: $db,
            $table: $db.riwayatStatus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> logAktivitasRefs(
    Expression<bool> Function($$LogAktivitasTableFilterComposer f) f,
  ) {
    final $$LogAktivitasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.logAktivitas,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogAktivitasTableFilterComposer(
            $db: $db,
            $table: $db.logAktivitas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idUser => $composableBuilder(
    column: $table.idUser,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaLengkap => $composableBuilder(
    column: $table.namaLengkap,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get noTelepon => $composableBuilder(
    column: $table.noTelepon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastLogin => $composableBuilder(
    column: $table.lastLogin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idUser =>
      $composableBuilder(column: $table.idUser, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => column,
  );

  GeneratedColumn<String> get namaLengkap => $composableBuilder(
    column: $table.namaLengkap,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get noTelepon =>
      $composableBuilder(column: $table.noTelepon, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get lastLogin =>
      $composableBuilder(column: $table.lastLogin, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> userOrganisasiRefs<T extends Object>(
    Expression<T> Function($$UserOrganisasiTableAnnotationComposer a) f,
  ) {
    final $$UserOrganisasiTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.userOrganisasi,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserOrganisasiTableAnnotationComposer(
            $db: $db,
            $table: $db.userOrganisasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> peminjamRefs<T extends Object>(
    Expression<T> Function($$PeminjamTableAnnotationComposer a) f,
  ) {
    final $$PeminjamTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.peminjam,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeminjamTableAnnotationComposer(
            $db: $db,
            $table: $db.peminjam,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> penyewaanRefs<T extends Object>(
    Expression<T> Function($$PenyewaanTableAnnotationComposer a) f,
  ) {
    final $$PenyewaanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idAdmin,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableAnnotationComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> pengembalianRefs<T extends Object>(
    Expression<T> Function($$PengembalianTableAnnotationComposer a) f,
  ) {
    final $$PengembalianTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.pengembalian,
      getReferencedColumn: (t) => t.idAdmin,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PengembalianTableAnnotationComposer(
            $db: $db,
            $table: $db.pengembalian,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> pembayaranRefs<T extends Object>(
    Expression<T> Function($$PembayaranTableAnnotationComposer a) f,
  ) {
    final $$PembayaranTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.pembayaran,
      getReferencedColumn: (t) => t.idAdmin,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PembayaranTableAnnotationComposer(
            $db: $db,
            $table: $db.pembayaran,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> notifikasiRefs<T extends Object>(
    Expression<T> Function($$NotifikasiTableAnnotationComposer a) f,
  ) {
    final $$NotifikasiTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.notifikasi,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotifikasiTableAnnotationComposer(
            $db: $db,
            $table: $db.notifikasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> riwayatStatusRefs<T extends Object>(
    Expression<T> Function($$RiwayatStatusTableAnnotationComposer a) f,
  ) {
    final $$RiwayatStatusTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.riwayatStatus,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RiwayatStatusTableAnnotationComposer(
            $db: $db,
            $table: $db.riwayatStatus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> logAktivitasRefs<T extends Object>(
    Expression<T> Function($$LogAktivitasTableAnnotationComposer a) f,
  ) {
    final $$LogAktivitasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.logAktivitas,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogAktivitasTableAnnotationComposer(
            $db: $db,
            $table: $db.logAktivitas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool userOrganisasiRefs,
            bool peminjamRefs,
            bool penyewaanRefs,
            bool pengembalianRefs,
            bool pembayaranRefs,
            bool notifikasiRefs,
            bool riwayatStatusRefs,
            bool logAktivitasRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idUser = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> passwordHash = const Value.absent(),
                Value<String> namaLengkap = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> noTelepon = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> lastLogin = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UsersCompanion(
                idUser: idUser,
                username: username,
                passwordHash: passwordHash,
                namaLengkap: namaLengkap,
                email: email,
                noTelepon: noTelepon,
                role: role,
                status: status,
                lastLogin: lastLogin,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> idUser = const Value.absent(),
                required String username,
                required String passwordHash,
                required String namaLengkap,
                Value<String?> email = const Value.absent(),
                Value<String?> noTelepon = const Value.absent(),
                required String role,
                Value<String> status = const Value.absent(),
                Value<DateTime?> lastLogin = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UsersCompanion.insert(
                idUser: idUser,
                username: username,
                passwordHash: passwordHash,
                namaLengkap: namaLengkap,
                email: email,
                noTelepon: noTelepon,
                role: role,
                status: status,
                lastLogin: lastLogin,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UsersTable, User>(table),
                  $$UsersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userOrganisasiRefs = false,
                peminjamRefs = false,
                penyewaanRefs = false,
                pengembalianRefs = false,
                pembayaranRefs = false,
                notifikasiRefs = false,
                riwayatStatusRefs = false,
                logAktivitasRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (userOrganisasiRefs) db.userOrganisasi,
                    if (peminjamRefs) db.peminjam,
                    if (penyewaanRefs) db.penyewaan,
                    if (pengembalianRefs) db.pengembalian,
                    if (pembayaranRefs) db.pembayaran,
                    if (notifikasiRefs) db.notifikasi,
                    if (riwayatStatusRefs) db.riwayatStatus,
                    if (logAktivitasRefs) db.logAktivitas,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (userOrganisasiRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          UserOrganisasiData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._userOrganisasiRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).userOrganisasiRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idUser == item.idUser,
                              ),
                          typedResults: items,
                        ),
                      if (peminjamRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          PeminjamData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._peminjamRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).peminjamRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idUser == item.idUser,
                              ),
                          typedResults: items,
                        ),
                      if (penyewaanRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          PenyewaanData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._penyewaanRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).penyewaanRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idAdmin == item.idUser,
                              ),
                          typedResults: items,
                        ),
                      if (pengembalianRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          PengembalianData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._pengembalianRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).pengembalianRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idAdmin == item.idUser,
                              ),
                          typedResults: items,
                        ),
                      if (pembayaranRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          PembayaranData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._pembayaranRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).pembayaranRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idAdmin == item.idUser,
                              ),
                          typedResults: items,
                        ),
                      if (notifikasiRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          NotifikasiData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._notifikasiRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).notifikasiRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idUser == item.idUser,
                              ),
                          typedResults: items,
                        ),
                      if (riwayatStatusRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          RiwayatStatusData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._riwayatStatusRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).riwayatStatusRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idUser == item.idUser,
                              ),
                          typedResults: items,
                        ),
                      if (logAktivitasRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          LogAktivitasData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._logAktivitasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).logAktivitasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idUser == item.idUser,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool userOrganisasiRefs,
        bool peminjamRefs,
        bool penyewaanRefs,
        bool pengembalianRefs,
        bool pembayaranRefs,
        bool notifikasiRefs,
        bool riwayatStatusRefs,
        bool logAktivitasRefs,
      })
    >;
typedef $$UserOrganisasiTableCreateCompanionBuilder =
    UserOrganisasiCompanion Function({
      Value<int> idUserOrganisasi,
      required int idUser,
      required int idOrganisasi,
      Value<String?> jabatan,
      Value<String> status,
      Value<DateTime> createdAt,
    });
typedef $$UserOrganisasiTableUpdateCompanionBuilder =
    UserOrganisasiCompanion Function({
      Value<int> idUserOrganisasi,
      Value<int> idUser,
      Value<int> idOrganisasi,
      Value<String?> jabatan,
      Value<String> status,
      Value<DateTime> createdAt,
    });

final class $$UserOrganisasiTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UserOrganisasiTable,
          UserOrganisasiData
        > {
  $$UserOrganisasiTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _idUserTable(_$AppDatabase db) =>
      db.users.createAlias('user_organisasi__id_user__users__id_user');

  $$UsersTableProcessedTableManager get idUser {
    final $_column = $_itemColumn<int>('id_user')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.idUser.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idUserTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $OrganisasiTable _idOrganisasiTable(_$AppDatabase db) => db.organisasi
      .createAlias('user_organisasi__id_organisasi__organisasi__id_organisasi');

  $$OrganisasiTableProcessedTableManager get idOrganisasi {
    final $_column = $_itemColumn<int>('id_organisasi')!;

    final manager = $$OrganisasiTableTableManager(
      $_db,
      $_db.organisasi,
    ).filter((f) => f.idOrganisasi.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idOrganisasiTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserOrganisasiTableFilterComposer
    extends Composer<_$AppDatabase, $UserOrganisasiTable> {
  $$UserOrganisasiTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idUserOrganisasi => $composableBuilder(
    column: $table.idUserOrganisasi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jabatan => $composableBuilder(
    column: $table.jabatan,
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

  $$UsersTableFilterComposer get idUser {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganisasiTableFilterComposer get idOrganisasi {
    final $$OrganisasiTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.organisasi,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganisasiTableFilterComposer(
            $db: $db,
            $table: $db.organisasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserOrganisasiTableOrderingComposer
    extends Composer<_$AppDatabase, $UserOrganisasiTable> {
  $$UserOrganisasiTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idUserOrganisasi => $composableBuilder(
    column: $table.idUserOrganisasi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jabatan => $composableBuilder(
    column: $table.jabatan,
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

  $$UsersTableOrderingComposer get idUser {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganisasiTableOrderingComposer get idOrganisasi {
    final $$OrganisasiTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.organisasi,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganisasiTableOrderingComposer(
            $db: $db,
            $table: $db.organisasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserOrganisasiTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserOrganisasiTable> {
  $$UserOrganisasiTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idUserOrganisasi => $composableBuilder(
    column: $table.idUserOrganisasi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jabatan =>
      $composableBuilder(column: $table.jabatan, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get idUser {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganisasiTableAnnotationComposer get idOrganisasi {
    final $$OrganisasiTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.organisasi,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganisasiTableAnnotationComposer(
            $db: $db,
            $table: $db.organisasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserOrganisasiTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserOrganisasiTable,
          UserOrganisasiData,
          $$UserOrganisasiTableFilterComposer,
          $$UserOrganisasiTableOrderingComposer,
          $$UserOrganisasiTableAnnotationComposer,
          $$UserOrganisasiTableCreateCompanionBuilder,
          $$UserOrganisasiTableUpdateCompanionBuilder,
          (UserOrganisasiData, $$UserOrganisasiTableReferences),
          UserOrganisasiData,
          PrefetchHooks Function({bool idUser, bool idOrganisasi})
        > {
  $$UserOrganisasiTableTableManager(
    _$AppDatabase db,
    $UserOrganisasiTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserOrganisasiTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserOrganisasiTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserOrganisasiTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idUserOrganisasi = const Value.absent(),
                Value<int> idUser = const Value.absent(),
                Value<int> idOrganisasi = const Value.absent(),
                Value<String?> jabatan = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UserOrganisasiCompanion(
                idUserOrganisasi: idUserOrganisasi,
                idUser: idUser,
                idOrganisasi: idOrganisasi,
                jabatan: jabatan,
                status: status,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> idUserOrganisasi = const Value.absent(),
                required int idUser,
                required int idOrganisasi,
                Value<String?> jabatan = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UserOrganisasiCompanion.insert(
                idUserOrganisasi: idUserOrganisasi,
                idUser: idUser,
                idOrganisasi: idOrganisasi,
                jabatan: jabatan,
                status: status,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UserOrganisasiTable, UserOrganisasiData>(table),
                  $$UserOrganisasiTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idUser = false, idOrganisasi = false}) {
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
                    if (idUser) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idUser,
                        referencedTable: $$UserOrganisasiTableReferences
                            ._idUserTable(db),
                        referencedColumn: $$UserOrganisasiTableReferences
                            ._idUserTable(db)
                            .idUser,
                      ) as T;
                    }
                    if (idOrganisasi) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idOrganisasi,
                        referencedTable: $$UserOrganisasiTableReferences
                            ._idOrganisasiTable(db),
                        referencedColumn: $$UserOrganisasiTableReferences
                            ._idOrganisasiTable(db)
                            .idOrganisasi,
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

typedef $$UserOrganisasiTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserOrganisasiTable,
      UserOrganisasiData,
      $$UserOrganisasiTableFilterComposer,
      $$UserOrganisasiTableOrderingComposer,
      $$UserOrganisasiTableAnnotationComposer,
      $$UserOrganisasiTableCreateCompanionBuilder,
      $$UserOrganisasiTableUpdateCompanionBuilder,
      (UserOrganisasiData, $$UserOrganisasiTableReferences),
      UserOrganisasiData,
      PrefetchHooks Function({bool idUser, bool idOrganisasi})
    >;
typedef $$KategoriBarangTableCreateCompanionBuilder =
    KategoriBarangCompanion Function({
      Value<int> idKategori,
      required String namaKategori,
      Value<String?> deskripsi,
      Value<String> statusRecord,
      Value<DateTime> createdAt,
    });
typedef $$KategoriBarangTableUpdateCompanionBuilder =
    KategoriBarangCompanion Function({
      Value<int> idKategori,
      Value<String> namaKategori,
      Value<String?> deskripsi,
      Value<String> statusRecord,
      Value<DateTime> createdAt,
    });

final class $$KategoriBarangTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $KategoriBarangTable,
          KategoriBarangData
        > {
  $$KategoriBarangTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$BarangTable, List<BarangData>> _barangRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.barang,
    aliasName: 'kategori_barang__id_kategori__barang__id_kategori',
  );

  $$BarangTableProcessedTableManager get barangRefs {
    final manager = $$BarangTableTableManager($_db, $_db.barang).filter(
      (f) =>
          f.idKategori.idKategori.sqlEquals($_itemColumn<int>('id_kategori')!),
    );

    final cache = $_typedResult.readTableOrNull(_barangRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$KategoriBarangTableFilterComposer
    extends Composer<_$AppDatabase, $KategoriBarangTable> {
  $$KategoriBarangTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idKategori => $composableBuilder(
    column: $table.idKategori,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaKategori => $composableBuilder(
    column: $table.namaKategori,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusRecord => $composableBuilder(
    column: $table.statusRecord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> barangRefs(
    Expression<bool> Function($$BarangTableFilterComposer f) f,
  ) {
    final $$BarangTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idKategori,
      referencedTable: $db.barang,
      getReferencedColumn: (t) => t.idKategori,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BarangTableFilterComposer(
            $db: $db,
            $table: $db.barang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$KategoriBarangTableOrderingComposer
    extends Composer<_$AppDatabase, $KategoriBarangTable> {
  $$KategoriBarangTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idKategori => $composableBuilder(
    column: $table.idKategori,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaKategori => $composableBuilder(
    column: $table.namaKategori,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusRecord => $composableBuilder(
    column: $table.statusRecord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KategoriBarangTableAnnotationComposer
    extends Composer<_$AppDatabase, $KategoriBarangTable> {
  $$KategoriBarangTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idKategori => $composableBuilder(
    column: $table.idKategori,
    builder: (column) => column,
  );

  GeneratedColumn<String> get namaKategori => $composableBuilder(
    column: $table.namaKategori,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deskripsi =>
      $composableBuilder(column: $table.deskripsi, builder: (column) => column);

  GeneratedColumn<String> get statusRecord => $composableBuilder(
    column: $table.statusRecord,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> barangRefs<T extends Object>(
    Expression<T> Function($$BarangTableAnnotationComposer a) f,
  ) {
    final $$BarangTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idKategori,
      referencedTable: $db.barang,
      getReferencedColumn: (t) => t.idKategori,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BarangTableAnnotationComposer(
            $db: $db,
            $table: $db.barang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$KategoriBarangTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KategoriBarangTable,
          KategoriBarangData,
          $$KategoriBarangTableFilterComposer,
          $$KategoriBarangTableOrderingComposer,
          $$KategoriBarangTableAnnotationComposer,
          $$KategoriBarangTableCreateCompanionBuilder,
          $$KategoriBarangTableUpdateCompanionBuilder,
          (KategoriBarangData, $$KategoriBarangTableReferences),
          KategoriBarangData,
          PrefetchHooks Function({bool barangRefs})
        > {
  $$KategoriBarangTableTableManager(
    _$AppDatabase db,
    $KategoriBarangTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KategoriBarangTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KategoriBarangTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KategoriBarangTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idKategori = const Value.absent(),
                Value<String> namaKategori = const Value.absent(),
                Value<String?> deskripsi = const Value.absent(),
                Value<String> statusRecord = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => KategoriBarangCompanion(
                idKategori: idKategori,
                namaKategori: namaKategori,
                deskripsi: deskripsi,
                statusRecord: statusRecord,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> idKategori = const Value.absent(),
                required String namaKategori,
                Value<String?> deskripsi = const Value.absent(),
                Value<String> statusRecord = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => KategoriBarangCompanion.insert(
                idKategori: idKategori,
                namaKategori: namaKategori,
                deskripsi: deskripsi,
                statusRecord: statusRecord,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$KategoriBarangTable, KategoriBarangData>(table),
                  $$KategoriBarangTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({barangRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (barangRefs) db.barang],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (barangRefs)
                    await $_getPrefetchedData<
                      KategoriBarangData,
                      $KategoriBarangTable,
                      BarangData
                    >(
                      currentTable: table,
                      referencedTable: $$KategoriBarangTableReferences
                          ._barangRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$KategoriBarangTableReferences(
                            db,
                            table,
                            p0,
                          ).barangRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idKategori == item.idKategori,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$KategoriBarangTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KategoriBarangTable,
      KategoriBarangData,
      $$KategoriBarangTableFilterComposer,
      $$KategoriBarangTableOrderingComposer,
      $$KategoriBarangTableAnnotationComposer,
      $$KategoriBarangTableCreateCompanionBuilder,
      $$KategoriBarangTableUpdateCompanionBuilder,
      (KategoriBarangData, $$KategoriBarangTableReferences),
      KategoriBarangData,
      PrefetchHooks Function({bool barangRefs})
    >;
typedef $$BarangTableCreateCompanionBuilder = BarangCompanion Function({
  Value<int> idBarang,
  required int idKategori,
  required int idOrganisasi,
  required String namaBarang,
  Value<String?> deskripsi,
  Value<String?> fotoBarang,
  Value<int> stokTotal,
  Value<int> stokTersedia,
  Value<String> kondisi,
  Value<String> statusRecord,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$BarangTableUpdateCompanionBuilder = BarangCompanion Function({
  Value<int> idBarang,
  Value<int> idKategori,
  Value<int> idOrganisasi,
  Value<String> namaBarang,
  Value<String?> deskripsi,
  Value<String?> fotoBarang,
  Value<int> stokTotal,
  Value<int> stokTersedia,
  Value<String> kondisi,
  Value<String> statusRecord,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$BarangTableReferences
    extends BaseReferences<_$AppDatabase, $BarangTable, BarangData> {
  $$BarangTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $KategoriBarangTable _idKategoriTable(_$AppDatabase db) => db
      .kategoriBarang
      .createAlias('barang__id_kategori__kategori_barang__id_kategori');

  $$KategoriBarangTableProcessedTableManager get idKategori {
    final $_column = $_itemColumn<int>('id_kategori')!;

    final manager = $$KategoriBarangTableTableManager(
      $_db,
      $_db.kategoriBarang,
    ).filter((f) => f.idKategori.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idKategoriTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $OrganisasiTable _idOrganisasiTable(_$AppDatabase db) => db.organisasi
      .createAlias('barang__id_organisasi__organisasi__id_organisasi');

  $$OrganisasiTableProcessedTableManager get idOrganisasi {
    final $_column = $_itemColumn<int>('id_organisasi')!;

    final manager = $$OrganisasiTableTableManager(
      $_db,
      $_db.organisasi,
    ).filter((f) => f.idOrganisasi.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idOrganisasiTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$HargaSewaTable, List<HargaSewaData>>
  _hargaSewaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.hargaSewa,
    aliasName: 'barang__id_barang__harga_sewa__id_barang',
  );

  $$HargaSewaTableProcessedTableManager get hargaSewaRefs {
    final manager = $$HargaSewaTableTableManager($_db, $_db.hargaSewa).filter(
      (f) => f.idBarang.idBarang.sqlEquals($_itemColumn<int>('id_barang')!),
    );

    final cache = $_typedResult.readTableOrNull(_hargaSewaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DetailPenyewaanTable, List<DetailPenyewaanData>>
  _detailPenyewaanRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.detailPenyewaan,
    aliasName: 'barang__id_barang__detail_penyewaan__id_barang',
  );

  $$DetailPenyewaanTableProcessedTableManager get detailPenyewaanRefs {
    final manager =
        $$DetailPenyewaanTableTableManager($_db, $_db.detailPenyewaan).filter(
          (f) => f.idBarang.idBarang.sqlEquals($_itemColumn<int>('id_barang')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _detailPenyewaanRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $KondisiBarangKembaliTable,
    List<KondisiBarangKembaliData>
  >
  _kondisiBarangKembaliRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.kondisiBarangKembali,
        aliasName: 'barang__id_barang__kondisi_barang_kembali__id_barang',
      );

  $$KondisiBarangKembaliTableProcessedTableManager
  get kondisiBarangKembaliRefs {
    final manager =
        $$KondisiBarangKembaliTableTableManager(
          $_db,
          $_db.kondisiBarangKembali,
        ).filter(
          (f) => f.idBarang.idBarang.sqlEquals($_itemColumn<int>('id_barang')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _kondisiBarangKembaliRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BarangTableFilterComposer
    extends Composer<_$AppDatabase, $BarangTable> {
  $$BarangTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idBarang => $composableBuilder(
    column: $table.idBarang,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaBarang => $composableBuilder(
    column: $table.namaBarang,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fotoBarang => $composableBuilder(
    column: $table.fotoBarang,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stokTotal => $composableBuilder(
    column: $table.stokTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stokTersedia => $composableBuilder(
    column: $table.stokTersedia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kondisi => $composableBuilder(
    column: $table.kondisi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusRecord => $composableBuilder(
    column: $table.statusRecord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$KategoriBarangTableFilterComposer get idKategori {
    final $$KategoriBarangTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idKategori,
      referencedTable: $db.kategoriBarang,
      getReferencedColumn: (t) => t.idKategori,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KategoriBarangTableFilterComposer(
            $db: $db,
            $table: $db.kategoriBarang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganisasiTableFilterComposer get idOrganisasi {
    final $$OrganisasiTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.organisasi,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganisasiTableFilterComposer(
            $db: $db,
            $table: $db.organisasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> hargaSewaRefs(
    Expression<bool> Function($$HargaSewaTableFilterComposer f) f,
  ) {
    final $$HargaSewaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.hargaSewa,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HargaSewaTableFilterComposer(
            $db: $db,
            $table: $db.hargaSewa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> detailPenyewaanRefs(
    Expression<bool> Function($$DetailPenyewaanTableFilterComposer f) f,
  ) {
    final $$DetailPenyewaanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.detailPenyewaan,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetailPenyewaanTableFilterComposer(
            $db: $db,
            $table: $db.detailPenyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> kondisiBarangKembaliRefs(
    Expression<bool> Function($$KondisiBarangKembaliTableFilterComposer f) f,
  ) {
    final $$KondisiBarangKembaliTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.kondisiBarangKembali,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KondisiBarangKembaliTableFilterComposer(
            $db: $db,
            $table: $db.kondisiBarangKembali,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BarangTableOrderingComposer
    extends Composer<_$AppDatabase, $BarangTable> {
  $$BarangTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idBarang => $composableBuilder(
    column: $table.idBarang,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaBarang => $composableBuilder(
    column: $table.namaBarang,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fotoBarang => $composableBuilder(
    column: $table.fotoBarang,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stokTotal => $composableBuilder(
    column: $table.stokTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stokTersedia => $composableBuilder(
    column: $table.stokTersedia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kondisi => $composableBuilder(
    column: $table.kondisi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusRecord => $composableBuilder(
    column: $table.statusRecord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$KategoriBarangTableOrderingComposer get idKategori {
    final $$KategoriBarangTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idKategori,
      referencedTable: $db.kategoriBarang,
      getReferencedColumn: (t) => t.idKategori,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KategoriBarangTableOrderingComposer(
            $db: $db,
            $table: $db.kategoriBarang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganisasiTableOrderingComposer get idOrganisasi {
    final $$OrganisasiTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.organisasi,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganisasiTableOrderingComposer(
            $db: $db,
            $table: $db.organisasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BarangTableAnnotationComposer
    extends Composer<_$AppDatabase, $BarangTable> {
  $$BarangTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idBarang =>
      $composableBuilder(column: $table.idBarang, builder: (column) => column);

  GeneratedColumn<String> get namaBarang => $composableBuilder(
    column: $table.namaBarang,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deskripsi =>
      $composableBuilder(column: $table.deskripsi, builder: (column) => column);

  GeneratedColumn<String> get fotoBarang => $composableBuilder(
    column: $table.fotoBarang,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stokTotal =>
      $composableBuilder(column: $table.stokTotal, builder: (column) => column);

  GeneratedColumn<int> get stokTersedia => $composableBuilder(
    column: $table.stokTersedia,
    builder: (column) => column,
  );

  GeneratedColumn<String> get kondisi =>
      $composableBuilder(column: $table.kondisi, builder: (column) => column);

  GeneratedColumn<String> get statusRecord => $composableBuilder(
    column: $table.statusRecord,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$KategoriBarangTableAnnotationComposer get idKategori {
    final $$KategoriBarangTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idKategori,
      referencedTable: $db.kategoriBarang,
      getReferencedColumn: (t) => t.idKategori,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KategoriBarangTableAnnotationComposer(
            $db: $db,
            $table: $db.kategoriBarang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganisasiTableAnnotationComposer get idOrganisasi {
    final $$OrganisasiTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.organisasi,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganisasiTableAnnotationComposer(
            $db: $db,
            $table: $db.organisasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> hargaSewaRefs<T extends Object>(
    Expression<T> Function($$HargaSewaTableAnnotationComposer a) f,
  ) {
    final $$HargaSewaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.hargaSewa,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HargaSewaTableAnnotationComposer(
            $db: $db,
            $table: $db.hargaSewa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> detailPenyewaanRefs<T extends Object>(
    Expression<T> Function($$DetailPenyewaanTableAnnotationComposer a) f,
  ) {
    final $$DetailPenyewaanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.detailPenyewaan,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetailPenyewaanTableAnnotationComposer(
            $db: $db,
            $table: $db.detailPenyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> kondisiBarangKembaliRefs<T extends Object>(
    Expression<T> Function($$KondisiBarangKembaliTableAnnotationComposer a) f,
  ) {
    final $$KondisiBarangKembaliTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idBarang,
          referencedTable: $db.kondisiBarangKembali,
          getReferencedColumn: (t) => t.idBarang,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$KondisiBarangKembaliTableAnnotationComposer(
                $db: $db,
                $table: $db.kondisiBarangKembali,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$BarangTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BarangTable,
          BarangData,
          $$BarangTableFilterComposer,
          $$BarangTableOrderingComposer,
          $$BarangTableAnnotationComposer,
          $$BarangTableCreateCompanionBuilder,
          $$BarangTableUpdateCompanionBuilder,
          (BarangData, $$BarangTableReferences),
          BarangData,
          PrefetchHooks Function({
            bool idKategori,
            bool idOrganisasi,
            bool hargaSewaRefs,
            bool detailPenyewaanRefs,
            bool kondisiBarangKembaliRefs,
          })
        > {
  $$BarangTableTableManager(_$AppDatabase db, $BarangTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BarangTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BarangTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BarangTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idBarang = const Value.absent(),
                Value<int> idKategori = const Value.absent(),
                Value<int> idOrganisasi = const Value.absent(),
                Value<String> namaBarang = const Value.absent(),
                Value<String?> deskripsi = const Value.absent(),
                Value<String?> fotoBarang = const Value.absent(),
                Value<int> stokTotal = const Value.absent(),
                Value<int> stokTersedia = const Value.absent(),
                Value<String> kondisi = const Value.absent(),
                Value<String> statusRecord = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BarangCompanion(
                idBarang: idBarang,
                idKategori: idKategori,
                idOrganisasi: idOrganisasi,
                namaBarang: namaBarang,
                deskripsi: deskripsi,
                fotoBarang: fotoBarang,
                stokTotal: stokTotal,
                stokTersedia: stokTersedia,
                kondisi: kondisi,
                statusRecord: statusRecord,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> idBarang = const Value.absent(),
                required int idKategori,
                required int idOrganisasi,
                required String namaBarang,
                Value<String?> deskripsi = const Value.absent(),
                Value<String?> fotoBarang = const Value.absent(),
                Value<int> stokTotal = const Value.absent(),
                Value<int> stokTersedia = const Value.absent(),
                Value<String> kondisi = const Value.absent(),
                Value<String> statusRecord = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BarangCompanion.insert(
                idBarang: idBarang,
                idKategori: idKategori,
                idOrganisasi: idOrganisasi,
                namaBarang: namaBarang,
                deskripsi: deskripsi,
                fotoBarang: fotoBarang,
                stokTotal: stokTotal,
                stokTersedia: stokTersedia,
                kondisi: kondisi,
                statusRecord: statusRecord,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BarangTable, BarangData>(table),
                  $$BarangTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                idKategori = false,
                idOrganisasi = false,
                hargaSewaRefs = false,
                detailPenyewaanRefs = false,
                kondisiBarangKembaliRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (hargaSewaRefs) db.hargaSewa,
                    if (detailPenyewaanRefs) db.detailPenyewaan,
                    if (kondisiBarangKembaliRefs) db.kondisiBarangKembali,
                  ],
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
                        if (idKategori) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.idKategori,
                            referencedTable: $$BarangTableReferences
                                ._idKategoriTable(db),
                            referencedColumn: $$BarangTableReferences
                                ._idKategoriTable(db)
                                .idKategori,
                          ) as T;
                        }
                        if (idOrganisasi) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.idOrganisasi,
                            referencedTable: $$BarangTableReferences
                                ._idOrganisasiTable(db),
                            referencedColumn: $$BarangTableReferences
                                ._idOrganisasiTable(db)
                                .idOrganisasi,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (hargaSewaRefs)
                        await $_getPrefetchedData<
                          BarangData,
                          $BarangTable,
                          HargaSewaData
                        >(
                          currentTable: table,
                          referencedTable: $$BarangTableReferences
                              ._hargaSewaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BarangTableReferences(
                                db,
                                table,
                                p0,
                              ).hargaSewaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idBarang == item.idBarang,
                              ),
                          typedResults: items,
                        ),
                      if (detailPenyewaanRefs)
                        await $_getPrefetchedData<
                          BarangData,
                          $BarangTable,
                          DetailPenyewaanData
                        >(
                          currentTable: table,
                          referencedTable: $$BarangTableReferences
                              ._detailPenyewaanRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BarangTableReferences(
                                db,
                                table,
                                p0,
                              ).detailPenyewaanRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idBarang == item.idBarang,
                              ),
                          typedResults: items,
                        ),
                      if (kondisiBarangKembaliRefs)
                        await $_getPrefetchedData<
                          BarangData,
                          $BarangTable,
                          KondisiBarangKembaliData
                        >(
                          currentTable: table,
                          referencedTable: $$BarangTableReferences
                              ._kondisiBarangKembaliRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BarangTableReferences(
                                db,
                                table,
                                p0,
                              ).kondisiBarangKembaliRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idBarang == item.idBarang,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BarangTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BarangTable,
      BarangData,
      $$BarangTableFilterComposer,
      $$BarangTableOrderingComposer,
      $$BarangTableAnnotationComposer,
      $$BarangTableCreateCompanionBuilder,
      $$BarangTableUpdateCompanionBuilder,
      (BarangData, $$BarangTableReferences),
      BarangData,
      PrefetchHooks Function({
        bool idKategori,
        bool idOrganisasi,
        bool hargaSewaRefs,
        bool detailPenyewaanRefs,
        bool kondisiBarangKembaliRefs,
      })
    >;
typedef $$HargaSewaTableCreateCompanionBuilder = HargaSewaCompanion Function({
  Value<int> idHarga,
  required int idBarang,
  required int idLevel,
  required double hargaPerHari,
  Value<double> diskon,
  Value<DateTime> tanggalBerlaku,
  Value<String> statusRecord,
});
typedef $$HargaSewaTableUpdateCompanionBuilder = HargaSewaCompanion Function({
  Value<int> idHarga,
  Value<int> idBarang,
  Value<int> idLevel,
  Value<double> hargaPerHari,
  Value<double> diskon,
  Value<DateTime> tanggalBerlaku,
  Value<String> statusRecord,
});

final class $$HargaSewaTableReferences
    extends BaseReferences<_$AppDatabase, $HargaSewaTable, HargaSewaData> {
  $$HargaSewaTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BarangTable _idBarangTable(_$AppDatabase db) =>
      db.barang.createAlias('harga_sewa__id_barang__barang__id_barang');

  $$BarangTableProcessedTableManager get idBarang {
    final $_column = $_itemColumn<int>('id_barang')!;

    final manager = $$BarangTableTableManager(
      $_db,
      $_db.barang,
    ).filter((f) => f.idBarang.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idBarangTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LevelTable _idLevelTable(_$AppDatabase db) =>
      db.level.createAlias('harga_sewa__id_level__level__id_level');

  $$LevelTableProcessedTableManager get idLevel {
    final $_column = $_itemColumn<int>('id_level')!;

    final manager = $$LevelTableTableManager(
      $_db,
      $_db.level,
    ).filter((f) => f.idLevel.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idLevelTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HargaSewaTableFilterComposer
    extends Composer<_$AppDatabase, $HargaSewaTable> {
  $$HargaSewaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idHarga => $composableBuilder(
    column: $table.idHarga,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hargaPerHari => $composableBuilder(
    column: $table.hargaPerHari,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get diskon => $composableBuilder(
    column: $table.diskon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get tanggalBerlaku => $composableBuilder(
    column: $table.tanggalBerlaku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusRecord => $composableBuilder(
    column: $table.statusRecord,
    builder: (column) => ColumnFilters(column),
  );

  $$BarangTableFilterComposer get idBarang {
    final $$BarangTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.barang,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BarangTableFilterComposer(
            $db: $db,
            $table: $db.barang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LevelTableFilterComposer get idLevel {
    final $$LevelTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLevel,
      referencedTable: $db.level,
      getReferencedColumn: (t) => t.idLevel,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LevelTableFilterComposer(
            $db: $db,
            $table: $db.level,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HargaSewaTableOrderingComposer
    extends Composer<_$AppDatabase, $HargaSewaTable> {
  $$HargaSewaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idHarga => $composableBuilder(
    column: $table.idHarga,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hargaPerHari => $composableBuilder(
    column: $table.hargaPerHari,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get diskon => $composableBuilder(
    column: $table.diskon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tanggalBerlaku => $composableBuilder(
    column: $table.tanggalBerlaku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusRecord => $composableBuilder(
    column: $table.statusRecord,
    builder: (column) => ColumnOrderings(column),
  );

  $$BarangTableOrderingComposer get idBarang {
    final $$BarangTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.barang,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BarangTableOrderingComposer(
            $db: $db,
            $table: $db.barang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LevelTableOrderingComposer get idLevel {
    final $$LevelTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLevel,
      referencedTable: $db.level,
      getReferencedColumn: (t) => t.idLevel,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LevelTableOrderingComposer(
            $db: $db,
            $table: $db.level,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HargaSewaTableAnnotationComposer
    extends Composer<_$AppDatabase, $HargaSewaTable> {
  $$HargaSewaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idHarga =>
      $composableBuilder(column: $table.idHarga, builder: (column) => column);

  GeneratedColumn<double> get hargaPerHari => $composableBuilder(
    column: $table.hargaPerHari,
    builder: (column) => column,
  );

  GeneratedColumn<double> get diskon =>
      $composableBuilder(column: $table.diskon, builder: (column) => column);

  GeneratedColumn<DateTime> get tanggalBerlaku => $composableBuilder(
    column: $table.tanggalBerlaku,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statusRecord => $composableBuilder(
    column: $table.statusRecord,
    builder: (column) => column,
  );

  $$BarangTableAnnotationComposer get idBarang {
    final $$BarangTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.barang,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BarangTableAnnotationComposer(
            $db: $db,
            $table: $db.barang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LevelTableAnnotationComposer get idLevel {
    final $$LevelTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLevel,
      referencedTable: $db.level,
      getReferencedColumn: (t) => t.idLevel,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LevelTableAnnotationComposer(
            $db: $db,
            $table: $db.level,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HargaSewaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HargaSewaTable,
          HargaSewaData,
          $$HargaSewaTableFilterComposer,
          $$HargaSewaTableOrderingComposer,
          $$HargaSewaTableAnnotationComposer,
          $$HargaSewaTableCreateCompanionBuilder,
          $$HargaSewaTableUpdateCompanionBuilder,
          (HargaSewaData, $$HargaSewaTableReferences),
          HargaSewaData,
          PrefetchHooks Function({bool idBarang, bool idLevel})
        > {
  $$HargaSewaTableTableManager(_$AppDatabase db, $HargaSewaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HargaSewaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HargaSewaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HargaSewaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idHarga = const Value.absent(),
                Value<int> idBarang = const Value.absent(),
                Value<int> idLevel = const Value.absent(),
                Value<double> hargaPerHari = const Value.absent(),
                Value<double> diskon = const Value.absent(),
                Value<DateTime> tanggalBerlaku = const Value.absent(),
                Value<String> statusRecord = const Value.absent(),
              }) => HargaSewaCompanion(
                idHarga: idHarga,
                idBarang: idBarang,
                idLevel: idLevel,
                hargaPerHari: hargaPerHari,
                diskon: diskon,
                tanggalBerlaku: tanggalBerlaku,
                statusRecord: statusRecord,
              ),
          createCompanionCallback:
              ({
                Value<int> idHarga = const Value.absent(),
                required int idBarang,
                required int idLevel,
                required double hargaPerHari,
                Value<double> diskon = const Value.absent(),
                Value<DateTime> tanggalBerlaku = const Value.absent(),
                Value<String> statusRecord = const Value.absent(),
              }) => HargaSewaCompanion.insert(
                idHarga: idHarga,
                idBarang: idBarang,
                idLevel: idLevel,
                hargaPerHari: hargaPerHari,
                diskon: diskon,
                tanggalBerlaku: tanggalBerlaku,
                statusRecord: statusRecord,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$HargaSewaTable, HargaSewaData>(table),
                  $$HargaSewaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idBarang = false, idLevel = false}) {
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
                    if (idBarang) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idBarang,
                        referencedTable: $$HargaSewaTableReferences
                            ._idBarangTable(db),
                        referencedColumn: $$HargaSewaTableReferences
                            ._idBarangTable(db)
                            .idBarang,
                      ) as T;
                    }
                    if (idLevel) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idLevel,
                        referencedTable: $$HargaSewaTableReferences
                            ._idLevelTable(db),
                        referencedColumn: $$HargaSewaTableReferences
                            ._idLevelTable(db)
                            .idLevel,
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

typedef $$HargaSewaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HargaSewaTable,
      HargaSewaData,
      $$HargaSewaTableFilterComposer,
      $$HargaSewaTableOrderingComposer,
      $$HargaSewaTableAnnotationComposer,
      $$HargaSewaTableCreateCompanionBuilder,
      $$HargaSewaTableUpdateCompanionBuilder,
      (HargaSewaData, $$HargaSewaTableReferences),
      HargaSewaData,
      PrefetchHooks Function({bool idBarang, bool idLevel})
    >;
typedef $$PeminjamTableCreateCompanionBuilder = PeminjamCompanion Function({
  Value<int> idPeminjam,
  required int idUser,
  Value<String?> nim,
  Value<String?> kelas,
  Value<String?> fakultas,
  Value<String?> jurusan,
  Value<String?> kontak,
  Value<String?> email,
  Value<String?> alamat,
  Value<String> status,
});
typedef $$PeminjamTableUpdateCompanionBuilder = PeminjamCompanion Function({
  Value<int> idPeminjam,
  Value<int> idUser,
  Value<String?> nim,
  Value<String?> kelas,
  Value<String?> fakultas,
  Value<String?> jurusan,
  Value<String?> kontak,
  Value<String?> email,
  Value<String?> alamat,
  Value<String> status,
});

final class $$PeminjamTableReferences
    extends BaseReferences<_$AppDatabase, $PeminjamTable, PeminjamData> {
  $$PeminjamTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _idUserTable(_$AppDatabase db) =>
      db.users.createAlias('peminjam__id_user__users__id_user');

  $$UsersTableProcessedTableManager get idUser {
    final $_column = $_itemColumn<int>('id_user')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.idUser.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idUserTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PenyewaanTable, List<PenyewaanData>>
  _penyewaanRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.penyewaan,
    aliasName: 'peminjam__id_peminjam__penyewaan__id_peminjam',
  );

  $$PenyewaanTableProcessedTableManager get penyewaanRefs {
    final manager = $$PenyewaanTableTableManager($_db, $_db.penyewaan).filter(
      (f) =>
          f.idPeminjam.idPeminjam.sqlEquals($_itemColumn<int>('id_peminjam')!),
    );

    final cache = $_typedResult.readTableOrNull(_penyewaanRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PeminjamTableFilterComposer
    extends Composer<_$AppDatabase, $PeminjamTable> {
  $$PeminjamTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idPeminjam => $composableBuilder(
    column: $table.idPeminjam,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nim => $composableBuilder(
    column: $table.nim,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kelas => $composableBuilder(
    column: $table.kelas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fakultas => $composableBuilder(
    column: $table.fakultas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jurusan => $composableBuilder(
    column: $table.jurusan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kontak => $composableBuilder(
    column: $table.kontak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alamat => $composableBuilder(
    column: $table.alamat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get idUser {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> penyewaanRefs(
    Expression<bool> Function($$PenyewaanTableFilterComposer f) f,
  ) {
    final $$PenyewaanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPeminjam,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idPeminjam,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableFilterComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PeminjamTableOrderingComposer
    extends Composer<_$AppDatabase, $PeminjamTable> {
  $$PeminjamTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idPeminjam => $composableBuilder(
    column: $table.idPeminjam,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nim => $composableBuilder(
    column: $table.nim,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kelas => $composableBuilder(
    column: $table.kelas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fakultas => $composableBuilder(
    column: $table.fakultas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jurusan => $composableBuilder(
    column: $table.jurusan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kontak => $composableBuilder(
    column: $table.kontak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alamat => $composableBuilder(
    column: $table.alamat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get idUser {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PeminjamTableAnnotationComposer
    extends Composer<_$AppDatabase, $PeminjamTable> {
  $$PeminjamTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idPeminjam => $composableBuilder(
    column: $table.idPeminjam,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nim =>
      $composableBuilder(column: $table.nim, builder: (column) => column);

  GeneratedColumn<String> get kelas =>
      $composableBuilder(column: $table.kelas, builder: (column) => column);

  GeneratedColumn<String> get fakultas =>
      $composableBuilder(column: $table.fakultas, builder: (column) => column);

  GeneratedColumn<String> get jurusan =>
      $composableBuilder(column: $table.jurusan, builder: (column) => column);

  GeneratedColumn<String> get kontak =>
      $composableBuilder(column: $table.kontak, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get alamat =>
      $composableBuilder(column: $table.alamat, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$UsersTableAnnotationComposer get idUser {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> penyewaanRefs<T extends Object>(
    Expression<T> Function($$PenyewaanTableAnnotationComposer a) f,
  ) {
    final $$PenyewaanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPeminjam,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idPeminjam,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableAnnotationComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PeminjamTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PeminjamTable,
          PeminjamData,
          $$PeminjamTableFilterComposer,
          $$PeminjamTableOrderingComposer,
          $$PeminjamTableAnnotationComposer,
          $$PeminjamTableCreateCompanionBuilder,
          $$PeminjamTableUpdateCompanionBuilder,
          (PeminjamData, $$PeminjamTableReferences),
          PeminjamData,
          PrefetchHooks Function({bool idUser, bool penyewaanRefs})
        > {
  $$PeminjamTableTableManager(_$AppDatabase db, $PeminjamTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PeminjamTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PeminjamTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PeminjamTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idPeminjam = const Value.absent(),
                Value<int> idUser = const Value.absent(),
                Value<String?> nim = const Value.absent(),
                Value<String?> kelas = const Value.absent(),
                Value<String?> fakultas = const Value.absent(),
                Value<String?> jurusan = const Value.absent(),
                Value<String?> kontak = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> alamat = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => PeminjamCompanion(
                idPeminjam: idPeminjam,
                idUser: idUser,
                nim: nim,
                kelas: kelas,
                fakultas: fakultas,
                jurusan: jurusan,
                kontak: kontak,
                email: email,
                alamat: alamat,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> idPeminjam = const Value.absent(),
                required int idUser,
                Value<String?> nim = const Value.absent(),
                Value<String?> kelas = const Value.absent(),
                Value<String?> fakultas = const Value.absent(),
                Value<String?> jurusan = const Value.absent(),
                Value<String?> kontak = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> alamat = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => PeminjamCompanion.insert(
                idPeminjam: idPeminjam,
                idUser: idUser,
                nim: nim,
                kelas: kelas,
                fakultas: fakultas,
                jurusan: jurusan,
                kontak: kontak,
                email: email,
                alamat: alamat,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PeminjamTable, PeminjamData>(table),
                  $$PeminjamTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idUser = false, penyewaanRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (penyewaanRefs) db.penyewaan],
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
                    if (idUser) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idUser,
                        referencedTable: $$PeminjamTableReferences._idUserTable(
                          db,
                        ),
                        referencedColumn: $$PeminjamTableReferences
                            ._idUserTable(db)
                            .idUser,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (penyewaanRefs)
                    await $_getPrefetchedData<
                      PeminjamData,
                      $PeminjamTable,
                      PenyewaanData
                    >(
                      currentTable: table,
                      referencedTable: $$PeminjamTableReferences
                          ._penyewaanRefsTable(db),
                      managerFromTypedResult: (p0) => $$PeminjamTableReferences(
                        db,
                        table,
                        p0,
                      ).penyewaanRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idPeminjam == item.idPeminjam,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PeminjamTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PeminjamTable,
      PeminjamData,
      $$PeminjamTableFilterComposer,
      $$PeminjamTableOrderingComposer,
      $$PeminjamTableAnnotationComposer,
      $$PeminjamTableCreateCompanionBuilder,
      $$PeminjamTableUpdateCompanionBuilder,
      (PeminjamData, $$PeminjamTableReferences),
      PeminjamData,
      PrefetchHooks Function({bool idUser, bool penyewaanRefs})
    >;
typedef $$PenyewaanTableCreateCompanionBuilder = PenyewaanCompanion Function({
  Value<int> idSewa,
  required String kodeSewa,
  required int idPeminjam,
  required int idOrganisasi,
  required DateTime tanggalSewa,
  required DateTime tanggalRencanaKembali,
  Value<DateTime?> tanggalAktualKembali,
  Value<String> statusPenyewaan,
  Value<double> totalHarga,
  Value<double> dp,
  Value<double> sisaBayar,
  Value<String?> catatan,
  Value<int?> idAdmin,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$PenyewaanTableUpdateCompanionBuilder = PenyewaanCompanion Function({
  Value<int> idSewa,
  Value<String> kodeSewa,
  Value<int> idPeminjam,
  Value<int> idOrganisasi,
  Value<DateTime> tanggalSewa,
  Value<DateTime> tanggalRencanaKembali,
  Value<DateTime?> tanggalAktualKembali,
  Value<String> statusPenyewaan,
  Value<double> totalHarga,
  Value<double> dp,
  Value<double> sisaBayar,
  Value<String?> catatan,
  Value<int?> idAdmin,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$PenyewaanTableReferences
    extends BaseReferences<_$AppDatabase, $PenyewaanTable, PenyewaanData> {
  $$PenyewaanTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PeminjamTable _idPeminjamTable(_$AppDatabase db) =>
      db.peminjam.createAlias('penyewaan__id_peminjam__peminjam__id_peminjam');

  $$PeminjamTableProcessedTableManager get idPeminjam {
    final $_column = $_itemColumn<int>('id_peminjam')!;

    final manager = $$PeminjamTableTableManager(
      $_db,
      $_db.peminjam,
    ).filter((f) => f.idPeminjam.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idPeminjamTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $OrganisasiTable _idOrganisasiTable(_$AppDatabase db) => db.organisasi
      .createAlias('penyewaan__id_organisasi__organisasi__id_organisasi');

  $$OrganisasiTableProcessedTableManager get idOrganisasi {
    final $_column = $_itemColumn<int>('id_organisasi')!;

    final manager = $$OrganisasiTableTableManager(
      $_db,
      $_db.organisasi,
    ).filter((f) => f.idOrganisasi.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idOrganisasiTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _idAdminTable(_$AppDatabase db) =>
      db.users.createAlias('penyewaan__id_admin__users__id_user');

  $$UsersTableProcessedTableManager? get idAdmin {
    final $_column = $_itemColumn<int>('id_admin');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.idUser.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idAdminTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DetailPenyewaanTable, List<DetailPenyewaanData>>
  _detailPenyewaanRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.detailPenyewaan,
    aliasName: 'penyewaan__id_sewa__detail_penyewaan__id_sewa',
  );

  $$DetailPenyewaanTableProcessedTableManager get detailPenyewaanRefs {
    final manager = $$DetailPenyewaanTableTableManager(
      $_db,
      $_db.detailPenyewaan,
    ).filter((f) => f.idSewa.idSewa.sqlEquals($_itemColumn<int>('id_sewa')!));

    final cache = $_typedResult.readTableOrNull(
      _detailPenyewaanRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PengembalianTable, List<PengembalianData>>
  _pengembalianRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.pengembalian,
    aliasName: 'penyewaan__id_sewa__pengembalian__id_sewa',
  );

  $$PengembalianTableProcessedTableManager get pengembalianRefs {
    final manager = $$PengembalianTableTableManager(
      $_db,
      $_db.pengembalian,
    ).filter((f) => f.idSewa.idSewa.sqlEquals($_itemColumn<int>('id_sewa')!));

    final cache = $_typedResult.readTableOrNull(_pengembalianRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PembayaranTable, List<PembayaranData>>
  _pembayaranRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.pembayaran,
    aliasName: 'penyewaan__id_sewa__pembayaran__id_sewa',
  );

  $$PembayaranTableProcessedTableManager get pembayaranRefs {
    final manager = $$PembayaranTableTableManager(
      $_db,
      $_db.pembayaran,
    ).filter((f) => f.idSewa.idSewa.sqlEquals($_itemColumn<int>('id_sewa')!));

    final cache = $_typedResult.readTableOrNull(_pembayaranRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DokumenPendukungTable, List<DokumenPendukungData>>
  _dokumenPendukungRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dokumenPendukung,
    aliasName: 'penyewaan__id_sewa__dokumen_pendukung__id_sewa',
  );

  $$DokumenPendukungTableProcessedTableManager get dokumenPendukungRefs {
    final manager = $$DokumenPendukungTableTableManager(
      $_db,
      $_db.dokumenPendukung,
    ).filter((f) => f.idSewa.idSewa.sqlEquals($_itemColumn<int>('id_sewa')!));

    final cache = $_typedResult.readTableOrNull(
      _dokumenPendukungRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RiwayatStatusTable, List<RiwayatStatusData>>
  _riwayatStatusRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.riwayatStatus,
    aliasName: 'penyewaan__id_sewa__riwayat_status__id_sewa',
  );

  $$RiwayatStatusTableProcessedTableManager get riwayatStatusRefs {
    final manager = $$RiwayatStatusTableTableManager(
      $_db,
      $_db.riwayatStatus,
    ).filter((f) => f.idSewa.idSewa.sqlEquals($_itemColumn<int>('id_sewa')!));

    final cache = $_typedResult.readTableOrNull(_riwayatStatusRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PenyewaanTableFilterComposer
    extends Composer<_$AppDatabase, $PenyewaanTable> {
  $$PenyewaanTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idSewa => $composableBuilder(
    column: $table.idSewa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kodeSewa => $composableBuilder(
    column: $table.kodeSewa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get tanggalSewa => $composableBuilder(
    column: $table.tanggalSewa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get tanggalRencanaKembali => $composableBuilder(
    column: $table.tanggalRencanaKembali,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get tanggalAktualKembali => $composableBuilder(
    column: $table.tanggalAktualKembali,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusPenyewaan => $composableBuilder(
    column: $table.statusPenyewaan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalHarga => $composableBuilder(
    column: $table.totalHarga,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get dp => $composableBuilder(
    column: $table.dp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sisaBayar => $composableBuilder(
    column: $table.sisaBayar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get catatan => $composableBuilder(
    column: $table.catatan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PeminjamTableFilterComposer get idPeminjam {
    final $$PeminjamTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPeminjam,
      referencedTable: $db.peminjam,
      getReferencedColumn: (t) => t.idPeminjam,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeminjamTableFilterComposer(
            $db: $db,
            $table: $db.peminjam,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganisasiTableFilterComposer get idOrganisasi {
    final $$OrganisasiTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.organisasi,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganisasiTableFilterComposer(
            $db: $db,
            $table: $db.organisasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get idAdmin {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idAdmin,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> detailPenyewaanRefs(
    Expression<bool> Function($$DetailPenyewaanTableFilterComposer f) f,
  ) {
    final $$DetailPenyewaanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.detailPenyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetailPenyewaanTableFilterComposer(
            $db: $db,
            $table: $db.detailPenyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> pengembalianRefs(
    Expression<bool> Function($$PengembalianTableFilterComposer f) f,
  ) {
    final $$PengembalianTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.pengembalian,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PengembalianTableFilterComposer(
            $db: $db,
            $table: $db.pengembalian,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> pembayaranRefs(
    Expression<bool> Function($$PembayaranTableFilterComposer f) f,
  ) {
    final $$PembayaranTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.pembayaran,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PembayaranTableFilterComposer(
            $db: $db,
            $table: $db.pembayaran,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dokumenPendukungRefs(
    Expression<bool> Function($$DokumenPendukungTableFilterComposer f) f,
  ) {
    final $$DokumenPendukungTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.dokumenPendukung,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DokumenPendukungTableFilterComposer(
            $db: $db,
            $table: $db.dokumenPendukung,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> riwayatStatusRefs(
    Expression<bool> Function($$RiwayatStatusTableFilterComposer f) f,
  ) {
    final $$RiwayatStatusTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.riwayatStatus,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RiwayatStatusTableFilterComposer(
            $db: $db,
            $table: $db.riwayatStatus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PenyewaanTableOrderingComposer
    extends Composer<_$AppDatabase, $PenyewaanTable> {
  $$PenyewaanTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idSewa => $composableBuilder(
    column: $table.idSewa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kodeSewa => $composableBuilder(
    column: $table.kodeSewa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tanggalSewa => $composableBuilder(
    column: $table.tanggalSewa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tanggalRencanaKembali => $composableBuilder(
    column: $table.tanggalRencanaKembali,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tanggalAktualKembali => $composableBuilder(
    column: $table.tanggalAktualKembali,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusPenyewaan => $composableBuilder(
    column: $table.statusPenyewaan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalHarga => $composableBuilder(
    column: $table.totalHarga,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get dp => $composableBuilder(
    column: $table.dp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sisaBayar => $composableBuilder(
    column: $table.sisaBayar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get catatan => $composableBuilder(
    column: $table.catatan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PeminjamTableOrderingComposer get idPeminjam {
    final $$PeminjamTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPeminjam,
      referencedTable: $db.peminjam,
      getReferencedColumn: (t) => t.idPeminjam,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeminjamTableOrderingComposer(
            $db: $db,
            $table: $db.peminjam,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganisasiTableOrderingComposer get idOrganisasi {
    final $$OrganisasiTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.organisasi,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganisasiTableOrderingComposer(
            $db: $db,
            $table: $db.organisasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get idAdmin {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idAdmin,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PenyewaanTableAnnotationComposer
    extends Composer<_$AppDatabase, $PenyewaanTable> {
  $$PenyewaanTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idSewa =>
      $composableBuilder(column: $table.idSewa, builder: (column) => column);

  GeneratedColumn<String> get kodeSewa =>
      $composableBuilder(column: $table.kodeSewa, builder: (column) => column);

  GeneratedColumn<DateTime> get tanggalSewa => $composableBuilder(
    column: $table.tanggalSewa,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get tanggalRencanaKembali => $composableBuilder(
    column: $table.tanggalRencanaKembali,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get tanggalAktualKembali => $composableBuilder(
    column: $table.tanggalAktualKembali,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statusPenyewaan => $composableBuilder(
    column: $table.statusPenyewaan,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalHarga => $composableBuilder(
    column: $table.totalHarga,
    builder: (column) => column,
  );

  GeneratedColumn<double> get dp =>
      $composableBuilder(column: $table.dp, builder: (column) => column);

  GeneratedColumn<double> get sisaBayar =>
      $composableBuilder(column: $table.sisaBayar, builder: (column) => column);

  GeneratedColumn<String> get catatan =>
      $composableBuilder(column: $table.catatan, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PeminjamTableAnnotationComposer get idPeminjam {
    final $$PeminjamTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPeminjam,
      referencedTable: $db.peminjam,
      getReferencedColumn: (t) => t.idPeminjam,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeminjamTableAnnotationComposer(
            $db: $db,
            $table: $db.peminjam,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganisasiTableAnnotationComposer get idOrganisasi {
    final $$OrganisasiTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganisasi,
      referencedTable: $db.organisasi,
      getReferencedColumn: (t) => t.idOrganisasi,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganisasiTableAnnotationComposer(
            $db: $db,
            $table: $db.organisasi,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get idAdmin {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idAdmin,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> detailPenyewaanRefs<T extends Object>(
    Expression<T> Function($$DetailPenyewaanTableAnnotationComposer a) f,
  ) {
    final $$DetailPenyewaanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.detailPenyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetailPenyewaanTableAnnotationComposer(
            $db: $db,
            $table: $db.detailPenyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> pengembalianRefs<T extends Object>(
    Expression<T> Function($$PengembalianTableAnnotationComposer a) f,
  ) {
    final $$PengembalianTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.pengembalian,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PengembalianTableAnnotationComposer(
            $db: $db,
            $table: $db.pengembalian,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> pembayaranRefs<T extends Object>(
    Expression<T> Function($$PembayaranTableAnnotationComposer a) f,
  ) {
    final $$PembayaranTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.pembayaran,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PembayaranTableAnnotationComposer(
            $db: $db,
            $table: $db.pembayaran,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dokumenPendukungRefs<T extends Object>(
    Expression<T> Function($$DokumenPendukungTableAnnotationComposer a) f,
  ) {
    final $$DokumenPendukungTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.dokumenPendukung,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DokumenPendukungTableAnnotationComposer(
            $db: $db,
            $table: $db.dokumenPendukung,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> riwayatStatusRefs<T extends Object>(
    Expression<T> Function($$RiwayatStatusTableAnnotationComposer a) f,
  ) {
    final $$RiwayatStatusTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.riwayatStatus,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RiwayatStatusTableAnnotationComposer(
            $db: $db,
            $table: $db.riwayatStatus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PenyewaanTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PenyewaanTable,
          PenyewaanData,
          $$PenyewaanTableFilterComposer,
          $$PenyewaanTableOrderingComposer,
          $$PenyewaanTableAnnotationComposer,
          $$PenyewaanTableCreateCompanionBuilder,
          $$PenyewaanTableUpdateCompanionBuilder,
          (PenyewaanData, $$PenyewaanTableReferences),
          PenyewaanData,
          PrefetchHooks Function({
            bool idPeminjam,
            bool idOrganisasi,
            bool idAdmin,
            bool detailPenyewaanRefs,
            bool pengembalianRefs,
            bool pembayaranRefs,
            bool dokumenPendukungRefs,
            bool riwayatStatusRefs,
          })
        > {
  $$PenyewaanTableTableManager(_$AppDatabase db, $PenyewaanTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PenyewaanTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PenyewaanTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PenyewaanTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idSewa = const Value.absent(),
                Value<String> kodeSewa = const Value.absent(),
                Value<int> idPeminjam = const Value.absent(),
                Value<int> idOrganisasi = const Value.absent(),
                Value<DateTime> tanggalSewa = const Value.absent(),
                Value<DateTime> tanggalRencanaKembali = const Value.absent(),
                Value<DateTime?> tanggalAktualKembali = const Value.absent(),
                Value<String> statusPenyewaan = const Value.absent(),
                Value<double> totalHarga = const Value.absent(),
                Value<double> dp = const Value.absent(),
                Value<double> sisaBayar = const Value.absent(),
                Value<String?> catatan = const Value.absent(),
                Value<int?> idAdmin = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PenyewaanCompanion(
                idSewa: idSewa,
                kodeSewa: kodeSewa,
                idPeminjam: idPeminjam,
                idOrganisasi: idOrganisasi,
                tanggalSewa: tanggalSewa,
                tanggalRencanaKembali: tanggalRencanaKembali,
                tanggalAktualKembali: tanggalAktualKembali,
                statusPenyewaan: statusPenyewaan,
                totalHarga: totalHarga,
                dp: dp,
                sisaBayar: sisaBayar,
                catatan: catatan,
                idAdmin: idAdmin,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> idSewa = const Value.absent(),
                required String kodeSewa,
                required int idPeminjam,
                required int idOrganisasi,
                required DateTime tanggalSewa,
                required DateTime tanggalRencanaKembali,
                Value<DateTime?> tanggalAktualKembali = const Value.absent(),
                Value<String> statusPenyewaan = const Value.absent(),
                Value<double> totalHarga = const Value.absent(),
                Value<double> dp = const Value.absent(),
                Value<double> sisaBayar = const Value.absent(),
                Value<String?> catatan = const Value.absent(),
                Value<int?> idAdmin = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PenyewaanCompanion.insert(
                idSewa: idSewa,
                kodeSewa: kodeSewa,
                idPeminjam: idPeminjam,
                idOrganisasi: idOrganisasi,
                tanggalSewa: tanggalSewa,
                tanggalRencanaKembali: tanggalRencanaKembali,
                tanggalAktualKembali: tanggalAktualKembali,
                statusPenyewaan: statusPenyewaan,
                totalHarga: totalHarga,
                dp: dp,
                sisaBayar: sisaBayar,
                catatan: catatan,
                idAdmin: idAdmin,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PenyewaanTable, PenyewaanData>(table),
                  $$PenyewaanTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                idPeminjam = false,
                idOrganisasi = false,
                idAdmin = false,
                detailPenyewaanRefs = false,
                pengembalianRefs = false,
                pembayaranRefs = false,
                dokumenPendukungRefs = false,
                riwayatStatusRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (detailPenyewaanRefs) db.detailPenyewaan,
                    if (pengembalianRefs) db.pengembalian,
                    if (pembayaranRefs) db.pembayaran,
                    if (dokumenPendukungRefs) db.dokumenPendukung,
                    if (riwayatStatusRefs) db.riwayatStatus,
                  ],
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
                        if (idPeminjam) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.idPeminjam,
                            referencedTable: $$PenyewaanTableReferences
                                ._idPeminjamTable(db),
                            referencedColumn: $$PenyewaanTableReferences
                                ._idPeminjamTable(db)
                                .idPeminjam,
                          ) as T;
                        }
                        if (idOrganisasi) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.idOrganisasi,
                            referencedTable: $$PenyewaanTableReferences
                                ._idOrganisasiTable(db),
                            referencedColumn: $$PenyewaanTableReferences
                                ._idOrganisasiTable(db)
                                .idOrganisasi,
                          ) as T;
                        }
                        if (idAdmin) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.idAdmin,
                            referencedTable: $$PenyewaanTableReferences
                                ._idAdminTable(db),
                            referencedColumn: $$PenyewaanTableReferences
                                ._idAdminTable(db)
                                .idUser,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (detailPenyewaanRefs)
                        await $_getPrefetchedData<
                          PenyewaanData,
                          $PenyewaanTable,
                          DetailPenyewaanData
                        >(
                          currentTable: table,
                          referencedTable: $$PenyewaanTableReferences
                              ._detailPenyewaanRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PenyewaanTableReferences(
                                db,
                                table,
                                p0,
                              ).detailPenyewaanRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idSewa == item.idSewa,
                              ),
                          typedResults: items,
                        ),
                      if (pengembalianRefs)
                        await $_getPrefetchedData<
                          PenyewaanData,
                          $PenyewaanTable,
                          PengembalianData
                        >(
                          currentTable: table,
                          referencedTable: $$PenyewaanTableReferences
                              ._pengembalianRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PenyewaanTableReferences(
                                db,
                                table,
                                p0,
                              ).pengembalianRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idSewa == item.idSewa,
                              ),
                          typedResults: items,
                        ),
                      if (pembayaranRefs)
                        await $_getPrefetchedData<
                          PenyewaanData,
                          $PenyewaanTable,
                          PembayaranData
                        >(
                          currentTable: table,
                          referencedTable: $$PenyewaanTableReferences
                              ._pembayaranRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PenyewaanTableReferences(
                                db,
                                table,
                                p0,
                              ).pembayaranRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idSewa == item.idSewa,
                              ),
                          typedResults: items,
                        ),
                      if (dokumenPendukungRefs)
                        await $_getPrefetchedData<
                          PenyewaanData,
                          $PenyewaanTable,
                          DokumenPendukungData
                        >(
                          currentTable: table,
                          referencedTable: $$PenyewaanTableReferences
                              ._dokumenPendukungRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PenyewaanTableReferences(
                                db,
                                table,
                                p0,
                              ).dokumenPendukungRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idSewa == item.idSewa,
                              ),
                          typedResults: items,
                        ),
                      if (riwayatStatusRefs)
                        await $_getPrefetchedData<
                          PenyewaanData,
                          $PenyewaanTable,
                          RiwayatStatusData
                        >(
                          currentTable: table,
                          referencedTable: $$PenyewaanTableReferences
                              ._riwayatStatusRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PenyewaanTableReferences(
                                db,
                                table,
                                p0,
                              ).riwayatStatusRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idSewa == item.idSewa,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PenyewaanTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PenyewaanTable,
      PenyewaanData,
      $$PenyewaanTableFilterComposer,
      $$PenyewaanTableOrderingComposer,
      $$PenyewaanTableAnnotationComposer,
      $$PenyewaanTableCreateCompanionBuilder,
      $$PenyewaanTableUpdateCompanionBuilder,
      (PenyewaanData, $$PenyewaanTableReferences),
      PenyewaanData,
      PrefetchHooks Function({
        bool idPeminjam,
        bool idOrganisasi,
        bool idAdmin,
        bool detailPenyewaanRefs,
        bool pengembalianRefs,
        bool pembayaranRefs,
        bool dokumenPendukungRefs,
        bool riwayatStatusRefs,
      })
    >;
typedef $$DetailPenyewaanTableCreateCompanionBuilder =
    DetailPenyewaanCompanion Function({
      Value<int> idDetail,
      required int idSewa,
      required int idBarang,
      Value<int> jumlah,
      required double hargaSatuan,
      required double subtotal,
      Value<String?> kondisiSaatPinjam,
      Value<String?> catatan,
    });
typedef $$DetailPenyewaanTableUpdateCompanionBuilder =
    DetailPenyewaanCompanion Function({
      Value<int> idDetail,
      Value<int> idSewa,
      Value<int> idBarang,
      Value<int> jumlah,
      Value<double> hargaSatuan,
      Value<double> subtotal,
      Value<String?> kondisiSaatPinjam,
      Value<String?> catatan,
    });

final class $$DetailPenyewaanTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DetailPenyewaanTable,
          DetailPenyewaanData
        > {
  $$DetailPenyewaanTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PenyewaanTable _idSewaTable(_$AppDatabase db) =>
      db.penyewaan.createAlias('detail_penyewaan__id_sewa__penyewaan__id_sewa');

  $$PenyewaanTableProcessedTableManager get idSewa {
    final $_column = $_itemColumn<int>('id_sewa')!;

    final manager = $$PenyewaanTableTableManager(
      $_db,
      $_db.penyewaan,
    ).filter((f) => f.idSewa.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idSewaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BarangTable _idBarangTable(_$AppDatabase db) =>
      db.barang.createAlias('detail_penyewaan__id_barang__barang__id_barang');

  $$BarangTableProcessedTableManager get idBarang {
    final $_column = $_itemColumn<int>('id_barang')!;

    final manager = $$BarangTableTableManager(
      $_db,
      $_db.barang,
    ).filter((f) => f.idBarang.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idBarangTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DetailPenyewaanTableFilterComposer
    extends Composer<_$AppDatabase, $DetailPenyewaanTable> {
  $$DetailPenyewaanTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idDetail => $composableBuilder(
    column: $table.idDetail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hargaSatuan => $composableBuilder(
    column: $table.hargaSatuan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kondisiSaatPinjam => $composableBuilder(
    column: $table.kondisiSaatPinjam,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get catatan => $composableBuilder(
    column: $table.catatan,
    builder: (column) => ColumnFilters(column),
  );

  $$PenyewaanTableFilterComposer get idSewa {
    final $$PenyewaanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableFilterComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BarangTableFilterComposer get idBarang {
    final $$BarangTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.barang,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BarangTableFilterComposer(
            $db: $db,
            $table: $db.barang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DetailPenyewaanTableOrderingComposer
    extends Composer<_$AppDatabase, $DetailPenyewaanTable> {
  $$DetailPenyewaanTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idDetail => $composableBuilder(
    column: $table.idDetail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hargaSatuan => $composableBuilder(
    column: $table.hargaSatuan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kondisiSaatPinjam => $composableBuilder(
    column: $table.kondisiSaatPinjam,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get catatan => $composableBuilder(
    column: $table.catatan,
    builder: (column) => ColumnOrderings(column),
  );

  $$PenyewaanTableOrderingComposer get idSewa {
    final $$PenyewaanTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableOrderingComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BarangTableOrderingComposer get idBarang {
    final $$BarangTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.barang,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BarangTableOrderingComposer(
            $db: $db,
            $table: $db.barang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DetailPenyewaanTableAnnotationComposer
    extends Composer<_$AppDatabase, $DetailPenyewaanTable> {
  $$DetailPenyewaanTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idDetail =>
      $composableBuilder(column: $table.idDetail, builder: (column) => column);

  GeneratedColumn<int> get jumlah =>
      $composableBuilder(column: $table.jumlah, builder: (column) => column);

  GeneratedColumn<double> get hargaSatuan => $composableBuilder(
    column: $table.hargaSatuan,
    builder: (column) => column,
  );

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<String> get kondisiSaatPinjam => $composableBuilder(
    column: $table.kondisiSaatPinjam,
    builder: (column) => column,
  );

  GeneratedColumn<String> get catatan =>
      $composableBuilder(column: $table.catatan, builder: (column) => column);

  $$PenyewaanTableAnnotationComposer get idSewa {
    final $$PenyewaanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableAnnotationComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BarangTableAnnotationComposer get idBarang {
    final $$BarangTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.barang,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BarangTableAnnotationComposer(
            $db: $db,
            $table: $db.barang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DetailPenyewaanTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DetailPenyewaanTable,
          DetailPenyewaanData,
          $$DetailPenyewaanTableFilterComposer,
          $$DetailPenyewaanTableOrderingComposer,
          $$DetailPenyewaanTableAnnotationComposer,
          $$DetailPenyewaanTableCreateCompanionBuilder,
          $$DetailPenyewaanTableUpdateCompanionBuilder,
          (DetailPenyewaanData, $$DetailPenyewaanTableReferences),
          DetailPenyewaanData,
          PrefetchHooks Function({bool idSewa, bool idBarang})
        > {
  $$DetailPenyewaanTableTableManager(
    _$AppDatabase db,
    $DetailPenyewaanTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DetailPenyewaanTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DetailPenyewaanTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DetailPenyewaanTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idDetail = const Value.absent(),
                Value<int> idSewa = const Value.absent(),
                Value<int> idBarang = const Value.absent(),
                Value<int> jumlah = const Value.absent(),
                Value<double> hargaSatuan = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<String?> kondisiSaatPinjam = const Value.absent(),
                Value<String?> catatan = const Value.absent(),
              }) => DetailPenyewaanCompanion(
                idDetail: idDetail,
                idSewa: idSewa,
                idBarang: idBarang,
                jumlah: jumlah,
                hargaSatuan: hargaSatuan,
                subtotal: subtotal,
                kondisiSaatPinjam: kondisiSaatPinjam,
                catatan: catatan,
              ),
          createCompanionCallback:
              ({
                Value<int> idDetail = const Value.absent(),
                required int idSewa,
                required int idBarang,
                Value<int> jumlah = const Value.absent(),
                required double hargaSatuan,
                required double subtotal,
                Value<String?> kondisiSaatPinjam = const Value.absent(),
                Value<String?> catatan = const Value.absent(),
              }) => DetailPenyewaanCompanion.insert(
                idDetail: idDetail,
                idSewa: idSewa,
                idBarang: idBarang,
                jumlah: jumlah,
                hargaSatuan: hargaSatuan,
                subtotal: subtotal,
                kondisiSaatPinjam: kondisiSaatPinjam,
                catatan: catatan,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DetailPenyewaanTable, DetailPenyewaanData>(
                    table,
                  ),
                  $$DetailPenyewaanTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idSewa = false, idBarang = false}) {
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
                    if (idSewa) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idSewa,
                        referencedTable: $$DetailPenyewaanTableReferences
                            ._idSewaTable(db),
                        referencedColumn: $$DetailPenyewaanTableReferences
                            ._idSewaTable(db)
                            .idSewa,
                      ) as T;
                    }
                    if (idBarang) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idBarang,
                        referencedTable: $$DetailPenyewaanTableReferences
                            ._idBarangTable(db),
                        referencedColumn: $$DetailPenyewaanTableReferences
                            ._idBarangTable(db)
                            .idBarang,
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

typedef $$DetailPenyewaanTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DetailPenyewaanTable,
      DetailPenyewaanData,
      $$DetailPenyewaanTableFilterComposer,
      $$DetailPenyewaanTableOrderingComposer,
      $$DetailPenyewaanTableAnnotationComposer,
      $$DetailPenyewaanTableCreateCompanionBuilder,
      $$DetailPenyewaanTableUpdateCompanionBuilder,
      (DetailPenyewaanData, $$DetailPenyewaanTableReferences),
      DetailPenyewaanData,
      PrefetchHooks Function({bool idSewa, bool idBarang})
    >;
typedef $$PengembalianTableCreateCompanionBuilder =
    PengembalianCompanion Function({
      Value<int> idPengembalian,
      required int idSewa,
      required DateTime tanggalDikembalikan,
      Value<String> statusPengembalian,
      Value<double> denda,
      Value<String?> catatan,
      Value<int?> idAdmin,
      Value<DateTime> createdAt,
    });
typedef $$PengembalianTableUpdateCompanionBuilder =
    PengembalianCompanion Function({
      Value<int> idPengembalian,
      Value<int> idSewa,
      Value<DateTime> tanggalDikembalikan,
      Value<String> statusPengembalian,
      Value<double> denda,
      Value<String?> catatan,
      Value<int?> idAdmin,
      Value<DateTime> createdAt,
    });

final class $$PengembalianTableReferences
    extends
        BaseReferences<_$AppDatabase, $PengembalianTable, PengembalianData> {
  $$PengembalianTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PenyewaanTable _idSewaTable(_$AppDatabase db) =>
      db.penyewaan.createAlias('pengembalian__id_sewa__penyewaan__id_sewa');

  $$PenyewaanTableProcessedTableManager get idSewa {
    final $_column = $_itemColumn<int>('id_sewa')!;

    final manager = $$PenyewaanTableTableManager(
      $_db,
      $_db.penyewaan,
    ).filter((f) => f.idSewa.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idSewaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _idAdminTable(_$AppDatabase db) =>
      db.users.createAlias('pengembalian__id_admin__users__id_user');

  $$UsersTableProcessedTableManager? get idAdmin {
    final $_column = $_itemColumn<int>('id_admin');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.idUser.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idAdminTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $KondisiBarangKembaliTable,
    List<KondisiBarangKembaliData>
  >
  _kondisiBarangKembaliRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.kondisiBarangKembali,
        aliasName: 'pengembalian__id_pengembalian__kondisi_barang_kembali__id_pengembalian',
      );

  $$KondisiBarangKembaliTableProcessedTableManager
  get kondisiBarangKembaliRefs {
    final manager =
        $$KondisiBarangKembaliTableTableManager(
          $_db,
          $_db.kondisiBarangKembali,
        ).filter(
          (f) => f.idPengembalian.idPengembalian.sqlEquals(
            $_itemColumn<int>('id_pengembalian')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _kondisiBarangKembaliRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PengembalianTableFilterComposer
    extends Composer<_$AppDatabase, $PengembalianTable> {
  $$PengembalianTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idPengembalian => $composableBuilder(
    column: $table.idPengembalian,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get tanggalDikembalikan => $composableBuilder(
    column: $table.tanggalDikembalikan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusPengembalian => $composableBuilder(
    column: $table.statusPengembalian,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get denda => $composableBuilder(
    column: $table.denda,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get catatan => $composableBuilder(
    column: $table.catatan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PenyewaanTableFilterComposer get idSewa {
    final $$PenyewaanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableFilterComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get idAdmin {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idAdmin,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> kondisiBarangKembaliRefs(
    Expression<bool> Function($$KondisiBarangKembaliTableFilterComposer f) f,
  ) {
    final $$KondisiBarangKembaliTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPengembalian,
      referencedTable: $db.kondisiBarangKembali,
      getReferencedColumn: (t) => t.idPengembalian,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KondisiBarangKembaliTableFilterComposer(
            $db: $db,
            $table: $db.kondisiBarangKembali,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PengembalianTableOrderingComposer
    extends Composer<_$AppDatabase, $PengembalianTable> {
  $$PengembalianTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idPengembalian => $composableBuilder(
    column: $table.idPengembalian,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tanggalDikembalikan => $composableBuilder(
    column: $table.tanggalDikembalikan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusPengembalian => $composableBuilder(
    column: $table.statusPengembalian,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get denda => $composableBuilder(
    column: $table.denda,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get catatan => $composableBuilder(
    column: $table.catatan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PenyewaanTableOrderingComposer get idSewa {
    final $$PenyewaanTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableOrderingComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get idAdmin {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idAdmin,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PengembalianTableAnnotationComposer
    extends Composer<_$AppDatabase, $PengembalianTable> {
  $$PengembalianTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idPengembalian => $composableBuilder(
    column: $table.idPengembalian,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get tanggalDikembalikan => $composableBuilder(
    column: $table.tanggalDikembalikan,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statusPengembalian => $composableBuilder(
    column: $table.statusPengembalian,
    builder: (column) => column,
  );

  GeneratedColumn<double> get denda =>
      $composableBuilder(column: $table.denda, builder: (column) => column);

  GeneratedColumn<String> get catatan =>
      $composableBuilder(column: $table.catatan, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PenyewaanTableAnnotationComposer get idSewa {
    final $$PenyewaanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableAnnotationComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get idAdmin {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idAdmin,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> kondisiBarangKembaliRefs<T extends Object>(
    Expression<T> Function($$KondisiBarangKembaliTableAnnotationComposer a) f,
  ) {
    final $$KondisiBarangKembaliTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idPengembalian,
          referencedTable: $db.kondisiBarangKembali,
          getReferencedColumn: (t) => t.idPengembalian,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$KondisiBarangKembaliTableAnnotationComposer(
                $db: $db,
                $table: $db.kondisiBarangKembali,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PengembalianTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PengembalianTable,
          PengembalianData,
          $$PengembalianTableFilterComposer,
          $$PengembalianTableOrderingComposer,
          $$PengembalianTableAnnotationComposer,
          $$PengembalianTableCreateCompanionBuilder,
          $$PengembalianTableUpdateCompanionBuilder,
          (PengembalianData, $$PengembalianTableReferences),
          PengembalianData,
          PrefetchHooks Function({
            bool idSewa,
            bool idAdmin,
            bool kondisiBarangKembaliRefs,
          })
        > {
  $$PengembalianTableTableManager(_$AppDatabase db, $PengembalianTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PengembalianTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PengembalianTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PengembalianTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idPengembalian = const Value.absent(),
                Value<int> idSewa = const Value.absent(),
                Value<DateTime> tanggalDikembalikan = const Value.absent(),
                Value<String> statusPengembalian = const Value.absent(),
                Value<double> denda = const Value.absent(),
                Value<String?> catatan = const Value.absent(),
                Value<int?> idAdmin = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PengembalianCompanion(
                idPengembalian: idPengembalian,
                idSewa: idSewa,
                tanggalDikembalikan: tanggalDikembalikan,
                statusPengembalian: statusPengembalian,
                denda: denda,
                catatan: catatan,
                idAdmin: idAdmin,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> idPengembalian = const Value.absent(),
                required int idSewa,
                required DateTime tanggalDikembalikan,
                Value<String> statusPengembalian = const Value.absent(),
                Value<double> denda = const Value.absent(),
                Value<String?> catatan = const Value.absent(),
                Value<int?> idAdmin = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PengembalianCompanion.insert(
                idPengembalian: idPengembalian,
                idSewa: idSewa,
                tanggalDikembalikan: tanggalDikembalikan,
                statusPengembalian: statusPengembalian,
                denda: denda,
                catatan: catatan,
                idAdmin: idAdmin,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PengembalianTable, PengembalianData>(table),
                  $$PengembalianTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                idSewa = false,
                idAdmin = false,
                kondisiBarangKembaliRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (kondisiBarangKembaliRefs) db.kondisiBarangKembali,
                  ],
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
                        if (idSewa) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.idSewa,
                            referencedTable: $$PengembalianTableReferences
                                ._idSewaTable(db),
                            referencedColumn: $$PengembalianTableReferences
                                ._idSewaTable(db)
                                .idSewa,
                          ) as T;
                        }
                        if (idAdmin) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.idAdmin,
                            referencedTable: $$PengembalianTableReferences
                                ._idAdminTable(db),
                            referencedColumn: $$PengembalianTableReferences
                                ._idAdminTable(db)
                                .idUser,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (kondisiBarangKembaliRefs)
                        await $_getPrefetchedData<
                          PengembalianData,
                          $PengembalianTable,
                          KondisiBarangKembaliData
                        >(
                          currentTable: table,
                          referencedTable: $$PengembalianTableReferences
                              ._kondisiBarangKembaliRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PengembalianTableReferences(
                                db,
                                table,
                                p0,
                              ).kondisiBarangKembaliRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idPengembalian == item.idPengembalian,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PengembalianTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PengembalianTable,
      PengembalianData,
      $$PengembalianTableFilterComposer,
      $$PengembalianTableOrderingComposer,
      $$PengembalianTableAnnotationComposer,
      $$PengembalianTableCreateCompanionBuilder,
      $$PengembalianTableUpdateCompanionBuilder,
      (PengembalianData, $$PengembalianTableReferences),
      PengembalianData,
      PrefetchHooks Function({
        bool idSewa,
        bool idAdmin,
        bool kondisiBarangKembaliRefs,
      })
    >;
typedef $$KondisiBarangKembaliTableCreateCompanionBuilder =
    KondisiBarangKembaliCompanion Function({
      Value<int> idKondisi,
      required int idPengembalian,
      required int idBarang,
      required String kondisi,
      Value<String?> deskripsi,
      Value<String?> fotoBukti,
      Value<double> biayaPerbaikan,
    });
typedef $$KondisiBarangKembaliTableUpdateCompanionBuilder =
    KondisiBarangKembaliCompanion Function({
      Value<int> idKondisi,
      Value<int> idPengembalian,
      Value<int> idBarang,
      Value<String> kondisi,
      Value<String?> deskripsi,
      Value<String?> fotoBukti,
      Value<double> biayaPerbaikan,
    });

final class $$KondisiBarangKembaliTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $KondisiBarangKembaliTable,
          KondisiBarangKembaliData
        > {
  $$KondisiBarangKembaliTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PengembalianTable _idPengembalianTable(
    _$AppDatabase db,
  ) => db.pengembalian.createAlias(
    'kondisi_barang_kembali__id_pengembalian__pengembalian__id_pengembalian',
  );

  $$PengembalianTableProcessedTableManager get idPengembalian {
    final $_column = $_itemColumn<int>('id_pengembalian')!;

    final manager = $$PengembalianTableTableManager(
      $_db,
      $_db.pengembalian,
    ).filter((f) => f.idPengembalian.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idPengembalianTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BarangTable _idBarangTable(_$AppDatabase db) => db.barang.createAlias(
    'kondisi_barang_kembali__id_barang__barang__id_barang',
  );

  $$BarangTableProcessedTableManager get idBarang {
    final $_column = $_itemColumn<int>('id_barang')!;

    final manager = $$BarangTableTableManager(
      $_db,
      $_db.barang,
    ).filter((f) => f.idBarang.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idBarangTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$KondisiBarangKembaliTableFilterComposer
    extends Composer<_$AppDatabase, $KondisiBarangKembaliTable> {
  $$KondisiBarangKembaliTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idKondisi => $composableBuilder(
    column: $table.idKondisi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kondisi => $composableBuilder(
    column: $table.kondisi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fotoBukti => $composableBuilder(
    column: $table.fotoBukti,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get biayaPerbaikan => $composableBuilder(
    column: $table.biayaPerbaikan,
    builder: (column) => ColumnFilters(column),
  );

  $$PengembalianTableFilterComposer get idPengembalian {
    final $$PengembalianTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPengembalian,
      referencedTable: $db.pengembalian,
      getReferencedColumn: (t) => t.idPengembalian,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PengembalianTableFilterComposer(
            $db: $db,
            $table: $db.pengembalian,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BarangTableFilterComposer get idBarang {
    final $$BarangTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.barang,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BarangTableFilterComposer(
            $db: $db,
            $table: $db.barang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$KondisiBarangKembaliTableOrderingComposer
    extends Composer<_$AppDatabase, $KondisiBarangKembaliTable> {
  $$KondisiBarangKembaliTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idKondisi => $composableBuilder(
    column: $table.idKondisi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kondisi => $composableBuilder(
    column: $table.kondisi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fotoBukti => $composableBuilder(
    column: $table.fotoBukti,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get biayaPerbaikan => $composableBuilder(
    column: $table.biayaPerbaikan,
    builder: (column) => ColumnOrderings(column),
  );

  $$PengembalianTableOrderingComposer get idPengembalian {
    final $$PengembalianTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPengembalian,
      referencedTable: $db.pengembalian,
      getReferencedColumn: (t) => t.idPengembalian,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PengembalianTableOrderingComposer(
            $db: $db,
            $table: $db.pengembalian,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BarangTableOrderingComposer get idBarang {
    final $$BarangTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.barang,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BarangTableOrderingComposer(
            $db: $db,
            $table: $db.barang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$KondisiBarangKembaliTableAnnotationComposer
    extends Composer<_$AppDatabase, $KondisiBarangKembaliTable> {
  $$KondisiBarangKembaliTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idKondisi =>
      $composableBuilder(column: $table.idKondisi, builder: (column) => column);

  GeneratedColumn<String> get kondisi =>
      $composableBuilder(column: $table.kondisi, builder: (column) => column);

  GeneratedColumn<String> get deskripsi =>
      $composableBuilder(column: $table.deskripsi, builder: (column) => column);

  GeneratedColumn<String> get fotoBukti =>
      $composableBuilder(column: $table.fotoBukti, builder: (column) => column);

  GeneratedColumn<double> get biayaPerbaikan => $composableBuilder(
    column: $table.biayaPerbaikan,
    builder: (column) => column,
  );

  $$PengembalianTableAnnotationComposer get idPengembalian {
    final $$PengembalianTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPengembalian,
      referencedTable: $db.pengembalian,
      getReferencedColumn: (t) => t.idPengembalian,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PengembalianTableAnnotationComposer(
            $db: $db,
            $table: $db.pengembalian,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BarangTableAnnotationComposer get idBarang {
    final $$BarangTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBarang,
      referencedTable: $db.barang,
      getReferencedColumn: (t) => t.idBarang,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BarangTableAnnotationComposer(
            $db: $db,
            $table: $db.barang,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$KondisiBarangKembaliTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KondisiBarangKembaliTable,
          KondisiBarangKembaliData,
          $$KondisiBarangKembaliTableFilterComposer,
          $$KondisiBarangKembaliTableOrderingComposer,
          $$KondisiBarangKembaliTableAnnotationComposer,
          $$KondisiBarangKembaliTableCreateCompanionBuilder,
          $$KondisiBarangKembaliTableUpdateCompanionBuilder,
          (KondisiBarangKembaliData, $$KondisiBarangKembaliTableReferences),
          KondisiBarangKembaliData,
          PrefetchHooks Function({bool idPengembalian, bool idBarang})
        > {
  $$KondisiBarangKembaliTableTableManager(
    _$AppDatabase db,
    $KondisiBarangKembaliTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KondisiBarangKembaliTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KondisiBarangKembaliTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$KondisiBarangKembaliTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> idKondisi = const Value.absent(),
                Value<int> idPengembalian = const Value.absent(),
                Value<int> idBarang = const Value.absent(),
                Value<String> kondisi = const Value.absent(),
                Value<String?> deskripsi = const Value.absent(),
                Value<String?> fotoBukti = const Value.absent(),
                Value<double> biayaPerbaikan = const Value.absent(),
              }) => KondisiBarangKembaliCompanion(
                idKondisi: idKondisi,
                idPengembalian: idPengembalian,
                idBarang: idBarang,
                kondisi: kondisi,
                deskripsi: deskripsi,
                fotoBukti: fotoBukti,
                biayaPerbaikan: biayaPerbaikan,
              ),
          createCompanionCallback:
              ({
                Value<int> idKondisi = const Value.absent(),
                required int idPengembalian,
                required int idBarang,
                required String kondisi,
                Value<String?> deskripsi = const Value.absent(),
                Value<String?> fotoBukti = const Value.absent(),
                Value<double> biayaPerbaikan = const Value.absent(),
              }) => KondisiBarangKembaliCompanion.insert(
                idKondisi: idKondisi,
                idPengembalian: idPengembalian,
                idBarang: idBarang,
                kondisi: kondisi,
                deskripsi: deskripsi,
                fotoBukti: fotoBukti,
                biayaPerbaikan: biayaPerbaikan,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $KondisiBarangKembaliTable,
                    KondisiBarangKembaliData
                  >(table),
                  $$KondisiBarangKembaliTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idPengembalian = false, idBarang = false}) {
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
                    if (idPengembalian) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idPengembalian,
                        referencedTable: $$KondisiBarangKembaliTableReferences
                            ._idPengembalianTable(db),
                        referencedColumn: $$KondisiBarangKembaliTableReferences
                            ._idPengembalianTable(db)
                            .idPengembalian,
                      ) as T;
                    }
                    if (idBarang) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idBarang,
                        referencedTable: $$KondisiBarangKembaliTableReferences
                            ._idBarangTable(db),
                        referencedColumn: $$KondisiBarangKembaliTableReferences
                            ._idBarangTable(db)
                            .idBarang,
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

typedef $$KondisiBarangKembaliTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KondisiBarangKembaliTable,
      KondisiBarangKembaliData,
      $$KondisiBarangKembaliTableFilterComposer,
      $$KondisiBarangKembaliTableOrderingComposer,
      $$KondisiBarangKembaliTableAnnotationComposer,
      $$KondisiBarangKembaliTableCreateCompanionBuilder,
      $$KondisiBarangKembaliTableUpdateCompanionBuilder,
      (KondisiBarangKembaliData, $$KondisiBarangKembaliTableReferences),
      KondisiBarangKembaliData,
      PrefetchHooks Function({bool idPengembalian, bool idBarang})
    >;
typedef $$PembayaranTableCreateCompanionBuilder = PembayaranCompanion Function({
  Value<int> idPembayaran,
  required int idSewa,
  required String jenisPembayaran,
  required String metodePembayaran,
  required double jumlahBayar,
  Value<DateTime> tanggalBayar,
  Value<String> statusPembayaran,
  Value<String?> buktiBayar,
  Value<String?> keterangan,
  Value<int?> idAdmin,
});
typedef $$PembayaranTableUpdateCompanionBuilder = PembayaranCompanion Function({
  Value<int> idPembayaran,
  Value<int> idSewa,
  Value<String> jenisPembayaran,
  Value<String> metodePembayaran,
  Value<double> jumlahBayar,
  Value<DateTime> tanggalBayar,
  Value<String> statusPembayaran,
  Value<String?> buktiBayar,
  Value<String?> keterangan,
  Value<int?> idAdmin,
});

final class $$PembayaranTableReferences
    extends BaseReferences<_$AppDatabase, $PembayaranTable, PembayaranData> {
  $$PembayaranTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PenyewaanTable _idSewaTable(_$AppDatabase db) =>
      db.penyewaan.createAlias('pembayaran__id_sewa__penyewaan__id_sewa');

  $$PenyewaanTableProcessedTableManager get idSewa {
    final $_column = $_itemColumn<int>('id_sewa')!;

    final manager = $$PenyewaanTableTableManager(
      $_db,
      $_db.penyewaan,
    ).filter((f) => f.idSewa.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idSewaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _idAdminTable(_$AppDatabase db) =>
      db.users.createAlias('pembayaran__id_admin__users__id_user');

  $$UsersTableProcessedTableManager? get idAdmin {
    final $_column = $_itemColumn<int>('id_admin');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.idUser.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idAdminTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PembayaranTableFilterComposer
    extends Composer<_$AppDatabase, $PembayaranTable> {
  $$PembayaranTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idPembayaran => $composableBuilder(
    column: $table.idPembayaran,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jenisPembayaran => $composableBuilder(
    column: $table.jenisPembayaran,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metodePembayaran => $composableBuilder(
    column: $table.metodePembayaran,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get jumlahBayar => $composableBuilder(
    column: $table.jumlahBayar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get tanggalBayar => $composableBuilder(
    column: $table.tanggalBayar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusPembayaran => $composableBuilder(
    column: $table.statusPembayaran,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get buktiBayar => $composableBuilder(
    column: $table.buktiBayar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keterangan => $composableBuilder(
    column: $table.keterangan,
    builder: (column) => ColumnFilters(column),
  );

  $$PenyewaanTableFilterComposer get idSewa {
    final $$PenyewaanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableFilterComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get idAdmin {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idAdmin,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PembayaranTableOrderingComposer
    extends Composer<_$AppDatabase, $PembayaranTable> {
  $$PembayaranTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idPembayaran => $composableBuilder(
    column: $table.idPembayaran,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jenisPembayaran => $composableBuilder(
    column: $table.jenisPembayaran,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metodePembayaran => $composableBuilder(
    column: $table.metodePembayaran,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get jumlahBayar => $composableBuilder(
    column: $table.jumlahBayar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tanggalBayar => $composableBuilder(
    column: $table.tanggalBayar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusPembayaran => $composableBuilder(
    column: $table.statusPembayaran,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get buktiBayar => $composableBuilder(
    column: $table.buktiBayar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keterangan => $composableBuilder(
    column: $table.keterangan,
    builder: (column) => ColumnOrderings(column),
  );

  $$PenyewaanTableOrderingComposer get idSewa {
    final $$PenyewaanTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableOrderingComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get idAdmin {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idAdmin,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PembayaranTableAnnotationComposer
    extends Composer<_$AppDatabase, $PembayaranTable> {
  $$PembayaranTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idPembayaran => $composableBuilder(
    column: $table.idPembayaran,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jenisPembayaran => $composableBuilder(
    column: $table.jenisPembayaran,
    builder: (column) => column,
  );

  GeneratedColumn<String> get metodePembayaran => $composableBuilder(
    column: $table.metodePembayaran,
    builder: (column) => column,
  );

  GeneratedColumn<double> get jumlahBayar => $composableBuilder(
    column: $table.jumlahBayar,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get tanggalBayar => $composableBuilder(
    column: $table.tanggalBayar,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statusPembayaran => $composableBuilder(
    column: $table.statusPembayaran,
    builder: (column) => column,
  );

  GeneratedColumn<String> get buktiBayar => $composableBuilder(
    column: $table.buktiBayar,
    builder: (column) => column,
  );

  GeneratedColumn<String> get keterangan => $composableBuilder(
    column: $table.keterangan,
    builder: (column) => column,
  );

  $$PenyewaanTableAnnotationComposer get idSewa {
    final $$PenyewaanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableAnnotationComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get idAdmin {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idAdmin,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PembayaranTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PembayaranTable,
          PembayaranData,
          $$PembayaranTableFilterComposer,
          $$PembayaranTableOrderingComposer,
          $$PembayaranTableAnnotationComposer,
          $$PembayaranTableCreateCompanionBuilder,
          $$PembayaranTableUpdateCompanionBuilder,
          (PembayaranData, $$PembayaranTableReferences),
          PembayaranData,
          PrefetchHooks Function({bool idSewa, bool idAdmin})
        > {
  $$PembayaranTableTableManager(_$AppDatabase db, $PembayaranTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PembayaranTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PembayaranTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PembayaranTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idPembayaran = const Value.absent(),
                Value<int> idSewa = const Value.absent(),
                Value<String> jenisPembayaran = const Value.absent(),
                Value<String> metodePembayaran = const Value.absent(),
                Value<double> jumlahBayar = const Value.absent(),
                Value<DateTime> tanggalBayar = const Value.absent(),
                Value<String> statusPembayaran = const Value.absent(),
                Value<String?> buktiBayar = const Value.absent(),
                Value<String?> keterangan = const Value.absent(),
                Value<int?> idAdmin = const Value.absent(),
              }) => PembayaranCompanion(
                idPembayaran: idPembayaran,
                idSewa: idSewa,
                jenisPembayaran: jenisPembayaran,
                metodePembayaran: metodePembayaran,
                jumlahBayar: jumlahBayar,
                tanggalBayar: tanggalBayar,
                statusPembayaran: statusPembayaran,
                buktiBayar: buktiBayar,
                keterangan: keterangan,
                idAdmin: idAdmin,
              ),
          createCompanionCallback:
              ({
                Value<int> idPembayaran = const Value.absent(),
                required int idSewa,
                required String jenisPembayaran,
                required String metodePembayaran,
                required double jumlahBayar,
                Value<DateTime> tanggalBayar = const Value.absent(),
                Value<String> statusPembayaran = const Value.absent(),
                Value<String?> buktiBayar = const Value.absent(),
                Value<String?> keterangan = const Value.absent(),
                Value<int?> idAdmin = const Value.absent(),
              }) => PembayaranCompanion.insert(
                idPembayaran: idPembayaran,
                idSewa: idSewa,
                jenisPembayaran: jenisPembayaran,
                metodePembayaran: metodePembayaran,
                jumlahBayar: jumlahBayar,
                tanggalBayar: tanggalBayar,
                statusPembayaran: statusPembayaran,
                buktiBayar: buktiBayar,
                keterangan: keterangan,
                idAdmin: idAdmin,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PembayaranTable, PembayaranData>(table),
                  $$PembayaranTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idSewa = false, idAdmin = false}) {
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
                    if (idSewa) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idSewa,
                        referencedTable: $$PembayaranTableReferences
                            ._idSewaTable(db),
                        referencedColumn: $$PembayaranTableReferences
                            ._idSewaTable(db)
                            .idSewa,
                      ) as T;
                    }
                    if (idAdmin) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idAdmin,
                        referencedTable: $$PembayaranTableReferences
                            ._idAdminTable(db),
                        referencedColumn: $$PembayaranTableReferences
                            ._idAdminTable(db)
                            .idUser,
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

typedef $$PembayaranTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PembayaranTable,
      PembayaranData,
      $$PembayaranTableFilterComposer,
      $$PembayaranTableOrderingComposer,
      $$PembayaranTableAnnotationComposer,
      $$PembayaranTableCreateCompanionBuilder,
      $$PembayaranTableUpdateCompanionBuilder,
      (PembayaranData, $$PembayaranTableReferences),
      PembayaranData,
      PrefetchHooks Function({bool idSewa, bool idAdmin})
    >;
typedef $$DokumenPendukungTableCreateCompanionBuilder =
    DokumenPendukungCompanion Function({
      Value<int> idDokumen,
      required int idSewa,
      required String jenisDokumen,
      required String namaFile,
      required String pathFile,
      Value<DateTime> tanggalUpload,
      Value<String> statusVerifikasi,
    });
typedef $$DokumenPendukungTableUpdateCompanionBuilder =
    DokumenPendukungCompanion Function({
      Value<int> idDokumen,
      Value<int> idSewa,
      Value<String> jenisDokumen,
      Value<String> namaFile,
      Value<String> pathFile,
      Value<DateTime> tanggalUpload,
      Value<String> statusVerifikasi,
    });

final class $$DokumenPendukungTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DokumenPendukungTable,
          DokumenPendukungData
        > {
  $$DokumenPendukungTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PenyewaanTable _idSewaTable(_$AppDatabase db) => db.penyewaan
      .createAlias('dokumen_pendukung__id_sewa__penyewaan__id_sewa');

  $$PenyewaanTableProcessedTableManager get idSewa {
    final $_column = $_itemColumn<int>('id_sewa')!;

    final manager = $$PenyewaanTableTableManager(
      $_db,
      $_db.penyewaan,
    ).filter((f) => f.idSewa.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idSewaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DokumenPendukungTableFilterComposer
    extends Composer<_$AppDatabase, $DokumenPendukungTable> {
  $$DokumenPendukungTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idDokumen => $composableBuilder(
    column: $table.idDokumen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jenisDokumen => $composableBuilder(
    column: $table.jenisDokumen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaFile => $composableBuilder(
    column: $table.namaFile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pathFile => $composableBuilder(
    column: $table.pathFile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get tanggalUpload => $composableBuilder(
    column: $table.tanggalUpload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusVerifikasi => $composableBuilder(
    column: $table.statusVerifikasi,
    builder: (column) => ColumnFilters(column),
  );

  $$PenyewaanTableFilterComposer get idSewa {
    final $$PenyewaanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableFilterComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DokumenPendukungTableOrderingComposer
    extends Composer<_$AppDatabase, $DokumenPendukungTable> {
  $$DokumenPendukungTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idDokumen => $composableBuilder(
    column: $table.idDokumen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jenisDokumen => $composableBuilder(
    column: $table.jenisDokumen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaFile => $composableBuilder(
    column: $table.namaFile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pathFile => $composableBuilder(
    column: $table.pathFile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tanggalUpload => $composableBuilder(
    column: $table.tanggalUpload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusVerifikasi => $composableBuilder(
    column: $table.statusVerifikasi,
    builder: (column) => ColumnOrderings(column),
  );

  $$PenyewaanTableOrderingComposer get idSewa {
    final $$PenyewaanTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableOrderingComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DokumenPendukungTableAnnotationComposer
    extends Composer<_$AppDatabase, $DokumenPendukungTable> {
  $$DokumenPendukungTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idDokumen =>
      $composableBuilder(column: $table.idDokumen, builder: (column) => column);

  GeneratedColumn<String> get jenisDokumen => $composableBuilder(
    column: $table.jenisDokumen,
    builder: (column) => column,
  );

  GeneratedColumn<String> get namaFile =>
      $composableBuilder(column: $table.namaFile, builder: (column) => column);

  GeneratedColumn<String> get pathFile =>
      $composableBuilder(column: $table.pathFile, builder: (column) => column);

  GeneratedColumn<DateTime> get tanggalUpload => $composableBuilder(
    column: $table.tanggalUpload,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statusVerifikasi => $composableBuilder(
    column: $table.statusVerifikasi,
    builder: (column) => column,
  );

  $$PenyewaanTableAnnotationComposer get idSewa {
    final $$PenyewaanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableAnnotationComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DokumenPendukungTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DokumenPendukungTable,
          DokumenPendukungData,
          $$DokumenPendukungTableFilterComposer,
          $$DokumenPendukungTableOrderingComposer,
          $$DokumenPendukungTableAnnotationComposer,
          $$DokumenPendukungTableCreateCompanionBuilder,
          $$DokumenPendukungTableUpdateCompanionBuilder,
          (DokumenPendukungData, $$DokumenPendukungTableReferences),
          DokumenPendukungData,
          PrefetchHooks Function({bool idSewa})
        > {
  $$DokumenPendukungTableTableManager(
    _$AppDatabase db,
    $DokumenPendukungTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DokumenPendukungTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DokumenPendukungTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DokumenPendukungTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idDokumen = const Value.absent(),
                Value<int> idSewa = const Value.absent(),
                Value<String> jenisDokumen = const Value.absent(),
                Value<String> namaFile = const Value.absent(),
                Value<String> pathFile = const Value.absent(),
                Value<DateTime> tanggalUpload = const Value.absent(),
                Value<String> statusVerifikasi = const Value.absent(),
              }) => DokumenPendukungCompanion(
                idDokumen: idDokumen,
                idSewa: idSewa,
                jenisDokumen: jenisDokumen,
                namaFile: namaFile,
                pathFile: pathFile,
                tanggalUpload: tanggalUpload,
                statusVerifikasi: statusVerifikasi,
              ),
          createCompanionCallback:
              ({
                Value<int> idDokumen = const Value.absent(),
                required int idSewa,
                required String jenisDokumen,
                required String namaFile,
                required String pathFile,
                Value<DateTime> tanggalUpload = const Value.absent(),
                Value<String> statusVerifikasi = const Value.absent(),
              }) => DokumenPendukungCompanion.insert(
                idDokumen: idDokumen,
                idSewa: idSewa,
                jenisDokumen: jenisDokumen,
                namaFile: namaFile,
                pathFile: pathFile,
                tanggalUpload: tanggalUpload,
                statusVerifikasi: statusVerifikasi,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DokumenPendukungTable, DokumenPendukungData>(
                    table,
                  ),
                  $$DokumenPendukungTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idSewa = false}) {
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
                    if (idSewa) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idSewa,
                        referencedTable: $$DokumenPendukungTableReferences
                            ._idSewaTable(db),
                        referencedColumn: $$DokumenPendukungTableReferences
                            ._idSewaTable(db)
                            .idSewa,
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

typedef $$DokumenPendukungTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DokumenPendukungTable,
      DokumenPendukungData,
      $$DokumenPendukungTableFilterComposer,
      $$DokumenPendukungTableOrderingComposer,
      $$DokumenPendukungTableAnnotationComposer,
      $$DokumenPendukungTableCreateCompanionBuilder,
      $$DokumenPendukungTableUpdateCompanionBuilder,
      (DokumenPendukungData, $$DokumenPendukungTableReferences),
      DokumenPendukungData,
      PrefetchHooks Function({bool idSewa})
    >;
typedef $$NotifikasiTableCreateCompanionBuilder = NotifikasiCompanion Function({
  Value<int> idNotifikasi,
  required int idUser,
  required String judul,
  required String pesan,
  Value<String> jenis,
  Value<String> statusBaca,
  Value<String?> link,
  Value<DateTime> createdAt,
});
typedef $$NotifikasiTableUpdateCompanionBuilder = NotifikasiCompanion Function({
  Value<int> idNotifikasi,
  Value<int> idUser,
  Value<String> judul,
  Value<String> pesan,
  Value<String> jenis,
  Value<String> statusBaca,
  Value<String?> link,
  Value<DateTime> createdAt,
});

final class $$NotifikasiTableReferences
    extends BaseReferences<_$AppDatabase, $NotifikasiTable, NotifikasiData> {
  $$NotifikasiTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _idUserTable(_$AppDatabase db) =>
      db.users.createAlias('notifikasi__id_user__users__id_user');

  $$UsersTableProcessedTableManager get idUser {
    final $_column = $_itemColumn<int>('id_user')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.idUser.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idUserTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NotifikasiTableFilterComposer
    extends Composer<_$AppDatabase, $NotifikasiTable> {
  $$NotifikasiTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idNotifikasi => $composableBuilder(
    column: $table.idNotifikasi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get judul => $composableBuilder(
    column: $table.judul,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pesan => $composableBuilder(
    column: $table.pesan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jenis => $composableBuilder(
    column: $table.jenis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusBaca => $composableBuilder(
    column: $table.statusBaca,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get link => $composableBuilder(
    column: $table.link,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get idUser {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotifikasiTableOrderingComposer
    extends Composer<_$AppDatabase, $NotifikasiTable> {
  $$NotifikasiTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idNotifikasi => $composableBuilder(
    column: $table.idNotifikasi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get judul => $composableBuilder(
    column: $table.judul,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pesan => $composableBuilder(
    column: $table.pesan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jenis => $composableBuilder(
    column: $table.jenis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusBaca => $composableBuilder(
    column: $table.statusBaca,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get link => $composableBuilder(
    column: $table.link,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get idUser {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotifikasiTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotifikasiTable> {
  $$NotifikasiTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idNotifikasi => $composableBuilder(
    column: $table.idNotifikasi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get judul =>
      $composableBuilder(column: $table.judul, builder: (column) => column);

  GeneratedColumn<String> get pesan =>
      $composableBuilder(column: $table.pesan, builder: (column) => column);

  GeneratedColumn<String> get jenis =>
      $composableBuilder(column: $table.jenis, builder: (column) => column);

  GeneratedColumn<String> get statusBaca => $composableBuilder(
    column: $table.statusBaca,
    builder: (column) => column,
  );

  GeneratedColumn<String> get link =>
      $composableBuilder(column: $table.link, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get idUser {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotifikasiTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotifikasiTable,
          NotifikasiData,
          $$NotifikasiTableFilterComposer,
          $$NotifikasiTableOrderingComposer,
          $$NotifikasiTableAnnotationComposer,
          $$NotifikasiTableCreateCompanionBuilder,
          $$NotifikasiTableUpdateCompanionBuilder,
          (NotifikasiData, $$NotifikasiTableReferences),
          NotifikasiData,
          PrefetchHooks Function({bool idUser})
        > {
  $$NotifikasiTableTableManager(_$AppDatabase db, $NotifikasiTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotifikasiTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotifikasiTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotifikasiTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idNotifikasi = const Value.absent(),
                Value<int> idUser = const Value.absent(),
                Value<String> judul = const Value.absent(),
                Value<String> pesan = const Value.absent(),
                Value<String> jenis = const Value.absent(),
                Value<String> statusBaca = const Value.absent(),
                Value<String?> link = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => NotifikasiCompanion(
                idNotifikasi: idNotifikasi,
                idUser: idUser,
                judul: judul,
                pesan: pesan,
                jenis: jenis,
                statusBaca: statusBaca,
                link: link,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> idNotifikasi = const Value.absent(),
                required int idUser,
                required String judul,
                required String pesan,
                Value<String> jenis = const Value.absent(),
                Value<String> statusBaca = const Value.absent(),
                Value<String?> link = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => NotifikasiCompanion.insert(
                idNotifikasi: idNotifikasi,
                idUser: idUser,
                judul: judul,
                pesan: pesan,
                jenis: jenis,
                statusBaca: statusBaca,
                link: link,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$NotifikasiTable, NotifikasiData>(table),
                  $$NotifikasiTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idUser = false}) {
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
                    if (idUser) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idUser,
                        referencedTable: $$NotifikasiTableReferences
                            ._idUserTable(db),
                        referencedColumn: $$NotifikasiTableReferences
                            ._idUserTable(db)
                            .idUser,
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

typedef $$NotifikasiTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotifikasiTable,
      NotifikasiData,
      $$NotifikasiTableFilterComposer,
      $$NotifikasiTableOrderingComposer,
      $$NotifikasiTableAnnotationComposer,
      $$NotifikasiTableCreateCompanionBuilder,
      $$NotifikasiTableUpdateCompanionBuilder,
      (NotifikasiData, $$NotifikasiTableReferences),
      NotifikasiData,
      PrefetchHooks Function({bool idUser})
    >;
typedef $$RiwayatStatusTableCreateCompanionBuilder =
    RiwayatStatusCompanion Function({
      Value<int> idRiwayat,
      required int idSewa,
      Value<String?> statusLama,
      required String statusBaru,
      Value<String?> keterangan,
      Value<int?> idUser,
      Value<DateTime> createdAt,
    });
typedef $$RiwayatStatusTableUpdateCompanionBuilder =
    RiwayatStatusCompanion Function({
      Value<int> idRiwayat,
      Value<int> idSewa,
      Value<String?> statusLama,
      Value<String> statusBaru,
      Value<String?> keterangan,
      Value<int?> idUser,
      Value<DateTime> createdAt,
    });

final class $$RiwayatStatusTableReferences
    extends
        BaseReferences<_$AppDatabase, $RiwayatStatusTable, RiwayatStatusData> {
  $$RiwayatStatusTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PenyewaanTable _idSewaTable(_$AppDatabase db) =>
      db.penyewaan.createAlias('riwayat_status__id_sewa__penyewaan__id_sewa');

  $$PenyewaanTableProcessedTableManager get idSewa {
    final $_column = $_itemColumn<int>('id_sewa')!;

    final manager = $$PenyewaanTableTableManager(
      $_db,
      $_db.penyewaan,
    ).filter((f) => f.idSewa.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idSewaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _idUserTable(_$AppDatabase db) =>
      db.users.createAlias('riwayat_status__id_user__users__id_user');

  $$UsersTableProcessedTableManager? get idUser {
    final $_column = $_itemColumn<int>('id_user');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.idUser.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idUserTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RiwayatStatusTableFilterComposer
    extends Composer<_$AppDatabase, $RiwayatStatusTable> {
  $$RiwayatStatusTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idRiwayat => $composableBuilder(
    column: $table.idRiwayat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusLama => $composableBuilder(
    column: $table.statusLama,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusBaru => $composableBuilder(
    column: $table.statusBaru,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keterangan => $composableBuilder(
    column: $table.keterangan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PenyewaanTableFilterComposer get idSewa {
    final $$PenyewaanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableFilterComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get idUser {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RiwayatStatusTableOrderingComposer
    extends Composer<_$AppDatabase, $RiwayatStatusTable> {
  $$RiwayatStatusTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idRiwayat => $composableBuilder(
    column: $table.idRiwayat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusLama => $composableBuilder(
    column: $table.statusLama,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusBaru => $composableBuilder(
    column: $table.statusBaru,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keterangan => $composableBuilder(
    column: $table.keterangan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PenyewaanTableOrderingComposer get idSewa {
    final $$PenyewaanTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableOrderingComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get idUser {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RiwayatStatusTableAnnotationComposer
    extends Composer<_$AppDatabase, $RiwayatStatusTable> {
  $$RiwayatStatusTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idRiwayat =>
      $composableBuilder(column: $table.idRiwayat, builder: (column) => column);

  GeneratedColumn<String> get statusLama => $composableBuilder(
    column: $table.statusLama,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statusBaru => $composableBuilder(
    column: $table.statusBaru,
    builder: (column) => column,
  );

  GeneratedColumn<String> get keterangan => $composableBuilder(
    column: $table.keterangan,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PenyewaanTableAnnotationComposer get idSewa {
    final $$PenyewaanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSewa,
      referencedTable: $db.penyewaan,
      getReferencedColumn: (t) => t.idSewa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PenyewaanTableAnnotationComposer(
            $db: $db,
            $table: $db.penyewaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get idUser {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RiwayatStatusTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RiwayatStatusTable,
          RiwayatStatusData,
          $$RiwayatStatusTableFilterComposer,
          $$RiwayatStatusTableOrderingComposer,
          $$RiwayatStatusTableAnnotationComposer,
          $$RiwayatStatusTableCreateCompanionBuilder,
          $$RiwayatStatusTableUpdateCompanionBuilder,
          (RiwayatStatusData, $$RiwayatStatusTableReferences),
          RiwayatStatusData,
          PrefetchHooks Function({bool idSewa, bool idUser})
        > {
  $$RiwayatStatusTableTableManager(_$AppDatabase db, $RiwayatStatusTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RiwayatStatusTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RiwayatStatusTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RiwayatStatusTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idRiwayat = const Value.absent(),
                Value<int> idSewa = const Value.absent(),
                Value<String?> statusLama = const Value.absent(),
                Value<String> statusBaru = const Value.absent(),
                Value<String?> keterangan = const Value.absent(),
                Value<int?> idUser = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RiwayatStatusCompanion(
                idRiwayat: idRiwayat,
                idSewa: idSewa,
                statusLama: statusLama,
                statusBaru: statusBaru,
                keterangan: keterangan,
                idUser: idUser,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> idRiwayat = const Value.absent(),
                required int idSewa,
                Value<String?> statusLama = const Value.absent(),
                required String statusBaru,
                Value<String?> keterangan = const Value.absent(),
                Value<int?> idUser = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RiwayatStatusCompanion.insert(
                idRiwayat: idRiwayat,
                idSewa: idSewa,
                statusLama: statusLama,
                statusBaru: statusBaru,
                keterangan: keterangan,
                idUser: idUser,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RiwayatStatusTable, RiwayatStatusData>(table),
                  $$RiwayatStatusTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idSewa = false, idUser = false}) {
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
                    if (idSewa) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idSewa,
                        referencedTable: $$RiwayatStatusTableReferences
                            ._idSewaTable(db),
                        referencedColumn: $$RiwayatStatusTableReferences
                            ._idSewaTable(db)
                            .idSewa,
                      ) as T;
                    }
                    if (idUser) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idUser,
                        referencedTable: $$RiwayatStatusTableReferences
                            ._idUserTable(db),
                        referencedColumn: $$RiwayatStatusTableReferences
                            ._idUserTable(db)
                            .idUser,
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

typedef $$RiwayatStatusTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RiwayatStatusTable,
      RiwayatStatusData,
      $$RiwayatStatusTableFilterComposer,
      $$RiwayatStatusTableOrderingComposer,
      $$RiwayatStatusTableAnnotationComposer,
      $$RiwayatStatusTableCreateCompanionBuilder,
      $$RiwayatStatusTableUpdateCompanionBuilder,
      (RiwayatStatusData, $$RiwayatStatusTableReferences),
      RiwayatStatusData,
      PrefetchHooks Function({bool idSewa, bool idUser})
    >;
typedef $$LogAktivitasTableCreateCompanionBuilder =
    LogAktivitasCompanion Function({
      Value<int> idLog,
      Value<int?> idUser,
      required String aktivitas,
      Value<String?> modul,
      Value<String?> deskripsi,
      Value<String?> ipAddress,
      Value<DateTime> createdAt,
    });
typedef $$LogAktivitasTableUpdateCompanionBuilder =
    LogAktivitasCompanion Function({
      Value<int> idLog,
      Value<int?> idUser,
      Value<String> aktivitas,
      Value<String?> modul,
      Value<String?> deskripsi,
      Value<String?> ipAddress,
      Value<DateTime> createdAt,
    });

final class $$LogAktivitasTableReferences
    extends
        BaseReferences<_$AppDatabase, $LogAktivitasTable, LogAktivitasData> {
  $$LogAktivitasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _idUserTable(_$AppDatabase db) =>
      db.users.createAlias('log_aktivitas__id_user__users__id_user');

  $$UsersTableProcessedTableManager? get idUser {
    final $_column = $_itemColumn<int>('id_user');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.idUser.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idUserTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LogAktivitasTableFilterComposer
    extends Composer<_$AppDatabase, $LogAktivitasTable> {
  $$LogAktivitasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idLog => $composableBuilder(
    column: $table.idLog,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aktivitas => $composableBuilder(
    column: $table.aktivitas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modul => $composableBuilder(
    column: $table.modul,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ipAddress => $composableBuilder(
    column: $table.ipAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get idUser {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LogAktivitasTableOrderingComposer
    extends Composer<_$AppDatabase, $LogAktivitasTable> {
  $$LogAktivitasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idLog => $composableBuilder(
    column: $table.idLog,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aktivitas => $composableBuilder(
    column: $table.aktivitas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modul => $composableBuilder(
    column: $table.modul,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ipAddress => $composableBuilder(
    column: $table.ipAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get idUser {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LogAktivitasTableAnnotationComposer
    extends Composer<_$AppDatabase, $LogAktivitasTable> {
  $$LogAktivitasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idLog =>
      $composableBuilder(column: $table.idLog, builder: (column) => column);

  GeneratedColumn<String> get aktivitas =>
      $composableBuilder(column: $table.aktivitas, builder: (column) => column);

  GeneratedColumn<String> get modul =>
      $composableBuilder(column: $table.modul, builder: (column) => column);

  GeneratedColumn<String> get deskripsi =>
      $composableBuilder(column: $table.deskripsi, builder: (column) => column);

  GeneratedColumn<String> get ipAddress =>
      $composableBuilder(column: $table.ipAddress, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get idUser {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUser,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.idUser,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LogAktivitasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LogAktivitasTable,
          LogAktivitasData,
          $$LogAktivitasTableFilterComposer,
          $$LogAktivitasTableOrderingComposer,
          $$LogAktivitasTableAnnotationComposer,
          $$LogAktivitasTableCreateCompanionBuilder,
          $$LogAktivitasTableUpdateCompanionBuilder,
          (LogAktivitasData, $$LogAktivitasTableReferences),
          LogAktivitasData,
          PrefetchHooks Function({bool idUser})
        > {
  $$LogAktivitasTableTableManager(_$AppDatabase db, $LogAktivitasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LogAktivitasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LogAktivitasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LogAktivitasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idLog = const Value.absent(),
                Value<int?> idUser = const Value.absent(),
                Value<String> aktivitas = const Value.absent(),
                Value<String?> modul = const Value.absent(),
                Value<String?> deskripsi = const Value.absent(),
                Value<String?> ipAddress = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => LogAktivitasCompanion(
                idLog: idLog,
                idUser: idUser,
                aktivitas: aktivitas,
                modul: modul,
                deskripsi: deskripsi,
                ipAddress: ipAddress,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> idLog = const Value.absent(),
                Value<int?> idUser = const Value.absent(),
                required String aktivitas,
                Value<String?> modul = const Value.absent(),
                Value<String?> deskripsi = const Value.absent(),
                Value<String?> ipAddress = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => LogAktivitasCompanion.insert(
                idLog: idLog,
                idUser: idUser,
                aktivitas: aktivitas,
                modul: modul,
                deskripsi: deskripsi,
                ipAddress: ipAddress,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LogAktivitasTable, LogAktivitasData>(table),
                  $$LogAktivitasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idUser = false}) {
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
                    if (idUser) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idUser,
                        referencedTable: $$LogAktivitasTableReferences
                            ._idUserTable(db),
                        referencedColumn: $$LogAktivitasTableReferences
                            ._idUserTable(db)
                            .idUser,
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

typedef $$LogAktivitasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LogAktivitasTable,
      LogAktivitasData,
      $$LogAktivitasTableFilterComposer,
      $$LogAktivitasTableOrderingComposer,
      $$LogAktivitasTableAnnotationComposer,
      $$LogAktivitasTableCreateCompanionBuilder,
      $$LogAktivitasTableUpdateCompanionBuilder,
      (LogAktivitasData, $$LogAktivitasTableReferences),
      LogAktivitasData,
      PrefetchHooks Function({bool idUser})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$OrganisasiTableTableManager get organisasi =>
      $$OrganisasiTableTableManager(_db, _db.organisasi);
  $$LevelTableTableManager get level =>
      $$LevelTableTableManager(_db, _db.level);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$UserOrganisasiTableTableManager get userOrganisasi =>
      $$UserOrganisasiTableTableManager(_db, _db.userOrganisasi);
  $$KategoriBarangTableTableManager get kategoriBarang =>
      $$KategoriBarangTableTableManager(_db, _db.kategoriBarang);
  $$BarangTableTableManager get barang =>
      $$BarangTableTableManager(_db, _db.barang);
  $$HargaSewaTableTableManager get hargaSewa =>
      $$HargaSewaTableTableManager(_db, _db.hargaSewa);
  $$PeminjamTableTableManager get peminjam =>
      $$PeminjamTableTableManager(_db, _db.peminjam);
  $$PenyewaanTableTableManager get penyewaan =>
      $$PenyewaanTableTableManager(_db, _db.penyewaan);
  $$DetailPenyewaanTableTableManager get detailPenyewaan =>
      $$DetailPenyewaanTableTableManager(_db, _db.detailPenyewaan);
  $$PengembalianTableTableManager get pengembalian =>
      $$PengembalianTableTableManager(_db, _db.pengembalian);
  $$KondisiBarangKembaliTableTableManager get kondisiBarangKembali =>
      $$KondisiBarangKembaliTableTableManager(_db, _db.kondisiBarangKembali);
  $$PembayaranTableTableManager get pembayaran =>
      $$PembayaranTableTableManager(_db, _db.pembayaran);
  $$DokumenPendukungTableTableManager get dokumenPendukung =>
      $$DokumenPendukungTableTableManager(_db, _db.dokumenPendukung);
  $$NotifikasiTableTableManager get notifikasi =>
      $$NotifikasiTableTableManager(_db, _db.notifikasi);
  $$RiwayatStatusTableTableManager get riwayatStatus =>
      $$RiwayatStatusTableTableManager(_db, _db.riwayatStatus);
  $$LogAktivitasTableTableManager get logAktivitas =>
      $$LogAktivitasTableTableManager(_db, _db.logAktivitas);
}
