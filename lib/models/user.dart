class User {
  final String id;
  final username;

  User({
    required this.username,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        username: json['username'],
      );

  Map<String, dynamic> toJson() =>
      <String, dynamic>{"id": id, "username": username};
}
