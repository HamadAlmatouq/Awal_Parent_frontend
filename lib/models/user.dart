class User {
  final String id;
  final String username;
  double balance;

  User({
    required this.id,
    required this.username,
    this.balance = 0.0,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        username: json['username'],
        balance: json['balance'] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'balance': balance,
      };
}

