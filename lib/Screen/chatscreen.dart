import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Chats',
          ),
          elevation: 0,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 26.0),
          centerTitle: true,
        ),
        body: const Center(child: Text('This is Chat screen')));
  }
}
