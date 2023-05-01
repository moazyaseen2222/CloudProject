import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/likeModel.dart';
import '../Model/postModel.dart';
import '../Model/userModel.dart';
import '../controller/APController.dart';
import '../widgets/commentForm.dart';
import '../widgets/readMore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  FbGetPostController getPostControllerController =
      Get.put(FbGetPostController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FbGetPostController>(
        builder: (controller) => Obx(() => controller.posts.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  PostModel post = controller.posts[index];
                  controller.likeCount(controller.posts[index].id);
                  controller.getPostAuth(id: post.userId);

                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => controller.user.isEmpty
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : ListTile(
                                      leading: CircleAvatar(
                                        radius: 20,
                                        backgroundImage: NetworkImage(
                                            controller.user[index].image),
                                      ),
                                      title: Text(
                                        controller.user[index].name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        controller.user[index].interest,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      trailing: Container(
                                        margin:
                                            const EdgeInsets.only(right: 50),
                                        child: IconButton(
                                          onPressed: () {
                                            /// TO DO
                                          },
                                          icon: const Icon(Icons.more_horiz),
                                        ),
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                                child: Text(
                              post.title,
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            )),
                            const SizedBox(height: 10),
                            ReadMoreText(text: post.body),
                            const SizedBox(height: 10),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    post.image,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    LikeModel like = LikeModel(
                                      postId: post.id,
                                      userId: controller.user[index].id,
                                    );
                                    controller.addLikePost(like);
                                  },
                                  icon: Icon(
                                    controller.liked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: controller.liked ? Colors.red : null,
                                  ),
                                ),

                                Obx(
                                  () => controller.likeCounts != 0
                                      ? TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text('Likes'),
                                                    content: SizedBox(
                                                      height: 200,
                                                      child: ListView.builder(
                                                          itemCount: controller
                                                              .likeCount(
                                                                  post.id),
                                                          itemBuilder:
                                                              (context, index) {
                                                            return const ListTile(
                                                              title: Text(
                                                                  'mohannad'),
                                                            );
                                                          }),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Text(
                                            '${controller.likeCount(post.id) != 0 ? controller.likeCount(post.id) : ''} '
                                            '${controller.likeCount(post.id) != 0 ? 'اعجاب' : ' '}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        )
                                      : const SizedBox(width: 7),
                                ),

                                //  const SizedBox(width: 7),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/post');
                                  },
                                  icon: const Icon(Icons.comment),
                                ),
                                Text(
                                  ''
                                  // ' ${_comments.isNotEmpty
                                  //     ? 'تعليق'
                                  //     : ' '} ${_comments.isNotEmpty ? _comments
                                  //     .length : ''}'
                                  ,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 7),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            CommentForm(
                              onSubmit: (comment) {
                                //   _addComment(comment);
                              },
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ListView.builder(
                                itemCount: 2,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: const CircleAvatar(
                                      radius: 15,
                                      backgroundImage: NetworkImage(
                                        'https://img.freepik.com/premium-vector/doctor-icon-avatar-white_136162-58.jpg?w=2000',
                                      ),
                                    ),
                                    title: const Text('Dr. Jane Smith'),
                                    subtitle: Text(''
                                        // _comments[index]
                                        ),
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/post');
                                    },
                                    child: const Text('المزيد من التعليقات')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                })));
  }
}
