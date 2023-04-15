import 'package:flutter/material.dart';

import '../widgets/commentForm.dart';
import '../widgets/readMore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLiked = false;
  List<String> _comments = [];
  List<String> _likes = [];

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _isLiked ? _likes.add('Dr. Jane Smith') : _likes.remove('Dr. Jane Smith');
    });
  }

  void _addComment(String comment) {
    setState(() {
      _comments.add(comment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Health'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/premium-vector/doctor-icon-avatar-white_136162-58.jpg?w=2000',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Dr. Jane Smith',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Cardiologist',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',),
                  const ReadMoreText(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://drzingale.com/wp-content/uploads/2021/03/doctor-vector-icon-2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _toggleLike();

                        },
                        icon: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border,
                          color: _isLiked ? Colors.red : null,
                        ),
                      ),
                      _likes.isNotEmpty ?
                      TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Likes'),
                                  content: SizedBox(
                                    height: 200,
                                    child: ListView.builder(
                                        itemCount: _likes.length,
                                        itemBuilder: (context, index) {
                                          return const ListTile(
                                            title: Text('mohannad'),
                                          );
                                        }),
                                  ),
                                );
                              });
                        },
                        child: Text(
                        '${_likes.isNotEmpty ? _likes.length : ''} ${_likes.isNotEmpty ? 'اعجاب' : ' '}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      )
                    : const SizedBox(width: 7),
                    //  const SizedBox(width: 7),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/post');
                        },
                        icon: const Icon(Icons.comment),
                      ),
                      Text(
                        //  '${_comments.length} ${_comments.length == 1 ? 'comment' : 'comments'}',
                        ' ${_comments.isNotEmpty ? 'تعليق' : ' '} ${_comments.isNotEmpty ? _comments.length : ''}',
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
                      _addComment(comment);
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
                          subtitle: Text(_comments[index]),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                   TextButton(onPressed: (){
                      Navigator.pushNamed(context, '/post');
                   }, child: Text('المزيد من التعليقات')),
                    ],

                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
