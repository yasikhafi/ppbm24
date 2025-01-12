import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/services/auth/auth_service.dart';
import 'package:demo/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  ChatScreen(
      {super.key, required this.receiverEmail, required this.receiverID});

  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    List<String> ids = [senderID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return StreamBuilder(
      stream: _chatService.getMessages(chatRoomID),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text('Error');
        }
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text(
            "Loading...",
          );
        }

        // return list of view
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data['message']);
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: const InputDecoration(
              hintText: 'Type a message',
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_upward),
          onPressed: sendMessage,
        ),
      ],
    );
  }
}
