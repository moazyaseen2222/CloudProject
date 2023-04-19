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

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      json['id'],
      json['title'],
      json['body'],
      json['userId'],
      json['image'],
      json['category'],
    );
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


