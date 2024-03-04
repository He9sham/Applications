// ignore: file_names
import 'package:chat_app/conest.dart';

class Message {
  final String message;
  final String id;

  Message(this.message, this.id);

  factory Message.fromJson(jsondata) {
    return Message(jsondata[kmessage] , jsondata['id']);
  }
}
