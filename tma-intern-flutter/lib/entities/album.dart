
class Album {
  final int id, userId;
  final String title;

  const Album({required this.id, required this.userId, required this.title});

  //chuyển đổi dữ liệu json sang obj
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String
    );
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "title": title
  };

  @override
  String toString() {
    return 'Album{id: $id, userId: $userId, title: $title}';
  }
}