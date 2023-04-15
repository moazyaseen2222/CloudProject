class PostModel {
  late String id;
  late String title;
  late String body;
  late String userId;
  late String image;

  PostModel(
     this.id,
     this.title,
     this.body,
     this.userId,
     this.image,
  );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      json['id'],
      json['title'],
      json['body'],
      json['userId'],
      json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'userId': userId,
      'image': image,
    };
  }

}