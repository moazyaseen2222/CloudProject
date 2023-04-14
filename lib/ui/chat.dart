import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الدردشة'),
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildMessage('مرحبا دكتور', true),
                  _buildMessage('اهلين', false),
                  _buildMessage('كيف حالك', true),
                  _buildMessage('الحمد لله , كيف صرت ؟', false),
                  _buildMessage('والله احسن ي دكتور سلم ايديك', true),
                  _buildMessage('الحمد لله ع السلامة', false),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(25.0),
              ),
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(String message, bool isMe) {
    final messageContainer = Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isMe ? Colors.blueGrey[50] : Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(message),
    );

    if (isMe) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          messageContainer,
          const SizedBox(width: 5.0),
          const CircleAvatar(
            child: Text('Me'),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            child: Text('Other'),
          ),
          const SizedBox(width: 5.0),
          messageContainer,
        ],
      );
    }
  }
}