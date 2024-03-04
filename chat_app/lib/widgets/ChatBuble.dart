// ignore: file_names
import 'package:chat_app/Models/Messages.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding:
            const EdgeInsets.only(left: 17, top: 16, bottom: 16, right: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          color: Color.fromARGB(255, 86, 41, 163),
        ),
        child: Text(message.message),
      ),
    );
  }
}

class ChatBubleforfrind extends StatelessWidget {
  const ChatBubleforfrind({required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding:
            const EdgeInsets.only(left: 17, top: 16, bottom: 16, right: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16)),
          color: Color(0xff273443),
        ),
        child: Text(message.message),
      ),
    );
  }
}
