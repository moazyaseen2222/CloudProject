import 'package:palliative_care/Model/postModel.dart';

class TopicModel{
 late String id;
 late String title;
 late PostModel post;

  TopicModel({
    required this.id,
    required this.title,
    required this.post,
  });

  TopicModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    post = (json['post'] != null ?  PostModel.fromJson(json['post']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (post != null) {
      data['post'] = post.toJson();
    }
    return data;
  }
}