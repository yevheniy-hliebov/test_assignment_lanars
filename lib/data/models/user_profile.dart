import 'package:test_assignment_lanars/data/models/user_name.dart';

class UserProfile {
  final String avatar;
  final UserName name;
  final String email;

  UserProfile({
    required this.avatar,
    required this.name,
    required this.email,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    final userJson = json['results'].first;
    return UserProfile(
      avatar: userJson['picture']['large'] ?? '',
      name: UserName.fromJson(userJson['name']),
      email: userJson['email'] ?? '',
    );
  }
}
