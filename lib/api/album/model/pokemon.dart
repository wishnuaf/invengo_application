class Pokemon {
  final int userId;
  final int id;
  final String title;

  const Pokemon({required this.userId, required this.id, required this.title});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'userId': int userId, 'id': int id, 'title': String title} => Pokemon(
        userId: userId,
        id: id,
        title: title,
      ),
      _ => throw const FormatException('Failed to load Pokemon album.'),
    };
  }
}