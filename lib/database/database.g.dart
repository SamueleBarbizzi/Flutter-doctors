// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CaloriesDao? _caloriesDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CaloriesEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `dateTime` INTEGER NOT NULL, `sumCalories` REAL NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CaloriesDao get caloriesDao {
    return _caloriesDaoInstance ??= _$CaloriesDao(database, changeListener);
  }
}

class _$CaloriesDao extends CaloriesDao {
  _$CaloriesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _caloriesEntityInsertionAdapter = InsertionAdapter(
            database,
            'CaloriesEntity',
            (CaloriesEntity item) => <String, Object?>{
                  'id': item.id,
                  'dateTime': _dateTimeConverter.encode(item.dateTime),
                  'sumCalories': item.sumCalories
                }),
        _caloriesEntityUpdateAdapter = UpdateAdapter(
            database,
            'CaloriesEntity',
            ['id'],
            (CaloriesEntity item) => <String, Object?>{
                  'id': item.id,
                  'dateTime': _dateTimeConverter.encode(item.dateTime),
                  'sumCalories': item.sumCalories
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CaloriesEntity> _caloriesEntityInsertionAdapter;

  final UpdateAdapter<CaloriesEntity> _caloriesEntityUpdateAdapter;

  @override
  Future<List<CaloriesEntity>> findAllCalories() async {
    return _queryAdapter.queryList('SELECT * FROM CaloriesEntity',
        mapper: (Map<String, Object?> row) => CaloriesEntity(
            row['id'] as int?,
            _dateTimeConverter.decode(row['dateTime'] as int),
            row['sumCalories'] as double));
  }

  @override
  Future<void> deleteAllCalories() async {
    await _queryAdapter.queryNoReturn('DELETE FROM CaloriesEntity');
  }

  @override
  Future<void> insertCalories(CaloriesEntity caloriesEntity) async {
    await _caloriesEntityInsertionAdapter.insert(
        caloriesEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCalories(CaloriesEntity caloriesEntity) async {
    await _caloriesEntityUpdateAdapter.update(
        caloriesEntity, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
