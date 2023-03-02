import 'package:equatable/equatable.dart';

/// {@template user}
/// Contains the password and email of the user.
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.email,
    required this.password,
  });

  /// The email of the user;
  final String email;

  /// The encrypted password of the user.
  final String password;

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
