import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String firstName,
    required String lastName,
    required String email,
  }) = _User;

  factory User.empty() {
    return const User(
      firstName: '',
      lastName: '',
      email: '',
    );
  }

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
