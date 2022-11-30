
String baseUrl="http://139.59.47.49:4004/api/";


class Album {
  final int id;
  final String post;
  final  String background;
  final  int  status;
  final  String  created_at;
  final String updated_at;

  const Album({
    required this.id,
    required this.post,
    required this.background,
    required this.status,
    required this.created_at,
    required this.updated_at,
  });
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      post: json['post'],
      background: json['background'],
      status:   json['status'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
