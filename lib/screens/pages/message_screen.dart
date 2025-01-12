import 'package:demo/screens/chat/chat_screen.dart';
import 'package:demo/screens/core/components/user_tile.dart';
import 'package:demo/services/auth/auth_service.dart';
import 'package:demo/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  static const String routeName = 'MessageScreen';
  MessageScreen({super.key});

  final ChatService _chatService = ChatService();
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
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
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // build individual list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != authService.getCurrentUser()) {
      return UserTile(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  receiverEmail: userData['email'],
                  receiverID: userData['uid'],
                ),
              ));
        },
        text: userData['email'],
      );
    } else {
      return Container();
    }
  }
}
