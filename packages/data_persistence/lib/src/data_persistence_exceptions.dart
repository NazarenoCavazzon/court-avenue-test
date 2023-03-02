/// Exception thrown when a data persistence operation fails.
class DataPersistenceException implements Exception {
  /// Creates a new [DataPersistenceException] with the given [error].
  const DataPersistenceException(this.error);

  /// The error that caused the exception.
  final Object error;
}

/// Exception thrown when a data persistence operation fails because the
/// database is uninitialized.
class DatabaseUninitializedException extends DataPersistenceException {
  /// Creates a new [DatabaseUninitializedException] with the given [error].
  const DatabaseUninitializedException() : super('Database is uninitialized');
}
