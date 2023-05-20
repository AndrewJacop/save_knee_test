import 'package:flutter/cupertino.dart';

class ChatModel {
  late String name;
  late String messageText;
  late String imageURL;
  ChatModel(
      {required this.name, required this.messageText, required this.imageURL});
}
