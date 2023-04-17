import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserChatScreen extends StatelessWidget {
  final String uid; // User ID
  final String name; // User Name

  UserChatScreen({required this.uid, required this.name});

  FirebaseFirestore firestore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('chats')
                    .doc(uid)
                    .collection('messages')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.all(10.0),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => buildItem(
                        context, snapshot.data!.docs[index]),
                  );
                },
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Text(document['from']),
      subtitle: Text(document['text']),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Flexible(
            child: TextField(
              decoration: InputDecoration.collapsed(
                  hintText: "Type your message..."),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
