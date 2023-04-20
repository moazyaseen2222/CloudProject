class PostModel {
  late String id;
  late String title;
  late String body;
  late String category;
  late String userId;
  late String image;

  PostModel(
    this.id,
    this.title,
    this.body,
    this.userId,
    this.image,
    this.category,
  );

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
    image = json['image'];
    category = json['category'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['userId'] = this.userId;
    data['image'] = this.image;
    data['category'] = this.category;
    return data;
    // return {
    //   'id': id,
    //   'title': title,
    //   'body': body,
    //   'userId': userId,
    //   'image': image,
    // };
  }
}
