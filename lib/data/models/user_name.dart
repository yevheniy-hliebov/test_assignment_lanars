class UserName {
  final String title;
  final String first;
  final String last;

  UserName({
    required this.title,
    required this.first,
    required this.last,
  });

  factory UserName.fromJson(Map<String, dynamic> json) {
    return UserName(
      title: json['title'] ?? '',
      first: json['first'] ?? '',
      last: json['last'] ?? '',
    );
  }

  @override
  String toString() {
    return '$title $first $last';
  }
}
