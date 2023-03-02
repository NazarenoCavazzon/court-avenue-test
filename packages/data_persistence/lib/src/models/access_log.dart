import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

/// {@template access_log}
/// Contains all the information about an access log.
/// {@endtemplate}
class AccessLog extends Equatable {
  /// {@macro access_log}
  const AccessLog({
    required this.id,
    required this.username,
    required this.date,
  });

  /// Creates an [AccessLog] from a JSON object.
  factory AccessLog.fromJson(Map<String, dynamic> json) {
    return AccessLog(
      id: json['id'] as int,
      username: json['username'] as String,
      date: DateTime.parse(json['log_date'] as String),
    );
  }

  /// The id of the access log.
  final int id;

  /// The user that accessed the system.
  final String username;

  /// The date of the access.
  final DateTime date;

  /// The date of the access format.
  static final dateFormatter = DateFormat('dd/MM/yyyy HH:mm');

  /// The date of the access formatted.
  String get formattedDate => dateFormatter.format(date);

  /// The access log as a string.
  String get accessToString => '$id - $username - $formattedDate';

  @override
  List<Object?> get props => [
        id,
        username,
        date,
      ];
}
