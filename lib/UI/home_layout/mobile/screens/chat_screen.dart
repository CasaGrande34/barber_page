import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('ChatScreen'),
      ),
    );
  }
}
