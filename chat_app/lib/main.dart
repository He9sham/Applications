import 'package:chat_app/Pages/Chat_page.dart';
import 'package:chat_app/Pages/Login_page.dart';
import 'package:chat_app/Pages/register_page.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Chat_app());
}

// ignore: camel_case_types
class Chat_app extends StatelessWidget {
  const Chat_app({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        ChatPage.id: (context) => const ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue, brightness: Brightness.dark),
      home: const LoginPage(),
    );
  }
}
