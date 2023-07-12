class Link {
  final int? id;
  String title;
  String link;
  final String username;
  final int isActive;
  final int? userId;
  final String? createdAt;
  final String? updatedAt;

  Link({
    this.id,
    required this.title,
    required this.link,
    required this.username,
    required this.isActive,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });
}
