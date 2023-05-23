class Data {
  final int id;
  final int title;
  final String body;

  final String img;

  Data({
    required this.id,
    required this.title,
    required this.body,
    required this.img,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['albumId'],
      title: json['id'],
      body: json['title']?.toString() ?? '',
      img: json['thumbnailUrl'],
    );
  }
}
