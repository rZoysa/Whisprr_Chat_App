import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/chat_service.dart';

class ChatViewModel extends ChangeNotifier {
  final ChatService _chatService = ChatService();

  //Method to search users by email
  Stream<List<AppUser>> searchUsers(String query) {
    if (query.isEmpty) {
      return const Stream.empty();
    }
    return _chatService.searchUsersByEmail(query);
  }
}
