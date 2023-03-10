import 'package:data_persistence/data_persistence.dart';
import 'package:sqflite/sqflite.dart';

/// {@template data_persistence}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class DataPersistence {
  /// {@macro data_persistence}
  DataPersistence();

  /// The database used by this app.
  Database? db;

  /// The name of the table used to store logs.
  static const logTable = 'access_logs';

  /// Initializes the database.
  Future<void> init(String environment) async {
    db = await openDatabase(
      '$environment.$logTable.db',
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE $logTable (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, log_date TEXT);''',
        );
      },
    );
  }

  /// Closes the database.
  Future<void> dispose() async {
    await db?.close();
  }

  /// Adds a new user to the database. If the user already exists, it updates
  /// the log_date to the current date.
  Future<AccessLog> createLog(String username) async {
    final shadowDB = db;
    final date = DateTime.now();

    if (shadowDB == null) throw const DatabaseUninitializedException();

    final id = await shadowDB.insert(logTable, {
      'username': username,
      'log_date': date.toIso8601String(),
    });

    return AccessLog(id, username, date);
  }

  /// Returns all the logs in the database.
  ///
  /// Returns `null` if the database is not initialized.
  Future<List<AccessLog>> getLogs() async {
    final shadowDB = db;

    if (shadowDB == null) throw const DatabaseUninitializedException();

    final logs = await shadowDB.query(logTable);
    return logs.map(AccessLog.fromJson).toList();
  }
}
